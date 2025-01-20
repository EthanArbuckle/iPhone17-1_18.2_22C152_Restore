id CPSSafeCast(void *a1, void *a2)
{
  void *v2;
  id location[2];
  id v5;
  uint64_t vars8;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    v5 = location[0];
  }
  else {
    v5 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

void sub_22B690AA8()
{
  _Unwind_Resume(v0);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  location = (id *)(a2 + 40);
  v2 = *(void **)(a2 + 40);
  v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id CPSSafeCast_0(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

uint64_t __os_log_helper_16_2_2_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

unsigned char *__os_log_helper_16_0_0(unsigned char *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id CPSSafeCast_1(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

uint64_t _CPSUIPressesContainsPressTypes(void *a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id location = 0;
  objc_storeStrong(&location, a1);
  id v22 = 0;
  objc_storeStrong(&v22, a2);
  memset(__b, 0, sizeof(__b));
  id v15 = location;
  uint64_t v16 = [v15 countByEnumeratingWithState:__b objects:v26 count:16];
  if (v16)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v16;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(v15);
      }
      id v21 = *(id *)(__b[1] + 8 * v12);
      memset(v18, 0, sizeof(v18));
      id v8 = v22;
      uint64_t v9 = [v8 countByEnumeratingWithState:v18 objects:v25 count:16];
      if (v9)
      {
        uint64_t v5 = *(void *)v18[2];
        uint64_t v6 = 0;
        unint64_t v7 = v9;
        while (1)
        {
          uint64_t v4 = v6;
          if (*(void *)v18[2] != v5) {
            objc_enumerationMutation(v8);
          }
          id v19 = *(id *)(v18[1] + 8 * v6);
          uint64_t v3 = [v21 type];
          if (v3 == [v19 integerValue]) {
            break;
          }
          ++v6;
          if (v4 + 1 >= v7)
          {
            uint64_t v6 = 0;
            unint64_t v7 = [v8 countByEnumeratingWithState:v18 objects:v25 count:16];
            if (!v7) {
              goto LABEL_13;
            }
          }
        }
        char v24 = 1;
        int v17 = 1;
      }
      else
      {
LABEL_13:
        int v17 = 0;
      }

      if (v17) {
        break;
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [v15 countByEnumeratingWithState:__b objects:v26 count:16];
        if (!v13) {
          goto LABEL_17;
        }
      }
    }
  }
  else
  {
LABEL_17:
    int v17 = 0;
  }

  if (!v17) {
    char v24 = 0;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  return v24 & 1;
}

id CPSSafeProtocolCast(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  if ([v5 conformsToProtocol:location]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  v2 = v7;

  return v2;
}

id CPSSafeCast_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

uint64_t __os_log_helper_16_2_1_8_64(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_0_1_4_2(uint64_t result, int a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 2;
  *(unsigned char *)(result + 3) = 4;
  *(_DWORD *)(result + 4) = a2;
  return result;
}

id CPSSafeCast_3(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

id CPSNavigationTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSNavigationTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_1);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSNavigationTemplateClasses_classes;

  return v0;
}

id CPSAudioTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSAudioTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_286);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSAudioTemplateClasses_classes;

  return v0;
}

id CPSCommunicationTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSCommunicationTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_289);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSCommunicationTemplateClasses_classes;

  return v0;
}

id CPSChargingParkingTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSChargingParkingTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_291);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSChargingParkingTemplateClasses_classes;

  return v0;
}

id CPSQuickOrderingTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSQuickOrderingTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_294);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSQuickOrderingTemplateClasses_classes;

  return v0;
}

id CPSPublicSafetyTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSPublicSafetyTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_296);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSPublicSafetyTemplateClasses_classes;

  return v0;
}

uint64_t __os_log_helper_16_2_1_8_66(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

uint64_t __os_log_helper_16_2_2_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

void __CPSNavigationTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v12 = (id)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v1 = (id)objc_msgSend(v12, "setWithObjects:", v11, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v2 = (void *)CPSNavigationTemplateClasses_classes;
  CPSNavigationTemplateClasses_classes = (uint64_t)v1;
}

void __CPSAudioTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  id v9 = (id)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v1 = (id)objc_msgSend(v9, "setWithObjects:", v8, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v2 = (void *)CPSAudioTemplateClasses_classes;
  CPSAudioTemplateClasses_classes = (uint64_t)v1;
}

void __CPSCommunicationTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v13 = a1;
  uint64_t v12 = a1;
  id v11 = (id)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  id v1 = (id)objc_msgSend(v11, "setWithObjects:", v10, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v2 = (void *)CPSCommunicationTemplateClasses_classes;
  CPSCommunicationTemplateClasses_classes = (uint64_t)v1;
}

void __CPSChargingParkingTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  id v10 = (id)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v1 = (id)objc_msgSend(v10, "setWithObjects:", v9, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v2 = (void *)CPSChargingParkingTemplateClasses_classes;
  CPSChargingParkingTemplateClasses_classes = (uint64_t)v1;
}

void __CPSQuickOrderingTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v12 = a1;
  uint64_t v11 = a1;
  id v10 = (id)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v1 = (id)objc_msgSend(v10, "setWithObjects:", v9, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v2 = (void *)CPSQuickOrderingTemplateClasses_classes;
  CPSQuickOrderingTemplateClasses_classes = (uint64_t)v1;
}

void __CPSPublicSafetyTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v14 = a1;
  uint64_t v13 = a1;
  id v12 = (id)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v1 = (id)objc_msgSend(v12, "setWithObjects:", v11, v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v2 = (void *)CPSPublicSafetyTemplateClasses_classes;
  CPSPublicSafetyTemplateClasses_classes = (uint64_t)v1;
}

id CPSFuelingTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSFuelingTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_298);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSFuelingTemplateClasses_classes;

  return v0;
}

void __CPSFuelingTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  id v9 = (id)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v1 = (id)objc_msgSend(v9, "setWithObjects:", v8, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v2 = (void *)CPSFuelingTemplateClasses_classes;
  CPSFuelingTemplateClasses_classes = (uint64_t)v1;
}

id CPSDrivingTaskTemplateClasses()
{
  predicate = (dispatch_once_t *)&CPSDrivingTaskTemplateClasses_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_300);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CPSDrivingTaskTemplateClasses_classes;

  return v0;
}

void __CPSDrivingTaskTemplateClasses_block_invoke(uint64_t a1)
{
  uint64_t v11 = a1;
  uint64_t v10 = a1;
  id v9 = (id)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v1 = (id)objc_msgSend(v9, "setWithObjects:", v8, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v2 = (void *)CPSDrivingTaskTemplateClasses_classes;
  CPSDrivingTaskTemplateClasses_classes = (uint64_t)v1;
}

id CarPlaySupportGeneralLogging()
{
  predicate = (dispatch_once_t *)&CarPlaySupportGeneralLogging_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_2);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  v0 = (void *)CarPlaySupportGeneralLogging_facility;

  return v0;
}

void __CarPlaySupportGeneralLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)CarPlaySupportLogSubsystem, "General");
  id v1 = (void *)CarPlaySupportGeneralLogging_facility;
  CarPlaySupportGeneralLogging_facility = (uint64_t)v0;
}

uint64_t __os_log_helper_16_0_1_8_0(uint64_t result, uint64_t a2)
{
  *(unsigned char *)result = 0;
  *(unsigned char *)(result + 1) = 1;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  return result;
}

id CPSSafeCast_4(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  v2 = v5;

  return v2;
}

void sub_22B6B72B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, _Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v18 - 64), 8);
  _Unwind_Resume(a1);
}

id CPSSafeProtocolCast_0(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  if ([v5 conformsToProtocol:location]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  v2 = v7;

  return v2;
}

uint64_t CPGuidanceStateFromCPTripPauseReason(unint64_t a1)
{
  if (a1 <= 1)
  {
    unint64_t v2 = a1 - 1;
    char v1 = 0;
  }
  else
  {
    unint64_t v2 = a1 - 1;
    char v1 = 1;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0uLL:
        unsigned __int8 v4 = 2;
        break;
      case 1uLL:
        unsigned __int8 v4 = 3;
        break;
      case 2uLL:
        unsigned __int8 v4 = 4;
        break;
      case 3uLL:
        unsigned __int8 v4 = 5;
        break;
      case 4uLL:
        unsigned __int8 v4 = 6;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v4;
}

__CFString *NSStringFromNavigationOwner(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      unint64_t v2 = @"iOS";
    }
    else if (a1 == 2)
    {
      unint64_t v2 = @"Car";
    }
  }
  else
  {
    unint64_t v2 = @"None";
  }

  return v2;
}

uint64_t __os_log_helper_16_2_3_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t _CPPanDirectionForPressType(uint64_t a1)
{
  uint64_t v4 = 0;
  if (a1)
  {
    uint64_t v2 = a1;
    char v1 = 1;
  }
  else
  {
    uint64_t v2 = 0;
    char v1 = 0;
  }
  if ((v1 & 1) == 0)
  {
    switch(v2)
    {
      case 0:
        uint64_t v4 = 4;
        break;
      case 1:
        uint64_t v4 = 8;
        break;
      case 2:
        uint64_t v4 = 1;
        break;
      case 3:
        uint64_t v4 = 2;
        break;
      default:
        JUMPOUT(0);
    }
  }
  return v4;
}

id CPSSafeCast_5(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeCast_6(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeProtocolCast_1(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  if ([v5 conformsToProtocol:location]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  uint64_t v2 = v7;

  return v2;
}

id CPSSafeCast_7(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeCast_8(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeCast_9(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

BOOL UIEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9 = 0;
  if (a2 == a6)
  {
    BOOL v9 = 0;
    if (a1 == a5)
    {
      BOOL v9 = 0;
      if (a4 == a8) {
        return a3 == a7;
      }
    }
  }
  return v9;
}

id CPSSafeCast_10(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

void sub_22B6D9C50(uint64_t a1, int a2)
{
  *(void *)(v2 - 104) = a1;
  *(_DWORD *)(v2 - 108) = a2;
  _Block_object_dispose((const void *)(v2 - 88), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 104));
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id CPSSafeCast_11(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_22B6DD0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v22 - 88), 8);
  _Unwind_Resume(a1);
}

void sub_22B6DD560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,int a21,_Unwind_Exception *exception_object)
{
  _Block_object_dispose((const void *)(v22 - 88), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromNavigationOwner_0(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"iOS";
    }
    else if (a1 == 2)
    {
      uint64_t v2 = @"Car";
    }
  }
  else
  {
    uint64_t v2 = @"None";
  }

  return v2;
}

void sub_22B6F851C(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, id *location)
{
  *(void *)(v12 - 248) = a1;
  *(_DWORD *)(v12 - 252) = a2;
  objc_destroyWeak((id *)(v12 - 240));
  _Unwind_Resume(*(_Unwind_Exception **)(v12 - 248));
}

BOOL __CGSizeEqualToSize(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

id CPSSafeCast_12(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeCast_13(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

void sub_22B6FDAD8(uint64_t a1, int a2)
{
  *(void *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  _Block_object_dispose((const void *)(v2 - 72), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

id CarPlayFrameworkGeneralLogging()
{
  predicate = (dispatch_once_t *)&CarPlayFrameworkGeneralLogging_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_9);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)CarPlayFrameworkGeneralLogging_facility;

  return v0;
}

void __CarPlayFrameworkGeneralLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)CarPlayFrameworkLogSubsystem, "General");
  char v1 = (void *)CarPlayFrameworkGeneralLogging_facility;
  CarPlayFrameworkGeneralLogging_facility = (uint64_t)v0;
}

id CarPlayFrameworkACCNavLogging()
{
  predicate = (dispatch_once_t *)&CarPlayFrameworkACCNavLogging_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_3);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  os_log_t v0 = (void *)CarPlayFrameworkACCNavLogging_facility;

  return v0;
}

void __CarPlayFrameworkACCNavLogging_block_invoke()
{
  os_log_t v0 = os_log_create((const char *)CarPlayFrameworkLogSubsystem, "ACCNav");
  char v1 = (void *)CarPlayFrameworkACCNavLogging_facility;
  CarPlayFrameworkACCNavLogging_facility = (uint64_t)v0;
}

id CPSSafeCast_14(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

void sub_22B706E70(uint64_t a1, int a2)
{
  *(void *)(v2 - 48) = a1;
  *(_DWORD *)(v2 - 52) = a2;
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 48));
}

id CPSSafeCast_15(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeCast_16(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeProtocolCast_2(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  if ([v5 conformsToProtocol:location]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  uint64_t v2 = v7;

  return v2;
}

uint64_t __os_log_helper_16_2_3_8_64_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id CPSSafeCast_17(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

void sub_22B70DCE0(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, id *a13, id *location)
{
  *(void *)(v14 - 160) = a1;
  *(_DWORD *)(v14 - 164) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(*(_Unwind_Exception **)(v14 - 160));
}

id CPListItemIdentifier(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  if ([location conformsToProtocol:&unk_26DF78820]) {
    id v4 = (id)[location identifier];
  }
  else {
    id v4 = 0;
  }
  objc_storeStrong(&location, 0);
  char v1 = v4;

  return v1;
}

void sub_22B712DB0()
{
  _Unwind_Resume(v0);
}

uint64_t __os_log_helper_16_2_3_8_66_8_66_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

uint64_t CPSCoordinateRegionContainsAnnotations(id obj, double a2, double a3, double a4, double a5)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  double v22 = a2;
  double v23 = a3;
  double v24 = a4;
  double v25 = a5;
  id location = 0;
  objc_storeStrong(&location, obj);
  char v20 = 1;
  memset(__b, 0, sizeof(__b));
  id obja = location;
  uint64_t v15 = [obja countByEnumeratingWithState:__b objects:v31 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obja);
      }
      id v19 = *(id *)(__b[1] + 8 * v12);
      [v19 coordinate];
      double v27 = v5;
      double v28 = v6;
      BOOL v9 = 0;
      if (v6 >= -180.0)
      {
        BOOL v9 = 0;
        if (v28 <= 180.0)
        {
          BOOL v9 = 0;
          if (v27 >= -90.0) {
            BOOL v9 = v27 <= 90.0;
          }
        }
      }
      if (v9)
      {
        double v30 = v22 - v5;
        double v29 = v23 - v6;
        double v17 = fabs(v23 - v6);
        BOOL v8 = 0;
        if (v24 / 2.0 >= fabs(v22 - v5)) {
          BOOL v8 = v25 / 2.0 >= v17;
        }
        char v20 = v8;
        if (!v8) {
          break;
        }
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = [obja countByEnumeratingWithState:__b objects:v31 count:16];
        if (!v13) {
          goto LABEL_16;
        }
      }
    }
    char v26 = 0;
    int v16 = 1;
  }
  else
  {
LABEL_16:
    int v16 = 0;
  }

  if (!v16) {
    char v26 = v20 & 1;
  }
  objc_storeStrong(&location, 0);
  return v26 & 1;
}

CLLocationDegrees CPSCoordinateRegionForAnnotations(id obj)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id location = 0;
  objc_storeStrong(&location, obj);
  double v26 = 90.0;
  double v25 = -90.0;
  double v24 = 180.0;
  double v23 = -180.0;
  memset(__b, 0, sizeof(__b));
  id obja = location;
  uint64_t v15 = [obja countByEnumeratingWithState:__b objects:v55 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0;
    unint64_t v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(obja);
      }
      id v22 = *(id *)(__b[1] + 8 * v12);
      [v22 coordinate];
      double v20 = v2;
      double v31 = v2;
      double v32 = v1;
      double v3 = v1;
      BOOL v9 = 0;
      if (v1 >= -180.0)
      {
        double v3 = v32;
        BOOL v9 = 0;
        if (v32 <= 180.0)
        {
          double v3 = v31;
          BOOL v9 = 0;
          if (v31 >= -90.0)
          {
            double v3 = v31;
            BOOL v9 = v31 <= 90.0;
          }
        }
      }
      if (v9)
      {
        if (v20 < v26) {
          double v26 = v20;
        }
        if (v1 < v24) {
          double v24 = v1;
        }
        if (v20 > v25) {
          double v25 = v20;
        }
        double v3 = v1;
        if (v1 > v23)
        {
          double v3 = v1;
          double v23 = v1;
        }
      }
      ++v12;
      if (v10 + 1 >= v13)
      {
        uint64_t v12 = 0;
        unint64_t v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", __b, v55, 16, v3);
        if (!v13) {
          break;
        }
      }
    }
  }

  double v34 = v25 - v26;
  double v19 = fabs(v25 - v26);
  if (v19 + 0.000002 <= 180.0) {
    double v19 = v19 + 0.000002;
  }
  double v33 = v23 - v24;
  double v18 = fabs(v23 - v24);
  if (v18 + 0.000002 <= 360.0) {
    double v18 = v18 + 0.000002;
  }
  double v40 = v19;
  double v39 = v18;
  double v41 = v19;
  double v42 = v18;
  *(double *)&long long v17 = v19;
  *((double *)&v17 + 1) = v18;
  CLLocationCoordinate2D v48 = CLLocationCoordinate2DMake(v25 - v19 / 2.0, v23 - v18 / 2.0);
  long long v47 = v17;
  CLLocationCoordinate2D v49 = v48;
  long long v50 = v17;
  CLLocationCoordinate2D v28 = v48;
  long long v29 = v17;
  CLLocationCoordinate2D v51 = v48;
  long long v52 = v17;
  CLLocationCoordinate2D v53 = v48;
  BOOL v8 = 0;
  if (v48.longitude >= -180.0)
  {
    BOOL v8 = 0;
    if (v53.longitude <= 180.0)
    {
      BOOL v8 = 0;
      if (v53.latitude >= -90.0) {
        BOOL v8 = v53.latitude <= 90.0;
      }
    }
  }
  BOOL v7 = 0;
  if (v8)
  {
    long long v54 = v52;
    BOOL v6 = 0;
    if (*(double *)&v52 >= 0.0)
    {
      BOOL v6 = 0;
      if (*(double *)&v54 <= 180.0)
      {
        BOOL v6 = 0;
        if (*((double *)&v54 + 1) >= 0.0) {
          BOOL v6 = *((double *)&v54 + 1) <= 360.0;
        }
      }
    }
    BOOL v7 = v6;
  }
  if (!v7)
  {
    CLLocationCoordinate2D v30 = v28;
    BOOL v5 = 0;
    if (v28.longitude >= -180.0)
    {
      BOOL v5 = 0;
      if (v30.longitude <= 180.0)
      {
        BOOL v5 = 0;
        if (v30.latitude >= -90.0) {
          BOOL v5 = v30.latitude <= 90.0;
        }
      }
    }
    if (v5) {
      CLLocationCoordinate2D v16 = v28;
    }
    else {
      CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(0.0, 0.0);
    }
    uint64_t v36 = 0;
    uint64_t v35 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    CLLocationCoordinate2D v44 = v16;
    long long v43 = 0uLL;
    CLLocationCoordinate2D v45 = v16;
    long long v46 = 0uLL;
    CLLocationCoordinate2D v28 = v16;
    long long v29 = 0uLL;
  }
  objc_storeStrong(&location, 0);
  return v28.latitude;
}

id CPSLabelColorForAlertAction(void *a1, char a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  char v16 = a2 & 1;
  id v11 = (id)[location color];

  if (v11)
  {
    id v15 = CPSBackgroundColorForAlertAction(location, v16 & 1);
    id v8 = (id)[location color];
    char v13 = 0;
    BOOL v9 = 1;
    if ((objc_msgSend(v15, "isEqual:") & 1) == 0)
    {
      id v14 = (id)[location color];
      char v13 = 1;
      CPContrastRatioForColors();
      BOOL v9 = v2 <= 7.0;
    }
    if (v13) {

    }
    if (v9)
    {
      id v12 = (id)CPContrastingColorForColor();
      id v6 = (id)[MEMORY[0x263F1C550] blackColor];
      char v7 = objc_msgSend(v12, "isEqual:");

      if (v7) {
        id v18 = (id)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_12];
      }
      else {
        id v18 = (id)[MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_21];
      }
      objc_storeStrong(&v12, 0);
    }
    else
    {
      id v18 = (id)[location color];
    }
    objc_storeStrong(&v15, 0);
  }
  else if (v16)
  {
    id v18 = (id)[MEMORY[0x263F1C550] whiteColor];
  }
  else
  {
    unint64_t v5 = [location style];
    if (v5 <= 1)
    {
      id v18 = (id)[MEMORY[0x263F1C550] systemBlueColor];
    }
    else if (v5 == 2)
    {
      id v18 = (id)[MEMORY[0x263F1C550] systemRedColor];
    }
    else
    {
      id v18 = (id)[MEMORY[0x263F1C550] labelColor];
    }
  }
  objc_storeStrong(&location, 0);
  double v3 = v18;

  return v3;
}

id CPSBackgroundColorForAlertAction(void *a1, char a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  char v20 = a2 & 1;
  id v19 = 0;
  id v18 = (id)[location color];

  if (v18)
  {
    id v2 = (id)[location color];
    id v3 = v19;
    id v19 = v2;
  }
  else
  {
    unint64_t v16 = [location style];
    if (v16 <= 1)
    {
      id v4 = (id)[MEMORY[0x263F1C550] systemBlueColor];
      id v5 = v19;
      id v19 = v4;
    }
    else
    {
      if (v16 == 2) {
        id v6 = (id)[MEMORY[0x263F1C550] systemRedColor];
      }
      else {
        id v6 = (id)[MEMORY[0x263F1C550] systemBlueColor];
      }
      id v7 = v19;
      id v19 = v6;
    }
  }
  if ((v20 & 1) == 0)
  {
    id v14 = (id)[MEMORY[0x263F1C920] _carScreen];
    id v13 = (id)[v14 traitCollection];
    BOOL v15 = [v13 userInterfaceStyle] == 2;

    float v8 = 0.22;
    if (!v15) {
      float v8 = 0.12;
    }
    id v9 = (id)[v19 colorWithAlphaComponent:v8];
    id v10 = v19;
    id v19 = v9;
  }
  id v12 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);

  return v12;
}

id __CPSLabelColorForAlertAction_block_invoke(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[MEMORY[0x263F1C550] blackColor];
  objc_storeStrong(location, 0);

  return v3;
}

id __CPSLabelColorForAlertAction_block_invoke_2(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v3 = (id)[MEMORY[0x263F1C550] whiteColor];
  objc_storeStrong(location, 0);

  return v3;
}

BOOL CPSAlertUsesMinimalStyle(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = (id)[location primaryAction];
  char v4 = 0;
  BOOL v3 = 0;
  if ([v2 style] == 1)
  {
    id v5 = (id)[location secondaryAction];
    char v4 = 1;
    BOOL v3 = v5 == 0;
  }
  BOOL v7 = v3;
  if (v4) {

  }
  objc_storeStrong(&location, 0);
  return v7;
}

uint64_t _pressesContainsPressType(void *a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id location = 0;
  objc_storeStrong(&location, a1);
  uint64_t v14 = a2;
  memset(__b, 0, sizeof(__b));
  id v9 = location;
  uint64_t v10 = [v9 countByEnumeratingWithState:__b objects:v17 count:16];
  if (v10)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0;
    unint64_t v7 = v10;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(v9);
      }
      id v13 = *(id *)(__b[1] + 8 * v6);
      uint64_t v2 = [v13 type];
      if (v2 == v14) {
        break;
      }
      ++v6;
      if (v4 + 1 >= v7)
      {
        uint64_t v6 = 0;
        unint64_t v7 = [v9 countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v7) {
          goto LABEL_9;
        }
      }
    }
    char v16 = 1;
    int v11 = 1;
  }
  else
  {
LABEL_9:
    int v11 = 0;
  }

  if (!v11) {
    char v16 = 0;
  }
  objc_storeStrong(&location, 0);
  return v16 & 1;
}

id CPSFrameworkBundle()
{
  double v1 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  id v5 = [(NSArray *)v1 objectAtIndex:0];

  id v2 = (id)[(id)GSSystemRootDirectory() stringByAppendingPathComponent:v5];
  id v4 = (id)[v2 stringByAppendingPathComponent:@"PrivateFrameworks/CarPlaySupport.framework"];

  id v3 = (id)[MEMORY[0x263F086E0] bundleWithPath:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);

  return v3;
}

id CPSImageNamedWithTraitCollection(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v9 = 0;
  objc_storeStrong(&v9, a2);
  uint64_t v6 = (void *)MEMORY[0x263F1C6B0];
  id v5 = location;
  id v7 = CPSFrameworkBundle();
  id v8 = (id)objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, a1);

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);

  return v8;
}

BOOL CPSTraitCollectionSupportsFocus(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  BOOL v3 = [location primaryInteractionModel] == 8 || (objc_msgSend(location, "interactionModel") & 2) != 0;
  objc_storeStrong(&location, 0);
  return v3;
}

id CPSLocalizedStringForKey(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = CPSFrameworkBundle();
  id v3 = (id)[v2 localizedStringForKey:location value:&stru_26DEE39C0 table:@"Localizable"];

  objc_storeStrong(&location, 0);

  return v3;
}

double CPSSizeForText(void *a1, void *a2, void *a3, double a4, double a5)
{
  v25[1] = *MEMORY[0x263EF8340];
  id location = 0;
  objc_storeStrong(&location, a1);
  id v20 = 0;
  objc_storeStrong(&v20, a2);
  v19[2] = *(id *)&a4;
  v19[1] = *(id *)&a5;
  v19[0] = 0;
  objc_storeStrong(v19, a3);
  id v15 = location;
  CGSizeMake_12();
  double v17 = v5;
  double v18 = v6;
  uint64_t v24 = *MEMORY[0x263F1C238];
  v25[0] = v20;
  id v16 = (id)[NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:a1];
  objc_msgSend(v15, "boundingRectWithSize:options:attributes:context:", 1, v17, v18);

  double v22 = 0.0;
  uint64_t v23 = 0;
  UICeilToScale();
  UICeilToScale();
  CGSizeMake_12();
  double v22 = v7;
  uint64_t v23 = v8;
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&location, 0);
  return v22;
}

double CPSSizeForAttributedText(void *a1, void *a2, double a3, double a4)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  v14[2] = *(id *)&a3;
  v14[1] = *(id *)&a4;
  v14[0] = 0;
  objc_storeStrong(v14, a2);
  id v13 = location;
  CGSizeMake_12();
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, v14[0], v4, v5, a1);
  double v16 = 0.0;
  uint64_t v17 = 0;
  UICeilToScale();
  UICeilToScale();
  CGSizeMake_12();
  double v16 = v6;
  uint64_t v17 = v7;
  objc_storeStrong(v14, 0);
  objc_storeStrong(&location, 0);
  return v16;
}

double CPSRectByApplyingUserInterfaceLayoutDirectionInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  *(double *)id v13 = a1;
  *(double *)&v13[8] = a2;
  *(double *)&v13[16] = a3;
  *(double *)&v13[24] = a4;
  *(double *)id v12 = a5;
  *(double *)&v12[8] = a6;
  *(double *)&v12[16] = a7;
  *(double *)&v12[24] = a8;
  double v14 = a1;
  id v10 = (id)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v11 = [v10 userInterfaceLayoutDirection];

  if (v11 == 1)
  {
    CGRectGetMaxX(*(CGRect *)v12);
    CGRectGetMinX(*(CGRect *)v13);
    CGRectGetWidth(*(CGRect *)v13);
    CGRectGetMinY(*(CGRect *)v13);
    CGRectGetWidth(*(CGRect *)v13);
    CGRectGetHeight(*(CGRect *)v13);
    CGRectMake_5();
    return v8;
  }
  return v14;
}

uint64_t CPSIsInternalInstall()
{
  predicate = (dispatch_once_t *)&CPSIsInternalInstall_onceToken;
  dispatch_block_t block = 0;
  objc_storeStrong(&block, &__block_literal_global_13);
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
  objc_storeStrong(&block, 0);
  return CPSIsInternalInstall_isInternal & 1;
}

uint64_t __CPSIsInternalInstall_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  CPSIsInternalInstall_isInternal = result & 1;
  return result;
}

id _CPAppIdentifierFromTeamAppTuple(id obj)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id location = 0;
  objc_storeStrong(&location, obj);
  if ([location hasPrefix:@"com.apple."])
  {
    id v33 = location;
    int v31 = 1;
  }
  else
  {
    unint64_t v1 = [location length];
    if (v1 >= _CPAppIdentifierFromTeamAppTuple_teamPrefixLength + 1)
    {
      uint64_t v14 = _CPAppIdentifierFromTeamAppTuple_teamPrefixLength;
      CLLocationCoordinate2D v28 = &v6;
      unint64_t v13 = (2 * _CPAppIdentifierFromTeamAppTuple_teamPrefixLength + 15) & 0xFFFFFFFFFFFFFFF0;
      MEMORY[0x270FA5388]();
      id v15 = (char *)&v6 - v13;
      uint64_t v27 = v14;
      uint64_t v3 = *(void *)(v2 + 544);
      uint64_t v35 = 0;
      uint64_t v34 = v3;
      uint64_t v36 = 0;
      uint64_t v37 = v3;
      uint64_t v25 = 0;
      uint64_t v26 = v3;
      objc_msgSend(location, "getCharacters:range:");
      for (unint64_t i = 0; i < _CPAppIdentifierFromTeamAppTuple_teamPrefixLength; ++i)
      {
        if (!isdigit(*(unsigned __int16 *)&v15[2 * i])
          && (*(unsigned __int16 *)&v15[2 * i] < 0x41u || *(unsigned __int16 *)&v15[2 * i] > 0x5Au))
        {
          id v23 = CarPlaySupportGeneralLogging();
          unsigned __int8 v22 = 16;
          if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
          {
            os_log_t v10 = (os_log_t)v23;
            int v11 = v22;
            id v12 = (uint8_t *)v38;
            __os_log_helper_16_2_1_8_64((uint64_t)v38, (uint64_t)location);
            _os_log_error_impl(&dword_22B689000, v10, (os_log_type_t)v11, "team prefix must only contain characters in [0-9,A-Z] (%@)", v12, 0xCu);
          }
          objc_storeStrong(&v23, 0);
          id v33 = 0;
          int v31 = 1;
          goto LABEL_21;
        }
      }
      if ((unsigned __int16)[location characterAtIndex:_CPAppIdentifierFromTeamAppTuple_teamPrefixLength] == 46)
      {
        id v33 = (id)[location substringFromIndex:_CPAppIdentifierFromTeamAppTuple_teamPrefixLength + 1];
        int v31 = 1;
      }
      else
      {
        id v21 = CarPlaySupportGeneralLogging();
        unsigned __int8 v20 = 16;
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
        {
          os_log_t v7 = (os_log_t)v21;
          int v8 = v20;
          id v9 = v19;
          __os_log_helper_16_0_0(v19);
          _os_log_error_impl(&dword_22B689000, v7, (os_log_type_t)v8, "team prefix must be followed by a dot.", v9, 2u);
        }
        objc_storeStrong(&v21, 0);
        id v33 = 0;
        int v31 = 1;
      }
    }
    else
    {
      id v30 = CarPlaySupportGeneralLogging();
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
      {
        id v16 = v30;
        int v17 = v29;
        double v18 = v39;
        __os_log_helper_16_2_1_8_64((uint64_t)v39, (uint64_t)location);
        _os_log_error_impl(&dword_22B689000, (os_log_t)v30, v29, "can't extract application ID from '%@'", v39, 0xCu);
      }
      objc_storeStrong(&v30, 0);
      id v33 = 0;
      int v31 = 1;
    }
  }
LABEL_21:
  objc_storeStrong(&location, 0);
  id v6 = v33;
  double v4 = v33;

  return v4;
}

id CPSSafeCast_18(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

BOOL __CGSizeEqualToSize_0(double a1, double a2, double a3, double a4)
{
  BOOL v5 = 0;
  if (a1 == a3) {
    return a2 == a4;
  }
  return v5;
}

id CPSSafeCast_19(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSSafeProtocolCast_3(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v5 = 0;
  objc_storeStrong(&v5, a2);
  if ([v5 conformsToProtocol:location]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);
  uint64_t v2 = v7;

  return v2;
}

void sub_22B7261F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,int a47,int a48,uint64_t a49,char a50)
{
}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  uint64_t v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

double CGFloatMin(double a1, double a2)
{
  return fmin(a1, a2);
}

id insertNewLabelToStackView(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v3 setNumberOfLines:2];
  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setIsAccessibilityElement:0];
  [location addArrangedSubview:v3];
  id v2 = v3;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);

  return v2;
}

id CPSSafeCast_20(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  id v2 = v5;

  return v2;
}

id CPListItemIdentifier_0(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  if ([location conformsToProtocol:&unk_26DF78820]) {
    id v4 = (id)[location identifier];
  }
  else {
    id v4 = 0;
  }
  objc_storeStrong(&location, 0);
  unint64_t v1 = v4;

  return v1;
}

double UIRectGetMaxY(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

double UIRectGetMinY(double a1, double a2)
{
  return a2;
}

uint64_t _touchesContainIndirectTouch(id obj)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id location = 0;
  objc_storeStrong(&location, obj);
  memset(__b, 0, sizeof(__b));
  id obja = location;
  uint64_t v7 = [obja countByEnumeratingWithState:__b objects:v13 count:16];
  if (v7)
  {
    uint64_t v3 = *(void *)__b[2];
    uint64_t v4 = 0;
    unint64_t v5 = v7;
    while (1)
    {
      uint64_t v2 = v4;
      if (*(void *)__b[2] != v3) {
        objc_enumerationMutation(obja);
      }
      id v10 = *(id *)(__b[1] + 8 * v4);
      if ([v10 type] == 1) {
        break;
      }
      ++v4;
      if (v2 + 1 >= v5)
      {
        uint64_t v4 = 0;
        unint64_t v5 = [obja countByEnumeratingWithState:__b objects:v13 count:16];
        if (!v5) {
          goto LABEL_9;
        }
      }
    }
    char v12 = 1;
    int v8 = 1;
  }
  else
  {
LABEL_9:
    int v8 = 0;
  }

  if (!v8) {
    char v12 = 0;
  }
  objc_storeStrong(&location, 0);
  return v12 & 1;
}

id CPSSafeCast_21(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

id CPSPointsOfInterestMakeLabel(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v3 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setNumberOfLines:1];
  [v3 setAdjustsFontForContentSizeCategory:1];
  [v3 setIsAccessibilityElement:0];
  [v3 setAccessibilityValue:location];
  id v2 = v3;
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&location, 0);

  return v2;
}

uint64_t __os_log_helper_16_2_4_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 4;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  return result;
}

uint64_t __os_log_helper_16_0_6_8_0_8_0_8_0_8_0_4_0_8_0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 6;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 0;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 0;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 0;
  *(unsigned char *)(result + 43) = 4;
  *(_DWORD *)(result + 44) = a6;
  *(unsigned char *)(result + 48) = 0;
  *(unsigned char *)(result + 49) = 8;
  *(void *)(result + 50) = a7;
  return result;
}

uint64_t __os_log_helper_16_0_2_8_0_8_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)uint64_t result = 0;
  *(unsigned char *)(result + 1) = 2;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  return result;
}

BOOL UIEdgeInsetsEqualToEdgeInsets_0(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  BOOL v9 = 0;
  if (a2 == a6)
  {
    BOOL v9 = 0;
    if (a1 == a5)
    {
      BOOL v9 = 0;
      if (a4 == a8) {
        return a3 == a7;
      }
    }
  }
  return v9;
}

uint64_t __os_log_helper_16_2_5_8_64_8_64_8_64_8_64_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 5;
  *(unsigned char *)(result + 2) = 64;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 64;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  *(unsigned char *)(result + 32) = 64;
  *(unsigned char *)(result + 33) = 8;
  *(void *)(result + 34) = a5;
  *(unsigned char *)(result + 42) = 64;
  *(unsigned char *)(result + 43) = 8;
  *(void *)(result + 44) = a6;
  return result;
}

id CPSSafeCast_22(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  id v2 = v5;

  return v2;
}

void sub_22B749F18(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  *(void *)(v11 - 104) = a1;
  *(_DWORD *)(v11 - 108) = a2;
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 48));
  _Unwind_Resume(*(_Unwind_Exception **)(v11 - 104));
}

void sub_22B74A2AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,int a28,_Unwind_Exception *exception_object)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v29 - 80));
  _Unwind_Resume(a1);
}

void sub_22B74BF84(uint64_t a1, int a2)
{
  *(void *)(v2 - 80) = a1;
  *(_DWORD *)(v2 - 84) = a2;
  _Block_object_dispose((const void *)(v2 - 72), 8);
  _Unwind_Resume(*(_Unwind_Exception **)(v2 - 80));
}

void __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_22B74D9C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,int a40,uint64_t a41)
{
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromNavigationOwner_1(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v2 = @"iOS";
    }
    else if (a1 == 2)
    {
      uint64_t v2 = @"Car";
    }
  }
  else
  {
    uint64_t v2 = @"None";
  }

  return v2;
}

double CPSMaxCGFloat(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v13 = 0.0;
  char v12 = (double *)&a9;
  for (unint64_t i = 0; i < a1; ++i)
  {
    double v9 = *v12++;
    double v13 = CGFloatMax(v13, v9);
  }
  return v13;
}

double UIRectGetMaxY_0(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

uint64_t __os_log_helper_16_2_3_8_0_8_0_8_64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 0;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 0;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 64;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

double CGFloatMax(double a1, double a2)
{
  return fmax(a1, a2);
}

void __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  id location = (id *)(a2 + 40);
  uint64_t v2 = *(void **)(a2 + 40);
  id v3 = (id *)(a1 + 40);
  id *v3 = 0;
  objc_storeStrong(v3, v2);
  objc_storeStrong(location, 0);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

BOOL barButtonStyle(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v2 = [location buttonStyle];
  if (v2) {
    BOOL v4 = v2 == 1;
  }
  else {
    BOOL v4 = 0;
  }
  objc_storeStrong(&location, 0);
  return v4;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

id CPSSafeCast_23(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (objc_opt_isKindOfClass()) {
    id v5 = location[0];
  }
  else {
    id v5 = 0;
  }
  objc_storeStrong(location, 0);
  uint64_t v2 = v5;

  return v2;
}

uint64_t __os_log_helper_16_2_3_8_66_8_66_8_66(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)uint64_t result = 2;
  *(unsigned char *)(result + 1) = 3;
  *(unsigned char *)(result + 2) = 66;
  *(unsigned char *)(result + 3) = 8;
  *(void *)(result + 4) = a2;
  *(unsigned char *)(result + 12) = 66;
  *(unsigned char *)(result + 13) = 8;
  *(void *)(result + 14) = a3;
  *(unsigned char *)(result + 22) = 66;
  *(unsigned char *)(result + 23) = 8;
  *(void *)(result + 24) = a4;
  return result;
}

id CPSPresentationRoundedDistance(id obj)
{
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v39 = 0;
  id v33 = (id)[MEMORY[0x263EFF960] currentLocale];
  char v34 = [v33 usesMetricSystem];

  if (v34)
  {
    id v31 = location[0];
    id v32 = (id)[MEMORY[0x263F08CE8] meters];
    id v38 = (id)objc_msgSend(v31, "measurementByConvertingToUnit:");

    [v38 doubleValue];
    char v37 = 0;
    double v36 = 0.0;
    if (*(double *)&v1 < 1000.0)
    {
      char v37 = 1;
      if (*(double *)&v1 <= 500.0)
      {
        if (*(double *)&v1 <= 100.0)
        {
          if (*(double *)&v1 <= 30.0)
          {
            if (*(double *)&v1 <= 5.0)
            {
              double v36 = floor(*(double *)&v1);
            }
            else
            {
              location[12] = v1;
              location[11] = COERCE_ID(5.0);
              double v36 = round(*(double *)&v1 / 5.0) * 5.0;
            }
          }
          else
          {
            location[14] = v1;
            location[13] = COERCE_ID(10.0);
            double v36 = round(*(double *)&v1 / 10.0) * 10.0;
          }
        }
        else
        {
          location[16] = v1;
          location[15] = (id)0x4049000000000000;
          double v36 = round(*(double *)&v1 / 50.0) * 50.0;
        }
      }
      else
      {
        location[18] = v1;
        location[17] = (id)0x4059000000000000;
        double v36 = round(*(double *)&v1 / 100.0) * 100.0;
      }
    }
    if (v37)
    {
      id v29 = objc_alloc(MEMORY[0x263F08980]);
      id v30 = (id)[MEMORY[0x263F08CE8] meters];
      uint64_t v2 = objc_msgSend(v29, "initWithDoubleValue:unit:", v36);
      id v3 = v39;
      id v39 = v2;
    }
    else
    {
      id v27 = location[0];
      id v28 = (id)[MEMORY[0x263F08CE8] kilometers];
      id v4 = (id)objc_msgSend(v27, "measurementByConvertingToUnit:");
      id v5 = v39;
      id v39 = v4;
    }
    objc_storeStrong(&v38, 0);
  }
  else
  {
    id v23 = location[0];
    id v25 = (id)[MEMORY[0x263F08CE8] feet];
    id v24 = (id)objc_msgSend(v23, "measurementByConvertingToUnit:");
    [v24 doubleValue];
    uint64_t v26 = v6;

    if (*(double *)&v26 < 1000.0)
    {
      if (*(double *)&v26 <= 500.0)
      {
        if (*(double *)&v26 <= 100.0)
        {
          if (*(double *)&v26 <= 30.0)
          {
            location[20] = v26;
            location[19] = COERCE_ID(5.0);
            double v35 = floor(*(double *)&v26 / 5.0) * 5.0;
          }
          else
          {
            id location[2] = v26;
            location[1] = COERCE_ID(10.0);
            double v35 = round(*(double *)&v26 / 10.0) * 10.0;
          }
        }
        else
        {
          location[4] = v26;
          location[3] = (id)0x4049000000000000;
          double v35 = round(*(double *)&v26 / 50.0) * 50.0;
        }
      }
      else
      {
        location[6] = v26;
        location[5] = (id)0x4059000000000000;
        double v35 = round(*(double *)&v26 / 100.0) * 100.0;
      }
      id v14 = objc_alloc(MEMORY[0x263F08980]);
      id v15 = (id)[MEMORY[0x263F08CE8] feet];
      id v10 = objc_msgSend(v14, "initWithDoubleValue:unit:", v35);
      id v11 = v39;
      id v39 = v10;
    }
    else
    {
      id v19 = location[0];
      id v21 = (id)[MEMORY[0x263F08CE8] miles];
      id v20 = (id)objc_msgSend(v19, "measurementByConvertingToUnit:");
      [v20 doubleValue];
      unsigned __int8 v22 = v7;

      if (*(double *)&v22 < 1.0)
      {
        location[8] = v22;
        location[7] = (id)0x3FA999999999999ALL;
        double v18 = round(*(double *)&v22 / 0.05) * 0.05;
      }
      else
      {
        location[10] = v22;
        location[9] = (id)0x3FB999999999999ALL;
        double v18 = round(*(double *)&v22 / 0.1) * 0.1;
      }
      id v16 = objc_alloc(MEMORY[0x263F08980]);
      id v17 = (id)[MEMORY[0x263F08CE8] miles];
      int v8 = objc_msgSend(v16, "initWithDoubleValue:unit:", v18);
      id v9 = v39;
      id v39 = v8;
    }
  }
  id v13 = v39;
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);

  return v13;
}

id CPSNumberFormatterForDistance(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v4 = objc_alloc_init(MEMORY[0x263F08A30]);
  [v4 setNumberStyle:1];
  [location doubleValue];
  if (v1 < 100.0) {
    [v4 setMaximumFractionDigits:1];
  }
  else {
    [v4 setMaximumFractionDigits:0];
  }
  id v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&location, 0);

  return v3;
}

void CPSFormattedDistanceSepartedShortUnit(void *a1, void *a2)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v10 = 0;
  objc_storeStrong(&v10, a2);
  id v9 = CPSNumberFormatterForDistance(location);
  id v3 = NSNumber;
  [location doubleValue];
  id v4 = (id)objc_msgSend(v3, "numberWithDouble:");
  id v8 = (id)objc_msgSend(v9, "stringFromNumber:");

  id v7 = objc_alloc_init(MEMORY[0x263F08988]);
  objc_msgSend(v7, "setUnitStyle:");
  [v7 setUnitOptions:1];
  id v5 = (id)[location unit];
  id v6 = (id)objc_msgSend(v7, "stringFromUnit:");

  if (v10) {
    (*((void (**)(id, id, id))v10 + 2))(v10, v8, v6);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

id CPSFormattedDistanceWithMediumUnit(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v5 = objc_alloc_init(MEMORY[0x263F08988]);
  id v2 = v5;
  id v3 = CPSNumberFormatterForDistance(location);
  objc_msgSend(v2, "setNumberFormatter:");

  [v5 setUnitStyle:2];
  [v5 setUnitOptions:1];
  id v4 = (id)[v5 stringFromMeasurement:location];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&location, 0);

  return v4;
}

id CPSRequesterIdentifierForBundleIdentifier(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  id v2 = (id)[NSString stringWithFormat:@"com.apple.CarPlayTemplateUIHost:%@", location];
  objc_storeStrong(&location, 0);

  return v2;
}

id _CPSAlertBackgroundColorForAction(id obj)
{
  id location = 0;
  objc_storeStrong(&location, obj);
  uint64_t v3 = [location style];
  switch(v3)
  {
    case 0:
      goto LABEL_4;
    case 1:
      id v5 = (id)[MEMORY[0x263F1C550] _carSystemQuaternaryColor];
      break;
    case 2:
      id v5 = (id)[MEMORY[0x263F1C550] systemRedColor];
      break;
    default:
LABEL_4:
      id v5 = (id)[MEMORY[0x263F1C550] systemBlueColor];
      break;
  }
  objc_storeStrong(&location, 0);
  double v1 = v5;

  return v1;
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x270F107B8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x270F107E8]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x270F10800]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x270F10810]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x270EE59B0](retstr, tx, ty);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CPContrastRatioForColors()
{
  return MEMORY[0x270EE2AD0]();
}

uint64_t CPContrastingColorForColor()
{
  return MEMORY[0x270EE2AD8]();
}

uint64_t CPImageByScalingImageToSize()
{
  return MEMORY[0x270EE2AE0]();
}

uint64_t CPUIImageCancelGlyph()
{
  return MEMORY[0x270F15A28]();
}

uint64_t CPUIImageForTransportButton()
{
  return MEMORY[0x270F15A38]();
}

uint64_t CPUIImagePanGlyph()
{
  return MEMORY[0x270F15A40]();
}

uint64_t CPUIImageRecenterGlyph()
{
  return MEMORY[0x270F15A48]();
}

uint64_t CPUIImageStarRatingEmpty()
{
  return MEMORY[0x270F15A50]();
}

uint64_t CPUIImageStarRatingFull()
{
  return MEMORY[0x270F15A58]();
}

uint64_t CPUIImageStarRatingHalf()
{
  return MEMORY[0x270F15A60]();
}

uint64_t CPUIImageZoomInGlyph()
{
  return MEMORY[0x270F15A68]();
}

uint64_t CPUIImageZoomOutGlyph()
{
  return MEMORY[0x270F15A70]();
}

uint64_t CPUILocalizedStringForKey()
{
  return MEMORY[0x270F15A78]();
}

uint64_t CPUIPlaceholderTypeForBundleIdentifier()
{
  return MEMORY[0x270F15A80]();
}

uint64_t CPUIQuestionmarkGlyph()
{
  return MEMORY[0x270F15A88]();
}

CTFontRef CTFontCreateCopyWithSymbolicTraits(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontSymbolicTraits symTraitValue, CTFontSymbolicTraits symTraitMask)
{
  return (CTFontRef)MEMORY[0x270EE9AC0](font, matrix, *(void *)&symTraitValue, *(void *)&symTraitMask, size);
}

void CTFrameDraw(CTFrameRef frame, CGContextRef context)
{
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x270EE9D18](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1 = MEMORY[0x270EE9D30](frame);
  result.length = v2;
  result.id location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return (CTParagraphStyleRef)MEMORY[0x270EE9E18](settings, settingCount);
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x270F306A0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MKMapRectForCoordinateRegion()
{
  return MEMORY[0x270EF58F8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F05EA8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x270F05EB8](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

CTTextAlignment NSTextAlignmentToCTTextAlignment(NSTextAlignment nsTextAlignment)
{
  return MEMORY[0x270F05EC8](nsTextAlignment);
}

uint64_t UICeilToScale()
{
  return MEMORY[0x270F05FB0]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x270F05FE0]();
}

uint64_t UIEdgeInsetsFromRectWithRect()
{
  return MEMORY[0x270F15A90]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsEndImageContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x270F06260]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CPUIGlyphFactoryWithTraitCollection()
{
  return MEMORY[0x270F15A98]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double abs(long double __lcpp_x)
{
  MEMORY[0x270ED8470](__lcpp_x);
  return result;
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int isdigit(int _c)
{
  return MEMORY[0x270ED9EF8](*(void *)&_c);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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