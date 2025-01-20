void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1BEF04CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1BEF051A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF05620(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SharedICDeviceHardwareHandler()
{
  if (SharedICDeviceHardwareHandler_assetManageToken != -1) {
    dispatch_once(&SharedICDeviceHardwareHandler_assetManageToken, &__block_literal_global_0);
  }
  v0 = (void *)_gICDeviceHardwareHandler;

  return v0;
}

uint64_t __SharedICDeviceHardwareHandler_block_invoke()
{
  _gICDeviceHardwareHandler = objc_alloc_init(ICDeviceHardwareHandler);

  return MEMORY[0x1F41817F8]();
}

id __ICLogDateString()
{
  if (__ICLogDateString_onceToken != -1) {
    dispatch_once(&__ICLogDateString_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)__ICLogDateString_currentCalendar;
  if (__ICLogDateString_unitFlags) {
    uint64_t v1 = 33020;
  }
  else {
    uint64_t v1 = 0;
  }
  v2 = [MEMORY[0x1E4F1C9C8] date];
  v3 = [v0 components:v1 fromDate:v2];

  uint64_t v4 = [v3 hour];
  uint64_t v5 = [v3 minute];
  uint64_t v6 = [v3 second];
  uint64_t v7 = [v3 nanosecond];
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%02ld:%02ld:%02ld:%06.3ld  ", v4, v5, v6, v7);

  return v8;
}

void __ICOSLogCreate()
{
  if (__ICOSLogCreate_onceToken != -1) {
    dispatch_once(&__ICOSLogCreate_onceToken, &__block_literal_global_11);
  }
}

void __ICReadPrefs()
{
  id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v0 = [v7 persistentDomainForName:ICPreferencesDomain];
  uint64_t v1 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v0];
  v2 = [v0 objectForKeyedSubscript:@"loggingLevel"];
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (uint64_t v3 = [v2 unsignedIntegerValue]) != 0)
  {
    ICLoggingLevel = v3;
  }
  else if (!ICLoggingLevel)
  {
    ICLoggingLevel = 3075;
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:3075];
    [v1 setObject:v5 forKeyedSubscript:@"loggingLevel"];

    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
    CFPreferencesSetMultiple((CFDictionaryRef)v1, 0, (CFStringRef)ICPreferencesDomain, (CFStringRef)*MEMORY[0x1E4F1D3F0], v4);
    CFPreferencesSynchronize((CFStringRef)ICPreferencesDomain, v6, v4);
  }
}

uint64_t __ICLogTypeEnabled(uint64_t a1)
{
  return ICLoggingLevel & a1;
}

id __ICLongValueToErrorString(int a1)
{
  v8[72] = *MEMORY[0x1E4F143B8];
  v7[0] = &unk_1F1A2BEC0;
  v7[1] = &unk_1F1A2BED8;
  v8[0] = &unk_1F1A29CD8;
  v8[1] = &unk_1F1A29D00;
  v7[2] = &unk_1F1A2BEF0;
  v7[3] = &unk_1F1A2BF08;
  v8[2] = &unk_1F1A29D28;
  v8[3] = &unk_1F1A29D50;
  v7[4] = &unk_1F1A2BF20;
  v7[5] = &unk_1F1A2BF38;
  v8[4] = &unk_1F1A29D78;
  v8[5] = &unk_1F1A29DA0;
  v7[6] = &unk_1F1A2BF50;
  v7[7] = &unk_1F1A2BF68;
  v8[6] = &unk_1F1A29DC8;
  v8[7] = &unk_1F1A29DF0;
  v7[8] = &unk_1F1A2BF80;
  v7[9] = &unk_1F1A2BF98;
  v8[8] = &unk_1F1A29E18;
  v8[9] = &unk_1F1A29E40;
  v7[10] = &unk_1F1A2BFB0;
  v7[11] = &unk_1F1A2BFC8;
  v8[10] = &unk_1F1A29E68;
  v8[11] = &unk_1F1A29E90;
  v7[12] = &unk_1F1A2BFE0;
  v7[13] = &unk_1F1A2BFF8;
  v8[12] = &unk_1F1A29EB8;
  v8[13] = &unk_1F1A29EE0;
  v7[14] = &unk_1F1A2C010;
  v7[15] = &unk_1F1A2C028;
  v8[14] = &unk_1F1A29F08;
  v8[15] = &unk_1F1A29F30;
  v7[16] = &unk_1F1A2C040;
  v7[17] = &unk_1F1A2C058;
  v8[16] = &unk_1F1A29F58;
  v8[17] = &unk_1F1A29F80;
  v7[18] = &unk_1F1A2C070;
  v7[19] = &unk_1F1A2C088;
  v8[18] = &unk_1F1A29FA8;
  v8[19] = &unk_1F1A29FD0;
  v7[20] = &unk_1F1A2C0A0;
  v7[21] = &unk_1F1A2C0B8;
  v8[20] = &unk_1F1A29FF8;
  v8[21] = &unk_1F1A2A020;
  v7[22] = &unk_1F1A2C0D0;
  v7[23] = &unk_1F1A2C0E8;
  v8[22] = &unk_1F1A2A048;
  v8[23] = &unk_1F1A2A070;
  v7[24] = &unk_1F1A2C100;
  v7[25] = &unk_1F1A2C118;
  v8[24] = &unk_1F1A2A098;
  v8[25] = &unk_1F1A2A0C0;
  v7[26] = &unk_1F1A2C130;
  v7[27] = &unk_1F1A2C148;
  v8[26] = &unk_1F1A2A0E8;
  v8[27] = &unk_1F1A2A110;
  v7[28] = &unk_1F1A2C160;
  v7[29] = &unk_1F1A2C178;
  v8[28] = &unk_1F1A2A138;
  v8[29] = &unk_1F1A2A160;
  v7[30] = &unk_1F1A2C190;
  v7[31] = &unk_1F1A2C1A8;
  v8[30] = &unk_1F1A2A188;
  v8[31] = &unk_1F1A2A1B0;
  v7[32] = &unk_1F1A2C1C0;
  v7[33] = &unk_1F1A2C1D8;
  v8[32] = &unk_1F1A2A1D8;
  v8[33] = &unk_1F1A2A200;
  v7[34] = &unk_1F1A2C1F0;
  v7[35] = &unk_1F1A2C208;
  v8[34] = &unk_1F1A2A228;
  v8[35] = &unk_1F1A2A250;
  v7[36] = &unk_1F1A2C220;
  v7[37] = &unk_1F1A2C238;
  v8[36] = &unk_1F1A2A278;
  v8[37] = &unk_1F1A2A2A0;
  v7[38] = &unk_1F1A2C250;
  v7[39] = &unk_1F1A2C268;
  v8[38] = &unk_1F1A2A2C8;
  v8[39] = &unk_1F1A2A2F0;
  v7[40] = &unk_1F1A2C280;
  v7[41] = &unk_1F1A2C298;
  v8[40] = &unk_1F1A2A318;
  v8[41] = &unk_1F1A2A340;
  v7[42] = &unk_1F1A2C2B0;
  v7[43] = &unk_1F1A2C2C8;
  v8[42] = &unk_1F1A2A368;
  v8[43] = &unk_1F1A2A390;
  v7[44] = &unk_1F1A2C2E0;
  v7[45] = &unk_1F1A2C2F8;
  v8[44] = &unk_1F1A2A3B8;
  v8[45] = &unk_1F1A2A3E0;
  v7[46] = &unk_1F1A2C310;
  v7[47] = &unk_1F1A2C328;
  v8[46] = &unk_1F1A2A408;
  v8[47] = &unk_1F1A2A430;
  v7[48] = &unk_1F1A2C340;
  v7[49] = &unk_1F1A2C358;
  v8[48] = &unk_1F1A2A458;
  v8[49] = &unk_1F1A2A480;
  v7[50] = &unk_1F1A2C370;
  v7[51] = &unk_1F1A2C388;
  v8[50] = &unk_1F1A2A4A8;
  v8[51] = &unk_1F1A2A4D0;
  v7[52] = &unk_1F1A2C3A0;
  v7[53] = &unk_1F1A2C3B8;
  v8[52] = &unk_1F1A2A4F8;
  v8[53] = &unk_1F1A2A520;
  v7[54] = &unk_1F1A2C3D0;
  v7[55] = &unk_1F1A2C3E8;
  v8[54] = &unk_1F1A2A548;
  v8[55] = &unk_1F1A2A570;
  v7[56] = &unk_1F1A2C400;
  v7[57] = &unk_1F1A2C418;
  v8[56] = &unk_1F1A2A598;
  v8[57] = &unk_1F1A2A5C0;
  v7[58] = &unk_1F1A2C430;
  v7[59] = &unk_1F1A2C448;
  v8[58] = &unk_1F1A2A5E8;
  v8[59] = &unk_1F1A2A610;
  v7[60] = &unk_1F1A2C460;
  v7[61] = &unk_1F1A2C478;
  v8[60] = &unk_1F1A2A638;
  v8[61] = &unk_1F1A2A660;
  v7[62] = &unk_1F1A2C490;
  v7[63] = &unk_1F1A2C4A8;
  v8[62] = &unk_1F1A2A688;
  v8[63] = &unk_1F1A2A6B0;
  v7[64] = &unk_1F1A2C4C0;
  v8[64] = &unk_1F1A2A6D8;
  v7[65] = &unk_1F1A2C4D8;
  v8[65] = &unk_1F1A2A700;
  v7[66] = &unk_1F1A2C4F0;
  v8[66] = &unk_1F1A2A728;
  v7[67] = &unk_1F1A2C508;
  uint64_t v1 = ~a1;
  v8[67] = &unk_1F1A2A750;
  v7[68] = &unk_1F1A2C520;
  v8[68] = &unk_1F1A2A778;
  v7[69] = &unk_1F1A2C538;
  v8[69] = &unk_1F1A2A7A0;
  v7[70] = &unk_1F1A2C550;
  v8[70] = &unk_1F1A2A7C8;
  v7[71] = &unk_1F1A2C568;
  v8[71] = &unk_1F1A2A7F0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:72];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:v1];
  CFStringRef v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"text"];

  return v5;
}

id __ICValueToErrorString(uint64_t a1)
{
  v8[72] = *MEMORY[0x1E4F143B8];
  v7[0] = &unk_1F1A2BEC0;
  v7[1] = &unk_1F1A2BED8;
  v8[0] = &unk_1F1A2A818;
  v8[1] = &unk_1F1A2A840;
  v7[2] = &unk_1F1A2BEF0;
  v7[3] = &unk_1F1A2BF08;
  v8[2] = &unk_1F1A2A868;
  v8[3] = &unk_1F1A2A890;
  v7[4] = &unk_1F1A2BF20;
  v7[5] = &unk_1F1A2BF38;
  v8[4] = &unk_1F1A2A8B8;
  v8[5] = &unk_1F1A2A8E0;
  v7[6] = &unk_1F1A2BF50;
  v7[7] = &unk_1F1A2BF68;
  v8[6] = &unk_1F1A2A908;
  v8[7] = &unk_1F1A2A930;
  v7[8] = &unk_1F1A2BF80;
  v7[9] = &unk_1F1A2BF98;
  v8[8] = &unk_1F1A2A958;
  v8[9] = &unk_1F1A2A980;
  v7[10] = &unk_1F1A2BFB0;
  v7[11] = &unk_1F1A2BFC8;
  v8[10] = &unk_1F1A2A9A8;
  v8[11] = &unk_1F1A2A9D0;
  v7[12] = &unk_1F1A2BFE0;
  v7[13] = &unk_1F1A2BFF8;
  v8[12] = &unk_1F1A2A9F8;
  v8[13] = &unk_1F1A2AA20;
  v7[14] = &unk_1F1A2C010;
  v7[15] = &unk_1F1A2C028;
  v8[14] = &unk_1F1A2AA48;
  v8[15] = &unk_1F1A2AA70;
  v7[16] = &unk_1F1A2C040;
  v7[17] = &unk_1F1A2C058;
  v8[16] = &unk_1F1A2AA98;
  v8[17] = &unk_1F1A2AAC0;
  v7[18] = &unk_1F1A2C070;
  v7[19] = &unk_1F1A2C088;
  v8[18] = &unk_1F1A2AAE8;
  v8[19] = &unk_1F1A2AB10;
  v7[20] = &unk_1F1A2C0A0;
  v7[21] = &unk_1F1A2C0B8;
  v8[20] = &unk_1F1A2AB38;
  v8[21] = &unk_1F1A2AB60;
  v7[22] = &unk_1F1A2C0D0;
  v7[23] = &unk_1F1A2C0E8;
  v8[22] = &unk_1F1A2AB88;
  v8[23] = &unk_1F1A2ABB0;
  v7[24] = &unk_1F1A2C100;
  v7[25] = &unk_1F1A2C118;
  v8[24] = &unk_1F1A2ABD8;
  v8[25] = &unk_1F1A2AC00;
  v7[26] = &unk_1F1A2C130;
  v7[27] = &unk_1F1A2C148;
  v8[26] = &unk_1F1A2AC28;
  v8[27] = &unk_1F1A2AC50;
  v7[28] = &unk_1F1A2C160;
  v7[29] = &unk_1F1A2C178;
  v8[28] = &unk_1F1A2AC78;
  v8[29] = &unk_1F1A2ACA0;
  v7[30] = &unk_1F1A2C190;
  v7[31] = &unk_1F1A2C1A8;
  v8[30] = &unk_1F1A2ACC8;
  v8[31] = &unk_1F1A2ACF0;
  v7[32] = &unk_1F1A2C1C0;
  v7[33] = &unk_1F1A2C1D8;
  v8[32] = &unk_1F1A2AD18;
  v8[33] = &unk_1F1A2AD40;
  v7[34] = &unk_1F1A2C1F0;
  v7[35] = &unk_1F1A2C208;
  v8[34] = &unk_1F1A2AD68;
  v8[35] = &unk_1F1A2AD90;
  v7[36] = &unk_1F1A2C220;
  v7[37] = &unk_1F1A2C238;
  v8[36] = &unk_1F1A2ADB8;
  v8[37] = &unk_1F1A2ADE0;
  v7[38] = &unk_1F1A2C250;
  v7[39] = &unk_1F1A2C268;
  v8[38] = &unk_1F1A2AE08;
  v8[39] = &unk_1F1A2AE30;
  v7[40] = &unk_1F1A2C280;
  v7[41] = &unk_1F1A2C298;
  v8[40] = &unk_1F1A2AE58;
  v8[41] = &unk_1F1A2AE80;
  v7[42] = &unk_1F1A2C2B0;
  v7[43] = &unk_1F1A2C2C8;
  v8[42] = &unk_1F1A2AEA8;
  v8[43] = &unk_1F1A2AED0;
  v7[44] = &unk_1F1A2C2E0;
  v7[45] = &unk_1F1A2C2F8;
  v8[44] = &unk_1F1A2AEF8;
  v8[45] = &unk_1F1A2AF20;
  v7[46] = &unk_1F1A2C310;
  v7[47] = &unk_1F1A2C328;
  v8[46] = &unk_1F1A2AF48;
  v8[47] = &unk_1F1A2AF70;
  v7[48] = &unk_1F1A2C340;
  v7[49] = &unk_1F1A2C358;
  v8[48] = &unk_1F1A2AF98;
  v8[49] = &unk_1F1A2AFC0;
  v7[50] = &unk_1F1A2C370;
  v7[51] = &unk_1F1A2C388;
  v8[50] = &unk_1F1A2AFE8;
  v8[51] = &unk_1F1A2B010;
  v7[52] = &unk_1F1A2C3A0;
  v7[53] = &unk_1F1A2C3B8;
  v8[52] = &unk_1F1A2B038;
  v8[53] = &unk_1F1A2B060;
  v7[54] = &unk_1F1A2C3D0;
  v7[55] = &unk_1F1A2C3E8;
  v8[54] = &unk_1F1A2B088;
  v8[55] = &unk_1F1A2B0B0;
  v7[56] = &unk_1F1A2C400;
  v7[57] = &unk_1F1A2C418;
  v8[56] = &unk_1F1A2B0D8;
  v8[57] = &unk_1F1A2B100;
  v7[58] = &unk_1F1A2C430;
  v7[59] = &unk_1F1A2C448;
  v8[58] = &unk_1F1A2B128;
  v8[59] = &unk_1F1A2B150;
  v7[60] = &unk_1F1A2C460;
  v7[61] = &unk_1F1A2C478;
  v8[60] = &unk_1F1A2B178;
  v8[61] = &unk_1F1A2B1A0;
  v7[62] = &unk_1F1A2C490;
  v7[63] = &unk_1F1A2C4A8;
  v8[62] = &unk_1F1A2B1C8;
  v8[63] = &unk_1F1A2B1F0;
  v7[64] = &unk_1F1A2C4C0;
  v8[64] = &unk_1F1A2B218;
  v7[65] = &unk_1F1A2C4D8;
  v8[65] = &unk_1F1A2B240;
  v7[66] = &unk_1F1A2C4F0;
  v8[66] = &unk_1F1A2B268;
  v7[67] = &unk_1F1A2C508;
  v8[67] = &unk_1F1A2B290;
  v7[68] = &unk_1F1A2C520;
  v8[68] = &unk_1F1A2B2B8;
  v7[69] = &unk_1F1A2C538;
  v8[69] = &unk_1F1A2B2E0;
  v7[70] = &unk_1F1A2C550;
  v8[70] = &unk_1F1A2B308;
  v7[71] = &unk_1F1A2C568;
  v8[71] = &unk_1F1A2B330;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:72];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:a1];
  CFStringRef v4 = [v2 objectForKeyedSubscript:v3];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"text"];

  return v5;
}

id __ICErrorValueDict(uint64_t a1)
{
  void v7[72] = *MEMORY[0x1E4F143B8];
  v6[0] = &unk_1F1A2BEC0;
  v6[1] = &unk_1F1A2BED8;
  v7[0] = &unk_1F1A2B358;
  v7[1] = &unk_1F1A2B380;
  v6[2] = &unk_1F1A2BEF0;
  v6[3] = &unk_1F1A2BF08;
  v7[2] = &unk_1F1A2B3A8;
  v7[3] = &unk_1F1A2B3D0;
  v6[4] = &unk_1F1A2BF20;
  v6[5] = &unk_1F1A2BF38;
  v7[4] = &unk_1F1A2B3F8;
  v7[5] = &unk_1F1A2B420;
  v6[6] = &unk_1F1A2BF50;
  v6[7] = &unk_1F1A2BF68;
  v7[6] = &unk_1F1A2B448;
  v7[7] = &unk_1F1A2B470;
  v6[8] = &unk_1F1A2BF80;
  v6[9] = &unk_1F1A2BF98;
  v7[8] = &unk_1F1A2B498;
  v7[9] = &unk_1F1A2B4C0;
  v6[10] = &unk_1F1A2BFB0;
  v6[11] = &unk_1F1A2BFC8;
  v7[10] = &unk_1F1A2B4E8;
  v7[11] = &unk_1F1A2B510;
  v6[12] = &unk_1F1A2BFE0;
  v6[13] = &unk_1F1A2BFF8;
  v7[12] = &unk_1F1A2B538;
  v7[13] = &unk_1F1A2B560;
  v6[14] = &unk_1F1A2C010;
  v6[15] = &unk_1F1A2C028;
  v7[14] = &unk_1F1A2B588;
  v7[15] = &unk_1F1A2B5B0;
  v6[16] = &unk_1F1A2C040;
  v6[17] = &unk_1F1A2C058;
  v7[16] = &unk_1F1A2B5D8;
  v7[17] = &unk_1F1A2B600;
  v6[18] = &unk_1F1A2C070;
  v6[19] = &unk_1F1A2C088;
  v7[18] = &unk_1F1A2B628;
  v7[19] = &unk_1F1A2B650;
  v6[20] = &unk_1F1A2C0A0;
  v6[21] = &unk_1F1A2C0B8;
  v7[20] = &unk_1F1A2B678;
  v7[21] = &unk_1F1A2B6A0;
  v6[22] = &unk_1F1A2C0D0;
  v6[23] = &unk_1F1A2C0E8;
  v7[22] = &unk_1F1A2B6C8;
  v7[23] = &unk_1F1A2B6F0;
  v6[24] = &unk_1F1A2C100;
  v6[25] = &unk_1F1A2C118;
  v7[24] = &unk_1F1A2B718;
  v7[25] = &unk_1F1A2B740;
  v6[26] = &unk_1F1A2C130;
  v6[27] = &unk_1F1A2C148;
  v7[26] = &unk_1F1A2B768;
  v7[27] = &unk_1F1A2B790;
  v6[28] = &unk_1F1A2C160;
  v6[29] = &unk_1F1A2C178;
  v7[28] = &unk_1F1A2B7B8;
  v7[29] = &unk_1F1A2B7E0;
  v6[30] = &unk_1F1A2C190;
  v6[31] = &unk_1F1A2C1A8;
  v7[30] = &unk_1F1A2B808;
  v7[31] = &unk_1F1A2B830;
  v6[32] = &unk_1F1A2C1C0;
  v6[33] = &unk_1F1A2C1D8;
  v7[32] = &unk_1F1A2B858;
  v7[33] = &unk_1F1A2B880;
  v6[34] = &unk_1F1A2C1F0;
  v6[35] = &unk_1F1A2C208;
  v7[34] = &unk_1F1A2B8A8;
  v7[35] = &unk_1F1A2B8D0;
  v6[36] = &unk_1F1A2C220;
  v6[37] = &unk_1F1A2C238;
  v7[36] = &unk_1F1A2B8F8;
  v7[37] = &unk_1F1A2B920;
  v6[38] = &unk_1F1A2C250;
  v6[39] = &unk_1F1A2C268;
  v7[38] = &unk_1F1A2B948;
  v7[39] = &unk_1F1A2B970;
  v6[40] = &unk_1F1A2C280;
  v6[41] = &unk_1F1A2C298;
  v7[40] = &unk_1F1A2B998;
  v7[41] = &unk_1F1A2B9C0;
  v6[42] = &unk_1F1A2C2B0;
  v6[43] = &unk_1F1A2C2C8;
  v7[42] = &unk_1F1A2B9E8;
  v7[43] = &unk_1F1A2BA10;
  v6[44] = &unk_1F1A2C2E0;
  v6[45] = &unk_1F1A2C2F8;
  v7[44] = &unk_1F1A2BA38;
  v7[45] = &unk_1F1A2BA60;
  v6[46] = &unk_1F1A2C310;
  v6[47] = &unk_1F1A2C328;
  v7[46] = &unk_1F1A2BA88;
  v7[47] = &unk_1F1A2BAB0;
  v6[48] = &unk_1F1A2C340;
  v6[49] = &unk_1F1A2C358;
  v7[48] = &unk_1F1A2BAD8;
  v7[49] = &unk_1F1A2BB00;
  v6[50] = &unk_1F1A2C370;
  v6[51] = &unk_1F1A2C388;
  v7[50] = &unk_1F1A2BB28;
  v7[51] = &unk_1F1A2BB50;
  v6[52] = &unk_1F1A2C3A0;
  v6[53] = &unk_1F1A2C3B8;
  v7[52] = &unk_1F1A2BB78;
  v7[53] = &unk_1F1A2BBA0;
  v6[54] = &unk_1F1A2C3D0;
  v6[55] = &unk_1F1A2C3E8;
  v7[54] = &unk_1F1A2BBC8;
  v7[55] = &unk_1F1A2BBF0;
  v6[56] = &unk_1F1A2C400;
  v6[57] = &unk_1F1A2C418;
  v7[56] = &unk_1F1A2BC18;
  v7[57] = &unk_1F1A2BC40;
  v6[58] = &unk_1F1A2C430;
  v6[59] = &unk_1F1A2C448;
  v7[58] = &unk_1F1A2BC68;
  v7[59] = &unk_1F1A2BC90;
  v6[60] = &unk_1F1A2C460;
  v6[61] = &unk_1F1A2C478;
  v7[60] = &unk_1F1A2BCB8;
  v7[61] = &unk_1F1A2BCE0;
  v6[62] = &unk_1F1A2C490;
  v6[63] = &unk_1F1A2C4A8;
  v7[62] = &unk_1F1A2BD08;
  v7[63] = &unk_1F1A2BD30;
  v6[64] = &unk_1F1A2C4C0;
  v7[64] = &unk_1F1A2BD58;
  v6[65] = &unk_1F1A2C4D8;
  v7[65] = &unk_1F1A2BD80;
  v6[66] = &unk_1F1A2C4F0;
  v7[66] = &unk_1F1A2BDA8;
  v6[67] = &unk_1F1A2C508;
  v7[67] = &unk_1F1A2BDD0;
  v6[68] = &unk_1F1A2C520;
  v7[68] = &unk_1F1A2BDF8;
  v6[69] = &unk_1F1A2C538;
  v7[69] = &unk_1F1A2BE20;
  v6[70] = &unk_1F1A2C550;
  v7[70] = &unk_1F1A2BE48;
  v6[71] = &unk_1F1A2C568;
  v7[71] = &unk_1F1A2BE70;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:72];
  uint64_t v3 = [NSNumber numberWithInteger:a1];
  CFStringRef v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

BOOL __ICAddDecodedErrorToDict(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CFStringRef v4 = [v3 objectForKeyedSubscript:@"ICAErrorKey"];
    int v5 = [v4 intValue];

    if (v5)
    {
      CFStringRef v6 = [v3 objectForKeyedSubscript:@"ICAErrorKey"];
      a2 = [v6 intValue];
    }
    id v7 = __ICValueToErrorString(a2);
    BOOL v8 = v7 != 0;
    if (v7) {
      [v3 setObject:v7 forKeyedSubscript:@"errorDecoded"];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void sub_1BEF08E18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0958C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF09B6C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0A35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1BEF0AC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0B0C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0B5A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0BAAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0C0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1BEF0C6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0C9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF0CDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ReadUInt16(void *a1)
{
  uint64_t v1 = *(unsigned __int16 *)*a1;
  *a1 += 2;
  return v1;
}

_WORD **WriteUInt16(_WORD **result, __int16 a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t ReadUInt32(void *a1)
{
  uint64_t v1 = *(unsigned int *)*a1;
  *a1 += 4;
  return v1;
}

_DWORD **WriteUInt32(_DWORD **result, int a2)
{
  *(*result)++ = a2;
  return result;
}

uint64_t ReadUInt64(void **a1)
{
  return *(*a1)++;
}

void **WriteUInt64(void **result, uint64_t a2)
{
  *(*result)++ = a2;
  return result;
}

id CopyUnicodeStringWithLengthByteFromBuffer(const void **a1)
{
  uint64_t v1 = *(unsigned __int8 *)*a1;
  *a1 = (char *)*a1 + 1;
  if (v1)
  {
    id v3 = malloc_type_malloc(2 * v1, 0x8B4C94EFuLL);
    memcpy(v3, *a1, 2 * v1);
    *a1 = (char *)*a1 + 2 * v1;
    CFStringRef v4 = (void *)[[NSString alloc] initWithBytesNoCopy:v3 length:(2 * v1 - 2) encoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u) freeWhenDone:1];
  }
  else
  {
    CFStringRef v4 = (void *)[&stru_1F1A1D6A8 copy];
  }

  return v4;
}

id CopyUnicodeStringWithLengthByteFromBufferMaxSize(const void **a1, unint64_t a2)
{
  if ((unint64_t)*a1 + *(unsigned __int8 *)*a1 <= a2)
  {
    v2 = CopyUnicodeStringWithLengthByteFromBuffer(a1);
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void WriteUnicodeStringWithLengthByteToBuffer(unsigned char **a1, void *a2)
{
  id v9 = a2;
  int v3 = [v9 length];
  if (v3)
  {
    CFStringRef v4 = [v9 dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(0x14000100u)];
    int v5 = v3 + 1;
    **a1 = v3 + 1;
    CFStringRef v6 = *a1 + 1;
    *a1 = v6;
    id v7 = v4;
    memcpy(v6, (const void *)[v7 bytes], (2 * v3));
    BOOL v8 = *a1;
    do
    {
      v8 += 2;
      --v3;
    }
    while (v3);
    *(_WORD *)BOOL v8 = 0;
    *a1 += (2 * v5);
  }
  else
  {
    *(*a1)++ = 0;
  }
}

__CFString *stringForOperationCode(uint64_t a1)
{
  if ((int)a1 <= 37120)
  {
    switch((int)a1)
    {
      case 36865:
        v2 = @"PTPOperationCodeGetNumDownloadableObjects_Apple";
        break;
      case 36866:
        v2 = @"PTPOperationCodeGetAllObjectInfo32_Apple";
        break;
      case 36867:
        v2 = @"PTPOperationCodeGetUserAssignedDeviceName_Apple";
        break;
      case 36868:
        v2 = @"PTPOperationCodeAllowKeepAwake_Apple";
        break;
      case 36869:
        v2 = @"PTPOperationCodeGetAllObjectInfo64_Apple";
        break;
      case 36870:
        v2 = @"PTPOperationCodeGetObjectCompressedSize64_Apple";
        break;
      case 36871:
        v2 = @"PTPOperationCodeGetPartialObject64_Apple";
        break;
      case 36872:
        v2 = @"Canon_InitiateReleaseControl";
        break;
      case 36873:
        v2 = @"PTPOperationCodeGetObjectMetadata_Apple";
        break;
      case 36874:
        v2 = @"PTPOperationCodeGetMD5PartialObject64_Apple";
        break;
      case 36875:
        v2 = @"PTPOperationCodeSetMediaCapabilities";
        break;
      case 36876:
        v2 = @"PTPOperationCodeGetAdjustedThumb_Apple";
        break;
      case 36877:
        v2 = @"PTPOperationCodeGetPartialAssetData_Apple";
        break;
      case 36878:
        v2 = @"PTPOperationCodeSetHostSupportedFormats_Apple";
        break;
      case 36879:
        v2 = @"PTPOperationCodeGetObjectInfosForNextGroup_Apple";
        break;
      case 36880:
        v2 = @"PTPOperationCodeSetHostSupportsGroups_Apple";
        break;
      case 36881:
        v2 = @"Canon_SetCustomizeData";
        break;
      case 36882:
        v2 = @"Canon_GetCaptureStatus";
        break;
      case 36883:
        v2 = @"Canon_CheckEvent";
        break;
      case 36884:
        v2 = @"Canon_FocusLock";
        break;
      case 36885:
        v2 = @"Canon_FocusUnlock";
        break;
      case 36886:
        v2 = @"Canon_GetLocalReleaseParam";
        break;
      case 36887:
        v2 = @"Canon_SetLocalReleaseParam";
        break;
      case 36888:
        v2 = @"Canon_AskAboutPcEvf";
        break;
      case 36889:
        v2 = @"Canon_SendPartialObject";
        break;
      case 36890:
        v2 = @"Canon_InitiateCaptureInMemory";
        break;
      case 36891:
        v2 = @"Canon_GetPartialObjectEx";
        break;
      case 36892:
        v2 = @"Canon_SetObjectTime";
        break;
      case 36893:
        v2 = @"Canon_GetViewfinderImage";
        break;
      case 36894:
        v2 = @"Canon_GetObjectAttributes";
        break;
      case 36895:
        v2 = @"Canon_ChangeUSBProtocol";
        break;
      case 36896:
        v2 = @"Canon_GetChanges";
        break;
      case 36897:
LABEL_10:
        v2 = @"Canon_GetObjectInfoEx";
        break;
      case 36898:
        v2 = @"Canon_InitiateDirectTransfer";
        break;
      case 36899:
        v2 = @"Canon_TerminateDirectTransfer";
        break;
      case 36900:
        v2 = @"Canon_SendObjectInfoByPath";
        break;
      case 36901:
        v2 = @"Canon_SendObjectByPath";
        break;
      case 36902:
        v2 = @"Canon_InitiateDirectTansferEx";
        break;
      case 36903:
        v2 = @"Canon_GetAncillaryObjectHandles";
        break;
      case 36904:
        v2 = @"Canon_GetTreeInfo";
        break;
      case 36905:
        v2 = @"Canon_GetTreeSize";
        break;
      case 36906:
        v2 = @"Canon_NotifyProgress";
        break;
      case 36907:
        v2 = @"Canon_NotifyCancelAccepted";
        break;
      case 36908:
        v2 = @"Canon_902C";
        break;
      case 36909:
        v2 = @"Canon_GetDirectory";
        break;
      case 36910:
        v2 = @"Canon_902E";
        break;
      case 36911:
        v2 = @"Canon_902F";
        break;
      case 36912:
        v2 = @"Canon_SetPairingInfo";
        break;
      case 36913:
        v2 = @"Canon_GetPairingInfo";
        break;
      case 36914:
        v2 = @"Canon_DeletePairingInfo";
        break;
      case 36915:
        v2 = @"Canon_GetMACAddress";
        break;
      case 36916:
        v2 = @"Canon_SetDisplayMonitor";
        break;
      case 36917:
        v2 = @"Canon_PairingComplete";
        break;
      case 36918:
        v2 = @"Canon_GetWirelessMAXChannel";
        break;
      case 36919:
      case 36920:
      case 36921:
      case 36922:
      case 36923:
      case 36924:
      case 36925:
      case 36926:
      case 36927:
      case 36928:
      case 36929:
      case 36930:
      case 36931:
      case 36932:
      case 36933:
      case 36934:
      case 36935:
      case 36936:
      case 36937:
      case 36938:
      case 36939:
      case 36940:
      case 36941:
      case 36942:
      case 36943:
      case 36944:
      case 36945:
      case 36946:
      case 36947:
      case 36948:
      case 36949:
      case 36950:
      case 36951:
      case 36952:
      case 36953:
      case 36954:
      case 36955:
      case 36956:
      case 36957:
      case 36958:
      case 36959:
      case 36960:
      case 36961:
      case 36962:
      case 36963:
      case 36964:
      case 36965:
      case 36966:
      case 36967:
      case 36974:
      case 36976:
      case 36977:
      case 36978:
      case 36979:
      case 36980:
      case 36986:
      case 36987:
      case 36988:
      case 36989:
      case 36990:
      case 36991:
      case 36992:
      case 36993:
      case 36994:
      case 36995:
      case 36996:
      case 36997:
LABEL_217:
        if ((a1 & 0xF000) == 0x9000)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"PTPOperationCodeVendorDefined (0x%04X)", a1);
        }
        else if ((a1 & 0xF000) == 0x1000)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"PTPOperationCodeReserved (0x%04X)", a1);
        }
        else
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(0x%04X)", a1);
        }
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 36968:
        v2 = @"Canon_GetWebServiceSpec";
        break;
      case 36969:
        v2 = @"Canon_GetWebServiceData";
        break;
      case 36970:
        v2 = @"Canon_SetWebServiceData";
        break;
      case 36971:
        v2 = @"Canon_DeleteWebServiceData";
        break;
      case 36972:
        v2 = @"Canon_GetRootCertificateSpec";
        break;
      case 36973:
        v2 = @"Canon_GetRootCertificateData";
        break;
      case 36975:
        v2 = @"Canon_SetRootCertificateData";
        break;
      case 36981:
        v2 = @"Canon_GetGpsMobilelinkObjectInfo";
        break;
      case 36982:
        v2 = @"Canon_SendGpsTagInfo";
        break;
      case 36983:
        v2 = @"Canon_GetTranscodeApproxSize";
        break;
      case 36984:
        v2 = @"Canon_RequestTranscodeStart";
        break;
      case 36985:
        v2 = @"Canon_RequestTranscodeCancel";
        break;
      case 36998:
        v2 = @"Canon_SetRemoteShootingMode";
        break;
      default:
        int v3 = a1 - 4096;
        v2 = @"PTPOperationCodeUndefined";
        switch(v3)
        {
          case 0:
            goto LABEL_223;
          case 1:
            v2 = @"PTPOperationCodeGetDeviceInfo";
            break;
          case 2:
            v2 = @"PTPOperationCodeOpenSession";
            break;
          case 3:
            v2 = @"PTPOperationCodeCloseSession";
            break;
          case 4:
            v2 = @"PTPOperationCodeGetStorageIDs";
            break;
          case 5:
            v2 = @"PTPOperationCodeGetStorageInfo";
            break;
          case 6:
            v2 = @"PTPOperationCodeGetNumObjects";
            break;
          case 7:
            v2 = @"PTPOperationCodeGetObjectHandles";
            break;
          case 8:
            v2 = @"PTPOperationCodeGetObjectInfo";
            break;
          case 9:
            v2 = @"PTPOperationCodeGetObject";
            break;
          case 10:
            v2 = @"PTPOperationCodeGetThumb";
            break;
          case 11:
            v2 = @"PTPOperationCodeDeleteObject";
            break;
          case 12:
            v2 = @"PTPOperationCodeSendObjectInfo";
            break;
          case 13:
            v2 = @"PTPOperationCodeSendObject";
            break;
          case 14:
            v2 = @"PTPOperationCodeInitiateCapture";
            break;
          case 15:
            v2 = @"PTPOperationCodeFormatStore";
            break;
          case 16:
            v2 = @"PTPOperationCodeResetDevice";
            break;
          case 17:
            v2 = @"PTPOperationCodeSelfTest";
            break;
          case 18:
            v2 = @"PTPOperationCodeSetObjectProtection";
            break;
          case 19:
            v2 = @"PTPOperationCodePowerDown";
            break;
          case 20:
            v2 = @"PTPOperationCodeGetDevicePropDesc";
            break;
          case 21:
            v2 = @"PTPOperationCodeGetDevicePropValue";
            break;
          case 22:
            v2 = @"PTPOperationCodeSetDevicePropValue";
            break;
          case 23:
            v2 = @"PTPOperationCodeResetDevicePropValue";
            break;
          case 24:
            v2 = @"PTPOperationCodeTerminateOpenCapture";
            break;
          case 25:
            v2 = @"PTPOperationCodeMoveObject";
            break;
          case 26:
            v2 = @"PTPOperationCodeCopyObject";
            break;
          case 27:
            v2 = @"PTPOperationCodeGetPartialObject";
            break;
          case 28:
            v2 = @"PTPOperationCodeInitiateOpenCapture";
            break;
          case 35:
            v2 = @"PTPOperationCodeGetFilesystemManifest";
            break;
          default:
            goto LABEL_217;
        }
        break;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 37121:
        v2 = @"Canon_GetStorageIDs";
        break;
      case 37122:
        v2 = @"Canon_GetStorageInfo";
        break;
      case 37123:
        v2 = @"Canon_GetObjectInfo";
        break;
      case 37124:
        v2 = @"Canon_GetObject";
        break;
      case 37125:
        v2 = @"Canon_DeleteObject";
        break;
      case 37126:
        v2 = @"Canon_FormatStore";
        break;
      case 37127:
        v2 = @"Canon_GetPartialObject";
        break;
      case 37128:
        v2 = @"Canon_GetDeviceInfoEx";
        break;
      case 37129:
        goto LABEL_10;
      case 37130:
        v2 = @"Canon_GetThumbEx";
        break;
      case 37131:
        v2 = @"Canon_SendPartialObject";
        break;
      case 37132:
        v2 = @"Canon_SetObjectAttributes";
        break;
      case 37133:
        v2 = @"Canon_GetObjectTime";
        break;
      case 37134:
        v2 = @"Canon_SetObjectTime";
        break;
      case 37135:
        v2 = @"Canon_RemoteRelease";
        break;
      case 37136:
        v2 = @"Canon_SetDevicePropValueEx";
        break;
      case 37137:
      case 37138:
      case 37156:
      case 37165:
      case 37166:
      case 37167:
      case 37198:
      case 37214:
      case 37215:
      case 37217:
      case 37218:
      case 37219:
      case 37220:
      case 37221:
      case 37222:
      case 37223:
      case 37224:
      case 37225:
      case 37226:
      case 37229:
      case 37238:
      case 37240:
      case 37241:
      case 37242:
      case 37243:
      case 37244:
      case 37245:
      case 37246:
      case 37247:
      case 37248:
      case 37249:
      case 37254:
      case 37255:
      case 37256:
      case 37257:
      case 37258:
      case 37259:
      case 37260:
      case 37261:
      case 37262:
      case 37263:
      case 37264:
      case 37265:
      case 37266:
      case 37267:
      case 37268:
      case 37269:
      case 37270:
      case 37271:
      case 37272:
      case 37273:
      case 37274:
      case 37275:
      case 37276:
      case 37277:
      case 37278:
      case 37279:
      case 37280:
      case 37281:
      case 37282:
      case 37283:
      case 37284:
      case 37285:
      case 37286:
      case 37287:
      case 37288:
      case 37289:
      case 37290:
      case 37292:
      case 37293:
      case 37294:
      case 37295:
      case 37296:
      case 37297:
      case 37298:
      case 37299:
      case 37300:
      case 37301:
      case 37302:
      case 37303:
      case 37304:
      case 37306:
      case 37307:
      case 37308:
      case 37309:
      case 37312:
      case 37313:
      case 37314:
      case 37315:
      case 37316:
      case 37317:
      case 37318:
      case 37319:
      case 37320:
      case 37321:
      case 37322:
      case 37323:
      case 37324:
      case 37325:
      case 37326:
      case 37327:
      case 37328:
      case 37329:
      case 37330:
      case 37331:
      case 37332:
      case 37333:
      case 37334:
      case 37335:
      case 37336:
      case 37337:
      case 37338:
      case 37339:
      case 37340:
      case 37341:
      case 37342:
      case 37343:
      case 37344:
      case 37345:
      case 37346:
      case 37347:
      case 37348:
      case 37349:
      case 37350:
      case 37351:
      case 37354:
      case 37355:
      case 37356:
      case 37357:
      case 37358:
      case 37359:
      case 37362:
      case 37363:
      case 37364:
      case 37365:
      case 37366:
      case 37367:
      case 37368:
      case 37369:
      case 37370:
      case 37371:
      case 37372:
      case 37373:
        goto LABEL_217;
      case 37139:
        v2 = @"Canon_GetRemoteMode";
        break;
      case 37140:
        v2 = @"Canon_SetRemoteMode";
        break;
      case 37141:
        v2 = @"Canon_SetEventMode";
        break;
      case 37142:
        v2 = @"Canon_GetEvent";
        break;
      case 37143:
        v2 = @"Canon_TransferComplete";
        break;
      case 37144:
        v2 = @"Canon_CancelTransfer";
        break;
      case 37145:
        v2 = @"Canon_ResetTransfer";
        break;
      case 37146:
        v2 = @"Canon_PCHDDCapacity";
        break;
      case 37147:
        v2 = @"Canon_SetUILock";
        break;
      case 37148:
        v2 = @"Canon_ResetUILock";
        break;
      case 37149:
        v2 = @"Canon_KeepDeviceOn";
        break;
      case 37150:
        v2 = @"Canon_SetNullPacketMode";
        break;
      case 37151:
        v2 = @"Canon_UpdateFirmware";
        break;
      case 37152:
        v2 = @"Canon_TransferCompleteDT";
        break;
      case 37153:
        v2 = @"Canon_CancelTransferDT";
        break;
      case 37154:
        v2 = @"Canon_SetWftProfile";
        break;
      case 37155:
        v2 = @"Canon_GetWftProfile";
        break;
      case 37157:
        v2 = @"Canon_BulbStart";
        break;
      case 37158:
        v2 = @"Canon_BulbEnd";
        break;
      case 37159:
        v2 = @"Canon_RequestDevicePropValue";
        break;
      case 37160:
        v2 = @"Canon_RemoteReleaseOn";
        break;
      case 37161:
        v2 = @"Canon_RemoteReleaseOff";
        break;
      case 37162:
        v2 = @"Canon_RegistBackgroundImage";
        break;
      case 37163:
        v2 = @"Canon_ChangePhotoStudioMode";
        break;
      case 37164:
        v2 = @"Canon_GetPartialObjectEx";
        break;
      case 37168:
        v2 = @"Canon_ResetMirrorLockupState";
        break;
      case 37169:
        v2 = @"Canon_PopupBuiltinFlash";
        break;
      case 37170:
        v2 = @"Canon_EndGetPartialObjectEx";
        break;
      case 37171:
        v2 = @"Canon_MovieSelectSWOn";
        break;
      case 37172:
        v2 = @"Canon_MovieSelectSWOff";
        break;
      case 37173:
        v2 = @"Canon_GetCTGInfo";
        break;
      case 37174:
        v2 = @"Canon_GetLensAdjust";
        break;
      case 37175:
        v2 = @"Canon_SetLensAdjust";
        break;
      case 37176:
        v2 = @"Canon_ReadyToSendMusic";
        break;
      case 37177:
        v2 = @"Canon_CreateHandle";
        break;
      case 37178:
        v2 = @"Canon_SendPartialObjectEx";
        break;
      case 37179:
        v2 = @"Canon_EndSendPartialObjectEx";
        break;
      case 37180:
        v2 = @"Canon_SetCTGInfo";
        break;
      case 37181:
        v2 = @"Canon_SetRequestOLCInfoGroup";
        break;
      case 37182:
        v2 = @"Canon_SetRequestRollingPitchingLevel";
        break;
      case 37183:
        v2 = @"Canon_GetCameraSupport";
        break;
      case 37184:
        v2 = @"Canon_SetRating";
        break;
      case 37185:
        v2 = @"Canon_RequestInnerDevelopStart";
        break;
      case 37186:
        v2 = @"Canon_RequestInnerDevelopParamChange";
        break;
      case 37187:
        v2 = @"Canon_RequestInnerDevelopEnd";
        break;
      case 37188:
        v2 = @"Canon_GpsLoggingDataMode";
        break;
      case 37189:
        v2 = @"Canon_GetGpsLogCurrentHandle";
        break;
      case 37190:
        v2 = @"Canon_SetImageRecoveryData";
        break;
      case 37191:
        v2 = @"Canon_GetImageRecoveryList";
        break;
      case 37192:
        v2 = @"Canon_FormatImageRecoveryData";
        break;
      case 37193:
        v2 = @"Canon_GetPresetLensAdjustParam";
        break;
      case 37194:
        v2 = @"Canon_GetRawDispImage";
        break;
      case 37195:
        v2 = @"Canon_SaveImageRecoveryData";
        break;
      case 37196:
        v2 = @"Canon_RequestBLE";
        break;
      case 37197:
        v2 = @"Canon_DrivePowerZoom";
        break;
      case 37199:
        v2 = @"Canon_GetIptcData";
        break;
      case 37200:
        v2 = @"Canon_SetIptcData";
        break;
      case 37201:
        v2 = @"Canon_InitiateViewfinder";
        break;
      case 37202:
        v2 = @"Canon_TerminateViewfinder";
        break;
      case 37203:
        v2 = @"Canon_GetViewFinderData";
        break;
      case 37204:
        v2 = @"Canon_DoAf";
        break;
      case 37205:
        v2 = @"Canon_DriveLens";
        break;
      case 37206:
        v2 = @"Canon_DepthOfFieldPreview";
        break;
      case 37207:
        v2 = @"Canon_ClickWB";
        break;
      case 37208:
        v2 = @"Canon_Zoom";
        break;
      case 37209:
        v2 = @"Canon_ZoomPosition";
        break;
      case 37210:
        v2 = @"Canon_SetLiveAfFrame";
        break;
      case 37211:
        v2 = @"Canon_TouchAfPosition";
        break;
      case 37212:
        v2 = @"Canon_SetLvPcFlavoreditMode";
        break;
      case 37213:
        v2 = @"Canon_SetLvPcFlavoreditParam";
        break;
      case 37216:
        v2 = @"Canon_AfCancel";
        break;
      case 37227:
        v2 = @"Canon_SetImageRecoveryDataEx";
        break;
      case 37228:
        v2 = @"Canon_GetImageRecoveryListEx";
        break;
      case 37230:
        v2 = @"Canon_NotifyAutoTransferStatus";
        break;
      case 37231:
        v2 = @"Canon_GetReducedObject";
        break;
      case 37232:
        v2 = @"Canon_GetObjectInfo64";
        break;
      case 37233:
        v2 = @"Canon_GetObject64";
        break;
      case 37234:
        v2 = @"Canon_GetPartialObject64";
        break;
      case 37235:
        v2 = @"Canon_GetObjectInfoEx64";
        break;
      case 37236:
        v2 = @"Canon_GetPartialObjectEX64";
        break;
      case 37237:
        v2 = @"Canon_CreateHandle64";
        break;
      case 37239:
        v2 = @"Canon_NotifySaveComplete";
        break;
      case 37250:
        v2 = @"Canon_NotifyEstimateNumberofImport";
        break;
      case 37251:
        v2 = @"Canon_NotifyNumberofImported";
        break;
      case 37252:
        v2 = @"Canon_NotifySizeOfPartialDataTransfer";
        break;
      case 37253:
        v2 = @"Canon_NotifyFinish";
        break;
      case 37291:
        v2 = @"Canon_GetObjectURL";
        break;
      case 37305:
        v2 = @"Canon_SetFELock";
        break;
      case 37310:
        v2 = @"Canon_SetDefaultCameraSetting";
        break;
      case 37311:
        v2 = @"Canon_GetAEData";
        break;
      case 37352:
        v2 = @"Canon_NotifyNetworkError";
        break;
      case 37353:
        v2 = @"Canon_AdapterTransferProgress";
        break;
      case 37360:
        v2 = @"Canon_TransferCompleteFTP";
        break;
      case 37361:
        v2 = @"Canon_CancelTransferFTP";
        break;
      case 37374:
        v2 = @"Canon_FAPIMessageTX";
        break;
      case 37375:
        v2 = @"Canon_FAPIMessageRX";
        break;
      default:
        switch((int)a1)
        {
          case 38913:
            v2 = @"MTPGetObjectPropsSupported";
            break;
          case 38914:
            v2 = @"MTPGetObjectPropDesc";
            break;
          case 38915:
            v2 = @"MTPGetObjectPropValue";
            break;
          case 38917:
            v2 = @"MTPGetObjectPropList";
            break;
          default:
            goto LABEL_217;
        }
        break;
    }
  }
LABEL_223:

  return v2;
}

__CFString *stringForResponseCode(uint64_t a1)
{
  if ((a1 - 0x2000) >= 0x21)
  {
    if ((a1 & 0xF000) == 0xA000)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"PTPResponseCodeVendorDefined (0x%04X)", a1);
    }
    else if ((a1 & 0xF000) == 0x2000)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"PTPResponseCodeReserved (0x%04X)", a1);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(0x%04X)", a1);
    }
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E63D7518[(__int16)(a1 - 0x2000)];
  }

  return v1;
}

__CFString *stringForProtectionStatus(unsigned int a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v2 = @"PTPProtectionStatusReadOnly";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"PTPProtectionStatusReserved (0x%04X)", a1);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v2 = @"PTPProtectionStatusNoProtection";
  }
  return v2;
}

__CFString *stringForObjectFormatCode(int a1)
{
  switch(a1)
  {
    case 14336:
      uint64_t v1 = @"PTPObjectFormatCodeUnknownImageObject";
      break;
    case 14337:
      uint64_t v1 = @"PTPObjectFormatCodeEXIF_JPEG";
      break;
    case 14338:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF_EP";
      break;
    case 14339:
      uint64_t v1 = @"PTPObjectFormatCodeFlashPix";
      break;
    case 14340:
      uint64_t v1 = @"PTPObjectFormatCodeBMP";
      break;
    case 14341:
      uint64_t v1 = @"PTPObjectFormatCodeCIFF";
      break;
    case 14342:
      uint64_t v1 = @"PTPObjectFormatCodeReserved1";
      break;
    case 14343:
      uint64_t v1 = @"PTPObjectFormatCodeGIF";
      break;
    case 14344:
      uint64_t v1 = @"PTPObjectFormatCodeJFIF";
      break;
    case 14345:
      uint64_t v1 = @"PTPObjectFormatCodePCD";
      break;
    case 14346:
      uint64_t v1 = @"PTPObjectFormatCodePICT";
      break;
    case 14347:
      uint64_t v1 = @"PTPObjectFormatCodePNG";
      break;
    case 14348:
      uint64_t v1 = @"PTPObjectFormatCodeReserved2";
      break;
    case 14349:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF";
      break;
    case 14350:
      uint64_t v1 = @"PTPObjectFormatCodeTIFF_IT";
      break;
    case 14351:
      uint64_t v1 = @"PTPObjectFormatCodeJP2";
      break;
    case 14352:
      uint64_t v1 = @"PTPObjectFormatCodeJPX";
      break;
    default:
      int v2 = a1 - 12288;
      uint64_t v1 = @"PTPObjectFormatCodeUndefinedNonImageObject";
      switch(v2)
      {
        case 0:
          goto LABEL_40;
        case 1:
          uint64_t v1 = @"PTPObjectFormatCodeAssociation";
          break;
        case 2:
          uint64_t v1 = @"PTPObjectFormatCodeScript";
          break;
        case 3:
          uint64_t v1 = @"PTPObjectFormatCodeExecutable";
          break;
        case 4:
          uint64_t v1 = @"PTPObjectFormatCodeText";
          break;
        case 5:
          uint64_t v1 = @"PTPObjectFormatCodeHTML";
          break;
        case 6:
          uint64_t v1 = @"PTPObjectFormatCodeDPOF";
          break;
        case 7:
          uint64_t v1 = @"PTPObjectFormatCodeAIFF";
          break;
        case 8:
          uint64_t v1 = @"PTPObjectFormatCodeWAV";
          break;
        case 9:
          uint64_t v1 = @"PTPObjectFormatCodeMP3";
          break;
        case 10:
          uint64_t v1 = @"PTPObjectFormatCodeAVI";
          break;
        case 11:
          uint64_t v1 = @"PTPObjectFormatCodeMPEG";
          break;
        case 12:
          uint64_t v1 = @"PTPObjectFormatCodeASF";
          break;
        case 13:
          uint64_t v1 = @"PTPObjectFormatCodeMOV";
          break;
        case 14:
          uint64_t v1 = @"PTPObjectFormatCodeXML";
          break;
        default:
          if (((unint64_t)@"PTPObjectFormatCodeUndefinedNonImageObject" & 0xF000) == 0xB000)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"PTPObjectFormatCodeVendorDefined (0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject");
          }
          else if (((unint64_t)@"PTPObjectFormatCodeUndefinedNonImageObject" & 0xF000) == 0x3000)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"PTPObjectFormatCodeReservedForFuture (0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject");
          }
          else
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(0x%04X)", @"PTPObjectFormatCodeUndefinedNonImageObject");
          }
          uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      break;
  }
LABEL_40:

  return v1;
}

__CFString *stringForAssociationType(uint64_t a1)
{
  if (a1 >= 8)
  {
    if ((a1 & 0xF000) == 0x8000)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"PTPAssociationTypeVendorDefined (0x%04X)", a1);
    }
    else if ((a1 & 0xF000) != 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(0x%04X)", a1);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"PTPAssociationTypeReserved (0x%04X)", a1);
    }
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_1E63D7620[(__int16)a1];
  }

  return v1;
}

CGImageRef ICCreateRotatedImageFromCGImage(unint64_t a1, CGImageRef image)
{
  int v2 = image;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if (!image) {
    return v2;
  }
  size_t Width = CGImageGetWidth(image);
  size_t Height = CGImageGetHeight(v2);
  ColorSpace = CGImageGetColorSpace(v2);
  id v7 = ColorSpace;
  if (a1 - 9 < 0xFFFFFFFFFFFFFFF8) {
    unint64_t v8 = 1;
  }
  else {
    unint64_t v8 = a1;
  }
  BOOL v9 = CGColorSpaceGetNumberOfComponents(ColorSpace) != 1;
  if (v8 <= 4) {
    size_t v10 = Height;
  }
  else {
    size_t v10 = Width;
  }
  if (v8 <= 4) {
    size_t v11 = Width;
  }
  else {
    size_t v11 = Height;
  }
  v12 = CGBitmapContextCreate(0, v11, v10, 8uLL, v11 << (2 * v9), v7, 2 * v9);
  if (v12)
  {
    v13 = v12;
    v18[0] = 0x3FF0000000000000;
    v18[1] = 0;
    v18[2] = 0;
    v18[3] = 0x3FF0000000000000;
    v18[4] = 0;
    v18[5] = 0;
    v18[6] = 0xBFF0000000000000;
    v18[7] = 0;
    v18[8] = 0;
    v18[9] = 0x3FF0000000000000;
    *(double *)&v18[10] = (double)Width;
    long long v19 = xmmword_1BEF3F1A0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    unint64_t v22 = 0xBFF0000000000000;
    double v23 = (double)Width;
    double v24 = (double)Height;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v25 = 0x3FF0000000000000;
    long long v28 = xmmword_1BEF3F1B0;
    long long v30 = xmmword_1BEF3F1A0;
    long long v31 = xmmword_1BEF3F1B0;
    double v29 = (double)Height;
    double v32 = (double)Height;
    double v33 = (double)Width;
    long long v34 = xmmword_1BEF3F1A0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v35 = 0x3FF0000000000000;
    double v38 = (double)Width;
    long long v39 = xmmword_1BEF3F1C0;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v40 = 0x3FF0000000000000;
    uint64_t v43 = 0x3FF0000000000000;
    long long v44 = xmmword_1BEF3F1B0;
    double v45 = (double)Height;
    uint64_t v46 = 0;
    v14 = &v18[6 * v8];
    long long v15 = *((_OWORD *)v14 - 2);
    *(_OWORD *)&v17.a = *((_OWORD *)v14 - 3);
    *(_OWORD *)&v17.c = v15;
    *(_OWORD *)&v17.tx = *((_OWORD *)v14 - 1);
    CGContextConcatCTM(v12, &v17);
    v49.origin.x = 0.0;
    v49.origin.y = 0.0;
    v49.size.width = (double)Width;
    v49.size.height = (double)Height;
    CGContextDrawImage(v13, v49, v2);
    int v2 = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    return v2;
  }

  return CGImageRetain(v2);
}

id ICStandardDateFromPTPString(void *a1)
{
  if (a1)
  {
    memset(&v3, 0, sizeof(v3));
    v3.tm_isdst = -1;
    strptime_l((const char *)objc_msgSend(a1, "UTF8String", 0, 0, 0, 0, *(void *)&v3.tm_isdst, 0, 0), "%Y%m%dT%H%M%S.0", &v3, 0);
    a1 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)mktime(&v3)];
    uint64_t v1 = vars8;
  }
  return a1;
}

void ICPerformBlockOnMainThread(dispatch_block_t block)
{
}

void sub_1BEF18538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose((const void *)(v70 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF1A260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

id ICLocalizedString(void *a1)
{
  uint64_t v1 = ICLocalizedString_once;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&ICLocalizedString_once, &__block_literal_global_5);
  }
  tm v3 = [(id)ICLocalizedString_bundle localizedStringForKey:v2 value:v2 table:@"ImageCaptureCore"];

  return v3;
}

uint64_t __ICLocalizedString_block_invoke()
{
  ICLocalizedString_bundle = [MEMORY[0x1E4F28B50] bundleWithPath:@"/System/Library/Frameworks/ImageCaptureCore.framework"];

  return MEMORY[0x1F41817F8]();
}

void sub_1BEF1C2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF1D7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

uint64_t ICAcessQuery(void *a1, int a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v18 = a1;
  if (a2 >= 1)
  {
    uint64_t v5 = a2;
    CFStringRef v6 = (os_log_t *)&_gICOSLog;
    do
    {
      if (*a3)
      {
        id v7 = objc_msgSend(NSString, "stringWithUTF8String:");
        [v18 addObject:v7];
      }
      __ICOSLogCreate();
      unint64_t v8 = @"adding";
      if ((unint64_t)[@"adding" length] >= 0x15)
      {
        BOOL v9 = objc_msgSend(@"adding", "substringWithRange:", 0, 18);
        unint64_t v8 = [v9 stringByAppendingString:@".."];
      }
      size_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", *a3);
      os_log_t v11 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v6;
        v13 = v8;
        v14 = v11;
        long long v15 = v13;
        CFStringRef v6 = v12;
        uint64_t v16 = [(__CFString *)v15 UTF8String];
        *(_DWORD *)buf = 136446466;
        uint64_t v20 = v16;
        __int16 v21 = 2114;
        unint64_t v22 = v10;
        _os_log_impl(&dword_1BEEFF000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }
      ++a3;
      --v5;
    }
    while (v5);
  }

  return 0;
}

void sub_1BEF1E1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICAcessStatusQuery(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  id v14 = a1;
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  if (a2 >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)(a3 + 8 * v8))
      {
        switch((int)v8)
        {
          case 0:
            size_t v10 = objc_msgSend(NSString, "stringWithUTF8String:");
            os_log_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", *(void *)(a4 + 8 * v8));
            [v7 setObject:v10 forKeyedSubscript:v11];
            goto LABEL_6;
          case 1:
          case 2:
          case 3:
          case 4:
            BOOL v9 = NSNumber;
            size_t v10 = objc_msgSend(NSString, "stringWithUTF8String:");
            os_log_t v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
            v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", *(void *)(a4 + 8 * v8));
            [v7 setObject:v11 forKeyedSubscript:v12];

LABEL_6:
            break;
          default:
            break;
        }
      }
      ++v8;
    }
    while (a2 != v8);
  }
  [v14 addObject:v7];

  return 0;
}

void sub_1BEF1EE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1BEF1F18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return [v0 UTF8String];
}

void sub_1BEF21A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

time_t ICTimeIntervalSince1970FromPTPString(void *a1)
{
  *(_OWORD *)&v2.tm_isdst = 0u;
  v2.tm_isdst = -1;
  strptime_l((const char *)objc_msgSend(a1, "UTF8String", 0, 0, 0, 0, *(void *)&v2.tm_isdst, 0, 0), "%Y%m%dT%H%M%S.0", &v2, 0);
  return mktime(&v2);
}

void sub_1BEF26C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ICMakeLocalizedError(uint64_t a1)
{
  tm v2 = __ICErrorValueDict(a1);
  tm v3 = [v2 objectForKeyedSubscript:@"legacy"];
  if ([v3 length]) {
    CFStringRef v4 = @"legacy";
  }
  else {
    CFStringRef v4 = @"modern";
  }
  uint64_t v5 = [v2 objectForKeyedSubscript:v4];

  CFStringRef v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = ICLocalizedString(v5);
  if (v7) {
    [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  uint64_t v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:a1 userInfo:v6];

  return v8;
}

id ICMakeLocalizedErrorWithCodeAndString(uint64_t a1, void *a2)
{
  tm v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  uint64_t v5 = [v3 dictionary];
  CFStringRef v6 = ICLocalizedString(v4);

  if (v6) {
    [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:a1 userInfo:v5];

  return v7;
}

id ICMakeFormattedLocalizedError(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __ICErrorValueDict(a1);
  uint64_t v5 = [v4 objectForKeyedSubscript:@"legacy"];
  if ([v5 length]) {
    CFStringRef v6 = @"legacy";
  }
  else {
    CFStringRef v6 = @"modern";
  }
  id v7 = [v4 objectForKeyedSubscript:v6];

  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v9 = NSString;
  uint64_t v10 = ICLocalizedString(v7);
  os_log_t v11 = objc_msgSend(v9, "stringWithFormat:", v10, v3);

  if (v11) {
    [v8 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F28568]];
  }
  v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImageCaptureCore" code:a1 userInfo:v8];

  return v12;
}

void sub_1BEF2C9B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BEF31728(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
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

uint64_t __Block_byref_object_copy__333(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1C18A01C0](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__334(uint64_t a1)
{
}

void sub_1BEF355C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_1BEF35BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF35EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF365F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF372D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF37A04(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF37F94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF3854C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BEF38A94(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF39380(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1BEF399BC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

CFUUIDRef CFUUIDCreateWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1F40D89C0](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BF0](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

uint64_t CGImageSourceCopyTypeExtensions()
{
  return MEMORY[0x1F40E9948]();
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

uint64_t MMCSSignatureAndSchemeSize()
{
  return MEMORY[0x1F412C448]();
}

uint64_t MMCSSignatureGeneratorCreateWithBoundaryKey()
{
  return MEMORY[0x1F412C468]();
}

uint64_t MMCSSignatureGeneratorFinish()
{
  return MEMORY[0x1F412C470]();
}

uint64_t MMCSSignatureGeneratorUpdate()
{
  return MEMORY[0x1F412C480]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x1F40F7128](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1F40F7168](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_activate(dispatch_object_t object)
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
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1F40CC330](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40CC8F8](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x1F40CCE30](a1);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40CD830](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1F4182278](filename, ppDb);
}

void srand48(uint64_t a1)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strptime_l(const char *a1, const char *a2, tm *a3, locale_t a4)
{
  return (char *)MEMORY[0x1F40CE228](a1, a2, a3, a4);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

char *__cdecl strtok(char *__str, const char *__sep)
{
  return (char *)MEMORY[0x1F40CE290](__str, __sep);
}

void syslog(int a1, const char *a2, ...)
{
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40CEB18](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1F40CEB90]();
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1F40CEBE8]();
}