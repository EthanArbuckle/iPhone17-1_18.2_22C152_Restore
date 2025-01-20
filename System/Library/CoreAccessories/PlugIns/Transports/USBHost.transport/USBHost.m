uint64_t usbUtil_getInterfaceAndNameString(io_service_t a1, const __CFUUID *a2, io_service_t a3, const __CFUUID *a4, void *a5)
{
  CFUUIDRef v10;
  CFUUIDRef v11;
  kern_return_t v12;
  uint64_t v13;
  IOCFPlugInInterface **v14;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDBytes v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  CFUUIDRef v28;
  CFUUIDRef v29;
  IOCFPlugInInterface **v30;
  HRESULT (__cdecl *v31)(void *, REFIID, LPVOID *);
  CFUUIDBytes v32;
  int v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _WORD v89[2];
  int v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  IOCFPlugInInterface **v94;
  unsigned __int8 v95;
  uint64_t v96;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint8_t v99[4];
  const char *v100;
  __int16 v101;
  int v102;
  __int16 v103;
  io_service_t v104;
  __int16 v105;
  unsigned char v106[14];
  __int16 v107;
  int v108;
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;
  __int16 v113;
  int v114;
  uint8_t buf[32];
  long long v116;
  long long v117;
  long long v118;
  long long v119;
  long long v120;
  long long v121;
  long long v122;
  long long v123;
  long long v124;
  long long v125;
  long long v126;
  long long v127;
  long long v128;
  long long v129;
  uint64_t v130;

  v130 = *MEMORY[0x263EF8340];
  theInterface = 0;
  theScore = 0;
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "usbUtil_getInterfaceAndNameString";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a1;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = a5 != 0;
    _os_log_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: interface %d, device %d, out provided %d", buf, 0x1Eu);
  }
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v12 = IOCreatePlugInInterfaceForService(a1, v10, v11, &theInterface, &theScore);
  v13 = 0;
  if (!v12)
  {
    v14 = theInterface;
    if (theInterface)
    {
      v96 = 0;
      QueryInterface = (*theInterface)->QueryInterface;
      v16 = CFUUIDGetUUIDBytes(a2);
      v17 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v14, *(void *)&v16.byte0, *(void *)&v16.byte8, &v96);
      if (((unsigned int (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface))
      {
        v18 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (v18) {
          usbUtil_getInterfaceAndNameString_cold_7(v18, v19, v20, v21, v22, v23, v24, v25);
        }
      }
      if (v17) {
        v26 = 1;
      }
      else {
        v26 = v96 == 0;
      }
      if (v26) {
        return 0;
      }
      v95 = 0;
      v93 = 0;
      v94 = 0;
      v28 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      v29 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      if (IOCreatePlugInInterfaceForService(a3, v28, v29, &v94, &theScore)) {
        return 0;
      }
      v30 = v94;
      if (!v94) {
        return 0;
      }
      v31 = (*v94)->QueryInterface;
      v32 = CFUUIDGetUUIDBytes(a4);
      v33 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))v31)(v30, *(void *)&v32.byte0, *(void *)&v32.byte8, &v93);
      if (((unsigned int (*)(IOCFPlugInInterface **))(*v94)->Release)(v94)
        && (v34 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)))
      {
        usbUtil_getInterfaceAndNameString_cold_3(v34, v35, v36, v37, v38, v39, v40, v41);
        if (v33) {
          return 0;
        }
      }
      else if (v33)
      {
        return 0;
      }
      if (v93)
      {
        if ((*(unsigned int (**)(uint64_t))(*(void *)v96 + 64))(v96))
        {
          v42 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (v42) {
            usbUtil_getInterfaceAndNameString_cold_5(v42, v43, v44, v45, v46, v47, v48, v49);
          }
          v13 = 0;
LABEL_52:
          if ((*(unsigned int (**)(uint64_t))(*(void *)v96 + 24))(v96))
          {
            v81 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
            if (v81) {
              usbUtil_getInterfaceAndNameString_cold_1(v81, v82, v83, v84, v85, v86, v87, v88);
            }
          }
          return v13;
        }
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(*(void *)v93 + 344))(v93, &v95))
        {
          v13 = 0;
LABEL_49:
          if ((*(unsigned int (**)(uint64_t))(*(void *)v96 + 72))(v96))
          {
            v73 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
            if (v73) {
              usbUtil_getInterfaceAndNameString_cold_2(v73, v74, v75, v76, v77, v78, v79, v80);
            }
          }
          goto LABEL_52;
        }
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        memset(buf, 0, sizeof(buf));
        v89[0] = 1664;
        v89[1] = v95 | 0x300;
        v90 = 16778249;
        v91 = buf;
        v92 = 0;
        v13 = 0;
        if ((*(unsigned int (**)(uint64_t, _WORD *))(*(void *)v96 + 208))(v96, v89)) {
          goto LABEL_49;
        }
        v50 = v92;
        v51 = v91;
        if (v92 < 4)
        {
          LODWORD(v52) = v92;
        }
        else
        {
          v52 = (v92 - 2);
          if (v91[v52]) {
            goto LABEL_38;
          }
          v53 = (v92 - 1);
          if (v91[v53]) {
            goto LABEL_38;
          }
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            v54 = v51[v52];
            v55 = v51[v53];
            *(_DWORD *)v99 = 136317186;
            v100 = "usbUtil_getInterfaceAndNameString";
            v101 = 1024;
            v102 = 107;
            v103 = 1024;
            v104 = a3;
            v105 = 1024;
            *(_DWORD *)v106 = v95;
            *(_WORD *)&v106[4] = 2048;
            *(void *)&v106[6] = v51;
            v107 = 1024;
            v108 = v54;
            v109 = 1024;
            v110 = v55;
            v111 = 1024;
            v112 = v50;
            v113 = 1024;
            v114 = v50 - 2;
            _os_log_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d interface %d, stringIndex %d, pData[end] %p [%02x %02x], Adjust wLenDone %d -> %d", v99, 0x40u);
          }
        }
        if (v52 < 3) {
          goto LABEL_43;
        }
        v52 = (v52 - 2);
LABEL_38:
        v56 = [[NSString alloc] initWithBytes:v51 + 2 length:v52 encoding:2483028224];
        if (v56)
        {
          v13 = v56;
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v99 = 136315906;
            v100 = "usbUtil_getInterfaceAndNameString";
            v101 = 1024;
            v102 = a3;
            v103 = 1024;
            v104 = v95;
            v105 = 2112;
            *(void *)v106 = v13;
            _os_log_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: interface %d, stringIndex %d, name '%@'", v99, 0x22u);
          }
          if (a5)
          {
            *a5 = v93;
            goto LABEL_49;
          }
LABEL_46:
          if ((*(unsigned int (**)(uint64_t))(*(void *)v93 + 24))(v93))
          {
            v65 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
            if (v65) {
              usbUtil_getInterfaceAndNameString_cold_3(v65, v66, v67, v68, v69, v70, v71, v72);
            }
          }
          goto LABEL_49;
        }
LABEL_43:
        v57 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
        if (v57) {
          usbUtil_getInterfaceAndNameString_cold_4(v57, v58, v59, v60, v61, v62, v63, v64);
        }
        v13 = 0;
        goto LABEL_46;
      }
      return 0;
    }
  }
  return v13;
}

uint64_t usbUtil_findParentOfClass(io_object_t a1, const char *a2, const char *a3)
{
  kern_return_t ParentEntry;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  io_registry_entry_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
    usbUtil_findParentOfClass_cold_3();
  }
  parent = 0;
  IOObjectRetain(a1);
  if (a1)
  {
    while (1)
    {
      ParentEntry = IORegistryEntryGetParentEntry(a1, a3, &parent);
      IOObjectRelease(a1);
      if (ParentEntry) {
        break;
      }
      if (IOObjectConformsTo(parent, a2))
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
          usbUtil_findParentOfClass_cold_1();
        }
        goto LABEL_12;
      }
      a1 = parent;
      parent = 0;
      if (!a1) {
        goto LABEL_12;
      }
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG)) {
      usbUtil_findParentOfClass_cold_2((uint64_t)a2);
    }
  }
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v10 = "usbUtil_findParentOfClass";
    v11 = 1024;
    v12 = 194;
    v13 = 1024;
    v14 = parent;
    v15 = 2080;
    v16 = a2;
    v17 = 2080;
    v18 = a3;
    _os_log_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "%s:%d parent %d after Looking for match for %s in plane %s", buf, 0x2Cu);
  }
  return parent;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id acc_userNotifications_generateIdentifier(uint64_t a1, uint64_t a2)
{
  v3 = 0;
  if (a1 && a2)
  {
    v3 = [NSString stringWithFormat:@"%@_%@", a1, a2];
    uint64_t v2 = vars8;
  }
  return v3;
}

ACCUserNotification *acc_userNotifications_accessoryNotSupported()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:2];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Accessory Not Supported" value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  v3 = acc_strings_bundle();
  v4 = [v3 localizedStringForKey:@"This accessory is not supported by this device." value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setMessage:v4];

  [(ACCUserNotification *)v0 setIsModal:0];
  [(ACCUserNotification *)v0 setPresentViaSystemAperture:1];
  return v0;
}

ACCUserNotification *acc_userNotifications_chargingNotSupported()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:2];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Charging Not Supported" value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  v3 = acc_strings_bundle();
  v4 = [v3 localizedStringForKey:@"Charging with this accessory is not supported by Apple Device." value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setMessage:v4];

  v5 = acc_strings_bundle();
  v6 = [v5 localizedStringForKey:@"Dismiss" value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setDefaultButtonName:v6];

  [(ACCUserNotification *)v0 setIsModal:0];
  return v0;
}

ACCUserNotification *acc_userNotifications_unlockToUseAccessories()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:2];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Accessory Connected" value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  v3 = NSString;
  v4 = acc_strings_bundle();
  v5 = [v4 localizedStringForKey:@"Unlock %@ to use accessories" value:&stru_26D5972C8 table:0];
  v6 = objc_msgSend(v3, "stringWithFormat:", v5, systemInfo_copyDeviceClass());
  [(ACCUserNotification *)v0 setMessage:v6];

  [(ACCUserNotification *)v0 setIsModal:0];
  [(ACCUserNotification *)v0 setDismissOnUnlock:1];
  [(ACCUserNotification *)v0 setIgnoreQuietMode:1];
  [(ACCUserNotification *)v0 setSystemSoundID:&unk_26D59AE90];
  return v0;
}

ACCUserNotification *acc_userNotifications_disabledHSAID()
{
  v0 = objc_alloc_init(ACCUserNotification);
  [(ACCUserNotification *)v0 setType:1];
  v1 = acc_strings_bundle();
  uint64_t v2 = [v1 localizedStringForKey:@"Serial Boot-Arg Detected" value:&stru_26D5972C8 table:0];
  [(ACCUserNotification *)v0 setTitle:v2];

  v3 = acc_strings_bundle();
  v4 = [v3 localizedStringForKey:@"There are known compatibility issues with the 'serial' boot-arg and Smart Connector accessories, even for those not using HSAID. Please disable the 'serial' boot-arg when using Smart Connector accessories.", &stru_26D5972C8, 0 value table];
  [(ACCUserNotification *)v0 setMessage:v4];

  [(ACCUserNotification *)v0 setIsModal:0];
  return v0;
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaults];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setObject:a2 forKey:a1];
}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setInteger:a2 forKey:a1];
}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4 = +[ACCUserDefaults sharedDefaults];
  [v4 setDouble:a1 forKey:a2];
}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 stringForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 arrayForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 dictionaryForKey:a1];

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  uint64_t v3 = [v2 integerForKey:a1];

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsIapd];
  [v2 doubleForKey:a1];
  double v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  uint64_t v2 = +[ACCUserDefaults sharedDefaultsLogging];
  uint64_t v3 = [v2 BOOLForKey:a1];

  return v3;
}

void sub_222C76F34(_Unwind_Exception *exception_object)
{
}

id logObjectForModule()
{
  if (gLogObjects) {
    BOOL v0 = gNumLogObjects < 1;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    BOOL v1 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v1) {
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    id v10 = (id)MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)gLogObjects;
  }
  return v10;
}

void __AppleUSBHostBillboardDeviceAdded(void *a1, io_iterator_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "__AppleUSBHostBillboardDeviceAdded";
    __int16 v19 = 1024;
    int v20 = [v3 accessoryUSBBillboardDeviceVIDPID];
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "%s: listener(0x%X) = %@", buf, 0x1Cu);
  }

  uint64_t v7 = IOIteratorNext(a2);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v10 = gLogObjects;
      int v11 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v12 = gNumLogObjects < 1;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v18 = (const char *)v10;
          __int16 v19 = 1024;
          int v20 = v11;
          _os_log_error_impl(&dword_222C74000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v13 = v9;
        v14 = v9;
      }
      else
      {
        v14 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "__AppleUSBHostBillboardDeviceAdded";
        __int16 v19 = 1024;
        int v20 = v8;
        _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "%s: Connected BillboardDevice service with service %d", buf, 0x12u);
      }

      [v3 AppleUSBHostBillboardDeviceServiceArrived:v8];
      IOObjectRelease(v8);
      uint64_t v8 = IOIteratorNext(a2);
    }
    while (v8);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __AppleUSBHostBillboardDeviceAdded_cold_1(v3);
  }
}

void __AppleUSBHostBillboardDeviceTerminated(void *a1, io_iterator_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "__AppleUSBHostBillboardDeviceTerminated";
    __int16 v19 = 1024;
    int v20 = [v3 accessoryUSBBillboardDeviceVIDPID];
    __int16 v21 = 2112;
    id v22 = v3;
    _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "%s: listener(0x%X) = %@", buf, 0x1Cu);
  }

  uint64_t v7 = IOIteratorNext(a2);
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v10 = gLogObjects;
      int v11 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v12 = gNumLogObjects < 1;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v18 = (const char *)v10;
          __int16 v19 = 1024;
          int v20 = v11;
          _os_log_error_impl(&dword_222C74000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v13 = v9;
        v14 = v9;
      }
      else
      {
        v14 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "__AppleUSBHostBillboardDeviceTerminated";
        __int16 v19 = 1024;
        int v20 = v8;
        _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "%s: Terminated BillboardDevice service with service %d", buf, 0x12u);
      }

      [v3 AppleUSBHostBillboardDeviceServiceTerminated:v8];
      IOObjectRelease(v8);
      uint64_t v8 = IOIteratorNext(a2);
    }
    while (v8);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v15 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __AppleUSBHostBillboardDeviceTerminated_cold_1(v3);
  }
}

void sub_222C77628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C786B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C78B0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C78E58(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C79234(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C79628(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C79764(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_222C79828(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_222C79F4C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

uint64_t serviceAdded(void *a1, const char *a2)
{
  return [a1 serviceAdded:a2];
}

uint64_t serviceRemoved(void *a1, const char *a2)
{
  return [a1 serviceRemoved:a2];
}

void sub_222C7D8DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
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

void sub_222C7F174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

void sub_222C7F4AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t VIDPIDServiceAdded(void *a1, const char *a2)
{
  return [a1 VIDPIDServiceAdded:a2];
}

uint64_t VIDPIDServiceRemoved(void *a1, const char *a2)
{
  return [a1 VIDPIDServiceRemoved:a2];
}

void sub_222C80BF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
}

void sub_222C80EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222C8101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222C811A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222C8133C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222C816FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

unsigned char *OUTLINED_FUNCTION_6(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unint64_t systemInfo_getCurrentUnixTime()
{
  BOOL v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  BOOL v0 = [MEMORY[0x263EFF910] date];
  [v0 timeIntervalSince1970];
  double v2 = v1;

  unint64_t v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0) {
    return 0;
  }
  else {
    return v3;
  }
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_0);
  }
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1) {
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_3);
  }
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  BOOL v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    double v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, @"Beta") != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_11);
  }
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1) {
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_16);
  }
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  BOOL v0 = (void *)MGCopyAnswer();
  uint64_t v1 = [v0 isEqualToString:@"AudioAccessory"];

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  if (systemInfo_copyRegionCode_onceToken != -1) {
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_24);
  }
  if (systemInfo_copyRegionCode_regionCode)
  {
    CFTypeID v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID()) {
      return systemInfo_copyRegionCode_regionCode;
    }
  }
  uint64_t result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  uint64_t result = (const void *)MGCopyAnswer();
  if (result)
  {
    uint64_t v1 = result;
    CFTypeID v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID()) {
      return v1;
    }
    else {
      return 0;
    }
  }
  return result;
}

void init_logging_signposts()
{
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1) {
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
  }
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFTypeID v2 = &off_222C92000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        uint64_t v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_222C74000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          uint64_t v8 = "<Undefined>";
        }
      }
      uint64_t v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        uint64_t v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          uint64_t v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          __int16 v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_222C74000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    CFTypeID v2 = &off_222C92000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 50);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

uint64_t findPipe(uint64_t a1, unsigned int a2, int a3, int a4, unsigned __int8 *a5, _WORD *a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (!a2) {
    return 3758097084;
  }
  int v8 = 1;
  uint64_t v9 = MEMORY[0x263EF8438];
  unsigned __int8 v10 = 1;
  while (1)
  {
    __int16 v30 = 0;
    unsigned __int8 v29 = 0;
    __int16 v28 = 0;
    char v27 = 0;
    uint64_t v11 = (*(uint64_t (**)(uint64_t, void, char *, __int16 *, unsigned __int8 *, __int16 *, char *))(*(void *)a1 + 208))(a1, v10, (char *)&v30 + 1, &v30, &v29, &v28, &v27);
    if (v11)
    {
      uint64_t v12 = gLogObjects;
      int v13 = gNumLogObjects;
      if (gLogObjects) {
        BOOL v14 = gNumLogObjects < 1;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v32 = v12;
          *(_WORD *)&v32[8] = 1024;
          int v33 = v13;
          _os_log_error_impl(&dword_222C74000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v15 = v9;
        int v17 = v9;
      }
      else
      {
        int v17 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v32 = v11;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v8;
        _os_log_error_impl(&dword_222C74000, v17, OS_LOG_TYPE_ERROR, "GetPipeProperties failed with error: %08x for currentPipeRef: %d", buf, 0xEu);
      }

      goto LABEL_25;
    }
    if (HIBYTE(v30) == a3 && v29 == a4) {
      break;
    }
LABEL_25:
    int v8 = ++v10;
    if (v10 > a2) {
      return v11;
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v18 = *(id *)gLogObjects;
    int v20 = a5;
    __int16 v19 = a6;
  }
  else
  {
    int v20 = a5;
    __int16 v19 = a6;
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v18 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v32 = a3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = a4;
    _os_log_impl(&dword_222C74000, v18, OS_LOG_TYPE_INFO, "found USB pipe successfully for direction %d and type %d", buf, 0xEu);
  }

  if (v20) {
    *int v20 = v10;
  }
  if (v19) {
    *__int16 v19 = v28;
  }
  return 0;
}

void InterruptReadCompletion(void *a1, int a2, int a3)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = a1;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    int v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    int v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 67109888;
    int v30 = a2;
    __int16 v31 = 1024;
    int v32 = a3;
    __int16 v33 = 1024;
    int v34 = [v5 interruptBulkReadAllocCount];
    __int16 v35 = 1024;
    int v36 = [v5 interruptBulkReadReleaseCount];
    _os_log_debug_impl(&dword_222C74000, v8, OS_LOG_TYPE_DEBUG, "InterruptReadCompletion: result=%d numBytesRead=%u, counts %d : %d", (uint8_t *)&v29, 0x1Au);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      InterruptReadCompletion_cold_10();
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    uint64_t v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v11 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    InterruptReadCompletion_cold_8();
  }

  int v13 = [v5 hasReadInterruptPipe];
  if (!a2 && v13)
  {
    BOOL v14 = [[IAPDataBuffer alloc] initWithiAPInterface:v5];
    v15 = [v5 interruptBulkReadList];
    [v15 addObject:v14];

    objc_msgSend(v5, "setInterruptBulkReadAllocCount:", objc_msgSend(v5, "interruptBulkReadAllocCount") + 1);
    LODWORD(v15) = [v5 interruptBulkReadAllocCount];
    if (v15 - [v5 interruptBulkReadReleaseCount] >= 2)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v17 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = [v5 interruptBulkReadAllocCount];
        int v19 = [v5 interruptBulkReadReleaseCount];
        int v29 = 67109376;
        int v30 = v18;
        __int16 v31 = 1024;
        int v32 = v19;
        _os_log_impl(&dword_222C74000, v16, OS_LOG_TYPE_DEFAULT, "InterruptReadCompletion: mismatched interrupt and read? counts %d : %d   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<", (uint8_t *)&v29, 0xEu);
      }
    }
    int v20 = v14;
    id v21 = [(IAPDataBuffer *)v20 parentiAPInterface];
    id v22 = v21;
    if (v21
      && *(void *)[v21 interface]
      && (*(unsigned int (**)(uint64_t, uint64_t, char *, void, void (*)(void *, int, unsigned int), IAPDataBuffer *))(*(void *)[v22 interface] + 264))(objc_msgSend(v22, "interface"), objc_msgSend(v22, "bulkInPipeRef"), v20->_dataBufferIn, LODWORD(v20->_dataBufferInLen), ReadCompletion, v20))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v23 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        uint64_t v23 = MEMORY[0x263EF8438];
        id v24 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        InterruptReadCompletion_cold_5();
      }
    }
  }
  if (!v5 || !*(void *)[v5 interface]) {
    goto LABEL_70;
  }
  if (![v5 interruptInPipeBuffer]) {
    objc_msgSend(v5, "setInterruptInPipeBuffer:", malloc_type_calloc(1uLL, objc_msgSend(v5, "interruptInPipeMaxPacketSize"), 0x7C262143uLL));
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v25 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v25 = MEMORY[0x263EF8438];
    id v26 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    InterruptReadCompletion_cold_3();
  }

  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(), id))(*(void *)[v5 interface] + 264))(objc_msgSend(v5, "interface"), objc_msgSend(v5, "interruptInPipeRef"), objc_msgSend(v5, "interruptInPipeBuffer"), objc_msgSend(v5, "interruptInPipeMaxPacketSize"), InterruptReadCompletion, v5))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      char v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      char v27 = MEMORY[0x263EF8438];
      id v28 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      InterruptReadCompletion_cold_1();
    }
  }
  else
  {
LABEL_70:
    [v5 setHasReadInterruptPipe:1];
  }
}

void ReadCompletion(void *a1, int a2, unsigned int a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a1;
  BOOL v6 = [v5 parentiAPInterface];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v29 = 67109888;
    int v30 = a2;
    __int16 v31 = 1024;
    *(_DWORD *)int v32 = a3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = [v6 interruptBulkReadAllocCount];
    LOWORD(v33[0]) = 1024;
    *(_DWORD *)((char *)v33 + 2) = [v6 interruptBulkReadReleaseCount];
    _os_log_debug_impl(&dword_222C74000, v9, OS_LOG_TYPE_DEBUG, "ReadCompletion: result=%d numBytesRead=%u, counts %d : %d", (uint8_t *)&v29, 0x1Au);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ReadCompletion_cold_9();
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v12 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    ReadCompletion_cold_7();
  }

  if (a3)
  {
    if (v6)
    {
      BOOL v14 = [v6 dataInHandler];

      if (v14)
      {
        v15 = [MEMORY[0x263EFF8F8] dataWithBytes:*((void *)v5 + 1) length:a3];
        id v16 = [v6 dataInHandler];
        ((void (**)(void, void *, void *))v16)[2](v16, v6, v15);

LABEL_36:
        BOOL v18 = [v6 interruptInPipeRef] != 0;
        goto LABEL_55;
      }
    }
  }
  id v17 = [v6 dataInHandler];

  if (!v17)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      int v19 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      ReadCompletion_cold_4();
    }
LABEL_53:

    if (v5) {
      goto LABEL_36;
    }
    goto LABEL_54;
  }
  if (!a3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      int v19 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_222C74000, v19, OS_LOG_TYPE_DEFAULT, "no bytes read!", (uint8_t *)&v29, 2u);
    }
    goto LABEL_53;
  }
  if (v5) {
    goto LABEL_36;
  }
LABEL_54:
  BOOL v18 = 0;
LABEL_55:
  if (![v6 interruptInPipeRef]
    || [v6 interruptInPipeRef] && *((void *)v5 + 2) <= (unint64_t)a3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v22 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v22 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v27 = [v6 interruptInPipeRef];
      uint64_t v28 = *((void *)v5 + 1);
      int v29 = 67109634;
      int v30 = v27;
      __int16 v31 = 2080;
      *(void *)int v32 = v28;
      *(_WORD *)&v32[8] = 1024;
      v33[0] = a3;
      _os_log_debug_impl(&dword_222C74000, v22, OS_LOG_TYPE_DEBUG, "interruptInPipeRef = %d, dataBufferInLen = %s, numBytesRead = %d", (uint8_t *)&v29, 0x18u);
    }

    if (v6)
    {
      if (*(void *)[v6 interface])
      {
        if (!(*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t (*)(), unsigned int *))(*(void *)[v6 interface] + 264))(objc_msgSend(v6, "interface"), objc_msgSend(v6, "bulkInPipeRef"), *((void *)v5 + 1), v5[4], ReadCompletion, v5))goto LABEL_80; {
        if (gLogObjects && gNumLogObjects >= 1)
        }
        {
          id v24 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          id v24 = MEMORY[0x263EF8438];
          id v25 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          ReadCompletion_cold_1();
        }
      }
    }
  }
  if (v18)
  {
    objc_msgSend(v6, "setInterruptBulkReadReleaseCount:", objc_msgSend(v6, "interruptBulkReadReleaseCount") + 1);
    id v26 = [v6 interruptBulkReadList];
    [v26 removeObject:v5];
  }
LABEL_80:
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void __61__iAP2EASession_initWithProtocol_endpointUUID_eaSessionUUID___block_invoke()
{
  if (EANativeSessionStatus == -1) {
    EANativeSessionStatus = 0;
  }
}

void _StaticSockCallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, void *a5)
{
  id v8 = a5;
  switch(a2)
  {
    case 1:
      id v9 = v8;
      [v8 _readSocketCB:a1];
      break;
    case 8:
      id v9 = v8;
      [v8 _writeSocketCB:a1];
      break;
    case 2:
      id v9 = v8;
      [v8 _acceptSocketCB:a1 acceptedSock:*a4];
      break;
    default:
      goto LABEL_8;
  }
  id v8 = v9;
LABEL_8:
}

void _StaticUSBWriteComplete(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setUsbError:a2];
  id v6 = [v5 eaInterface];
  [v6 _writeComplete:v5 writeLength:a3];
}

void _StaticUSBReadComplete(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  [v5 setUsbError:a2];
  id v6 = [v5 eaInterface];
  [v6 _readComplete:v5 readLength:a3];
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_222C8AC08(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  char v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1) {
    dispatch_once(&init_logging_modules_onceToken, block);
  }
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFTypeID v2 = &off_222C92000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    id v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        id v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_222C74000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          id v8 = "<Undefined>";
        }
      }
      uint64_t v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        uint64_t v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          uint64_t v9 = "<Undefined>";
        }
      }
      os_log_t v10 = os_log_create(v8, v9);
      *(void *)(*(void *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          id v13 = v8;
          __int16 v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_222C74000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    CFTypeID v2 = &off_222C92000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 50);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

const void *platform_systemInfo_copySystemName()
{
  CFTypeID v0 = (const void *)MGGetStringAnswer();
  CFRetain(v0);
  return v0;
}

const void *platform_systemInfo_copyBluetoothMACAddress()
{
  CFTypeID v0 = (const void *)MGGetStringAnswer();
  CFRetain(v0);
  return v0;
}

uint64_t platform_systemInfo_copyBluetoothMACAddressData()
{
  return MGCopyAnswer();
}

uint64_t platform_systemInfo_copyUniqueDeviceID()
{
  CFDictionaryRef v0 = IOServiceMatching("IOUSBDeviceController");
  if (!v0) {
    return 0;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC90], v0);
  if (!MatchingService) {
    return 0;
  }
  io_object_t v2 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, @"DeviceDescription", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  unint64_t v4 = CFProperty;
  if (CFProperty)
  {
    uint64_t v5 = [CFProperty objectForKeyedSubscript:@"serialNumber"];
  }
  else
  {
    uint64_t v5 = 0;
  }
  IOObjectRelease(v2);

  return v5;
}

uint64_t platform_systemInfo_isIPad()
{
  return _isDeviceClass(@"iPad");
}

uint64_t _isDeviceClass(void *a1)
{
  id v1 = a1;
  io_object_t v2 = (void *)systemInfo_copyDeviceClass();
  uint64_t v3 = [v2 isEqualToString:v1];

  return v3;
}

uint64_t platform_systemInfo_isIPod()
{
  return _isDeviceClass(@"iPod");
}

uint64_t platform_systemInfo_isIPhone()
{
  return _isDeviceClass(@"iPhone");
}

uint64_t platform_systemInfo_isATV()
{
  return _isDeviceClass(@"AppleTV");
}

uint64_t platform_systemInfo_isWatch()
{
  return _isDeviceClass(@"Watch");
}

uint64_t platform_systemInfo_isFPGA()
{
  return _isDeviceClass(@"iFPGA");
}

uint64_t platform_systemInfo_isRealityDevice()
{
  return 0;
}

uint64_t platform_systemInfo_isApplePencilSupported()
{
  return MGGetBoolAnswer();
}

BOOL platform_systemInfo_isApplePencilGen1Supported()
{
  BOOL result = 0;
  if (MGGetBoolAnswer())
  {
    CFStringRef v0 = (const __CFString *)MGCopyAnswer();
    if ((MGGetBoolAnswer() & 1) != 0
      || CFEqual(v0, @"iPad13,18")
      || CFEqual(v0, @"iPad13,19"))
    {
      return 1;
    }
  }
  return result;
}

uint64_t platform_systemInfo_supportsBatteryAuthentication()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_supportsQiAuth()
{
  return 1;
}

uint64_t platform_systemInfo_isLightning()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_supportsUSBC()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_deviceType()
{
  if (_isDeviceClass(@"Watch")) {
    return 4;
  }
  if (_isDeviceClass(@"iPod")) {
    return 2;
  }
  if (_isDeviceClass(@"iPad")) {
    return 3;
  }
  if (_isDeviceClass(@"iPhone")) {
    return 1;
  }
  if (_isDeviceClass(@"AppleTV")) {
    return 5;
  }
  return 0;
}

void _asyncCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    os_log_t v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    os_log_t v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218752;
    int v17 = a1;
    __int16 v18 = 1024;
    int v19 = a2;
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    __int16 v22 = 2048;
    uint64_t v23 = a4;
    _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_DEFAULT, "_asyncReadCallback %p %x %llx %llx\n", (uint8_t *)&v16, 0x26u);
  }

  id v11 = a1;
  if (a3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_222C74000, v12, OS_LOG_TYPE_DEFAULT, "POLLIN", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(v11, "_handleReadDataCallback:revent:t_look:", a2, a3, a4);
  }
  if ((a3 & 0x10) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      __int16 v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      __int16 v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "POLLHUP", (uint8_t *)&v16, 2u);
    }

    [v11 closeCDCInterface];
  }
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void usbUtil_getInterfaceAndNameString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void usbUtil_getInterfaceAndNameString_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void usbUtil_getInterfaceAndNameString_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void usbUtil_getInterfaceAndNameString_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void usbUtil_getInterfaceAndNameString_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void usbUtil_getInterfaceAndNameString_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void usbUtil_findParentOfClass_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v0 = 136315650;
  id v1 = "usbUtil_findParentOfClass";
  __int16 v2 = 1024;
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d Found match for %s!", (uint8_t *)&v0, 0x1Cu);
}

void usbUtil_findParentOfClass_cold_2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "Couldn't find parent matching class: %s", (uint8_t *)&v1, 0xCu);
}

void usbUtil_findParentOfClass_cold_3()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = 136315906;
  uint64_t v3 = "usbUtil_findParentOfClass";
  __int16 v4 = 1024;
  OUTLINED_FUNCTION_1();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG, "%s:%d Looking for match for %s in plane %s", (uint8_t *)&v2, 0x26u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AppleUSBHostBillboardDeviceAdded_cold_1(void *a1)
{
  [a1 accessoryUSBBillboardDeviceVIDPID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_222C74000, v1, v2, "%s: EXIT listener(0x%X) = %@", v3, v4, v5, v6, 2u);
}

void __AppleUSBHostBillboardDeviceTerminated_cold_1(void *a1)
{
  [a1 accessoryUSBBillboardDeviceVIDPID];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_222C74000, v1, v2, "%s: EXIT listener(0x%X) = %@", v3, v4, v5, v6, 2u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void InterruptReadCompletion_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to perform asynchronous interrupt read (%08x)", v2, v3, v4, v5, v6);
}

void InterruptReadCompletion_cold_3()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_222C74000, v0, OS_LOG_TYPE_DEBUG, "InterruptReadCompletion: queue read for interruptInPipe", v1, 2u);
}

void InterruptReadCompletion_cold_5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to queue asynchronous bulk read (%08x)", v2, v3, v4, v5, v6);
}

void InterruptReadCompletion_cold_8()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6_0(&dword_222C74000, v0, v1, "Read %u bytes from interrupt in endpoint", v2, v3, v4, v5, v6);
}

void InterruptReadCompletion_cold_10()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error from async interrupt read (%08x)", v2, v3, v4, v5, v6);
}

void ReadCompletion_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to perform asynchronous bulk read (%08x)", v2, v3, v4, v5, v6);
}

void ReadCompletion_cold_4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "No USB Host Data In Handler, numBytesRead: %d!", v2, v3, v4, v5, v6);
}

void ReadCompletion_cold_7()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_6_0(&dword_222C74000, v0, v1, "Read %u bytes from bulk endpoint", v2, v3, v4, v5, v6);
}

void ReadCompletion_cold_9()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error from async bulk read (%08x)", v2, v3, v4, v5, v6);
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_222C74000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
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

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E68]();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4FC8](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x270EE4FD0](allocator, *(void *)&sock, callBackTypes, callout, context);
}

void CFSocketDisableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
}

void CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
}

void CFSocketInvalidate(CFSocketRef s)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
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

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x270EE54C8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE5500](userNotification, responseFlags, timeout);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F18](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x270EF3F50](*(void *)&connect, *(void *)&memoryType, *(void *)&intoTask, atAddress, ofSize, *(void *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x270EF3FB8](*(void *)&connect, *(void *)&memoryType, *(void *)&fromTask, atAddress);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x270EF3FC8](*(void *)&service, pluginType, interfaceType, theInterface, theScore);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x270EF47F0](*(void *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x270EF49D0](*(void *)&entry, properties, allocator, *(void *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x270EF49F8](*(void *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x270EF4A08](*(void *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x270EF4A38](*(void *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF4A50](*(void *)&entry, plane, key, allocator, *(void *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x270EF4A58](*(void *)&entry, properties);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

kern_return_t IOServiceGetBusyState(io_service_t service, uint32_t *busyState)
{
  return MEMORY[0x270EF4AA0](*(void *)&service, busyState);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x270EF4AF0](*(void *)&service, waitTime);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t acc_strings_bundle()
{
  return MEMORY[0x270F18A28]();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8E98](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA0](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x270EDA078](*(void *)&a1, *(void *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB190](*(void *)&a1, a2, a3, *(void *)&a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x270EDB3B0](*(void *)&a1, a2, a3, *(void *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x270EDB9A8](a1);
}