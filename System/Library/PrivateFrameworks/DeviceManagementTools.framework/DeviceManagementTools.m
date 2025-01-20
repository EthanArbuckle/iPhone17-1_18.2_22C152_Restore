id _DMTLogOperation()
{
  void *v0;
  uint64_t vars8;

  if (_DMTLogOperation_onceToken != -1) {
    dispatch_once(&_DMTLogOperation_onceToken, &__block_literal_global);
  }
  v0 = (void *)_DMTLogOperation_logObj;
  return v0;
}

id DMTValidateProfileArray(void *a1, void *a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = [a1 objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFArrayGetTypeID())
    {
      id v11 = v9;
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_10;
    }
    v15 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    id v16 = v7;
    v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!a3 && a4)
  {
    v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v18[0] = v7;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

uint64_t DMTValidateProfileBoolean(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  v20[1] = *MEMORY[0x263EF8340];
  id v9 = a2;
  CFTypeID v10 = [a1 objectForKeyedSubscript:v9];
  id v11 = v10;
  if (!v10)
  {
    if (a3) {
      goto LABEL_12;
    }
    if (a5)
    {
      v19 = @"kDMTInvalidConfigurationProfileValueErrorKey";
      v20[0] = v9;
      v14 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];
      uint64_t v15 = 70;
LABEL_10:
      DMTErrorWithCodeAndUserInfo(v15, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_11:
    a4 = 0;
    goto LABEL_12;
  }
  CFTypeID v12 = CFGetTypeID(v10);
  if (v12 != CFNumberGetTypeID())
  {
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 != CFBooleanGetTypeID())
    {
      if (a5)
      {
        v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
        id v18 = v9;
        v14 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        uint64_t v15 = 71;
        goto LABEL_10;
      }
      goto LABEL_11;
    }
  }
  a4 = BooleanValueForObject(v11);
LABEL_12:

  return a4;
}

id DMTValidateProfileData(void *a1, void *a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = [a1 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFDataGetTypeID())
    {
      id v11 = v9;
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v15 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    id v16 = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!a3 && a4)
  {
    v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v18[0] = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileDate(void *a1, void *a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = [a1 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFDateGetTypeID())
    {
      id v11 = v9;
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v15 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    id v16 = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!a3 && a4)
  {
    v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v18[0] = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileDictionary(void *a1, void *a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = [a1 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFDictionaryGetTypeID())
    {
      id v11 = v9;
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v15 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    id v16 = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!a3 && a4)
  {
    v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v18[0] = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileNumber(void *a1, void *a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = [a1 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      id v11 = v9;
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v15 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    id v16 = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!a3 && a4)
  {
    v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v18[0] = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTValidateProfileString(void *a1, void *a2, uint64_t a3, void *a4)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = [a1 objectForKeyedSubscript:v7];
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFStringGetTypeID())
    {
      id v11 = v9;
      goto LABEL_11;
    }
    if (!a4) {
      goto LABEL_10;
    }
    uint64_t v15 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    id v16 = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v13 = 71;
LABEL_9:
    DMTErrorWithCodeAndUserInfo(v13, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    id v11 = 0;
    goto LABEL_11;
  }
  id v11 = 0;
  if (!a3 && a4)
  {
    v17 = @"kDMTInvalidConfigurationProfileValueErrorKey";
    v18[0] = v7;
    CFTypeID v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = 70;
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

id DMTLocalizedOrganizationMarketingNameForOrganizationType(uint64_t a1)
{
  switch(a1)
  {
    case 3:
      v1 = DMTBundle();
      v2 = v1;
      v3 = @"Apple Business Essentials";
      break;
    case 2:
      v1 = DMTBundle();
      v2 = v1;
      v3 = @"Apple Business Manager";
      break;
    case 1:
      v1 = DMTBundle();
      v2 = v1;
      v3 = @"Apple School Manager";
      break;
    default:
      v1 = DMTBundle();
      v2 = v1;
      v3 = @"Apple School Manager, Apple Business Manager or Apple Business Essentials";
      break;
  }
  v4 = [v1 localizedStringForKey:v3 value:&stru_26E10D868 table:0];

  return v4;
}

id DMTFormattedEnrollmentOrganizationNameFrom(uint64_t a1)
{
  if (a1)
  {
    v1 = [NSString stringWithFormat:@"“%@”", a1];
  }
  else
  {
    v2 = DMTBundle();
    v1 = [v2 localizedStringForKey:@"your organization" value:&stru_26E10D868 table:0];
  }
  return v1;
}

id DMTTitleTextAddingDeviceFor(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"Adding iPhone…";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"Adding iPad…";
    }
    else {
      v4 = @"Adding…";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTCompletionButtonTitleForDeviceClass(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"Erase iPhone";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"Erase iPad";
    }
    else {
      v4 = @"Erase Device";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTDetailTextAddingDeviceBodyFor(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"This iPhone will be added to %@ in %@.";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"This iPad will be added to %@ in %@.";
    }
    else {
      v4 = @"This device will be added to %@ in %@.";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTSuccessfulEnrollmentTitleTextForDeviceClass(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"iPhone Added";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"iPad Added";
    }
    else {
      v4 = @"Device Added";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTDetailTextSuccessfulEnrollmentFor(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"This iPhone has been added to %@.\n\nAssign this iPhone to an MDM server in %@ to configure its enrollment settings and enable Automated Device Enrollment.";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"This iPad has been added to %@.\n\nAssign this iPad to an MDM server in %@ to configure its enrollment settings and enable Automated Device Enrollment.";
    }
    else {
      v4 = @"This device has been added to %@.\n\nAssign this device to an MDM server in %@ to configure its enrollment settings and enable Automated Device Enrollment.";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTDetailTextSuccessfulEnrollmentWithMDMServerFor(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"This iPhone has been added to %@.\n\nThis iPhone has been assigned to MDM Server “%@” in %@.";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"This iPad has been added to %@.\n\nThis iPad has been assigned to MDM Server “%@” in %@.";
    }
    else {
      v4 = @"This device has been added to %@.\n\nThis device has been assigned to MDM Server “%@” in %@.";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTTitleTextFailureEnrollmentFor(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"Failed to Add iPhone";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"Failed to Add iPad";
    }
    else {
      v4 = @"Failed to Add Device";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

id DMTDetailTextFailureEnrollmentFor(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"iPhone"])
  {
    v2 = DMTBundle();
    v3 = v2;
    v4 = @"There was a problem adding this iPhone. Tap Erase iPhone to try again.";
  }
  else
  {
    int v5 = [v1 isEqualToString:@"iPad"];
    v2 = DMTBundle();
    v3 = v2;
    if (v5) {
      v4 = @"There was a problem adding this iPad. Tap Erase iPad to try again.";
    }
    else {
      v4 = @"There was a problem adding this device. Tap Erase device to try again.";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:&stru_26E10D868 table:0];

  return v6;
}

void sub_22D3DB56C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D3DBAF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _DMTLogGeneral()
{
  if (_DMTLogGeneral_onceToken != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken, &__block_literal_global_104);
  }
  v0 = (void *)_DMTLogGeneral_logObj;
  return v0;
}

void sub_22D3DC0E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D3DC4C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 88));
  _Unwind_Resume(a1);
}

void sub_22D3DC518()
{
}

id _DMTLogGeneral_0()
{
  if (_DMTLogGeneral_onceToken_0 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_0, &__block_literal_global_123);
  }
  v0 = (void *)_DMTLogGeneral_logObj_0;
  return v0;
}

void sub_22D3DFDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D3E0554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_22D3E0694(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D3E0C80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(v8);
  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_22D3E0CFC()
{
}

void sub_22D3E0D04()
{
}

void sub_22D3E0D0C()
{
}

void sub_22D3E0D14()
{
}

id _DMTLogGeneral_1()
{
  if (_DMTLogGeneral_onceToken_5 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_5, &__block_literal_global_6);
  }
  v0 = (void *)_DMTLogGeneral_logObj_5;
  return v0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id DMTDescriptionKeyFormattedString(void *a1, uint64_t a2)
{
  v3 = (objc_class *)NSString;
  id v4 = a1;
  int v5 = (void *)[[v3 alloc] initWithFormat:v4 arguments:a2];

  return v5;
}

id DMTErrorWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (DMTErrorWithCodeAndUserInfo_onceToken != -1) {
    dispatch_once(&DMTErrorWithCodeAndUserInfo_onceToken, &__block_literal_global_7);
  }
  int v4 = DMTisWAPI();
  uint64_t v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [v3 objectForKeyedSubscript:@"NSDescriptionKey"];

    if (v7) {
      goto LABEL_5;
    }
  }
  if (a1 > 89)
  {
    switch(a1)
    {
      case 'Z':
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Task server invalidated.";
        break;
      case '[':
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Client Disconnected";
        break;
      case 'd':
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"The device has already been added to a different organization";
        break;
      default:
LABEL_5:
        id v8 = v3;
        goto LABEL_38;
    }
  }
  else
  {
    switch(a1)
    {
      case 1:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"An unknown error occurred";
        goto LABEL_36;
      case 2:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"A parameter was invalid";
        goto LABEL_36;
      case 3:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"A value was unexpected";
        goto LABEL_36;
      case 4:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"A timeout occurred.";
        goto LABEL_36;
      case 5:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"An internal error occurred";
        goto LABEL_36;
      case 10:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Discovery primitives invalidated";
        goto LABEL_36;
      case 11:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Discovery primitives interrupted";
        goto LABEL_36;
      case 20:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Sharing session invalidated";
        goto LABEL_36;
      case 21:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Sharing session interrupted";
        goto LABEL_36;
      case 30:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Broadcast primitives invalidated";
        goto LABEL_36;
      case 31:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Broadcast primitives interrupted";
        goto LABEL_36;
      case 40:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Broadcast setup invalidated";
        goto LABEL_36;
      case 50:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"No Wi-Fi interface present";
        CFTypeID v12 = @"No WLAN interface present";
        break;
      case 51:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"Unable to power on Wi-Fi interface";
        CFTypeID v12 = @"Unable to power on WLAN interface";
        break;
      case 52:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"Wi-Fi join cancelled";
        CFTypeID v12 = @"WLAN join cancelled";
        break;
      case 53:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"Unable to find Wi-Fi network";
        CFTypeID v12 = @"Unable to find WLAN network";
        break;
      case 54:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"Timed out joining Wi-Fi network";
        CFTypeID v12 = @"Timed out joining WLAN network";
        break;
      case 55:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"Unable to join Wi-Fi network";
        CFTypeID v12 = @"Unable to join WLAN network";
        break;
      case 56:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Unable to reach the Internet";
        goto LABEL_36;
      case 57:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Unable to reach the Internet with no network configuration shared";
        goto LABEL_36;
      case 58:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        id v11 = @"Unable to reach the Internet with the Wi-Fi credentials shared";
        CFTypeID v12 = @"Unable to reach the Internet with the WLAN credentials shared";
        break;
      case 59:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Unable to reach the Internet with the Configuration Profile shared";
        goto LABEL_36;
      case 60:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Erase already in progress";
        goto LABEL_36;
      case 70:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile payload value is missing";
        goto LABEL_36;
      case 71:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile payload value is of the wrong type";
        goto LABEL_36;
      case 72:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile payload value is invalid";
        goto LABEL_36;
      case 73:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile payload type is not supported by this software";
        goto LABEL_36;
      case 74:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile failed validation";
        goto LABEL_36;
      case 75:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile payload failed validation";
        goto LABEL_36;
      case 76:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile is missing a required payload";
        goto LABEL_36;
      case 77:
        uint64_t v9 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
        uint64_t v10 = @"Configuration profile contains a disallowed payload";
        goto LABEL_36;
      default:
        goto LABEL_5;
    }
    if (v4) {
      uint64_t v10 = v12;
    }
    else {
      uint64_t v10 = v11;
    }
  }
LABEL_36:
  uint64_t v13 = objc_msgSend(v9, "cat_localizedStringsForKey:value:table:", v10, &stru_26E10D868, @"DMTErrors");
  v21 = _DMTErrorDescriptionsForKey(v13, v14, v15, v16, v17, v18, v19, v20, v27);

  id v8 = v3;
  if (v21)
  {
    v22 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v8];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __DMTErrorWithCodeAndUserInfo_block_invoke_2;
    v28[3] = &unk_2649A9DB0;
    id v29 = v22;
    id v23 = v22;
    [v21 enumerateKeysAndObjectsUsingBlock:v28];
    uint64_t v24 = [v23 copy];

    id v8 = (id)v24;
  }
LABEL_38:
  v25 = [MEMORY[0x263F087E8] errorWithDomain:@"DeviceManagementTools.error" code:a1 userInfo:v8];

  return v25;
}

uint64_t __DMTErrorWithCodeAndUserInfo_block_invoke()
{
  DMTErrorWithCodeAndUserInfo_bundle = DMTBundle();
  return MEMORY[0x270F9A758]();
}

id _DMTErrorDescriptionsForKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a1;
  uint64_t v10 = objc_opt_new();
  uint64_t v24 = &a9;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(v11, "objectForKeyedSubscript:", v16, (void)v20);
        uint64_t v18 = DMTDescriptionKeyFormattedString(v17, (uint64_t)v24);
        [v10 setObject:v18 forKeyedSubscript:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  return v10;
}

void __DMTErrorWithCodeAndUserInfo_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

id DMTEnrollmentTimeoutErrorForNetworkConfiguration(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    uint64_t v1 = 56;
  }
  else {
    uint64_t v1 = qword_22D3EFFD8[a1 - 1];
  }
  uint64_t v2 = DMTErrorWithCodeAndUserInfo(v1, 0);
  return v2;
}

void sub_22D3E3724(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_22D3E3CF4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D3E3FB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_22D3E42B0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_22D3E4644(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_22D3E4AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D3E4EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _DMTLogGeneral_2()
{
  if (_DMTLogGeneral_onceToken_6 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_6, &__block_literal_global_8);
  }
  v0 = (void *)_DMTLogGeneral_logObj_6;
  return v0;
}

id _DMTLogEnrollment()
{
  if (_DMTLogEnrollment_onceToken != -1) {
    dispatch_once(&_DMTLogEnrollment_onceToken, &__block_literal_global_244);
  }
  v0 = (void *)_DMTLogEnrollment_logObj;
  return v0;
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id _DMTLogGeneral_3()
{
  if (_DMTLogGeneral_onceToken_7 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_7, &__block_literal_global_9);
  }
  v0 = (void *)_DMTLogGeneral_logObj_7;
  return v0;
}

void sub_22D3E700C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_22D3E72B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D3E74A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D3E796C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v6);
  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v7 - 88));
  _Unwind_Resume(a1);
}

void sub_22D3E79D0()
{
}

id _DMTLogGeneral_4()
{
  if (_DMTLogGeneral_onceToken_8 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_8, &__block_literal_global_10);
  }
  v0 = (void *)_DMTLogGeneral_logObj_8;
  return v0;
}

id _DMTLogOperation_0()
{
  if (_DMTLogOperation_onceToken_0 != -1) {
    dispatch_once(&_DMTLogOperation_onceToken_0, &__block_literal_global_11);
  }
  v0 = (void *)_DMTLogOperation_logObj_0;
  return v0;
}

CFDataRef ExtractSignedData(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v1 = a1;
  size_t numSignersOut = 0;
  CMSDecoderRef cmsDecoderOut = 0;
  if (CMSDecoderCreate(&cmsDecoderOut))
  {
    uint64_t v2 = _DMTLogGeneral_5();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      ExtractSignedData_cold_6();
    }

    CFDataRef v3 = 0;
    goto LABEL_18;
  }
  int v4 = cmsDecoderOut;
  id v5 = v1;
  if (!CMSDecoderUpdateMessage(v4, (const void *)[v5 bytes], objc_msgSend(v5, "length")))
  {
    if (CMSDecoderFinalizeMessage(cmsDecoderOut))
    {
      uint64_t v6 = _DMTLogGeneral_5();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ExtractSignedData_cold_4();
      }
      goto LABEL_14;
    }
    if (CMSDecoderGetNumSigners(cmsDecoderOut, &numSignersOut))
    {
      uint64_t v6 = _DMTLogGeneral_5();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        ExtractSignedData_cold_2();
      }
      goto LABEL_14;
    }
    if (!numSignersOut)
    {
      uint64_t v14 = _DMTLogGeneral_5();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D3D6000, v14, OS_LOG_TYPE_INFO, "Data does not appear to be signed", buf, 2u);
      }

      goto LABEL_15;
    }
    SecPolicyRef BasicX509 = SecPolicyCreateBasicX509();
    if ((uint64_t)numSignersOut < 1)
    {
LABEL_28:
      CFDataRef contentOut = 0;
      if (!CMSDecoderCopyContent(cmsDecoderOut, &contentOut))
      {
        CFDataRef v3 = contentOut;
LABEL_40:
        if (BasicX509) {
          CFRelease(BasicX509);
        }
        goto LABEL_16;
      }
      uint64_t v13 = _DMTLogGeneral_5();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        ExtractSignedData_cold_1();
      }
    }
    else
    {
      size_t v9 = 0;
      while (1)
      {
        CMSSignerStatus signerStatusOut = kCMSSignerInvalidIndex;
        OSStatus v10 = CMSDecoderCopySignerStatus(cmsDecoderOut, v9, BasicX509, 0, &signerStatusOut, 0, 0);
        id v11 = _DMTLogGeneral_5();
        uint64_t v12 = v11;
        if (v10) {
          break;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446722;
          long long v20 = "ExtractSignedData";
          __int16 v21 = 2050;
          size_t v22 = v9;
          __int16 v23 = 1026;
          CMSSignerStatus v24 = signerStatusOut;
          _os_log_impl(&dword_22D3D6000, v12, OS_LOG_TYPE_INFO, "%{public}s: signerIndex = %{public}ld, signStatus = %{public}d", buf, 0x1Cu);
        }

        if ((uint64_t)++v9 >= (uint64_t)numSignersOut) {
          goto LABEL_28;
        }
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ExtractSignedData_cold_2();
      }
    }
    CFDataRef v3 = 0;
    goto LABEL_40;
  }
  uint64_t v6 = _DMTLogGeneral_5();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    ExtractSignedData_cold_5();
  }
LABEL_14:

LABEL_15:
  CFDataRef v3 = 0;
LABEL_16:
  if (cmsDecoderOut) {
    CFRelease(cmsDecoderOut);
  }
LABEL_18:

  return v3;
}

id _DMTLogGeneral_5()
{
  if (_DMTLogGeneral_onceToken_9 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_9, &__block_literal_global_12);
  }
  v0 = (void *)_DMTLogGeneral_logObj_9;
  return v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_22D3E9E70(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

id _DMTLogGeneral_6()
{
  if (_DMTLogGeneral_onceToken_10 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_10, &__block_literal_global_13);
  }
  v0 = (void *)_DMTLogGeneral_logObj_10;
  return v0;
}

uint64_t DMTBundle()
{
  return [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.DeviceManagementTools"];
}

uint64_t DMTisWAPI()
{
  if (DMTisWAPI_onceToken != -1) {
    dispatch_once(&DMTisWAPI_onceToken, &__block_literal_global_14);
  }
  return DMTisWAPI_wapi;
}

uint64_t __DMTisWAPI_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  DMTisWAPI_wapuint64_t i = result;
  return result;
}

uint64_t BooleanValueForObject(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    CFTypeID v3 = CFGetTypeID(v1);
    CFTypeID TypeID = CFBooleanGetTypeID();

    if (v3 == TypeID)
    {
      int Value = CFBooleanGetValue((CFBooleanRef)v2);
LABEL_15:
      uint64_t v11 = Value != 0;
      goto LABEL_19;
    }
    CFTypeID v6 = CFGetTypeID(v2);
    if (v6 == CFStringGetTypeID())
    {
      uint64_t v7 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      id v8 = [v2 stringByTrimmingCharactersInSet:v7];

      if (![v8 length]
        || (int v9 = [v8 characterAtIndex:0],
            unsigned __int16 v10 = ((unsigned __int16)(v9 - 70) >> 3) | (((_WORD)v9 - 70) << 13),
            v10 < 6u)
        && ((0x33u >> v10) & 1) != 0)
      {
        uint64_t v11 = 0;
      }
      else
      {
        if ((v9 - 84) >= 0x26 || ((0x2100000021uLL >> (v9 - 84)) & 1) == 0)
        {

          goto LABEL_11;
        }
        uint64_t v11 = 1;
      }

      goto LABEL_19;
    }
  }
LABEL_11:
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v11 = 0;
      goto LABEL_19;
    }
    int Value = [v2 intValue];
    goto LABEL_15;
  }
  uint64_t v11 = [v2 BOOLValue];
LABEL_19:

  return v11;
}

id _DMTLogGeneral_7()
{
  if (_DMTLogGeneral_onceToken_12 != -1) {
    dispatch_once(&_DMTLogGeneral_onceToken_12, &__block_literal_global_16);
  }
  v0 = (void *)_DMTLogGeneral_logObj_12;
  return v0;
}

uint64_t OUTLINED_FUNCTION_2_0@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void ExtractSignedData_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22D3D6000, v0, v1, "Failed to extract content from signed data (%{public}d)", v2, v3, v4, v5, v6);
}

void ExtractSignedData_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22D3D6000, v0, v1, "Failed to determine number of signers (%{public}d)", v2, v3, v4, v5, v6);
}

void ExtractSignedData_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22D3D6000, v0, v1, "Failed to finalize decoder message (%{public}d)", v2, v3, v4, v5, v6);
}

void ExtractSignedData_cold_5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22D3D6000, v0, v1, "Failed to set decoder message (%{public}d). Is this signed data?", v2, v3, v4, v5, v6);
}

void ExtractSignedData_cold_6()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22D3D6000, v0, v1, "Failed to create decoder (%{public}d)", v2, v3, v4, v5, v6);
}

uint64_t CATErrorWithCodeAndUserInfo()
{
  return MEMORY[0x270F15BB0]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

OSStatus CMSDecoderCopyContent(CMSDecoderRef cmsDecoder, CFDataRef *contentOut)
{
  return MEMORY[0x270EFD380](cmsDecoder, contentOut);
}

OSStatus CMSDecoderCopySignerStatus(CMSDecoderRef cmsDecoder, size_t signerIndex, CFTypeRef policyOrArray, Boolean evaluateSecTrust, CMSSignerStatus *signerStatusOut, SecTrustRef *secTrustOut, OSStatus *certVerifyResultCodeOut)
{
  return MEMORY[0x270EFD388](cmsDecoder, signerIndex, policyOrArray, evaluateSecTrust, signerStatusOut, secTrustOut, certVerifyResultCodeOut);
}

OSStatus CMSDecoderCreate(CMSDecoderRef *cmsDecoderOut)
{
  return MEMORY[0x270EFD390](cmsDecoderOut);
}

OSStatus CMSDecoderFinalizeMessage(CMSDecoderRef cmsDecoder)
{
  return MEMORY[0x270EFD398](cmsDecoder);
}

OSStatus CMSDecoderGetNumSigners(CMSDecoderRef cmsDecoder, size_t *numSignersOut)
{
  return MEMORY[0x270EFD3A0](cmsDecoder, numSignersOut);
}

OSStatus CMSDecoderUpdateMessage(CMSDecoderRef cmsDecoder, const void *msgBytes, size_t msgBytesLen)
{
  return MEMORY[0x270EFD3A8](cmsDecoder, msgBytes, msgBytesLen);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

SecPolicyRef SecPolicyCreateBasicX509(void)
{
  return (SecPolicyRef)MEMORY[0x270EFDB48]();
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

void dispatch_suspend(dispatch_object_t object)
{
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x270EF8A08]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}