uint64_t sub_2268D4028(uint64_t a1, const __CFString *a2, CFArrayRef theArray, const __CFArray *a4, CFMutableArrayRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  CFAllocatorRef v14;
  CFMutableArrayRef Mutable;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFMutableArrayRef v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  CFIndex Count;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFIndex v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFIndex v39;
  CFStringRef ValueAtIndex;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CFStringRef v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  CFAllocatorRef v53;
  char v54;
  CFStringRef v55;
  CFStringRef v56;

  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"OSStatus _BaseStationsBrowsedAndCreatingNetworksVisibleToBaseStation(AutoGuessContextRef, CFDictionaryRef, CFArrayRef, CFArrayRef, CFArrayRef *)", 800, (uint64_t)"\n", (uint64_t)a5, a6, a7, a8, v52);
  }
  v13 = 4294960569;
  if (!theArray) {
    return v13;
  }
  if (!a4) {
    return v13;
  }
  if (!CFArrayGetCount(theArray)) {
    return v13;
  }
  if (!CFArrayGetCount(a4)) {
    return v13;
  }
  v13 = 4294960591;
  if (!a1 || !a5) {
    return v13;
  }
  *a5 = 0;
  v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!Mutable) {
    return 4294960568;
  }
  v20 = Mutable;
  v55 = 0;
  v56 = 0;
  v54 = 0;
  v21 = sub_2268D0E64(a1, a2, 1852787795, &v54, v16, v17, v18, v19);
  v13 = v21;
  if (v54) {
    v22 = v21 == 0;
  }
  else {
    v22 = 0;
  }
  if (v22) {
    v23 = 30;
  }
  else {
    v23 = 22;
  }
  Count = CFArrayGetCount(a4);
  if (Count >= 1)
  {
    v30 = Count;
    v53 = v14;
    v31 = 0;
    while (1)
    {
      sub_22686088C((const __CFString *)a4, (uint64_t)&v56, (UInt8 *)"[*]", v25, v26, v27, v28, v29, v31);
      if (v32)
      {
LABEL_36:
        v13 = v32;
        goto LABEL_42;
      }
      if (!v56) {
        goto LABEL_38;
      }
      if (sub_226901888((uint64_t)v56, (const char *)v23))
      {
        sub_2268CE82C((uint64_t)"Skipping IBSS, non-secure, enterprise, or legacy sec mode network: %@\n", (uint64_t)v56, v33, v34, v35, v36, v37, v38);
      }
      else
      {
        sub_22686088C(v56, (uint64_t)&v55, (UInt8 *)"%kO", v34, v35, v36, v37, v38, @"BSSID");
        if (v32) {
          goto LABEL_36;
        }
        if (!v55)
        {
LABEL_38:
          v13 = 4294960568;
          goto LABEL_42;
        }
        v39 = sub_22685BC94(theArray, v55);
        if (v39 != -1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v39);
          if (!ValueAtIndex)
          {
            v13 = 4294960586;
LABEL_42:
            CFRelease(v20);
            return v13;
          }
          v48 = ValueAtIndex;
          if (!sub_22685B9B4(ValueAtIndex, v41, v42, v43, v44, v45, v46, v47)
            && !sub_22685BF60(a2, v48, v49, v25, v26, v27, v28, v29)
            && (!CFArrayGetCount(v20) || sub_22685BC94(v20, v55) == -1))
          {
            if (sub_2268D1900(a1, v48, v50, v25, v26, v27, v28, v29))
            {
              v32 = sub_226860774(v53, v20, (uint64_t)"%O", v25, v26, v27, v28, v29, (uint64_t)v48);
              if (v32) {
                goto LABEL_36;
              }
            }
          }
        }
      }
      if (v30 == ++v31)
      {
        v13 = 0;
        break;
      }
    }
  }
  if (!CFArrayGetCount(v20))
  {
    v13 = 4294960569;
    goto LABEL_42;
  }
  *a5 = v20;
  return v13;
}

BOOL sub_2268D42D0(const __CFString *a1, CFArrayRef theArray, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"Boolean _WirelessNetworkVisibleInNetworkScan(CFStringRef, CFArrayRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v11);
  }
  BOOL result = 0;
  if (a1)
  {
    if (theArray) {
      return sub_22685BFE8(a1, 0, theArray) != -1;
    }
  }
  return result;
}

uint64_t sub_2268D4364(CFDictionaryRef theDict, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"Boolean _UnconfiguredBaseStationIsSpecifiedByBonjourRecord(CFDictionaryRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  }
  if (!theDict) {
    return 0;
  }
  uint64_t result = CFDictionaryContainsKey(theDict, @"BSAutoGuessContext_ChosenUnconfiguredBrowseRecord");
  if (result) {
    return CFDictionaryContainsKey(theDict, @"BSAutoGuessContext_ChosenUnconfiguredScanRecord") == 0;
  }
  return result;
}

BOOL sub_2268D4408(CFDictionaryRef theDict, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"Boolean _UnconfiguredBaseStationIsSpecifiedByWirelessScanRecord(CFDictionaryRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  }
  return theDict
      && !CFDictionaryContainsKey(theDict, @"BSAutoGuessContext_ChosenUnconfiguredBrowseRecord")
      && CFDictionaryContainsKey(theDict, @"BSAutoGuessContext_ChosenUnconfiguredScanRecord") != 0;
}

BOOL sub_2268D44AC(CFDictionaryRef theDict, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"Boolean _UnconfiguredBaseStationInContextDictionary(CFDictionaryRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v17);
  }
  if (!theDict) {
    return 0;
  }
  if (sub_2268D4364(theDict, a2, a3, a4, a5, a6, a7, a8)) {
    return 1;
  }
  BOOL result = sub_2268D4408(theDict, v9, v10, v11, v12, v13, v14, v15);
  if (result) {
    return 1;
  }
  return result;
}

uint64_t sub_2268D4540(const void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"OSStatus BSAutoGuess_Create(AutoGuessContextRef *)", 800, (uint64_t)"BSAutoGuess_Create\n", a5, a6, a7, a8, v28);
  }
  if (!a1) {
    return 4294960591;
  }
  uint64_t v9 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x1060040837169E1uLL);
  if (!v9) {
    return 4294960568;
  }
  uint64_t v17 = (const void **)v9;
  *(_OWORD *)(v9 + 28) = 0u;
  v18 = v9 + 48;
  *(_OWORD *)uint64_t v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  uint64_t v26 = sub_2268DB560((void *)v9 + 6, v10, v11, v12, v13, v14, v15, v16);
  if (!v26)
  {
    if (*v18)
    {
      uint64_t v26 = 0;
      *a1 = v17;
      return v26;
    }
    uint64_t v26 = 4294960568;
  }
  sub_2268D4634(v17, v19, v20, v21, v22, v23, v24, v25);
  return v26;
}

uint64_t sub_2268D4634(const void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 4294960591;
  }
  uint64_t v9 = *a1;
  if (v9)
  {
    CFRelease(v9);
    *a1 = 0;
  }
  uint64_t v10 = a1[1];
  if (v10)
  {
    CFRelease(v10);
    a1[1] = 0;
  }
  uint64_t v11 = a1[2];
  if (v11)
  {
    CFRelease(v11);
    a1[2] = 0;
  }
  uint64_t v12 = a1[3];
  if (v12)
  {
    CFRelease(v12);
    a1[3] = 0;
  }
  uint64_t v13 = a1[4];
  if (v13)
  {
    CFRelease(v13);
    a1[4] = 0;
  }
  sub_2268DB710(a1[6], a2, a3, a4, a5, a6, a7, a8);
  free(a1);
  return 0;
}

uint64_t sub_2268D46C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"OSStatus BSAutoGuess_SetAssistantCallback(AutoGuessContextRef, assistant_callback_t, void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v13);
  }
  if (!a1) {
    return 4294960591;
  }
  uint64_t v11 = *(void *)(a1 + 48);

  return sub_2268DBF38(v11, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2268D4778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"OSStatus BSAutoGuess_SetProgressCallback(AutoGuessContextRef, assistant_progress_t, void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v13);
  }
  if (!a1) {
    return 4294960591;
  }
  uint64_t v11 = *(void *)(a1 + 48);

  return sub_2268DC4C4(v11, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2268D4828(uint64_t *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"OSStatus BSAutoGuess_PerformGuess(AutoGuessContextRef, CFDictionaryRef)", 800, (uint64_t)"Auto Guess START\n", a5, a6, a7, a8, v24);
  }
  uint64_t result = 4294960591;
  if (a1 && theDict)
  {
    if (CFDictionaryGetCount(theDict))
    {
      *a1 = (uint64_t)theDict;
      CFRetain(theDict);
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
      a1[1] = (uint64_t)Mutable;
      if (Mutable)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        dispatch_async_f(global_queue, a1, (dispatch_function_t)sub_2268D4938);
        uint64_t result = sub_2268DBB2C(a1[6], v13, v14, v15, v16, v17, v18, v19);
        if (!result)
        {
          sub_2268DC568(a1[6], 17, 0, 0, v20, v21, v22, v23);
          return 0;
        }
      }
      else
      {
        return 4294960568;
      }
    }
    else
    {
      return 4294960591;
    }
  }
  return result;
}

int *sub_2268D4938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFStringRef ValueAtIndex = 0;
  CFStringRef v1130 = 0;
  CFStringRef v1128 = 0;
  CFTypeRef v1124 = 0;
  CFTypeRef v1125 = 0;
  int v1126 = -1;
  int v1127 = -1;
  CFDictionaryRef theDict = 0;
  CFArrayRef theArray = 0;
  v1121 = 0;
  CFIndex v1131 = 0;
  uint64_t v9 = (CFAllocatorRef *)MEMORY[0x263EFFB08];
  if (!a1 || (CFDictionaryRef v10 = *(const __CFDictionary **)a1) == 0 || !CFDictionaryGetCount(v10))
  {
    CFArrayRef Mutable = 0;
    goto LABEL_8;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"BSAutoGuessContext_HostCurrentWirelessAssociation");
  CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"BSAutoGuessContext_HostPreferredNetworks");
  uint64_t v13 = CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"BSAutoGuessContext_HostPrevConfigFiles");
  *(void *)(a1 + 24) = CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"BSAutoGuessContext_HostBrowsedBaseStations");
  *(void *)(a1 + 16) = CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"BSAutoGuessContext_CachedBaseStationSettings");
  *(void *)(a1 + 32) = CFDictionaryGetValue(*(CFDictionaryRef *)a1, @"BSAutoGuessContext_HostScannedNetworks");
  BOOL v21 = sub_2268CF8A4(*(const __CFString **)a1, v14, v15, v16, v17, v18, v19, v20);
  BOOL v29 = sub_2268CF948(*(const __CFString **)a1, v22, v23, v24, v25, v26, v27, v28);
  CFAllocatorRef v30 = *v9;
  CFArrayRef Mutable = CFArrayCreateMutable(*v9, 0, MEMORY[0x263EFFF70]);
  if (!Mutable)
  {
LABEL_8:
    CFDictionaryRef v34 = 0;
    uint64_t v35 = 4294960591;
LABEL_9:
    char v36 = 1;
    goto LABEL_10;
  }
  CFDictionaryRef v32 = *(const __CFDictionary **)(a1 + 16);
  if (v32) {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v30, 0, v32);
  }
  else {
    CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(v30, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  }
  *(void *)(a1 + 16) = MutableCopy;
  if (!MutableCopy
    || ((CFArrayRef v37 = *(const __CFArray **)(a1 + 24)) == 0
      ? (CFMutableArrayRef v38 = CFArrayCreateMutable(v30, 0, MEMORY[0x263EFFF70]))
      : (CFMutableArrayRef v38 = CFArrayCreateMutableCopy(v30, 0, v37)),
        (*(void *)(a1 + 24) = v38) == 0
     || ((CFArrayRef v39 = *(const __CFArray **)(a1 + 32)) == 0
       ? (CFMutableArrayRef v40 = CFArrayCreateMutable(v30, 0, MEMORY[0x263EFFF70]))
       : (CFMutableArrayRef v40 = CFArrayCreateMutableCopy(v30, 0, v39)),
         (*(void *)(a1 + 32) = v40) == 0)))
  {
    CFDictionaryRef v34 = 0;
    uint64_t v35 = 4294960568;
    goto LABEL_9;
  }
  BOOL v1118 = v29;
  v1119 = v13;
  if (dword_268147A98 >= 801)
  {
    BOOL v43 = Value != 0;
  }
  else
  {
    if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"State machine starting... \n", a5, a6, a7, a8, v1110);
    }
    int v42 = dword_268147A98;
    BOOL v43 = Value != 0;
    if (Value && dword_268147A98 <= 800)
    {
      if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"currentAssociationNetworkDict: %@\n", a5, a6, a7, a8, (uint64_t)Value);
      }
      int v42 = dword_268147A98;
    }
    if (v12 && v42 <= 800)
    {
      if (v42 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"myHostPreferredNetworks: %@\n", a5, a6, a7, a8, (uint64_t)v12);
      }
      int v42 = dword_268147A98;
    }
    if (v1119 && v42 <= 800 && (v42 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"myHostPreviousConfigFiles: %@\n", a5, a6, a7, a8, (uint64_t)v1119);
    }
    if (dword_268147A98 <= 800)
    {
      if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"noWirelessOnHost: %d\n", a5, a6, a7, a8, v21);
      }
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"hostHasPreferredNetworkSupport: %d\n", a5, a6, a7, a8, v29);
      }
    }
  }
  sub_2268CDB94((uint64_t)"obj->browsedBaseStations: \n", *(CFArrayRef *)(a1 + 24), v41, a4, a5, a6, a7, a8);
  sub_2268CE084((uint64_t)"obj->scannedNetworks: \n", *(CFArrayRef *)(a1 + 32), v44, v45, v46, v47, v48, v49);
  BOOL v1117 = v43;
  if (!v43) {
    goto LABEL_62;
  }
  v1132[0] = 0;
  sub_22686088C(Value, (uint64_t)v1132, (UInt8 *)"%kO", v50, v51, v52, v53, v54, @"SSID_STR");
  uint64_t v35 = v55;
  if (v55)
  {
LABEL_64:
    CFDictionaryRef v34 = 0;
    goto LABEL_9;
  }
  if (!v1132[0])
  {
LABEL_946:
    uint64_t v35 = 4294960568;
    goto LABEL_64;
  }
  if (sub_22685BFE8((const __CFString *)v1132[0], 0, *(CFArrayRef *)(a1 + 32)) == -1)
  {
    uint64_t v35 = sub_2268DDFAC(*(void *)(a1 + 48), (const __CFString *)v1132[0], 3, (CFTypeRef *)&theDict, v56, v57, v58, v59);
    if (v35) {
      goto LABEL_64;
    }
    if (theDict)
    {
      uint64_t v35 = sub_226860774(v30, *(__CFArray **)(a1 + 32), (uint64_t)"%O", a4, a5, a6, a7, a8, (uint64_t)theDict);
      if (theDict)
      {
        CFRelease(theDict);
        CFDictionaryRef theDict = 0;
      }
      if (v35) {
        goto LABEL_64;
      }
      goto LABEL_62;
    }
    goto LABEL_946;
  }
LABEL_62:
  uint64_t v60 = sub_2268DF7FC(*(void *)(a1 + 48), 300);
  if (v60)
  {
    uint64_t v35 = v60;
    goto LABEL_64;
  }
  sub_2268DC568(*(void *)(a1 + 48), 15, 0, 0, a5, a6, a7, a8);
  if (sub_2268DBC88(*(void *)(a1 + 48)))
  {
    char v36 = 0;
    CFDictionaryRef v34 = 0;
    uint64_t v35 = 4294960573;
    goto LABEL_10;
  }
  CFArrayRef v1114 = v12;
  v63 = "(%d) No unconfigured networks are visible because Wi-Fi is disabled.";
  CFDictionaryRef v34 = 0;
  CFStringRef v1116 = 0;
  BOOL v1115 = v21;
  if (!v21) {
    v63 = "(%d) No unconfigured networks are visible in Wi-Fi scans.";
  }
  uint64_t v1112 = 0;
  v1113 = v63;
  uint64_t v64 = 1;
  v65 = v1119;
  while ((int)v64 <= 601)
  {
    if ((int)v64 > 400)
    {
      switch((int)v64)
      {
        case 501:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 501);
          }
          CFIndex v1131 = 0;
          uint64_t v66 = sub_2268D0CEC(a1, v1130, 0, &v1131, a5, a6, a7, a8);
          if (v66)
          {
            uint64_t v35 = v66;
            if (v66 != -6727)
            {
              char v36 = 0;
              goto LABEL_10;
            }
          }
          if (v1131)
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) An Ethernet port of the base station named \"%@\" is plugged in.", v67, v68, a4, a5, a6, a7, a8, 501);
            uint64_t v64 = 502;
            v74 = "BASE_HAS_WAN_PLUGGED_IN_TRUE";
          }
          else
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) An Ethernet port of the base station named \"%@\" is not plugged in.", v67, v68, a4, a5, a6, a7, a8, 501);
            uint64_t v64 = 504;
            v74 = "BASE_HAS_WAN_PLUGGED_IN_FALSE";
          }
          sub_2268DB160(Mutable, byte_268148398, v74, v69, v70, v71, v72, v73);
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 501;
          break;
        case 502:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 502);
          }
          if (sub_2268CE948(v1130, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v230, v231, v232, v233, v234, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) A PPPoE server is available to the base station named \"%@\".", v228, v229, v230, v231, v232, v233, v234, 502);
            uint64_t v64 = 1701;
            v240 = "BASE_HAS_PPPOE_AVAILABLE_TRUE";
          }
          else
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v230, v231, v232, v233, v234, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) A PPPoE server is not available to the base station named \"%@\".", v228, v229, v230, v231, v232, v233, v234, 502);
            uint64_t v64 = 505;
            v240 = "BASE_HAS_PPPOE_AVAILABLE_FALSE";
          }
          sub_2268DB160(Mutable, byte_268148398, v240, v235, v236, v237, v238, v239);
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 502;
          break;
        case 503:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 503);
          }
          CFIndex v1131 = 0;
          uint64_t v241 = sub_2268A89F4((uint64_t)v1130, @"local.", @"_airport._tcp", 0, 2u, 1, (CFTypeRef *)&theDict);
          if (v241 == -6735) {
            goto LABEL_755;
          }
          uint64_t v35 = v241;
          v1132[0] = 0;
          if (v241) {
            goto LABEL_1097;
          }
          if (!theDict) {
            goto LABEL_1126;
          }
          CFIndex Count = CFDictionaryGetCount(theDict);
          CFDictionaryRef v242 = theDict;
          if (Count)
          {
            sub_2268CE438((uint64_t)"State 501 remote browse results \n", theDict, v243, a4, a5, a6, a7, a8);
            uint64_t v35 = sub_2268D01CC(theDict, v1132, v245, v246, v247, v248, v249, v250);
            if (theDict)
            {
              CFRelease(theDict);
              CFDictionaryRef theDict = 0;
            }
            if (v35)
            {
LABEL_1097:
              char v36 = 0;
              goto LABEL_10;
            }
            if (!v1132[0]) {
              goto LABEL_1126;
            }
            uint64_t v35 = sub_2268D3DF4(a1, v1132[0], *(const __CFArray **)(a1 + 24), *(const __CFArray **)(a1 + 32), &theArray);
            if (v1132[0])
            {
              CFRelease(v1132[0]);
              v1132[0] = 0;
            }
            if (v35 == -6727)
            {
              CFIndex v1131 = 0;
            }
            else
            {
              if (v35) {
                goto LABEL_1097;
              }
              if (!theArray)
              {
LABEL_1126:
                char v36 = 0;
                uint64_t v35 = 4294960568;
                goto LABEL_10;
              }
              CFIndex v1131 = CFArrayGetCount(theArray);
            }
          }
          else if (theDict)
          {
            CFRelease(theDict);
            CFDictionaryRef theDict = 0;
          }
LABEL_755:
          if (v1131 == 1)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
            CFStringRef v730 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
            uint64_t v736 = sub_2268CFFE8(v730, *(const __CFArray **)(a1 + 24), &ValueAtIndex, v731, v732, v733, v734, v735);
            if (v736)
            {
              uint64_t v35 = v736;
              if (v736 != -6727) {
                goto LABEL_1097;
              }
            }
            if (!ValueAtIndex) {
              goto LABEL_1192;
            }
            CFRetain(ValueAtIndex);
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (ValueAtIndex) {
              sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v739, v740, v741, v742, v743, (uint64_t)"name");
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v739, v740, v741, v742, v743, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) One base station named \"%@\" is detected on the WAN port of the base station named \"%@\".", v737, v738, v739, v740, v741, v742, v743, 503);
            sub_2268DB33C(Mutable, byte_268148398, "NUMBER_BASE_STATIONS_ON_WAN_PORT_IS_ONE_TRUE", v1131, v755, v756, v757, v758);
            uint64_t v64 = 1501;
          }
          else if (v1131)
          {
            if (v1131 < 2)
            {
              uint64_t v64 = 503;
            }
            else
            {
              if (sub_2268D35F8(a1, theArray, (uint64_t *)&ValueAtIndex, a4, a5, a6, a7, a8) == -6727)
              {
                v1132[0] = (__CFArray *)&stru_26DA6BE88;
                if (v1130) {
                  sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v746, v747, v748, v749, v750, (uint64_t)"name");
                }
                sub_2268CDAF0("(%d) %d base stations are detected on the WAN port of the base station named \"%@\". However, one could not be automatically chosen as a canidate for extension.", v744, v745, v746, v747, v748, v749, v750, 503);
                sub_2268DB33C(Mutable, byte_268148398, "NUMBER_BASE_STATIONS_ON_WAN_PORT_IS_GREATER_THAN_ONE_TRUE", v1131, v751, v752, v753, v754);
                CFTypeRef v1124 = theArray;
                CFRetain(theArray);
                uint64_t v64 = 1502;
              }
              else
              {
                uint64_t v766 = sub_2268CFFE8(ValueAtIndex, *(const __CFArray **)(a1 + 24), &ValueAtIndex, v746, v747, v748, v749, v750);
                if (v766)
                {
                  uint64_t v35 = v766;
                  if (v766 != -6727) {
                    goto LABEL_1097;
                  }
                }
                if (!ValueAtIndex)
                {
LABEL_1192:
                  char v36 = 0;
                  uint64_t v35 = 4294960569;
                  goto LABEL_10;
                }
                CFRetain(ValueAtIndex);
                v1132[0] = (__CFArray *)&stru_26DA6BE88;
                if (v1130) {
                  sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v769, v770, v771, v772, v773, (uint64_t)"name");
                }
                v1132[0] = (__CFArray *)&stru_26DA6BE88;
                if (ValueAtIndex) {
                  sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v769, v770, v771, v772, v773, (uint64_t)"name");
                }
                sub_2268CDAF0("(%d) %d base stations are detected on the WAN port of the base station named \"%@\". The base station named \"%@\" was automatically chosen as a canidate for extension.", v767, v768, v769, v770, v771, v772, v773, 503);
                sub_2268DB33C(Mutable, byte_268148398, "NUMBER_BASE_STATIONS_ON_WAN_PORT_IS_GREATER_THAN_ONE_TRUE", v1131, v873, v874, v875, v876);
                uint64_t v64 = 1501;
              }
              v65 = v1119;
            }
          }
          else
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) No base stations are detected on the WAN port of the base station named \"%@\".", (uint64_t)v242, v243, a4, a5, a6, a7, a8, 503);
            sub_2268DB33C(Mutable, byte_268148398, "NUMBER_BASE_STATIONS_ON_WAN_PORT_IS_ZERO_TRUE", v1131, v726, v727, v728, v729);
            uint64_t v64 = 504;
          }
          if (theArray)
          {
            CFRelease(theArray);
            CFArrayRef theArray = 0;
          }
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 503;
          break;
        case 504:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 504);
          }
          CFIndex v1131 = sub_2268CED94(*(CFArrayRef *)(a1 + 24), (uint64_t)v61, v62, a4, a5, a6, a7, a8);
          if (v1131)
          {
            sub_2268CDAF0("(%d) %d existing base stations have been found.", v251, v252, v253, v254, v255, v256, v257, 504);
            uint64_t v64 = 401;
            v263 = "HOST_BASE_STATIONS_BROWSED_TRUE";
          }
          else
          {
            sub_2268CDAF0("(%d) No existing base stations have been found.", v251, v252, v253, v254, v255, v256, v257, 504);
            uint64_t v64 = 700;
            v263 = "HOST_BASE_STATIONS_BROWSED_FALSE";
          }
          sub_2268DB160(Mutable, byte_268148398, v263, v258, v259, v260, v261, v262);
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 504;
          break;
        case 505:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 505);
          }
          if (sub_2268CEA08(v1130, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v266, v267, v268, v269, v270, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The base station named \"%@\" has a DHCP lease.", v264, v265, v266, v267, v268, v269, v270, 505);
            uint64_t v64 = 506;
            v276 = "BASE_HAS_DHCP_LEASE_TRUE";
          }
          else
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v266, v267, v268, v269, v270, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The base station named \"%@\" does not have a DHCP lease.", v264, v265, v266, v267, v268, v269, v270, 505);
            uint64_t v64 = 503;
            v276 = "BASE_HAS_DHCP_LEASE_FALSE";
          }
          sub_2268DB160(Mutable, byte_268148398, v276, v271, v272, v273, v274, v275);
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 505;
          break;
        case 506:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 506);
          }
          if (sub_2268D177C(a1, v1130, v62, a4, a5, a6, a7, a8))
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v279, v280, v281, v282, v283, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The base station named \"%@\" has a public routable IP address.", v277, v278, v279, v280, v281, v282, v283, 506);
            uint64_t v64 = 1701;
            v289 = "BASE_HAS_PUBLIC_ROUTABLE_IP_TRUE";
          }
          else
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v279, v280, v281, v282, v283, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The base station named \"%@\" does not have a public routable IP address.", v277, v278, v279, v280, v281, v282, v283, 506);
            uint64_t v64 = 503;
            v289 = "BASE_HAS_PUBLIC_ROUTABLE_IP_FALSE";
          }
          sub_2268DB160(Mutable, byte_268148398, v289, v284, v285, v286, v287, v288);
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 506;
          break;
        default:
          switch((int)v64)
          {
            case 401:
              if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
                sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 401);
              }
              sub_2268DC568(*(void *)(a1 + 48), 15, 0, 0, a5, a6, a7, a8);
              uint64_t v139 = sub_2268D4028(a1, v1130, *(CFArrayRef *)(a1 + 24), *(const __CFArray **)(a1 + 32), &theArray, v136, v137, v138);
              if (v139)
              {
                uint64_t v35 = v139;
                if (v139 != -6727) {
                  goto LABEL_1184;
                }
                CFIndex v1131 = 0;
LABEL_482:
                sub_2268CDAF0("(%d) No existing configured base stations are creating a network.", v140, v141, a4, a5, a6, a7, a8, 401);
                sub_2268DB160(Mutable, byte_268148398, "HOST_BROWSED_BASE_STATIONS_CREATING_NETWORK_IS_ZERO_TRUE", v493, v494, v495, v496, v497);
                uint64_t v64 = 403;
                goto LABEL_483;
              }
              if (!theArray) {
                goto LABEL_1185;
              }
              CFIndex v492 = CFArrayGetCount(theArray);
              CFIndex v1131 = v492;
              if (v492 != 1)
              {
                if (!v492) {
                  goto LABEL_482;
                }
                if (v492 < 2)
                {
                  uint64_t v64 = 401;
                  goto LABEL_483;
                }
                CFTypeRef cf = 0;
                sub_2268CDB94((uint64_t)"State 401 count >= 2 configed bases creating network: \n", theArray, v141, a4, a5, a6, a7, a8);
                uint64_t v35 = sub_2268D3474(a1, 1, theArray, (__CFArray **)&cf, v713, v714, v715, v716);
                if (theArray) {
                  CFRelease(theArray);
                }
                CFArrayRef theArray = (CFArrayRef)cf;
                if (v35 != -6727)
                {
                  if (v35) {
                    goto LABEL_1184;
                  }
                  if (!cf)
                  {
LABEL_1185:
                    char v36 = 0;
                    uint64_t v35 = 4294960568;
                    goto LABEL_10;
                  }
                  CFIndex v717 = CFArrayGetCount((CFArrayRef)cf);
                  CFIndex v1131 = v717;
                  if (v717 == 1)
                  {
                    sub_2268CDB94((uint64_t)"State 401 (2) count == 1 configed base creating network: \n", theArray, v719, v720, a5, a6, a7, a8);
                    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
                    CFRetain(ValueAtIndex);
                    CFStringRef v889 = ValueAtIndex;
                    v1132[0] = (__CFArray *)&stru_26DA6BE88;
                    if (ValueAtIndex)
                    {
                      sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v884, v885, v886, v887, v888, (uint64_t)"name");
                      CFStringRef v889 = ValueAtIndex;
                    }
                    sub_2268CDB3C(v889, v882, v883, v884, v885, v886, v887, v888);
                    sub_2268CDAF0("(%d) One non G-Only configured base station named \"%@\" is creating a network called \"%@\".", v914, v915, v916, v917, v918, v919, v920, 401);
                    sub_2268DB160(Mutable, byte_268148398, "HOST_BROWSED_BASE_STATIONS_CREATING_NETWORK_IS_ONE_TRUE", v921, v922, v923, v924, v925);
LABEL_936:
                    uint64_t v64 = 402;
                    goto LABEL_937;
                  }
                  if (!v717)
                  {
                    sub_2268CDAF0("(%d) No non G-Only configured base stations are creating a network.", v718, v719, v720, a5, a6, a7, a8, 401);
                    sub_2268DB160(Mutable, byte_268148398, "HOST_BROWSED_BASE_STATIONS_CREATING_NETWORK_IS_ZERO_TRUE", v721, v722, v723, v724, v725);
                    uint64_t v64 = 403;
LABEL_937:
                    v65 = v1119;
                    goto LABEL_483;
                  }
                  if (v717 >= 2)
                  {
                    sub_2268CDB94((uint64_t)"State 401 (2) count >= 2 non G-Only configed bases creating network: \n", theArray, v719, v720, a5, a6, a7, a8);
                    uint64_t v895 = sub_2268D35F8(a1, theArray, (uint64_t *)&ValueAtIndex, v890, v891, v892, v893, v894);
                    if (v895 == -6727)
                    {
                      sub_2268CDAF0("(%d) %d existing configured base stations are creating networks. However, one could not be automatically chosen.", v896, v897, a4, a5, a6, a7, a8, 401);
                      sub_2268DB33C(Mutable, byte_268148398, "HOST_BROWSED_BASE_STATIONS_CREATING_NETWORK_IS_GREATER_THAN_ONE_TRUE", v1131, v926, v927, v928, v929);
                      CFTypeRef v1124 = theArray;
                      CFRetain(theArray);
                      uint64_t v64 = 1407;
                      goto LABEL_937;
                    }
                    uint64_t v35 = v895;
                    if (v895)
                    {
LABEL_1184:
                      char v36 = 0;
                      goto LABEL_10;
                    }
                    if (!ValueAtIndex) {
                      goto LABEL_1185;
                    }
                    CFRetain(ValueAtIndex);
                    CFStringRef v905 = ValueAtIndex;
                    v1132[0] = (__CFArray *)&stru_26DA6BE88;
                    if (ValueAtIndex)
                    {
                      sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v900, v901, v902, v903, v904, (uint64_t)"name");
                      CFStringRef v905 = ValueAtIndex;
                    }
                    sub_2268CDB3C(v905, v898, v899, v900, v901, v902, v903, v904);
                    sub_2268CDAF0("(%d) %d existing configured base stations are creating networks. The base station named \"%@\" which creates the network called \"%@\" was automatically chosen.", v930, v931, v932, v933, v934, v935, v936, 401);
                    sub_2268DB33C(Mutable, byte_268148398, "HOST_BROWSED_BASE_STATIONS_CREATING_NETWORK_IS_GREATER_THAN_ONE_TRUE", v1131, v937, v938, v939, v940);
                    goto LABEL_936;
                  }
                }
                uint64_t v64 = 401;
                goto LABEL_937;
              }
              sub_2268CDB94((uint64_t)"State 401 count == 1 configed base creating network: \n", theArray, v141, a4, a5, a6, a7, a8);
              CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
              CFRetain(ValueAtIndex);
              CFStringRef v712 = ValueAtIndex;
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              if (ValueAtIndex)
              {
                sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v707, v708, v709, v710, v711, (uint64_t)"name");
                CFStringRef v712 = ValueAtIndex;
              }
              sub_2268CDB3C(v712, v705, v706, v707, v708, v709, v710, v711);
              sub_2268CDAF0("(%d) One existing configured base station named \"%@\" is creating a network called \"%@\".", v789, v790, v791, v792, v793, v794, v795, 401);
              sub_2268DB160(Mutable, byte_268148398, "HOST_BROWSED_BASE_STATIONS_CREATING_NETWORK_IS_ONE_TRUE", v796, v797, v798, v799, v800);
              uint64_t v64 = 402;
LABEL_483:
              if (theArray)
              {
                CFRelease(theArray);
                CFArrayRef theArray = 0;
              }
              if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                goto LABEL_932;
              }
              uint64_t v385 = 401;
              goto LABEL_931;
            case 402:
              LODWORD(cf) = 0;
              if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
                sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 402);
              }
              LODWORD(cf) = 0;
              sub_2268D2D70(a1, v1130, ValueAtIndex, (int *)&cf, a5, a6, a7, a8);
              switch(cf)
              {
                case 3:
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (ValueAtIndex) {
                    sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (v1130) {
                    sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  sub_2268CDAF0("(%d) The existing base station named \"%@\" is unconfigurable (non-SRP FW) but will be replaced by the new base station named \"%@\"", v346, v347, v348, v349, v350, v351, v352, 402);
                  uint64_t v64 = 1409;
                  v764 = "PREVIOUS_DEVICE_IS_UNCONFIGURABLE_OLD_FW_TRUE";
                  break;
                case 2:
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (ValueAtIndex) {
                    sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (v1130) {
                    sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  sub_2268CDAF0("(%d) The existing base station named \"%@\" is unconfigurable (Q61/P81) but will be replaced by the new base station named \"%@\"", v346, v347, v348, v349, v350, v351, v352, 402);
                  uint64_t v64 = 1408;
                  v764 = "PREVIOUS_DEVICE_IS_UNCONFIGURABLE_Q61_P81_TRUE";
                  break;
                case 1:
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (ValueAtIndex) {
                    sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (v1130) {
                    sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  sub_2268CDAF0("(%d) The existing base station named \"%@\" is inferior to the new base station named \"%@\"", v346, v347, v348, v349, v350, v351, v352, 402);
                  uint64_t v64 = 1402;
                  v764 = "EXISTING_DEVICE_IS_INFERIOR_TRUE";
                  break;
                default:
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (ValueAtIndex) {
                    sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (v1130) {
                    sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v348, v349, v350, v351, v352, (uint64_t)"name");
                  }
                  sub_2268CDAF0("(%d) Existing base station named \"%@\" is not inferior to the new base station named \"%@\"", v346, v347, v348, v349, v350, v351, v352, 402);
                  uint64_t v64 = 1401;
                  v764 = "EXISTING_DEVICE_IS_INFERIOR_FALSE";
                  break;
              }
              sub_2268DB160(Mutable, byte_268148398, v764, v759, v760, v761, v762, v763);
              if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                goto LABEL_932;
              }
              uint64_t v385 = 402;
              goto LABEL_931;
            case 403:
              LOBYTE(cf) = 0;
              if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
                sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 403);
              }
              uint64_t v353 = sub_2268D0E64(a1, v1130, 1112757313, &cf, a5, a6, a7, a8);
              if (v353) {
                goto LABEL_1080;
              }
              if (!(_BYTE)cf) {
                goto LABEL_465;
              }
              CFStringRef v356 = sub_22685AB94(v1130, v354, v355, a4, a5, a6, a7, a8);
              if (v356 < 0x77) {
                goto LABEL_333;
              }
              uint64_t v357 = (uint64_t)v356;
              LOBYTE(v1132[0]) = 0;
              uint64_t v353 = sub_2268D0E64(a1, v1130, 1632923251, v1132, a5, a6, a7, a8);
              if (v353)
              {
LABEL_1080:
                uint64_t v35 = v353;
                char v36 = 0;
                goto LABEL_10;
              }
              if (!LOBYTE(v1132[0]))
              {
                if (dword_268147A98 <= 800
                  && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)))
                {
                  sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"Ignoring kACPFeatureCodeBeingSTA for this product id:(%d)", a5, a6, a7, a8, v357);
                }
                LOBYTE(cf) = 0;
              }
LABEL_333:
              if ((_BYTE)cf)
              {
                v1132[0] = (__CFArray *)&stru_26DA6BE88;
                if (v1130) {
                  sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
                }
                sub_2268CDAF0("(%d) Chosen base station named \"%@\" supports STA mode", v354, v355, a4, a5, a6, a7, a8, 403);
                uint64_t v64 = 404;
                v363 = "CHOSEN_BASE_STATION_SUPPORTS_STA_TRUE";
              }
              else
              {
LABEL_465:
                v1132[0] = (__CFArray *)&stru_26DA6BE88;
                if (v1130) {
                  sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
                }
                sub_2268CDAF0("(%d) Chosen base station named \"%@\" does not support STA mode", v354, v355, a4, a5, a6, a7, a8, 403);
                uint64_t v64 = 700;
                v363 = "CHOSEN_BASE_STATION_SUPPORTS_STA_FALSE";
              }
              sub_2268DB160(Mutable, byte_268148398, v363, v358, v359, v360, v361, v362);
              if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                goto LABEL_932;
              }
              uint64_t v385 = 403;
              goto LABEL_931;
            case 404:
              if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
                sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 404);
              }
              uint64_t v364 = sub_2268D31AC(a1, *(CFArrayRef *)(a1 + 24), *(const __CFArray **)(a1 + 32), &theArray, a5, a6, a7, a8);
              if (v364)
              {
                uint64_t v35 = v364;
                if (v364 != -6727) {
                  goto LABEL_1256;
                }
                CFIndex v1131 = 0;
LABEL_344:
                sub_2268CDAF0("(%d) No existing configured base stations are joined to a network.", v365, v366, a4, a5, a6, a7, a8, 404);
                uint64_t v64 = 700;
                v372 = "NUMBER_BROWSED_BASE_STATIONS_IN_STA_MODE_NETWORKS_IS_ZERO_TRUE";
LABEL_499:
                sub_2268DB160(Mutable, byte_268148398, v372, v367, v368, v369, v370, v371);
                goto LABEL_500;
              }
              if (!theArray) {
                goto LABEL_1125;
              }
              CFIndex v498 = CFArrayGetCount(theArray);
              CFIndex v1131 = v498;
              if (v498 == 1)
              {
                CFStringRef v499 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
                if (!v499) {
                  goto LABEL_1125;
                }
                uint64_t v500 = sub_2268D2110(a1, *(CFArrayRef *)(a1 + 32), v499, 3, (uint64_t *)&theDict, a6, a7, a8);
                if (v500)
                {
                  uint64_t v35 = v500;
LABEL_1256:
                  char v36 = 0;
                  goto LABEL_10;
                }
                if (!theDict)
                {
LABEL_1125:
                  char v36 = 0;
                  uint64_t v35 = 4294960568;
                  goto LABEL_10;
                }
                CFStringRef v1128 = (const __CFString *)theDict;
                CFRetain(theDict);
                if (theDict)
                {
                  CFRelease(theDict);
                  CFDictionaryRef theDict = 0;
                }
                v1132[0] = (__CFArray *)&stru_26DA6BE88;
                if (v1128) {
                  sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v503, v504, v505, v506, v507, @"SSID_STR");
                }
                sub_2268CDAF0("(%d) All the existing configured base stations are joining the same network called \"%@\".", v501, v502, v503, v504, v505, v506, v507, 404);
                uint64_t v64 = 1403;
                v372 = "NUMBER_BROWSED_BASE_STATIONS_IN_STA_MODE_NETWORKS_IS_ONE_TRUE";
                goto LABEL_499;
              }
              if (v498 < 2) {
                goto LABEL_344;
              }
              sub_2268CDAF0("(%d) The existing configured base stations are joined to %d different networks.", v365, v366, a4, a5, a6, a7, a8, 404);
              sub_2268DB33C(Mutable, byte_268148398, "NUMBER_BROWSED_BASE_STATIONS_IN_STA_MODE_NETWORKS_IS_GREATER_THAN_ONE_TRUE", v1131, v669, v670, v671, v672);
              uint64_t v35 = sub_2268D2324(a1, *(const __CFArray **)(a1 + 32), theArray, (__CFArray **)&v1124, v673, v674, v675, v676);
              if (theArray)
              {
                CFRelease(theArray);
                CFArrayRef theArray = 0;
              }
              if (v35)
              {
LABEL_1015:
                char v36 = 0;
                goto LABEL_10;
              }
              uint64_t v64 = 1406;
              if (!v1124)
              {
                char v36 = 0;
                uint64_t v35 = 4294960568;
                goto LABEL_10;
              }
              v65 = v1119;
LABEL_500:
              if (theArray)
              {
                CFRelease(theArray);
                CFArrayRef theArray = 0;
              }
              if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                goto LABEL_932;
              }
              uint64_t v385 = 404;
              break;
            default:
              goto LABEL_1083;
          }
          break;
      }
LABEL_931:
      sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Exiting state: %d\n********************************************************************************\n\n", a5, a6, a7, a8, v385);
      goto LABEL_932;
    }
    switch((int)v64)
    {
      case 'e':
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 101);
        }
        uint64_t v95 = sub_2268CEBE4(*(CFArrayRef *)(a1 + 24), &theDict, v62, a4, a5, a6, a7, a8);
        if (v95 == -6727)
        {
          CFIndex v1131 = 0;
          v65 = v1119;
LABEL_473:
          sub_2268CDAF0("(%d) No unconfigured base stations are on the current network.", v96, v97, a4, a5, a6, a7, a8, 101);
          uint64_t v64 = 801;
          v115 = "NUMBER_UNCONFIGURED_BASES_DISCOVERED_IS_ZERO_TRUE";
LABEL_474:
          sub_2268DB33C(Mutable, byte_268148398, v115, v1131, v111, v112, v113, v114);
          goto LABEL_475;
        }
        uint64_t v35 = v95;
        if (v95) {
          goto LABEL_1178;
        }
        v65 = v1119;
        if (!theDict)
        {
LABEL_1179:
          char v36 = 0;
          uint64_t v35 = 4294960568;
          goto LABEL_10;
        }
        CFIndex v1131 = CFDictionaryGetCount(theDict);
        sub_2268CE438((uint64_t)"State 101 unconfigured bases: \n", theDict, v98, v99, v100, v101, v102, v103);
        if (v1131 == 1)
        {
          uint64_t v35 = sub_2268CFAF0(theDict, &v1130, v97, a4, a5, a6, a7, a8);
          if (theDict)
          {
            CFRelease(theDict);
            CFDictionaryRef theDict = 0;
          }
          if (v35)
          {
LABEL_1178:
            char v36 = 0;
            goto LABEL_10;
          }
          if (!v1130) {
            goto LABEL_1179;
          }
          CFRetain(v1130);
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v700, v701, v702, v703, v704, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) One unconfigured base station \"%@\" is connected and has been chosen.", v698, v699, v700, v701, v702, v703, v704, 101);
          uint64_t v64 = 102;
          v115 = "NUMBER_UNCONFIGURED_BASES_DISCOVERED_IS_ONE_TRUE";
          goto LABEL_474;
        }
        if (!v1131) {
          goto LABEL_473;
        }
        if (v1131 >= 2)
        {
          uint64_t v35 = sub_2268D2B50(theDict, v1119, &v1130, a4, a5, a6, a7, a8);
          if (theDict)
          {
            CFRelease(theDict);
            CFDictionaryRef theDict = 0;
          }
          if (v35) {
            goto LABEL_1178;
          }
          if (!v1130) {
            goto LABEL_1179;
          }
          CFRetain(v1130);
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v106, v107, v108, v109, v110, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) Found %d unconfigured base stations and automatically chose to configure the base station named \"%@\".", v104, v105, v106, v107, v108, v109, v110, 101);
          uint64_t v64 = 102;
          v115 = "NUMBER_UNCONFIGURED_BASES_DISCOVERED_IS_GREATER_THAN_ONE_TRUE";
          v65 = v1119;
          goto LABEL_474;
        }
        uint64_t v64 = 101;
LABEL_475:
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          break;
        }
        uint64_t v385 = 101;
        goto LABEL_931;
      case 'f':
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 102);
        }
        sub_2268DC568(*(void *)(a1 + 48), 16, 0, (uint64_t)v1130, a5, a6, a7, a8);
        if (sub_2268CEAC8(v1130, v290, v291, v292, v293, v294, v295, v296))
        {
          uint64_t v64 = 1101;
          v304 = "(%d) This base station is an 802.11g model. We don't support it with this software.";
          v305 = "CHOSEN_BASE_STATION_IS_80211G_TRUE";
        }
        else
        {
          BOOL v522 = sub_2268CEB58(v1130, v297, v298, v299, v300, v301, v302, v303);
          BOOL v523 = !v522;
          if (v522) {
            v304 = "(%d) This base station is too new to be set up with this software.";
          }
          else {
            v304 = "(%d) This base station is not an 802.11g model. OK to continue.";
          }
          if (v523) {
            v305 = "CHOSEN_BASE_STATION_IS_80211G_FALSE";
          }
          else {
            v305 = "CHOSEN_BASE_STATION_IS_TOO_NEW_TRUE";
          }
          if (v523) {
            uint64_t v64 = 104;
          }
          else {
            uint64_t v64 = 1104;
          }
        }
        sub_2268CDAF0(v304, v297, v298, v299, v300, v301, v302, v303, 102);
        sub_2268DB160(Mutable, byte_268148398, v305, v524, v525, v526, v527, v528);
        v65 = v1119;
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          break;
        }
        uint64_t v385 = 102;
        goto LABEL_931;
      case 'g':
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 103);
        }
        v65 = v1119;
        if (sub_22685BB54(v1130, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
        {
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v308, v309, v310, v311, v312, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) The chosen base station \"%@\" has a restore profile.", v306, v307, v308, v309, v310, v311, v312, 103);
LABEL_560:
          uint64_t v64 = 602;
          v536 = "TEXT_RECORD_HAS_PROFILE_OR_PREVIOUS_CONFIG_FILE_TRUE";
          goto LABEL_561;
        }
        if (sub_2268CEE5C(v1130, v1119, v307, v308, v309, v310, v311, v312))
        {
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v531, v532, v533, v534, v535, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) The chosen base station \"%@\" has a previous configuration file.", v529, v530, v531, v532, v533, v534, v535, 103);
          goto LABEL_560;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v531, v532, v533, v534, v535, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station \"%@\" does not have a restore profile or previous configuration file.", v529, v530, v531, v532, v533, v534, v535, 103);
        uint64_t v64 = 501;
        v536 = "TEXT_RECORD_HAS_PROFILE_OR_PREVIOUS_CONFIG_FILE_FALSE";
LABEL_561:
        sub_2268DB160(Mutable, byte_268148398, v536, v313, v314, v315, v316, v317);
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          break;
        }
        uint64_t v385 = 103;
        goto LABEL_931;
      case 'h':
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 104);
        }
        if (sub_22685C9CC(v1130, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
        {
          uint64_t v64 = 105;
          v320 = "(%d) This base station is a STA-only device.";
          v321 = "CHOSEN_BASE_STATION_IS_STA_ONLY_TRUE";
          v65 = v1119;
        }
        else
        {
          sub_2268D1A34(a1, v1130, 0, 0, a5, a6, a7, a8);
          v65 = v1119;
          if (v537 == -6768)
          {
            uint64_t v64 = 1102;
            v320 = "(%d) Security error reading chosen base. We don't support it with this software.";
            v321 = "CHOSEN_BASE_STATION_IS_OLDFW_TRUE";
          }
          else
          {
            uint64_t v35 = v537;
            if (v537)
            {
              char v36 = 0;
              goto LABEL_10;
            }
            uint64_t v64 = 103;
            v320 = "(%d) This base station is not a STA-only device.";
            v321 = "CHOSEN_BASE_STATION_IS_STA_ONLY_FALSE";
          }
        }
        sub_2268CDAF0(v320, v318, v319, a4, a5, a6, a7, a8, 104);
        sub_2268DB160(Mutable, byte_268148398, v321, v693, v694, v695, v696, v697);
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          break;
        }
        uint64_t v385 = 104;
        goto LABEL_931;
      case 'i':
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 105);
        }
        CFStringRef v1128 = 0;
        if (!v1117) {
          goto LABEL_373;
        }
        v1132[0] = 0;
        CFTypeRef cf = 0;
        int v322 = sub_22685AAD0((uint64_t)v1116);
        sub_22686088C(Value, (uint64_t)v1132, (UInt8 *)"%kO", v323, v324, v325, v326, v327, @"SSID_STR");
        if (v328)
        {
          uint64_t v35 = v328;
          goto LABEL_1189;
        }
        if (!v1132[0]) {
          goto LABEL_1081;
        }
        CFIndex v329 = sub_22685C0BC((const __CFString *)v1132[0], 3, 0, *(const __CFArray **)(a1 + 32));
        if (v329 == -1)
        {
          uint64_t v35 = 4294960560;
          goto LABEL_1189;
        }
        CFTypeRef cf = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v329);
        if (!cf) {
          goto LABEL_1081;
        }
        if (!v1116 || (v322 - 3) > 1) {
          goto LABEL_299;
        }
        if (sub_226901808((uint64_t)v1116, v330) || !sub_226901850((uint64_t)cf, v61))
        {
          if (!cf) {
            goto LABEL_308;
          }
        }
        else
        {
          uint64_t v765 = sub_2268D2110(a1, *(CFArrayRef *)(a1 + 32), (const __CFString *)v1132[0], 1, (uint64_t *)&cf, a6, a7, a8);
          if (v765 == -6727) {
            goto LABEL_308;
          }
          uint64_t v35 = v765;
          if (v765) {
            goto LABEL_1189;
          }
          if (!cf)
          {
LABEL_1081:
            uint64_t v35 = 4294960568;
LABEL_1189:
            char v36 = 0;
            goto LABEL_10;
          }
        }
        if (sub_22690182C((uint64_t)v1116, v61))
        {
          if (!cf) {
            goto LABEL_308;
          }
        }
        else if (sub_2269017C4((uint64_t)cf, v61) || !cf)
        {
          goto LABEL_308;
        }
LABEL_299:
        CFArrayRef v331 = CFArrayCreateMutable(v30, 1, MEMORY[0x263EFFF70]);
        CFArrayRef theArray = v331;
        if (!v331) {
          goto LABEL_1081;
        }
        CFArrayAppendValue(v331, cf);
        if (v1116) {
          CFDictionaryRef v332 = (const __CFDictionary *)v1116;
        }
        else {
          CFDictionaryRef v332 = (const __CFDictionary *)v1130;
        }
        uint64_t v35 = sub_2268CF77C(theArray, v332, 0);
        if (theArray)
        {
          CFRelease(theArray);
          CFArrayRef theArray = 0;
        }
        if (v35 != -6727)
        {
          if (v35) {
            goto LABEL_1189;
          }
          CFStringRef v1128 = (const __CFString *)cf;
          CFRetain(cf);
        }
LABEL_308:
        if (v1128)
        {
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%ks.%ks", a4, a5, a6, a7, a8, (uint64_t)"txt");
          sub_2268CDAF0("(%d) Current network called \"%@\" will be joined by STA-only device.", v333, v334, v335, v336, v337, v338, v339, 105);
          uint64_t v64 = 1403;
          v345 = "CURRENT_NETWORK_FOR_STA_ONLY_TO_JOIN_IS_TRUE";
        }
        else
        {
LABEL_373:
          sub_2268CDAF0("(%d) No current network for the STA-only device to join.", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 105);
          uint64_t v64 = 700;
          v345 = "CURRENT_NETWORK_FOR_STA_ONLY_TO_JOIN_IS_FALSE";
        }
        sub_2268DB160(Mutable, byte_268148398, v345, v340, v341, v342, v343, v344);
        v65 = v1119;
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          break;
        }
        uint64_t v385 = 105;
        goto LABEL_931;
      default:
        if (v64 != 1)
        {
          v65 = v1119;
          if (v64 != 10)
          {
LABEL_1083:
            if (dword_268147A98 <= 800)
            {
              if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, v64);
              }
              if (dword_268147A98 <= 800)
              {
                if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                  sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"in undefined state %d\n", a5, a6, a7, a8, v64);
                }
                if (dword_268147A98 <= 800)
                {
                  if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
                    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Exiting state: %d\n********************************************************************************\n\n", a5, a6, a7, a8, v64);
                  }
                  char v36 = 0;
                  uint64_t v35 = 4294960564;
                  goto LABEL_10;
                }
              }
            }
            LODWORD(v35) = -6732;
            goto LABEL_1099;
          }
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 10);
          }
          int v162 = sub_2268D4364(*(CFDictionaryRef *)a1, (uint64_t)v61, v62, a4, a5, a6, a7, a8);
          CFDictionaryRef v163 = *(CFDictionaryRef *)a1;
          if (v162)
          {
            sub_22686088C((const __CFString *)v163, (uint64_t)&v1130, (UInt8 *)"%ks", v157, v158, v159, v160, v161, (uint64_t)"BSAutoGuessContext_ChosenUnconfiguredBrowseRecord");
            if (v164) {
              goto LABEL_1171;
            }
            if (!v1130)
            {
LABEL_1176:
              char v36 = 0;
              uint64_t v35 = 4294960568;
              goto LABEL_10;
            }
            CFRetain(v1130);
            sub_2268CE710((uint64_t)"Base station is specified by a bonjour record", (uint64_t)v1130, v165, v166, v167, v168, v169, v170);
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v173, v174, v175, v176, v177, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The base station named \"%@\" was specified with a Bonjour record.", v171, v172, v173, v174, v175, v176, v177, 10);
            uint64_t v64 = 102;
            v183 = "SIG_UNCONFIGURED_BASE_SPECIFIED_BY_BONJOUR_RECORD_TRUE";
            goto LABEL_512;
          }
          if (sub_2268D4408(v163, v155, v156, v157, v158, v159, v160, v161))
          {
            sub_22686088C(*(const __CFString **)a1, (uint64_t)&v1128, (UInt8 *)"%ks", v508, a5, a6, a7, a8, (uint64_t)"BSAutoGuessContext_ChosenUnconfiguredScanRecord");
            if (v164)
            {
LABEL_1171:
              uint64_t v35 = v164;
              char v36 = 0;
              goto LABEL_10;
            }
            if (!v1128) {
              goto LABEL_1176;
            }
            CFRetain(v1128);
            sub_2268CE82C((uint64_t)"Base station is specified by a wireless scan record", (uint64_t)v1128, v509, v510, v511, v512, v513, v514);
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1128) {
              sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v517, v518, v519, v520, v521, @"SSID_STR");
            }
            sub_2268CDAF0("(%d) The base station named \"%@\" was specified with a Wi-Fi scan", v515, v516, v517, v518, v519, v520, v521, 10);
            uint64_t v64 = 807;
            v183 = "SIG_UNCONFIGURED_BASE_SPECIFIED_BY_WIRELESS_SCAN_RECORD_TRUE";
LABEL_512:
            sub_2268DB160(Mutable, byte_268148398, v183, v178, v179, v180, v181, v182);
          }
          else
          {
            uint64_t v64 = 10;
          }
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)))
          {
            uint64_t v385 = 10;
            goto LABEL_931;
          }
          break;
        }
        v65 = v1119;
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1);
        }
        if (sub_2268D44AC(*(CFDictionaryRef *)a1, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
        {
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"Unconfigured base station passed in to state machine", a5, a6, a7, a8, v1110);
          }
          sub_2268CDAF0("(%d) The user chose a specific base station to set up", v373, v374, v375, a5, a6, a7, a8, 1);
          sub_2268DB160(Mutable, byte_268148398, "SIG_UNCONFIGURED_BASE_IN_IOCONTEXT_DICTIONARY_TRUE", v376, v377, v378, v379, v380);
          uint64_t v64 = 10;
        }
        else
        {
          if (dword_268147A98 > 800)
          {
            uint64_t v64 = 101;
            break;
          }
          if (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"(%d) No unconfigured base station passed in to state machine", a5, a6, a7, a8, 1);
          }
          uint64_t v64 = 101;
        }
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)))
        {
          uint64_t v385 = 1;
          goto LABEL_931;
        }
        break;
    }
LABEL_932:
    uint64_t v35 = 4294960573;
    if (sub_2268DBC88(*(void *)(a1 + 48))) {
      goto LABEL_988;
    }
  }
  if ((int)v64 > 800)
  {
    if ((int)v64 > 1200)
    {
      if ((int)v64 <= 1500)
      {
        switch((int)v64)
        {
          case 1401:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1401);
            }
            uint64_t v941 = sub_2268D2734(1401, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_OfferExtendWirelessly", v1130, 0, ValueAtIndex, 0, 0, a1);
            if (v941)
            {
              uint64_t v35 = v941;
              char v36 = 0;
              goto LABEL_10;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (ValueAtIndex) {
              sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) Offer to Extend the existing base station named \"%@\" wirelessly with the chosen base station named \"%@\".", v942, v943, a4, a5, a6, a7, a8, 1401);
            sub_2268DB160(Mutable, byte_268148398, "EXTEND_PREVIOUSLY_CONFIGURED_DEVICE_WIRELESSLY", v1072, v1073, v1074, v1075, v1076);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1402:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1402);
            }
            uint64_t v969 = sub_2268D2734(1402, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_OfferReplace", v1130, 0, ValueAtIndex, 0, 0, a1);
            if (v969)
            {
              uint64_t v35 = v969;
              char v36 = 0;
              goto LABEL_10;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (ValueAtIndex) {
              sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) Offer to Replace the existing base station named \"%@\" with the chosen base station named \"%@\".", v970, v971, a4, a5, a6, a7, a8, 1402);
            sub_2268DB160(Mutable, byte_268148398, "REPLACE_PREVIOUSLY_CONFIGURED_DEVICE", v1077, v1078, v1079, v1080, v1081);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1403:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1403);
            }
            CFArrayRef theArray = 0;
            if (sub_2268D265C(v1130, (uint64_t)v1116, v62, a4, a5, a6, a7, a8))
            {
              CFDictionaryRef v972 = (const __CFDictionary *)(v1116 ? v1116 : v1130);
              uint64_t v973 = sub_2268CF77C(*(CFArrayRef *)(a1 + 32), v972, (CFTypeRef *)&theArray);
              if (v973)
              {
                uint64_t v35 = v973;
                if (v973 != -6727) {
                  goto LABEL_1008;
                }
              }
            }
            uint64_t v35 = sub_2268D2734(1403, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_OfferJoinNetwork", v1130, v1116, 0, v1128, theArray, a1);
            if (theArray)
            {
              CFRelease(theArray);
              CFArrayRef theArray = 0;
            }
            if (v35)
            {
LABEL_1008:
              char v36 = 0;
              goto LABEL_10;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1128) {
              sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", a4, a5, a6, a7, a8, @"SSID_STR");
            }
            if (v1130)
            {
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            else
            {
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              if (v1116) {
                sub_22686088C(v1116, (uint64_t)v1132, (UInt8 *)"%kO", a4, a5, a6, a7, a8, @"SSID_STR");
              }
            }
            sub_2268CDAF0("(%d) Offer to Join the network called \"%@\" with the chosen base station named \"%@\".", v974, v975, a4, a5, a6, a7, a8, 1403);
            sub_2268DB160(Mutable, byte_268148398, "JOIN_WIRELESS_NETWORK", v1102, v1103, v1104, v1105, v1106);
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              goto LABEL_1244;
            }
            goto LABEL_1245;
          case 1404:
          case 1405:
            goto LABEL_1083;
          case 1406:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1406);
            }
            uint64_t v976 = sub_2268D2734(1406, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_AskUserChooseNetworkToJoin", v1130, v1116, 0, 0, (void *)v1124, a1);
            if (v976)
            {
              uint64_t v35 = v976;
              goto LABEL_1015;
            }
            if (v1130)
            {
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            else
            {
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              if (v1116) {
                sub_22686088C(v1116, (uint64_t)v1132, (UInt8 *)"%kO", a4, a5, a6, a7, a8, @"SSID_STR");
              }
            }
            sub_2268CDAF0("(%d) Unable to make a configuration suggestion for the chosen base station or network named \"%@\".", v977, v978, a4, a5, a6, a7, a8, 1406);
            sub_2268DB160(Mutable, byte_268148398, "JOIN_WIRELESS_NETWORK", v1082, v1083, v1084, v1085, v1086);
            if (v1124)
            {
              CFRelease(v1124);
              CFTypeRef v1124 = 0;
            }
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1407:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1407);
            }
            uint64_t v979 = sub_2268D2734(1407, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_AskUserChooseBaseWireless", v1130, 0, 0, 0, (void *)v1124, a1);
            if (v979)
            {
              uint64_t v35 = v979;
              char v36 = 0;
              goto LABEL_10;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) Unable to make a configuration suggestion for the chosen base station named \"%@\".", v980, v981, a4, a5, a6, a7, a8, 1407);
            sub_2268DB160(Mutable, byte_268148398, "EXTEND_PREVIOUSLY_CONFIGURED_DEVICE_WIRELESSLY", v1042, v1043, v1044, v1045, v1046);
            if (v1124)
            {
              CFRelease(v1124);
              CFTypeRef v1124 = 0;
            }
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1408:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1408);
            }
            uint64_t v982 = sub_2268D2734(1408, Mutable, -1, 1, 0, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable", v1130, 0, ValueAtIndex, 0, 0, a1);
            if (v982)
            {
              uint64_t v35 = v982;
              char v36 = 0;
              goto LABEL_10;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (ValueAtIndex) {
              sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) Offer to Replace the existing base station named \"%@\" with the chosen base station named \"%@\" . The existing base station is a Q61 or P81.", v983, v984, a4, a5, a6, a7, a8, 1408);
            sub_2268DB160(Mutable, byte_268148398, "REPLACE_PREVIOUSLY_CONFIGURED_DEVICE_UNCONFIGURABLE", v1087, v1088, v1089, v1090, v1091);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1409:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1409);
            }
            uint64_t v985 = sub_2268D2734(1409, Mutable, -1, 2, 0, @"BSSetupRecommend_OfferReplaceSourceIsUnconfigurable", v1130, 0, ValueAtIndex, 0, 0, a1);
            if (v985)
            {
              uint64_t v35 = v985;
              char v36 = 0;
              goto LABEL_10;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (ValueAtIndex) {
              sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) Offer to Replace the existing base station named \"%@\" with the chosen base station named \"%@\" . The existing base station is unconfigurable.", v986, v987, a4, a5, a6, a7, a8, 1409);
            sub_2268DB160(Mutable, byte_268148398, "REPLACE_PREVIOUSLY_CONFIGURED_DEVICE_UNCONFIGURABLE", v1092, v1093, v1094, v1095, v1096);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          default:
            if (v64 != 1201) {
              goto LABEL_1083;
            }
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1201);
            }
            uint64_t v966 = sub_2268D2B0C(1201, Mutable, a1);
            if (v966)
            {
              uint64_t v35 = v966;
              char v36 = 0;
              goto LABEL_10;
            }
            sub_2268CDAF0("(%d) Cannot find any unconfigured AirPort base stations and all configured devices appear to be functioning normally.", v967, v968, a4, a5, a6, a7, a8, 1201);
            sub_2268DB160(Mutable, byte_268148398, "NOTHING_FOUND_TO_CONFIGURE", v1067, v1068, v1069, v1070, v1071);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
        }
      }
      if ((int)v64 <= 1700)
      {
        if (v64 == 1501)
        {
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1501);
          }
          uint64_t v994 = sub_2268D2734(1501, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_OfferExtendOverEthernet", v1130, 0, ValueAtIndex, 0, 0, a1);
          if (v994)
          {
            uint64_t v35 = v994;
            char v36 = 0;
            goto LABEL_10;
          }
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (ValueAtIndex) {
            sub_22686088C(ValueAtIndex, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
          }
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) Offer to Extend the existing base station named \"%@\" over ethernet with the chosen base station named \"%@\".", v995, v996, a4, a5, a6, a7, a8, 1501);
          sub_2268DB160(Mutable, byte_268148398, "EXTEND_USING_OTHER_BASE_CONFIGURATION_OVER_ETHERNET", v1097, v1098, v1099, v1100, v1101);
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            goto LABEL_1244;
          }
        }
        else
        {
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1502);
          }
          uint64_t v963 = sub_2268D2734(1502, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_AskUserChooseBaseWired", v1130, 0, 0, 0, (void *)v1124, a1);
          if (v963)
          {
            uint64_t v35 = v963;
            char v36 = 0;
            goto LABEL_10;
          }
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) Unable to make a configuration suggestion for the chosen base station named \"%@\".", v964, v965, a4, a5, a6, a7, a8, 1502);
          sub_2268DB160(Mutable, byte_268148398, "ASK_USER_WHAT_TO_DO_2", v1052, v1053, v1054, v1055, v1056);
          if (v1124)
          {
            CFRelease(v1124);
            CFTypeRef v1124 = 0;
          }
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            goto LABEL_1244;
          }
        }
      }
      else if (v64 == 1701)
      {
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1701);
        }
        uint64_t v988 = sub_2268D2734(1701, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_OfferCreate", v1130, 0, 0, 0, 0, a1);
        if (v988)
        {
          uint64_t v35 = v988;
          char v36 = 0;
          goto LABEL_10;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) Offer to Create a Wi-Fi network with the chosen base station named \"%@\".", v989, v990, a4, a5, a6, a7, a8, 1701);
        sub_2268DB160(Mutable, byte_268148398, "OFFER_TO_CREATE_NETWORK", v1057, v1058, v1059, v1060, v1061);
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          goto LABEL_1244;
        }
      }
      else if (v64 == 1801)
      {
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1801);
        }
        uint64_t v991 = sub_2268D2AC8(1801, Mutable, a1);
        if (v991)
        {
          uint64_t v35 = v991;
          char v36 = 0;
          goto LABEL_10;
        }
        sub_2268CDAF0("(%d) The new AirPort base station needs to be plugged in to your current network using an Ethernet cable.", v992, v993, a4, a5, a6, a7, a8, 1801);
        sub_2268DB160(Mutable, byte_268148398, "TELL_USER_CANNOT_FIND_DEVICES", v1062, v1063, v1064, v1065, v1066);
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          goto LABEL_1244;
        }
      }
      else
      {
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1802);
        }
        uint64_t v944 = sub_2268D2734(1802, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_UseAUFor80211g", 0, v1128, 0, 0, 0, a1);
        if (v944)
        {
          uint64_t v35 = v944;
          char v36 = 0;
          goto LABEL_10;
        }
        sub_2268CDAF0("(%d) Use AirPort Utility for 802.11g to configure this network.", v945, v946, a4, a5, a6, a7, a8, 1802);
        sub_2268DB160(Mutable, byte_268148398, "TELL_USER_USE_AU_FOR_80211G", v1047, v1048, v1049, v1050, v1051);
        if (v1128)
        {
          CFRelease(v1128);
          CFStringRef v1128 = 0;
        }
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          goto LABEL_1245;
        }
LABEL_1244:
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Exiting state: %d\n********************************************************************************\n\n", v959, v960, v961, v962, v64);
      }
LABEL_1245:
      uint64_t v1107 = sub_2268FDF58();
      if (!v1107) {
        uint64_t v1107 = sub_2268DBBDC(*(void *)(a1 + 48), v1108, v1109, a4, a5, a6, a7, a8);
      }
      uint64_t v35 = v1107;
      char v36 = 0;
      goto LABEL_10;
    }
    switch((int)v64)
    {
      case 801:
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 801);
        }
        uint64_t v75 = sub_2268CF2EC(*(CFArrayRef *)(a1 + 32), &theDict, v62, a4, a5, a6, a7, a8);
        if (v75 == -6727)
        {
          CFIndex v1131 = 0;
LABEL_356:
          sub_2268CDAF0(v1113, v76, v77, a4, a5, a6, a7, a8, 801);
          sub_2268DB33C(Mutable, byte_268148398, "NUMBER_UNCONFIGURED_APPLE_NETWORKS_VISIBLE_IS_ZERO_TRUE", v1131, v381, v382, v383, v384);
          if (theDict)
          {
            CFRelease(theDict);
            CFDictionaryRef theDict = 0;
          }
          uint64_t v64 = 1201;
          goto LABEL_359;
        }
        uint64_t v35 = v75;
        if (v75) {
          goto LABEL_1254;
        }
        if (!theDict)
        {
          char v36 = 0;
          uint64_t v35 = 4294960568;
          goto LABEL_10;
        }
        CFIndex v1131 = CFDictionaryGetCount(theDict);
        sub_2268CE5A4((uint64_t)"State 801 scan records: \n", theDict, v78, v79, v80, v81, v82, v83);
        if (v1131 != 1)
        {
          if (v1131)
          {
            if (v1131 < 2)
            {
              uint64_t v64 = 801;
            }
            else
            {
              CFDictionaryRef v34 = theDict;
              CFRetain(theDict);
              if (theDict)
              {
                CFRelease(theDict);
                CFDictionaryRef theDict = 0;
              }
              sub_2268CDAF0("(%d) %d unconfigured network are visible in Wi-Fi scans", v84, v85, v86, v87, v88, v89, v90, 801);
              sub_2268DB33C(Mutable, byte_268148398, "NUMBER_UNCONFIGURED_APPLE_NETWORKS_VISIBLE_IS_GREATER_THAN_ONE_TRUE", v1131, v91, v92, v93, v94);
              uint64_t v64 = 806;
            }
            goto LABEL_359;
          }
          goto LABEL_356;
        }
        CFTypeRef cf = 0;
        uint64_t v623 = sub_2268CF9EC(theDict, &cf, v77, a4, a5, a6, a7, a8);
        if (v623)
        {
          uint64_t v35 = v623;
LABEL_1254:
          char v36 = 0;
          goto LABEL_10;
        }
        if (!cf)
        {
          uint64_t v35 = 4294960568;
          goto LABEL_1254;
        }
        CFStringRef v624 = (const __CFString *)CFDictionaryGetValue(theDict, cf);
        CFStringRef v1128 = v624;
        if (!v624)
        {
          uint64_t v35 = 4294960569;
          goto LABEL_1254;
        }
        CFRetain(v624);
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1128) {
          sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v627, v628, v629, v630, v631, @"SSID_STR");
        }
        sub_2268CDAF0("(%d) One unconfigured network called \"%@\" is visible in Wi-Fi scans and has been chosen.", v625, v626, v627, v628, v629, v630, v631, 801);
        sub_2268DB33C(Mutable, byte_268148398, "NUMBER_UNCONFIGURED_APPLE_NETWORKS_VISIBLE_IS_ONE_TRUE", v1131, v632, v633, v634, v635);
        if (theDict)
        {
          CFRelease(theDict);
          CFDictionaryRef theDict = 0;
        }
        uint64_t v64 = 807;
LABEL_359:
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          goto LABEL_932;
        }
        uint64_t v385 = 801;
        break;
      case 802:
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 802);
        }
        if (v1115)
        {
          sub_2268CDAF0("(%d) The computer has wireless disabled and cannot switch networks", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 802);
          sub_2268DB33C(Mutable, byte_268148398, "CAN_SWITCH_NETWORKS_FALSE", v1131, v184, v185, v186, v187);
          uint64_t v64 = 1801;
        }
        else
        {
          CFTypeRef cf = 0;
          sub_2268D1D00(a1, *(CFArrayRef *)(a1 + 24), v62, a4, a5, a6, a7, a8);
          if (v457) {
            goto LABEL_1052;
          }
          sub_2268CE82C((uint64_t)"State 802 join network: \n", (uint64_t)v1128, v458, a4, a5, a6, a7, a8);
          sub_2268DC568(*(void *)(a1 + 48), 5, 0, (uint64_t)v1128, v459, v460, v461, v462);
          uint64_t v467 = sub_2268E0818(*(void *)(a1 + 48), (const char *)v1128, v1112 == 0, &cf, v463, v464, v465, v466);
          if (v467)
          {
            uint64_t v35 = v467;
            goto LABEL_1183;
          }
          if (!cf)
          {
            uint64_t v35 = 4294960568;
            goto LABEL_1183;
          }
          sub_2268DC568(*(void *)(a1 + 48), 6, 0, (uint64_t)v1128, a5, a6, a7, a8);
          sub_2268CE710((uint64_t)"State 802 save base station: \n", (uint64_t)cf, v468, v469, v470, v471, v472, v473);
          sub_2268CFBF4((const __CFString *)cf, *(const __CFArray **)(a1 + 24), v474, v475, v476, v477, v478, v479);
          if (v457
            || (CFStringRef v1130 = (const __CFString *)cf,
                sub_2268D1A34(a1, (const __CFString *)cf, 0, 0, a5, a6, a7, a8),
                v457))
          {
LABEL_1052:
            uint64_t v35 = v457;
LABEL_1183:
            char v36 = 0;
            goto LABEL_10;
          }
          sub_2268DC568(*(void *)(a1 + 48), 16, 0, (uint64_t)v1130, a5, a6, a7, a8);
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1128) {
            sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v482, v483, v484, v485, v486, @"SSID_STR");
          }
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v482, v483, v484, v485, v486, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) The computer has Wi-Fi enabled and can switch networks. Switched to the network called \"%@\" to configure the AirPort base station named \"%@\"", v480, v481, v482, v483, v484, v485, v486, 802);
          sub_2268DB33C(Mutable, byte_268148398, "CAN_SWITCH_NETWORKS_TRUE", v1131, v689, v690, v691, v692);
          uint64_t v64 = 103;
        }
        if (v1128)
        {
          CFRelease(v1128);
          CFStringRef v1128 = 0;
        }
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          goto LABEL_932;
        }
        uint64_t v385 = 802;
        goto LABEL_931;
      case 803:
      case 804:
      case 805:
        goto LABEL_1083;
      case 806:
        CFTypeRef cf = 0;
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 806);
        }
        uint64_t v35 = sub_2268CF4A0(v34, &theDict, v62, a4, a5, a6, a7, a8);
        if (v34) {
          CFRelease(v34);
        }
        if (v35 == -6727)
        {
          CFIndex v1131 = 0;
LABEL_364:
          sub_2268CDAF0("(%d) Found zero unconfigured networks in Wi-Fi scans after filtering.", v188, v189, a4, a5, a6, a7, a8, 806);
          uint64_t v64 = 1201;
          v209 = "NUMBER_UNCONFIGURED_APPLE_NETWORKS_VISIBLE_IS_ZERO_TRUE";
LABEL_365:
          sub_2268DB33C(Mutable, byte_268148398, v209, v1131, v205, v206, v207, v208);
          goto LABEL_366;
        }
        if (v35) {
          goto LABEL_1249;
        }
        if (!theDict)
        {
LABEL_1082:
          uint64_t v35 = 4294960568;
LABEL_1249:
          char v36 = 0;
          CFDictionaryRef v34 = 0;
          goto LABEL_10;
        }
        CFIndex v1131 = CFDictionaryGetCount(theDict);
        sub_2268CE5A4((uint64_t)"State 806 filtered records: \n", theDict, v190, v191, v192, v193, v194, v195);
        if (v1131 == 1)
        {
          uint64_t v636 = sub_2268CF9EC(theDict, &cf, v189, a4, a5, a6, a7, a8);
          if (v636)
          {
            uint64_t v35 = v636;
            goto LABEL_1249;
          }
          if (!cf) {
            goto LABEL_1082;
          }
          CFStringRef v637 = (const __CFString *)CFDictionaryGetValue(theDict, cf);
          CFStringRef v1128 = v637;
          if (!v637)
          {
LABEL_1193:
            uint64_t v35 = 4294960569;
            goto LABEL_1249;
          }
          CFRetain(v637);
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1128) {
            sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v640, v641, v642, v643, v644, @"SSID_STR");
          }
          sub_2268CDAF0("(%d) Found %d unconfigured network in Wi-Fi scans after filtering and the network is named \"%@\".", v638, v639, v640, v641, v642, v643, v644, 806);
          uint64_t v64 = 807;
          v209 = "NUMBER_UNCONFIGURED_APPLE_NETWORKS_VISIBLE_IS_ONE_TRUE";
          goto LABEL_365;
        }
        if (!v1131) {
          goto LABEL_364;
        }
        if (v1131 >= 2)
        {
          uint64_t v196 = sub_2268D24E4(a1, 6, theDict, &cf, a5, a6, a7, a8);
          if (v196)
          {
            uint64_t v35 = v196;
            goto LABEL_1249;
          }
          if (!cf) {
            goto LABEL_1082;
          }
          CFStringRef v197 = (const __CFString *)CFDictionaryGetValue(theDict, cf);
          CFStringRef v1128 = v197;
          if (!v197) {
            goto LABEL_1193;
          }
          CFRetain(v197);
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1128) {
            sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v200, v201, v202, v203, v204, @"SSID_STR");
          }
          sub_2268CDAF0("(%d) Found %d unconfigured networks in Wi-Fi scans and the user chose to configure the one called \"%@\".", v198, v199, v200, v201, v202, v203, v204, 806);
          uint64_t v64 = 807;
          LODWORD(v1112) = 1;
          v209 = "NUMBER_UNCONFIGURED_APPLE_NETWORKS_VISIBLE_IS_GREATER_THAN_ONE_TRUE";
          v65 = v1119;
          goto LABEL_365;
        }
        uint64_t v64 = 806;
LABEL_366:
        if (theDict)
        {
          CFRelease(theDict);
          CFDictionaryRef theDict = 0;
        }
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Exiting state: %d\n********************************************************************************\n\n", a5, a6, a7, a8, 806);
        }
        CFDictionaryRef v34 = 0;
        goto LABEL_932;
      case 807:
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 807);
        }
        if (sub_2268CF1CC((uint64_t)v1128, v61, v62, a4, a5, a6, a7, a8))
        {
          uint64_t v64 = 1802;
          v217 = "(%d) This network is an 802.11g model. We don't support it with this software.";
          v218 = "CHOSEN_NETWORK_IS_80211G_TRUE";
        }
        else if (sub_2268CF25C((uint64_t)v1128, v210, v211, v212, v213, v214, v215, v216))
        {
          CFStringRef v1116 = v1128;
          CFStringRef v1128 = 0;
          uint64_t v64 = 1104;
          v217 = "(%d) This network is too new to be set up with this software.";
          v218 = "CHOSEN_NETWORK_IS_TOO_NEW_TRUE";
        }
        else
        {
          uint64_t v64 = 808;
          v217 = "(%d) This network is not an 802.11g model. OK to continue.";
          v218 = "CHOSEN_NETWORK_IS_80211G_FALSE";
        }
        sub_2268CDAF0(v217, (uint64_t)v210, v211, v212, v213, v214, v215, v216, 807);
        sub_2268DB160(Mutable, byte_268148398, v218, v677, v678, v679, v680, v681);
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          goto LABEL_932;
        }
        uint64_t v385 = 807;
        goto LABEL_931;
      case 808:
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 808);
        }
        if (sub_2269017A0((uint64_t)v1128, v61))
        {
          CFStringRef v1116 = v1128;
          CFStringRef v1128 = 0;
          uint64_t v64 = 105;
          v226 = "(%d) This network is a STA-only device.";
          v227 = "CHOSEN_NETWORK_IS_STA_ONLY_TRUE";
        }
        else
        {
          uint64_t v64 = 802;
          v226 = "(%d) This network is not a STA-only device.";
          v227 = "CHOSEN_NETWORK_IS_STA_ONLY_FALSE";
        }
        sub_2268CDAF0(v226, v219, v220, v221, v222, v223, v224, v225, 808);
        sub_2268DB160(Mutable, byte_268148398, v227, v487, v488, v489, v490, v491);
        if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
          goto LABEL_932;
        }
        uint64_t v385 = 808;
        goto LABEL_931;
      default:
        switch((int)v64)
        {
          case 1101:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1101);
            }
            sub_2268D2734(1101, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_UseAUFor80211g", v1130, 0, 0, 0, 0, a1);
            sub_2268CDAF0("(%d) Use AirPort Utility for 802.11g to configure this base station.", v947, v948, v949, v950, v951, v952, v953, 1101);
            sub_2268DB160(Mutable, byte_268148398, "TELL_USER_USE_AU_FOR_80211G", v954, v955, v956, v957, v958);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1102:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1102);
            }
            sub_2268D2734(1102, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_FirmwareUpdateRequired", v1130, 0, 0, 0, 0, a1);
            sub_2268CDAF0("(%d) A firmware update is required before configuring this base station.", v997, v998, v999, v1000, v1001, v1002, v1003, 1102);
            sub_2268DB160(Mutable, byte_268148398, "TELL_USER_FIRMWARE_UPDATE_REQUIRED", v1004, v1005, v1006, v1007, v1008);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1103:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1103);
            }
            sub_2268D2734(1103, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_NoNetworkToJoin", v1130, v1116, 0, 0, 0, a1);
            sub_2268CDAF0("(%d) No network was found for the STA-only device.", v1009, v1010, v1011, v1012, v1013, v1014, v1015, 1103);
            sub_2268DB160(Mutable, byte_268148398, "TELL_USER_NO_NETWORK_FOR_STA_ONLY", v1016, v1017, v1018, v1019, v1020);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          case 1104:
            if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 1104);
            }
            sub_2268D2734(1104, Mutable, -1, 0xFFFFFFFFLL, 0, @"BSSetupRecommend_DeviceIsTooNewToSetUp", v1130, v1116, 0, 0, 0, a1);
            sub_2268CDAF0("(%d) Device is too new to set up.", v1021, v1022, v1023, v1024, v1025, v1026, v1027, 1104);
            sub_2268DB160(Mutable, byte_268148398, "TELL_USER_DEVICE_IS_TOO_NEW_TO_SET_UP", v1028, v1029, v1030, v1031, v1032);
            if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
              goto LABEL_1245;
            }
            goto LABEL_1244;
          default:
            goto LABEL_1083;
        }
    }
    goto LABEL_931;
  }
  switch((int)v64)
  {
    case 602:
      CFTypeRef cf = 0;
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 602);
      }
      sub_2268DC568(*(void *)(a1 + 48), 14, 0, 0, a5, a6, a7, a8);
      uint64_t v116 = sub_2268A243C((uint64_t)&v1121);
      if (v116) {
        goto LABEL_1053;
      }
      if (!v1121) {
        goto LABEL_1079;
      }
      uint64_t v116 = sub_2268D0620(a1, v1130, 0, &cf, a5, a6, a7, a8);
      if (v116) {
        goto LABEL_1053;
      }
      if (!cf) {
        goto LABEL_1079;
      }
      uint64_t v35 = sub_2268A2988((uint64_t)v1121, cf);
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
      if (v35) {
        goto LABEL_1054;
      }
      if (sub_22685BB54(v1130, v117, v118, a4, a5, a6, a7, a8))
      {
        uint64_t v125 = sub_2268A7A8C((uint64_t)v1121);
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"BSSwitchToRestoreProfile err: %m\n", v121, v122, v123, v124, v125);
        }
        if (!v125) {
          goto LABEL_705;
        }
      }
      if (!sub_2268CEE5C(v1130, v65, v119, v120, v121, v122, v123, v124)) {
        goto LABEL_143;
      }
      v1132[0] = 0;
      uint64_t v116 = sub_2268CEFE0(v1130, v65, v1132, v128, v121, v122, v123, v124);
      if (v116) {
        goto LABEL_1053;
      }
      if (!v1132[0])
      {
LABEL_1079:
        char v36 = 0;
        uint64_t v35 = 4294960568;
        goto LABEL_10;
      }
      uint64_t v129 = sub_2268A2738((uint64_t)v1121, (const __CFString *)v1132[0], 0);
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"BSImportFromConfigFile err: %m\n", v121, v122, v123, v124, v129);
      }
      if (v129)
      {
LABEL_143:
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v128, v121, v122, v123, v124, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station \"%@\" does not actually have a restore profile.", v126, v127, v128, v121, v122, v123, v124, 602);
        uint64_t v64 = 501;
        v135 = "TEXT_RECORD_HAS_PROFILE_OR_PREVIOUS_CONFIG_FILE_FALSE";
      }
      else
      {
LABEL_705:
        uint64_t v116 = sub_2268D0A70((uint64_t)v1121, &v1127, &v1125, &v1126, v121, v122, v123, v124);
        if (v116)
        {
LABEL_1053:
          uint64_t v35 = v116;
LABEL_1054:
          char v36 = 0;
          goto LABEL_10;
        }
        uint64_t v64 = 602;
        if (v1127 <= 2)
        {
          if (v1127)
          {
            if (v1127 != 1) {
              goto LABEL_868;
            }
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The previous settings for the chosen base station named \"%@\" are configured to Join a network called \"%@\".", v682, v683, a4, a5, a6, a7, a8, 602);
            uint64_t v64 = 606;
            v135 = "RESTORE_PROFILE_NETWORK_MODE_JOIN_TRUE";
          }
          else
          {
            v1132[0] = (__CFArray *)&stru_26DA6BE88;
            if (v1130) {
              sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
            }
            sub_2268CDAF0("(%d) The previous settings for the chosen base station named \"%@\" are configured to Create a network called \"%@\".", v682, v683, a4, a5, a6, a7, a8, 602);
            uint64_t v64 = 603;
            v135 = "RESTORE_PROFILE_NETWORK_MODE_CREATE_TRUE";
          }
        }
        else if (v1127 == 3)
        {
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) The previous settings for the chosen base station named \"%@\" are configured with Wi-Fi disabled.", v682, v683, a4, a5, a6, a7, a8, 602);
          uint64_t v64 = 605;
          v135 = "BASE_STATION_WIRELESS_ENABLED_FALSE";
        }
        else if (v1127 == 10)
        {
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) The previous settings for the chosen base station named \"%@\" are configured to Extend a network called \"%@\" using WDS.", v682, v683, a4, a5, a6, a7, a8, 602);
          uint64_t v64 = 606;
          v135 = "RESTORE_PROFILE_NETWORK_MODE_WDS_TRUE";
        }
        else
        {
          v65 = v1119;
          if (v1127 != 20) {
            goto LABEL_868;
          }
          v1132[0] = (__CFArray *)&stru_26DA6BE88;
          if (v1130) {
            sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
          }
          sub_2268CDAF0("(%d) The previous settings for the chosen base station named \"%@\" are configured to Extend a network called \"%@\" using DWDS.", v682, v683, a4, a5, a6, a7, a8, 602);
          uint64_t v64 = 606;
          v135 = "RESTORE_PROFILE_NETWORK_MODE_DWDS_EXTENDER_TRUE";
        }
        v65 = v1119;
      }
      sub_2268DB160(Mutable, byte_268148398, v135, v130, v131, v132, v133, v134);
LABEL_868:
      if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        goto LABEL_932;
      }
      uint64_t v385 = 602;
      goto LABEL_931;
    case 603:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 603);
      }
      if (sub_22685BE8C(v1130, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
      {
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v388, v389, v390, v391, v392, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station named \"%@\" indicates its WAN port is connected.", v386, v387, v388, v389, v390, v391, v392, 603);
        uint64_t v64 = 604;
        v398 = "WAN_LINK_TRUE";
      }
      else
      {
        uint64_t v399 = sub_2268D2734(603, Mutable, v1127, 0xFFFFFFFFLL, v1125, @"BSSetupRecommend_OfferRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station named \"%@\" indicates its WAN port is not connected.", v645, v646, a4, a5, a6, a7, a8, 603);
        uint64_t v64 = 501;
        v398 = "WAN_LINK_FALSE";
      }
      sub_2268DB160(Mutable, byte_268148398, v398, v393, v394, v395, v396, v397);
      if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        goto LABEL_932;
      }
      uint64_t v385 = 603;
      goto LABEL_931;
    case 604:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 604);
      }
      if (v1126 == 3)
      {
        uint64_t v399 = sub_2268D2734(604, Mutable, v1127, 0xFFFFFFFFLL, v1125, @"BSSetupRecommend_OfferRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station named \"%@\" previous configuration is bridge mode and can be restored.", v400, v401, a4, a5, a6, a7, a8, 604);
        uint64_t v64 = 501;
        v406 = "RESTORE_PROFILE_ROUTER_MODE_IS_BRIDGE_TRUE";
      }
      else
      {
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station named \"%@\" previous configuration is not bridge mode.", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 604);
        uint64_t v64 = 608;
        v406 = "RESTORE_PROFILE_ROUTER_MODE_IS_BRIDGE_FALSE";
      }
      sub_2268DB33C(Mutable, byte_268148398, v406, v1131, v402, v403, v404, v405);
      if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        goto LABEL_932;
      }
      uint64_t v385 = 604;
      goto LABEL_931;
    case 605:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 605);
      }
      if (sub_22685BE8C(v1130, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
      {
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", v409, v410, v411, v412, v413, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station named \"%@\" indicates its WAN port is connected.", v407, v408, v409, v410, v411, v412, v413, 605);
        uint64_t v64 = 604;
        v419 = "WAN_LINK_TRUE";
      }
      else
      {
        uint64_t v399 = sub_2268D2734(605, Mutable, v1127, 3, 0, @"BSSetupRecommend_OfferNoRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The chosen base station named \"%@\" indicates its WAN port is not connected.", v647, v648, a4, a5, a6, a7, a8, 605);
        uint64_t v64 = 501;
        v419 = "WAN_LINK_FALSE";
      }
      sub_2268DB160(Mutable, byte_268148398, v419, v414, v415, v416, v417, v418);
      if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        goto LABEL_932;
      }
      uint64_t v385 = 605;
      goto LABEL_931;
    case 606:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 606);
      }
      if (sub_2268D42D0((const __CFString *)v1125, *(CFArrayRef *)(a1 + 32), v62, a4, a5, a6, a7, a8))
      {
        uint64_t v399 = sub_2268D2734(606, Mutable, v1127, 0xFFFFFFFFLL, v1125, @"BSSetupRecommend_OfferRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        sub_2268CDAF0("(%d) The network called \"%@\" is visible in the Wi-Fi scan.", v427, v428, a4, a5, a6, a7, a8, 606);
        uint64_t v64 = 501;
        v434 = "WIRELESS_NETWORK_VISIBLE_IN_NETWORK_SCAN_TRUE";
      }
      else
      {
        sub_2268CDAF0("(%d) The network called \"%@\" is not visible in the Wi-Fi scan.", v420, v421, v422, v423, v424, v425, v426, 606);
        uint64_t v64 = 607;
        v434 = "WIRELESS_NETWORK_VISIBLE_IN_NETWORK_SCAN_FALSE";
      }
      sub_2268DB160(Mutable, byte_268148398, v434, v429, v430, v431, v432, v433);
      if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        goto LABEL_932;
      }
      uint64_t v385 = 606;
      goto LABEL_931;
    case 607:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 607);
      }
      uint64_t v435 = sub_2268D2110(a1, *(CFArrayRef *)(a1 + 32), (const __CFString *)v1125, 3, (uint64_t *)&theDict, a6, a7, a8);
      uint64_t v35 = v435;
      if ((v435 & 0xFFFFFFF7) != 0xFFFFE5B1)
      {
        if (v435)
        {
          char v36 = 0;
          goto LABEL_10;
        }
        if (!theDict)
        {
          char v36 = 0;
          uint64_t v35 = 4294960568;
          goto LABEL_10;
        }
        uint64_t v399 = sub_2268D2734(607, Mutable, v1127, 0xFFFFFFFFLL, v1125, @"BSSetupRecommend_OfferRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        sub_2268CDAF0("(%d) The network called \"%@\" is found in a directed Wi-Fi scan.", v538, v539, a4, a5, a6, a7, a8, 607);
        v545 = "WIRELESS_NETWORK_VISIBLE_IN_DIRECT_NETWORK_SCAN_TRUE";
        goto LABEL_785;
      }
      if (v435 == -6735)
      {
        uint64_t v399 = sub_2268D2734(607, Mutable, v1127, 1, v1125, @"BSSetupRecommend_OfferNoRestore", v1130, 0, 0, 0, 0, a1);
      }
      else
      {
        if (v435 != -6727)
        {
LABEL_784:
          sub_2268CDAF0("(%d) The network called \"%@\" is not found in a directed Wi-Fi scan.", v436, v437, a4, a5, a6, a7, a8, 607);
          v545 = "WIRELESS_NETWORK_VISIBLE_IN_DIRECT_NETWORK_SCAN_FALSE";
LABEL_785:
          sub_2268DB160(Mutable, byte_268148398, v545, v540, v541, v542, v543, v544);
          if (theDict)
          {
            CFRelease(theDict);
            CFDictionaryRef theDict = 0;
          }
          if (v1125)
          {
            CFRelease(v1125);
            CFTypeRef v1125 = 0;
          }
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)))
          {
            uint64_t v655 = 607;
LABEL_793:
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Exiting state: %d\n********************************************************************************\n\n", v651, v652, v653, v654, v655);
          }
LABEL_794:
          uint64_t v64 = 501;
          goto LABEL_932;
        }
        uint64_t v399 = sub_2268D2734(607, Mutable, v1127, 2, v1125, @"BSSetupRecommend_OfferNoRestore", v1130, 0, 0, 0, 0, a1);
      }
      if (!v399) {
        goto LABEL_784;
      }
LABEL_987:
      uint64_t v35 = v399;
LABEL_988:
      char v36 = 0;
LABEL_10:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"State machine exiting... err: %d state: %d\n", a5, a6, a7, a8, v35);
      }
      if (v36)
      {
        if (!a1) {
          goto LABEL_1108;
        }
        goto LABEL_1100;
      }
LABEL_1099:
      sub_2268DFCC0(*(void *)(a1 + 48));
LABEL_1100:
      *(_DWORD *)(a1 + 40) = v35;
      v1132[0] = 0;
      if (!sub_22685FC7C(*v9, (CFTypeRef *)v1132, (uint64_t)"{%ks=%i%ks=%O}", a4, a5, a6, a7, a8, (uint64_t)"BSAutoGuessComplete_ErrorResult"))
      {
        if (!v1132[0]) {
          goto LABEL_1108;
        }
        sub_2268DC568(*(void *)(a1 + 48), 18, *(unsigned int *)(a1 + 40), (uint64_t)v1132[0], v1033, v1034, v1035, v1036);
        if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void _BSAutoGuess_NotifyComplete(AutoGuessContextRef)", 800, (uint64_t)"Auto Guess END\n", v1037, v1038, v1039, v1040, v1111);
        }
      }
      if (v1132[0]) {
        CFRelease(v1132[0]);
      }
LABEL_1108:
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (theArray)
      {
        CFRelease(theArray);
        CFArrayRef theArray = 0;
      }
      if (theDict)
      {
        CFRelease(theDict);
        CFDictionaryRef theDict = 0;
      }
      if (v1125)
      {
        CFRelease(v1125);
        CFTypeRef v1125 = 0;
      }
      if (v1128)
      {
        CFRelease(v1128);
        CFStringRef v1128 = 0;
      }
      if (v34) {
        CFRelease(v34);
      }
      if (v1124)
      {
        CFRelease(v1124);
        CFTypeRef v1124 = 0;
      }
      uint64_t result = v1121;
      if (v1121) {
        return sub_2268A238C(v1121);
      }
      return result;
    case 608:
      if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 608);
      }
      if (sub_2268D0BB0((uint64_t)v1121, (uint64_t)v61, v62, a4, a5, a6, a7, a8))
      {
        uint64_t v399 = sub_2268D2734(608, Mutable, v1127, 4, 0, @"BSSetupRecommend_OfferNoRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The DHCP range in the the previous settings of the chosen base station named \"%@\" conflicts with the network the WAN port is plugged in to.", v438, v439, a4, a5, a6, a7, a8, 608);
        v445 = "DHCP_RANGE_CONFLICT_TRUE";
      }
      else
      {
        uint64_t v399 = sub_2268D2734(608, Mutable, v1127, 0xFFFFFFFFLL, v1125, @"BSSetupRecommend_OfferRestore", v1130, 0, 0, 0, 0, a1);
        if (v399) {
          goto LABEL_987;
        }
        v1132[0] = (__CFArray *)&stru_26DA6BE88;
        if (v1130) {
          sub_22686088C(v1130, (uint64_t)v1132, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"name");
        }
        sub_2268CDAF0("(%d) The DHCP range in the previous settings of the chosen base station named \"%@\" does not conflict with the network the WAN port is plugged in to.", v649, v650, a4, a5, a6, a7, a8, 608);
        v445 = "DHCP_RANGE_CONFLICT_FALSE";
      }
      sub_2268DB160(Mutable, byte_268148398, v445, v440, v441, v442, v443, v444);
      sub_2268A238C(v1121);
      v1121 = 0;
      if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
        goto LABEL_794;
      }
      uint64_t v655 = 608;
      goto LABEL_793;
    default:
      switch((int)v64)
      {
        case 700:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 700);
          }
          if (HIDWORD(v1112))
          {
            sub_2268CDAF0("(%d) Already looked at preferred networks.", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 700);
            sub_2268DB160(Mutable, byte_268148398, "CONSIDERED_PREFERRED_NETWORKS_TRUE", v142, v143, v144, v145, v146);
            if (sub_2268D265C(v1130, (uint64_t)v1116, v147, v148, v149, v150, v151, v152))
            {
              if (v1116) {
                CFDictionaryRef v153 = (const __CFDictionary *)v1116;
              }
              else {
                CFDictionaryRef v153 = (const __CFDictionary *)v1130;
              }
              uint64_t v154 = sub_2268CF77C(*(CFArrayRef *)(a1 + 32), v153, &v1124);
              if (v154 == -6727)
              {
                uint64_t v64 = 1103;
              }
              else
              {
                uint64_t v35 = v154;
                if (v154)
                {
                  char v36 = 0;
                  goto LABEL_10;
                }
                if (!v1124)
                {
                  char v36 = 0;
                  uint64_t v35 = 4294960568;
                  goto LABEL_10;
                }
                uint64_t v64 = 1406;
              }
            }
            else
            {
              uint64_t v64 = 1701;
            }
          }
          else
          {
            sub_2268CDAF0("(%d) Will look at preferred networks.", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 700);
            sub_2268DB160(Mutable, byte_268148398, "CONSIDERED_PREFERRED_NETWORKS_FALSE", v684, v685, v686, v687, v688);
            uint64_t v64 = 701;
            HIDWORD(v1112) = 1;
          }
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 700;
          goto LABEL_931;
        case 701:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 701);
          }
          if (v1118)
          {
            sub_2268CDAF0("(%d) The computer has support for accessing the preferred networks list.", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 701);
            sub_2268DB160(Mutable, byte_268148398, "HOST_SUPPORTS_PREFERRED_NETWORK_ACCESS_TRUE", v446, v447, v448, v449, v450);
            uint64_t v64 = 702;
          }
          else
          {
            sub_2268CDAF0("(%d) The computer does not have support for accessing the preferred networks list.", (uint64_t)v61, v62, a4, a5, a6, a7, a8, 701);
            sub_2268DB160(Mutable, byte_268148398, "HOST_SUPPORTS_PREFERRED_NETWORK_ACCESS_FALSE", v656, v657, v658, v659, v660);
            if (sub_2268D265C(v1130, (uint64_t)v1116, v661, v662, v663, v664, v665, v666))
            {
              if (v1116) {
                CFDictionaryRef v667 = (const __CFDictionary *)v1116;
              }
              else {
                CFDictionaryRef v667 = (const __CFDictionary *)v1130;
              }
              uint64_t v668 = sub_2268CF77C(*(CFArrayRef *)(a1 + 32), v667, &v1124);
              if (v668 == -6727)
              {
                uint64_t v64 = 1103;
              }
              else
              {
                uint64_t v35 = v668;
                if (v668)
                {
                  char v36 = 0;
                  goto LABEL_10;
                }
                if (!v1124)
                {
                  char v36 = 0;
                  uint64_t v35 = 4294960568;
                  goto LABEL_10;
                }
                uint64_t v64 = 1406;
                v65 = v1119;
              }
            }
            else
            {
              uint64_t v64 = 1701;
            }
          }
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 701;
          goto LABEL_931;
        case 702:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 702);
          }
          uint64_t v451 = sub_2268D38C8(a1, *(const __CFArray **)(a1 + 32), v1114, Value, 1, &theArray, a7, a8);
          if (v451)
          {
            uint64_t v35 = v451;
            if (v451 != -6727) {
              goto LABEL_1266;
            }
            CFIndex v1131 = 0;
LABEL_613:
            sub_2268CDAF0("(%d) There are no preferred networks visible in the Wi-Fi scan.", v452, v453, a4, a5, a6, a7, a8, 702);
            sub_2268DB160(Mutable, byte_268148398, "VISIBLE_PREFERRED_NETWORK_FALSE", v580, v581, v582, v583, v584);
            uint64_t v64 = 703;
            goto LABEL_876;
          }
          if (!theArray) {
            goto LABEL_1190;
          }
          CFIndex v1131 = CFArrayGetCount(theArray);
          if (!v1131) {
            goto LABEL_613;
          }
          sub_2268CE084((uint64_t)"State 702 scan records: \n", theArray, v453, a4, a5, a6, a7, a8);
          BOOL v552 = sub_2268D265C(v1130, (uint64_t)v1116, v546, v547, v548, v549, v550, v551);
          CFArrayRef v556 = theArray;
          CFArrayRef theArray = 0;
          if (v552)
          {
            if (v1116) {
              CFDictionaryRef v557 = (const __CFDictionary *)v1116;
            }
            else {
              CFDictionaryRef v557 = (const __CFDictionary *)v1130;
            }
            uint64_t v35 = sub_2268CF77C(v556, v557, (CFTypeRef *)&theArray);
            if (v556) {
              CFRelease(v556);
            }
            if (v35 == -6727)
            {
              sub_2268CDAF0("(%d) There are no preferred networks available after filtering.", v558, v559, a4, a5, a6, a7, a8, 702);
LABEL_840:
              sub_2268DB160(Mutable, byte_268148398, "VISIBLE_PREFERRED_NETWORK_FALSE", v776, v777, v778, v779, v780);
              uint64_t v64 = 703;
              goto LABEL_875;
            }
            if (v35) {
              goto LABEL_1266;
            }
            if (!theArray) {
              goto LABEL_1190;
            }
            CFIndex v1131 = CFArrayGetCount(theArray);
            if (v1131 == 1)
            {
              CFStringRef v567 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
              CFStringRef v1128 = v567;
              if (!v567) {
                goto LABEL_1190;
              }
              CFRetain(v567);
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              if (v1128) {
                sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v570, v571, v572, v573, v574, @"SSID_STR");
              }
              sub_2268CDAF0("(%d) Found one preferred network called \"%@\" that can be joined by STA-only device.", v568, v569, v570, v571, v572, v573, v574, 702);
LABEL_612:
              sub_2268DB160(Mutable, byte_268148398, "NUMBER_PREFERRED_NETWORKS_FOR_STA_ONLY_TO_JOIN_IS_ONE_TRUE", v575, v576, v577, v578, v579);
              uint64_t v64 = 1403;
              goto LABEL_875;
            }
            sub_2268CDAF0("(%d) Found %d preferred networks that could be joined by STA-only device.", v560, v561, v562, v563, v564, v565, v566, 702);
            sub_2268DB33C(Mutable, byte_268148398, "NUMBER_PREFERRED_NETWORKS_FOR_STA_ONLY_TO_JOIN_IS_GREATER_THAN_ONE_TRUE", v1131, v849, v850, v851, v852);
            if (theArray)
            {
              CFRelease(theArray);
              CFArrayRef theArray = 0;
            }
            if (v1116) {
              CFDictionaryRef v853 = (const __CFDictionary *)v1116;
            }
            else {
              CFDictionaryRef v853 = (const __CFDictionary *)v1130;
            }
            uint64_t v854 = sub_2268CF77C(*(CFArrayRef *)(a1 + 32), v853, (CFTypeRef *)&theArray);
            if (v854 == -6727)
            {
              sub_2268CDAF0("(%d) There are no networks available (after re-filtering all networks).", v855, v856, a4, a5, a6, a7, a8, 702);
              goto LABEL_840;
            }
            uint64_t v35 = v854;
            if (v854) {
              goto LABEL_1266;
            }
            if (!theArray)
            {
LABEL_1190:
              char v36 = 0;
              uint64_t v35 = 4294960568;
              goto LABEL_10;
            }
            CFIndex v1131 = CFArrayGetCount(theArray);
            CFArrayRef v864 = theArray;
            if (v1131 == 1)
            {
              CFStringRef v865 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
              CFStringRef v1128 = v865;
              if (!v865) {
                goto LABEL_1190;
              }
              CFRetain(v865);
              v1132[0] = (__CFArray *)&stru_26DA6BE88;
              if (v1128) {
                sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v868, v869, v870, v871, v872, @"SSID_STR");
              }
              sub_2268CDAF0("(%d) Found one network called \"%@\" that can be joined by STA-only device (after re-filtering all networks).", v866, v867, v868, v869, v870, v871, v872, 702);
              goto LABEL_612;
            }
            CFArrayRef theArray = 0;
            CFTypeRef v1124 = v864;
            sub_2268CDAF0("(%d) Found %d networks that could be joined by STA-only device (after re-filtering all networks).", v857, v858, v859, v860, v861, v862, v863, 702);
            sub_2268DB33C(Mutable, byte_268148398, "NUMBER_PREFERRED_NETWORKS_FOR_STA_ONLY_TO_JOIN_IS_GREATER_THAN_ONE_TRUE", v1131, v910, v911, v912, v913);
            uint64_t v64 = 1406;
          }
          else
          {
            uint64_t v35 = sub_2268D1F20(a1, v556, 0, 0xFu, (CFTypeRef *)&theArray, v553, v554, v555);
            if (v556) {
              CFRelease(v556);
            }
            if (v35)
            {
              if (v35 == -6723) {
                goto LABEL_1266;
              }
              sub_2268CDAF0("(%d) There are no preferred networks successfully joined and base stations found. err: %d", v774, v775, a4, a5, a6, a7, a8, 702);
              goto LABEL_840;
            }
            if (!theArray) {
              goto LABEL_1190;
            }
            sub_2268CDB94((uint64_t)"State 702 adding browse record: \n", theArray, v775, a4, a5, a6, a7, a8);
            sub_2268CFE40(theArray, *(const __CFArray **)(a1 + 24), v821, v822, v823, v824, v825, v826);
            if (v827)
            {
              uint64_t v35 = v827;
LABEL_1266:
              char v36 = 0;
              goto LABEL_10;
            }
            sub_2268CDAF0("(%d) At least one of your preferred networks is visible in the Wi-Fi scan.", v828, v829, a4, a5, a6, a7, a8, 702);
            sub_2268DB160(Mutable, byte_268148398, "VISIBLE_PREFERRED_NETWORK_TRUE", v830, v831, v832, v833, v834);
            uint64_t v64 = 401;
          }
LABEL_875:
          v65 = v1119;
LABEL_876:
          if (theArray)
          {
            CFRelease(theArray);
            CFArrayRef theArray = 0;
          }
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 702;
          goto LABEL_931;
        case 703:
          if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void __BSAutoGuessConfiguration(void *)", 800, (uint64_t)"\n********************************************************************************\n* Entering state: %d (%s)\n********************************************************************************\n\n", a5, a6, a7, a8, 703);
          }
          uint64_t v454 = sub_2268D38C8(a1, *(const __CFArray **)(a1 + 32), v1114, Value, 14, &theArray, a7, a8);
          if (v454)
          {
            uint64_t v35 = v454;
            if (v454 != -6727) {
              goto LABEL_1252;
            }
            CFIndex v1131 = 0;
          }
          else
          {
            if (!theArray) {
              goto LABEL_1191;
            }
            CFIndex v1131 = CFArrayGetCount(theArray);
            if (v1131)
            {
              CFTypeRef cf = 0;
              sub_2268CE084((uint64_t)"State 703 scan records: \n", theArray, v456, a4, a5, a6, a7, a8);
              sub_22686088C((const __CFString *)theArray, (uint64_t)&cf, (UInt8 *)"[*]", v585, v586, v587, v588, v589, 0);
              if (v590) {
                goto LABEL_1194;
              }
              if (!cf) {
                goto LABEL_1251;
              }
              sub_2268CFF3C(*(__CFArray **)(a1 + 32), (const __CFString *)cf, v591, a4, a5, a6, a7, a8);
              if (v590)
              {
LABEL_1194:
                uint64_t v35 = v590;
                goto LABEL_1252;
              }
              if (sub_2268D265C(v1130, (uint64_t)v1116, v592, a4, a5, a6, a7, a8))
              {
                if (v1116) {
                  CFDictionaryRef v596 = (const __CFDictionary *)v1116;
                }
                else {
                  CFDictionaryRef v596 = (const __CFDictionary *)v1130;
                }
                uint64_t v597 = sub_2268CF77C(theArray, v596, 0);
                if (v597 != -6727)
                {
                  uint64_t v35 = v597;
                  if (v597) {
                    goto LABEL_1252;
                  }
                  CFStringRef v1128 = (const __CFString *)cf;
                  CFRetain(cf);
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (v1128) {
                    sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v600, v601, v602, v603, v604, @"SSID_STR");
                  }
                  sub_2268CDAF0("(%d) Found one hidden preferred network called \"%@\" that can be joined by STA-only device.", v598, v599, v600, v601, v602, v603, v604, 703);
                  goto LABEL_628;
                }
                if (theArray)
                {
                  CFRelease(theArray);
                  CFArrayRef theArray = 0;
                }
                if (v1116) {
                  CFDictionaryRef v801 = (const __CFDictionary *)v1116;
                }
                else {
                  CFDictionaryRef v801 = (const __CFDictionary *)v1130;
                }
                uint64_t v802 = sub_2268CF77C(*(CFArrayRef *)(a1 + 32), v801, (CFTypeRef *)&theArray);
                if (v802 == -6727)
                {
                  sub_2268CDAF0("(%d) There are no networks available (after re-filtering all networks).", v803, v804, a4, a5, a6, a7, a8, 703);
                  sub_2268DB160(Mutable, byte_268148398, "HIDDEN_PREFERRED_NETWORK_FALSE", v877, v878, v879, v880, v881);
                  uint64_t v64 = 1103;
                }
                else
                {
                  uint64_t v35 = v802;
                  if (v802) {
                    goto LABEL_1252;
                  }
                  if (!theArray)
                  {
LABEL_1251:
                    uint64_t v35 = 4294960568;
LABEL_1252:
                    char v36 = 0;
                    goto LABEL_10;
                  }
                  CFIndex v1131 = CFArrayGetCount(theArray);
                  CFArrayRef v812 = theArray;
                  if (v1131 == 1)
                  {
                    CFStringRef v813 = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
                    CFStringRef v1128 = v813;
                    if (!v813) {
                      goto LABEL_1251;
                    }
                    CFRetain(v813);
                    v1132[0] = (__CFArray *)&stru_26DA6BE88;
                    if (v1128) {
                      sub_22686088C(v1128, (uint64_t)v1132, (UInt8 *)"%kO", v816, v817, v818, v819, v820, @"SSID_STR");
                    }
                    sub_2268CDAF0("(%d) Found one network called \"%@\" that can be joined by STA-only device (after re-filtering all networks).", v814, v815, v816, v817, v818, v819, v820, 703);
LABEL_628:
                    sub_2268DB160(Mutable, byte_268148398, "HIDDEN_PREFERRED_NETWORK_TRUE", v605, v606, v607, v608, v609);
                    uint64_t v64 = 1403;
                  }
                  else
                  {
                    CFArrayRef theArray = 0;
                    CFTypeRef v1124 = v812;
                    sub_2268CDAF0("(%d) Found %d networks that could be joined by STA-only device (after re-filtering all networks).", v805, v806, v807, v808, v809, v810, v811, 703);
                    sub_2268DB33C(Mutable, byte_268148398, "HIDDEN_PREFERRED_NETWORK_TRUE", v1131, v906, v907, v908, v909);
                    uint64_t v64 = 1406;
                  }
                }
              }
              else
              {
                uint64_t v781 = sub_2268D1E10(a1, (const char *)cf, 0, 0xFu, &theArray, v593, v594, v595);
                if (v781)
                {
                  if (v781 == -6723)
                  {
                    uint64_t v35 = v781;
                    goto LABEL_1252;
                  }
                  sub_2268CDAF0("(%d) There are no preferred networks found using a directed Wi-Fi scan and base stations found. err: %d", v782, v783, a4, a5, a6, a7, a8, 703);
                  sub_2268DB160(Mutable, byte_268148398, "HIDDEN_PREFERRED_NETWORK_FALSE", v784, v785, v786, v787, v788);
                  uint64_t v64 = 1701;
                }
                else
                {
                  if (!theArray) {
                    goto LABEL_1251;
                  }
                  sub_2268CDB94((uint64_t)"State 703 adding browse record: \n", theArray, v783, a4, a5, a6, a7, a8);
                  sub_2268CFE40(theArray, *(const __CFArray **)(a1 + 24), v835, v836, v837, v838, v839, v840);
                  uint64_t v35 = v843;
                  if (theArray)
                  {
                    CFRelease(theArray);
                    CFArrayRef theArray = 0;
                  }
                  if (v35) {
                    goto LABEL_1252;
                  }
                  v1132[0] = (__CFArray *)&stru_26DA6BE88;
                  if (cf) {
                    sub_22686088C((const __CFString *)cf, (uint64_t)v1132, (UInt8 *)"%kO", a4, a5, a6, a7, a8, @"SSID_STR");
                  }
                  sub_2268CDAF0("(%d) The hidden preferred network called \"%@\" was found using a directed Wi-Fi scan.", v841, v842, a4, a5, a6, a7, a8, 703);
                  sub_2268DB160(Mutable, byte_268148398, "HIDDEN_PREFERRED_NETWORK_TRUE", v844, v845, v846, v847, v848);
                  uint64_t v64 = 401;
                }
              }
              v65 = v1119;
              goto LABEL_925;
            }
          }
          sub_2268CDAF0("(%d) There are no preferred networks found using a directed Wi-Fi scan.", v455, v456, a4, a5, a6, a7, a8, 703);
          sub_2268DB160(Mutable, byte_268148398, "HIDDEN_PREFERRED_NETWORK_FALSE", v610, v611, v612, v613, v614);
          if (sub_2268D265C(v1130, (uint64_t)v1116, v615, v616, v617, v618, v619, v620))
          {
            if (v1116) {
              CFDictionaryRef v621 = (const __CFDictionary *)v1116;
            }
            else {
              CFDictionaryRef v621 = (const __CFDictionary *)v1130;
            }
            uint64_t v622 = sub_2268CF77C(*(CFArrayRef *)(a1 + 32), v621, &v1124);
            if (v622 == -6727)
            {
              uint64_t v64 = 1103;
            }
            else
            {
              uint64_t v35 = v622;
              if (v622) {
                goto LABEL_1252;
              }
              if (!v1124)
              {
LABEL_1191:
                char v36 = 0;
                uint64_t v35 = 4294960568;
                goto LABEL_10;
              }
              uint64_t v64 = 1406;
            }
          }
          else
          {
            uint64_t v64 = 1701;
          }
LABEL_925:
          if (theArray)
          {
            CFRelease(theArray);
            CFArrayRef theArray = 0;
          }
          if (dword_268147A98 > 800 || dword_268147A98 == -1 && !sub_226865630((uint64_t)&dword_268147A98, 0x320u)) {
            goto LABEL_932;
          }
          uint64_t v385 = 703;
          break;
        default:
          goto LABEL_1083;
      }
      goto LABEL_931;
  }
}

uint64_t sub_2268DB0CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"OSStatus BSAutoGuess_Cancel(AutoGuessContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v11);
  }
  if (!a1) {
    return 4294960591;
  }
  uint64_t v9 = *(void *)(a1 + 48);

  return sub_2268DBA54(v9, a2, a3, a4, a5, a6, a7, a8);
}

void sub_2268DB160(const __CFArray *a1, unsigned char *a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1
    && a2
    && a3
    && *a2
    && *a3
    && !sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], a1, (uint64_t)"{%ks=%s%ks=%s%ks=%b}", a4, a5, a6, a7, a8, (uint64_t)"KEY_TITLE"))
  {
    if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)))
    {
      CFIndex Count = CFArrayGetCount(a1);
      sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void LogUnconfigGuessCriterionTrue(CFMutableArrayRef, const char *, const char *)", 800, (uint64_t)"\nAuto Guess step: %d\n\t%s\t\t:\t%s\n\t%s\t:\t%s\n", v10, v11, v12, v13, Count + 1);
    }
    uint64_t v14 = MEMORY[0x263EF83A0];
    dispatch_sync_f(v14, a1, (dispatch_function_t)sub_2268DB2AC);
  }
}

void sub_2268DB2AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef v12 = 0;
  if (a1)
  {
    int v8 = sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], (CFTypeRef *)&v12, (uint64_t)"{%ks=%O}", a4, a5, a6, a7, a8, (uint64_t)"BSAutoGuess_StateTrace");
    CFDictionaryRef v9 = v12;
    if (v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v12 == 0;
    }
    if (!v10)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      if (LocalCenter) {
        CFNotificationCenterPostNotificationWithOptions(LocalCenter, @"com.apple.airport.autoguess.debug.progress", 0, v12, 1uLL);
      }
      CFDictionaryRef v9 = v12;
    }
    if (v9) {
      CFRelease(v9);
    }
  }
}

void sub_2268DB33C(const __CFArray *a1, unsigned char *a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1
    && a2
    && a3
    && *a2
    && *a3
    && !sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], a1, (uint64_t)"{%ks=%s%ks=%s%ks=%i%ks=%b}", a4, a5, a6, a7, a8, (uint64_t)"KEY_TITLE"))
  {
    if (dword_268147A98 <= 800 && (dword_268147A98 != -1 || sub_226865630((uint64_t)&dword_268147A98, 0x320u)))
    {
      CFIndex Count = CFArrayGetCount(a1);
      sub_226865EB4((uint64_t)&dword_268147A98, (uint64_t)"void LogUnconfigGuessCriterionTrueWithInt32Value(CFMutableArrayRef, const char *, const char *, int32_t)", 800, (uint64_t)"\nAuto Guess step: %d\n\t%s\t\t:\t%s\n\t%s\t:\t%s\n\t%s\t\t:\t%d\n", v10, v11, v12, v13, Count + 1);
    }
    uint64_t v14 = MEMORY[0x263EF83A0];
    dispatch_sync_f(v14, a1, (dispatch_function_t)sub_2268DB2AC);
  }
}

BOOL sub_2268DB4A8(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"Boolean BSAssistant_RefObjGood(CFTypeRef)", 800, (uint64_t)"inRefObj: %@ \n", a5, a6, a7, a8, (uint64_t)a1);
  }
  if (a1 && (CFTypeID TypeID = CFStringGetTypeID(), TypeID == CFGetTypeID(a1))) {
    return CFStringCompare(a1, @"bad!", 0) != kCFCompareEqualTo;
  }
  else {
    return 0;
  }
}

uint64_t sub_2268DB560(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_ContextCreate(AssistantContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v31);
  }
  if (!a1) {
    return 4294960591;
  }
  CFDictionaryRef v9 = malloc_type_calloc(1uLL, 0x68uLL, 0x10A0040E715EC04uLL);
  if (!v9) {
    return 4294960568;
  }
  uint64_t v16 = v9;
  v9[9] = 0;
  *(_OWORD *)CFDictionaryRef v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_WORD *)v9 + 16) = 257;
  *((void *)v9 + 6) = 0;
  *((void *)v9 + 8) = 0;
  *((void *)v9 + 9) = 0;
  CFAllocatorRef v17 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t v18 = sub_226855B2C(*MEMORY[0x263EFFB08], @"BSAssistant", v10, v11, v12, v13, v14, v15);
  *((void *)v16 + 12) = v18;
  if (!v18 || (CFMutableStringRef Mutable = CFStringCreateMutable(v17, 10), (*((void *)v16 + 10) = Mutable) == 0))
  {
    uint64_t v29 = 4294960568;
LABEL_19:
    sub_2268DB710(v16, v19, v20, v21, v22, v23, v24, v25);
    return v29;
  }
  uint64_t v27 = Mutable;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _RefObjSetGood(CFTypeRef)", 800, (uint64_t)"inRefObj: %@ \n", v22, v23, v24, v25, (uint64_t)v27);
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(v27))
  {
    uint64_t v29 = 4294960591;
    goto LABEL_19;
  }
  CFStringReplaceAll(v27, @"GOOD");
  uint64_t v29 = 0;
  v16[22] = 1634561902;
  *a1 = v16;
  return v29;
}

uint64_t sub_2268DB710(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_ContextRelease(AssistantContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v15);
  }
  if (!a1 || a1[22] != 1634561902) {
    return 4294960578;
  }
  CFDictionaryRef v9 = (const void *)*((void *)a1 + 6);
  if (v9)
  {
    CFRelease(v9);
    *((void *)a1 + 6) = 0;
  }
  uint64_t v10 = (const void *)*((void *)a1 + 12);
  if (v10)
  {
    CFRelease(v10);
    *((void *)a1 + 12) = 0;
  }
  a1[22] = 1095585614;
  *((void *)a1 + 2) = 0;
  *((void *)a1 + 8) = 0;
  *((void *)a1 + 9) = 0;
  uint64_t v11 = (__CFString *)*((void *)a1 + 10);
  if (!v11) {
    goto LABEL_19;
  }
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _RefObjSetDone(CFTypeRef)", 800, (uint64_t)"inRefObj: %@ \n", a5, a6, a7, a8, (uint64_t)v11);
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(v11))
  {
    CFStringReplaceAll(v11, @"bad!");
    uint64_t v13 = (const void *)*((void *)a1 + 10);
    if (v13) {
      CFRelease(v13);
    }
LABEL_19:
    free(a1);
    return 0;
  }
  return 4294960591;
}

uint64_t sub_2268DB87C(uint64_t a1, void *a2)
{
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (*(void *)(a1 + 64) && *(void *)(a1 + 72)) {
    return 4294960587;
  }
  v6 = (char *)malloc_type_calloc(1uLL, 0x88uLL, 0x10A0040185FE424uLL);
  if (!v6) {
    return 4294960568;
  }
  v7 = v6;
  BOOL v8 = *(void *)(a1 + 64) == 0;
  *((void *)v6 + 1) = a1;
  uint64_t v9 = 64;
  if (!v8) {
    uint64_t v9 = 72;
  }
  *(void *)(a1 + v9) = v6;
  uint64_t v10 = !v8;
  *((_DWORD *)v6 + 4) = 0;
  *((_DWORD *)v6 + 8) = 0;
  *((void *)v6 + 15) = 0;
  *((void *)v6 + 16) = v10;
  *((void *)v6 + 6) = 0;
  uint64_t v4 = pthread_mutex_init((pthread_mutex_t *)(v6 + 56), 0);
  if (!v4)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *((void *)v7 + 3) = Mutable;
    if (Mutable)
    {
      uint64_t v4 = 0;
      *((void *)v7 + 5) = dispatch_semaphore_create(0);
      *(_DWORD *)v7 = 1634561902;
      *a2 = v7;
      return v4;
    }
    uint64_t v4 = 4294960568;
  }
  sub_2268DB9AC(v7);
  return v4;
}

uint64_t sub_2268DB9AC(char *a1)
{
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)a1 != 1634561902) {
    return 4294960578;
  }
  v2 = (const void *)*((void *)a1 + 3);
  if (v2)
  {
    CFRelease(v2);
    *((void *)a1 + 3) = 0;
  }
  *(_DWORD *)a1 = 1095585614;
  v3 = *((void *)a1 + 5);
  if (v3) {
    dispatch_release(v3);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 56));
  uint64_t v4 = *((void *)a1 + 1);
  if (v4)
  {
    uint64_t v5 = 72;
    if (!*((void *)a1 + 16)) {
      uint64_t v5 = 64;
    }
    *(void *)(v4 + v5) = 0;
  }
  free(a1);
  return 0;
}

uint64_t sub_2268DBA54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_Cancel(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v15);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  int v9 = *(_DWORD *)(a1 + 36);
  if (v9 != 2)
  {
    if (!v9) {
      return 4294960576;
    }
    *(_DWORD *)(a1 + 36) = 2;
    uint64_t v11 = *(void *)(a1 + 64);
    if (v11)
    {
      uint64_t v12 = *(NSObject **)(v11 + 40);
      if (v12) {
        dispatch_semaphore_signal(v12);
      }
    }
    uint64_t v13 = *(void *)(a1 + 72);
    if (v13)
    {
      uint64_t v14 = *(NSObject **)(v13 + 40);
      if (v14) {
        dispatch_semaphore_signal(v14);
      }
    }
  }
  return 4294960525;
}

uint64_t sub_2268DBB2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetToRunningState(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if ((*(_DWORD *)(a1 + 36) | 2) != 2) {
    return 4294960587;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 36) = 1;
  return result;
}

uint64_t sub_2268DBBDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetToIdleState(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v10);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t result = *(unsigned int *)(a1 + 36);
  if (result)
  {
    if (result == 1)
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 36) = 0;
    }
    else
    {
      return 4294960587;
    }
  }
  return result;
}

BOOL sub_2268DBC88(uint64_t a1)
{
  return !a1 || *(_DWORD *)(a1 + 88) != 1634561902 || *(_DWORD *)(a1 + 36) == 2;
}

uint64_t sub_2268DBCB8(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_GetSaveBasePasswordToKeychain(AssistantContextRef, Boolean *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (!a2) {
    return 4294960591;
  }
  uint64_t result = 0;
  *a2 = *(unsigned char *)(a1 + 32);
  return result;
}

uint64_t sub_2268DBD60(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetSaveBasePasswordToKeychain(AssistantContextRef, Boolean)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 32) = a2;
  return result;
}

uint64_t sub_2268DBDF8(uint64_t a1, unsigned char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_GetSaveWiFiPasswordToKeychain(AssistantContextRef, Boolean *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (!a2) {
    return 4294960591;
  }
  uint64_t result = 0;
  *a2 = *(unsigned char *)(a1 + 33);
  return result;
}

uint64_t sub_2268DBEA0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetSaveWiFiPasswordToKeychain(AssistantContextRef, Boolean)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 33) = a2;
  return result;
}

uint64_t sub_2268DBF38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetAssistantCallback(AssistantContextRef, assistant_callback_t, void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v12);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (*(void *)a1) {
    return 4294960577;
  }
  uint64_t result = 0;
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = a3;
  return result;
}

uint64_t sub_2268DBFEC(void *context, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!context) {
    return 4294960578;
  }
  if (*(_DWORD *)context != 1634561902) {
    return 4294960578;
  }
  if (!context[3]) {
    return 4294960591;
  }
  uint64_t v9 = context[1];
  if (!v9 || *(_DWORD *)(v9 + 88) != 1634561902 || !*(void *)v9) {
    return 4294960591;
  }
  if (*(_DWORD *)(v9 + 36) == 2) {
    return 4294960573;
  }
  if (!a2) {
    return 4294960591;
  }
  *((_DWORD *)context + 4) = a2;
  *((_DWORD *)context + 8) = 0;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CallbackPerform(AssistantCallbackContextRef, eAssistantCallback)", 800, (uint64_t)" %d...\n", a5, a6, a7, a8, a2);
  }
  dispatch_async_f(MEMORY[0x263EF83A0], context, (dispatch_function_t)sub_2268DC104);
  return 0;
}

uint64_t sub_2268DC104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_PerformCallbackOnMain(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v12);
  }
  if (a1 && *(_DWORD *)a1 == 1634561902)
  {
    uint64_t v9 = *(void *)(a1 + 8);
    if (v9 && *(void *)v9 && *(void *)(a1 + 24) && *(_DWORD *)(a1 + 16))
    {
      if (*(_DWORD *)(v9 + 36) == 2)
      {
        uint64_t v10 = 4294960573;
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(uint64_t))v9)(a1);
        uint64_t v10 = result;
        if (!result) {
          return result;
        }
      }
    }
    else
    {
      uint64_t v10 = 4294960591;
    }
  }
  else
  {
    uint64_t v10 = 4294960578;
  }
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_PerformCallbackOnMain(void *)", 800, (uint64_t)"failing err: %#m\n", a5, a6, a7, a8, v10);
  }

  return sub_2268DD134((void *)a1, v10, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_2268DC264(void *context, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!context) {
    return 4294960578;
  }
  if (*(_DWORD *)context != 1634561902) {
    return 4294960578;
  }
  if (!context[3]) {
    return 4294960591;
  }
  uint64_t v9 = context[1];
  if (!v9 || *(_DWORD *)(v9 + 88) != 1634561902 || !*(void *)v9) {
    return 4294960591;
  }
  if (*(_DWORD *)(v9 + 36) == 2) {
    return 4294960573;
  }
  if (!a2) {
    return 4294960591;
  }
  *((_DWORD *)context + 4) = a2;
  *((_DWORD *)context + 8) = 0;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CallbackPerformSync(AssistantCallbackContextRef, eAssistantCallback)", 800, (uint64_t)" %d...\n", a5, a6, a7, a8, a2);
  }
  dispatch_sync_f(MEMORY[0x263EF83A0], context, (dispatch_function_t)sub_2268DC104);
  return 0;
}

uint64_t sub_2268DC37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)a1 != 1634561902) {
    return 4294960578;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9 || *(_DWORD *)(v9 + 88) != 1634561902 || !*(void *)(a1 + 40)) {
    return 4294960591;
  }
  if (*(_DWORD *)(v9 + 36) == 2) {
    return 4294960573;
  }
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_Wait(AssistantCallbackContextRef)", 800, (uint64_t)" SLEEP... inContext->callbackResult: %#m\n", a5, a6, a7, a8, *(unsigned int *)(a1 + 32));
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_Wait(AssistantCallbackContextRef)", 800, (uint64_t)" AWAKE...\n", v11, v12, v13, v14, v15);
  }
  if (*(_DWORD *)(*(void *)(a1 + 8) + 36) == 2) {
    return 4294960573;
  }
  else {
    return 0;
  }
}

uint64_t sub_2268DC4C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetProgressCallback(AssistantContextRef, assistant_progress_t, void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v12);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t result = 0;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  return result;
}

void sub_2268DC568(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void BSAssistant_ProgressStatus_Dict(AssistantContextRef, int, OSStatus, CFDictionaryRef)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  }
  if (a1 && *(_DWORD *)(a1 + 88) == 1634561902 && *(void *)(a1 + 16))
  {
    CFTypeRef v20 = 0;
    uint64_t v21 = 0;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    int v12 = a4
        ? sub_22685FC7C(v11, &v20, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%O}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"): sub_22685FC7C(v11, &v20, (uint64_t)"{%ks=%i%ks=%i}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector");
    if (!v12 && v20 != 0)
    {
      int v19 = sub_2268DC6E8(a1, v20, &v21, v13, v14, v15, v16, v17);
      if (v20)
      {
        CFRelease(v20);
        CFTypeRef v20 = 0;
      }
      if (!v19)
      {
        if (v21) {
          dispatch_async_f(MEMORY[0x263EF83A0], v21, (dispatch_function_t)sub_2268DC814);
        }
      }
    }
  }
}

uint64_t sub_2268DC6E8(uint64_t a1, const void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus __ProgressContext_Create(AssistantContextRef, CFDictionaryRef, __ProgressContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v23);
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (!a3) {
    return 4294960591;
  }
  CFAllocatorRef v11 = malloc_type_calloc(1uLL, 0x20uLL, 0x10E0040E9A6435BuLL);
  if (!v11) {
    return 4294960568;
  }
  int v19 = v11;
  *CFAllocatorRef v11 = a1;
  v11[1] = a2;
  if (a2) {
    CFRetain(a2);
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902)
  {
    uint64_t v21 = 4294960578;
LABEL_18:
    sub_2268E1118(v19, v12, v13, v14, v15, v16, v17, v18);
    return v21;
  }
  CFTypeRef v20 = *(const void **)(a1 + 80);
  if (!v20)
  {
    uint64_t v21 = 4294960591;
    goto LABEL_18;
  }
  v19[3] = v20;
  CFRetain(v20);
  uint64_t v21 = 0;
  *((_DWORD *)v19 + 4) = 1634561902;
  *a3 = v19;
  return v21;
}

void sub_2268DC814(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    unsigned int v21 = 0;
    unsigned int v20 = 0;
    uint64_t v19 = 0;
    if (*((_DWORD *)a1 + 4) == 1634561902 && sub_2268DB4A8((const __CFString *)a1[3], a2, a3, a4, a5, a6, a7, a8))
    {
      uint64_t v9 = *a1;
      if (*a1)
      {
        if (*(_DWORD *)(v9 + 88) == 1634561902)
        {
          if (*(void *)(v9 + 16))
          {
            CFStringRef v10 = (const __CFString *)a1[1];
            if (v10)
            {
              sub_22686088C(v10, (uint64_t)&v21, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector");
              if (!v11)
              {
                sub_22686088C((const __CFString *)a1[1], (uint64_t)&v20, (UInt8 *)"%ks:err", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_OSStatus");
                if (!v12)
                {
                  sub_22686088C((const __CFString *)a1[1], (uint64_t)&v19, (UInt8 *)"%ks", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_DictionaryParam");
                  if (!v13) {
                    goto LABEL_13;
                  }
                  if (v13 == -6727)
                  {
                    uint64_t v19 = 0;
LABEL_13:
                    if (dword_268147AD8 <= 800
                      && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)))
                    {
                      sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __Progress_CallbackOnMain(void *)", 800, (uint64_t)"selector: %d status %#m\n", a5, a6, a7, a8, v21);
                    }
                    (*(void (**)(void, void, uint64_t, void))(*a1 + 16))(v21, v20, v19, *(void *)(*a1 + 24));
                    sub_2268E11E0(v21, v20, v19, v14, v15, v16, v17, v18);
                  }
                }
              }
            }
          }
        }
      }
    }
    sub_2268E1118(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

void sub_2268DC994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void BSAssistant_ProgressStatusWithSubSelector_Dict(AssistantContextRef, int, int, OSStatus, CFDictionaryRef)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  }
  if (a1)
  {
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      if (*(void *)(a1 + 16))
      {
        CFTypeRef v16 = 0;
        uint64_t v17 = 0;
        if (!sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], &v16, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%O%ks=%i}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"))
        {
          if (v16)
          {
            int v15 = sub_2268DC6E8(a1, v16, &v17, v10, v11, v12, v13, v14);
            if (v16)
            {
              CFRelease(v16);
              CFTypeRef v16 = 0;
            }
            if (!v15)
            {
              if (v17) {
                dispatch_async_f(MEMORY[0x263EF83A0], v17, (dispatch_function_t)sub_2268DC814);
              }
            }
          }
        }
      }
    }
  }
}

void sub_2268DCB00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void BSAssistant_ProgressStatus_String(AssistantContextRef, int, OSStatus, CFStringRef)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  }
  if (a1 && *(_DWORD *)(a1 + 88) == 1634561902 && *(void *)(a1 + 16))
  {
    CFTypeRef v20 = 0;
    unsigned int v21 = 0;
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    int v12 = a4
        ? sub_22685FC7C(v11, &v20, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%O}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"): sub_22685FC7C(v11, &v20, (uint64_t)"{%ks=%i%ks=%i}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector");
    if (!v12 && v20 != 0)
    {
      int v19 = sub_2268DC6E8(a1, v20, &v21, v13, v14, v15, v16, v17);
      if (v20)
      {
        CFRelease(v20);
        CFTypeRef v20 = 0;
      }
      if (!v19)
      {
        if (v21) {
          dispatch_async_f(MEMORY[0x263EF83A0], v21, (dispatch_function_t)sub_2268DC814);
        }
      }
    }
  }
}

void sub_2268DCC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void BSAssistant_ProgressStatus_Number(AssistantContextRef, int, OSStatus, CFIndex)", 800, (uint64_t)"inSelector: %d inStatus %#m\n", a5, a6, a7, a8, a2);
  }
  if (a1)
  {
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      if (*(void *)(a1 + 16))
      {
        CFTypeRef v16 = 0;
        uint64_t v17 = 0;
        if (!sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], &v16, (uint64_t)"{%ks=%i%ks=%i%ks={%ks=%i}}", a4, a5, a6, a7, a8, (uint64_t)"kProgressParam_ProgressSelector"))
        {
          if (v16)
          {
            int v15 = sub_2268DC6E8(a1, v16, &v17, v10, v11, v12, v13, v14);
            if (v16)
            {
              CFRelease(v16);
              CFTypeRef v16 = 0;
            }
            if (!v15)
            {
              if (v17) {
                dispatch_async_f(MEMORY[0x263EF83A0], v17, (dispatch_function_t)sub_2268DC814);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2268DCDD4(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 4294960591;
  }
  uint64_t result = 4294960591;
  if (a2)
  {
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 40);
    }
  }
  return result;
}

uint64_t sub_2268DCE10(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 4294960591;
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960591;
  }
  if (a2 > 2) {
    return 4294960586;
  }
  *(_DWORD *)(a1 + 40) = a2;
  sub_2268DCC80(a1, 13, 0, a2, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_2268DCE78(uint64_t a1, CFDictionaryRef *a2)
{
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 48);
  if (!v3) {
    return 4294960578;
  }
  CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], v3);
  *a2 = Copy;
  if (Copy) {
    return 0;
  }
  else {
    return 4294960568;
  }
}

void sub_2268DCEEC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
    {
      if (a3)
      {
        if (a2)
        {
          CFStringRef v9 = *(const __CFString **)(a1 + 24);
          if (v9)
          {
            uint64_t v11 = 0;
            sub_22686088C(v9, (uint64_t)&v11, (UInt8 *)"%kO", a4, a5, a6, a7, a8, a2);
            if (!v10)
            {
              if (v11) {
                *a3 = v11;
              }
            }
          }
        }
      }
    }
  }
}

void sub_2268DCF8C(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
    {
      if (a3)
      {
        if (a2)
        {
          CFStringRef v9 = *(const __CFString **)(a1 + 24);
          if (v9)
          {
            int v11 = 0;
            sub_22686088C(v9, (uint64_t)&v11, (UInt8 *)"%kO:int", a4, a5, a6, a7, a8, a2);
            if (!v10) {
              *a3 = v11;
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2268DD020(uint64_t a1, const void *a2)
{
  if (a1 && *(_DWORD *)a1 == 1634561902 && a2 && (CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 24)) != 0) {
    return CFDictionaryContainsKey(v2, a2);
  }
  else {
    return 0;
  }
}

uint64_t sub_2268DD050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || *(_DWORD *)a1 != 1634561902) {
    return 4294960578;
  }
  uint64_t result = 4294960591;
  if (a3 && a2)
  {
    int v10 = *(__CFArray **)(a1 + 24);
    if (v10) {
      return sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], v10, (uint64_t)"%kO=%O", a4, a5, a6, a7, a8, a2);
    }
  }
  return result;
}

uint64_t sub_2268DD0C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1 || *(_DWORD *)a1 != 1634561902) {
    return 4294960578;
  }
  uint64_t result = 4294960591;
  if (a2)
  {
    int v10 = *(__CFArray **)(a1 + 24);
    if (v10) {
      return sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], v10, (uint64_t)"%kO=%i", a4, a5, a6, a7, a8, a2);
    }
  }
  return result;
}

uint64_t sub_2268DD134(void *context, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!context) {
    return 4294960578;
  }
  if (*(_DWORD *)context != 1634561902) {
    return 4294960578;
  }
  if (!context[5]) {
    return 4294960591;
  }
  *((_DWORD *)context + 8) = a2;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CallbackWithFinalResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)" %d result: %#m ...\n", a5, a6, a7, a8, *((unsigned int *)context + 4));
  }
  dispatch_async_f(MEMORY[0x263EF83A0], context, (dispatch_function_t)sub_2268DD218);
  return 0;
}

intptr_t sub_2268DD218(intptr_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  intptr_t v8 = result;
  if (dword_268147AD8 > 800
    || dword_268147AD8 == -1 && (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), !result))
  {
    if (!v8) {
      return result;
    }
  }
  else
  {
    uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_CallbackWithFinalResultOnMain(void *)", 800, (uint64_t)" %d result: %#m...\n", a5, a6, a7, a8, *(unsigned int *)(v8 + 16));
  }
  if (*(_DWORD *)v8 == 1634561902)
  {
    uint64_t result = *(void *)(v8 + 40);
    if (result)
    {
      return dispatch_semaphore_signal((dispatch_semaphore_t)result);
    }
  }
  return result;
}

uint64_t sub_2268DD2DC(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyConfigurationChangeLogs(AssistantContextRef, CFStringRef, CFArrayRef, CFArrayRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v38);
  }
  context = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (!a4) {
    return 4294960591;
  }
  CFTypeRef cf = 0;
  uint64_t v12 = sub_2268DB87C(a1, &context);
  int v19 = (char *)context;
  if (!v12)
  {
    if (!context) {
      return 4294960568;
    }
    if (!a2) {
      goto LABEL_35;
    }
    if (*(_DWORD *)context != 1634561902)
    {
      uint64_t v20 = 4294960578;
      goto LABEL_10;
    }
    uint64_t v22 = (__CFArray *)*((void *)context + 3);
    if (!v22)
    {
      uint64_t v20 = 4294960591;
      goto LABEL_10;
    }
    uint64_t v20 = sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], v22, (uint64_t)"%kO=%O", v14, v15, v16, v17, v18, @"BSAssistantCallback_String");
    if (!v20)
    {
LABEL_35:
      if (!a3
        || (uint64_t v20 = sub_2268DD050((uint64_t)v19, @"BSAssistantCallback_StringList", a3, v14, v15, v16, v17, v18), !v20))
      {
        uint64_t v20 = sub_2268DBFEC(v19, 11, v13, v14, v15, v16, v17, v18);
        if (!v20)
        {
          uint64_t v30 = sub_2268DC37C((uint64_t)v19, v23, v24, v25, v26, v27, v28, v29);
          uint64_t v20 = *((unsigned int *)v19 + 8);
          if (v20)
          {
            if (v20 == -6727) {
              uint64_t v20 = 4294960569;
            }
          }
          else
          {
            uint64_t v20 = v30;
            if (!v30)
            {
              sub_2268DCEEC((uint64_t)v19, @"BSAssistantCallback_ConfigChangeLogs", &cf, v31, v32, v33, v34, v35);
              uint64_t v20 = v36;
              if (!v36)
              {
                CFTypeRef v37 = cf;
                if (cf)
                {
                  *a4 = cf;
                  CFRetain(v37);
                  uint64_t v20 = 0;
                }
                else
                {
                  uint64_t v20 = 4294960568;
                }
              }
            }
          }
        }
      }
    }
LABEL_10:
    sub_2268DB9AC(v19);
    return v20;
  }
  uint64_t v20 = v12;
  if (context) {
    goto LABEL_10;
  }
  return v20;
}

uint64_t sub_2268DD4C4(uint64_t a1, CFTypeRef *a2, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyCurrentNetworkAssociationInfo(AssistantContextRef, CFStringRef *, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v50);
  }
  context = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if ((unint64_t)a2 | (unint64_t)a3)
  {
    CFTypeRef cf = 0;
    CFStringRef v53 = 0;
    CFTypeRef v51 = 0;
    uint64_t v11 = sub_2268DB87C(a1, &context);
    uint64_t v18 = (char *)context;
    if (v11)
    {
      uint64_t v19 = v11;
      if (!context) {
        return v19;
      }
      goto LABEL_16;
    }
    if (!context) {
      return 4294960568;
    }
    uint64_t v19 = sub_2268DBFEC(context, 8, v12, v13, v14, v15, v16, v17);
    if (v19) {
      goto LABEL_16;
    }
    uint64_t v28 = sub_2268DC37C((uint64_t)v18, v21, v22, v23, v24, v25, v26, v27);
    uint64_t v19 = *((unsigned int *)v18 + 8);
    if (v19)
    {
      if (v19 == -6727) {
        uint64_t v19 = 4294960569;
      }
      goto LABEL_16;
    }
    uint64_t v19 = v28;
    if (!v28)
    {
      sub_2268DCEEC((uint64_t)v18, @"BSAssistantCallback_AssociationInfo", &v53, v29, v30, v31, v32, v33);
      uint64_t v19 = v39;
      if (!v39)
      {
        if (!v53) {
          goto LABEL_35;
        }
        if (!a2)
        {
LABEL_28:
          if (!a3)
          {
LABEL_34:
            uint64_t v19 = 0;
            goto LABEL_16;
          }
          sub_22686088C(v53, (uint64_t)&v51, (UInt8 *)"%kO", v34, v35, v36, v37, v38, @"BSSID");
          uint64_t v19 = v47;
          if (v47 == -6727)
          {
            sub_22686088C(v53, (uint64_t)&v51, (UInt8 *)"%kO", v42, v43, v44, v45, v46, @"BSSID");
            uint64_t v19 = v48;
          }
          if (v19) {
            goto LABEL_16;
          }
          CFTypeRef v49 = v51;
          if (v51)
          {
            *a3 = v51;
            CFRetain(v49);
            goto LABEL_34;
          }
LABEL_35:
          uint64_t v19 = 4294960568;
          goto LABEL_16;
        }
        sub_22686088C(v53, (uint64_t)&cf, (UInt8 *)"%kO", v34, v35, v36, v37, v38, @"SSID_STR");
        uint64_t v19 = v40;
        if (!v40)
        {
          CFTypeRef v41 = cf;
          if (!cf) {
            goto LABEL_35;
          }
          *a2 = cf;
          CFRetain(v41);
          goto LABEL_28;
        }
      }
    }
LABEL_16:
    sub_2268DB9AC(v18);
    return v19;
  }
  return 4294960591;
}

BOOL sub_2268DD6CC(uint64_t a1, const __CFString *a2, CFStringRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"Boolean BSAssistant_IsAssociatedToNetworkNamedAndCopyCurrentNetworkName(AssistantContextRef, CFStringRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v13);
  }
  BOOL v11 = 0;
  if (a1)
  {
    if (a2)
    {
      if (*(_DWORD *)(a1 + 88) == 1634561902)
      {
        CFStringRef theString2 = 0;
        BOOL v11 = 0;
        if (!sub_2268DD4C4(a1, (CFTypeRef *)&theString2, 0, a4, a5, a6, a7, a8))
        {
          BOOL v11 = CFEqual(a2, theString2);
          if (a3)
          {
            *a3 = theString2;
          }
          else if (theString2)
          {
            CFRelease(theString2);
          }
        }
      }
    }
  }
  return v11;
}

uint64_t sub_2268DD7D0(uint64_t a1)
{
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v43 = 0;
  uint64_t v2 = sub_2268DB87C(a1, &v43);
  uint64_t v3 = v43;
  if (v2)
  {
    uint64_t v4 = v2;
    if (!v43) {
      return v4;
    }
    goto LABEL_25;
  }
  if (v43)
  {
    int valuePtr = 60;
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
    if (!v6)
    {
      uint64_t v4 = 4294960568;
      goto LABEL_25;
    }
    CFNumberRef v12 = v6;
    if (*(_DWORD *)v3 == 1634561902)
    {
      uint64_t v13 = *(__CFArray **)(v3 + 24);
      if (v13)
      {
        uint64_t v4 = sub_226860774(v5, v13, (uint64_t)"%kO=%O", v7, v8, v9, v10, v11, @"BSAssistantCallback_Number");
        CFRelease(v12);
        if (v4) {
          goto LABEL_25;
        }
        sub_2268E1274(v3, v14, v15, v16, v17, v18, v19, v20);
        if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _DisassociateNetwork(AssistantContextRef)", 800, (uint64_t)"\n", v23, v24, v25, v26, v41);
        }
        context = 0;
        if (*(_DWORD *)(a1 + 88) != 1634561902)
        {
          uint64_t v4 = 4294960578;
LABEL_31:
          sub_2268DFB94(v3, 4294960573, v21, v22, v23, v24, v25, v26);
          goto LABEL_25;
        }
        uint64_t v27 = sub_2268DB87C(a1, &context);
        uint64_t v28 = (char *)context;
        if (v27)
        {
          uint64_t v4 = v27;
          if (!context) {
            goto LABEL_31;
          }
          goto LABEL_30;
        }
        if (!context)
        {
          uint64_t v4 = 4294960568;
          goto LABEL_31;
        }
        uint64_t v4 = sub_2268DBFEC(context, 9, v21, v22, v23, v24, v25, v26);
        if (v4) {
          goto LABEL_30;
        }
        uint64_t v37 = sub_2268DC37C((uint64_t)v28, v30, v31, v32, v33, v34, v35, v36);
        uint64_t v4 = *((unsigned int *)v28 + 8);
        if (v4 == -6727)
        {
          uint64_t v4 = 4294960569;
        }
        else if (!v4)
        {
          uint64_t v38 = v37;
          sub_2268DB9AC(v28);
          uint64_t v4 = v38;
          if (v38) {
            goto LABEL_31;
          }
          uint64_t v40 = sub_2268DC37C(v3, v39, v21, v22, v23, v24, v25, v26);
          if (!v40)
          {
            uint64_t v4 = *(unsigned int *)(v3 + 32);
            goto LABEL_25;
          }
          uint64_t v4 = v40;
          if (v40 == -6723)
          {
            uint64_t v4 = 4294960573;
            goto LABEL_31;
          }
LABEL_25:
          sub_2268DB9AC((char *)v3);
          return v4;
        }
LABEL_30:
        sub_2268DB9AC(v28);
        goto LABEL_31;
      }
      uint64_t v4 = 4294960591;
    }
    else
    {
      uint64_t v4 = 4294960578;
    }
    CFRelease(v6);
    goto LABEL_25;
  }
  return 4294960568;
}

uint64_t sub_2268DDA20(uint64_t a1, const __CFString *a2, const __CFString *cf)
{
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v5 = 4294960591;
  if (a2 && cf)
  {
    CFRetain(cf);
    if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)))
    {
      sub_22685B6F8(cf, v7, v8, v9, v10, v11, v12, v13);
      sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_ScanForNetworkUntilBaseNOTFound(AssistantContextRef, CFStringRef, CFDictionaryRef)", 800, (uint64_t)"inNetworkName: %@ inBaseStation: %@\n", v14, v15, v16, v17, (uint64_t)a2);
    }
    uint64_t v18 = 0;
    CFTypeRef cfa = 0;
    while (1)
    {
      int v19 = dword_268147AD8;
      if (v18)
      {
        if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_ScanForNetworkUntilBaseNOTFound(AssistantContextRef, CFStringRef, CFDictionaryRef)", 800, (uint64_t)"waiting err: %#m pauseSecs: %d\n", v10, v11, v12, v13, 0);
        }
        uint64_t v20 = sub_2268DDC20(a1, 6);
        if (v20)
        {
          uint64_t v5 = v20;
LABEL_31:
          CFRelease(cf);
          return v5;
        }
        int v19 = dword_268147AD8;
      }
      if (v19 <= 800 && (v19 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_ScanForNetworkUntilBaseNOTFound(AssistantContextRef, CFStringRef, CFDictionaryRef)", 800, (uint64_t)"retries: %d\n", v10, v11, v12, v13, v18);
      }
      uint64_t v5 = sub_2268DDD28(a1, a2, cf, 3, &cfa, v11, v12, v13);
      if (cfa)
      {
        CFRelease(cfa);
        CFTypeRef cfa = 0;
      }
      if (v5)
      {
        if (v5 != -6727) {
          goto LABEL_31;
        }
LABEL_29:
        uint64_t v5 = 0;
        goto LABEL_31;
      }
      if (++v18 == 21) {
        goto LABEL_29;
      }
    }
  }
  return v5;
}

uint64_t sub_2268DDC20(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v4 = mach_absolute_time();
  unint64_t v9 = v4 / sub_226870FE0();
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SleepSecs(AssistantContextRef, CFIndex)", 800, (uint64_t)"inTimeoutSecs: %d\n", v5, v6, v7, v8, a2);
  }
  unint64_t v10 = v9 + a2;
  while (1)
  {
    uint64_t v11 = mach_absolute_time();
    if (v11 / sub_226870FE0() >= v10) {
      break;
    }
    sleep(1u);
    if (*(_DWORD *)(a1 + 88) != 1634561902 || *(_DWORD *)(a1 + 36) == 2) {
      return 4294960573;
    }
  }
  return 0;
}

uint64_t sub_2268DDD28(uint64_t a1, const __CFString *a2, const __CFString *cf, int a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyScanForFirstNetworkNamedCreatedByBaseStation(AssistantContextRef, CFStringRef, CFDictionaryRef, WiFiType, CFDictionaryRef *)", 800, (uint64_t)"inNetworkName: %@\n", (uint64_t)a5, a6, a7, a8, (uint64_t)a2);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v13 = 4294960591;
  if (a2 && a4 && a5)
  {
    if (cf) {
      CFRetain(cf);
    }
    CFArrayRef theArray = 0;
    uint64_t v13 = sub_2268DE0C0(a1, (uint64_t)a2, a4, 1, (uint64_t)&theArray, a6, a7, a8);
    if (!v13)
    {
      if (cf)
      {
        CFIndex v14 = sub_22685C29C(cf, theArray);
        if (v14 == -1)
        {
          uint64_t v13 = 4294960569;
LABEL_21:
          CFRelease(cf);
          return v13;
        }
      }
      else
      {
        CFIndex v14 = sub_22685C0BC(a2, a4, 0, theArray);
        if (v14 == -1) {
          return 4294960569;
        }
      }
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(theArray, v14);
      *a5 = ValueAtIndex;
      CFRetain(ValueAtIndex);
    }
    if (cf) {
      goto LABEL_21;
    }
  }
  return v13;
}

uint64_t sub_2268DDE9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_ClearScanCache(AssistantContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v27);
  }
  context = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v9 = sub_2268DB87C(a1, &context);
  uint64_t v16 = (char *)context;
  if (v9)
  {
    uint64_t v17 = v9;
    if (!context) {
      return v17;
    }
  }
  else
  {
    if (!context) {
      return 4294960568;
    }
    uint64_t v17 = sub_2268DBFEC(context, 10, v10, v11, v12, v13, v14, v15);
    if (!v17)
    {
      uint64_t v26 = sub_2268DC37C((uint64_t)v16, v18, v19, v20, v21, v22, v23, v24);
      uint64_t v17 = *((unsigned int *)v16 + 8);
      if (v17)
      {
        if (v17 == -6727) {
          uint64_t v17 = 4294960569;
        }
      }
      else
      {
        uint64_t v17 = v26;
      }
    }
  }
  sub_2268DB9AC(v16);
  return v17;
}

uint64_t sub_2268DDFAC(uint64_t a1, const __CFString *a2, int a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyScanForFirstNetworkNamed(AssistantContextRef, CFStringRef, WiFiType, CFDictionaryRef *)", 800, (uint64_t)"inNetworkName: %@\n", a5, a6, a7, a8, (uint64_t)a2);
  }
  CFTypeRef cf = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v12 = 4294960591;
  if (a2 && a3 && a4)
  {
    uint64_t v12 = sub_2268DDD28(a1, a2, 0, a3, &cf, a6, a7, a8);
    if (v12)
    {
      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      uint64_t v12 = 0;
      *a4 = cf;
    }
  }
  return v12;
}

uint64_t sub_2268DE0C0(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyScanForNetworks(AssistantContextRef, CFStringRef, WiFiType, Boolean, CFArrayRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v74);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
  {
    uint64_t v18 = 4294960578;
    goto LABEL_66;
  }
  if (!a5)
  {
    uint64_t v18 = 4294960591;
    goto LABEL_66;
  }
  if (a2) {
    uint64_t v13 = 9;
  }
  else {
    uint64_t v13 = 1;
  }
  sub_2268DCB00(a1, v13, 0, a2, a5, a6, a7, a8);
  uint64_t v14 = mach_absolute_time();
  unint64_t v15 = v14 / sub_226870FE0() + 12;
  uint64_t v16 = mach_absolute_time();
  if (v16 / sub_226870FE0() >= v15) {
    goto LABEL_75;
  }
  uint64_t v76 = (void *)a5;
  CFArrayRef v77 = 0;
  int v17 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  if (a4) {
    uint64_t v20 = (uint64_t *)MEMORY[0x263EFFB40];
  }
  else {
    uint64_t v20 = (uint64_t *)MEMORY[0x263EFFB38];
  }
  uint64_t v75 = *v20;
  do
  {
    if (v17)
    {
      if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyScanForNetworks(AssistantContextRef, CFStringRef, WiFiType, Boolean, CFArrayRef *)", 800, (uint64_t)"waiting in retries err: %#m pauseSecs: %d (kDefault_ScanningBusy_RetrySecs)\n", a5, a6, a7, a8, v18);
      }
      uint64_t v21 = sub_2268DDC20(a1, 2);
      if (v21)
      {
        uint64_t v18 = v21;
        goto LABEL_66;
      }
      uint64_t v19 = (v19 + 2);
    }
    int v81 = v19;
    int valuePtr = a3;
    if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _CopyScanForNetworks(AssistantContextRef, CFStringRef, WiFiType, Boolean, uint32_t, CFArrayRef *)", 800, (uint64_t)"inMaxAge: %d\n", a5, a6, a7, a8, v19);
    }
    uint64_t v80 = 0;
    if (*(_DWORD *)(a1 + 88) == 1634561902)
    {
      CFArrayRef theArray = 0;
      uint64_t v22 = sub_2268DB87C(a1, &v80);
      uint64_t v28 = v80;
      if (v22)
      {
        uint64_t v18 = v22;
        if (!v80) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
      if (v80)
      {
        if (!a2) {
          goto LABEL_41;
        }
        if (*(_DWORD *)v80 != 1634561902)
        {
          uint64_t v18 = 4294960578;
          goto LABEL_30;
        }
        uint64_t v30 = *(__CFArray **)(v80 + 24);
        if (!v30)
        {
          uint64_t v18 = 4294960591;
          goto LABEL_30;
        }
        uint64_t v31 = sub_226860774(allocator, v30, (uint64_t)"%kO=%O", v23, v24, v25, v26, v27, @"BSAssistantCallback_String");
        if (v31) {
          goto LABEL_39;
        }
LABEL_41:
        CFNumberRef v32 = CFNumberCreate(allocator, kCFNumberCFIndexType, &valuePtr);
        if (!v32) {
          goto LABEL_63;
        }
        CFNumberRef v38 = v32;
        if (*(_DWORD *)v28 == 1634561902)
        {
          uint64_t v39 = *(__CFArray **)(v28 + 24);
          if (v39)
          {
            uint64_t v18 = sub_226860774(allocator, v39, (uint64_t)"%kO=%O", v33, v34, v35, v36, v37, @"BSAssistantCallback_WiFiType");
            CFRelease(v38);
            if (v18) {
              goto LABEL_30;
            }
            uint64_t v31 = sub_2268DD050(v28, @"BSAssistantCallback_Boolean", v75, v40, v41, v42, v43, v44);
            if (v31) {
              goto LABEL_39;
            }
            CFNumberRef v45 = CFNumberCreate(allocator, kCFNumberCFIndexType, &v81);
            if (v45)
            {
              CFNumberRef v51 = v45;
              uint64_t v18 = sub_2268DD050(v28, @"BSAssistantCallback_Number", (uint64_t)v45, v46, v47, v48, v49, v50);
              CFRelease(v51);
              if (!v18)
              {
                uint64_t v31 = sub_2268DBFEC((void *)v28, 7, v52, v53, v54, v55, v56, v57);
                if (!v31)
                {
                  uint64_t v65 = sub_2268DC37C(v28, v58, v59, v60, v61, v62, v63, v64);
                  int v71 = *(_DWORD *)(v28 + 32);
                  if (v71 == -6723)
                  {
                    uint64_t v18 = *(unsigned int *)(v28 + 32);
                    goto LABEL_30;
                  }
                  if (v71 == -6721)
                  {
                    uint64_t v18 = 4294960575;
                    goto LABEL_30;
                  }
                  uint64_t v18 = v65;
                  if (v65) {
                    goto LABEL_30;
                  }
                  sub_2268DCEEC(v28, @"BSAssistantCallback_ScanInfoRecords", &theArray, v66, v67, v68, v69, v70);
                  if (!v31)
                  {
                    if (theArray)
                    {
                      if (CFArrayGetCount(theArray))
                      {
                        CFArrayRef v77 = theArray;
                        CFRetain(theArray);
                        uint64_t v18 = 0;
                      }
                      else
                      {
                        uint64_t v18 = 4294960569;
                      }
                      goto LABEL_30;
                    }
                    goto LABEL_63;
                  }
                }
LABEL_39:
                uint64_t v18 = v31;
              }
LABEL_30:
              sub_2268DB9AC((char *)v28);
              goto LABEL_32;
            }
LABEL_63:
            uint64_t v18 = 4294960568;
            goto LABEL_30;
          }
          uint64_t v18 = 4294960591;
        }
        else
        {
          uint64_t v18 = 4294960578;
        }
        CFRelease(v32);
        goto LABEL_30;
      }
      uint64_t v18 = 4294960568;
    }
    else
    {
      uint64_t v18 = 4294960578;
    }
LABEL_32:
    uint64_t v29 = mach_absolute_time();
    --v17;
  }
  while (v29 / sub_226870FE0() < v15);
  if (v18) {
    goto LABEL_66;
  }
  if (v77)
  {
    if (CFArrayGetCount(v77))
    {
      *uint64_t v76 = v77;
      CFRetain(v77);
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = 4294960569;
    }
    goto LABEL_66;
  }
LABEL_75:
  uint64_t v18 = 4294960568;
LABEL_66:
  if (a2) {
    uint64_t v72 = 10;
  }
  else {
    uint64_t v72 = 2;
  }
  sub_2268DCB00(a1, v72, v18, 0, a5, a6, a7, a8);
  return v18;
}

uint64_t sub_2268DE568(uint64_t a1, const __CFString *a2, const __CFString *a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyGetKeychainPassword(AssistantContextRef, CFStringRef, CFDictionaryRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v53);
  }
  uint64_t v56 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v12 = 4294960591;
  if (!a2 || !a3 || !a4) {
    return v12;
  }
  CFTypeRef cf = 0;
  uint64_t v13 = sub_2268DB87C(a1, &v56);
  uint64_t v14 = v56;
  if (!v13)
  {
    if (!v56) {
      return 4294960568;
    }
    if (CFStringCompare(a2, @"keychainBaseStationType", 0))
    {
      uint64_t v12 = sub_2268DD050(v14, @"BSAssistantCallback_ScanInfo", (uint64_t)a3, v17, v18, v19, v20, v21);
      if (v12) {
        goto LABEL_12;
      }
    }
    else
    {
      CFTypeRef v54 = 0;
      uint64_t v47 = sub_22685B410(a3, (__CFArray **)&v54, v16, v17, v18, v19, v20, v21);
      if (v47)
      {
        uint64_t v12 = v47;
        goto LABEL_12;
      }
      if (!v54) {
        goto LABEL_33;
      }
      uint64_t v12 = sub_2268DD050(v14, @"BSAssistantCallback_KeychainAccounts", (uint64_t)v54, v48, v49, v50, v51, v52);
      if (v54) {
        CFRelease(v54);
      }
      if (v12) {
        goto LABEL_12;
      }
    }
    uint64_t v12 = sub_2268DD050(v14, @"BSAssistantCallback_KeychainServiceType", (uint64_t)a2, v22, v23, v24, v25, v26);
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v12 = sub_2268DBFEC((void *)v14, 13, v27, v28, v29, v30, v31, v32);
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v12 = sub_2268DC37C(v14, v33, v34, v35, v36, v37, v38, v39);
    if (v12) {
      goto LABEL_12;
    }
    uint64_t v12 = *(unsigned int *)(v14 + 32);
    if (v12) {
      goto LABEL_12;
    }
    sub_2268DCEEC(v14, @"BSAssistantCallback_String", &cf, v40, v41, v42, v43, v44);
    uint64_t v12 = v45;
    if (v45) {
      goto LABEL_12;
    }
    CFTypeRef v46 = cf;
    if (cf)
    {
      *a4 = cf;
      CFRetain(v46);
      uint64_t v12 = 0;
      goto LABEL_12;
    }
LABEL_33:
    uint64_t v12 = 4294960568;
    goto LABEL_12;
  }
  uint64_t v12 = v13;
  if (v56) {
LABEL_12:
  }
    sub_2268DB9AC((char *)v14);
  return v12;
}

uint64_t sub_2268DE768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_SetKeychainPassword(AssistantContextRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v46);
  }
  uint64_t v47 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v13 = 4294960591;
  if (a2 && a3 && a5)
  {
    uint64_t v14 = sub_2268DB87C(a1, &v47);
    uint64_t v20 = v47;
    if (v14)
    {
      uint64_t v13 = v14;
      if (!v47) {
        return v13;
      }
      goto LABEL_28;
    }
    if (v47)
    {
      if (*(_DWORD *)v47 == 1634561902)
      {
        uint64_t v22 = *(__CFArray **)(v47 + 24);
        if (v22)
        {
          uint64_t v13 = sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], v22, (uint64_t)"%kO=%O", v15, v16, v17, v18, v19, @"BSAssistantCallback_KeychainAccount");
          if (!v13)
          {
            uint64_t v13 = sub_2268DD050(v20, @"BSAssistantCallback_KeychainServiceType", a2, v23, v24, v25, v26, v27);
            if (!v13)
            {
              if (!a4
                || (uint64_t v13 = sub_2268DD050(v20, @"BSAssistantCallback_KeychainDeviceName", a4, v28, v29, v30, v31, v32), !v13))
              {
                uint64_t v13 = sub_2268DD050(v20, @"BSAssistantCallback_String", a5, v28, v29, v30, v31, v32);
                if (!v13)
                {
                  uint64_t v13 = sub_2268DBFEC((void *)v20, 14, v33, v34, v35, v36, v37, v38);
                  if (!v13)
                  {
                    uint64_t v13 = sub_2268DC37C(v20, v39, v40, v41, v42, v43, v44, v45);
                    if (!v13) {
                      uint64_t v13 = *(unsigned int *)(v20 + 32);
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        uint64_t v13 = 4294960578;
      }
LABEL_28:
      sub_2268DB9AC((char *)v20);
      return v13;
    }
    return 4294960568;
  }
  return v13;
}

uint64_t sub_2268DE938(uint64_t a1, const __CFString *a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyAskUserForPassword(AssistantContextRef, CFStringRef, CFStringRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v66);
  }
  uint64_t v69 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v12 = 4294960591;
  if (a2 && a4)
  {
    CFTypeRef cf = 0;
    char v67 = 0;
    uint64_t v13 = sub_2268DB87C(a1, &v69);
    uint64_t v19 = v69;
    if (v13)
    {
      uint64_t v12 = v13;
      if (!v69) {
        return v12;
      }
      goto LABEL_31;
    }
    if (v69)
    {
      if (*(_DWORD *)v69 != 1634561902)
      {
        uint64_t v12 = 4294960578;
        goto LABEL_31;
      }
      uint64_t v21 = *(__CFArray **)(v69 + 24);
      if (!v21) {
        goto LABEL_31;
      }
      uint64_t v12 = sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], v21, (uint64_t)"%kO=%O", v14, v15, v16, v17, v18, @"BSAssistantCallback_KeychainServiceType");
      if (v12) {
        goto LABEL_31;
      }
      uint64_t v12 = sub_2268DD050(v19, @"BSAssistantCallback_KeychainDeviceName", a3, v22, v23, v24, v25, v26);
      if (v12) {
        goto LABEL_31;
      }
      uint64_t v12 = sub_2268DBFEC((void *)v19, 12, v27, v28, v29, v30, v31, v32);
      if (v12) {
        goto LABEL_31;
      }
      uint64_t v12 = sub_2268DC37C(v19, v33, v34, v35, v36, v37, v38, v39);
      if (v12) {
        goto LABEL_31;
      }
      uint64_t v12 = *(unsigned int *)(v19 + 32);
      if (v12) {
        goto LABEL_31;
      }
      sub_2268DCEEC(v19, @"BSAssistantCallback_String", &cf, v40, v41, v42, v43, v44);
      uint64_t v12 = v50;
      if (v50) {
        goto LABEL_31;
      }
      if (!cf)
      {
        uint64_t v12 = 4294960568;
        goto LABEL_31;
      }
      sub_22686088C(*(const __CFString **)(v19 + 24), (uint64_t)&v67, (UInt8 *)"%ks:BOOL", v45, v46, v47, v48, v49, (uint64_t)"BSAssistantCallback_Boolean");
      if (v51 != -6727)
      {
        uint64_t v12 = v51;
        if (v51) {
          goto LABEL_31;
        }
        if (CFEqual(a2, @"keychainBaseStationType"))
        {
          uint64_t v64 = sub_2268DBD60(a1, v67, v52, v53, v54, v55, v56, v57);
LABEL_34:
          uint64_t v12 = v64;
          if (!v64) {
            goto LABEL_35;
          }
LABEL_31:
          sub_2268DB9AC((char *)v19);
          return v12;
        }
        if (CFEqual(a2, @"keychainNetworkType"))
        {
          uint64_t v64 = sub_2268DBEA0(a1, v67, v58, v59, v60, v61, v62, v63);
          goto LABEL_34;
        }
      }
LABEL_35:
      CFTypeRef v65 = cf;
      *a4 = cf;
      CFRetain(v65);
      uint64_t v12 = 0;
      goto LABEL_31;
    }
    return 4294960568;
  }
  return v12;
}

uint64_t sub_2268DEB94(uint64_t a1, const __CFString *a2, uint64_t a3, void *a4)
{
  CFTypeRef cf = 0;
  if (!a1) {
    return 4294960578;
  }
  uint64_t v17 = 0;
  if (*(_DWORD *)(a1 + 88) == 1634561902)
  {
    uint64_t v5 = 4294960591;
    if (a2 && a3 >= 1 && a4)
    {
      uint64_t v7 = sub_2268DECC0(a1, a2, 0, 0, a3, (CFNumberRef *)&cf);
      if (v7)
      {
        uint64_t v5 = v7;
        if (v7 != -6722) {
          goto LABEL_11;
        }
      }
      else
      {
        if (!cf) {
          return 4294960568;
        }
        uint64_t v9 = sub_22685BC94((const __CFArray *)cf, a2);
        if (v9 != -1)
        {
          sub_22686088C((const __CFString *)cf, (uint64_t)&v17, (UInt8 *)"[*]:obj", v10, v11, v12, v13, v14, v9);
          uint64_t v5 = v15;
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (!v5)
          {
            if (v17)
            {
              uint64_t v5 = 0;
              *a4 = v17;
              uint64_t v17 = 0;
            }
            else
            {
              uint64_t v5 = 4294960568;
            }
          }
          goto LABEL_11;
        }
      }
      uint64_t v5 = 4294960569;
    }
  }
  else
  {
    uint64_t v5 = 4294960578;
  }
LABEL_11:
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

uint64_t sub_2268DECC0(uint64_t a1, const __CFString *a2, uint64_t a3, int a4, uint64_t a5, CFNumberRef *a6)
{
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  if (a2) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 1;
  }
  uint64_t v13 = mach_absolute_time();
  unint64_t v18 = v13 / sub_226870FE0() + a5;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _CopyBrowsedDevicesWithTimeout(AssistantContextRef, CFStringRef, CFNumberRef, Boolean, CFIndex, CFArrayRef *)", 800, (uint64_t)"retries into: %dx\n", v14, v15, v16, v17, v12);
  }
  uint64_t v19 = mach_absolute_time();
  if (v19 / sub_226870FE0() < v18)
  {
    uint64_t v24 = 0;
    uint64_t v25 = a6;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v95 = v25;
    uint64_t v97 = a5 / v12;
    if (v25) {
      BOOL v28 = a5 / v12 == 0;
    }
    else {
      BOOL v28 = 1;
    }
    char v29 = v28;
    uint64_t v30 = (uint64_t *)MEMORY[0x263EFFB40];
    if (!a4) {
      uint64_t v30 = (uint64_t *)MEMORY[0x263EFFB38];
    }
    CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    uint64_t v96 = *v30;
    while (1)
    {
      if (v24)
      {
        if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _CopyBrowsedDevicesWithTimeout(AssistantContextRef, CFStringRef, CFNumberRef, Boolean, CFIndex, CFArrayRef *)", 800, (uint64_t)"waiting in retries err: %#m pauseSecs: %d duplicateErrors: %d\n", v20, v21, v22, v23, v27);
        }
        uint64_t v31 = sub_2268DDC20(a1, 5);
        if (v31) {
          return v31;
        }
      }
      if (v26 >= 5) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = a3;
      }
      if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _CopyBrowsedDevicesWithTimeout_sub(AssistantContextRef, CFStringRef, CFNumberRef, Boolean, CFIndex, CFArrayRef *)", 800, (uint64_t)"inStopAtMACAddress: %@\n", v20, v21, v22, v23, (uint64_t)a2);
      }
      uint64_t v100 = 0;
      int v33 = *(_DWORD *)(a1 + 88);
      BOOL v34 = v33 == 1634561902;
      if (v33 == 1634561902) {
        char v35 = v29;
      }
      else {
        char v35 = 1;
      }
      if (v34) {
        uint64_t v27 = 4294960591;
      }
      else {
        uint64_t v27 = 4294960578;
      }
      if (v35) {
        goto LABEL_44;
      }
      uint64_t v36 = sub_2268DB87C(a1, &v100);
      uint64_t v42 = v100;
      if (v36)
      {
        uint64_t v27 = v36;
        if (!v100) {
          goto LABEL_42;
        }
        goto LABEL_41;
      }
      if (!v100)
      {
        uint64_t v27 = 4294960568;
        if (!a2) {
          return v27;
        }
        goto LABEL_45;
      }
      if (!a2) {
        goto LABEL_60;
      }
      if (*(_DWORD *)v100 != 1634561902) {
        goto LABEL_73;
      }
      uint64_t v45 = *(__CFArray **)(v100 + 24);
      if (!v45) {
        goto LABEL_76;
      }
      uint64_t v27 = sub_226860774(allocator, v45, (uint64_t)"%kO=%O", v37, v38, v39, v40, v41, @"BSAssistantCallback_String");
      if (!v27)
      {
        if (!v32) {
          goto LABEL_60;
        }
        if (*(_DWORD *)v42 != 1634561902)
        {
LABEL_73:
          uint64_t v27 = 4294960578;
          goto LABEL_41;
        }
        uint64_t v51 = *(__CFArray **)(v42 + 24);
        if (!v51)
        {
LABEL_76:
          uint64_t v27 = 4294960591;
          goto LABEL_41;
        }
        uint64_t v27 = sub_226860774(allocator, v51, (uint64_t)"%kO=%O", v46, v47, v48, v49, v50, @"BSAssistantCallback_BonjourSeed");
        if (!v27)
        {
LABEL_60:
          int valuePtr = v97;
          CFNumberRef v52 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
          if (v52)
          {
            CFNumberRef v58 = v52;
            if (*(_DWORD *)v42 != 1634561902)
            {
              uint64_t v27 = 4294960578;
              goto LABEL_78;
            }
            uint64_t v59 = *(__CFArray **)(v42 + 24);
            if (!v59)
            {
              uint64_t v27 = 4294960591;
              goto LABEL_78;
            }
            uint64_t v27 = sub_226860774(allocator, v59, (uint64_t)"%kO=%O", v53, v54, v55, v56, v57, @"BSAssistantCallback_Number");
            CFRelease(v58);
            if (v27) {
              goto LABEL_41;
            }
            uint64_t v27 = sub_2268DD050(v42, @"BSAssistantCallback_Boolean", v96, v60, v61, v62, v63, v64);
            if (v27) {
              goto LABEL_41;
            }
            CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, 0, MEMORY[0x263EFFF70]);
            if (Mutable)
            {
              CFNumberRef v58 = Mutable;
              uint64_t v27 = sub_2268DD050(v42, @"BSAssistantCallback_BrowseRecords", (uint64_t)Mutable, v66, v67, v68, v69, v70);
              if (!v27)
              {
                uint64_t v27 = sub_2268E1708((_DWORD *)v42, v71, v72, v73, v74, v75, v76, v77);
                if (!v27)
                {
                  uint64_t v85 = sub_2268DC37C(v42, v78, v79, v80, v81, v82, v83, v84);
                  if (v85)
                  {
                    uint64_t v27 = v85;
                    if (v85 == -6723)
                    {
                      uint64_t v27 = 4294960573;
                      sub_2268E1918((NSObject **)v42, -6723, v86, v87, v88, v89, v90, v91);
                    }
                    goto LABEL_78;
                  }
                  uint64_t v27 = *(unsigned int *)(v42 + 32);
                  BOOL v93 = v27 != -6722 && v27 != -6745;
                  if (!a2 && !v93)
                  {
                    *(_DWORD *)(v42 + 32) = 0;
                    goto LABEL_88;
                  }
                  if (a2 && v27 == -6745)
                  {
                    uint64_t v27 = 4294960569;
                    *(_DWORD *)(v42 + 32) = -6727;
                  }
                  else if (!v27)
                  {
LABEL_88:
                    if (CFArrayGetCount(v58) && (!a2 || sub_22685BC94(v58, a2) != -1))
                    {
                      uint64_t v27 = 0;
                      *uint64_t v95 = v58;
                      goto LABEL_41;
                    }
                    uint64_t v27 = 4294960569;
                  }
                }
              }
LABEL_78:
              CFRelease(v58);
              goto LABEL_41;
            }
          }
          uint64_t v27 = 4294960568;
        }
      }
LABEL_41:
      sub_2268DB9AC((char *)v42);
LABEL_42:
      if (v27 == -6730) {
        ++v26;
      }
LABEL_44:
      if (!a2) {
        return v27;
      }
LABEL_45:
      if ((v27 + 6730) <= 8 && ((1 << (v27 + 74)) & 0x109) != 0)
      {
        uint64_t v44 = mach_absolute_time();
        --v24;
        if (v44 / sub_226870FE0() < v18) {
          continue;
        }
      }
      return v27;
    }
  }
  return 0;
}

uint64_t sub_2268DF1D0(uint64_t a1, __CFString *a2, const __CFString *cf, int a4, uint64_t a5, CFTypeRef *a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cfa = 0;
  if (a6) {
    *a6 = 0;
  }
  CFStringRef v42 = 0;
  uint64_t v39 = 0;
  CFStringRef v40 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902)
  {
    uint64_t v14 = 4294960578;
    goto LABEL_19;
  }
  uint64_t v14 = 4294960591;
  if (!cf || a5 < 1 || !a6)
  {
LABEL_19:
    CFStringRef v22 = 0;
    uint64_t v23 = 0;
    if (!a6) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  CFRetain(cf);
  if (a2) {
    CFRetain(a2);
  }
  sub_22686088C(cf, (uint64_t)&v40, (UInt8 *)"%ks.%ks", v15, v16, v17, v18, v19, (uint64_t)"txt");
  uint64_t v14 = v21;
  CFStringRef v22 = cf;
  uint64_t v23 = a2;
  if (!v21)
  {
    if (!v40) {
      goto LABEL_46;
    }
    uint64_t v39 = 0;
    if (a4)
    {
      sub_22686088C(cf, (uint64_t)&v39, (UInt8 *)"%ks.%ks", v20, a5, (uint64_t)a6, a7, a8, (uint64_t)"txt");
      if (v24 != -6727)
      {
        uint64_t v14 = v24;
        CFStringRef v22 = cf;
        uint64_t v23 = a2;
        if (v24) {
          goto LABEL_20;
        }
        if (!v39) {
          goto LABEL_46;
        }
      }
    }
    if (a2) {
      sub_2268DCB00(a1, 7, 0, (uint64_t)a2, a5, (uint64_t)a6, a7, a8);
    }
    else {
      sub_2268DC568(a1, 7, 0, (uint64_t)cf, a5, (uint64_t)a6, a7, a8);
    }
    uint64_t v33 = v39;
    CFStringRef v32 = v40;
    sub_22685AFD0(cf);
    uint64_t v35 = sub_2268DECC0(a1, v32, v33, v34, a5, (CFNumberRef *)&cfa);
    if (v35 == -6722) {
      goto LABEL_47;
    }
    uint64_t v14 = v35;
    CFStringRef v22 = cf;
    uint64_t v23 = a2;
    if (v35) {
      goto LABEL_20;
    }
    if (!cfa) {
      goto LABEL_46;
    }
    uint64_t v36 = sub_22685BC94((const __CFArray *)cfa, v40);
    if (v36 == -1)
    {
LABEL_47:
      uint64_t v14 = 4294960569;
      goto LABEL_48;
    }
    sub_22686088C((const __CFString *)cfa, (uint64_t)&v42, (UInt8 *)"[*]:obj", v37, a5, (uint64_t)a6, a7, a8, v36);
    uint64_t v14 = v38;
    if (cfa)
    {
      CFRelease(cfa);
      CFTypeRef cfa = 0;
    }
    CFStringRef v22 = cf;
    uint64_t v23 = a2;
    if (!v14)
    {
      CFStringRef v25 = v42;
      if (v42)
      {
        uint64_t v14 = 0;
        *a6 = v42;
        CFStringRef v42 = 0;
        uint64_t v23 = a2;
        CFStringRef v22 = cf;
        goto LABEL_21;
      }
LABEL_46:
      uint64_t v14 = 4294960568;
LABEL_48:
      CFStringRef v22 = cf;
      uint64_t v23 = a2;
    }
  }
LABEL_20:
  CFStringRef v25 = (const __CFString *)*a6;
  if (*a6)
  {
LABEL_21:
    uint64_t v26 = a1;
    uint64_t v27 = v14;
LABEL_24:
    sub_2268DC568(v26, 8, v27, (uint64_t)v25, a5, (uint64_t)a6, a7, a8);
    goto LABEL_29;
  }
LABEL_22:
  if (cf)
  {
    uint64_t v26 = a1;
    uint64_t v27 = v14;
    CFStringRef v25 = cf;
    goto LABEL_24;
  }
  if (a2)
  {
    uint64_t v28 = a1;
    uint64_t v29 = v14;
    uint64_t v30 = a2;
  }
  else
  {
    uint64_t v30 = &stru_26DA6BE88;
    uint64_t v28 = a1;
    uint64_t v29 = v14;
  }
  sub_2268DCB00(v28, 8, v29, (uint64_t)v30, a5, (uint64_t)a6, a7, a8);
LABEL_29:
  if (cfa)
  {
    CFRelease(cfa);
    CFTypeRef cfa = 0;
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  return v14;
}

uint64_t sub_2268DF4A0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t result = 4294960591;
  if (a2 >= 1)
  {
    if (a3)
    {
      CFNumberRef v17 = 0;
      sub_2268DC568(a1, 3, 0, 0, a5, a6, a7, a8);
      uint64_t v12 = sub_2268DECC0(a1, 0, 0, 0, a2, &v17);
      sub_2268DC568(a1, 4, 0, 0, v13, v14, v15, v16);
      uint64_t result = 4294960569;
      if (v12 != -6727 && v12 != -6722)
      {
        uint64_t result = v12;
        if (!v12)
        {
          if (v17)
          {
            uint64_t result = 0;
            *a3 = v17;
          }
          else
          {
            return 4294960568;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2268DF598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_WarnUser(AssistantContextRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef, CFStringRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v45);
  }
  uint64_t v46 = 0;
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v17 = 4294960591;
  if (a2 && a5)
  {
    uint64_t v18 = sub_2268DB87C(a1, &v46);
    uint64_t v24 = v46;
    if (v18)
    {
      uint64_t v17 = v18;
      if (!v46) {
        return v17;
      }
      goto LABEL_36;
    }
    if (v46)
    {
      if (*(_DWORD *)v46 == 1634561902)
      {
        uint64_t v26 = *(__CFArray **)(v46 + 24);
        if (v26)
        {
          uint64_t v17 = sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], v26, (uint64_t)"%kO=%O", v19, v20, v21, v22, v23, @"kBSAssistantCallback_Warn_PromptKey");
          if (!v17)
          {
            if (!a3
              || (uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_PromptParam1", a3, v27, v28, v29, v30, v31), !v17))
            {
              if (!a4
                || (uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_PromptParam2", a4, v27, v28, v29, v30, v31), !v17))
              {
                uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_MessageKey", a5, v27, v28, v29, v30, v31);
                if (!v17)
                {
                  if (!a6
                    || (uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_MessageParam1", a6, v32, v33, v34, v35, v36), !v17))
                  {
                    if (!a7
                      || (uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_MessageParam2", a7, v32, v33, v34, v35, v36), !v17))
                    {
                      if (!a8
                        || (uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_OkKey", a8, v32, v33, v34, v35, v36), !v17))
                      {
                        uint64_t v37 = a9;
                        if (!a9
                          || (uint64_t v17 = sub_2268DD050(v24, @"kBSAssistantCallback_Warn_CancelKey", a9, v32, v33, v34, v35, v36), !v17))
                        {
                          uint64_t v17 = sub_2268DBFEC((void *)v24, 3, v37, v32, v33, v34, v35, v36);
                          if (!v17)
                          {
                            uint64_t v17 = sub_2268DC37C(v24, v38, v39, v40, v41, v42, v43, v44);
                            if (!v17) {
                              uint64_t v17 = *(unsigned int *)(v24 + 32);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        uint64_t v17 = 4294960578;
      }
LABEL_36:
      sub_2268DB9AC((char *)v24);
      return v17;
    }
    return 4294960568;
  }
  return v17;
}

uint64_t sub_2268DF7FC(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = 0;
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)(a1 + 88) == 1634561902)
  {
    int v3 = a2;
    uint64_t v4 = 4294960591;
    if (a2)
    {
      uint64_t v5 = *(void *)(a1 + 96);
      if (v5)
      {
        uint64_t v4 = sub_226856340(v5);
        if (v4 == -6709)
        {
          int valuePtr = v3;
          if (*(_DWORD *)(a1 + 88) == 1634561902 && *(_DWORD *)(a1 + 36) != 1)
          {
            uint64_t v44 = sub_2268DBB2C(a1, v6, v7, v8, v9, v10, v11, v12);
            if (v44)
            {
              uint64_t v4 = v44;
              int v13 = 0;
LABEL_25:
              if (v13) {
                sub_2268DBBDC(a1, v15, v16, v17, v18, v19, v20, v21);
              }
              goto LABEL_13;
            }
            int v13 = 1;
          }
          else
          {
            int v13 = 0;
          }
          uint64_t v14 = sub_2268DB87C(a1, &v46);
          if (v14)
          {
            uint64_t v4 = v14;
          }
          else
          {
            uint64_t v23 = v46;
            if (v46
              && (CFNumberRef v24 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr)) != 0)
            {
              CFNumberRef v25 = v24;
              uint64_t v4 = sub_2268DD050((uint64_t)v23, @"BSAssistantCallback_Number", (uint64_t)v24, v17, v18, v19, v20, v21);
              CFRelease(v25);
              if (!v4)
              {
                sub_2268DCB00(a1, 11, 0, 0, v18, v19, v20, v21);
                sub_2268DF9D0((uint64_t)v23, v26, v27, v28, v29, v30, v31, v32);
                uint64_t v4 = sub_2268DC37C((uint64_t)v23, v33, v34, v35, v36, v37, v38, v39);
                sub_2268DCB00(a1, 12, v4, 0, v40, v41, v42, v43);
                if (v4)
                {
                  if (v4 == -6723)
                  {
                    uint64_t v4 = 4294960573;
                    sub_2268DFB94((uint64_t)v23, 4294960573, v16, v17, v18, v19, v20, v21);
                  }
                }
                else
                {
                  uint64_t v4 = *((unsigned int *)v23 + 8);
                  if (v4 == -6722) {
                    uint64_t v4 = 4294960574;
                  }
                }
              }
            }
            else
            {
              uint64_t v4 = 4294960568;
            }
          }
          goto LABEL_25;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 4294960578;
  }
LABEL_13:
  if (v46) {
    sub_2268DB9AC(v46);
  }
  return v4;
}

uint64_t sub_2268DF9D0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (_DWORD *)result;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), result)) {
      uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_AssistantResourceAquiredCallbackStart(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v17);
    }
  }
  if (v8)
  {
    int v18 = 0;
    if (*v8 == 1634561902)
    {
      uint64_t v9 = *((void *)v8 + 1);
      if (v9 && *(void *)(v9 + 96))
      {
        sub_22686088C(*((const __CFString **)v8 + 3), (uint64_t)&v18, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Number");
        int v11 = v10;
        if (!v10)
        {
          if (v18 < 1)
          {
            int v11 = -6710;
          }
          else
          {
            uint64_t v12 = *((void *)v8 + 6);
            if (v12)
            {
              dispatch_source_cancel(v12);
              dispatch_release(*((dispatch_object_t *)v8 + 6));
              *((void *)v8 + 6) = 0;
            }
            global_queue = dispatch_get_global_queue(0, 0);
            uint64_t v14 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, global_queue);
            *((void *)v8 + 6) = v14;
            if (v14)
            {
              dispatch_set_context(v14, v8);
              dispatch_source_set_event_handler_f(*((dispatch_source_t *)v8 + 6), (dispatch_function_t)sub_2268E1F24);
              uint64_t v15 = *((void *)v8 + 6);
              dispatch_time_t v16 = dispatch_time(0, 1000000000 * v18);
              dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
              dispatch_resume(*((dispatch_object_t *)v8 + 6));
              uint64_t result = sub_226855D80(*(void *)(*((void *)v8 + 1) + 96), (uint64_t)sub_2268E1F44, (uint64_t)v8);
              int v11 = result;
              if (!result) {
                return result;
              }
            }
            else
            {
              int v11 = -6728;
            }
          }
        }
      }
      else
      {
        int v11 = -6705;
      }
    }
    else
    {
      int v11 = -6718;
    }
    return sub_2268DD134(v8, v11, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_2268DFB94(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_DWORD *)result;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), result)) {
      uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void _BSAssistant_LinkChangeCallbackStopWithResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)"result: %m\n", a5, a6, a7, a8, a2);
    }
  }
  if (v9)
  {
    if (*v9 == 1634561902)
    {
      uint64_t result = (uint64_t)CFNotificationCenterGetLocalCenter();
      if (result)
      {
        CFNotificationCenterRemoveObserver((CFNotificationCenterRef)result, v9, @"com.apple.AirPort.WiFiShim.Notification.LinkChange", 0);
        pthread_mutex_lock((pthread_mutex_t *)(v9 + 14));
        int v10 = *((void *)v9 + 6);
        if (v10)
        {
          dispatch_source_cancel(v10);
          dispatch_release(*((dispatch_object_t *)v9 + 6));
          *((void *)v9 + 6) = 0;
        }
        uint64_t result = pthread_mutex_unlock((pthread_mutex_t *)(v9 + 14));
        int v11 = a2;
      }
      else
      {
        int v11 = -6728;
      }
    }
    else
    {
      int v11 = -6718;
    }
    if (a2 != -6723)
    {
      return sub_2268DD134(v9, v11, a3, a4, a5, a6, a7, a8);
    }
  }
  return result;
}

uint64_t sub_2268DFCC0(uint64_t a1)
{
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v1 = *(void *)(a1 + 96);
  if (v1) {
    return sub_226856548(v1);
  }
  else {
    return 4294960591;
  }
}

uint64_t sub_2268DFCF4(uint64_t a1, const __CFString *a2, const __CFString *a3, int a4, const void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0;
  if (!a1) {
    return 4294960578;
  }
  if (*(_DWORD *)(a1 + 88) == 1634561902)
  {
    if (a2)
    {
      unint64_t v13 = 0;
      if (a4) {
        unint64_t v14 = 20;
      }
      else {
        unint64_t v14 = 2;
      }
      while (1)
      {
        if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_JoinNetworkNameWithPasswordPrompt(AssistantContextRef, CFStringRef, CFStringRef, Boolean, Boolean)", 800, (uint64_t)"retries: %d\n", (uint64_t)a5, a6, a7, a8, v13);
        }
        uint64_t v16 = sub_2268DDFAC(a1, a2, 3, &cf, (uint64_t)a5, a6, a7, a8);
        uint64_t v17 = v16;
        if (a4 && v16 == -6727)
        {
          uint64_t v17 = 4294960569;
          if (v13 >= v14) {
            goto LABEL_33;
          }
        }
        else
        {
          if (v16) {
            goto LABEL_33;
          }
          if (!cf) {
            return 4294960568;
          }
          uint64_t v17 = sub_2268DFF04(a1, (const char *)cf, a3, a4, a5, 1, a7, a8);
          if (cf)
          {
            CFRelease(cf);
            CFTypeRef cf = 0;
          }
          if (v13 >= v14 || v17 != -3905 && v17 != -6727) {
            goto LABEL_33;
          }
        }
        if (++v13)
        {
          if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_JoinNetworkNameWithPasswordPrompt(AssistantContextRef, CFStringRef, CFStringRef, Boolean, Boolean)", 800, (uint64_t)"waiting err: %#m pauseSecs: %d\n", (uint64_t)a5, a6, a7, a8, v17);
          }
          uint64_t v15 = sub_2268DDC20(a1, 6);
          if (v15)
          {
            uint64_t v17 = v15;
            goto LABEL_33;
          }
        }
      }
    }
    uint64_t v17 = 4294960591;
  }
  else
  {
    uint64_t v17 = 4294960578;
  }
LABEL_33:
  if (cf) {
    CFRelease(cf);
  }
  return v17;
}

uint64_t sub_2268DFEFC(uint64_t a1, const char *a2, const __CFString *a3, int a4, const void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_2268DFF04(a1, a2, a3, a4, a5, 1, a7, a8);
}

uint64_t sub_2268DFF04(uint64_t a1, const char *a2, const __CFString *a3, int a4, CFTypeRef a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a6;
  int v9 = (int)a5;
  CFTypeRef v89 = 0;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_JoinNetworkWithPasswordPromptAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, Boolean, Boolean)", 800, (uint64_t)" \n", (uint64_t)a5, a6, a7, a8, v81);
  }
  if (!a1)
  {
    uint64_t v28 = 4294960578;
    goto LABEL_113;
  }
  if (*(_DWORD *)(a1 + 88) != 1634561902)
  {
    uint64_t v28 = 4294960578;
    goto LABEL_108;
  }
  if (!a2)
  {
    uint64_t v28 = 4294960591;
    goto LABEL_113;
  }
  uint64_t v86 = sub_2269016D4((uint64_t)a2, a2);
  if (!v86)
  {
    uint64_t v28 = 4294960591;
    goto LABEL_112;
  }
  sub_2268DC568(a1, 5, 0, (uint64_t)a2, (uint64_t)a5, a6, a7, a8);
  CFStringRef v13 = a3;
  CFTypeRef v89 = a3;
  if (a3)
  {
    CFRetain(a3);
    CFStringRef v13 = a3;
  }
  if (a4) {
    int v14 = 2;
  }
  else {
    int v14 = 1;
  }
  unsigned int v88 = v14;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef v15 = v13;
  int v85 = v9;
  while (1)
  {
    if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _JoinNetworkRetryAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice, CFIndex, Boolean)", 800, (uint64_t)"\n", (uint64_t)a5, a6, a7, a8, v81);
    }
    if (*(_DWORD *)(a1 + 88) != 1634561902) {
      break;
    }
    uint64_t v16 = mach_absolute_time();
    uint64_t v17 = 0;
    int v18 = 0;
    unint64_t v19 = v16 / sub_226870FE0() + 12;
    while (1)
    {
      uint64_t v20 = mach_absolute_time();
      if (v20 / sub_226870FE0() >= v19)
      {
        uint64_t v28 = v17;
        goto LABEL_99;
      }
      if (v18)
      {
        if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _JoinNetworkRetryAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice, CFIndex, Boolean)", 800, (uint64_t)"waiting in retries err: %#m pauseSecs: %d (kDefault_JoiningBusy_RetrySecs)\n", (uint64_t)a5, a6, a7, a8, v17);
        }
        uint64_t v22 = sub_2268DDC20(a1, 2);
        if (v22) {
          break;
        }
      }
      if (v8)
      {
        uint64_t v91 = 0;
        if (*(_DWORD *)(a1 + 88) == 1634561902)
        {
          uint64_t v23 = sub_2269016D4((uint64_t)a2, v21);
          if (v23)
          {
            uint64_t v24 = v23;
            if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
              sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _JoinNetworkAndWait(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice, CFIndex)", 800, (uint64_t)"networkName: %@\n", (uint64_t)a5, a6, a7, a8, v24);
            }
            uint64_t v25 = sub_2268DB87C(a1, &v91);
            uint64_t v27 = v91;
            if (v25)
            {
              uint64_t v28 = v25;
              if (!v91) {
                goto LABEL_60;
              }
              goto LABEL_59;
            }
            if (v91)
            {
              if (*(_DWORD *)v91 != 1634561902)
              {
                uint64_t v28 = 4294960578;
                goto LABEL_59;
              }
              uint64_t v29 = *(__CFArray **)(v91 + 24);
              if (!v29)
              {
                uint64_t v28 = 4294960591;
                goto LABEL_59;
              }
              uint64_t v28 = sub_226860774(allocator, v29, (uint64_t)"%kO=%O", v26, (uint64_t)a5, a6, a7, a8, @"BSAssistantCallback_String");
              if (!v28)
              {
                int valuePtr = 60;
                CFNumberRef v30 = CFNumberCreate(allocator, kCFNumberSInt32Type, &valuePtr);
                if (!v30)
                {
                  uint64_t v28 = 4294960568;
                  goto LABEL_59;
                }
                CFNumberRef v36 = v30;
                if (*(_DWORD *)v27 == 1634561902)
                {
                  uint64_t v37 = *(__CFArray **)(v27 + 24);
                  if (v37)
                  {
                    uint64_t v28 = sub_226860774(allocator, v37, (uint64_t)"%kO=%O", v31, v32, v33, v34, v35, @"BSAssistantCallback_Number");
                    CFRelease(v36);
                    if (!v28)
                    {
                      sub_2268E1274(v27, v38, v39, v40, v41, v42, v43, v44);
                      uint64_t v49 = sub_2268E2228(a1, a2, (uint64_t)v15, v88, v45, v46, v47, v48);
                      if (v49)
                      {
                        uint64_t v28 = v49;
                        goto LABEL_51;
                      }
                      uint64_t v57 = sub_2268DC37C(v27, v50, v51, v52, v53, v54, v55, v56);
                      if (v57)
                      {
                        uint64_t v28 = v57;
                        if (v57 == -6723)
                        {
                          uint64_t v28 = 4294960573;
LABEL_51:
                          sub_2268DFB94(v27, 4294960573, v51, v52, v53, v54, v55, v56);
                        }
                      }
                      else
                      {
                        uint64_t v28 = *(unsigned int *)(v27 + 32);
                        if (v28)
                        {
                          if (v28 == -6722) {
                            uint64_t v28 = 4294960574;
                          }
                        }
                        else
                        {
                          if (dword_268147AD8 <= 800
                            && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)))
                          {
                            sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _BSAssistant_WaitForIPv6Flags(AssistantContextRef, CFIndex, int32_t, Boolean)", 800, (uint64_t)"inFlags: 0x%x inAND: %d\n", v53, v54, v55, v56, 2);
                          }
                          CFStringRef v94 = 0;
                          if (*(_DWORD *)(a1 + 88) == 1634561902)
                          {
                            uint64_t v58 = mach_absolute_time();
                            unint64_t v59 = v58 / sub_226870FE0() + 10;
                            CFStringRef v93 = 0;
                            uint64_t v60 = mach_absolute_time();
                            unint64_t v82 = v59;
                            if (v60 / sub_226870FE0() < v59)
                            {
                              while (!sub_226901590(&v94, v61, v62))
                              {
                                if (!v94) {
                                  break;
                                }
                                sub_22686088C(v94, (uint64_t)&v93, (UInt8 *)"%kO.%kO", v63, v64, v65, v66, v67, @"kNetworkLinkManager_LinkChangeKey_IPv6Dict");
                                if (v68) {
                                  break;
                                }
                                if (!v93) {
                                  break;
                                }
                                CFIndex Count = CFArrayGetCount((CFArrayRef)v93);
                                if (!Count) {
                                  break;
                                }
                                CFIndex v83 = Count;
                                if (Count >= 1)
                                {
                                  uint64_t v75 = 0;
                                  BOOL v76 = 1;
                                  while (1)
                                  {
                                    int v92 = 0;
                                    sub_22686088C(v93, (uint64_t)&v92, (UInt8 *)"[*]:int", v70, v71, v72, v73, v74, v75);
                                    if (v77) {
                                      goto LABEL_94;
                                    }
                                    if (dword_268147AD8 <= 800
                                      && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)))
                                    {
                                      sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _BSAssistant_WaitForIPv6Flags(AssistantContextRef, CFIndex, int32_t, Boolean)", 800, (uint64_t)"Checking IPv6 flags: 0x%x against: 0x%x\n", v71, v72, v73, v74, 2);
                                    }
                                    if ((v92 & 2) != 0)
                                    {
                                      BOOL v76 = ++v75 < v83;
                                      if (v83 != v75) {
                                        continue;
                                      }
                                    }
                                    goto LABEL_90;
                                  }
                                }
                                BOOL v76 = 0;
LABEL_90:
                                if (v94)
                                {
                                  CFRelease(v94);
                                  CFStringRef v94 = 0;
                                }
                                if (!v76)
                                {
                                  sub_2268DDC20(a1, 1);
                                  CFStringRef v93 = 0;
                                  uint64_t v78 = mach_absolute_time();
                                  if (v78 / sub_226870FE0() < v82) {
                                    continue;
                                  }
                                }
                                break;
                              }
                            }
LABEL_94:
                            if (v94) {
                              CFRelease(v94);
                            }
                          }
                          uint64_t v28 = 0;
                        }
                      }
                    }
                    goto LABEL_59;
                  }
                  uint64_t v28 = 4294960591;
                }
                else
                {
                  uint64_t v28 = 4294960578;
                }
                CFRelease(v30);
              }
LABEL_59:
              sub_2268DB9AC((char *)v27);
              goto LABEL_60;
            }
            uint64_t v28 = 4294960568;
          }
          else
          {
            uint64_t v28 = 4294960569;
          }
        }
        else
        {
          uint64_t v28 = 4294960578;
        }
      }
      else
      {
        uint64_t v28 = sub_2268E2228(a1, a2, (uint64_t)v15, v88, (uint64_t)a5, a6, a7, a8);
      }
LABEL_60:
      ++v18;
      uint64_t v17 = 4294960575;
      if (v28 != -6721) {
        goto LABEL_99;
      }
    }
    uint64_t v28 = v22;
LABEL_99:
    if (v28 != -16) {
      goto LABEL_117;
    }
    if (!v85)
    {
      uint64_t v28 = 4294967280;
      goto LABEL_108;
    }
    if (v89)
    {
      CFRelease(v89);
      CFTypeRef v89 = 0;
    }
    uint64_t v79 = sub_2268DE938(a1, @"keychainNetworkType", v86, &v89, (uint64_t)a5, a6, a7, a8);
    if (v79)
    {
      uint64_t v28 = v79;
      goto LABEL_108;
    }
    CFTypeRef v15 = v89;
    if (!v89)
    {
      uint64_t v28 = 4294960568;
      goto LABEL_108;
    }
  }
  uint64_t v28 = 4294960578;
LABEL_117:
  if (!v28)
  {
    if (*(unsigned char *)(a1 + 33))
    {
      a5 = v89;
      if (v89)
      {
        if (!a3) {
          goto LABEL_123;
        }
        if (CFStringCompare((CFStringRef)v89, a3, 0))
        {
          a5 = v89;
LABEL_123:
          sub_2268DE768(a1, @"keychainNetworkType", v86, 0, (uint64_t)a5, a6, a7, a8);
        }
        uint64_t v28 = 0;
      }
    }
  }
LABEL_108:
  if (a2) {
LABEL_112:
  }
    sub_2268DC568(a1, 6, 0, (uint64_t)a2, (uint64_t)a5, a6, a7, a8);
LABEL_113:
  if (v89) {
    CFRelease(v89);
  }
  return v28;
}

uint64_t sub_2268E065C(uint64_t a1, const __CFString *cf, int a3, int a4, const void *a5, CFStringRef *a6, void *a7, uint64_t a8)
{
  CFTypeRef cfa = 0;
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_CopyBrowseInfoForBaseAfterJoiningNetworkIfNeeded(AssistantContextRef, CFDictionaryRef, Boolean, Boolean, Boolean, CFStringRef *, CFDictionaryRef *)", 800, (uint64_t)" \n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, v37);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v15 = 4294960591;
  if (cf && a7)
  {
    CFRetain(cf);
    unsigned int v23 = sub_22685AC18((const __CFDictionary *)cf);
    if (!v23 && !sub_22685AE08(cf, v16, v17, v18, v19, v20, v21, v22)) {
      goto LABEL_14;
    }
    CFStringRef v24 = sub_22685B73C(cf, v16, v17, v18, v19, v20, v21, v22);
    if (v24)
    {
      CFStringRef v30 = v24;
      if (sub_2268DD6CC(a1, v24, a6, v25, v26, v27, v28, v29))
      {
        if (!v23)
        {
LABEL_14:
          CFTypeRef v34 = 0;
LABEL_26:
          uint64_t v15 = 0;
          *a7 = v34;
          goto LABEL_27;
        }
      }
      else
      {
        uint64_t v15 = sub_2268DFCF4(a1, v30, 0, a4, a5, v31, v32, v33);
        if (v15) {
          goto LABEL_28;
        }
      }
      if (a4) {
        uint64_t v36 = 120;
      }
      else {
        uint64_t v36 = 60;
      }
      uint64_t v15 = sub_2268DF1D0(a1, 0, cf, a3, v36, &cfa, v32, v33);
      CFTypeRef v34 = cfa;
      if (!v15)
      {
        if (!cfa)
        {
          uint64_t v15 = 4294960568;
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      if (cfa)
      {
        CFRelease(cfa);
LABEL_27:
        CFTypeRef cfa = 0;
      }
    }
    else
    {
      uint64_t v15 = 4294960569;
    }
LABEL_28:
    CFRelease(cf);
  }
  return v15;
}

uint64_t sub_2268E0818(uint64_t a1, const char *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_JoinNetworkAndBrowseForTheBaseStation(AssistantContextRef, CFDictionaryRef, Boolean, CFDictionaryRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v24);
  }
  if (!a1 || *(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  uint64_t v11 = 4294960591;
  if (a2 && a4)
  {
    CFStringRef v12 = (const __CFString *)sub_2269016D4((uint64_t)a2, a2);
    if (!v12) {
      return 4294960569;
    }
    if (sub_2268DD6CC(a1, v12, 0, v13, v14, v15, v16, v17)
      || (uint64_t v11 = sub_2268DFF04(a1, a2, 0, 0, 0, 1, v21, v22), !v11))
    {
      uint64_t v24 = 0;
      CFTypeRef cf = 0;
      uint64_t v11 = sub_2268DD4C4(a1, 0, &cf, v18, v19, v20, v21, v22);
      if (!v11)
      {
        if (!cf) {
          return 4294960568;
        }
        uint64_t v11 = sub_2268DEB94(a1, (const __CFString *)cf, 60, &v24);
        if (cf) {
          CFRelease(cf);
        }
        if (!v11)
        {
          if (v24)
          {
            uint64_t v11 = 0;
            *a4 = v24;
            return v11;
          }
          return 4294960568;
        }
      }
    }
  }
  return v11;
}

uint64_t sub_2268E097C(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_AssistantMonitoringContext_Release(AssistantMonitoringContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v13);
  }
  if (!a1 || *((_DWORD *)a1 + 26) != 1634561902) {
    return 4294960578;
  }
  int v9 = *((void *)a1 + 12);
  if (!v9) {
    return 4294960591;
  }
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  *((_DWORD *)a1 + 26) = 1095585614;
  *(void *)a1 = 0;
  *((void *)a1 + 1) = 0;
  *((_DWORD *)a1 + 4) = 0;
  int v10 = *((void *)a1 + 11);
  if (v10) {
    dispatch_release(v10);
  }
  uint64_t v11 = *((void *)a1 + 12);
  if (v11) {
    dispatch_release(v11);
  }
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 24));
  free(a1);
  return 0;
}

uint64_t sub_2268E0A60(_DWORD *a1, uint64_t a2, int a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus BSAssistant_MonitorBaseForACPSystemFlagTrue(AssistantCallbackContextRef, BSRef, ACPSystemFlags, AssistantMonitoringContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v32);
  }
  CFTypeRef cf = 0;
  if (!a1 || *a1 != 1634561902) {
    return 4294960578;
  }
  uint64_t v12 = 4294960591;
  if (a2 && a3 && a4)
  {
    if (sub_2268A58D0(a2, 1095593838))
    {
      if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus __ACPMonitoringContext_Create(AssistantCallbackContextRef, AssistantMonitoringContextRef *)", 800, (uint64_t)" \n", v13, v14, v15, v16, v32);
      }
      if (*a1 == 1634561902)
      {
        uint64_t v17 = malloc_type_calloc(1uLL, 0x70uLL, 0x1020040071D634FuLL);
        if (v17)
        {
          uint64_t v18 = (uint64_t)v17;
          *uint64_t v17 = a1;
          v17[1] = 0;
          *((_DWORD *)v17 + 4) = 0;
          *((unsigned char *)v17 + 20) = 0;
          v17[11] = dispatch_queue_create("__ACPMonitoringContext.queue", 0);
          *(void *)(v18 + 96) = dispatch_group_create();
          uint64_t v19 = pthread_mutex_init((pthread_mutex_t *)(v18 + 24), 0);
          if (v19)
          {
            uint64_t v12 = v19;
            sub_2268E097C((char *)v18, v20, v21, v22, v23, v24, v25, v26);
          }
          else
          {
            *(_DWORD *)(v18 + 104) = 1634561902;
            *(void *)(v18 + 8) = a2;
            *(_DWORD *)(v18 + 16) = a3;
            uint64_t v12 = sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], &cf, (uint64_t)"{%ks={%kC={}%kC={}%kC={}}}", v22, v23, v24, v25, v26, (uint64_t)"filters");
            if (!v12)
            {
              uint64_t v12 = sub_2268A78F0(a2, cf, (uint64_t)sub_2268E0CAC, v18, v27, v28, v29, v30);
              if (!v12) {
                *a4 = v18;
              }
            }
          }
        }
        else
        {
          uint64_t v12 = 4294960568;
        }
      }
      else
      {
        uint64_t v12 = 4294960578;
      }
    }
    else
    {
      uint64_t v12 = 4294960561;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  return v12;
}

void sub_2268E0CAC(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    unsigned int v8 = 0;
  }
  else if (a3 && *(_DWORD *)(a3 + 104) == 1634561902 && *(void *)(a3 + 96) && *(void *)(a3 + 88))
  {
    pthread_mutex_lock((pthread_mutex_t *)(a3 + 24));
    unsigned int v8 = *(unsigned __int8 *)(a3 + 20);
    *(unsigned char *)(a3 + 20) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(a3 + 24));
    if (!v8) {
      dispatch_group_async_f(*(dispatch_group_t *)(a3 + 96), *(dispatch_queue_t *)(a3 + 88), (void *)a3, (dispatch_function_t)sub_2268E2424);
    }
  }
  else
  {
    unsigned int v8 = 0;
  }
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __ACPMonitoringForFlagCallback(OSStatus, CFDictionaryRef, void *)", 800, (uint64_t)" taskPending: %d err: %d \ninData: %@\n", a5, a6, a7, a8, v8);
  }
}

void sub_2268E0DC0(const __CFString *a1, int *a2, CFTypeRef *a3, BOOL *a4, unsigned char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)&v57[4] = *MEMORY[0x263EF8340];
  if (!a1 || !a2 && !a3 && !a4 && !a5) {
    return;
  }
  uint64_t v54 = 0;
  CFArrayRef theArray = 0;
  CFArrayRef v53 = 0;
  int v52 = 0;
  char v51 = 0;
  sub_22686088C(a1, (uint64_t)&theArray, (UInt8 *)"%ks", (uint64_t)a4, (uint64_t)a5, a6, a7, a8, (uint64_t)"radios");
  if (v17) {
    return;
  }
  if (!theArray) {
    return;
  }
  sub_22686088C((const __CFString *)theArray, (uint64_t)&v56, (UInt8 *)"[*].%ks:int", v12, v13, v14, v15, v16, 0);
  if (v18) {
    return;
  }
  if (CFArrayGetCount(theArray) >= 2)
  {
    sub_22686088C((const __CFString *)theArray, (uint64_t)v57, (UInt8 *)"[*].%ks:int", v19, v20, v21, v22, v23, 1);
    if (v24) {
      return;
    }
  }
  sub_22686088C((const __CFString *)theArray, (uint64_t)&v54 + 4, (UInt8 *)"[*].%ks:int", v19, v20, v21, v22, v23, 0);
  if (v30) {
    return;
  }
  sub_22686088C((const __CFString *)theArray, (uint64_t)&v54, (UInt8 *)"[*].%ks:int", v25, v26, v27, v28, v29, 0);
  if (v36) {
    return;
  }
  int v37 = v56;
  if (v56)
  {
    if (v54) {
      BOOL v38 = v56 == 1;
    }
    else {
      BOOL v38 = 0;
    }
    if (v38) {
      int v37 = 20;
    }
  }
  else if ((BYTE4(v54) & 3u) - 1 >= 2)
  {
    int v37 = 0;
  }
  else
  {
    int v37 = 10;
  }
  if (a2) {
    *a2 = v37;
  }
  if (!a3)
  {
LABEL_30:
    if (!a4) {
      goto LABEL_47;
    }
    goto LABEL_31;
  }
  if (v37 == 3)
  {
    *a3 = &stru_26DA6BE88;
    goto LABEL_30;
  }
  sub_22686088C((const __CFString *)theArray, (uint64_t)a3, (UInt8 *)"[*].%ks", v31, v32, v33, v34, v35, 0);
  if (v49 || !*a3) {
    return;
  }
  CFRetain(*a3);
  if (!a4)
  {
LABEL_47:
    if (a5) {
      *a5 = v54;
    }
    return;
  }
LABEL_31:
  *a4 = 0;
  sub_22686088C((const __CFString *)theArray, (uint64_t)&v53, (UInt8 *)"[*].%ks", v31, v32, v33, v34, v35, 0);
  if (v39 == -6727) {
    goto LABEL_47;
  }
  if (v39 || !v53) {
    return;
  }
  CFIndex Count = CFArrayGetCount(v53);
  if (Count < 1) {
    goto LABEL_47;
  }
  CFIndex v46 = Count;
  uint64_t v47 = 0;
  while (1)
  {
    sub_22686088C((const __CFString *)v53, (uint64_t)&v52, (UInt8 *)"[*].%ks:int", v41, v42, v43, v44, v45, v47);
    if (v48) {
      break;
    }
    if (v52 == 6)
    {
      sub_22686088C((const __CFString *)v53, (uint64_t)&v51, (UInt8 *)"[*].%ks:BOOL", v41, v42, v43, v44, v45, v47);
      if (v50) {
        return;
      }
      *a4 = v51 != 0;
      goto LABEL_47;
    }
    if (v46 == ++v47) {
      goto LABEL_47;
    }
  }
}

uint64_t sub_2268E1098(CFDataRef theData, int a2)
{
  uint64_t result = 0;
  if (theData)
  {
    if (a2)
    {
      uint64_t result = (uint64_t)CFDataGetBytePtr(theData);
      if (result)
      {
        uint64_t v5 = (unsigned int *)result;
        unint64_t Length = CFDataGetLength(theData);
        if (Length < 4)
        {
          return 0;
        }
        else
        {
          unint64_t v7 = Length >> 2;
          while (1)
          {
            unsigned int v8 = *v5++;
            if (bswap32(v8) == a2) {
              break;
            }
            if (!--v7) {
              return 0;
            }
          }
          return 1;
        }
      }
    }
  }
  return result;
}

void sub_2268E1118(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus __ProgressContext_Release(__ProgressContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v11);
  }
  if (*((_DWORD *)a1 + 4) == 1634561902)
  {
    int v9 = (const void *)a1[1];
    if (v9)
    {
      CFRelease(v9);
      a1[1] = 0;
    }
    *((_DWORD *)a1 + 4) = 1095585614;
    int v10 = (const void *)a1[3];
    if (v10) {
      CFRelease(v10);
    }
    free(a1);
  }
}

void sub_2268E11E0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef v12 = 0;
  if (a1 == 13)
  {
    int v8 = sub_22685FC7C((const __CFAllocator *)*MEMORY[0x263EFFB08], (CFTypeRef *)&v12, (uint64_t)"{%##O%kO=%i}", a4, a5, a6, a7, a8, a3);
    CFDictionaryRef v9 = v12;
    if (v8) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v12 == 0;
    }
    if (!v10)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      if (LocalCenter) {
        CFNotificationCenterPostNotificationWithOptions(LocalCenter, @"com.apple.airport.assistant.BusyStateChange", 0, v12, 1uLL);
      }
      CFDictionaryRef v9 = v12;
    }
    if (v9) {
      CFRelease(v9);
    }
  }
}

uint64_t sub_2268E1274(uint64_t context, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (void *)context;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (context = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), context)) {
      context = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_LinkChangeCallbackStart(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v13);
    }
  }
  if (v8)
  {
    int v14 = 0;
    if (*(_DWORD *)v8 != 1634561902)
    {
      int v10 = -6718;
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    CFStringRef v9 = (const __CFString *)v8[3];
    if (!v9)
    {
      int v10 = -6705;
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    if (v8[6] || v8[15])
    {
      int v10 = -6721;
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    sub_22686088C(v9, (uint64_t)&v14, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Number");
    int v10 = v11;
    if (v11) {
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    if (v14 < 1)
    {
      int v10 = -6710;
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    LocalCenter = CFNotificationCenterGetLocalCenter();
    if (!LocalCenter)
    {
      int v10 = -6728;
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
    CFNotificationCenterAddObserver(LocalCenter, v8, (CFNotificationCallback)sub_2268E13C8, @"com.apple.AirPort.WiFiShim.Notification.LinkChange", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    context = sub_2268E1540((dispatch_source_t *)v8, 1000 * v14);
    int v10 = context;
    if (context) {
      return sub_2268DD134(v8, v10, a3, a4, a5, a6, a7, a8);
    }
  }
  return context;
}

void sub_2268E13C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFStringRef v27 = 0;
  CFStringRef theString1 = 0;
  if (a2)
  {
    if (a5)
    {
      if (*(_DWORD *)a2 == 1634561902)
      {
        int v25 = 0;
        CFDictionaryRef v10 = *(const __CFDictionary **)(a2 + 24);
        if (!v10
          || !CFDictionaryContainsKey(v10, @"BSAssistantCallback_String")
          || (sub_2268DCEEC(a2, @"BSAssistantCallback_String", &theString1, a4, (uint64_t)a5, a6, a7, a8),
              !v11)
          && theString1)
        {
          sub_22686088C(a5, (uint64_t)&v25, (UInt8 *)"%kO:int", a4, (uint64_t)a5, a6, a7, a8, @"kNetworkLinkManager_LinkChangeKey_LinkState");
          if (!v17)
          {
            sub_22686088C(a5, (uint64_t)&v27, (UInt8 *)"%kO", v12, v13, v14, v15, v16, @"kNetworkLinkManager_LinkChangeKey_WiFiName");
            if (v24 == -6727 || v27)
            {
              if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
                sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_LinkChangeCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"stopOnName: %@ inUserInfo: %@\n", v20, v21, v22, v23, (uint64_t)theString1);
              }
              if (theString1)
              {
                if (!v27 || v25 != 1 || CFStringCompare(theString1, v27, 0)) {
                  return;
                }
              }
              else if (v27)
              {
                return;
              }
              sub_2268DFB94(a2, 0, v18, v19, v20, v21, v22, v23);
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2268E1540(dispatch_source_t *a1, int a2)
{
  if (*(_DWORD *)a1 != 1634561902) {
    return 4294960578;
  }
  if (a2 < 1) {
    return 4294960559;
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(a1[6]);
    a1[6] = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, global_queue);
  a1[6] = v6;
  if (!v6) {
    return 4294960568;
  }
  dispatch_set_context(v6, a1);
  dispatch_source_set_event_handler_f(a1[6], (dispatch_function_t)sub_2268E1640);
  unint64_t v7 = a1[6];
  dispatch_time_t v8 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a1[6]);
  return 0;
}

void sub_2268E1640(void *context)
{
}

uint64_t sub_2268E1660(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_time_t v8 = (_DWORD *)result;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), result)) {
      uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_LinkChangeTimerFiredCallbackOnMain(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v9);
    }
  }
  if (v8 && *v8 == 1634561902)
  {
    return sub_2268DFB94((uint64_t)v8, 4294960574, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_2268E1708(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _BSAssistant_BonjourBrowseCallbackStart(AssistantCallbackContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v16);
  }
  uint64_t v19 = 0;
  int v18 = 0;
  char v17 = 0;
  if (a1 && *a1 == 1634561902)
  {
    CFStringRef v9 = (const __CFString *)*((void *)a1 + 3);
    if (v9)
    {
      if (*((void *)a1 + 6) || *((void *)a1 + 15))
      {
        uint64_t v10 = 4294960575;
      }
      else
      {
        sub_22686088C(v9, (uint64_t)&v18, (UInt8 *)"%ks:int", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Number");
        uint64_t v10 = v12;
        if (!v12)
        {
          if (v18 < 1)
          {
            uint64_t v10 = 4294960586;
            goto LABEL_12;
          }
          sub_22686088C(*((const __CFString **)a1 + 3), (uint64_t)&v17, (UInt8 *)"%ks:BOOL", a4, a5, a6, a7, a8, (uint64_t)"BSAssistantCallback_Boolean");
          uint64_t v10 = v13;
          if (!v13)
          {
            LocalCenter = CFNotificationCenterGetLocalCenter();
            if (!LocalCenter) {
              goto LABEL_25;
            }
            uint64_t v15 = LocalCenter;
            CFNotificationCenterAddObserver(LocalCenter, a1, (CFNotificationCallback)sub_2268E1A50, @"com.apple.bonjour.txt.BaseAssistant.Updated", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            CFNotificationCenterAddObserver(v15, a1, (CFNotificationCallback)sub_2268E1A50, @"com.apple.bonjour.txt.BaseAssistant.Removed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
            uint64_t v10 = sub_226844B50("com.apple.bonjour.txt.BaseAssistant.Updated", "com.apple.bonjour.txt.BaseAssistant.Removed", "BSAssistant:BrowserSession", &v19);
            if (v10) {
              goto LABEL_12;
            }
            if (!v19)
            {
LABEL_25:
              uint64_t v10 = 4294960568;
              goto LABEL_12;
            }
            uint64_t v10 = sub_226844FD8(v19, 0, v17 != 0);
            if (!v10)
            {
              uint64_t v10 = sub_2268E1DE0((dispatch_source_t *)a1, 1000 * v18);
              if (!v10)
              {
                *((void *)a1 + 15) = v19;
                return v10;
              }
            }
          }
        }
      }
    }
    else
    {
      uint64_t v10 = 4294960591;
    }
  }
  else
  {
    uint64_t v10 = 4294960578;
  }
LABEL_12:
  sub_2268E1918((NSObject **)a1, -6723, a3, a4, a5, a6, a7, a8);
  return v10;
}

void sub_2268E1918(NSObject **a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void _BSAssistant_BonjourBrowseCallbackStopWithResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)"\n", a5, a6, a7, a8, v15);
  }
  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902)
    {
      LocalCenter = CFNotificationCenterGetLocalCenter();
      if (LocalCenter)
      {
        int v11 = LocalCenter;
        CFNotificationCenterRemoveObserver(LocalCenter, a1, @"com.apple.bonjour.txt.BaseAssistant.Updated", 0);
        CFNotificationCenterRemoveObserver(v11, a1, @"com.apple.bonjour.txt.BaseAssistant.Removed", 0);
        uint64_t v12 = a1[15];
        if (v12)
        {
          sub_226845378(v12);
          a1[15] = 0;
        }
        uint64_t v13 = a1[6];
        int v14 = a2;
        if (v13)
        {
          dispatch_source_cancel(v13);
          dispatch_release(a1[6]);
          a1[6] = 0;
          int v14 = a2;
        }
      }
      else
      {
        int v14 = -6728;
      }
    }
    else
    {
      int v14 = -6718;
    }
    if (a2 != -6723)
    {
      sub_2268DD134(a1, v14, a3, a4, a5, a6, a7, a8);
    }
  }
}

void sub_2268E1A50(int a1, uint64_t a2, CFStringRef theString1, uint64_t a4, const __CFString *a5)
{
  CFStringRef v60 = 0;
  CFStringRef v61 = 0;
  if (a2)
  {
    if (a5)
    {
      if (*(_DWORD *)a2 == 1634561902)
      {
        CFStringRef v62 = 0;
        CFMutableArrayRef theArray = 0;
        CFComparisonResult v7 = CFStringCompare(theString1, @"com.apple.bonjour.txt.BaseAssistant.Updated", 0);
        sub_2268DCEEC(a2, @"BSAssistantCallback_BrowseRecords", &theArray, v8, v9, v10, v11, v12);
        if (!v13)
        {
          if (theArray)
          {
            if (*(_DWORD *)a2 == 1634561902
              && (CFDictionaryRef v14 = *(const __CFDictionary **)(a2 + 24)) != 0
              && CFDictionaryContainsKey(v14, @"BSAssistantCallback_String"))
            {
              sub_2268DCEEC(a2, @"BSAssistantCallback_String", &v60, v15, v16, v17, v18, v19);
              if (v25 || !v60) {
                return;
              }
            }
            else if (sub_2268E1DE0((dispatch_source_t *)a2, 5000))
            {
              return;
            }
            sub_22686088C(a5, (uint64_t)&v62, (UInt8 *)"%ks.%ks", v20, v21, v22, v23, v24, (uint64_t)"txt");
            if (!v31 && v62)
            {
              if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
                sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_TxtUpdateCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"add: %d MAC: %@ stopOnMACAddress: %@\n", v27, v28, v29, v30, v7 == kCFCompareEqualTo);
              }
              if (v7)
              {
                CFIndex v32 = sub_22685BC94(theArray, v62);
                if (v32 != -1) {
                  CFArrayRemoveValueAtIndex(theArray, v32);
                }
                return;
              }
              if (!sub_226860774((const __CFAllocator *)*MEMORY[0x263EFFB08], theArray, (uint64_t)"%O", v26, v27, v28, v29, v30, (uint64_t)a5))
              {
                if (v60)
                {
                  sub_22686088C(a5, (uint64_t)&v61, (UInt8 *)"%ks.%ks", v33, v34, v35, v36, v37, (uint64_t)"txt");
                  if ((v38 == -6727 || !v38 && v61)
                    && ((sub_2268A1408(v62, v60) & 1) != 0
                     || v61 && sub_2268A1408(v61, v60)))
                  {
                    CFNumberRef number = 0;
                    CFNumberRef otherNumber = 0;
                    if (*(_DWORD *)a2 == 1634561902
                      && (CFDictionaryRef v45 = *(const __CFDictionary **)(a2 + 24)) != 0
                      && CFDictionaryContainsKey(v45, @"BSAssistantCallback_BonjourSeed"))
                    {
                      sub_2268DCEEC(a2, @"BSAssistantCallback_BonjourSeed", &number, v40, v41, v42, v43, v44);
                      if (v51 || !number) {
                        return;
                      }
                      sub_22686088C(a5, (uint64_t)&otherNumber, (UInt8 *)"%ks.%ks", v46, v47, v48, v49, v50, (uint64_t)"txt");
                      int v53 = v52;
                      if (dword_268147AD8 <= 800
                        && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)))
                      {
                        sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_TxtUpdateCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"checking bonjour seeds old: %@ cur: %@\n", v41, v42, v43, v44, (uint64_t)number);
                      }
                    }
                    else
                    {
                      int v53 = 0;
                    }
                    if (!v53 && number && otherNumber && CFNumberCompare(number, otherNumber, 0) == kCFCompareEqualTo)
                    {
                      if (dword_268147AD8 <= 800
                        && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)))
                      {
                        sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_TxtUpdateCallBack(CFNotificationCenterRef, void *, CFStringRef, const void *, CFDictionaryRef)", 800, (uint64_t)"responding with duplicate error\n", v41, v42, v43, v44, v56);
                      }
                      sub_226845250(*(NSObject ****)(a2 + 120), a5);
                      uint64_t v54 = (NSObject **)a2;
                      int v55 = -6730;
                    }
                    else
                    {
                      uint64_t v54 = (NSObject **)a2;
                      int v55 = 0;
                    }
                    sub_2268E1918(v54, v55, v39, v40, v41, v42, v43, v44);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_2268E1DE0(dispatch_source_t *a1, int a2)
{
  if (*(_DWORD *)a1 != 1634561902) {
    return 4294960578;
  }
  if (a2 < 1) {
    return 4294960559;
  }
  uint64_t v4 = a1[6];
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(a1[6]);
    a1[6] = 0;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, global_queue);
  a1[6] = v6;
  if (!v6) {
    return 4294960568;
  }
  dispatch_set_context(v6, a1);
  dispatch_source_set_event_handler_f(a1[6], (dispatch_function_t)sub_2268E1EE0);
  CFComparisonResult v7 = a1[6];
  dispatch_time_t v8 = dispatch_time(0, 1000000 * a2);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(a1[6]);
  return 0;
}

void sub_2268E1EE0(void *context)
{
}

void sub_2268E1F00(NSObject **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 1634561902) {
      sub_2268E1918(a1, -6722, a3, a4, a5, a6, a7, a8);
    }
  }
}

void sub_2268E1F24(void *context)
{
}

void sub_2268E1F44(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v13 = 0;
  if (!a2 || *(_DWORD *)a2 != 1634561902)
  {
    uint64_t v11 = 4294960578;
    goto LABEL_13;
  }
  if (!a1)
  {
    uint64_t v11 = 4294960591;
    goto LABEL_13;
  }
  sub_22686088C(a1, (uint64_t)&v13, (UInt8 *)"%kO:int", a4, a5, a6, a7, a8, @"kAssistantResourceManager_StateKey");
  uint64_t v11 = v10;
  if (v10)
  {
LABEL_13:
    sub_2268E20F0(a2, v11, a3, a4, a5, a6, a7, a8);
    return;
  }
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_AssistantResourceChangedCallBack(CFDictionaryRef, void *)", 800, (uint64_t)"inResourceStatus: %@\n", a5, a6, a7, a8, (uint64_t)a1);
  }
  if (v13 == 1)
  {
    uint64_t v12 = sub_226856340(*(void *)(*(void *)(a2 + 8) + 96));
    if (v12 != -6709)
    {
      uint64_t v11 = v12;
      goto LABEL_13;
    }
  }
}

uint64_t sub_2268E2048(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  dispatch_time_t v8 = (_DWORD *)result;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), result)) {
      uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __BSAssistant_AssistantResourceTimerFiredCallbackOnMain(void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v9);
    }
  }
  if (v8 && *v8 == 1634561902)
  {
    return sub_2268E20F0((uint64_t)v8, 4294960574, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

uint64_t sub_2268E20F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = result;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), result)) {
      uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void _BSAssistant_AssistantResourceCallbackStopWithResult(AssistantCallbackContextRef, OSStatus)", 800, (uint64_t)"result: %m\n", a5, a6, a7, a8, a2);
    }
  }
  if (v9)
  {
    if (*(_DWORD *)v9 == 1634561902)
    {
      uint64_t v10 = *(void *)(v9 + 8);
      if (v10 && *(void *)(v10 + 96))
      {
        pthread_mutex_lock((pthread_mutex_t *)(v9 + 56));
        uint64_t v11 = *(NSObject **)(v9 + 48);
        if (v11)
        {
          dispatch_source_cancel(v11);
          dispatch_release(*(dispatch_object_t *)(v9 + 48));
          *(void *)(v9 + 48) = 0;
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v9 + 56));
        uint64_t result = sub_226855D80(*(void *)(*(void *)(v9 + 8) + 96), 0, 0);
        if (result) {
          int v12 = result;
        }
        else {
          int v12 = a2;
        }
      }
      else
      {
        int v12 = -6705;
      }
    }
    else
    {
      int v12 = -6718;
    }
    if (a2 != -6723)
    {
      return sub_2268DD134((void *)v9, v12, a3, a4, a5, a6, a7, a8);
    }
  }
  return result;
}

uint64_t sub_2268E2228(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268147AD8 <= 800 && (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _JoinNetwork(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice)", 800, (uint64_t)"\n", a5, a6, a7, a8, v53);
  }
  uint64_t v54 = 0;
  if (*(_DWORD *)(a1 + 88) != 1634561902) {
    return 4294960578;
  }
  sub_2269016E4((uint64_t)a2, a2);
  uint64_t v13 = sub_2269016D4((uint64_t)a2, v12);
  if (dword_268147AD8 <= 800)
  {
    uint64_t v18 = v13;
    if (dword_268147AD8 != -1 || sub_226865630((uint64_t)&dword_268147AD8, 0x320u)) {
      sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"OSStatus _JoinNetwork(AssistantContextRef, CFDictionaryRef, CFStringRef, Boolean, JoinNetworkRememberChoice)", 800, (uint64_t)"networkName: %@ bssid: %@\n", v14, v15, v16, v17, v18);
    }
  }
  uint64_t v19 = sub_2268DB87C(a1, &v54);
  uint64_t v25 = v54;
  if (v19)
  {
    uint64_t v26 = v19;
    if (!v54) {
      return v26;
    }
  }
  else
  {
    if (!v54) {
      return 4294960568;
    }
    uint64_t v26 = sub_2268DD050(v54, @"BSAssistantCallback_ScanInfo", (uint64_t)a2, v20, v21, v22, v23, v24);
    if (!v26)
    {
      if (!a3
        || (uint64_t v26 = sub_2268DD050(v25, @"BSAssistantCallback_ScanInfoPassword", a3, v27, v28, v29, v30, v31), !v26))
      {
        uint64_t v26 = sub_2268DD050(v25, @"BSAssistantCallback_Boolean", *MEMORY[0x263EFFB38], v27, v28, v29, v30, v31);
        if (!v26)
        {
          uint64_t v26 = sub_2268DD0C4(v25, @"BSAssistantCallback_JoinRememberChoice", a4, v33, v34, v35, v36, v37);
          if (!v26)
          {
            uint64_t v26 = sub_2268DBFEC((void *)v25, 2, v38, v39, v40, v41, v42, v43);
            if (!v26)
            {
              unsigned int v51 = sub_2268DC37C(v25, v44, v45, v46, v47, v48, v49, v50);
              unsigned int v52 = *(_DWORD *)(v25 + 32);
              if (v52) {
                uint64_t v26 = v52;
              }
              else {
                uint64_t v26 = v51;
              }
            }
          }
        }
      }
    }
  }
  sub_2268DB9AC((char *)v25);
  return v26;
}

uint64_t sub_2268E2424(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = result;
  if (dword_268147AD8 <= 800)
  {
    if (dword_268147AD8 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268147AD8, 0x320u), result)) {
      uint64_t result = sub_226865EB4((uint64_t)&dword_268147AD8, (uint64_t)"void __CheckSystemFlagsAsync(void *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v16);
    }
  }
  if (v8)
  {
    int v17 = 0;
    if (*(_DWORD *)(v8 + 104) == 1634561902)
    {
      if (*(void *)v8)
      {
        if (**(_DWORD **)v8 == 1634561902)
        {
          uint64_t v9 = *(void *)(v8 + 8);
          if (v9)
          {
            if (!sub_2268A6454(v9, 1937327724)
              && !sub_2268A5604(*(void *)(v8 + 8), 1937327724, &v17)
              && (*(_DWORD *)(v8 + 16) & v17) != 0)
            {
              sub_2268DD134(*(void **)v8, 0, v10, v11, v12, v13, v14, v15);
            }
          }
        }
      }
    }
    pthread_mutex_lock((pthread_mutex_t *)(v8 + 24));
    *(unsigned char *)(v8 + 20) = 0;
    return pthread_mutex_unlock((pthread_mutex_t *)(v8 + 24));
  }
  return result;
}

uint64_t sub_2268E5200(uint64_t result, const char *a2)
{
  if (*(void *)(result + 48) > (unint64_t)a2)
  {
    uint64_t v3 = result;
    objc_msgSend_deleteAllRowsInSectionCore_(*(void **)(result + 32), a2, (uint64_t)a2);
    uint64_t v5 = *(void **)(v3 + 40);
    return objc_msgSend_removeObjectAtIndex_(v5, v4, (uint64_t)a2);
  }
  return result;
}

CGColorRef sub_2268EF290(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  components[4] = *(CGFloat *)MEMORY[0x263EF8340];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  CGColorRef v9 = CGColorCreate(DeviceRGB, components);
  CGColorSpaceRelease(DeviceRGB);
  return v9;
}

CGColorRef sub_2268EF328()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  memset(v3, 0, sizeof(v3));
  CGColorRef v1 = CGColorCreate(DeviceRGB, (const CGFloat *)v3);
  CGColorSpaceRelease(DeviceRGB);
  return v1;
}

CGImageRef sub_2268EF3A0(CGImage *a1, double a2)
{
  double Width = (double)CGImageGetWidth(a1);
  size_t Height = CGImageGetHeight(a1);
  double v6 = a2 / 100.0;
  double v7 = a2 / 100.0 * Width;
  double v8 = v6 * (double)Height;
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  ColorSpace = CGImageGetColorSpace(a1);
  uint64_t v11 = CGBitmapContextCreate(0, (unint64_t)v7, (unint64_t)v8, BitsPerComponent, 0, ColorSpace, 2u);
  v14.size.width = (double)(unint64_t)v7;
  v14.size.height = (double)(unint64_t)v8;
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  CGContextDrawImage(v11, v14, a1);
  CGImageRef Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  return Image;
}

void sub_2268EF474(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7)
{
  double v8 = sub_2268EF4BC(a2, a3, a4, a5, a6, a7);
  CGContextAddPath(a1, v8);

  CGPathRelease(v8);
}

CGPath *sub_2268EF4BC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  CFMutableArrayRef Mutable = CGPathCreateMutable();
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  CGFloat MinX = CGRectGetMinX(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  double MidX = CGRectGetMidX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGFloat MaxX = CGRectGetMaxX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  CGFloat MinY = CGRectGetMinY(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGFloat MidY = CGRectGetMidY(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  double MaxY = CGRectGetMaxY(v25);
  CGPathMoveToPoint(Mutable, 0, MinX, MidY);
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, a5);
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, a5);
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MidX, MaxY, a5);
  if (a6 != 0.0)
  {
    CGPathAddLineToPoint(Mutable, 0, MidX + a6, MaxY);
    CGPathAddLineToPoint(Mutable, 0, MidX, MaxY + a6);
    CGPathAddLineToPoint(Mutable, 0, MidX - a6, MaxY);
  }
  CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MidY, a5);
  return Mutable;
}

void sub_2268EF690(CGContext *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v7 = sub_2268EF4BC(a2, a3, a4, a5, a6, 0.0);
  CGContextAddPath(a1, v7);

  CGPathRelease(v7);
}

uint64_t sub_2268FBB14(const void *a1, CFTypeRef **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148010 <= 800 && (dword_268148010 != -1 || sub_226865630((uint64_t)&dword_268148010, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148010, (uint64_t)"OSStatus _WiFiShimPrivateContext_Create(WiFiShimSubContextRef, WiFiShimContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v28);
  }
  CFArrayRef theArray = 0;
  uint64_t v10 = 4294960591;
  if (!a1 || !a2) {
    return v10;
  }
  uint64_t v11 = (CFTypeRef *)malloc_type_calloc(1uLL, 0x10uLL, 0x600405C6656D0uLL);
  uint64_t v19 = v11;
  if (!v11) {
    goto LABEL_20;
  }
  v11[1] = a1;
  uint64_t v20 = sub_2268FDB7C((uint64_t)v11, (uint64_t *)&theArray, v13, v14, v15, v16, v17, v18);
  if (v20)
  {
LABEL_9:
    uint64_t v10 = v20;
    goto LABEL_21;
  }
  if (!theArray)
  {
    uint64_t v10 = 4294960568;
LABEL_24:
    sub_2268FBD00(v19, v12, v13, v14, v15, v16, v17, v18);
    return v10;
  }
  uint64_t Count = CFArrayGetCount(theArray);
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, MEMORY[0x263EFFF70]);
  *uint64_t v19 = Mutable;
  if (Mutable)
  {
    if (Count >= 1)
    {
      uint64_t v24 = 0;
      do
      {
        uint64_t v29 = 0;
        sub_22686088C((const __CFString *)theArray, (uint64_t)&v29, (UInt8 *)"[*]", v14, v15, v16, v17, v18, v24);
        if (v20) {
          goto LABEL_9;
        }
        uint64_t v25 = sub_226852378((uint64_t)v22, v29, v13, v14, v15, v16, v17, v18);
        if (!v25) {
          goto LABEL_20;
        }
        uint64_t v26 = (const void *)v25;
        uint64_t v20 = sub_226860774(v22, (__CFArray *)*v19, (uint64_t)"%O", v14, v15, v16, v17, v18, v25);
        if (v20) {
          goto LABEL_9;
        }
        uint64_t v20 = sub_226852648((uint64_t)v26, @"com.apple.AirPort.WiFiShim.Notification.LinkChange");
        if (v20) {
          goto LABEL_9;
        }
        CFRelease(v26);
      }
      while (Count != ++v24);
    }
    uint64_t v10 = 0;
    *a2 = v19;
    uint64_t v19 = 0;
  }
  else
  {
LABEL_20:
    uint64_t v10 = 4294960568;
  }
LABEL_21:
  if (theArray)
  {
    CFRelease(theArray);
    CFArrayRef theArray = 0;
  }
  if (v19) {
    goto LABEL_24;
  }
  return v10;
}

uint64_t sub_2268FBD00(CFTypeRef *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148010 <= 800 && (dword_268148010 != -1 || sub_226865630((uint64_t)&dword_268148010, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148010, (uint64_t)"OSStatus _WiFiShimPrivateContext_Release(WiFiShimContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v10);
  }
  if (!a1) {
    return 4294960591;
  }
  if (*a1) {
    CFRelease(*a1);
  }
  free(a1);
  return 0;
}

void sub_2268FBD90(CFArrayRef *a1, char *a2)
{
  if (a1)
  {
    if (a2)
    {
      if (CFArrayGetCount(*a1))
      {
        CFArrayRef v9 = *a1;
        uint64_t v12 = 0;
        sub_22686088C((const __CFString *)v9, (uint64_t)&v12, (UInt8 *)"[*]", v4, v5, v6, v7, v8, 0);
        if (!v11)
        {
          if (v12) {
            sub_226852A7C(v12, a2, v10);
          }
        }
      }
    }
  }
}

uint64_t sub_2268FBE10(uint64_t a1, const char *a2, const __CFString *a3, int a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef cf = 0;
  CFArrayRef theArray = 0;
  if (dword_268148010 <= 800 && (dword_268148010 != -1 || sub_226865630((uint64_t)&dword_268148010, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148010, (uint64_t)"OSStatus WiFiShim_JoinNetworkNamedAndCopyScanInfo(WiFiShimContextRef, CFStringRef, CFStringRef, WiFiType, JoinNetworkRememberChoice, CFDictionaryRef *)", 800, (uint64_t)"\n", a5, (uint64_t)a6, a7, a8, (uint64_t)cf);
  }
  uint64_t v14 = 4294960591;
  if (a1)
  {
    if (a2)
    {
      uint64_t v14 = sub_2268FD5D8(a1, a2, a4, 1, 0, (uint64_t)&theArray, a7, a8);
      if (!v14)
      {
        if (!theArray) {
          goto LABEL_15;
        }
        if (!CFArrayGetCount(theArray) || (CFIndex v15 = sub_22685C0BC((const __CFString *)a2, a4, 0, theArray), v15 == -1))
        {
          uint64_t v14 = 4294960569;
          goto LABEL_17;
        }
        CFStringRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v15);
        if (!ValueAtIndex)
        {
LABEL_15:
          uint64_t v14 = 4294960568;
          goto LABEL_17;
        }
        CFAllocatorRef v22 = ValueAtIndex;
        if (!a3)
        {
          if (sub_2268FBFBC(ValueAtIndex, v17) == 1)
          {
            a3 = 0;
          }
          else
          {
            uint64_t v26 = sub_2268FDD94((uint64_t)v22, (const __CFString **)&cf, v23, v24, v18, v19, v20, v21);
            if (v26 == -6727)
            {
              uint64_t v14 = 4294967280;
              goto LABEL_17;
            }
            uint64_t v14 = v26;
            if (v26) {
              goto LABEL_17;
            }
            a3 = (const __CFString *)cf;
          }
        }
        uint64_t v14 = sub_2268FCEC4(a1, (uint64_t)v22, a3, a5, v18, v19, v20, v21);
        if (!v14)
        {
          if (a6)
          {
            *a6 = v22;
            CFRetain(v22);
          }
          uint64_t v14 = 0;
        }
      }
    }
  }
LABEL_17:
  if (cf) {
    CFRelease(cf);
  }
  return v14;
}

uint64_t sub_2268FBFBC(void *a1, const char *a2)
{
  uint64_t v3 = objc_msgSend_objectForKey_(a1, a2, @"CAPABILITIES");
  if ((objc_msgSend_shortValue(v3, v4, v5) & 0x10) == 0) {
    return 1;
  }
  int v51 = 0;
  uint64_t v8 = (__CFString *)objc_msgSend_objectForKey_(a1, v6, @"RSN_IE");
  uint64_t v17 = objc_msgSend_count(v8, v9, v10);
  if (!v17)
  {
    BOOL v19 = 0;
LABEL_8:
    char v20 = 0;
    goto LABEL_9;
  }
  sub_22686088C(v8, (uint64_t)&v51, (UInt8 *)"%kO:int", v12, v13, v14, v15, v16, @"IE_KEY_RSN_MCIPHER");
  if (v18 || v51 != 5)
  {
    uint64_t v33 = objc_msgSend_objectForKey_(v8, v11, @"IE_KEY_RSN_AUTHSELS");
    uint64_t v37 = objc_msgSend_objectEnumerator(v33, v34, v35);
    while (1)
    {
      Object = objc_msgSend_nextObject(v37, v11, v36);
      BOOL v19 = Object != 0;
      if (!Object) {
        goto LABEL_8;
      }
      uint64_t v40 = objc_msgSend_integerValue(Object, v11, v39);
      if (v40 == 2) {
        goto LABEL_8;
      }
      if (v40 == 8)
      {
        BOOL v19 = 0;
        char v20 = 0;
        int v21 = 13;
        goto LABEL_10;
      }
    }
  }
  BOOL v19 = 0;
  char v20 = 1;
LABEL_9:
  int v21 = 12;
LABEL_10:
  CFAllocatorRef v22 = (__CFString *)objc_msgSend_objectForKey_(a1, v11, @"WPA_IE");
  if (objc_msgSend_count(v22, v23, v24))
  {
    sub_22686088C(v22, (uint64_t)&v51, (UInt8 *)"%kO:int", v25, v26, v27, v28, v29, @"IE_KEY_WPA_MCIPHER");
    if (!v31 && v51 == 5) {
      return 8;
    }
    uint64_t v41 = objc_msgSend_objectForKey_(v22, v30, @"IE_KEY_WPA_AUTHSELS");
    uint64_t v46 = objc_msgSend_objectEnumerator(v41, v42, v43);
    while (1)
    {
      uint64_t v47 = objc_msgSend_nextObject(v46, v44, v45);
      if (!v47) {
        break;
      }
      if (objc_msgSend_integerValue(v47, v48, v49) == 2)
      {
        BOOL v19 = 1;
        break;
      }
    }
    if (v19) {
      unsigned int v32 = 4;
    }
    else {
      unsigned int v32 = 9;
    }
    if (v19) {
      int v50 = 5;
    }
    else {
      int v50 = 10;
    }
    if (v17) {
      unsigned int v32 = v50;
    }
  }
  else
  {
    if (v19) {
      unsigned int v32 = 7;
    }
    else {
      unsigned int v32 = v21;
    }
    if (!v17) {
      unsigned int v32 = 3;
    }
  }
  if (v20) {
    return 8;
  }
  else {
    return v32;
  }
}

CFStringRef sub_2268FC1A4(const __CFString *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    int v10 = 0;
    sub_22686088C(result, (uint64_t)&v10, (UInt8 *)"%kO:int", a4, a5, a6, a7, a8, @"AP_MODE");
    int v9 = v8;
    uint64_t result = 0;
    if (!v9) {
      return (const __CFString *)(v10 == 1);
    }
  }
  return result;
}

uint64_t sub_2268FC200(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus _InitMobileWiFi(WiFiShimSubContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v21);
  }
  if (a1 && (uint64_t v9 = WiFiManagerClientCreate()) != 0)
  {
    int v10 = (const void *)v9;
    a1[2] = CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    WiFiManagerClientSetType();
    int v11 = (void *)WiFiManagerClientCopyDevices();
    uint64_t v14 = v11;
    if (!v11
      || !objc_msgSend_count(v11, v12, v13)
      || (uint64_t v16 = objc_msgSend_objectAtIndex_(v14, v15, 0),
          objc_msgSend_numberWithInteger_(NSNumber, v17, 27),
          uint64_t v18 = WiFiDeviceClientCopyProperty(),
          (a1[6] = v18) == 0))
    {

      CFRelease(v10);
      return 4294960569;
    }
    uint64_t v19 = 0;
    a1[1] = v10;
    a1[3] = v16;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v19 = 4294960578;
  }

  return v19;
}

uint64_t sub_2268FC34C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus _CloseMobileWiFi(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v14);
  }
  if (!a1) {
    return 4294960578;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902 || !*(void *)(v9 + 8) || !*(void *)(v9 + 24)) {
    return 4294960578;
  }
  WiFiManagerClientUnscheduleFromRunLoop();
  int v10 = *(void **)(a1 + 8);
  int v11 = (const void *)v10[1];
  if (v11)
  {
    CFRelease(v11);
    int v10 = *(void **)(a1 + 8);
    v10[1] = 0;
  }
  uint64_t v12 = (const void *)v10[6];
  if (v12)
  {
    CFRelease(v12);
    int v10 = *(void **)(a1 + 8);
    v10[6] = 0;
  }
  uint64_t result = 0;
  v10[2] = 0;
  v10[3] = 0;
  return result;
}

void *sub_2268FC438(CFArrayRef theArray, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"CFArrayRef _ScanInfoRecordsFromWiFiNetworkRefs(CFArrayRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v24);
  }
  if (theArray && CFArrayGetCount(theArray))
  {
    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(theArray, v10, (uint64_t)&v25, v29, 16);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(theArray);
          }
          uint64_t v15 = WiFiNetworkCopyRecord();
          if (v15)
          {
            uint64_t v17 = (void *)v15;
            objc_msgSend_addObject_(v9, v16, v15);
          }
        }
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(theArray, v16, (uint64_t)&v25, v29, 16);
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u)))
  {
    uint64_t v18 = objc_msgSend_count(v9, a2, a3);
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"CFArrayRef _ScanInfoRecordsFromWiFiNetworkRefs(CFArrayRef)", 800, (uint64_t)"results: %d\n", v19, v20, v21, v22, v18);
  }
  return v9;
}

uint64_t sub_2268FC608(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_Create(WiFiShimContextRef *)", 800, (uint64_t)" \n", a5, a6, a7, a8, v33);
  }
  uint64_t v34 = 0;
  if (!a1) {
    return 4294960591;
  }
  uint64_t v9 = malloc_type_calloc(1uLL, 0x78uLL, 0x10E0040543B7626uLL);
  if (!v9) {
    return 4294960568;
  }
  int v10 = v9;
  *(_DWORD *)uint64_t v9 = 1634561902;
  v9[1] = 0;
  v9[3] = 0;
  v9[4] = dispatch_semaphore_create(0);
  v10[5] = 0;
  uint64_t v24 = sub_2268FC200(v10, v11, v12, v13, v14, v15, v16, v17);
  if (v24) {
    return v24;
  }
  uint64_t v24 = sub_2268FBB14(v10, &v34, v18, v19, v20, v21, v22, v23);
  if (!v24)
  {
    if (v34)
    {
      if (v34[1])
      {
        uint64_t v24 = 0;
        *a1 = v34;
        return v24;
      }
      uint64_t v24 = 4294960568;
      goto LABEL_10;
    }
    return 4294960568;
  }
  if (v34) {
LABEL_10:
  }
    sub_2268FC734((uint64_t)v34, v25, v26, v27, v28, v29, v30, v31);
  return v24;
}

uint64_t sub_2268FC734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_Release(WiFiShimContextRef)", 800, (uint64_t)" \n", a5, a6, a7, a8, v19);
  }
  if (!a1) {
    return 4294960578;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902) {
    return 4294960578;
  }
  if (*(void *)(v9 + 40))
  {
    *(void *)(v9 + 40) = 0;
    if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_Release(WiFiShimContextRef)", 800, (uint64_t)"Release forcing AutoJoin ON\n", a5, a6, a7, a8, v19);
    }
    WiFiManagerClientEnable();
  }
  sub_2268FC34C(a1, a2, a3, a4, a5, a6, a7, a8);
  int v10 = *(dispatch_object_t **)(a1 + 8);
  if (v10[4])
  {
    dispatch_release(v10[4]);
    int v10 = *(dispatch_object_t **)(a1 + 8);
  }
  free(v10);

  return sub_2268FBD00((CFTypeRef *)a1, v11, v12, v13, v14, v15, v16, v17);
}

uint64_t sub_2268FC868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"Boolean WiFiShim_WiFiIsOn(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v11);
  }
  if (!a1) {
    return 0;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902) {
    return 0;
  }
  uint64_t result = *(void *)(v9 + 24);
  if (result) {
    return WiFiDeviceClientGetPower() != 0;
  }
  return result;
}

uint64_t sub_2268FC910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_ClearScanCache(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v11);
  }
  if (!a1) {
    return 4294960578;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902 || !*(void *)(v9 + 8)) {
    return 4294960578;
  }
  sub_2268FC868(a1, a2, a3, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_2268FC9B8(void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = (int)a2;
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v11 = &unk_268148000;
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_PreferredNetworksCopy(WiFiShimContextRef, Boolean, CFArrayRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v46);
  }
  uint64_t v16 = objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3);
  if (!a1) {
    goto LABEL_37;
  }
  uint64_t v17 = a1[1];
  if (!v17 || *(_DWORD *)v17 != 1634561902 || !*(void *)(v17 + 8))
  {
    a1 = 0;
LABEL_37:
    uint64_t v43 = 4294960578;
    goto LABEL_38;
  }
  if (!a3)
  {
    a1 = 0;
    uint64_t v43 = 4294960591;
    goto LABEL_38;
  }
  a1 = (void *)WiFiManagerClientCopyNetworks();
  if (!objc_msgSend_count(a1, v18, v19)
    || (long long v50 = 0u,
        long long v51 = 0u,
        long long v48 = 0u,
        long long v49 = 0u,
        (uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v20, (uint64_t)&v48, v52, 16)) == 0))
  {
    uint64_t v43 = 0;
    goto LABEL_38;
  }
  uint64_t v22 = v21;
  int v47 = v9;
  uint64_t v23 = *(void *)v49;
LABEL_13:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v49 != v23) {
      objc_enumerationMutation(a1);
    }
    if (WiFiNetworkRequiresPassword()) {
      break;
    }
    if (!v47)
    {
      unsigned int v29 = 1;
      goto LABEL_19;
    }
LABEL_31:
    if (v22 == ++v24)
    {
      uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(a1, v25, (uint64_t)&v48, v52, 16);
      uint64_t v22 = v42;
      if (!v42)
      {
        uint64_t v43 = 0;
        goto LABEL_50;
      }
      goto LABEL_13;
    }
  }
  uint64_t v26 = (void *)WiFiNetworkCopyRecord();
  if (v26)
  {
    uint64_t v28 = v26;
    unsigned int v29 = sub_2268FBFBC(v26, v27);
    CFRelease(v28);
LABEL_19:
    uint64_t SSID = WiFiNetworkGetSSID();
    if (SSID)
    {
      uint64_t v31 = SSID;
      uint64_t AssociationDate = WiFiNetworkGetAssociationDate();
      uint64_t v33 = WiFiNetworkGetAssociationDate();
      if (AssociationDate | v33)
      {
        if (AssociationDate) {
          uint64_t v34 = AssociationDate;
        }
        else {
          uint64_t v34 = v33;
        }
        if (AssociationDate) {
          BOOL v35 = v33 == 0;
        }
        else {
          BOOL v35 = 1;
        }
        if (!v35) {
          uint64_t v34 = objc_msgSend_laterDate_((void *)AssociationDate, v25, v33);
        }
        uint64_t v36 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x263EFF9A0], v25, v31, @"WiFiShim_PreferredNetwork_SSID");
        uint64_t v38 = objc_msgSend_numberWithInteger_(NSNumber, v37, v29);
        objc_msgSend_setObject_forKey_(v36, v39, v38, @"WiFiShim_PreferredNetwork_SecMode");
        objc_msgSend_setObject_forKey_(v36, v40, v34, @"WiFiShim_PreferredNetwork_TimeAssociated");
        objc_msgSend_addObject_(v16, v41, (uint64_t)v36);
      }
    }
    goto LABEL_31;
  }
  uint64_t v43 = 4294960568;
LABEL_50:
  uint64_t v11 = (_DWORD *)&unk_268148000;
LABEL_38:
  int v44 = v11[20];
  if (v44 <= 800 && (v44 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_PreferredNetworksCopy(WiFiShimContextRef, Boolean, CFArrayRef *)", 800, (uint64_t)"Preferrred networks:\n%@\n", v12, v13, v14, v15, (uint64_t)v16);
  }
  if (a3)
  {
    *a3 = v16;
    CFRetain(v16);
  }
  if (a1) {
    CFRelease(a1);
  }
  return v43;
}

uint64_t sub_2268FCCE0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && (uint64_t v8 = *(void *)(a1 + 8)) != 0 && *(_DWORD *)v8 == 1634561902 && *(void *)(v8 + 24))
  {
    if (a2)
    {
      int v10 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
      if (v10)
      {
        uint64_t v13 = (void *)WiFiNetworkCopyRecord();
        if (v13)
        {
          uint64_t v14 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v11, v12);
          uint64_t v16 = objc_msgSend_numberWithInteger_(NSNumber, v15, 4);
          objc_msgSend_setObject_forKey_(v14, v17, v16, @"STATE");
          uint64_t v19 = objc_msgSend_objectForKey_(v13, v18, @"BSSID");
          if (v19) {
            objc_msgSend_setObject_forKey_(v14, v20, v19, @"BSSID");
          }
          uint64_t v21 = objc_msgSend_objectForKey_(v13, v20, @"SSID_STR");
          if (v21) {
            objc_msgSend_setObject_forKey_(v14, v22, v21, @"SSID_STR");
          }
          uint64_t v23 = objc_msgSend_objectForKey_(v13, v22, @"AP_MODE");
          if (v23) {
            objc_msgSend_setObject_forKey_(v14, v24, v23, @"AP_MODE");
          }
          *a2 = v14;
          CFRetain(v14);
          uint64_t v25 = 0;
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v25 = 4294960568;
        }
      }
      else
      {
        uint64_t v14 = 0;
        uint64_t v13 = 0;
        uint64_t v25 = 4294960569;
      }
    }
    else
    {
      uint64_t v14 = 0;
      int v10 = 0;
      uint64_t v13 = 0;
      uint64_t v25 = 4294960591;
    }
  }
  else
  {
    uint64_t v14 = 0;
    int v10 = 0;
    uint64_t v13 = 0;
    uint64_t v25 = 4294960578;
  }
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_CurrentAssociationInfoCopy(WiFiShimContextRef, CFDictionaryRef *)", 800, (uint64_t)"assocInfo:\n%@\n", a5, a6, a7, a8, (uint64_t)v14);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v13) {
    CFRelease(v13);
  }
  return v25;
}

uint64_t sub_2268FCEC4(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_JoinNetwork(WiFiShimContextRef, CFDictionaryRef, CFStringRef, JoinNetworkRememberChoice)", 800, (uint64_t)"\n", a5, a6, a7, a8, v47);
  }
  if (!a1) {
    return 4294960578;
  }
  uint64_t v12 = *(void *)(a1 + 8);
  if (!v12 || *(_DWORD *)v12 != 1634561902 || !*(void *)(v12 + 8) || !*(void *)(v12 + 24)) {
    return 4294960578;
  }
  if (!a2) {
    return 4294960591;
  }
  uint64_t v13 = sub_2268FD268(a1, 0, (uint64_t)a3, a4, a5, a6, a7, a8);
  if (!v13)
  {
    uint64_t v14 = WiFiNetworkCreate();
    if (!v14)
    {
      sub_2268FD268(a1, 1u, v15, v16, v17, v18, v19, v20);
      return 4294960568;
    }
    uint64_t v21 = (const void *)v14;
    if (WiFiNetworkRequiresPassword())
    {
      if (!a3)
      {
        uint64_t v30 = 0;
        uint64_t v13 = 4294960591;
        goto LABEL_57;
      }
      uint64_t v30 = (void *)WiFiNetworkCopyPassword();
      if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u)))
      {
        uint64_t v31 = objc_msgSend_length(v30, v28, v29);
        CFStringGetLength(a3);
        sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_JoinNetwork(WiFiShimContextRef, CFDictionaryRef, CFStringRef, JoinNetworkRememberChoice)", 800, (uint64_t)"curPW len: %d inPassword len: %d\n", v32, v33, v34, v35, v31);
      }
      if (!v30 || (objc_msgSend_isEqualToString_(v30, v28, (uint64_t)a3) & 1) == 0)
      {
        if (!WiFiNetworkSetPassword())
        {
          uint64_t v13 = 4294960596;
          goto LABEL_57;
        }
        char v36 = 1;
LABEL_29:
        uint64_t v38 = *(void *)(a1 + 8);
        uint64_t v39 = *(void *)(v38 + 32);
        *(void *)(v38 + 96) = 0;
        *(void *)(v38 + 104) = v39;
        *(unsigned char *)(v38 + 112) = 0;
        uint64_t v40 = WiFiDeviceClientAssociateAsync();
        if (v40)
        {
          uint64_t v13 = v40;
          goto LABEL_57;
        }
        uint64_t v41 = *(void *)(a1 + 8);
        if (*(unsigned char *)(v41 + 112) || (uint64_t v42 = *(NSObject **)(v41 + 104)) == 0)
        {
          uint64_t v13 = 4294960573;
          goto LABEL_57;
        }
        dispatch_semaphore_wait(v42, 0xFFFFFFFFFFFFFFFFLL);
        uint64_t v44 = *(void *)(a1 + 8);
        *(void *)(v44 + 104) = 0;
        uint64_t v45 = *(unsigned int *)(v44 + 88);
        char v46 = v36 ^ 1;
        if (!v45) {
          char v46 = 1;
        }
        if ((v46 & 1) == 0)
        {
          WiFiNetworkRemovePassword();
          if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
            sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_JoinNetwork(WiFiShimContextRef, CFDictionaryRef, CFStringRef, JoinNetworkRememberChoice)", 800, (uint64_t)"Join network err: %d\n", v24, v25, v26, v27, v45);
          }
        }
        uint64_t v13 = 4294967280;
        if ((int)v45 <= -3903)
        {
          if (v45 == -3924) {
            goto LABEL_57;
          }
          if (v45 != -3906 && v45 != -3905)
          {
LABEL_51:
            if (v45)
            {
              uint64_t v13 = v45;
            }
            else
            {
              uint64_t v13 = *(void *)(*(void *)(a1 + 8) + 96);
              if (v13)
              {
                if (v8 == 1
                  || (objc_msgSend_date(MEMORY[0x263EFF910], v43, v22),
                      WiFiNetworkSetAssociationDate(),
                      WiFiManagerClientAddNetwork(),
                      (uint64_t v13 = *(void *)(*(void *)(a1 + 8) + 96)) != 0))
                {
                  CFRelease((CFTypeRef)v13);
                  uint64_t v13 = 0;
                  *(void *)(*(void *)(a1 + 8) + 96) = 0;
                }
              }
              else
              {
                uint64_t v13 = 4294960569;
              }
            }
            goto LABEL_57;
          }
        }
        else if ((int)v45 > 4)
        {
          if (v45 == 16)
          {
            uint64_t v13 = 4294960575;
            goto LABEL_57;
          }
          if (v45 != 5) {
            goto LABEL_51;
          }
        }
        else if (v45 != -3902)
        {
          if (v45 != -100) {
            goto LABEL_51;
          }
LABEL_57:
          sub_2268FD268(a1, 1u, v22, v23, v24, v25, v26, v27);
          CFRelease(v21);
          if (v30) {
            CFRelease(v30);
          }
          return v13;
        }
        uint64_t v13 = 4294963391;
        goto LABEL_57;
      }
    }
    else
    {
      uint64_t v30 = 0;
    }
    char v36 = 0;
    goto LABEL_29;
  }
  return v13;
}

uint64_t sub_2268FD268(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 4294960578;
  }
  uint64_t v8 = *(void *)(a1 + 8);
  if (!v8 || *(_DWORD *)v8 != 1634561902 || !*(void *)(v8 + 8)) {
    return 4294960578;
  }
  uint64_t v10 = *(void *)(v8 + 40);
  if (a2)
  {
    if (v10)
    {
      uint64_t v11 = v10 - 1;
      *(void *)(v8 + 40) = v11;
      if (!v11)
      {
        if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
          sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_SetAutoJoinState(WiFiShimContextRef, Boolean)", 800, (uint64_t)" Set AutoJoin ON\n", a5, a6, a7, a8, v13);
        }
        WiFiManagerClientEnable();
      }
    }
  }
  else
  {
    *(void *)(v8 + 40) = v10 + 1;
    if (!v10)
    {
      if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_SetAutoJoinState(WiFiShimContextRef, Boolean)", 800, (uint64_t)" Set AutoJoin Off\n", a5, a6, a7, a8, v13);
      }
      WiFiManagerClientDisable();
    }
  }
  if (dword_268148050 > 800) {
    return 0;
  }
  if (dword_268148050 != -1 || (uint64_t result = sub_226865630((uint64_t)&dword_268148050, 0x320u), result))
  {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_SetAutoJoinState(WiFiShimContextRef, Boolean)", 800, (uint64_t)"inState: %d autoJoinOffCount: %d\n", a5, a6, a7, a8, a2);
    return 0;
  }
  return result;
}

void sub_2268FD408(int a1, CFTypeRef cf, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"void __joinUsingDeviceCallback(WiFiDeviceClientRef, WiFiNetworkRef, CFDictionaryRef, WiFiError, void *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v12);
  }
  if (a5)
  {
    *(_DWORD *)a5 = a4;
    if (*(unsigned char *)(a5 + 24))
    {
      if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"void __joinUsingDeviceCallback(WiFiDeviceClientRef, WiFiNetworkRef, CFDictionaryRef, WiFiError, void *)", 800, (uint64_t)"Cancelling out of __joinUsingDeviceCallback?\n", a5, a6, a7, a8, v12);
      }
    }
    else
    {
      *(void *)(a5 + 8) = cf;
      if (cf) {
        CFRetain(cf);
      }
    }
    uint64_t v11 = *(NSObject **)(a5 + 16);
    if (v11)
    {
      dispatch_semaphore_signal(v11);
    }
  }
}

uint64_t sub_2268FD518(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 4294960578;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9 || *(_DWORD *)v9 != 1634561902 || !*(void *)(v9 + 24)) {
    return 4294960578;
  }
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_Disassociate(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v12);
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 8) + 24);

  return MEMORY[0x270F4B440](v10, 0);
}

uint64_t sub_2268FD5D8(uint64_t a1, const char *a2, char a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void *)a6;
  unsigned int v9 = a5;
  uint64_t v68 = *MEMORY[0x263EF8340];
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_ScanInfo(WiFiShimContextRef, CFStringRef, WiFiType, Boolean, uint32_t, CFArrayRef *)", 800, (uint64_t)"inName: %@\n", a5, a6, a7, a8, (uint64_t)a2);
  }
  if (!a1) {
    return 4294960578;
  }
  uint64_t v14 = *(void *)(a1 + 8);
  if (!v14 || *(_DWORD *)v14 != 1634561902 || !*(void *)(v14 + 24)) {
    return 4294960578;
  }
  if (!v8) {
    return 4294960591;
  }
  *uint64_t v8 = 0;
  uint64_t v15 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v16 = objc_msgSend_numberWithBool_(NSNumber, a2, a4 != 0);
  uint64_t v18 = objc_msgSend_dictionaryWithObject_forKey_(v15, v17, v16, @"SCAN_MERGE");
  uint64_t v20 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v19, v9);
  objc_msgSend_setObject_forKey_(v18, v21, v20, @"SCAN_MAXAGE");
  if (a2) {
    objc_msgSend_setObject_forKey_(v18, v22, (uint64_t)a2, @"SSID_STR");
  }
  if ((a3 & 2) == 0)
  {
    CFStringRef v61 = v18;
    CFStringRef v62 = v8;
    uint64_t v24 = objc_msgSend_array(MEMORY[0x263EFF980], v22, v23);
    uint64_t v26 = objc_msgSend_numberWithInteger_(NSNumber, v25, 0);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v27 = *(void **)(*(void *)(a1 + 8) + 48);
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v63, v67, 16);
    if (v29)
    {
      uint64_t v31 = v29;
      uint64_t v32 = *(void *)v64;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v64 != v32) {
            objc_enumerationMutation(v27);
          }
          uint64_t v34 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v63 + 1) + 8 * i), v30, @"SUP_CHANNEL");
          uint64_t v37 = objc_msgSend_integerValue(v34, v35, v36);
          if ((unint64_t)(v37 - 1) <= 0xD)
          {
            uint64_t v38 = NSDictionary;
            uint64_t v39 = objc_msgSend_numberWithInteger_(NSNumber, v30, v37);
            uint64_t v41 = objc_msgSend_dictionaryWithObjectsAndKeys_(v38, v40, v39, @"CHANNEL", v26, @"CHANNEL_FLAGS", 0);
            objc_msgSend_addObject_(v24, v42, v41);
          }
        }
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v63, v67, 16);
      }
      while (v31);
    }
    objc_msgSend_setObject_forKey_(v61, v30, (uint64_t)v24, @"SCAN_CHANNELS");
    uint64_t v8 = v62;
  }
  CFArrayRef v43 = (const __CFArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v44 = *(void *)(a1 + 8);
  *(_DWORD *)(v44 + 56) = 0;
  v44 += 56;
  uint64_t v45 = *(void *)(v44 - 24);
  *(void *)(v44 + 8) = v43;
  *(void *)(v44 + 16) = v45;
  *(unsigned char *)(v44 + 24) = 0;
  uint64_t v46 = WiFiDeviceClientScanAsync();
  if (!v46)
  {
    uint64_t v47 = *(void *)(a1 + 8);
    if (*(unsigned char *)(v47 + 80) || (long long v49 = *(NSObject **)(v47 + 72)) == 0)
    {
      uint64_t v46 = 4294960573;
    }
    else
    {
      dispatch_semaphore_wait(v49, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v52 = *(void *)(a1 + 8);
      *(void *)(v52 + 72) = 0;
      unsigned int v53 = *(_DWORD *)(v52 + 56);
      if (v53)
      {
        if (v53 == 16) {
          uint64_t v46 = 4294960575;
        }
        else {
          uint64_t v46 = v53;
        }
      }
      else if (objc_msgSend_count(v43, v50, v51))
      {
        uint64_t v46 = 0;
        *uint64_t v8 = sub_2268FC438(v43, v54, v55, v56, v57, v58, v59, v60);
      }
      else
      {
        uint64_t v46 = 4294960569;
      }
    }
  }
  *(void *)(*(void *)(a1 + 8) + 64) = 0;
  if (v43) {

  }
  return v46;
}

void sub_2268FD954(int a1, CFArrayRef theArray, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u)))
  {
    if (theArray) {
      CFArrayGetCount(theArray);
    }
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"void __scanUsingDeviceCallback(WiFiDeviceClientRef, CFArrayRef, WiFiError, void *)", 800, (uint64_t)"err: %d scanResults: %d\n", a5, a6, a7, a8, a3);
  }
  if (a4)
  {
    *(_DWORD *)a4 = a3;
    if (*(unsigned char *)(a4 + 24))
    {
      if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
        sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"void __scanUsingDeviceCallback(WiFiDeviceClientRef, CFArrayRef, WiFiError, void *)", 800, (uint64_t)"Cancelling out of __scanUsingDeviceCallback ?\n", a5, a6, a7, a8, v12);
      }
    }
    else if (theArray)
    {
      objc_msgSend_addObjectsFromArray_(*(void **)(a4 + 8), (const char *)theArray, (uint64_t)theArray);
    }
    uint64_t v11 = *(NSObject **)(a4 + 16);
    if (v11)
    {
      dispatch_semaphore_signal(v11);
    }
  }
}

uint64_t sub_2268FDA88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WIFIShim_Cancel(WiFiShimContextRef)", 800, (uint64_t)"\n", a5, a6, a7, a8, v15);
  }
  if (!a1) {
    return 4294960578;
  }
  uint64_t v9 = *(void *)(a1 + 8);
  if (!v9) {
    return 4294960578;
  }
  if (*(_DWORD *)v9 != 1634561902) {
    return 4294960578;
  }
  if (!*(void *)(v9 + 24)) {
    return 4294960578;
  }
  uint64_t v10 = *(void *)(v9 + 32);
  if (!v10) {
    return 4294960578;
  }
  if (*(void *)(v9 + 72) == v10)
  {
    WiFiDeviceClientScanCancel();
    uint64_t v14 = *(void *)(a1 + 8);
    *(unsigned char *)(v14 + 80) = 1;
    uint64_t v12 = (dispatch_semaphore_t *)(v14 + 72);
    goto LABEL_15;
  }
  if (*(void *)(v9 + 104) == v10)
  {
    WiFiDeviceClientAssociateCancel();
    uint64_t v11 = *(void *)(a1 + 8);
    *(unsigned char *)(v11 + 112) = 1;
    uint64_t v12 = (dispatch_semaphore_t *)(v11 + 104);
LABEL_15:
    dispatch_semaphore_signal(*v12);
  }
  return 0;
}

uint64_t sub_2268FDB7C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (a1 && (uint64_t v9 = *(void *)(a1 + 8)) != 0 && *(_DWORD *)v9 == 1634561902 && *(void *)(v9 + 8))
  {
    uint64_t v12 = (void *)WiFiManagerClientCopyDevices();
    if (!v12) {
      goto LABEL_23;
    }
    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF980], v10, v11);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v25, v29, 16);
    if (v15)
    {
      uint64_t v18 = v15;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v12);
          }
          uint64_t InterfaceName = WiFiDeviceClientGetInterfaceName();
          if (InterfaceName) {
            objc_msgSend_addObject_(v13, v22, InterfaceName);
          }
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v25, v29, 16);
      }
      while (v18);
    }
    if (objc_msgSend_count(v13, v16, v17))
    {
      *a2 = (uint64_t)v13;
      CFRetain(v13);
      uint64_t v23 = 0;
    }
    else
    {
LABEL_23:
      uint64_t v23 = 4294960569;
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v23 = 4294960578;
  }
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_GetIfListCopy(WiFiShimContextRef, CFArrayRef *)", 800, (uint64_t)"outIfList: %@\n", a5, a6, a7, a8, *a2);
  }

  return v23;
}

uint64_t sub_2268FDD48(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 4294960578;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2 || *(_DWORD *)v2 != 1634561902) {
    return 4294960578;
  }
  if (!a2) {
    return 4294960591;
  }
  uint64_t result = 0;
  *a2 = *(void *)(v2 + 40) == 0;
  return result;
}

uint64_t sub_2268FDD94(uint64_t a1, const __CFString **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_KeychainPasswordCopy(CFDictionaryRef, CFStringRef *)", 800, (uint64_t)"\n", a5, a6, a7, a8, v19);
  }
  uint64_t result = 4294960591;
  if (a1 && a2)
  {
    uint64_t v11 = WiFiNetworkCreate();
    if (!v11) {
      return 4294960568;
    }
    uint64_t v12 = (const void *)v11;
    if (WiFiNetworkRequiresPassword())
    {
      CFStringRef v17 = (const __CFString *)WiFiNetworkCopyPassword();
      if (dword_268148050 <= 800 && (dword_268148050 != -1 || sub_226865630((uint64_t)&dword_268148050, 0x320u)))
      {
        if (v17) {
          CFIndex Length = CFStringGetLength(v17);
        }
        else {
          CFIndex Length = -1;
        }
        sub_226865EB4((uint64_t)&dword_268148050, (uint64_t)"OSStatus WiFiShim_KeychainPasswordCopy(CFDictionaryRef, CFStringRef *)", 800, (uint64_t)"curPW len: %d \n", v13, v14, v15, v16, Length);
      }
      CFRelease(v12);
      if (v17)
      {
        uint64_t result = 0;
        *a2 = v17;
        return result;
      }
    }
    else
    {
      CFRelease(v12);
    }
    return 4294960569;
  }
  return result;
}

uint64_t sub_2268FDEE0()
{
  return 4294960561;
}

BOOL sub_2268FDEE8(void *a1, void *a2, void *a3)
{
  if (!a1 && !a2 && !a3 || byte_268148310 != 1) {
    return 0;
  }
  if (a1) {
    *a1 = qword_268148318;
  }
  if (a2) {
    *a2 = qword_268148320;
  }
  uint64_t v3 = qword_268148328;
  if (a3) {
    *a3 = qword_268148328;
  }
  return (qword_268148318 | qword_268148320 | v3) != 0;
}

uint64_t sub_2268FDF58()
{
  v16[4] = *MEMORY[0x263EF8340];
  if (byte_268148310) {
    return 0;
  }
  if (pthread_main_np()) {
    return 4294960593;
  }
  if (byte_268148310) {
    return 4294960577;
  }
  uint64_t result = 4294960587;
  if (!qword_268148318 && !qword_268148320 && !qword_268148328)
  {
    uint64_t v2 = *MEMORY[0x263EFDFC8];
    v16[0] = *MEMORY[0x263EFDFE0];
    v16[1] = v2;
    uint64_t v3 = *MEMORY[0x263EFE050];
    v16[2] = *MEMORY[0x263EFDFB8];
    v16[3] = v3;
    uint64_t v4 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v1, (uint64_t)v16, 4);
    uint64_t v15 = 0;
    id v5 = objc_alloc_init(MEMORY[0x263EFEA58]);
    error = objc_msgSend__ios_meContactWithKeysToFetch_error_(v5, v6, v4, &v15);
    if (error)
    {
      uint64_t v10 = error;
      qword_268148318 = (uint64_t)(id)objc_msgSend_givenName(error, v8, v9, v15);
      qword_268148320 = (uint64_t)(id)objc_msgSend_familyName(v10, v11, v12);
      qword_268148328 = (uint64_t)(id)objc_msgSend_nickname(v10, v13, v14);
    }
    uint64_t result = 0;
    byte_268148310 = 1;
  }
  return result;
}

uint64_t sub_2268FEF88()
{
  if (qword_268148338 != -1) {
    dispatch_once(&qword_268148338, &unk_26DA6B6A8);
  }
  return byte_268148330;
}

uint64_t sub_2268FEFCC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], a2, a3);
  objc_msgSend_addSuiteNamed_(v3, v4, @"com.apple.logging");
  uint64_t result = objc_msgSend_BOOLForKey_(v3, v5, @"DebugWACLogging");
  byte_268148330 = result;
  return result;
}

uint64_t sub_2268FF01C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  if (a2 < 4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = a1 + 3;
    do
    {
      *(_DWORD *)(v5 - 3) = bswap32(arc4random());
      v5 += 4;
      v4 -= 4;
      unint64_t v6 = v2 + v4;
    }
    while (v2 + v4 > 3);
    uint64_t v7 = -v4;
    unint64_t v2 = v6;
  }
  switch(v2)
  {
    case 1uLL:
      uint32_t v10 = arc4random() >> 24;
      goto LABEL_12;
    case 2uLL:
      uint32_t v11 = arc4random();
      *(unsigned char *)(a1 + v7) = HIBYTE(v11);
      v7 |= 1uLL;
      uint32_t v10 = HIWORD(v11);
      goto LABEL_12;
    case 3uLL:
      uint32_t v8 = arc4random();
      *(unsigned char *)(a1 + v7) = HIBYTE(v8);
      uint64_t v9 = v7 | 1;
      v7 |= 2uLL;
      *(unsigned char *)(a1 + v9) = BYTE2(v8);
      uint32_t v10 = v8 >> 8;
LABEL_12:
      *(unsigned char *)(a1 + v7) = v10;
      break;
  }
  return 0;
}

uint64_t sub_2268FF0EC(NSObject ***a1, const char *a2)
{
  uint64_t v4 = (NSObject **)malloc_type_calloc(1uLL, 0x50uLL, 0x10A0040C96B0B76uLL);
  if (v4)
  {
    uint64_t v5 = v4;
    if (a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = "BonjourBrowser";
    }
    uint64_t v7 = dispatch_queue_create(v6, 0);
    *uint64_t v5 = v7;
    if (v7)
    {
      dispatch_set_context(v7, v5);
      dispatch_set_finalizer_f(*v5, (dispatch_function_t)sub_2268FF1A0);
      sub_2268FF1E0((uint64_t)v5, 0);
      uint64_t result = 0;
      *a1 = v5;
      return result;
    }
    sub_2268FF1A0(v5);
  }
  return 4294960568;
}

void sub_2268FF1A0(void *a1)
{
  unint64_t v2 = a1[1];
  if (v2) {
    dispatch_release(v2);
  }

  free(a1);
}

void sub_2268FF1E0(uint64_t a1, NSObject *a2)
{
  if (a2) {
    uint64_t v3 = a2;
  }
  else {
    uint64_t v3 = MEMORY[0x263EF83A0];
  }
  dispatch_retain(v3);
  uint64_t v4 = *(NSObject **)(a1 + 8);
  if (v4) {
    dispatch_release(v4);
  }
  *(void *)(a1 + 8) = v3;
}

void sub_2268FF228(dispatch_queue_t *context)
{
}

void sub_2268FF244(NSObject **a1)
{
  sub_2268FF504((uint64_t)a1);
  unint64_t v2 = *a1;

  dispatch_release(v2);
}

uint64_t sub_2268FF27C(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = a3;
  return result;
}

uint64_t sub_2268FF284(dispatch_queue_t *a1, const char *a2, const char *a3, const char *a4, uint64_t a5)
{
  uint32_t v10 = malloc_type_calloc(1uLL, 0x28uLL, 0x1030040D16A4755uLL);
  if (v10)
  {
    uint32_t v11 = v10;
    *uint32_t v10 = a1;
    uint64_t v12 = strdup(a2);
    v11[1] = v12;
    if (v12)
    {
      uint64_t v13 = v12;
      if (a3) {
        uint64_t v14 = a3;
      }
      else {
        uint64_t v14 = "";
      }
      uint64_t v15 = strdup(v14);
      v11[2] = v15;
      if (v15)
      {
        if (!a4 || !*a4 || (uint64_t v16 = strdup(a4), (v11[3] = v16) != 0))
        {
          v11[4] = a5;
          dispatch_async_f(*a1, v11, (dispatch_function_t)sub_2268FF38C);
          return 0;
        }
      }
      free(v13);
    }
    uint64_t v18 = (void *)v11[2];
    if (v18) {
      free(v18);
    }
    uint64_t v19 = (void *)v11[3];
    if (v19) {
      free(v19);
    }
    free(v11);
  }
  return 4294960568;
}

void sub_2268FF38C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  DNSServiceRef sdRef = 0;
  *(void *)(v2 + 64) = v3;
  *(unsigned char *)(v2 + 72) = 1;
  uint64_t v4 = (DNSServiceRef *)(v2 + 32);
  if (!DNSServiceCreateConnection((DNSServiceRef *)(v2 + 32)))
  {
    DNSServiceSetDispatchQueue(*(DNSServiceRef *)(v2 + 32), *(dispatch_queue_t *)v2);
    uint64_t v5 = (const char *)a1[3];
    if (v5) {
      uint32_t v6 = if_nametoindex(v5);
    }
    else {
      uint32_t v6 = 0;
    }
    DNSServiceRef sdRef = *(DNSServiceRef *)(v2 + 32);
    if (!DNSServiceBrowse(&sdRef, v3 | 0x4000, v6, (const char *)a1[1], (const char *)a1[2], (DNSServiceBrowseReply)sub_2268FF968, (void *)v2))
    {
      *(void *)(v2 + 40) = sdRef;
      goto LABEL_13;
    }
    if (dword_2681480A0 <= 5000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1388u))) {
      sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourBrowser_Start(void *)", 5000, (uint64_t)"### Bonjour browse for %s%s on interface %u failed: %#m\n", v7, v8, v9, v10, a1[1]);
    }
  }
  if (*v4)
  {
    DNSServiceRefDeallocate(*v4);
    *uint64_t v4 = 0;
  }
LABEL_13:
  free((void *)a1[1]);
  free((void *)a1[2]);
  uint32_t v11 = (void *)a1[3];
  if (v11) {
    free(v11);
  }
  free(a1);
}

void sub_2268FF4E8(dispatch_queue_t *context)
{
}

void sub_2268FF504(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 72);
  *(unsigned char *)(a1 + 72) = 0;
  uint64_t v3 = *(_DNSServiceRef_t **)(a1 + 32);
  if (v3)
  {
    DNSServiceRefDeallocate(v3);
    *(void *)(a1 + 32) = 0;
  }
  *(void *)(a1 + 40) = 0;
  while (1)
  {
    uint64_t v4 = *(void **)(a1 + 56);
    if (!v4) {
      break;
    }
    *(void *)(a1 + 56) = *v4;
    sub_226900E00(v4);
  }
  while (1)
  {
    uint64_t v5 = *(void **)(a1 + 48);
    if (!v5) {
      break;
    }
    *(void *)(a1 + 48) = *v5;
    v5[9] = 0;
    sub_2268FFD60(v5);
  }
  if (v2)
  {
    sub_2269004B4(a1, 3, 0);
  }
}

void sub_2268FF59C(NSObject **a1, const void *a2, char a3)
{
  uint32_t v6 = malloc_type_malloc(0x18uLL, 0x1060040520DAF6DuLL);
  if (v6)
  {
    uint64_t v7 = v6;
    void *v6 = a1;
    v6[1] = a2;
    *((unsigned char *)v6 + 16) = a3;
    CFRetain(a2);
    uint64_t v8 = *a1;
    dispatch_async_f(v8, v7, (dispatch_function_t)sub_2268FF634);
  }
}

void sub_2268FF634(const __CFDictionary **a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  memset(rdata, 0, sizeof(rdata));
  v26[0] = 0;
  CFDictionaryRef v2 = *a1;
  sub_2268621EC(a1[1], @"deviceID", v26, 0x40uLL, 0);
  if (!v26[0]) {
    goto LABEL_49;
  }
  uint64_t v3 = (char *)v2 + 56;
  do
  {
    uint64_t v3 = *(char **)v3;
    if (!v3) {
      goto LABEL_49;
    }
  }
  while (strcasecmp(v3 + 16, v26));
  uint64_t v4 = *((void *)v3 + 11);
  if (!v4) {
    goto LABEL_49;
  }
  do
  {
    if (*((unsigned char *)a1 + 16) && !*(_DWORD *)(v4 + 48)
      || DNSServiceConstructFullName(fullName, *(const char *const *)(v4 + 24), *(const char *const *)(v4 + 32), *(const char *const *)(v4 + 40)))
    {
      goto LABEL_20;
    }
    uint64_t v5 = 0;
    rdata[0] = 0;
    while (1)
    {
      uint64_t v6 = rdata[v5];
      if (v6 > 0x3F)
      {
LABEL_13:
        uint64_t v7 = fullName;
        uint64_t v8 = (char *)&v25 + 15;
LABEL_14:
        *uint64_t v8 = 0;
        __int16 v9 = (_WORD)v8 + 1;
        if (!*v7)
        {
          snprintf(fullName, 0x3F1uLL, "%s%s", *(const char **)(v4 + 32), *(const char **)(v4 + 40));
          if (dword_2681480A0 <= 3000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0xBB8u))) {
            sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourBrowser_ReconfirmDevice(void *)", 3000, (uint64_t)"Reconfirming PTR for %s.%s%s on %s\n", v10, v11, v12, v13, *(void *)(v4 + 24));
          }
          DNSServiceReconfirmRecord(0, *(_DWORD *)(v4 + 48), fullName, 0xCu, 1u, v9 - (unsigned __int16)rdata, rdata);
        }
        goto LABEL_20;
      }
      if (!rdata[v5]) {
        break;
      }
      v5 += v6 + 1;
      if ((unint64_t)v5 >= 0xFF) {
        goto LABEL_13;
      }
    }
    uint64_t v8 = &rdata[v5];
    uint64_t v7 = fullName;
    if ((unint64_t)v5 > 0xFD) {
      goto LABEL_14;
    }
    LOBYTE(v14) = fullName[0];
    if (!fullName[0]) {
      goto LABEL_14;
    }
    uint64_t v7 = fullName;
    while (v14 != 46)
    {
      uint64_t v15 = v5 <= 253 ? 253 : v5;
      uint64_t v16 = v5;
      while ((_BYTE)v14 && v14 != 46)
      {
        if (v15 == v16) {
          goto LABEL_43;
        }
        if (v14 == 92)
        {
          CFStringRef v17 = v7 + 2;
          int v14 = v7[1];
          if ((v14 - 48) <= 9)
          {
            int v18 = *v17;
            if ((v18 - 48) <= 9)
            {
              int v19 = v7[3];
              if ((v19 - 48) <= 9)
              {
                int v20 = 100 * v7[1] + 10 * (char)v18 + (char)v19;
                uint64_t v21 = v7 + 4;
                if (v20 < 5584)
                {
                  LOBYTE(v14) = v20 + 48;
                  CFStringRef v17 = v21;
                }
              }
            }
          }
        }
        else
        {
          CFStringRef v17 = v7 + 1;
        }
        rdata[v16 + 1] = v14;
        LOBYTE(v14) = *v17;
        ++v16;
        uint64_t v7 = v17;
      }
      uint64_t v15 = v16;
LABEL_43:
      uint64_t v22 = rdata - v8 + v16;
      if (v22 > 63) {
        break;
      }
      if ((_BYTE)v14) {
        ++v7;
      }
      *uint64_t v8 = v22;
      LOBYTE(v14) = *v7;
      if (*v7)
      {
        uint64_t v5 = v16 + 1;
        uint64_t v8 = &rdata[v16 + 1];
        if (v15 < 253) {
          continue;
        }
      }
      uint64_t v8 = &rdata[v16 + 1];
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v4 = *(void *)(v4 + 8);
  }
  while (v4);
LABEL_49:
  CFRelease(a1[1]);
  free(a1);
}

void sub_2268FF968(int a1, unsigned __int8 a2, unsigned int a3, int a4, char *a5, const char *a6, const char *a7, uint64_t a8, uint64_t a9)
{
  if (a4) {
    return;
  }
  if (*(unsigned char *)(a8 + 72))
  {
    unsigned int v14 = a2;
    if (dword_2681480A0 <= 500 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1F4u)))
    {
      uint64_t v15 = "Add";
      if (((v14 >> 1) & 1) == 0) {
        uint64_t v15 = "Rmv";
      }
      sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 500, (uint64_t)"Bonjour PTR %s %s.%s%s on %u\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)v15);
    }
    uint64_t v17 = a8 + 48;
    uint64_t v16 = *(void *)(a8 + 48);
    if (!v16)
    {
LABEL_16:
      if ((v14 & 2) == 0)
      {
        if (dword_2681480A0 <= 5000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1388u))) {
          sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 5000, (uint64_t)"### <radar:6451163> Remove of non-existent %s.%s%s%%%u\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)a5);
        }
        return;
      }
      int v19 = malloc_type_calloc(1uLL, 0x60uLL, 0x10300400E9D42ADuLL);
      if (!v19) {
        return;
      }
      uint64_t v20 = (uint64_t)v19;
      v19[2] = a8;
      uint64_t v21 = strdup(a5);
      *(void *)(v20 + 24) = v21;
      if (v21)
      {
        uint64_t v22 = strdup(a6);
        *(void *)(v20 + 32) = v22;
        if (v22)
        {
          uint64_t v23 = strdup(a7);
          *(void *)(v20 + 40) = v23;
          if (v23)
          {
            *(_DWORD *)(v20 + 48) = a3;
            if_indextoname(a3, (char *)(v20 + 52));
            if (*(unsigned char *)(v20 + 52) && sub_22686E4A8((const char *)(v20 + 52))) {
              *(unsigned char *)(v20 + 69) = 1;
            }
            if (!sub_2268FFCB0(v20))
            {
              *(void *)uint64_t v17 = v20;
              return;
            }
          }
        }
      }
      uint64_t v24 = (void *)v20;
      goto LABEL_36;
    }
    while (1)
    {
      int v18 = (void *)v17;
      uint64_t v17 = v16;
      if (*(_DWORD *)(v16 + 48) == a3
        && !strcasecmp(*(const char **)(v16 + 24), a5)
        && !strcasecmp(*(const char **)(v17 + 32), a6)
        && !strcasecmp(*(const char **)(v17 + 40), a7))
      {
        break;
      }
      uint64_t v16 = *(void *)v17;
      if (!*(void *)v17) {
        goto LABEL_16;
      }
    }
    if ((v14 & 2) == 0)
    {
      void *v18 = *(void *)v17;
      sub_2268FFDEC(a8, v17);
      uint64_t v24 = (void *)v17;
LABEL_36:
      sub_2268FFD60(v24);
      return;
    }
    if (dword_2681480A0 <= 5000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1388u))) {
      sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 5000, (uint64_t)"### <radar:6451163> Duplicate add of %s.%s%s%%%u\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)a5);
    }
  }
  else if (dword_2681480A0 <= 5000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1388u)))
  {
    sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourBrowser_BrowseHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const char *, const char *, void *)", 5000, (uint64_t)"### Browse after stop\n", (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, a9);
  }
}

uint64_t sub_2268FFCB0(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = DNSServiceConstructFullName(fullName, *(const char *const *)(a1 + 24), *(const char *const *)(a1 + 32), *(const char *const *)(a1 + 40));
  if (!result)
  {
    DNSServiceRef sdRef = *(DNSServiceRef *)(*(void *)(a1 + 16) + 32);
    uint64_t result = DNSServiceQueryRecord(&sdRef, 0x4000u, *(_DWORD *)(a1 + 48), fullName, 0x10u, 1u, (DNSServiceQueryRecordReply)sub_2268FFEC8, (void *)a1);
    if (!result) {
      *(void *)(a1 + 72) = sdRef;
    }
  }
  return result;
}

void sub_2268FFD60(void *a1)
{
  CFDictionaryRef v2 = (void *)a1[3];
  if (v2)
  {
    free(v2);
    a1[3] = 0;
  }
  uint64_t v3 = (void *)a1[4];
  if (v3)
  {
    free(v3);
    a1[4] = 0;
  }
  uint64_t v4 = (void *)a1[5];
  if (v4)
  {
    free(v4);
    a1[5] = 0;
  }
  uint64_t v5 = (_DNSServiceRef_t *)a1[9];
  if (v5)
  {
    DNSServiceRefDeallocate(v5);
    a1[9] = 0;
  }
  while (1)
  {
    uint64_t v6 = (void *)a1[10];
    if (!v6) {
      break;
    }
    a1[10] = *v6;
    free(v6);
  }

  free(a1);
}

void sub_2268FFDEC(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v2 = *(void **)(a2 + 88);
  if (!v2) {
    return;
  }
  uint64_t v3 = v2[11];
  if (v3)
  {
    uint64_t v4 = v2 + 11;
    if (v3 != a2)
    {
      while (1)
      {
        uint64_t v5 = v3;
        uint64_t v3 = *(void *)(v3 + 8);
        if (!v3) {
          goto LABEL_8;
        }
        if (v3 == a2)
        {
          uint64_t v4 = (void *)(v5 + 8);
          break;
        }
      }
    }
    *uint64_t v4 = *(void *)(a2 + 8);
    if (v2[11])
    {
LABEL_8:
      sub_2269004B4(a1, 1, (uint64_t)v2);
      sub_226900438((uint64_t)v2);
      return;
    }
  }
  uint64_t v6 = (void *)(a1 + 56);
  while (1)
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
    if (!v6) {
      break;
    }
    if (v6 == v2)
    {
      void *v7 = *v2;
      break;
    }
  }
  sub_2269004B4(a1, 2, (uint64_t)v2);

  sub_226900E00(v2);
}

void sub_2268FFEC8(int a1, unsigned __int8 a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t __n, void *__s1, uint64_t a10, void *a11)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (a4) {
    return;
  }
  uint64_t v11 = a11[2];
  if (*(unsigned char *)(v11 + 72))
  {
    unsigned int v12 = __n;
    unsigned int v13 = a2;
    if (dword_2681480A0 <= 500 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1F4u)))
    {
      unsigned int v14 = "Add";
      if (((v13 >> 1) & 1) == 0) {
        unsigned int v14 = "Rmv";
      }
      sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourService_TXTHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 500, (uint64_t)"Bonjour TXT %s %s on %u\n", a5, a6, a7, __n, (uint64_t)v14);
    }
    uint64_t v16 = a11 + 10;
    uint64_t v15 = a11[10];
    if ((v13 & 2) != 0)
    {
      uint64_t v20 = a11 + 10;
      if (v15)
      {
        uint64_t v21 = (void *)a11[10];
        while (1)
        {
          uint64_t v20 = v21;
          if (v21[1] == v12 && !memcmp(__s1, v21 + 2, v12)) {
            break;
          }
          uint64_t v21 = (void *)*v20;
          if (!*v20) {
            goto LABEL_31;
          }
        }
      }
      else
      {
LABEL_31:
        uint64_t v22 = malloc_type_calloc(1uLL, v12 + 16, 0x4F1ED9D8uLL);
        if (v22)
        {
          uint64_t v23 = v22;
          *uint64_t v22 = 0;
          v22[1] = v12;
          memcpy(v22 + 2, __s1, v12);
          *uint64_t v20 = v23;
        }
      }
    }
    else if (v15)
    {
      uint64_t v17 = (void *)a11[10];
      int v18 = a11 + 10;
      while (1)
      {
        int v19 = v17;
        if (v17[1] == v12 && !memcmp(__s1, v17 + 2, v12)) {
          break;
        }
        uint64_t v17 = (void *)*v19;
        int v18 = v19;
        if (!*v19) {
          goto LABEL_16;
        }
      }
      void *v18 = *v19;
      free(v19);
    }
    else
    {
LABEL_16:
      if (dword_2681480A0 <= 5000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1388u))) {
        sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourService_RemoveRData(BonjourServiceRef, const void *, size_t)", 5000, (uint64_t)"### Removed RData missing for %s.%s%s %%%u\n%1.1H\n", a5, a6, a7, __n, a11[3]);
      }
    }
    uint64_t v24 = *v16;
    if (*v16 && v24 != v15)
    {
      uint8_t valueLen = 0;
      uint64_t v25 = *(void *)(v24 + 8);
      long long v26 = (const char *)a11[4];
      if (!strcasecmp(v26, "_airplay._tcp."))
      {
        ValuePtr = (char *)TXTRecordGetValuePtr(v25, (const void *)(v24 + 16), "deviceid", &valueLen);
        if (!ValuePtr) {
          return;
        }
        size_t v29 = valueLen;
LABEL_49:
        if (sub_22686F20C(ValuePtr, v29, 6, v42)) {
          return;
        }
        uint64_t v31 = sub_22686F33C(v42, 6, __s);
        uint8_t v32 = strlen(v31);
        int v33 = v32;
        uint8_t valueLen = v32;
        if (v32 >= 0x40u) {
          return;
        }
        __memcpy_chk();
        v44[v33] = 0;
        uint64_t v34 = a11[11];
        if (v34)
        {
          if (!strcasecmp((const char *)(v34 + 16), v44))
          {
LABEL_65:
            sub_226900438(v34);
            sub_2269004B4(v11, 1, v34);
            return;
          }
          if (dword_2681480A0 <= 1000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x3E8u))) {
            sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourService_TXTHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 1000, (uint64_t)"### <radar:10037073> Removing and re-adding %s.%s%s for stale TXT record update (%s -> %s)\n", v35, v36, v37, v38, a11[3]);
          }
          sub_2268FFDEC(v11, (uint64_t)a11);
          a11[11] = 0;
        }
        uint64_t v34 = v11 + 56;
        while (1)
        {
          uint64_t v34 = *(void *)v34;
          if (!v34) {
            break;
          }
          if (!strcasecmp((const char *)(v34 + 16), v44)) {
            goto LABEL_64;
          }
        }
        uint64_t v39 = malloc_type_calloc(1uLL, 0x60uLL, 0x106004022B847F8uLL);
        if (!v39) {
          return;
        }
        uint64_t v34 = (uint64_t)v39;
        v39[1] = v11;
        __strlcpy_chk();
        *(void *)uint64_t v34 = *(void *)(v11 + 56);
        *(void *)(v11 + 56) = v34;
LABEL_64:
        a11[11] = v34;
        a11[1] = *(void *)(v34 + 88);
        *(void *)(v34 + 88) = a11;
        goto LABEL_65;
      }
      if (!strcasecmp(v26, "_airport._tcp."))
      {
        uint64_t v40 = 0;
        uint64_t v41 = 0;
        if ((_WORD)v25)
        {
          *(void *)uint64_t v44 = v24 + 17;
          while (!sub_226870250(*(unsigned __int8 **)v44, v24 + 17 + (unsigned __int16)v25 - 1, v45, 8, &v41, 0, __s, 256, &v40, 0, v44))
          {
            if (!sub_226865768(v45, v41, "waMA"))
            {
              size_t v29 = v40;
              ValuePtr = __s;
              goto LABEL_49;
            }
          }
        }
      }
      else if (!strcasecmp(v26, "_awp._tcp.") || !strcasecmp(v26, "_raop._tcp."))
      {
        uint64_t v27 = (char *)a11[3];
        long long v28 = strchr(v27, 64);
        if (v28)
        {
          size_t v29 = ((_BYTE)v28 - (_BYTE)v27);
          ValuePtr = v27;
          goto LABEL_49;
        }
      }
    }
  }
  else if (dword_2681480A0 <= 5000 && (dword_2681480A0 != -1 || sub_226865630((uint64_t)&dword_2681480A0, 0x1388u)))
  {
    sub_226865EB4((uint64_t)&dword_2681480A0, (uint64_t)"void _BonjourService_TXTHandler(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 5000, (uint64_t)"### TXT after stop\n", a5, a6, a7, __n, (uint64_t)__s1);
  }
}

void sub_226900438(uint64_t a1)
{
  uint64_t v2 = sub_2269005AC(a1);
  if (v2)
  {
    uint64_t v3 = v2;
    for (uint64_t i = *(void *)(a1 + 88); i; uint64_t i = *(void *)(i + 8))
    {
      if (i != v3)
      {
        uint64_t v5 = *(_DNSServiceRef_t **)(i + 72);
        if (v5)
        {
          DNSServiceRefDeallocate(v5);
          *(void *)(i + 72) = 0;
        }
      }
    }
    if (!*(void *)(v3 + 72))
    {
      sub_2268FFCB0(v3);
    }
  }
}

void sub_2269004B4(uint64_t a1, int a2, uint64_t a3)
{
  if (*(void *)(a1 + 16))
  {
    int v12 = 0;
    if (!a3)
    {
      uint64_t v11 = malloc_type_calloc(1uLL, 0x20uLL, 0x10E0040E15455BBuLL);
      if (!v11) {
        return;
      }
      uint64_t v10 = v11;
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    uint64_t v6 = sub_226900624(a3, &v12);
    if (!v12)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(const void **)(a3 + 80);
      if (v8) {
        CFRelease(v8);
      }
      *(void *)(a3 + 80) = v7;
      __int16 v9 = malloc_type_calloc(1uLL, 0x20uLL, 0x10E0040E15455BBuLL);
      if (v9)
      {
        uint64_t v10 = v9;
        if (v7) {
          CFRetain(v7);
        }
LABEL_11:
        *(_DWORD *)uint64_t v10 = a2;
        v10[1] = v7;
        *((_OWORD *)v10 + 1) = *(_OWORD *)(a1 + 16);
        dispatch_async_f(*(dispatch_queue_t *)(a1 + 8), v10, (dispatch_function_t)sub_226900AB8);
      }
    }
  }
}

uint64_t sub_2269005AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(a1 + 88);
    do
    {
      if (!strcmp(*(const char **)(v3 + 40), "local."))
      {
        if (!*(unsigned char *)(v3 + 69)) {
          return v3;
        }
        if (!v2) {
          uint64_t v2 = v3;
        }
      }
      uint64_t v3 = *(void *)(v3 + 8);
    }
    while (v3);
    if (v2) {
      return v2;
    }
  }
  return v1;
}

__CFDictionary *sub_226900624(uint64_t a1, int *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_2269005AC(a1);
  if (!v4 || (uint64_t v5 = v4, (v6 = *(void *)(v4 + 80)) == 0))
  {
    CFMutableArrayRef Mutable = *(__CFDictionary **)(a1 + 80);
    if (!Mutable)
    {
      int v11 = -6745;
      if (!a2) {
        return Mutable;
      }
      goto LABEL_17;
    }
    CFRetain(*(CFTypeRef *)(a1 + 80));
    goto LABEL_9;
  }
  CFIndex v7 = *(void *)(v6 + 8);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    int v11 = -6728;
    if (!a2) {
      return Mutable;
    }
    goto LABEL_17;
  }
  __int16 v9 = *(const char **)(v5 + 32);
  if (!strcasecmp(v9, "_awp._tcp.") || !strcasecmp(v9, "_raop._tcp."))
  {
    uint64_t v10 = *(char **)(v5 + 24);
    int v12 = strchr(v10, 64);
    if (v12) {
      uint64_t v10 = v12 + 1;
    }
  }
  else
  {
    uint64_t v10 = *(char **)(v5 + 24);
  }
  size_t v13 = strlen(v10);
  sub_226862250(Mutable, @"name", v10, v13);
  sub_226862250(Mutable, @"deviceID", (char *)(a1 + 16), -1);
  int v11 = sub_226900B08(__s, *(void *)(v5 + 24), *(char **)(v5 + 32), *(unsigned __int8 **)(v5 + 40));
  if (!v11)
  {
    size_t v15 = strlen(__s);
    snprintf(&__s[v15], 1073 - v15, "%%%u", *(_DWORD *)(v5 + 48));
    sub_226862250(Mutable, @"dnsName", __s, -1);
    sub_226862250(Mutable, @"serviceType", *(char **)(v5 + 32), -1);
    if (!strcasecmp(*(const char **)(v5 + 32), "_airport._tcp."))
    {
      TXTRecordRef txtRecord = 0uLL;
      *(void *)valueSize = 0;
      uint64_t v30 = 0;
      if (!v7)
      {
        int v11 = -6743;
        goto LABEL_16;
      }
      TXTRecordCreate(&txtRecord, 0x100u, buffer);
      uint64_t v31 = (unsigned __int8 *)(v6 + 17);
      unint64_t v16 = v6 + v7 + 16;
      for (int i = sub_226870250((unsigned __int8 *)(v6 + 17), v16, key, 7, &v30, 0, value, 256, valueSize, 0, &v31); !i; int i = sub_226870250(v31, v16, key, 7, &v30, 0, value, 256, valueSize, 0, &v31))
      {
        key[v30] = 0;
        TXTRecordSetValue(&txtRecord, key, valueSize[0], value);
      }
      BytesPtr = (UInt8 *)TXTRecordGetBytesPtr(&txtRecord);
      unsigned int Length = TXTRecordGetLength(&txtRecord);
      sub_2268622E4(Mutable, @"txt", BytesPtr, Length);
      TXTRecordDeallocate(&txtRecord);
    }
    else
    {
      sub_2268622E4(Mutable, @"txt", (UInt8 *)(v6 + 16), v7);
    }
    uint64_t v20 = *(void *)(a1 + 88);
    if (v20)
    {
      CFMutableArrayRef v21 = 0;
      char v22 = 1;
      uint64_t v23 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
      do
      {
        if (!v21)
        {
          CFMutableArrayRef v21 = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
          if (!v21) {
            goto LABEL_40;
          }
        }
        uint64_t v24 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], v23);
        if (!v24)
        {
          CFRelease(v21);
LABEL_40:
          int v11 = -6728;
          goto LABEL_16;
        }
        uint64_t v25 = v24;
        int v26 = *(unsigned __int8 *)(v20 + 69);
        sub_22686234C(v24, @"ifindex", *(unsigned int *)(v20 + 48));
        sub_226862250(v25, @"ifname", (char *)(v20 + 52), -1);
        int v27 = sub_226900B08(__s, *(void *)(v20 + 24), *(char **)(v20 + 32), *(unsigned __int8 **)(v20 + 40));
        if (v27)
        {
          int v11 = v27;
          CFRelease(v21);
          CFRelease(v25);
          goto LABEL_16;
        }
        if (!v26) {
          char v22 = 0;
        }
        size_t v28 = strlen(__s);
        snprintf(&__s[v28], 1073 - v28, "%%%u", *(_DWORD *)(v20 + 48));
        sub_226862250(v25, @"dnsName", __s, -1);
        sub_226862250(v25, @"domain", *(char **)(v20 + 40), -1);
        CFArrayAppendValue(v21, v25);
        CFRelease(v25);
        uint64_t v20 = *(void *)(v20 + 8);
      }
      while (v20);
      CFDictionarySetValue(Mutable, @"services", v21);
      CFRelease(v21);
      if (!v22) {
        goto LABEL_9;
      }
    }
    CFDictionarySetValue(Mutable, @"p2pOnly", (const void *)*MEMORY[0x263EFFB40]);
LABEL_9:
    int v11 = 0;
    if (!a2) {
      return Mutable;
    }
    goto LABEL_17;
  }
LABEL_16:
  CFRelease(Mutable);
  CFMutableArrayRef Mutable = 0;
  if (a2) {
LABEL_17:
  }
    *a2 = v11;
  return Mutable;
}

void sub_226900AB8(unsigned int *a1)
{
  (*((void (**)(void, void, void))a1 + 2))(*a1, *((void *)a1 + 1), *((void *)a1 + 3));
  uint64_t v2 = (const void *)*((void *)a1 + 1);
  if (v2) {
    CFRelease(v2);
  }

  free(a1);
}

uint64_t sub_226900B08(unsigned char *a1, uint64_t a2, char *__s, unsigned __int8 *a4)
{
  uint64_t v4 = 4294901756;
  if (__s)
  {
    size_t v9 = strlen(__s);
    BOOL v10 = sub_226900D84((unsigned __int8 *)__s);
    if (a4)
    {
      unint64_t v11 = v9 - v10;
      if (v11 >= 6)
      {
        if (*a4)
        {
          int v12 = &__s[v11 - 4];
          if (!strncasecmp(v12, "_tcp", 4uLL) || !strncasecmp(v12, "_udp", 4uLL))
          {
            if (a2)
            {
              unsigned __int8 v13 = *(unsigned char *)a2;
              if (*(unsigned char *)a2)
              {
                uint64_t v14 = 0;
                size_t v15 = (unsigned __int8 *)(a2 + 1);
                unint64_t v16 = a1;
                while (1)
                {
                  if (v13 < 0x21u)
                  {
LABEL_11:
                    if (v14 > 1000) {
                      goto LABEL_45;
                    }
                    *unint64_t v16 = 92;
                    uint64_t v17 = &a1[v14];
                    v17[1] = 48;
                    uint64_t v18 = v14 + 3;
                    v17[2] = (v13 / 0xAu) | 0x30;
                    unsigned __int8 v13 = (v13 % 0xAu) | 0x30;
                    goto LABEL_23;
                  }
                  if (v13 > 0x39u)
                  {
                    if (v13 != 92)
                    {
                      if (v13 == 58) {
                        goto LABEL_11;
                      }
LABEL_19:
                      if (v14 >= 1004) {
                        goto LABEL_45;
                      }
                      uint64_t v18 = v14;
                      goto LABEL_23;
                    }
                  }
                  else
                  {
                    if (v13 == 37) {
                      goto LABEL_11;
                    }
                    if (v13 != 46) {
                      goto LABEL_19;
                    }
                  }
                  if (v14 > 1002)
                  {
LABEL_45:
                    uint64_t v25 = &a1[v14];
                    goto LABEL_51;
                  }
                  uint64_t v18 = v14 + 1;
                  *unint64_t v16 = 92;
LABEL_23:
                  uint64_t v14 = v18 + 1;
                  a1[v18] = v13;
                  unsigned __int8 v19 = *v15++;
                  unsigned __int8 v13 = v19;
                  unint64_t v16 = &a1[v18 + 1];
                  if (!v19)
                  {
                    a2 = v18 + 2;
                    *unint64_t v16 = 46;
                    goto LABEL_26;
                  }
                }
              }
              a2 = 0;
            }
LABEL_26:
            char v20 = *__s;
            if (*__s)
            {
              uint64_t v21 = 1004;
              if (a2 > 1004) {
                uint64_t v21 = a2;
              }
              char v22 = __s + 1;
              while (v21 != a2)
              {
                uint64_t v23 = a2 + 1;
                a1[a2] = v20;
                int v24 = *v22++;
                char v20 = v24;
                ++a2;
                if (!v24)
                {
                  uint64_t v25 = &a1[v23];
                  a2 = v23;
                  goto LABEL_34;
                }
              }
              goto LABEL_44;
            }
            uint64_t v25 = &a1[a2];
LABEL_34:
            if (!sub_226900D84((unsigned __int8 *)__s))
            {
              if (a2 > 1003) {
                goto LABEL_51;
              }
              ++a2;
              *uint64_t v25 = 46;
            }
            unsigned __int8 v26 = *a4;
            if (*a4)
            {
              uint64_t v27 = 1004;
              if (a2 > 1004) {
                uint64_t v27 = a2;
              }
              size_t v28 = a4 + 1;
              while (v27 != a2)
              {
                uint64_t v29 = a2 + 1;
                a1[a2] = v26;
                int v30 = *v28++;
                unsigned __int8 v26 = v30;
                ++a2;
                if (!v30)
                {
                  uint64_t v25 = &a1[v29];
                  a2 = v29;
                  goto LABEL_47;
                }
              }
LABEL_44:
              uint64_t v25 = &a1[a2];
              goto LABEL_51;
            }
            uint64_t v25 = &a1[a2];
LABEL_47:
            if (sub_226900D84(a4))
            {
              uint64_t v4 = 0;
            }
            else if (a2 <= 1003)
            {
              uint64_t v4 = 0;
              *v25++ = 46;
            }
LABEL_51:
            *uint64_t v25 = 0;
          }
        }
      }
    }
  }
  return v4;
}

BOOL sub_226900D84(unsigned __int8 *a1)
{
  int v1 = *a1;
  if (*a1)
  {
    while (1)
    {
      int v2 = a1[1];
      if (!a1[1]) {
        break;
      }
      if (v1 == 92)
      {
        if ((v2 - 48) > 9 || a1[2] - 48 > 9 || a1[3] - 48 >= 0xA) {
          uint64_t v3 = 2;
        }
        else {
          uint64_t v3 = 4;
        }
        a1 += v3;
        int v1 = *a1;
        if (!*a1) {
          return v1 == 46;
        }
      }
      else
      {
        int v1 = *++a1;
        if (!v2) {
          return v1 == 46;
        }
      }
    }
  }
  return v1 == 46;
}

void sub_226900E00(void *a1)
{
  int v2 = (const void *)a1[10];
  if (v2) {
    CFRelease(v2);
  }

  free(a1);
}

uint64_t sub_226901198(void *a1, unsigned int a2)
{
  id v4 = objc_alloc_init(MEMORY[0x263F086B0]);
  if (!a1 || a2 < 0x10) {
    goto LABEL_10;
  }
  uint64_t v5 = (void *)MEMORY[0x263F086E0];
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_bundleForClass_(v5, v7, v6);
  if (!v8
    || ((BOOL v10 = objc_msgSend_objectForInfoDictionaryKey_(v8, v9, @"CFBundleVersion"),
         !objc_msgSend_length(v10, v11, v12))
      ? (uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v13, @"Unknown Version-%@", @"iOSFW")): (uint64_t v14 = objc_msgSend_stringWithFormat_(NSString, v13, @"%@-%@", v10, @"iOSFW")), (v17 = (const char *)objc_msgSend_UTF8String(v14, v15, v16)) == 0))
  {
    uint64_t v21 = 4294960569;
    goto LABEL_12;
  }
  uint64_t v18 = v17;
  unsigned __int8 v19 = strlen(v17);
  if (a2 > v19)
  {
    uint64_t v20 = v19;
    memcpy(a1, v18, v19);
    uint64_t v21 = 0;
    *((unsigned char *)a1 + v20) = 0;
  }
  else
  {
LABEL_10:
    uint64_t v21 = 4294960591;
  }
LABEL_12:

  return v21;
}

BOOL sub_2269012B4(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F01878]);
  id v4 = objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v2, v3, @"com.apple.airport.mobileairportutility", 0, 0);

  if (v4)
  {
    CFIndex v7 = objc_msgSend_defaultWorkspace(MEMORY[0x263F01880], v5, v6);
    size_t v9 = objc_msgSend_operationToOpenResource_usingApplication_userInfo_(v7, v8, a1, @"com.apple.airport.mobileairportutility", 0);
    objc_msgSend_start(v9, v10, v11);
  }
  return v4 != 0;
}

uint64_t sub_22690132C(void *a1)
{
  id v2 = malloc_type_calloc(1uLL, 0x48uLL, 0x1000040D2215A62uLL);
  if (!v2) {
    return 4294960568;
  }
  uint64_t v3 = v2;
  uint64_t result = 0;
  unsigned char *v3 = 1;
  *a1 = v3;
  return result;
}

uint64_t sub_226901388(void *a1)
{
  if (!a1) {
    return 4294960556;
  }
  free(a1);
  return 0;
}

unint64_t sub_2269013B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result = 0;
  if (a1 && a3)
  {
    uint64_t v7 = mach_absolute_time();
    unint64_t v8 = v7 / sub_226870FE0();
    float v9 = (float)(unint64_t)(a2 - *(void *)(a1 + 48)) / (float)(v8 - *(void *)(a1 + 56));
    uint64_t v10 = *(unsigned int *)(a1 + 44);
    *(float *)(a1 + 4 * v10 + 4) = v9;
    if (v10 < 0xA)
    {
      int v11 = v10 + 1;
      BOOL v12 = *(unsigned char *)a1 == 0;
    }
    else
    {
      qsort((void *)(a1 + 4), 0xAuLL, 4uLL, (int (__cdecl *)(const void *, const void *))sub_2269014EC);
      int v11 = 0;
      *(unsigned char *)a1 = 0;
      BOOL v12 = 1;
    }
    *(_DWORD *)(a1 + 44) = v11;
    if (a3 != a2 && v12 && (v9 != 0.0 ? (BOOL v13 = v11 == 0) : (BOOL v13 = 0), v13))
    {
      double v14 = 0.0;
      for (uint64_t i = 12; i != 32; i += 4)
        double v14 = v14 + *(float *)(a1 + i);
      float v16 = v14 / 6.0;
      *(float *)(a1 + 64) = v16;
    }
    else
    {
      float v16 = *(float *)(a1 + 64);
    }
    *(void *)(a1 + 48) = a2;
    *(void *)(a1 + 56) = v8;
    if (v16 == 0.0) {
      return 0;
    }
    else {
      return (unint64_t)(float)((float)(unint64_t)(a3 - a2) / v16);
    }
  }
  return result;
}

uint64_t sub_2269014EC(float *a1, float *a2)
{
  if (*a1 < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *a1 > *a2;
  }
}

uint64_t sub_226901504(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  return objc_msgSend_airPortIsOn(v3, v4, v5);
}

uint64_t sub_226901528(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 4294960591;
  }
  id v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  if (!v4) {
    return 4294960578;
  }
  IfList = objc_msgSend_getIfList(v4, v5, v6);
  if (!IfList) {
    return 4294960569;
  }
  id v8 = IfList;
  uint64_t result = 0;
  *a1 = v8;
  return result;
}

uint64_t sub_226901590(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 4294960591;
  }
  id v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  if (!v4) {
    return 4294960578;
  }
  LinkStatus = objc_msgSend_getLinkStatus(v4, v5, v6);
  if (!LinkStatus) {
    return 4294960569;
  }
  id v8 = LinkStatus;
  uint64_t result = 0;
  *a1 = v8;
  return result;
}

uint64_t sub_2269015F8(void *a1, const char *a2, uint64_t a3)
{
  if (!a1) {
    return 4294960591;
  }
  id v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  if (!v4) {
    return 4294960578;
  }
  CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v4, v5, v6);
  if (!CurrentAssociationInfo) {
    return 4294960569;
  }
  id v8 = CurrentAssociationInfo;
  uint64_t result = 0;
  *a1 = v8;
  return result;
}

uint64_t sub_226901660(uint64_t a1, const char *a2, unsigned char *a3)
{
  char v5 = 0;
  uint64_t result = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, a2, a1, a2, &v5);
  if (a3) {
    *a3 = v5;
  }
  return result;
}

uint64_t sub_2269016B0(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsIBSS_(WiFiUtils, a2, a1);
}

uint64_t sub_2269016D4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoNetworkName_(WiFiUtils, a2, a1);
}

uint64_t sub_2269016E4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoBSSIDStr_(WiFiUtils, a2, a1);
}

uint64_t sub_2269016F4(uint64_t a1, const char *a2, uint64_t a3)
{
  char v5 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);

  return objc_msgSend_scanInfoForName_wifiType_(v5, v6, a1, a2);
}

uint64_t sub_22690173C(uint64_t a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_sharedInstance(WiFiUtils, a2, a3);

  return objc_msgSend_scanInfoForMACAddress_(v4, v5, a1);
}

uint64_t sub_22690177C(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsUnconfigured_(WiFiUtils, a2, a1);
}

uint64_t sub_2269017A0(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsSTAOnly_(WiFiUtils, a2, a1);
}

uint64_t sub_2269017C4(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIsWPA3_(WiFiUtils, a2, a1);
}

uint64_t sub_2269017E8(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoDeviceKind_(WiFiUtils, a2, a1);
}

uint64_t sub_2269017F8(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoAppleProductID_(WiFiUtils, a2, a1);
}

uint64_t sub_226901808(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoCanJoin5GHzNetworks_(WiFiUtils, a2, a1);
}

uint64_t sub_22690182C(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoCanJoinWPA3Networks_(WiFiUtils, a2, a1);
}

uint64_t sub_226901850(uint64_t a1, const char *a2)
{
  return objc_msgSend_scanInfoIs5GHz_(WiFiUtils, a2, a1);
}

uint64_t sub_226901874(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](WiFiUtils, sel_copyFilteredNetworks_ignoreOptions_, a1);
}

uint64_t sub_226901888(uint64_t a1, const char *a2)
{
  return objc_msgSend_network_shouldBeIgnored_(WiFiUtils, a2, a1, a2);
}

uint64_t sub_2269018B0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](WiFiUtils, sel_scanInfoAirPortUniqueIdentifier_, a1);
}

uint64_t sub_226902A94(void *a1, char *__s, int a3, int a4, uint64_t a5, int a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, NSObject *a12)
{
  if (!*__s) {
    return 4294960591;
  }
  uint64_t v18 = __s;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  memset(v27, 0, sizeof(v27));
  uint64_t v20 = strchr(__s, 58);
  if (v20 && v20[1] == 47 && v20[2] == 47)
  {
    uint64_t result = sub_2268716B8(v18, 0, (char **)v27, 0);
    if (result) {
      return result;
    }
    size_t v22 = *((void *)&v28 + 1);
    uint64_t v18 = (char *)v28;
  }
  else
  {
    size_t v22 = strlen(v18);
  }
  uint64_t v23 = malloc_type_calloc(1uLL, 0x60uLL, 0x10B00408BA0FE54uLL);
  if (!v23) {
    return 4294960568;
  }
  int v24 = v23;
  *uint64_t v23 = 1;
  uint64_t v25 = sub_22686FFA0(v18, v22);
  *((void *)v24 + 1) = v25;
  if (!v25)
  {
    sub_226902EEC(v24);
    return 4294960568;
  }
  v24[4] = a3;
  v24[5] = a4;
  if (a5) {
    uint64_t v26 = a5;
  }
  else {
    uint64_t v26 = -1;
  }
  *((void *)v24 + 3) = v26;
  v24[8] = a6;
  v24[9] = a7;
  *((void *)v24 + 7) = a8;
  *((void *)v24 + 8) = a9;
  dispatch_retain(a12);
  *((void *)v24 + 9) = a12;
  *((void *)v24 + 10) = a10;
  *((void *)v24 + 11) = a11;
  dispatch_async_f(a12, v24, (dispatch_function_t)sub_226902C1C);
  uint64_t result = 0;
  *a1 = v24;
  return result;
}

void sub_226902C1C(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  memset(v20, 0, sizeof(v20));
  int v21 = 0;
  if (!sub_22686DDC8(*(char **)(a1 + 8), (uint64_t)v20, 0x1CuLL, 0))
  {
    unsigned int v15 = *(_DWORD *)(a1 + 16);
    if ((*(unsigned char *)(a1 + 20) & 4) != 0)
    {
      if (!sub_226903238(a1, (unsigned __int8 *)v20, 0, v15)) {
        goto LABEL_24;
      }
      unsigned int v15 = *(_DWORD *)(a1 + 16);
    }
    uint64_t v16 = sub_2269034BC(a1, (unsigned __int8 *)v20, 0, v15);
LABEL_23:
    uint64_t Record = v16;
    if (v16) {
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  id v2 = sub_226870098(*(unsigned char **)(a1 + 8), "._tcp.");
  uint64_t v3 = *(char **)(a1 + 8);
  int v4 = *(_DWORD *)(a1 + 16);
  if (!v2)
  {
    uint64_t v16 = sub_226903858(a1, *(char **)(a1 + 8), *(_DWORD *)(a1 + 16));
    goto LABEL_23;
  }
  char v5 = (DNSServiceRef *)malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (!v5)
  {
    uint64_t Record = 4294960568;
    goto LABEL_29;
  }
  uint64_t v6 = v5;
  int v22 = 0;
  uint32_t interfaceIndex = 0;
  ++*(_DWORD *)a1;
  *(_DWORD *)char v5 = 1;
  v5[2] = (DNSServiceRef)a1;
  *((_DWORD *)v5 + 15) = -1;
  uint64_t Record = sub_226904018(v3, fullname, &interfaceIndex, &v22);
  if (Record) {
    goto LABEL_17;
  }
  int v12 = v22;
  if (v22) {
    BOOL v13 = v4 < 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13) {
    int v12 = v4;
  }
  *((_DWORD *)v6 + 14) = v12;
  if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
    sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_StartSRVQuery(AsyncConnectionRef, const char *, int)", 500, (uint64_t)"Querying SRV  %s\n", v7, v8, v9, v10, (uint64_t)v3);
  }
  double v14 = *(void (**)(uint64_t, char *, void))(a1 + 56);
  if (v14) {
    v14(1, v3, *(void *)(a1 + 64));
  }
  uint64_t Record = DNSServiceQueryRecord(v6 + 8, 0x400000u, interfaceIndex, fullname, 0x21u, 1u, (DNSServiceQueryRecordReply)sub_2269041F4, v6);
  if (Record)
  {
LABEL_17:
    sub_226903B84(v6);
    goto LABEL_29;
  }
  DNSServiceSetDispatchQueue(v6[8], *(dispatch_queue_t *)(a1 + 72));
  v6[1] = *(DNSServiceRef *)(a1 + 48);
  *(void *)(a1 + 48) = v6;
LABEL_24:
  if (*(void *)(a1 + 24) == -1) {
    return;
  }
  uint64_t v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *(dispatch_queue_t *)(a1 + 72));
  *(void *)(a1 + 40) = v17;
  if (v17)
  {
    dispatch_set_context(v17, (void *)a1);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(a1 + 40), (dispatch_function_t)sub_226903A10);
    uint64_t v18 = *(NSObject **)(a1 + 40);
    dispatch_time_t v19 = dispatch_time(0, *(void *)(a1 + 24));
    dispatch_source_set_timer(v18, v19, *(void *)(a1 + 24), 0x5F5E100uLL);
    dispatch_resume(*(dispatch_object_t *)(a1 + 40));
    return;
  }
  uint64_t Record = 4294960596;
LABEL_29:
  sub_226903A1C(a1, 0xFFFFFFFFLL, Record);
}

void sub_226902EEC(void *a1)
{
  if ((*(_DWORD *)a1)-- == 1)
  {
    sub_226903A1C((uint64_t)a1, 0xFFFFFFFFLL, 4294960573);
    uint64_t v3 = a1[9];
    if (v3)
    {
      dispatch_release(v3);
      a1[9] = 0;
    }
    int v4 = (void *)a1[1];
    if (v4) {
      free(v4);
    }
    free(a1);
  }
}

void sub_226902F64(void *a1)
{
  sub_226903A1C((uint64_t)a1, 0xFFFFFFFFLL, 4294960573);

  sub_226902EEC(a1);
}

uint64_t sub_226902FA4(char *a1, int a2, int a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  return sub_226902FD0(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9);
}

uint64_t sub_226902FD0(char *a1, int a2, int a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8, unsigned int (*a9)(uint64_t), uint64_t a10, _DWORD *a11)
{
  dispatch_semaphore_t dsema = 0;
  if (!*a1) {
    return 4294960591;
  }
  uint64_t v35 = 0;
  dispatch_time_t v19 = dispatch_queue_create(a1, 0);
  dispatch_object_t object = v19;
  if (!v19)
  {
    uint64_t v21 = 4294960596;
    goto LABEL_27;
  }
  uint64_t v20 = v19;
  dispatch_semaphore_t dsema = dispatch_semaphore_create(0);
  if (!dsema)
  {
    uint64_t v21 = 4294960596;
    goto LABEL_29;
  }
  uint64_t v35 = -6700;
  context = 0;
  uint64_t v21 = sub_226902A94(&context, a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)sub_226903224, (uint64_t)&object, v20);
  if (v21) {
    goto LABEL_27;
  }
  if (!a9)
  {
    dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
    goto LABEL_24;
  }
  dispatch_time_t v22 = dispatch_time(0, 250000000);
  if (!dispatch_semaphore_wait(dsema, v22)) {
    goto LABEL_24;
  }
  int v23 = 0;
  int v24 = (dispatch_queue_t *)context;
  do
  {
    if (v23) {
      goto LABEL_15;
    }
    if (a9(a10))
    {
      if (dword_2681480E0 <= 3000 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0xBB8u))) {
        sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus AsyncConnection_ConnectSyncEx(const char *, int, AsyncConnectionFlags, uint64_t, int, int, AsyncConnectionProgressFunc, void *, AsyncConnectionWaitFunc, void *, SocketRef *)", 3000, (uint64_t)"### Canceling connect to %s\n", v25, v26, v27, v28, (uint64_t)a1);
      }
      dispatch_async_f(v24[9], v24, (dispatch_function_t)sub_226902F64);
LABEL_15:
      int v29 = 0;
      int v23 = 1;
      goto LABEL_16;
    }
    int v23 = 0;
    int v29 = 1;
LABEL_16:
    dispatch_time_t v30 = dispatch_time(0, 250000000);
  }
  while (dispatch_semaphore_wait(dsema, v30));
  if (v29) {
LABEL_24:
  }
    dispatch_async_f(*((dispatch_queue_t *)context + 9), context, (dispatch_function_t)sub_226902F64);
  uint64_t v21 = v35;
  if (!v35) {
    *a11 = HIDWORD(v35);
  }
LABEL_27:
  if (dsema) {
    dispatch_release(dsema);
  }
LABEL_29:
  if (object) {
    dispatch_release(object);
  }
  return v21;
}

intptr_t sub_226903224(int a1, int a2, uint64_t a3)
{
  *(_DWORD *)(a3 + 16) = a2;
  if (!a2) {
    *(_DWORD *)(a3 + 20) = a1;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a3 + 8));
}

uint64_t sub_226903238(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4)
{
  memset(&context, 0, sizeof(context));
  uint64_t v8 = malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (v8)
  {
    uint64_t v9 = v8;
    *(void *)&address.sa_len = 0;
    *(void *)&address.sa_data[6] = 0;
    int v23 = 0;
    uint64_t v22 = 0;
    SCNetworkReachabilityFlags flags = 0;
    ++*(_DWORD *)a1;
    *(_DWORD *)uint64_t v8 = 1;
    v8[2] = a1;
    *((_DWORD *)v8 + 15) = -1;
    sub_22686E260(a2, v8 + 3);
    v9[13] = a3;
    v9[14] = a4;
    sub_22686E260(a2, &address);
    if ((a4 & 0x80000000) != 0)
    {
      unsigned int v11 = -a4;
    }
    else
    {
      int v10 = sub_22686DF0C((uint64_t)&address);
      unsigned int v11 = a4;
      if (v10)
      {
LABEL_8:
        BOOL v13 = SCNetworkReachabilityCreateWithAddress(0, &address);
        *((void *)v9 + 11) = v13;
        if (v13
          && (context.info = v9,
              SCNetworkReachabilitySetCallback(v13, (SCNetworkReachabilityCallBack)sub_226903A8C, &context))
          && SCNetworkReachabilitySetDispatchQueue(*((SCNetworkReachabilityRef *)v9 + 11), *(dispatch_queue_t *)(a1 + 72)))
        {
          SCNetworkReachabilityFlags flags = 0;
          if (!SCNetworkReachabilityGetFlags(*((SCNetworkReachabilityRef *)v9 + 11), &flags) || (flags & 2) == 0) {
            goto LABEL_22;
          }
          if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
            sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_ReachabilityStart(AsyncConnectionRef, const void *, unsigned int, int)", 500, (uint64_t)"Reachability of %##a default port %d OK, Flags 0x%X\n", v14, v15, v16, v17, (uint64_t)a2);
          }
          if (sub_2269034BC(a1, a2, a3, a4))
          {
            if (dword_2681480E0 > 3000)
            {
LABEL_26:
              uint64_t v12 = 0;
              *((void *)v9 + 1) = *(void *)(a1 + 48);
              *(void *)(a1 + 48) = v9;
              return v12;
            }
            if (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0xBB8u)) {
              sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_ReachabilityStart(AsyncConnectionRef, const void *, unsigned int, int)", 3000, (uint64_t)"### Connect %##a default port %d failed after reachability said OK\n", v14, v15, v16, v17, (uint64_t)a2);
            }
LABEL_22:
            if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
              sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_ReachabilityStart(AsyncConnectionRef, const void *, unsigned int, int)", 500, (uint64_t)"Monitoring reachability of %##a default port %d\n", v14, v15, v16, v17, (uint64_t)a2);
            }
            goto LABEL_26;
          }
          uint64_t v12 = 0;
        }
        else
        {
          uint64_t v12 = 4294960596;
        }
        sub_226903B84(v9);
        return v12;
      }
    }
    sub_22686DF38((uint64_t)&address, v11);
    goto LABEL_8;
  }
  return 4294960568;
}

uint64_t sub_2269034BC(uint64_t a1, unsigned __int8 *a2, int a3, unsigned int a4)
{
  uint64_t v8 = (char *)malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    ++*(_DWORD *)a1;
    *(_DWORD *)uint64_t v8 = 1;
    *((void *)v8 + 2) = a1;
    int v10 = (const sockaddr *)(v8 + 24);
    sub_22686E260(a2, v8 + 24);
    if ((a4 & 0x80000000) != 0)
    {
      unsigned int v12 = -a4;
    }
    else
    {
      int v11 = sub_22686DF0C((uint64_t)v10);
      unsigned int v12 = a4;
      if (v11) {
        goto LABEL_8;
      }
    }
    sub_22686DF38((uint64_t)v10, v12);
LABEL_8:
    int v29 = 0;
    *(_DWORD *)(v9 + 56) = a4;
    int v14 = socket(*(unsigned __int8 *)(v9 + 25), 1, 6);
    *(_DWORD *)(v9 + 60) = v14;
    if (v14 < 0)
    {
      if (!*__error()) {
        goto LABEL_35;
      }
      uint64_t v13 = *__error();
      if (v13) {
        goto LABEL_36;
      }
      int v14 = *(_DWORD *)(v9 + 60);
    }
    uint64_t v13 = sub_22686DF5C(v14, 1);
    if (v13) {
      goto LABEL_36;
    }
    if (*(unsigned char *)(a1 + 20)) {
      sub_22686E160(*(_DWORD *)(v9 + 60), 1);
    }
    int v29 = 1;
    setsockopt(*(_DWORD *)(v9 + 60), 0xFFFF, 4130, &v29, 4u);
    uint64_t v13 = sub_22686E1B4(*(_DWORD *)(v9 + 60), *(unsigned __int8 *)(v9 + 25), a3);
    if (v13) {
      goto LABEL_36;
    }
    int v29 = 1;
    setsockopt(*(_DWORD *)(v9 + 60), 6, 1, &v29, 4u);
    sub_22686DFD8(*(_DWORD *)(v9 + 60), 4097, *(_DWORD *)(a1 + 32));
    sub_22686DFD8(*(_DWORD *)(v9 + 60), 4098, *(_DWORD *)(a1 + 36));
    if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
      sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_StartConnect(AsyncConnectionRef, const void *, unsigned int, int)", 500, (uint64_t)"Connecting to %##a If %d\n", v15, v16, v17, v18, (uint64_t)v10);
    }
    dispatch_time_t v19 = *(void (**)(uint64_t, const sockaddr *, void))(a1 + 56);
    if (v19) {
      v19(3, v10, *(void *)(a1 + 64));
    }
    int v20 = *(_DWORD *)(v9 + 60);
    socklen_t v21 = sub_22686E240((uint64_t)v10);
    if (!connect(v20, v10, v21)) {
      goto LABEL_23;
    }
    if (!*__error())
    {
      uint64_t v13 = 4294960596;
      goto LABEL_28;
    }
    uint64_t v13 = *__error();
    if (v13 != 36)
    {
      if (!v13)
      {
LABEL_23:
        sub_226903C70(v9);
        uint64_t v13 = 0;
LABEL_36:
        sub_226903B84((_DWORD *)v9);
        return v13;
      }
LABEL_28:
      if (dword_2681480E0 <= 3000 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0xBB8u))) {
        sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_StartConnect(AsyncConnectionRef, const void *, unsigned int, int)", 3000, (uint64_t)"### Connect 1 to %##a failed: %#m\n", v22, v23, v24, v25, (uint64_t)v10);
      }
      goto LABEL_36;
    }
    uint64_t v26 = dispatch_source_create(MEMORY[0x263EF83E8], *(int *)(v9 + 60), 0, *(dispatch_queue_t *)(a1 + 72));
    *(void *)(v9 + 72) = v26;
    if (v26)
    {
      dispatch_set_context(v26, (void *)v9);
      dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v9 + 72), (dispatch_function_t)sub_226903D78);
      dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v9 + 72), (dispatch_function_t)sub_226903F64);
      dispatch_resume(*(dispatch_object_t *)(v9 + 72));
      ++*(_DWORD *)v9;
      uint64_t v27 = dispatch_source_create(MEMORY[0x263EF8418], *(int *)(v9 + 60), 0, *(dispatch_queue_t *)(a1 + 72));
      *(void *)(v9 + 80) = v27;
      if (v27)
      {
        dispatch_set_context(v27, (void *)v9);
        dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v9 + 80), (dispatch_function_t)sub_226903D78);
        dispatch_source_set_cancel_handler_f(*(dispatch_source_t *)(v9 + 80), (dispatch_function_t)sub_226903F64);
        dispatch_resume(*(dispatch_object_t *)(v9 + 80));
        uint64_t v13 = 0;
        ++*(_DWORD *)v9;
        *(void *)(v9 + 8) = *(void *)(a1 + 48);
        *(void *)(a1 + 48) = v9;
        return v13;
      }
    }
LABEL_35:
    uint64_t v13 = 4294960596;
    goto LABEL_36;
  }
  return 4294960568;
}

uint64_t sub_226903858(uint64_t a1, char *a2, int a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v6 = (DNSServiceRef *)malloc_type_calloc(1uLL, 0x60uLL, 0x10600401FCF4767uLL);
  if (!v6) {
    return 4294960568;
  }
  uint64_t v7 = v6;
  int v17 = 0;
  uint32_t interfaceIndex = 0;
  ++*(_DWORD *)a1;
  *(_DWORD *)uint64_t v6 = 1;
  v6[2] = (DNSServiceRef)a1;
  *((_DWORD *)v6 + 15) = -1;
  uint64_t AddrInfo = sub_226904018(a2, hostname, &interfaceIndex, &v17);
  if (AddrInfo) {
    goto LABEL_15;
  }
  int v13 = v17;
  if (v17) {
    BOOL v14 = a3 < 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    int v13 = a3;
  }
  *((_DWORD *)v7 + 14) = v13;
  if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
    sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"OSStatus _AsyncConnection_StartDNSResolve(AsyncConnectionRef, const char *, int)", 500, (uint64_t)"Resolving     %s\n", v8, v9, v10, v11, (uint64_t)a2);
  }
  uint64_t v15 = *(void (**)(uint64_t, char *, void))(a1 + 56);
  if (v15) {
    v15(2, a2, *(void *)(a1 + 64));
  }
  uint64_t AddrInfo = DNSServiceGetAddrInfo(v7 + 8, (*(_DWORD *)(a1 + 20) << 14) & 0x8000, interfaceIndex, 0, hostname, (DNSServiceGetAddrInfoReply)sub_226904430, v7);
  if (AddrInfo)
  {
LABEL_15:
    sub_226903B84(v7);
  }
  else
  {
    DNSServiceSetDispatchQueue(v7[8], *(dispatch_queue_t *)(a1 + 72));
    v7[1] = *(DNSServiceRef *)(a1 + 48);
    *(void *)(a1 + 48) = v7;
  }
  return AddrInfo;
}

uint64_t sub_226903A10(uint64_t a1)
{
  return sub_226903A1C(a1, 0xFFFFFFFFLL, 4294960574);
}

uint64_t sub_226903A1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void (**)(uint64_t, uint64_t, void))(a1 + 80);
  *(void *)(a1 + 80) = 0;
  if (v4) {
    v4(a2, a3, *(void *)(a1 + 88));
  }
  char v5 = *(NSObject **)(a1 + 40);
  if (v5)
  {
    dispatch_source_cancel(v5);
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
    *(void *)(a1 + 40) = 0;
  }
  while (1)
  {
    uint64_t result = *(void *)(a1 + 48);
    if (!result) {
      break;
    }
    *(void *)(a1 + 48) = *(void *)(result + 8);
    sub_226903B84();
  }
  return result;
}

void sub_226903A8C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
    sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"void _AsyncConnection_ReachabilityHandler(SCNetworkReachabilityRef, SCNetworkReachabilityFlags, void *)", 500, (uint64_t)"Reachability of %##a, port %d changed: 0x%X\n", a5, a6, a7, a8, a3 + 24);
  }
  if ((a2 & 2) != 0
    && !sub_2269034BC(*(void *)(a3 + 16), (unsigned __int8 *)(a3 + 24), *(_DWORD *)(a3 + 52), *(_DWORD *)(a3 + 56)))
  {
    uint64_t v10 = *(void *)(a3 + 16);
    uint64_t v13 = *(void *)(v10 + 48);
    unsigned int v12 = (void *)(v10 + 48);
    uint64_t v11 = v13;
    if (v13)
    {
      if (v11 == a3)
      {
LABEL_13:
        *unsigned int v12 = *(void *)(a3 + 8);
      }
      else
      {
        while (1)
        {
          uint64_t v14 = v11;
          uint64_t v11 = *(void *)(v11 + 8);
          if (!v11) {
            break;
          }
          if (v11 == a3)
          {
            unsigned int v12 = (void *)(v14 + 8);
            goto LABEL_13;
          }
        }
      }
    }
    sub_226903B84((_DWORD *)a3);
  }
}

void sub_226903B84(_DWORD *a1)
{
  id v2 = (const __SCNetworkReachability *)*((void *)a1 + 11);
  if (v2)
  {
    SCNetworkReachabilitySetCallback(v2, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(*((SCNetworkReachabilityRef *)a1 + 11), 0);
    CFRelease(*((CFTypeRef *)a1 + 11));
    *((void *)a1 + 11) = 0;
  }
  uint64_t v3 = *((void *)a1 + 9);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*((dispatch_object_t *)a1 + 9));
    *((void *)a1 + 9) = 0;
  }
  int v4 = *((void *)a1 + 10);
  if (v4)
  {
    dispatch_source_cancel(v4);
    dispatch_release(*((dispatch_object_t *)a1 + 10));
    *((void *)a1 + 10) = 0;
  }
  char v5 = (_DNSServiceRef_t *)*((void *)a1 + 8);
  if (v5)
  {
    DNSServiceRefDeallocate(v5);
    *((void *)a1 + 8) = 0;
  }
  if ((*a1)-- == 1)
  {
    int v7 = a1[15];
    if ((v7 & 0x80000000) == 0)
    {
      if (close(v7) && *__error()) {
        __error();
      }
      a1[15] = -1;
    }
    sub_226902EEC(*((void **)a1 + 2));
    free(a1);
  }
}

void sub_226903C70(uint64_t a1)
{
  socklen_t v10 = 4;
  unsigned int v11 = 0;
  uint64_t v2 = *(unsigned int *)(a1 + 60);
  if (getsockopt(*(_DWORD *)(a1 + 60), 0xFFFF, 4103, &v11, &v10))
  {
    if (!*__error())
    {
      uint64_t v7 = 4294960596;
      goto LABEL_13;
    }
    uint64_t v7 = *__error();
    if (v7) {
      goto LABEL_13;
    }
  }
  uint64_t v7 = v11;
  if (v11)
  {
LABEL_13:
    sub_226903F68(a1, v7);
    return;
  }
  if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
    sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"void _AsyncConnection_ConnectHandler(AsyncConnectionOperationRef)", 500, (uint64_t)"Connected to  %##a\n", v3, v4, v5, v6, a1 + 24);
  }
  uint64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, void))(v8 + 56);
  if (v9)
  {
    v9(4, a1 + 24, *(void *)(v8 + 64));
    uint64_t v8 = *(void *)(a1 + 16);
  }
  *(_DWORD *)(a1 + 60) = -1;
  sub_226903A1C(v8, v2, 0);
}

void sub_226903D78(uint64_t a1)
{
  uint64_t v2 = *(_DNSServiceRef_t **)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = DNSServiceProcessResult(v2);
    if (v3)
    {
      uint64_t v8 = v3;
      if (dword_2681480E0 <= 6000 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1770u))) {
        sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"void _AsyncConnection_EventHandler(void *)", 6000, (uint64_t)"DNSServiceProcessResult failed: %#m...mDNSResponder probably crashed\n", v4, v5, v6, v7, v8);
      }
      sub_226903F68(a1, v8);
    }
    return;
  }
  int v9 = *(_DWORD *)(a1 + 60);
  socklen_t v10 = sub_22686E240(a1 + 24);
  if (!connect(v9, (const sockaddr *)(a1 + 24), v10)) {
    goto LABEL_15;
  }
  *(void *)int v17 = 0;
  if (!*__error()) {
    goto LABEL_25;
  }
  uint64_t v15 = *__error();
  switch(v15)
  {
    case 0x38:
LABEL_15:
      sub_226903C70(a1);
      return;
    case 0x16:
      v17[0] = 4;
      v17[1] = 0;
      if (!getsockopt(*(_DWORD *)(a1 + 60), 0xFFFF, 4103, &v17[1], v17))
      {
LABEL_21:
        unsigned int v16 = v17[1];
LABEL_22:
        if (v16) {
          uint64_t v15 = v16;
        }
        else {
          uint64_t v15 = 22;
        }
        break;
      }
      if (*__error())
      {
        unsigned int v16 = *__error();
        if (v16) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
LABEL_25:
      uint64_t v15 = 4294960596;
      break;
    case 0:
      goto LABEL_15;
  }
  if (dword_2681480E0 <= 1000 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x3E8u))) {
    sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"void _AsyncConnection_EventHandler(void *)", 1000, (uint64_t)"### Connect 2 to %##a failed: %#m\n", v11, v12, v13, v14, a1 + 24);
  }
  sub_226903F68(a1, v15);
}

void sub_226903F68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(v3 + 48);
  if (v4)
  {
    uint64_t v5 = (void *)(v3 + 48);
    if (v4 == a1)
    {
LABEL_6:
      *uint64_t v5 = *(void *)(a1 + 8);
      if (!*(void *)(v3 + 48)) {
        sub_226903A1C(v3, 0xFFFFFFFFLL, a2);
      }
      sub_226903B84((_DWORD *)a1);
    }
    else
    {
      while (1)
      {
        uint64_t v6 = v4;
        uint64_t v4 = *(void *)(v4 + 8);
        if (!v4) {
          break;
        }
        if (v4 == a1)
        {
          uint64_t v5 = (void *)(v6 + 8);
          goto LABEL_6;
        }
      }
    }
  }
  else
  {
    sub_226903A1C(v3, 0xFFFFFFFFLL, a2);
  }
}

uint64_t sub_226904018(char *a1, void *a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v19 = 0;
  uint64_t v8 = strchr(a1, 37);
  if (v8)
  {
    int v9 = v8;
    socklen_t v10 = v8 + 1;
    uint64_t v11 = strchr(v8 + 1, 58);
    if (v11)
    {
      uint64_t v12 = v11;
      if (sscanf(v11 + 1, "%d", &v19) != 1) {
        return 4294960554;
      }
      int v13 = 1;
    }
    else
    {
      int v13 = 0;
      uint64_t v12 = &v10[strlen(v9)];
    }
    unint64_t v17 = v12 - v10;
    if (v17 <= 0x10)
    {
      __memcpy_chk();
      v21[v17] = 0;
      unsigned int v20 = if_nametoindex(v21);
      if (v20 || sscanf(v21, "%u", &v20) == 1)
      {
        size_t v16 = v9 - a1;
        goto LABEL_16;
      }
    }
    return 4294960554;
  }
  uint64_t v14 = strchr(a1, 58);
  if (v14)
  {
    uint64_t v15 = v14;
    if (sscanf(v14 + 1, "%d", &v19) != 1) {
      return 4294960554;
    }
    size_t v16 = v15 - a1;
    int v13 = 1;
  }
  else
  {
    size_t v16 = strlen(a1);
    int v13 = 0;
  }
  unsigned int v20 = 0;
LABEL_16:
  if (v16 > 0x3F0) {
    return 4294960553;
  }
  memcpy(a2, a1, v16);
  *((unsigned char *)a2 + v16) = 0;
  *a3 = v20;
  uint64_t result = 0;
  if (v13) {
    *a4 = v19;
  }
  return result;
}

void sub_2269041F4(uint64_t a1, char a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  v29[134] = *MEMORY[0x263EF8340];
  if (a4) {
    goto LABEL_2;
  }
  if ((a2 & 2) == 0) {
    return;
  }
  if (a8 < 7)
  {
    a4 = 4294960554;
LABEL_2:
    sub_226903F68(a11, a4);
    return;
  }
  uint64_t v11 = a5;
  uint64_t v14 = a9 + 6;
  unsigned int v13 = *(unsigned __int8 *)(a9 + 6);
  unsigned int v15 = *(unsigned __int16 *)(a9 + 4);
  if (!*(unsigned char *)(a9 + 6))
  {
    unint64_t v17 = (char *)v29;
    __s[0] = 46;
    goto LABEL_22;
  }
  uint64_t v16 = 0;
  unint64_t v17 = __s;
  uint64_t v18 = a9 + 6;
LABEL_8:
  if (v16 + 1 + (unint64_t)v13 <= 0xFE && v13 <= 0x3F)
  {
    unint64_t v19 = v13 + v18 + 1;
    unsigned int v20 = (unsigned __int8 *)(v18 + 1);
    while (1)
    {
      unsigned int v22 = *v20++;
      unsigned int v21 = v22;
      if (v22 == 92 || v21 == 46) {
        break;
      }
      if (v21 > 0x20) {
        goto LABEL_16;
      }
      *(_WORD *)unint64_t v17 = 12380;
      a5 = (205 * v21) >> 11;
      a6 = a5 | 0x30;
      uint64_t v23 = v17 + 3;
      socklen_t v17[2] = a5 | 0x30;
      LOBYTE(v21) = (v21 - 10 * a5) | 0x30;
LABEL_17:
      *uint64_t v23 = v21;
      unint64_t v17 = v23 + 1;
      if ((unint64_t)v20 >= v19)
      {
        v23[1] = 0;
        v16 += 1 + *(unsigned __int8 *)(v14 + v16);
        unint64_t v17 = v23 + 2;
        v23[1] = 46;
        uint64_t v18 = v14 + v16;
        unsigned int v13 = *(unsigned __int8 *)(v14 + v16);
        if (!*(unsigned char *)(v14 + v16))
        {
LABEL_22:
          *unint64_t v17 = 0;
          goto LABEL_23;
        }
        goto LABEL_8;
      }
    }
    *v17++ = 92;
LABEL_16:
    uint64_t v23 = v17;
    goto LABEL_17;
  }
LABEL_23:
  unsigned int v24 = __rev16(v15);
  if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
    sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"void _AsyncConnection_SRVCallBack(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, uint16_t, uint16_t, uint16_t, const void *, uint32_t, void *)", 500, (uint64_t)"SRV resolved  %s -> %s port %d, If %u, Flags 0x%X, TTL %u\n", a5, a6, a7, a8, v11);
  }
  size_t v25 = strlen(__s);
  snprintf(&__s[v25], 1073 - v25, "%%%u", a3);
  if (*(int *)(a11 + 56) < 0 || v24 == 0) {
    int v27 = *(_DWORD *)(a11 + 56);
  }
  else {
    int v27 = v24;
  }
  a4 = sub_226903858(*(void *)(a11 + 16), __s, v27);
  if (a4) {
    goto LABEL_2;
  }
}

void sub_226904430(uint64_t a1, char a2, int a3, int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8)
{
  if ((a2 & 2) != 0 && !a4)
  {
    uint64_t v11 = *(void *)(a8 + 16);
    if (dword_2681480E0 <= 500 && (dword_2681480E0 != -1 || sub_226865630((uint64_t)&dword_2681480E0, 0x1F4u))) {
      sub_226865EB4((uint64_t)&dword_2681480E0, (uint64_t)"void _AsyncConnection_DNSCallBack(DNSServiceRef, DNSServiceFlags, uint32_t, DNSServiceErrorType, const char *, const struct sockaddr *, uint32_t, void *)", 500, (uint64_t)"Resolved      %s -> %##a, Flags 0x%X, If %u, TTL %u\n", a5, (uint64_t)a6, a7, a8, a5);
    }
    if ((*(unsigned char *)(v11 + 20) & 4) == 0 || sub_226903238(v11, a6, a3, *(_DWORD *)(a8 + 56)))
    {
      unsigned int v13 = *(_DWORD *)(a8 + 56);
      sub_2269034BC(v11, a6, a3, v13);
    }
  }
}

void sub_226904544(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v36 = 0;
    sub_22686088C(a1, (uint64_t)&v36, (UInt8 *)"%kC", a4, a5, a6, a7, a8, 1918979393);
    if (!v16)
    {
      if (v36)
      {
        CFStringRef v17 = sub_22685B6F8(a1, v9, v10, v11, v12, v13, v14, v15);
        if (v17)
        {
          uint64_t v20 = (uint64_t)v17;
          unsigned int v21 = objc_msgSend_standardUserDefaults(MEMORY[0x263EFFA40], v18, v19);
          uint64_t v24 = objc_msgSend_dictionaryForKey_(v21, v22, @"configuredAirPortIDs");
          if (v24) {
            uint64_t v25 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x263EFF9A0], v23, v24);
          }
          else {
            uint64_t v25 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v23, 0);
          }
          int v27 = (void *)v25;
          uint64_t v28 = NSDictionary;
          uint64_t v29 = objc_msgSend_numberWithBool_(NSNumber, v26, 1);
          uint64_t v31 = objc_msgSend_dictionaryWithObjectsAndKeys_(v28, v30, v20, @"deviceName", v29, @"monitorProblems", 0);
          objc_msgSend_setObject_forKey_(v27, v32, v31, v36);
          objc_msgSend_setObject_forKey_(v21, v33, (uint64_t)v27, @"configuredAirPortIDs");
          objc_msgSend_synchronize(v21, v34, v35);
        }
      }
    }
  }
}

uint64_t sub_2269050C4(uint64_t a1, const char *a2, uint64_t a3)
{
  if (byte_268148368 == 1) {
    return byte_268148369;
  }
  uint64_t v4 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, a3);
  uint64_t v7 = objc_msgSend_systemVersion(v4, v5, v6);
  uint64_t result = sub_2269053DC(v7, (char *)@"7.0", v8) != -1;
  byte_268148369 = result;
  byte_268148368 = 1;
  return result;
}

uint64_t sub_226905130(uint64_t a1, const char *a2, uint64_t a3)
{
  if (byte_26814836A == 1) {
    return byte_26814836B;
  }
  uint64_t v4 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], a2, a3);
  uint64_t v7 = objc_msgSend_systemVersion(v4, v5, v6);
  uint64_t result = sub_2269053DC(v7, (char *)@"8.0", v8) != -1;
  byte_26814836B = result;
  byte_26814836A = 1;
  return result;
}

uint64_t sub_22690519C(void *a1, const char *a2, uint64_t a3)
{
  if (!sub_226905130((uint64_t)a1, a2, a3)) {
    return 0;
  }
  if (a1)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t result = objc_msgSend_traitCollection(a1, v4, v5);
      if (result) {
        return result;
      }
    }
  }
  objc_msgSend_mainScreen(MEMORY[0x263F1C920], v4, v5);
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_mainScreen(MEMORY[0x263F1C920], v7, v8);

  return objc_msgSend_traitCollection(v9, v10, v11);
}

uint64_t sub_22690522C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = (void *)sub_22690519C(a1, a2, a3);
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t result = objc_msgSend_horizontalSizeClass(v4, v5, v6);
  if (result == 2) {
    return result;
  }
  if (result == 1)
  {
    uint64_t v8 = objc_msgSend_view(a1, v5, v6);
    objc_msgSend_bounds(v8, v9, v10);
    if (v11 < 400.0) {
      return 1;
    }
    else {
      return 3;
    }
  }
  else
  {
LABEL_7:
    uint64_t v12 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], v5, v6);
    uint64_t v15 = objc_msgSend_userInterfaceIdiom(v12, v13, v14);
    uint64_t v18 = objc_msgSend_view(a1, v16, v17);
    if (v15)
    {
      if (v18)
      {
        unsigned int v21 = objc_msgSend_view(a1, v19, v20);
        objc_msgSend_bounds(v21, v22, v23);
        if (v24 <= 480.0) {
          return 1;
        }
        else {
          return 2;
        }
      }
      else
      {
        return 2;
      }
    }
    else if (v18)
    {
      uint64_t v25 = objc_msgSend_view(a1, v19, v20);
      objc_msgSend_bounds(v25, v26, v27);
      if (v28 >= 400.0) {
        return 3;
      }
      else {
        return 1;
      }
    }
    else
    {
      return 1;
    }
  }
}

uint64_t sub_226905310(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = (void *)sub_22690519C(a1, a2, a3);
  if (!v4) {
    goto LABEL_7;
  }
  uint64_t result = objc_msgSend_horizontalSizeClass(v4, v5, v6);
  if (result == 2) {
    return result;
  }
  if (result == 1)
  {
    objc_msgSend_bounds(a1, v5, v6);
    if (v8 < 400.0) {
      return 1;
    }
    else {
      return 3;
    }
  }
  else
  {
LABEL_7:
    uint64_t v9 = objc_msgSend_currentDevice(MEMORY[0x263F1C5C0], v5, v6);
    if (objc_msgSend_userInterfaceIdiom(v9, v10, v11))
    {
      if (a1)
      {
        objc_msgSend_bounds(a1, v12, v13);
        if (v14 <= 480.0) {
          return 1;
        }
        else {
          return 2;
        }
      }
      else
      {
        return 2;
      }
    }
    else if (a1)
    {
      objc_msgSend_bounds(a1, v12, v13);
      if (v15 >= 400.0) {
        return 3;
      }
      else {
        return 1;
      }
    }
    else
    {
      return 1;
    }
  }
}

uint64_t sub_2269053DC(void *a1, char *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_UTF8String(a1, a2, a3);
  if (result)
  {
    uint64_t v8 = 0;
    if (sub_22686F3A4((char *)result, -1, (int *)&v8 + 1)) {
      return 0;
    }
    uint64_t result = objc_msgSend_UTF8String(a2, v5, v6);
    if (result)
    {
      if (sub_22686F3A4((char *)result, -1, (int *)&v8)) {
        return 0;
      }
      if ((HIDWORD(v8) & 0xFFFFFF00) < (v8 & 0xFFFFFF00)) {
        return -1;
      }
      if ((HIDWORD(v8) & 0xFFFFFF00) > (v8 & 0xFFFFFF00)) {
        return 1;
      }
      unsigned int v7 = (BYTE4(v8) - 1);
      if (v7 < (v8 - 1)) {
        return -1;
      }
      return v7 > (v8 - 1);
    }
  }
  return result;
}

uint64_t sub_22690548C(BOOL a1)
{
  if (a1 && !sub_2269054C8(a1) && (byte_26814836C & 1) == 0) {
    byte_26814836C = 1;
  }
  return 1;
}

BOOL sub_2269054C8(BOOL result)
{
  if (result)
  {
    BOOL v1 = result;
    uint64_t v2 = sub_22685D6E8(1937326416);
    uint64_t v3 = sub_22685D8E8(v2, (const char *)v1);
    return objc_msgSend_length(v3, v4, v5) != 0;
  }
  return result;
}

uint64_t sub_226905510()
{
  if ((byte_26814836C & 1) == 0) {
    byte_26814836C = 1;
  }
  return 0;
}

uint64_t sub_22690552C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (dword_268148160 <= 800 && (dword_268148160 != -1 || sub_226865630((uint64_t)&dword_268148160, 0x320u))) {
    sub_226865EB4((uint64_t)&dword_268148160, (uint64_t)"ACPAppleProductID AUDataCache_GetProductIDFromImageName(CFStringRef)", 800, (uint64_t)"%@\n", a5, a6, a7, a8, (uint64_t)a1);
  }
  if (!a1) {
    return 0;
  }
  uint64_t v9 = objc_msgSend_componentsSeparatedByString_(a1, a2, @"-");
  uint64_t v11 = objc_msgSend_objectAtIndex_(v9, v10, 0);
  if (objc_msgSend_integerValue(v11, v12, v13) < 1) {
    return 0;
  }
  double v15 = objc_msgSend_objectAtIndex_(v9, v14, 0);
  return objc_msgSend_integerValue(v15, v16, v17);
}

void sub_226905D48(uint64_t a1)
{
  uint64_t v2 = sub_2268AEA38(*(void *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = sub_2268DF7FC(v2, 300);
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void **)(a1 + 32);
    objc_msgSend_endSetup_(v6, v4, v5);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_226905E18;
    block[3] = &unk_2647B8428;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t sub_226905E18(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_defaultCenter(MEMORY[0x263F08A00], a2, a3);
  objc_msgSend_addObserver_selector_name_object_(v4, v5, *(void *)(a1 + 32), sel_linkChangeNotification_, @"com.apple.AirPort.WiFiShim.Notification.LinkChange", 0);
  uint64_t v8 = objc_msgSend_joinTargetSWAP(*(void **)(a1 + 32), v6, v7);
  uint64_t v10 = *(uint64_t **)(a1 + 32);
  if (v8)
  {
    uint64_t v11 = v8;
    uint64_t v12 = *(void **)(a1 + 32);
    return objc_msgSend_endSetup_(v12, v9, v11);
  }
  else
  {
    uint64_t v14 = objc_msgSend_dictionaryWithObject_forKey_(NSDictionary, v9, v10[26], @"BSAssistantProgressKey_StringParameter");
    objc_msgSend_sendProgressToUI_withParamDict_(v10, v15, 5, v14);
    objc_msgSend_performSelectorInBackground_withObject_(*(void **)(a1 + 32), v16, (uint64_t)sel_startEasyConfigWhenReady, 0);
    uint64_t v18 = *(void **)(a1 + 32);
    return objc_msgSend_sendProgressToUI_withParamDict_(v18, v17, 26, 0);
  }
}

uint64_t sub_2269074C0(uint64_t a1, int a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  _OWORD v3[2] = sub_226907544;
  v3[3] = &unk_2647BABD0;
  v3[4] = *(void *)(a1 + 32);
  char v4 = BYTE2(a2) & 1;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  return 0;
}

uint64_t sub_226907544(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_askUserForSetupCodeWithRetryStatus_, *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_226907850(uint64_t a1, const char *a2)
{
  return objc_msgSend_sendProgressToUI_withParamDict_(*(void **)(a1 + 32), a2, 26, 0);
}

uint64_t sub_226907860(uint64_t a1, const char *a2)
{
  return objc_msgSend_endSetup_(*(void **)(a1 + 32), a2, 4294960574);
}

void sub_22690845C(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x22A65B6F0](a2) == MEMORY[0x263EF8720])
  {
    if (dword_2681481A0 <= 800 && (dword_2681481A0 != -1 || sub_226865630((uint64_t)&dword_2681481A0, 0x320u))) {
      sub_226865EB4((uint64_t)&dword_2681481A0, (uint64_t)"void _xpc_airportassistant_handle_message(xpc_object_t)", 800, (uint64_t)"ERROR XPC - message:%@\n", v3, v4, v5, v6, a2);
    }
    xpc_connection_cancel((xpc_connection_t)qword_268148370);
    xpc_release((xpc_object_t)qword_268148370);
    qword_268148370 = 0;
  }
}

void sub_22690A768(uint64_t a1, const char *a2, uint64_t a3)
{
  v20[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263F27B28];
  uint64_t v4 = objc_msgSend_bagSubProfile(MEMORY[0x263F27D18], a2, a3);
  uint64_t v7 = objc_msgSend_bagSubProfileVersion(MEMORY[0x263F27D18], v5, v6);
  uint64_t v9 = objc_msgSend_bagForProfile_profileVersion_(v3, v8, v4, v7);
  id v10 = objc_alloc(MEMORY[0x263F27D18]);
  uint64_t v12 = objc_msgSend_initWithType_clientIdentifier_clientVersion_bag_(v10, v11, 0, @"com.apple.preferences", @"1", v9);
  v20[0] = @"com.apple.airport.mobileairportutility";
  uint64_t v14 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v13, (uint64_t)v20, 1);
  objc_msgSend_setBundleIdentifiers_(v12, v15, v14);
  uint64_t v18 = objc_msgSend_perform(v12, v16, v17);
  objc_msgSend_addFinishBlock_(v18, v19, (uint64_t)&unk_26DA6B6E8);
}

uint64_t sub_22690A860(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_responseDataItems(a2, (const char *)a2, a3);
  if (a3 || (double v15 = v4, !objc_msgSend_count(v4, v5, v6)))
  {
    uint64_t v7 = objc_msgSend_currentLocale(MEMORY[0x263EFF960], v5, v6);
    uint64_t v9 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x263EFF4D0]);
    if (objc_msgSend_isEqualToString_(v9, v10, @"JP")) {
      uint64_t result = objc_msgSend_URLWithString_(NSURL, v11, @"itms-apps://iTunes.com/AirMacUtility-iOS");
    }
    else {
      uint64_t result = objc_msgSend_URLWithString_(NSURL, v11, @"itms-apps://iTunes.com/AirPortUtility-iOS");
    }
  }
  else
  {
    int v16 = NSURL;
    uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v15, v5, 0);
    uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v17, v18, @"attributes");
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v19, v20, @"url");
    uint64_t result = objc_msgSend_URLWithString_(v16, v22, v21);
  }
  uint64_t v23 = result;
  if (result)
  {
    double v24 = objc_msgSend_defaultWorkspace(MEMORY[0x263F01880], v13, v14);
    return objc_msgSend_openSensitiveURL_withOptions_(v24, v25, v23, 0);
  }
  return result;
}

BOOL sub_22690A958(const __CFDictionary *a1)
{
  BOOL result = 0;
  if (a1)
  {
    CFStringRef Value = (void *)CFDictionaryGetValue(a1, (const void *)*MEMORY[0x263F3B0B8]);
    if (Value)
    {
      if (objc_msgSend_count(Value, v2, v3)) {
        return 1;
      }
    }
  }
  return result;
}

CFDictionaryRef sub_22690A998(const __CFDictionary *result)
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  if (result)
  {
    CFDictionaryRef v1 = result;
    uint64_t v2 = (const void *)*MEMORY[0x263F3B0B8];
    BOOL result = (const __CFDictionary *)CFDictionaryGetValue(result, (const void *)*MEMORY[0x263F3B0B8]);
    if (result)
    {
      BOOL result = (const __CFDictionary *)objc_msgSend_count(result, v3, v4);
      if (result)
      {
        CFStringRef Value = (void *)CFDictionaryGetValue(v1, v2);
        long long v64 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0A0]);
        long long v65 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0D0]);
        long long v66 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0C0]);
        uint64_t v67 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0C8]);
        uint64_t v68 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0A8]);
        uint64_t v69 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0B0]);
        uint64_t v70 = (void *)CFDictionaryGetValue(v1, (const void *)*MEMORY[0x263F3B0F8]);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(Value, v6, (uint64_t)&v71, v75, 16);
        if (v7)
        {
          uint64_t v10 = v7;
          uint64_t v11 = *(void *)v72;
          uint64_t v12 = &stru_26DA6BE88;
          uint64_t v13 = 1;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v72 != v11) {
                objc_enumerationMutation(Value);
              }
              double v15 = objc_msgSend_stringWithFormat_(NSString, v8, @"&id%d=%@", v13 + i, *(void *)(*((void *)&v71 + 1) + 8 * i));
              uint64_t v18 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v16, v17);
              uint64_t v20 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v15, v19, v18);
              uint64_t v12 = (__CFString *)objc_msgSend_stringByAppendingString_(v12, v21, v20);
            }
            uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(Value, v8, (uint64_t)&v71, v75, 16);
            uint64_t v13 = (v13 + i);
          }
          while (v10);
        }
        else
        {
          uint64_t v12 = &stru_26DA6BE88;
        }
        unsigned int v22 = NSString;
        uint64_t v23 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v8, v9);
        uint64_t v25 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v64, v24, v23);
        uint64_t v28 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v26, v27);
        uint64_t v30 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v65, v29, v28);
        uint64_t v33 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v31, v32);
        uint64_t v35 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v66, v34, v33);
        uint64_t v38 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v36, v37);
        uint64_t v40 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v67, v39, v38);
        uint64_t v43 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v41, v42);
        uint64_t v45 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v68, v44, v43);
        uint64_t v48 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v46, v47);
        uint64_t v50 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v69, v49, v48);
        uint64_t v53 = objc_msgSend_URLQueryAllowedCharacterSet(MEMORY[0x263F08708], v51, v52);
        uint64_t v55 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v70, v54, v53);
        uint64_t v57 = objc_msgSend_stringWithFormat_(v22, v56, @"itms-apps://?action=accessory-lookup%@&bid=%@&accessoryName=%@&manufacturer=%@&modelNumber=%@&firmwareVersion=%@&hardwareVersion=%@&serialNumber=%@", v12, v25, v30, v35, v40, v45, v50, v55);
        uint64_t v59 = objc_msgSend_URLWithString_(NSURL, v58, v57);
        CFStringRef v62 = objc_msgSend_defaultWorkspace(MEMORY[0x263F01880], v60, v61);
        return (const __CFDictionary *)objc_msgSend_openSensitiveURL_withOptions_(v62, v63, v59, 0);
      }
    }
  }
  return result;
}

OSStatus AudioServicesAddSystemSoundCompletion(SystemSoundID inSystemSoundID, CFRunLoopRef inRunLoop, CFStringRef inRunLoopMode, AudioServicesSystemSoundCompletionProc inCompletionRoutine, void *inClientData)
{
  return MEMORY[0x270EE21F8](*(void *)&inSystemSoundID, inRunLoop, inRunLoopMode, inCompletionRoutine, inClientData);
}

OSStatus AudioServicesCreateSystemSoundID(CFURLRef inFileURL, SystemSoundID *outSystemSoundID)
{
  return MEMORY[0x270EE2200](inFileURL, outSystemSoundID);
}

OSStatus AudioServicesDisposeSystemSoundID(SystemSoundID inSystemSoundID)
{
  return MEMORY[0x270EE2210](*(void *)&inSystemSoundID);
}

void AudioServicesPlayAlertSound(SystemSoundID inSystemSoundID)
{
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x270ED78C8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x270ED7940](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x270ED7950](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x270ED7A38](*(void *)&algorithm, password, passwordLen, salt, saltLen, *(void *)&prf, *(void *)&rounds, derivedKey);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AF0](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x270EE42A8]();
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x270EE43B0](alloc, str, attributes);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

Boolean CFCalendarComposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime *at, const char *componentDesc, ...)
{
  return MEMORY[0x270EE46B8](calendar, at, componentDesc);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x270EE46C8](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, void);
  return MEMORY[0x270EE46D0](calendar, v3, at);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x270EE4858](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  MEMORY[0x270EE48C8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x270EE4A60]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x270EE4BD8](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x270EE4C78](number);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D20](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x270EE4D58](plist, format);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextClosePath(CGContextRef c)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
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

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CFTypeID CGFontGetTypeID(void)
{
  return MEMORY[0x270EE64A8]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x270EE6690](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
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

void CGPathRelease(CGPathRef path)
{
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x270EE7150]((__n128)point, *(__n128 *)&point.y);
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

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x270EE7270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x270EE9AF0](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x270EE9AF8](name, matrix, size);
}

CFTypeID CTFontGetTypeID(void)
{
  return MEMORY[0x270EE9C70]();
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x270EE9D68](line, *(void *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x270EE9D70](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  MEMORY[0x270EE9E00](line, ascent, descent, leading);
  return result;
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x270ED7BB0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return MEMORY[0x270ED7BB8](fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x270ED7BC0](sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x270ED7BD0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, *(void *)&protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x270ED7BD8](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x270ED7BE0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

DNSServiceErrorType DNSServiceReconfirmRecord(DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, uint16_t rdlen, const void *rdata)
{
  return MEMORY[0x270ED7BE8](*(void *)&flags, *(void *)&interfaceIndex, fullname, rrtype, rrclass, rdlen, rdata);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x270ED7C18](service, queue);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

Boolean SCDynamicStoreAddTemporaryValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x270F054C8](store, key, value);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05500](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x270F05508](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270F05510](allocator, store, order);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return (CFStringRef)MEMORY[0x270F05520](allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05538](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x270F05540](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x270F05558](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x270F05560](store, keys, patterns);
}

int SCError(void)
{
  return MEMORY[0x270F05570]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x270F05578](*(void *)&status);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055A8](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x270F055F0](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x270F05620](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x270F05630](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x270F05638](target, queue);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return (SCNetworkInterfaceRef)MEMORY[0x270F05668](service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return (CFStringRef)MEMORY[0x270F05670](service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return (SCNetworkSetRef)MEMORY[0x270F05698](prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return (CFArrayRef)MEMORY[0x270F056A0](set);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return (SCPreferencesRef)MEMORY[0x270F05700](allocator, name, prefsID, authorization);
}

uint64_t SRP6a_client_method()
{
  return MEMORY[0x270F0E8B8]();
}

uint64_t SRP_compute_key()
{
  return MEMORY[0x270F0E8C8]();
}

uint64_t SRP_free()
{
  return MEMORY[0x270F0E8D0]();
}

uint64_t SRP_gen_pub()
{
  return MEMORY[0x270F0E8D8]();
}

uint64_t SRP_new()
{
  return MEMORY[0x270F0E8E0]();
}

uint64_t SRP_respond()
{
  return MEMORY[0x270F0E8E8]();
}

uint64_t SRP_set_auth_password()
{
  return MEMORY[0x270F0E8F0]();
}

uint64_t SRP_set_params()
{
  return MEMORY[0x270F0E8F8]();
}

uint64_t SRP_set_username()
{
  return MEMORY[0x270F0E900]();
}

uint64_t SRP_verify()
{
  return MEMORY[0x270F0E908]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

void TXTRecordCreate(TXTRecordRef *txtRecord, uint16_t bufferLen, void *buffer)
{
}

void TXTRecordDeallocate(TXTRecordRef *txtRecord)
{
}

const void *__cdecl TXTRecordGetBytesPtr(const TXTRecordRef *txtRecord)
{
  return (const void *)MEMORY[0x270ED7CA8](txtRecord);
}

uint16_t TXTRecordGetCount(uint16_t txtLen, const void *txtRecord)
{
  return MEMORY[0x270ED7CB0](txtLen, txtRecord);
}

DNSServiceErrorType TXTRecordGetItemAtIndex(uint16_t txtLen, const void *txtRecord, uint16_t itemIndex, uint16_t keyBufLen, char *key, uint8_t *valueLen, const void **value)
{
  return MEMORY[0x270ED7CB8](txtLen, txtRecord, itemIndex, keyBufLen, key, valueLen, value);
}

uint16_t TXTRecordGetLength(const TXTRecordRef *txtRecord)
{
  return MEMORY[0x270ED7CC0](txtRecord);
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x270ED7CC8](txtLen, txtRecord, key, valueLen);
}

DNSServiceErrorType TXTRecordSetValue(TXTRecordRef *txtRecord, const char *key, uint8_t valueSize, const void *value)
{
  return MEMORY[0x270ED7CD0](txtRecord, key, valueSize, value);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t WiFiDeviceClientAssociateAsync()
{
  return MEMORY[0x270F4B408]();
}

uint64_t WiFiDeviceClientAssociateCancel()
{
  return MEMORY[0x270F4B410]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x270F4B418]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x270F4B438]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x270F4B450]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x270F4B460]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x270F4B4A0]();
}

uint64_t WiFiDeviceClientScanCancel()
{
  return MEMORY[0x270F4B4A8]();
}

uint64_t WiFiManagerClientAddNetwork()
{
  return MEMORY[0x270F4B4C0]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x270F4B4C8]();
}

uint64_t WiFiManagerClientCopyNetworks()
{
  return MEMORY[0x270F4B4F0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x270F4B510]();
}

uint64_t WiFiManagerClientDisable()
{
  return MEMORY[0x270F4B520]();
}

uint64_t WiFiManagerClientEnable()
{
  return MEMORY[0x270F4B538]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x270F4B620]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x270F4B688]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x270F4B6A0]();
}

uint64_t WiFiNetworkCopyPassword()
{
  return MEMORY[0x270F4B6C8]();
}

uint64_t WiFiNetworkCopyRecord()
{
  return MEMORY[0x270F4B6D0]();
}

uint64_t WiFiNetworkCreate()
{
  return MEMORY[0x270F4B6D8]();
}

uint64_t WiFiNetworkGetAssociationDate()
{
  return MEMORY[0x270F4B708]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x270F4B780]();
}

uint64_t WiFiNetworkRemovePassword()
{
  return MEMORY[0x270F4B830]();
}

uint64_t WiFiNetworkRequiresPassword()
{
  return MEMORY[0x270F4B848]();
}

uint64_t WiFiNetworkSetAssociationDate()
{
  return MEMORY[0x270F4B858]();
}

uint64_t WiFiNetworkSetPassword()
{
  return MEMORY[0x270F4B860]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98500](this, __pos, __n1, __s);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

void std::terminate(void)
{
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_call_unexpected(void *a1)
{
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x270ED7EC8]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x270F9C680](dest, destLen, source, sourceLen, *(void *)&level);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8F58](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t cstr_free()
{
  return MEMORY[0x270F0E910]();
}

double difftime(time_t a1, time_t a2)
{
  MEMORY[0x270ED9180](a1, a2);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x270ED9910](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9CD0](*(void *)&a1, a2, a3);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x270ED9D90](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270ED9DD8](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x270ED9E70](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x270EDA588](a1);
}

long double modf(long double __x, long double *__y)
{
  MEMORY[0x270EDA5A8](__y, __x);
  return result;
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF68](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x270EDB1E8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int setvbuf(FILE *a1, char *a2, int a3, size_t a4)
{
  return MEMORY[0x270EDB458](a1, a2, *(void *)&a3, a4);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x270EDB590](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB5C8](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x270F9C770](dest, destLen, source, sourceLen);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x270EDBC38](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}