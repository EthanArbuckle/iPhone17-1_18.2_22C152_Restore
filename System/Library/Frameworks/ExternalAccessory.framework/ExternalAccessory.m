const void *__HandleForSource(const void *a1)
{
  CFDictionaryRef Mutable;
  const void *Value;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v12;

  pthread_mutex_lock(&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    v4 = CPSystemRootDirectory();
    switch((unint64_t)a1)
    {
      case 0uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"UIKit";
        v7 = @"UIKit.framework";
        goto LABEL_7;
      case 1uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"MobileCoreServices";
        v7 = @"MobileCoreServices.framework";
LABEL_7:
        v8 = @"Frameworks";
        goto LABEL_14;
      case 2uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"SpringBoardServices";
        v7 = @"SpringBoardServices.framework";
        goto LABEL_13;
      case 3uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"FrontBoardServices";
        v7 = @"FrontBoardServices.framework";
        goto LABEL_13;
      case 4uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"CarKit";
        v7 = @"CarKit.framework";
        goto LABEL_13;
      case 5uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"VisualVoicemail";
        v7 = @"VisualVoicemail.framework";
        goto LABEL_13;
      case 6uLL:
        v5 = NSString;
        v6 = (void *)MEMORY[0x1E4F1C978];
        v12 = @"CoreAccessories";
        v7 = @"CoreAccessories.framework";
LABEL_13:
        v8 = @"PrivateFrameworks";
LABEL_14:
        v9 = objc_msgSend(v5, "pathWithComponents:", objc_msgSend(v6, "arrayWithObjects:", v4, @"System", @"Library", v8, v7, v12, 0));
        if (!v9) {
          goto LABEL_17;
        }
        v10 = dlopen((const char *)[v9 UTF8String], 1);
        if (!v10) {
          goto LABEL_17;
        }
        Value = v10;
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, a1, v10);
        break;
      default:
LABEL_17:
        NSLog(&cfstr_CouldNotLoadSo.isa, a1);
        Value = 0;
        break;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

Class EAWeakLinkClass(NSString *a1, const void *a2)
{
  Class result = (Class)__HandleForSource(a2);
  if (result)
  {
    return NSClassFromString(a1);
  }
  return result;
}

EAAccessoryManager *GetEAAccesoryManager()
{
  return +[EAAccessoryManager sharedAccessoryManager];
}

id __EAAuthDataGetterCB(uint64_t a1)
{
  NSLog(&cfstr_Externalaccess_70.isa, a1);
  id Accessory = __findAccessory(a1, [+[EAAccessoryManager sharedAccessoryManager] connectedAccessories]);
  if (Accessory)
  {
    id v3 = (id)[Accessory certData];
    return v3;
  }
  else
  {
    NSLog(&cfstr_Externalaccess_71.isa, a1, [+[EAAccessoryManager sharedAccessoryManager] connectedAccessories]);
    return 0;
  }
}

id __EAAuthSerialStringGetterCB(uint64_t a1)
{
  NSLog(&cfstr_Externalaccess_72.isa, a1);
  id Accessory = __findAccessory(a1, [+[EAAccessoryManager sharedAccessoryManager] connectedAccessories]);
  if (Accessory)
  {
    id v3 = Accessory;
    uint64_t v4 = objc_msgSend((id)objc_msgSend(Accessory, "certSerial"), "bytes");
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    if (objc_msgSend((id)objc_msgSend(v3, "certSerial"), "length"))
    {
      unint64_t v6 = 0;
      do
        objc_msgSend(v5, "appendFormat:", @"%02X", *(unsigned __int8 *)(v4 + v6++));
      while (v6 < objc_msgSend((id)objc_msgSend(v3, "certSerial"), "length"));
    }
    return v5;
  }
  else
  {
    NSLog(&cfstr_Externalaccess_73.isa, a1, [+[EAAccessoryManager sharedAccessoryManager] connectedAccessories]);
    return 0;
  }
}

void __convertIAPAccessoryToEAAccessory(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F6A580];
  uint64_t v5 = [a1 objectForKey:*MEMORY[0x1E4F6A580]];
  if (v5)
  {
    uint64_t v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    [a2 setName:v7];
  }
  uint64_t v8 = [v3 objectForKey:*MEMORY[0x1E4F6A570]];
  if (v8)
  {
    uint64_t v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v9;
    }
    [a2 setManufacturer:v10];
  }
  uint64_t v11 = [v3 objectForKey:*MEMORY[0x1E4F6A578]];
  if (v11)
  {
    uint64_t v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    [a2 setModelNumber:v13];
  }
  uint64_t v14 = [v3 objectForKey:*MEMORY[0x1E4F6A5E8]];
  if (v14)
  {
    uint64_t v15 = v14;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v16 = 0;
    }
    else {
      uint64_t v16 = v15;
    }
    [a2 setSerialNumber:v16];
  }
  uint64_t v17 = [v3 objectForKey:*MEMORY[0x1E4F6A548]];
  if (v17)
  {
    uint64_t v18 = v17;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v18;
    }
    [a2 setFirmwareRevisionActive:v19];
  }
  uint64_t v20 = [v3 objectForKey:*MEMORY[0x1E4F6A550]];
  if (v20)
  {
    uint64_t v21 = v20;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v21;
    }
    [a2 setFirmwareRevisionPending:v22];
  }
  uint64_t v23 = [v3 objectForKey:*MEMORY[0x1E4F6A558]];
  if (v23)
  {
    uint64_t v24 = v23;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v25 = 0;
    }
    else {
      uint64_t v25 = v24;
    }
    [a2 setHardwareRevision:v25];
  }
  uint64_t v26 = [v3 objectForKey:*MEMORY[0x1E4F6A540]];
  if (v26)
  {
    uint64_t v27 = v26;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = v27;
    }
    [a2 setDockType:v28];
  }
  uint64_t v29 = [v3 objectForKey:*MEMORY[0x1E4F6A568]];
  if (v29)
  {
    v30 = (void *)v29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || [v30 isEqualToString:&stru_1F1595068]) {
      v30 = 0;
    }
    [a2 setMacAddress:v30];
  }
  v31 = EAWeakLinkStringConstant("kACCExternalAccessoryPPIDKey", (const void *)6);
  if (v31)
  {
    uint64_t v32 = [v3 objectForKey:v31];
    if (v32)
    {
      v33 = (void *)v32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || [v33 isEqualToString:&stru_1F1595068]) {
        v33 = 0;
      }
      [a2 setPpid:v33];
    }
  }
  v34 = EAWeakLinkStringConstant("kACCExternalAccessoryRegionCodeKey", (const void *)6);
  if (v34)
  {
    uint64_t v35 = [v3 objectForKey:v34];
    if (v35)
    {
      v36 = (void *)v35;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || [v36 isEqualToString:&stru_1F1595068]) {
        v36 = 0;
      }
      [a2 setRegionCode:v36];
    }
  }
  v37 = EAWeakLinkStringConstant("kACCExternalAccessoryTransportType", (const void *)6);
  if (v37)
  {
    uint64_t v38 = [v3 objectForKey:v37];
    if (v38)
    {
      v39 = (void *)v38;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a2, "setTransportType:", objc_msgSend(v39, "unsignedIntegerValue"));
      }
    }
  }
  objc_msgSend(a2, "setProtocolDetails:", objc_msgSend(v3, "objectForKey:", @"ACCExternalAccessoryProtocolDetailsKey"));
  uint64_t v40 = *MEMORY[0x1E4F6A610];
  if ([v3 objectForKey:*MEMORY[0x1E4F6A610]]) {
    objc_msgSend(a2, "setConnectionID:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v40), "unsignedIntValue"));
  }
  uint64_t v41 = *MEMORY[0x1E4F6A5E0];
  if ([v3 objectForKey:*MEMORY[0x1E4F6A5E0]]) {
    objc_msgSend(a2, "setProtocols:", objc_msgSend(v3, "objectForKey:", v41));
  }
  uint64_t v42 = *MEMORY[0x1E4F6A5D8];
  if ([v3 objectForKey:*MEMORY[0x1E4F6A5D8]]) {
    objc_msgSend(a2, "setPreferredApp:", objc_msgSend(v3, "objectForKey:", v42));
  }
  if ([v3 objectForKey:@"IAPAppAccessoryCertSerialNumberKey"]) {
    objc_msgSend(a2, "setCertSerial:", objc_msgSend(v3, "objectForKey:", @"IAPAppAccessoryCertSerialNumberKey"));
  }
  if ([v3 objectForKey:@"IAPAppAccessoryCertDataKey"]) {
    objc_msgSend(a2, "setCertData:", objc_msgSend(v3, "objectForKey:", @"IAPAppAccessoryCertDataKey"));
  }
  uint64_t v43 = *MEMORY[0x1E4F6A518];
  if ([v3 objectForKey:*MEMORY[0x1E4F6A518]]) {
    uint64_t v44 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v43), "intValue");
  }
  else {
    uint64_t v44 = 0;
  }
  [a2 setClassType:v44];
  if ([v3 objectForKey:@"EAAccessorySpeakerMenuEQNamesKey"]
    && [v3 objectForKey:@"EAAccessorySpeakerMenuEQIndexKey"])
  {
    objc_msgSend(a2, "setEqNames:", objc_msgSend(v3, "objectForKey:", @"EAAccessorySpeakerMenuEQNamesKey"));
    objc_msgSend(a2, "setEqIndex:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", @"EAAccessorySpeakerMenuEQIndexKey"), "unsignedIntValue"));
  }
  objc_msgSend(a2, "setCapabilities:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E4F6A510]), "intValue"));
  objc_msgSend(a2, "setLocationSentenceTypesMask:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E4F6A560]), "unsignedIntValue"));
  objc_msgSend(a2, "setVehicleInfoSupportedTypes:", objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E4F6A608]));
  uint64_t v45 = *MEMORY[0x1E4F6A600];
  uint64_t v46 = [v3 objectForKey:*MEMORY[0x1E4F6A600]];
  uint64_t v47 = [v3 objectForKey:v4];
  uint64_t v48 = [v3 objectForKey:v40];
  uint64_t v49 = [v3 objectForKey:v37];
  if (v46)
  {
    NSLog(&cfstr_Vehicleinfosta_4.isa, v47, v48, v49, v46);
    objc_msgSend(a2, "setVehicleInfoInitialData:", objc_msgSend(v3, "objectForKey:", v45));
  }
  else
  {
    NSLog(&cfstr_Vehicleinfosta_5.isa, v47, v48, v49);
  }
  objc_msgSend(a2, "setCameraComponents:", objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E4F6A508]));
  uint64_t v50 = *MEMORY[0x1E4F6A5D0];
  if ([v3 objectForKey:*MEMORY[0x1E4F6A5D0]])
  {
    v68 = v3;
    v69 = a2;
    v51 = (void *)[v3 objectForKey:v50];
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = v51;
    uint64_t v72 = [v51 countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v72)
    {
      uint64_t v70 = *(void *)v87;
      do
      {
        uint64_t v52 = 0;
        do
        {
          if (*(void *)v87 != v70) {
            objc_enumerationMutation(obj);
          }
          uint64_t v74 = *(void *)(*((void *)&v86 + 1) + 8 * v52);
          uint64_t v75 = v52;
          v53 = objc_msgSend(obj, "objectForKey:");
          id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          long long v82 = 0u;
          long long v83 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          uint64_t v54 = [v53 countByEnumeratingWithState:&v82 objects:v91 count:16];
          if (v54)
          {
            uint64_t v55 = v54;
            uint64_t v76 = *(void *)v83;
            do
            {
              for (uint64_t i = 0; i != v55; ++i)
              {
                if (*(void *)v83 != v76) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v57 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                v58 = (void *)[v53 objectForKey:v57];
                id v59 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                long long v78 = 0u;
                long long v79 = 0u;
                long long v80 = 0u;
                long long v81 = 0u;
                uint64_t v60 = [v58 countByEnumeratingWithState:&v78 objects:v90 count:16];
                if (v60)
                {
                  uint64_t v61 = v60;
                  uint64_t v62 = *(void *)v79;
                  do
                  {
                    for (uint64_t j = 0; j != v61; ++j)
                    {
                      if (*(void *)v79 != v62) {
                        objc_enumerationMutation(v58);
                      }
                      objc_msgSend(v59, "setObject:forKey:", objc_msgSend(v58, "objectForKey:", *(void *)(*((void *)&v78 + 1) + 8 * j)), *(void *)(*((void *)&v78 + 1) + 8 * j));
                    }
                    uint64_t v61 = [v58 countByEnumeratingWithState:&v78 objects:v90 count:16];
                  }
                  while (v61);
                }
                [v77 setObject:v59 forKey:v57];
              }
              uint64_t v55 = [v53 countByEnumeratingWithState:&v82 objects:v91 count:16];
            }
            while (v55);
          }
          [v71 setObject:v77 forKey:v74];

          uint64_t v52 = v75 + 1;
        }
        while (v75 + 1 != v72);
        uint64_t v72 = [obj countByEnumeratingWithState:&v86 objects:v92 count:16];
      }
      while (v72);
    }
    a2 = v69;
    [v69 setAudioPorts:v71];

    id v3 = v68;
  }
  uint64_t v64 = *MEMORY[0x1E4F6A5A8];
  if ([v3 objectForKey:*MEMORY[0x1E4F6A5A8]]) {
    uint64_t v65 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v64), "BOOLValue");
  }
  else {
    uint64_t v65 = 0;
  }
  [a2 setPointOfInterestHandoffEnabled:v65];
  v66 = EAWeakLinkStringConstant("kACCExternalAccessoryPrimaryUUID", (const void *)6);
  if (v66)
  {
    v67 = v66;
    if ([v3 objectForKey:v66])
    {
      objc_msgSend(a2, "setCoreAccessoryPrimaryUUID:", objc_msgSend(v3, "objectForKey:", v67));
      NSLog(&cfstr_Externalaccess_74.isa, [a2 coreAccessoryPrimaryUUID]);
      [a2 setCreatedByCoreAccessories:1];
    }
    else
    {
      NSLog(&cfstr_Externalaccess_76.isa);
    }
  }
  else
  {
    NSLog(&cfstr_Externalaccess_75.isa);
  }
}

id __findAccessoryByUUID(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(id)__accessoryListLock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        if (a1)
        {
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "coreAccessoriesPrimaryUUID"), "isEqualToString:", a1))
          {
            id v9 = v8;
            if (+[EAAccessoryManager isLoggingEnabled]) {
              NSLog(&cfstr_Externalaccess_77.isa, v9, a1);
            }
            goto LABEL_13;
          }
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_13:
  if (+[EAAccessoryManager isLoggingEnabled]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    NSLog(&cfstr_Externalaccess_78.isa, a1);
  }
  [(id)__accessoryListLock unlock];
  return v9;
}

void __notificationCleanup(const void *a1)
{
  if ((const void *)_BTPickerUnsupportedNotificationRef == a1)
  {
    CFRelease(a1);
    _BTPickerUnsupportedNotificationRef = 0;
  }
}

id __findAccessory(unsigned int a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(id)__accessoryListLock lock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(a2);
        }
        if (a1)
        {
          uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v8 connectionID] == a1)
          {
            id v9 = v8;
            if (+[EAAccessoryManager isLoggingEnabled]) {
              NSLog(&cfstr_Externalaccess_79.isa, v9, a1);
            }
            goto LABEL_13;
          }
        }
      }
      uint64_t v5 = [a2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_13:
  if (+[EAAccessoryManager isLoggingEnabled]) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    NSLog(&cfstr_Externalaccess_80.isa, a1);
  }
  [(id)__accessoryListLock unlock];
  return v9;
}

void sub_1BBEC2168(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __outputSocketCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return [a5 _streamWriteable];
}

void sub_1BBEC6A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBEC7988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t getBTDevicePickerClass()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  uint64_t v6 = __Block_byref_object_copy__0;
  uint64_t v7 = __Block_byref_object_dispose__0;
  uint64_t v0 = getBTDevicePickerClass_softClass;
  uint64_t v8 = getBTDevicePickerClass_softClass;
  if (!getBTDevicePickerClass_softClass)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __getBTDevicePickerClass_block_invoke;
    v2[3] = &unk_1E6294458;
    v2[4] = &v3;
    __getBTDevicePickerClass_block_invoke((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1BBEC9CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

Class __getBTDevicePickerClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!CoreBluetoothUILibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __CoreBluetoothUILibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E6294478;
    uint64_t v5 = 0;
    CoreBluetoothUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreBluetoothUILibraryCore_frameworkLibrary) {
    __getBTDevicePickerClass_block_invoke_cold_1(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("BTDevicePicker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getBTDevicePickerClass_block_invoke_cold_2();
  }
  getBTDevicePickerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t __CoreBluetoothUILibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreBluetoothUILibraryCore_frameworkLibrary = result;
  return result;
}

void *EAUIApplicationDidEnterBackgroundNotification()
{
  uint64_t v0 = (void *)uikitFramework_0;
  if (uikitFramework_0)
  {
    uint64_t v0 = dlsym((void *)uikitFramework_0, "UIApplicationDidEnterBackgroundNotification");
    if (v0)
    {
      uint64_t v0 = [NSString stringWithString:*v0];
    }
  }

  return v0;
}

void *EAWeakLinkSymbol(const char *a1, const void *a2)
{
  uint64_t result = (void *)__HandleForSource(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

void *EAWeakLinkStringConstant(const char *a1, const void *a2)
{
  uint64_t result = (void *)__HandleForSource(a2);
  if (result)
  {
    uint64_t result = dlsym(result, a1);
    if (result) {
      return *(void **)result;
    }
  }
  return result;
}

void __getBTDevicePickerClass_block_invoke_cold_1(void *a1)
{
  v2 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *CoreBluetoothUILibrary(void)"), @"EABluetoothAccessoryPicker.m", 20, @"%s", *a1);
  __break(1u);
}

void __getBTDevicePickerClass_block_invoke_cold_2()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getBTDevicePickerClass(void)_block_invoke"), @"EABluetoothAccessoryPicker.m", 22, @"Unable to find class %s", "BTDevicePicker");
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1F40D80B8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8140](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8290](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1F40D8298](allocator, *(void *)&sock, callBackTypes, callout, context);
}

void CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
}

CFOptionFlags CFSocketGetSocketFlags(CFSocketRef s)
{
  return MEMORY[0x1F40D82B8](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFSocketSetSocketFlags(CFSocketRef s, CFOptionFlags flags)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1F40D8A20](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1F40D8A40](allocator, userNotification, callout, order);
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1F4109900]();
}

uint64_t IAP2DHasLaunched()
{
  return MEMORY[0x1F4122A68]();
}

uint64_t IAPAppCloseSessionToAccessory()
{
  return MEMORY[0x1F4122A80]();
}

uint64_t IAPAppConnectedAccessories()
{
  return MEMORY[0x1F4122A88]();
}

uint64_t IAPAppCreateSessionForAccessory()
{
  return MEMORY[0x1F4122A90]();
}

uint64_t IAPAppOpenSessionFromAccessoryToApp()
{
  return MEMORY[0x1F4122A98]();
}

uint64_t IAPAppOpenSessionFromAppToAccessory()
{
  return MEMORY[0x1F4122AA0]();
}

uint64_t IAPAppRegisterClient()
{
  return MEMORY[0x1F4122AA8]();
}

uint64_t IAPAppToAppSocketPath()
{
  return MEMORY[0x1F4122AE0]();
}

uint64_t IAPCameraSendCameraControlMessage()
{
  return MEMORY[0x1F4122AF0]();
}

uint64_t IAPDHasLaunched()
{
  return MEMORY[0x1F4122B10]();
}

uint64_t IAPLocationActivate()
{
  return MEMORY[0x1F4122B18]();
}

uint64_t IAPLocationCopyEphemerisURL()
{
  return MEMORY[0x1F4122B20]();
}

uint64_t IAPLocationCopyNMEAData()
{
  return MEMORY[0x1F4122B28]();
}

uint64_t IAPLocationDeactivate()
{
  return MEMORY[0x1F4122B30]();
}

uint64_t IAPLocationGetEphemerisMaxInterval()
{
  return MEMORY[0x1F4122B38]();
}

uint64_t IAPLocationGetEphemerisRecommendedRefreshInterval()
{
  return MEMORY[0x1F4122B40]();
}

uint64_t IAPLocationIsNMEADataAvailable()
{
  return MEMORY[0x1F4122B48]();
}

uint64_t IAPLocationSendEphemeris()
{
  return MEMORY[0x1F4122B50]();
}

uint64_t IAPLocationSendEphemerisPointData()
{
  return MEMORY[0x1F4122B58]();
}

uint64_t IAPLocationSendGPSTime()
{
  return MEMORY[0x1F4122B60]();
}

uint64_t IAPRegisterEAAuthGetters()
{
  return MEMORY[0x1F4122B68]();
}

uint64_t IAPlocationSendGPRMCDataStatusValues()
{
  return MEMORY[0x1F4122B88]();
}

uint64_t IAPlocationSetAccessoryNMEAFilter()
{
  return MEMORY[0x1F4122B90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t RetainConnectionToIAPDaemonByCheckingConnectionID()
{
  return MEMORY[0x1F4122B98]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1F40F7138](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1F40F7160](allocator);
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

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1F40D8DB8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1F40C9C98](a1, a2, *(void *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
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

int dlclose(void *__handle)
{
  return MEMORY[0x1F40CBDA8](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1F40CC690](*(void *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDF30](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1F40CDFC0](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1F40CE030](*(void *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

void xpc_release(xpc_object_t object)
{
}