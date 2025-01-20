@interface CRSysConfig
+ (id)sharedAccess;
- (BOOL)dataIsValid:(_syscfgEntry *)a3 length:(unsigned int)a4;
- (BOOL)findSyscfgAccess;
- (BOOL)isADDASysCfgAccessType;
- (BOOL)syscfgUpdate:(char *)a3 key:(unsigned int)a4 buffer:(const char *)a5 length:(unsigned int)a6;
- (BOOL)writeSystemConfig:(unsigned int)a3 inBuffer:(id)a4;
- (CRSysConfig)init;
- (_syscfgEntry)findEntry:(char *)a3 key:(unsigned int)a4;
- (id)createStringForKey:(unsigned int)a3;
- (id)readSystemConfigAll;
- (id)readSystemConfigArea;
- (unsigned)syscfgAccess;
- (void)setIsADDASysCfgAccessType:(BOOL)a3;
- (void)setSyscfgAccess:(unsigned int)a3;
@end

@implementation CRSysConfig

+ (id)sharedAccess
{
  if (qword_267EF81C8 != -1) {
    dispatch_once(&qword_267EF81C8, &unk_26D157808);
  }
  v2 = (void *)qword_267EF81C0;
  return v2;
}

- (CRSysConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)CRSysConfig;
  result = [(CRSysConfig *)&v3 init];
  if (result)
  {
    result->_syscfgAccess = 0;
    result->_isADDASysCfgAccessType = 0;
  }
  return result;
}

- (BOOL)writeSystemConfig:(unsigned int)a3 inBuffer:(id)a4
{
  kern_return_t v41;
  int v42;
  NSObject *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  kern_return_t v49;
  int v50;
  NSObject *v51;
  BOOL v52;
  int v54;
  const char *v55;
  uint64_t v56;

  uint64_t v4 = *(void *)&a3;
  v56 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = handleForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v54 = 136315138;
    v55 = "-[CRSysConfig writeSystemConfig:inBuffer:]";
    _os_log_impl(&dword_21FBF2000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v54, 0xCu);
  }

  if (!v4 || !v6)
  {
    v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DD7C();
    }
    goto LABEL_26;
  }
  if ((objc_msgSend_findSyscfgAccess(self, v8, v9, v10) & 1) == 0)
  {
    v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DD48();
    }
    goto LABEL_26;
  }
  if (!self->_isADDASysCfgAccessType)
  {
    v18 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], v11, 0, v13);
    v46 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v44, v4, v45);
    objc_msgSend_setObject_forKey_(v18, v47, (uint64_t)v46, @"HorizonDataAccessKey");

    objc_msgSend_setObject_forKey_(v18, v48, (uint64_t)v6, @"HorizonDataAccessBuffer");
    v49 = IORegistryEntrySetCFProperties(self->_syscfgAccess, v18);
    if (v49)
    {
      v50 = v49;
      v19 = handleForCategory(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_21FC5DC68(v50, v19);
      }
      goto LABEL_25;
    }
LABEL_29:
    v52 = 1;
    goto LABEL_27;
  }
  v14 = objc_msgSend_readSystemConfigArea(self, v11, v12, v13);
  if (!v14)
  {
    v18 = handleForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DCE0();
    }
    goto LABEL_26;
  }
  v18 = v14;
  v19 = objc_msgSend_mutableCopy(v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_mutableBytes(v19, v20, v21, v22);
  id v24 = v6;
  uint64_t v28 = objc_msgSend_bytes(v24, v25, v26, v27);
  uint64_t v32 = objc_msgSend_length(v24, v29, v30, v31);
  if ((objc_msgSend_syscfgUpdate_key_buffer_length_(self, v33, v23, v4, v28, v32) & 1) == 0)
  {
    v51 = handleForCategory(0);
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DD14();
    }

    goto LABEL_25;
  }
  v36 = objc_msgSend_dictionaryWithCapacity_(MEMORY[0x263EFF9A0], v34, 0, v35);
  objc_msgSend_setObject_forKey_(v36, v37, @"AppleDiagnosticDataSysCfg", @"AppleDiagnosticDataSet");
  objc_msgSend_setObject_forKey_(v36, v38, MEMORY[0x263EFFA88], @"AppleDiagnosticDataCommit");
  objc_msgSend_setObject_forKey_(v36, v39, (uint64_t)&unk_26D163218, @"AppleDiagnosticDataOffset");
  objc_msgSend_setObject_forKey_(v36, v40, (uint64_t)v19, @"AppleDiagnosticDataBuffer");
  v41 = IORegistryEntrySetCFProperties(self->_syscfgAccess, v36);
  if (!v41)
  {

    goto LABEL_29;
  }
  v42 = v41;
  v43 = handleForCategory(0);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    sub_21FC5DC68(v42, v43);
  }

LABEL_25:
LABEL_26:
  v52 = 0;
LABEL_27:

  return v52;
}

- (id)readSystemConfigAll
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  objc_super v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v35 = 136315138;
    v36 = "-[CRSysConfig readSystemConfigAll]";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v35, 0xCu);
  }

  v7 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v4, v5, v6);
  v11 = objc_msgSend_readSystemConfigArea(self, v8, v9, v10);
  v15 = v11;
  if (!v11)
  {
    uint64_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DDB0();
    }
    goto LABEL_15;
  }
  unint64_t v16 = objc_msgSend_length(v11, v12, v13, v14);
  if (v16 <= 0x17)
  {
    uint64_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DDE4(v16, v17);
    }
LABEL_15:

    id v26 = 0;
    goto LABEL_16;
  }
  id v18 = v15;
  uint64_t v22 = (_DWORD *)objc_msgSend_bytes(v18, v19, v20, v21);
  if (*v22 != 1396926055)
  {
    uint64_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DE6C();
    }
    goto LABEL_15;
  }
  id v24 = v22;
  uint64_t v25 = v22[5];
  if (v16 < 20 * (unint64_t)v25 + 24)
  {
    uint64_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v35 = 134218496;
      v36 = (const char *)v16;
      __int16 v37 = 2048;
      uint64_t v38 = 20 * v25 + 24;
      __int16 v39 = 1024;
      int v40 = v25;
      _os_log_error_impl(&dword_21FBF2000, v17, OS_LOG_TYPE_ERROR, "readSystemConfigAll: syscfg length %lu is too small, should be at least %lu to contain %u entries", (uint8_t *)&v35, 0x1Cu);
    }
    goto LABEL_15;
  }
  if (v25)
  {
    uint64_t v28 = v22 + 9;
    do
    {
      uint64_t v29 = *(v28 - 3);
      if (v29 == 1129206850)
      {
        uint64_t v29 = *(v28 - 2);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v23, (uint64_t)v24 + *v28, *(v28 - 1));
      }
      else
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v23, (uint64_t)(v28 - 2), 16);
      uint64_t v30 = };
      v28 += 5;
      v33 = objc_msgSend_createStringForKey_(self, v31, v29, v32);
      objc_msgSend_setObject_forKey_(v7, v34, (uint64_t)v30, (uint64_t)v33);

      --v25;
    }
    while (v25);
  }
  id v26 = v7;
LABEL_16:

  return v26;
}

- (BOOL)findSyscfgAccess
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[CRSysConfig findSyscfgAccess]";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (!v4->_syscfgAccess)
  {
    uint64_t v6 = handleForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "Finding HorizonDataAccess ...", (uint8_t *)&v19, 2u);
    }

    CFDictionaryRef v7 = IOServiceMatching("HorizonDataAccess");
    mach_port_t v8 = *MEMORY[0x263F0EC88];
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v7);
    v4->_syscfgAccess = MatchingService;
    if (MatchingService)
    {
      uint64_t v10 = handleForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        v11 = "Found HorizonDataAccess";
LABEL_20:
        _os_log_impl(&dword_21FBF2000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      uint64_t v12 = handleForCategory(0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_21FBF2000, v12, OS_LOG_TYPE_DEFAULT, "Finding AppleDiagnosticDataAccess ...", (uint8_t *)&v19, 2u);
      }

      CFDictionaryRef v13 = IOServiceMatching("AppleDiagnosticDataAccess");
      io_service_t v14 = IOServiceGetMatchingService(v8, v13);
      v4->_syscfgAccess = v14;
      if (v14)
      {
        v4->_isADDASysCfgAccessType = 1;
        uint64_t v10 = handleForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          v11 = "Found AppleDiagnosticDataAccess";
          goto LABEL_20;
        }
      }
      else
      {
        v15 = handleForCategory(0);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_21FBF2000, v15, OS_LOG_TYPE_DEFAULT, "Finding AppleDiagnosticDataAccessReadOnly ...", (uint8_t *)&v19, 2u);
        }

        CFDictionaryRef v16 = IOServiceMatching("AppleDiagnosticDataAccessReadOnly");
        io_service_t v17 = IOServiceGetMatchingService(v8, v16);
        v4->_syscfgAccess = v17;
        if (!v17)
        {
          uint64_t v10 = handleForCategory(0);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_21FC5DEA0();
          }
          BOOL v5 = 0;
          goto LABEL_22;
        }
        v4->_isADDASysCfgAccessType = 1;
        uint64_t v10 = handleForCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          v11 = "Found AppleDiagnosticDataAccessReadOnly";
          goto LABEL_20;
        }
      }
    }
    BOOL v5 = 1;
LABEL_22:

    goto LABEL_23;
  }
  BOOL v5 = 1;
LABEL_23:
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)dataIsValid:(_syscfgEntry *)a3 length:(unsigned int)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[CRSysConfig dataIsValid:length:]";
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  if (!a3 || !a4)
  {
    CFDictionaryRef v7 = handleForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DD7C();
    }
    goto LABEL_11;
  }
  if (a3->var0 == 1129206850)
  {
    if (a3->var1.var1.var1 != a4)
    {
      CFDictionaryRef v7 = handleForCategory(0);
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        return 0;
      }
LABEL_8:
      sub_21FC5DED4();
      goto LABEL_11;
    }
  }
  else if (a4 >= 0x11)
  {
    CFDictionaryRef v7 = handleForCategory(0);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  return 1;
}

- (_syscfgEntry)findEntry:(char *)a3 key:(unsigned int)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = handleForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[CRSysConfig findEntry:key:]";
    _os_log_impl(&dword_21FBF2000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  if (!a3 || !a4)
  {
    int v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DD7C();
    }
    goto LABEL_15;
  }
  uint64_t v7 = *((unsigned int *)a3 + 5);
  if (!v7)
  {
LABEL_11:
    int v9 = handleForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DF08();
    }
LABEL_15:

    return 0;
  }
  result = (_syscfgEntry *)(a3 + 24);
  while (result->var0 != a4 && (result->var0 != 1129206850 || result->var1.var1.var0 != a4))
  {
    ++result;
    if (!--v7) {
      goto LABEL_11;
    }
  }
  return result;
}

- (BOOL)syscfgUpdate:(char *)a3 key:(unsigned int)a4 buffer:(const char *)a5 length:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v11 = handleForCategory(0);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[CRSysConfig syscfgUpdate:key:buffer:length:]";
    _os_log_impl(&dword_21FBF2000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v19, 0xCu);
  }

  if (!v6 || !a3 || !a4 || !a5)
  {
    io_service_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DD7C();
    }
    goto LABEL_22;
  }
  if (a4 == 1400000109) {
    uint64_t Entry_key = objc_msgSend_findEntry_key_(self, v12, (uint64_t)a3, 1482183502);
  }
  else {
    uint64_t Entry_key = objc_msgSend_findEntry_key_(self, v12, (uint64_t)a3, a4);
  }
  if (!Entry_key)
  {
    io_service_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DF3C();
    }
    goto LABEL_22;
  }
  v15 = (_DWORD *)Entry_key;
  if ((objc_msgSend_dataIsValid_length_(self, v14, Entry_key, v6) & 1) == 0)
  {
    io_service_t v17 = handleForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DF70();
    }
    goto LABEL_22;
  }
  if (*v15 == 1129206850)
  {
    uint64_t v16 = v15[3];
    if ((v16 + v6) > *((_DWORD *)a3 + 2))
    {
      io_service_t v17 = handleForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_21FC5DED4();
      }
LABEL_22:

      return 0;
    }
    memcpy(&a3[v16], a5, v6);
  }
  else
  {
    memcpy(v15 + 1, a5, v6);
    if (a4 == 1400000109) {
      _DWORD *v15 = 1400000109;
    }
  }
  return 1;
}

- (id)readSystemConfigArea
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = handleForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    io_service_t v14 = "-[CRSysConfig readSystemConfigArea]";
    _os_log_impl(&dword_21FBF2000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  if ((objc_msgSend_findSyscfgAccess(self, v4, v5, v6) & 1) == 0)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5E00C();
    }
    goto LABEL_13;
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(self->_syscfgAccess, @"AppleDiagnosticDataSysCfg", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  if (!CFProperty)
  {
    uint64_t v11 = handleForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_21FC5DFA4();
    }
LABEL_13:

    goto LABEL_14;
  }
  mach_port_t v8 = (void *)CFProperty;
  CFTypeID v9 = CFGetTypeID(CFProperty);
  if (v9 == CFDataGetTypeID()) {
    goto LABEL_15;
  }
  int v10 = handleForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_21FC5DFD8();
  }

  CFRelease(v8);
LABEL_14:
  mach_port_t v8 = 0;
LABEL_15:
  return v8;
}

- (id)createStringForKey:(unsigned int)a3
{
  *(_DWORD *)bytes = bswap32(a3);
  objc_super v3 = (__CFString *)CFStringCreateWithBytes(0, bytes, 4, 0x8000100u, 0);
  return v3;
}

- (unsigned)syscfgAccess
{
  return self->_syscfgAccess;
}

- (void)setSyscfgAccess:(unsigned int)a3
{
  self->_syscfgAccess = a3;
}

- (BOOL)isADDASysCfgAccessType
{
  return self->_isADDASysCfgAccessType;
}

- (void)setIsADDASysCfgAccessType:(BOOL)a3
{
  self->_isADDASysCfgAccessType = a3;
}

@end