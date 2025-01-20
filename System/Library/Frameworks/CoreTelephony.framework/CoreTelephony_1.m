uint64_t _CTServerConnectionSetCellularUsagePolicy(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3) {
    ctu::cf::assign();
  }
  return 0x1600000001;
}

uint64_t mayBeSetLegacyCellularDataPolicy(xpc_object_t *a1, CFDictionaryRef theDict)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, @"kCTCellularUsagePolicyDataAllowed");
  if (result)
  {
    v4 = (const void *)result;
    CFTypeID v5 = CFGetTypeID((CFTypeRef)result);
    if (v5 == CFBooleanGetTypeID())
    {
      int v6 = CFEqual((CFTypeRef)*MEMORY[0x1E4F1CFD0], v4);
      xpc_object_t v7 = xpc_int64_create(2 * (v6 == 0));
      if (!v7) {
        xpc_object_t v7 = xpc_null_create();
      }
      xpc_dictionary_set_value(*a1, "kCUPolicyKeyDataAllowed", v7);
      xpc_object_t v8 = xpc_null_create();
      xpc_release(v7);
      xpc_release(v8);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL mayBeSetCellularDataPolicy(xpc_object_t *a1, CFDictionaryRef theDict)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"kCTCellularDataUsagePolicy");
  if (Value)
  {
    CFStringRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFStringGetTypeID()) {
      CFStringRef Value = v4;
    }
    else {
      CFStringRef Value = 0;
    }
  }
  unsigned __int16 EnumForCellularDataUsagePolicy = getEnumForCellularDataUsagePolicy(Value);
  unsigned int v7 = EnumForCellularDataUsagePolicy;
  if (EnumForCellularDataUsagePolicy >= 0x100u)
  {
    xpc_object_t v8 = xpc_int64_create(EnumForCellularDataUsagePolicy);
    if (!v8) {
      xpc_object_t v8 = xpc_null_create();
    }
    xpc_dictionary_set_value(*a1, "kCUPolicyKeyDataAllowed", v8);
    xpc_object_t v9 = xpc_null_create();
    xpc_release(v8);
    xpc_release(v9);
  }
  return v7 > 0xFF;
}

BOOL mayBeSetWiFiDataPolicy(xpc_object_t *a1, CFDictionaryRef theDict)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, @"kCTWiFiDataUsagePolicy");
  if (Value)
  {
    CFStringRef v4 = Value;
    CFTypeID v5 = CFGetTypeID(Value);
    if (v5 == CFStringGetTypeID()) {
      CFStringRef Value = v4;
    }
    else {
      CFStringRef Value = 0;
    }
  }
  unsigned __int16 EnumForCellularDataUsagePolicy = getEnumForCellularDataUsagePolicy(Value);
  unsigned int v7 = EnumForCellularDataUsagePolicy;
  if (EnumForCellularDataUsagePolicy >= 0x100u)
  {
    xpc_object_t v8 = xpc_int64_create(EnumForCellularDataUsagePolicy);
    if (!v8) {
      xpc_object_t v8 = xpc_null_create();
    }
    xpc_dictionary_set_value(*a1, "kCUPolicyKeyWiFiAllowed", v8);
    xpc_object_t v9 = xpc_null_create();
    xpc_release(v8);
    xpc_release(v9);
  }
  return v7 > 0xFF;
}

unint64_t _CTServerConnectionCopyStartDateOfCellularDataUsageRecords(uint64_t a1, CFDateRef *a2)
{
  unint64_t v2 = 0x1600000001;
  if (a1 && a2)
  {
    *a2 = 0;
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetRecordsStartDate", object, "kRequest", &xdict);
    xpc_release(object[0]);
    xpc_object_t v12 = xdict;
    xpc_object_t xdict = xpc_null_create();
    xpc_release(xdict);
    xpc_object_t xdict = xpc_null_create();
    unint64_t v2 = SendXpcMessage(a1, &v12, &xdict);
    if (!HIDWORD(v2)
      && MEMORY[0x1853203E0](xdict) == MEMORY[0x1E4F14590]
      && xpc_dictionary_get_value(xdict, "kCURecordsStartDate"))
    {
      object[0] = &xdict;
      object[1] = "kCURecordsStartDate";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
      xpc::dyn_cast_or_default((xpc *)&v10, v5, 0.0);
      CFAbsoluteTime v7 = v6;
      xpc_release(v10);
      *a2 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7);
    }
    xpc_release(xdict);
    xpc_release(v12);
  }
  return v2;
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecords(uint64_t a1)
{
  if (!a1) {
    return 0x1600000001;
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
  xpc::dict_creator::operator()<char const*>("kCUEraseRecords", &object, "kRequest", &v4);
  xpc_release(object);
  xpc_object_t object = v4;
  xpc_object_t v4 = xpc_null_create();
  xpc_release(v4);
  xpc_object_t v4 = xpc_null_create();
  uint64_t v2 = SendXpcMessage(a1, &object, &v4);
  xpc_release(v4);
  xpc_release(object);
  return v2;
}

unint64_t _CTServerConnectionGetShowUsageAlert(uint64_t a1, void *a2)
{
  unint64_t v2 = 0x1600000001;
  if (a1 && a2)
  {
    uint64_t v5 = *MEMORY[0x1E4F1CFD0];
    *a2 = *MEMORY[0x1E4F1CFD0];
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetShowUsageAlert", object, "kRequest", &xdict);
    xpc_release(object[0]);
    xpc_object_t v12 = xdict;
    xpc_object_t xdict = xpc_null_create();
    xpc_release(xdict);
    xpc_object_t xdict = xpc_null_create();
    unint64_t v2 = SendXpcMessage(a1, &v12, &xdict);
    if (!HIDWORD(v2)
      && MEMORY[0x1853203E0](xdict) == MEMORY[0x1E4F14590]
      && xpc_dictionary_get_value(xdict, "kCUShowUsageAlert"))
    {
      object[0] = &xdict;
      object[1] = "kCUShowUsageAlert";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
      int v6 = xpc::dyn_cast_or_default((xpc *)&v10, 0);
      xpc_release(v10);
      uint64_t v7 = *MEMORY[0x1E4F1CFC8];
      if (v6) {
        uint64_t v7 = v5;
      }
      *a2 = v7;
    }
    xpc_release(xdict);
    xpc_release(v12);
  }
  return v2;
}

uint64_t _CTServerConnectionSetShowUsageAlert(uint64_t a1, const void *a2)
{
  uint64_t v2 = 0x1600000001;
  if (a1 && a2)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUSetShowUsageAlert", &object, "kRequest", &v10);
    xpc_release(object);
    xpc_object_t v5 = v10;
    xpc_object_t object = v10;
    xpc_object_t v10 = xpc_null_create();
    xpc_release(v10);
    unsigned int v6 = CFEqual(a2, (CFTypeRef)*MEMORY[0x1E4F1CFD0]);
    xpc_object_t v7 = xpc_int64_create(v6);
    if (!v7) {
      xpc_object_t v7 = xpc_null_create();
    }
    xpc_dictionary_set_value(v5, "kCUShowUsageAlert", v7);
    xpc_object_t v8 = xpc_null_create();
    xpc_release(v7);
    xpc_release(v8);
    xpc_object_t v10 = xpc_null_create();
    uint64_t v2 = SendXpcMessage(a1, &object, &v10);
    xpc_release(v10);
    xpc_release(object);
  }
  return v2;
}

uint64_t _CTServerConnectionSetUsageAlertParameters(uint64_t a1, ctu *a2)
{
  uint64_t v2 = 0x1600000001;
  if (a1 && a2)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUSetAlertParameters", &object, "kRequest", &v10);
    xpc_release(object);
    xpc_object_t v5 = v10;
    xpc_object_t object = v10;
    xpc_object_t v10 = xpc_null_create();
    xpc_release(v10);
    ctu::cf_to_xpc((uint64_t *)&value, a2, v6);
    xpc_dictionary_set_value(v5, "kCUAlertParameters", value);
    xpc_object_t v7 = value;
    xpc_object_t value = xpc_null_create();
    xpc_release(v7);
    xpc_release(value);
    xpc_object_t value = 0;
    xpc_object_t v10 = xpc_null_create();
    uint64_t v2 = SendXpcMessage(a1, &object, &v10);
    xpc_release(v10);
    xpc_release(object);
  }
  return v2;
}

unint64_t _CTServerConnectionCopyUsageAlertParameters(uint64_t a1, void *a2)
{
  unint64_t v2 = 0x1600000001;
  if (a1 && a2)
  {
    *a2 = 0;
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUGetAlertParameters", object, "kRequest", &xdict);
    xpc_release(object[0]);
    xpc_object_t v12 = xdict;
    xpc_object_t xdict = xpc_null_create();
    xpc_release(xdict);
    xpc_object_t xdict = xpc_null_create();
    unint64_t v2 = SendXpcMessage(a1, &v12, &xdict);
    if (!HIDWORD(v2)
      && MEMORY[0x1853203E0](xdict) == MEMORY[0x1E4F14590]
      && xpc_dictionary_get_value(xdict, "kCUAlertParameters"))
    {
      uint64_t v10 = 0;
      object[0] = &xdict;
      object[1] = "kCUAlertParameters";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v8);
      xpc::bridge((uint64_t *)&cf, (xpc *)&v8, v5);
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v10, &cf);
      if (cf) {
        CFRelease(cf);
      }
      xpc_release(v8);
      *a2 = v10;
    }
    xpc_release(xdict);
    xpc_release(v12);
  }
  return v2;
}

uint64_t _CTServerConnectionCopyDataUsageForSubscriber(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2 && a3) {
    ctu::cf::assign();
  }
  return 0x1600000001;
}

unint64_t _CTServerConnectionCopyReliableNetworkFallbackSettings(uint64_t a1, void *a2)
{
  unint64_t v2 = 0x1600000000;
  unsigned int v3 = 1;
  if (a1 && a2)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)object);
    xpc::dict_creator::operator()<char const*>("kCUReliableNetworkFallbackGet", object, "kRequest", &xdict);
    xpc_release(object[0]);
    xpc_object_t v14 = xdict;
    xpc_object_t xdict = xpc_null_create();
    xpc_release(xdict);
    xpc_object_t xdict = xpc_null_create();
    unint64_t v6 = SendXpcMessage(a1, &v14, &xdict);
    unsigned int v3 = v6;
    if (HIDWORD(v6))
    {
      unint64_t v2 = v6 & 0xFFFFFFFF00000000;
    }
    else if (MEMORY[0x1853203E0](xdict) == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_value(xdict, "kCUReliableNetworkFallbackGet"))
      {
        uint64_t v12 = 0;
        object[0] = &xdict;
        object[1] = "kCUReliableNetworkFallbackGet";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)object, &v10);
        xpc::bridge((uint64_t *)&cf, (xpc *)&v10, v8);
        ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v12, &cf);
        if (cf) {
          CFRelease(cf);
        }
        xpc_release(v10);
        unint64_t v2 = 0;
        *a2 = v12;
      }
      else
      {
        unint64_t v2 = 0x200000000;
        unsigned int v3 = 1;
      }
    }
    else
    {
      unint64_t v2 = 0;
    }
    xpc_release(xdict);
    xpc_release(v14);
  }
  return v3 | v2;
}

uint64_t _CTServerConnectionSetReliableNetworkFallbackToCellular(uint64_t a1, unsigned int a2)
{
  if (!a1) {
    return 0x1600000001;
  }
  xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
  xpc::dict_creator::operator()<char const*>("kCUReliableNetworkFallbackSet", &object, "kRequest", &v10);
  xpc_release(object);
  xpc_object_t v4 = v10;
  xpc_object_t object = v10;
  xpc_object_t v10 = xpc_null_create();
  xpc_release(v10);
  xpc_object_t v5 = xpc_int64_create(a2);
  if (!v5) {
    xpc_object_t v5 = xpc_null_create();
  }
  xpc_dictionary_set_value(v4, "kCUReliableNetworkFallbackUserSetting", v5);
  xpc_object_t v6 = xpc_null_create();
  xpc_release(v5);
  xpc_release(v6);
  uint64_t v8 = SendXpcMessage(a1, &object, 0, v7);
  xpc_release(object);
  return v8;
}

uint64_t _CTServerConnectionGetCellularUsageWorkspaceInfoEx(uint64_t a1, ctu *a2, NSObject *a3, uint64_t a4)
{
  uint64_t result = 0x1600000001;
  if (a2 && a1 && a3 && a4)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUGetWorkspaceInfoEx", &object, "kRequest", &v15);
    xpc_release(object);
    xpc_object_t v9 = v15;
    xpc_object_t object = v15;
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v15);
    ctu::cf_to_xpc((uint64_t *)&value, a2, v10);
    xpc_dictionary_set_value(v9, "kCUContext", value);
    xpc_object_t v11 = value;
    xpc_object_t value = xpc_null_create();
    xpc_release(v11);
    xpc_release(value);
    v13[4] = a4;
    xpc_object_t value = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 0x40000000;
    v13[2] = ___CTServerConnectionGetCellularUsageWorkspaceInfoEx_block_invoke;
    v13[3] = &unk_1E5260AC0;
    int v12 = SendXpcMessageAsync(a1, &object, a3, v13);
    xpc_release(object);
    if (v12) {
      return 0;
    }
    else {
      return 0x500000002;
    }
  }
  return result;
}

uint64_t _CTServerConnectionSetCellularUsagePolicyEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 && a1 && a4 && a5 && a6) {
    ctu::cf::assign();
  }
  return 0x1600000001;
}

uint64_t _CTServerConnectionGetCellularUsagePolicyEx(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 && a1 && a4 && a5) {
    ctu::cf::assign();
  }
  return 0x1600000001;
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecordsEx(uint64_t a1, ctu *a2, NSObject *a3, uint64_t a4)
{
  uint64_t result = 0x1600000001;
  if (a2 && a1 && a3 && a4)
  {
    xpc::dict_creator::dict_creator((xpc::dict_creator *)&object);
    xpc::dict_creator::operator()<char const*>("kCUEraseRecordsEx", &object, "kRequest", &v15);
    xpc_release(object);
    xpc_object_t v9 = v15;
    xpc_object_t object = v15;
    xpc_object_t v15 = xpc_null_create();
    xpc_release(v15);
    ctu::cf_to_xpc((uint64_t *)&value, a2, v10);
    xpc_dictionary_set_value(v9, "kCUContext", value);
    xpc_object_t v11 = value;
    xpc_object_t value = xpc_null_create();
    xpc_release(v11);
    xpc_release(value);
    v13[4] = a4;
    xpc_object_t value = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 0x40000000;
    v13[2] = ___CTServerConnectionEraseCellularDataUsageRecordsEx_block_invoke;
    v13[3] = &unk_1E5267AD8;
    int v12 = SendXpcMessageAsync(a1, &object, a3, v13);
    xpc_release(object);
    if (v12) {
      return 0;
    }
    else {
      return 0x500000002;
    }
  }
  return result;
}

uint64_t _CTServerConnectionGetCellularUsagePolicyMirroring(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return 0x1600000001;
  }
  (*(void (**)(uint64_t, uint64_t, void))(a4 + 16))(a4, 1, 0);
  return 0;
}

uint64_t _CTServerConnectionSetCellularUsagePolicyOsVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    ctu::cf::assign();
  }
  return 0x1600000001;
}

uint64_t getEnumForCellularDataUsagePolicy(const __CFString *a1)
{
  if (a1)
  {
    if (CFEqual(a1, @"kCTCellularDataUsagePolicyAlwaysAllow"))
    {
      int v2 = 0;
    }
    else
    {
      if (!CFEqual(a1, @"kCTCellularDataUsagePolicyAllowWhileInHome"))
      {
        int v3 = CFEqual(a1, @"kCTCellularDataUsagePolicyDeny") != 0;
        int v2 = 2 * v3;
        return v2 | (v3 << 8);
      }
      int v2 = 1;
    }
    int v3 = 1;
  }
  else
  {
    int v2 = 0;
    int v3 = 0;
  }
  return v2 | (v3 << 8);
}

void _CTServerConnectionPerformMigration_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Could not create CTServerConnectionRef", v1, 2u);
}

void acknowledgeMessageWithId()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "acknowledgeMessage called with no server connection", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "couldn't acknowledge message %d", v2, v3, v4, v5, v6);
}

void MMSExpiryHeader::decodeValue(unsigned __int8 a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = (void *)(v3 + 8);
  if (*(char *)(v3 + 31) < 0) {
    uint64_t v4 = (void *)*v4;
  }
  v5[0] = 67109378;
  v5[1] = a1;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "unknown date type 0x%.2x for field %s", (uint8_t *)v5, 0x12u);
}

void handleUnsupportedRequestForCurrentBundle(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18444A000, log, OS_LOG_TYPE_DEBUG, "Unsupported request '%s' for bundle ID '%@'", (uint8_t *)&v3, 0x16u);
}

void anonymous namespace'::sCTAssertionDestroy()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "invalid assertion upon sCTAssertionDestroy", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "no fClientMux", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "CTAssertionConnectionDestroy failed. Remote connection down", v2, v3, v4, v5, v6);
}

void ___ZN12_GLOBAL__N_119sCTAssertionDestroyEPKv_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "sCTAssertionDestroy failed", v2, v3, v4, v5, v6);
}

void ___ZZ44__CoreTelephonyClientMux_addDelegate_queue__ENK3__0clEv_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Updating selectors after delegate addition failed with: %@", v2, v3, v4, v5, v6);
}

void ___ZZ59__CoreTelephonyClientMux_synchronousProxyWithErrorHandler__ENK3__4clEv_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_2(&dword_18444A000, v0, v1, "Synchronous remote object proxy returned error: %@", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::decodeEncodedString(unsigned int *a1, unsigned int *a2)
{
  MMSCharsetHeader::charsetNameForMibEnum((MMSCharsetHeader *)*a1);
  MMSCharsetHeader::charsetNameForMibEnum((MMSCharsetHeader *)*a2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_18444A000, v3, v4, "unable to convert from charset %s (%d) to %s (%d)", v5, v6, v7, v8, v9);
}

void MMSPduDecoder::decodeSimpleHeader(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  int v6 = 136315138;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_5_0(&dword_18444A000, a3, v5, "couldn't replace simple header '%s' with encoded version", (uint8_t *)&v6);
}

{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  int v6 = 136315138;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_5_0(&dword_18444A000, a3, v5, "unable to decode header '%s'", (uint8_t *)&v6);
}

void MMSPduDecoder::decodeSimpleHeader()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "failed to decode simple header name", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::decodeSpecificHeader(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 136315138;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5_0(&dword_18444A000, a2, a3, "No %s header in MMS PDU", (uint8_t *)&v3);
}

void MMSPduDecoder::convertMimePartBody(MMSCharsetHeader *a1, unsigned int *a2)
{
  MMSCharsetHeader::charsetNameForMibEnum(a1);
  MMSCharsetHeader::charsetNameForMibEnum((MMSCharsetHeader *)*a2);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_6(&dword_18444A000, v3, v4, "unable to convert from charset %s (%d) to %s (%d)", v5, v6, v7, v8, v9);
}

void MMSPduDecoder::decodeMultipartAlternativePart()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "unable to decode multipart/alternative part %u", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::decodeMultipartBody()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "unable to decode nEntries for multipart message", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::decodeMimePart()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "Couldn't decode headersLen for part %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "Couldn't decode dataLen for part %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "out of buffer before Content-Type for part %u", v2, v3, v4, v5, v6);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_18444A000, v0, v1, "HeadersLen %u > remaining %u", v2, v3);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(&dword_18444A000, v0, v1, "DataLen %u > remaining %u", v2, v3);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "couldn't find best subpart for multipart/alternative part %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "error decoding headers for part %u", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "Couldn't decode Content-Type for part %u", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::decodeBody()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "no Content-Type header, how can I decode the body?", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "couldn't find a best part for multipart/alternative message", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::decodeContentType(char *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136315138;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_18444A000, a3, (uint64_t)a3, "%s is not a valid content type", (uint8_t *)&v4);
}

void MMSPduDecoder::decodeContentType()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "couldn't decode contentType", v2, v3, v4, v5, v6);
}

void MMSPduDecoder::printDebugInfo(MMSMessage *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  MMSMessage::prettyContentBody(a1, __p);
  if (v6 >= 0) {
    uint64_t v4 = __p;
  }
  else {
    uint64_t v4 = (void **)__p[0];
  }
  int v7 = 136642819;
  uint64_t v8 = v4;
  OUTLINED_FUNCTION_5_0(&dword_18444A000, a2, v3, "Body: %{sensitive}s", (uint8_t *)&v7);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

void MMSPduDecoder::printDebugInfo()
{
  OUTLINED_FUNCTION_8(*MEMORY[0x1E4F143B8]);
  int v3 = 136315138;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_18444A000, v1, v2, "Next few bytes: %s", (uint8_t *)&v3);
}

void MMSPduDecoder::decodeMessage()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_18444A000, v0, v1, "MmsPduDecoder: after decoding message, still have %d bytes remaining.", v2, v3, v4, v5, v6);
}

void ___ZN8dispatch9sync_implIZ27__CTStewieDataClient_start_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Failed to start monitor", v2, v3, v4, v5, v6);
}

void ___ZN8dispatch9sync_implIZ27__CTStewieDataClient_start_E3__0EEvPU28objcproto17OS_dispatch_queue8NSObjectOT_NSt3__117integral_constantIbLb1EEE_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18444A000, v0, v1, "Already running", v2, v3, v4, v5, v6);
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:nn180100](void **a1)
{
  if (*((char *)a1 + 23) < 0) {
    OUTLINED_FUNCTION_0_3(a1);
  }
}

void MMSFromHeader::decodeValue(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "value length > remaining buffer", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "unable to decode value length", v1, 2u);
}

void MMSFromHeader::decodeValue(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "unknown token in From header: %.2x", (uint8_t *)v2, 8u);
}

void _CTServerConnectionGetRegistrationCauseCode_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_18444A000, a2, OS_LOG_TYPE_DEBUG, "Registration cause code: %d", (uint8_t *)v3, 8u);
}

void _CTServerConnectionGetRegistrationStatus_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Registration status: %@", v2, v3, v4, v5, v6);
}

void _CTServerConnectionCopyCurrentOperatorName()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Operator name: %@", v2, v3, v4, v5, v6);
}

void _CTServerConnectionCopyNetworkList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CTServerConnectionSelectNetwork_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CTServerConnectionSelectNetwork_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CTServerConnectionGetNetworkSelectionMode_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Network selection mode: %@", v2, v3, v4, v5, v6);
}

void _CTServerConnectionGetNetworkSelectionState_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Network selection state: %@", v2, v3, v4, v5, v6);
}

void _CTServerConnectionCopyLastKnownCountryCode_cold_1()
{
  OUTLINED_FUNCTION_2_4(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_18444A000, v0, v1, "Last known MCC: %@", v2, v3, v4, v5, v6);
}

void convertRatAndPreferred(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to convert RAT selection mask 0x%02x to string", (uint8_t *)v1, 8u);
}

void MMSPduEncoder::encodeHeaders(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  (*(void (**)(void **__return_ptr))(*(void *)a1 + 48))(__p);
  if (v5 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  *(_DWORD *)buf = 136315138;
  int v7 = v3;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  uint8_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64))(a1);
  uint64_t v4 = 136315138;
  char v5 = v3;
  _os_log_error_impl(&dword_18444A000, a2, OS_LOG_TYPE_ERROR, "encoding failed for header '%s'", (uint8_t *)&v4, 0xCu);
}

void MMSPduEncoder::encodeHeaders(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_18444A000, a1, a3, "unable to encode transactionId", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_18444A000, a1, a3, "unable to encode message type", a5, a6, a7, a8, 0);
}

void CCMonitor::CCMonitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CCMonitor::~CCMonitor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CTServerState::sendNotification_sync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_2_2(&dword_18444A000, MEMORY[0x1E4F14500], a3, "Dropping notification %@ because a runloop and client queue aren't setup", a5, a6, a7, a8, 2u);
}

void loadBundle(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Failed to get c-string from the bundle path", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Non bundle type object in bundles dictionary", v1, 2u);
}

void loadBundle(char *a1, void *a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (*a1 >= 0) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = (void *)*a2;
  }
  int v4 = 136446210;
  char v5 = v3;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Not able to load the bundle with URL %{public}s", (uint8_t *)&v4, 0xCu);
}

void ___ZL24_CTServerConnectXpc_syncP13CTServerStateP16dispatch_queue_sU13block_pointerFvvE_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL19sHandleNotificationP13CTServerStateN3xpc4dictE_block_invoke_cold_1(xpc::object *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  xpc::object::to_string((uint64_t *)__p, a1);
  if (v3 >= 0) {
    uint64_t v1 = __p;
  }
  else {
    uint64_t v1 = (void **)__p[0];
  }
  *(_DWORD *)buf = 136315138;
  char v5 = v1;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "CF conversion failed: %s", buf, 0xCu);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
}

void _CTServerConnectionSendSafetyAlertCustomCommand_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CTServerConnectionSelfTestCommand_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CTServerConnectionInjectOOSGeofence_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _CTServerConnectionGetVoiceMailAvailable_cold_1(int a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "_CTServerConnectionGetVoiceMailAvailable error: %d, domain: %d", (uint8_t *)v2, 0xEu);
}

void _CTServerConnectionGetCellularDataIsEnabled_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_18444A000, log, OS_LOG_TYPE_ERROR, "Could not call _CTServerConnectionGetCellularDataIsEnabled() domain=%d error=%d)", (uint8_t *)v3, 0xEu);
}

void anonymous namespace'::sMaybeLogMobileEquipmentDictionary(ctu::cf::CFSharedRef<__CFDictionary const>)::$_0::operator()(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_18444A000, log, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v3, 0x16u);
}

void _CTServerConnectionCopyPhoneNumber_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_18444A000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Phone number index %d not found", (uint8_t *)v1, 8u);
}

uint64_t Lazuli::MessageGroupFileTransferPush::MessageGroupFileTransferPush(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 511) < 0) {
    operator delete(*(void **)(a1 + 488));
  }
  if (*(char *)(a1 + 487) < 0) {
    operator delete(*(void **)(a1 + 464));
  }
  if (*(char *)(a1 + 463) < 0) {
    operator delete(*(void **)(a1 + 440));
  }
  if (*(char *)(a1 + 439) < 0) {
    operator delete(*(void **)(a1 + 416));
  }
  return std::__optional_destruct_base<Lazuli::FileThumbnailInformation,false>::~__optional_destruct_base[abi:nn180100](a2);
}

void Lazuli::MessageChatBotCard::MessageChatBotCard(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 288) && *(char *)(a1 + 287) < 0) {
    operator delete(*(void **)(a1 + 264));
  }
  if (*(unsigned char *)(a1 + 256) && *(char *)(a1 + 255) < 0) {
    operator delete(*(void **)(a1 + 232));
  }
  std::__optional_destruct_base<Lazuli::ChatBotCardMedia,false>::~__optional_destruct_base[abi:nn180100](a2);
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(char *)(a1 + 39) < 0) {
      operator delete(*(void **)(a1 + 16));
    }
  }
}

void Lazuli::FileTransferDescriptor::FileTransferDescriptor(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(char *)(a1 + 167) < 0) {
    operator delete(*(void **)(a1 + 144));
  }
  if (*(char *)(a1 + 143) < 0) {
    operator delete(*(void **)(a1 + 120));
  }
  if (*(char *)(a1 + 119) < 0) {
    operator delete(*(void **)(a1 + 96));
  }
  *(void *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1F40D7528](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

CFTypeID CFBundleGetTypeID(void)
{
  return MEMORY[0x1F40D75C0]();
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return MEMORY[0x1F40D77B8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1F40D7860]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1F40D7898](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x1F40D78B0](allocator, locale, dateStyle, timeStyle);
}

CFDateRef CFDateFormatterCreateDateFromString(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFStringRef string, CFRange *rangep)
{
  return (CFDateRef)MEMORY[0x1F40D78C8](allocator, formatter, string, rangep);
}

void CFDateFormatterSetFormat(CFDateFormatterRef formatter, CFStringRef formatString)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1F40D7970](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x1F40D7AC0]();
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1F40D7B60](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C68](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFNumberFormatterRef CFNumberFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFNumberFormatterStyle style)
{
  return (CFNumberFormatterRef)MEMORY[0x1F40D7D98](allocator, locale, style);
}

CFNumberRef CFNumberFormatterCreateNumberFromString(CFAllocatorRef allocator, CFNumberFormatterRef formatter, CFStringRef string, CFRange *rangep, CFOptionFlags options)
{
  return (CFNumberRef)MEMORY[0x1F40D7DA0](allocator, formatter, string, rangep, options);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7F50](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B0]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8390](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84E0](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D8888](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1F40D8998](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1F40D89A0](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x1F40D89E8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CUTWeakLinkClass()
{
  return MEMORY[0x1F4112A70]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

const char *__cdecl _Block_signature(void *aBlock)
{
  return (const char *)MEMORY[0x1F40C9AB0](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const char *a2, const char *a3)
{
  return MEMORY[0x1F417D968](this, a2, a3);
}

uint64_t ctu::OsLogLogger::OsLogLogger(ctu::OsLogLogger *this, const ctu::OsLogLogger *a2)
{
  return MEMORY[0x1F417D978](this, a2);
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
}

uint64_t ctu::cf::convert_copy()
{
  return MEMORY[0x1F417DAA8]();
}

uint64_t ctu::cf::assign()
{
  return MEMORY[0x1F417DAF0]();
}

{
  return MEMORY[0x1F417DAF8]();
}

uint64_t ctu::cf::assign(ctu::cf *this, BOOL *a2, const __CFBoolean *a3)
{
  return MEMORY[0x1F417DB10](this, a2, a3);
}

uint64_t ctu::cf::assign(ctu::cf *this, uint64_t *a2, const __CFNumber *a3)
{
  return MEMORY[0x1F417DB50](this, a2, a3);
}

uint64_t ctu::hex(ctu *this, const void *a2)
{
  return MEMORY[0x1F417DBB8](this, a2);
}

uint64_t ctu::hex()
{
  return MEMORY[0x1F417DBC0]();
}

uint64_t ctu::cf_to_xpc(ctu *this, const void *a2)
{
  return MEMORY[0x1F417DC70](this, a2);
}

uint64_t ctu::xpc_to_cf(ctu *this, void *a2)
{
  return MEMORY[0x1F417DC78](this, a2);
}

uint64_t xpc::dyn_cast_or_default()
{
  return MEMORY[0x1F417DCB0]();
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2)
{
  return MEMORY[0x1F417DCC0](this, a2);
}

{
  return MEMORY[0x1F417DCD0](this, a2);
}

{
  return MEMORY[0x1F417DCD8](this, a2);
}

{
  return MEMORY[0x1F417DCE0](this, a2);
}

{
  return MEMORY[0x1F417DCE8](this, a2);
}

{
  return MEMORY[0x1F417DCF0](this, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc *this, const object *a2, double a3)
{
  return MEMORY[0x1F417DCC8](this, a2, a3);
}

uint64_t xpc::bridge(xpc *this, const object *a2)
{
  return MEMORY[0x1F417DCF8](this, a2);
}

uint64_t xpc::object::to_string(xpc::object *this)
{
  return MEMORY[0x1F417DD78](this);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1F417E380](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1F417E390](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1F417E660](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1F417E7A0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1F417E7C0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1F417E7D0]();
}

{
  return MEMORY[0x1F417E7E8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1F417E860]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8A8]();
}

{
  return MEMORY[0x1F417E8C0]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1F417E978]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1F417E980]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1F417EE40]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE80](retstr, __val);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

uint64_t __NSMakeSpecialForwardingCaptureBlock()
{
  return MEMORY[0x1F40D9630]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1F40C9F70](dso, description, activity, *(void *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1F40CA010]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1F40CA020]();
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1F40CBBD8](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1F40CBBE0](queue, relative_priority_ptr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CC5B0](a1, a2);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1F40CCA10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint64_t network_usage_policy_create_client()
{
  return MEMORY[0x1F417F410]();
}

uint64_t network_usage_policy_destroy_client()
{
  return MEMORY[0x1F417F418]();
}

uint64_t network_usage_policy_set_changed_handler()
{
  return MEMORY[0x1F417F448]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1F40F2AE0](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1F40F2EA8](hostname, port);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x1F40F3120](identifier, *(void *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x1F40F3128](framer_definition);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
}

void nw_framer_mark_ready(nw_framer_t framer)
{
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1F40F3160](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

void nw_framer_pass_through_input(nw_framer_t framer)
{
}

void nw_framer_pass_through_output(nw_framer_t framer)
{
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1F40F3418](parameters);
}

nw_parameters_t nw_parameters_create_secure_udp(nw_parameters_configure_protocol_block_t configure_dtls, nw_parameters_configure_protocol_block_t configure_udp)
{
  return (nw_parameters_t)MEMORY[0x1F40F34E0](configure_dtls, configure_udp);
}

uint64_t nw_parameters_set_allow_ultra_constrained()
{
  return MEMORY[0x1F40F35B0]();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x1F40F3750]();
}

uint64_t nw_path_copy_netagent_dictionary()
{
  return MEMORY[0x1F40F3830]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x1F40F3858]();
}

uint64_t nw_path_evaluator_cancel()
{
  return MEMORY[0x1F40F3878]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x1F40F3880]();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return MEMORY[0x1F40F38B0]();
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

void objc_moveWeak(id *to, id *from)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1F4181AE8](p, isRequiredMethod, isInstanceMethod, outCount);
}

Protocol **__cdecl protocol_copyProtocolList(Protocol *proto, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1F4181B00](proto, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  CFIndex v4 = (const char *)MEMORY[0x1F4181B08](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1F40CDAC8](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1F40CE198](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x1F40CE220](a1, a2, a3);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CE298](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x1F40CE590](a1);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40CEA58](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1F40CEAA8](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1F40CEB10](value);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1F40CED90](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1F40CEDB0](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1F40CEDC0](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40CEE88](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1F40CEFE8](value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1F40CF040](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF188](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1F40CF320](value);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40CF368](xuuid);
}