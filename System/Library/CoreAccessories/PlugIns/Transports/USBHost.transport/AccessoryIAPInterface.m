@interface AccessoryIAPInterface
+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3;
- (AccessoryIAPInterface)initWithInterface:(unsigned int)a3 andDataInHandler:(id)a4;
- (AccessoryIAPInterface)initWithInterface:(unsigned int)a3 vid:(unsigned __int16)a4 pid:(unsigned __int16)a5 aidInfo:(id)a6 andDataInHandler:(id)a7;
- (BOOL)clearUSBHostHIDInterfaces;
- (BOOL)configureInterface:(unsigned int)a3 skipPipeSetup:(BOOL)a4;
- (BOOL)configureNCMInterface:(unsigned __int8)a3 asCarPlay:(BOOL)a4;
- (BOOL)hasReadInterruptPipe;
- (BOOL)interfaceConfigured;
- (BOOL)lockOtherInterfaces;
- (BOOL)needOutZLP;
- (BOOL)setInterfaceProperties:(id)a3;
- (BOOL)setProperty:(id)a3 forInterfaceNum:(unsigned __int8)a4;
- (BOOL)setUSBHostHIDInterface:(unsigned __int8)a3 withHIDFunction:(unsigned int)a4;
- (BOOL)unlockOtherInterfaces;
- (BOOL)writeData:(id)a3;
- (IOUSBInterfaceStruct942)interface;
- (NSDictionary)aidInfo;
- (NSDictionary)ioregProperties;
- (NSLock)dataBufLock;
- (NSMutableArray)inUseDataBufArray;
- (NSMutableArray)interfacePropertiesArray;
- (NSMutableArray)interruptBulkReadList;
- (NSString)identifier;
- (char)interruptInPipeBuffer;
- (double)creationTime;
- (id)dataInHandler;
- (id)description;
- (unint64_t)parentDeviceRegistryEntryID;
- (unint64_t)registryEntryID;
- (unsigned)bulkInPipeMaxPacketSize;
- (unsigned)bulkInPipeRef;
- (unsigned)bulkOutPipeMaxPacketSize;
- (unsigned)bulkOutPipeRef;
- (unsigned)interruptBulkReadAllocCount;
- (unsigned)interruptBulkReadReleaseCount;
- (unsigned)interruptInPipeMaxPacketSize;
- (unsigned)interruptInPipeRef;
- (unsigned)locationID;
- (unsigned)maxOutLength;
- (unsigned)pid;
- (unsigned)vid;
- (unsigned)vidpid;
- (void)dealloc;
- (void)dismissNotSupportNotification;
- (void)presentNotSupportNotification;
- (void)setAidInfo:(id)a3;
- (void)setBulkInPipeMaxPacketSize:(unsigned __int16)a3;
- (void)setBulkInPipeRef:(unsigned __int8)a3;
- (void)setBulkOutPipeMaxPacketSize:(unsigned __int16)a3;
- (void)setBulkOutPipeRef:(unsigned __int8)a3;
- (void)setDataBufLock:(id)a3;
- (void)setDataInHandler:(id)a3;
- (void)setHasReadInterruptPipe:(BOOL)a3;
- (void)setInUseDataBufArray:(id)a3;
- (void)setInterface:(IOUSBInterfaceStruct942 *)a3;
- (void)setInterfaceConfigured:(BOOL)a3;
- (void)setInterfacePropertiesArray:(id)a3;
- (void)setInterruptBulkReadAllocCount:(unsigned int)a3;
- (void)setInterruptBulkReadList:(id)a3;
- (void)setInterruptBulkReadReleaseCount:(unsigned int)a3;
- (void)setInterruptInPipeBuffer:(char *)a3;
- (void)setInterruptInPipeMaxPacketSize:(unsigned __int16)a3;
- (void)setInterruptInPipeRef:(unsigned __int8)a3;
- (void)setMaxOutLength:(unsigned int)a3;
- (void)setNeedOutZLP:(BOOL)a3;
@end

@implementation AccessoryIAPInterface

- (AccessoryIAPInterface)initWithInterface:(unsigned int)a3 andDataInHandler:(id)a4
{
  return [(AccessoryIAPInterface *)self initWithInterface:*(void *)&a3 vid:0 pid:0 aidInfo:0 andDataInHandler:a4];
}

- (AccessoryIAPInterface)initWithInterface:(unsigned int)a3 vid:(unsigned __int16)a4 pid:(unsigned __int16)a5 aidInfo:(id)a6 andDataInHandler:(id)a7
{
  int v9 = a5;
  int v10 = a4;
  uint64_t v11 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v13 = a6;
  id v14 = a7;
  v30.receiver = self;
  v30.super_class = (Class)AccessoryIAPInterface;
  v15 = [(AccessoryIAPInterface *)&v30 init];
  if (v15)
  {
    v16 = [MEMORY[0x263EFF910] date];
    [v16 timeIntervalSince1970];
    *((void *)v15 + 10) = v17;

    *(_WORD *)(v15 + 9) = 0;
    *((_WORD *)v15 + 9) = 0;
    *((_DWORD *)v15 + 5) = 0;
    v15[11] = 0;
    *((void *)v15 + 13) = 0;
    *((void *)v15 + 14) = 0;
    v18 = (void *)*((void *)v15 + 15);
    *((void *)v15 + 15) = 0;

    *((void *)v15 + 7) = 0;
    v15[12] = 0;
    uint64_t v19 = MEMORY[0x223CA5B10](v14);
    v20 = (void *)*((void *)v15 + 9);
    *((void *)v15 + 9) = v19;

    *((_DWORD *)v15 + 9) = 0;
    *((_DWORD *)v15 + 10) = 0;
    *((_WORD *)v15 + 7) = v10;
    *((_WORD *)v15 + 8) = v9;
    *((_DWORD *)v15 + 8) = v9 | (v10 << 16);
    v15[13] = 0;
    objc_storeStrong((id *)v15 + 12, a6);
    v21 = objc_msgSend(NSString, "stringWithFormat:", @"%x", *((unsigned __int16 *)v15 + 8) | (*((unsigned __int16 *)v15 + 7) << 16));
    uint64_t v22 = acc_userNotifications_generateIdentifier(@"iap-interface-registry", (uint64_t)v21);
    v23 = (void *)*((void *)v15 + 11);
    *((void *)v15 + 11) = v22;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v24 = MEMORY[0x263EF8438];
      id v25 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v26 = *((_DWORD *)v15 + 8);
      uint64_t v27 = *((void *)v15 + 12);
      *(_DWORD *)buf = 136315650;
      v32 = "-[AccessoryIAPInterface initWithInterface:vid:pid:aidInfo:andDataInHandler:]";
      __int16 v33 = 1024;
      int v34 = v26;
      __int16 v35 = 2112;
      uint64_t v36 = v27;
      _os_log_impl(&dword_222C74000, v24, OS_LOG_TYPE_INFO, "%s: vidpid 0x%X, aidInfo %@", buf, 0x1Cu);
    }

    if ([v15 configureInterface:v11 skipPipeSetup:0])
    {
      v28 = (void *)*((void *)v15 + 15);
      *((void *)v15 + 15) = 0;
    }
    else
    {
      v28 = v15;
      v15 = 0;
    }
  }
  return (AccessoryIAPInterface *)v15;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "USBInterfaceClose returned: %08x", v2, v3, v4, v5, v6);
}

- (BOOL)configureInterface:(unsigned int)a3 skipPipeSetup:(BOOL)a4
{
  kern_return_t RegistryEntryID;
  NSObject *v70;
  unint64_t parentDeviceRegistryEntryID;
  NSObject *v72;
  NSObject *v73;
  int Pipe;
  NSObject *v75;
  NSObject *v76;
  int v77;
  NSObject *v78;
  NSObject *v79;
  int v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSLock *v84;
  NSLock *dataBufLock;
  NSMutableArray *v86;
  NSMutableArray *inUseDataBufArray;
  NSMutableArray *v88;
  NSMutableArray *interruptBulkReadList;
  IAPDataBuffer *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  int v95;
  IAPDataBuffer *v96;
  void *v97;
  int v98;
  int v99;
  NSObject *v100;
  NSObject *v101;
  BOOL v102;
  BOOL v103;
  IONotificationPort *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  int bulkOutPipeRef;
  int bulkOutPipeMaxPacketSize;
  int bulkInPipeRef;
  int bulkInPipeMaxPacketSize;
  int interruptInPipeRef;
  int interruptInPipeMaxPacketSize;
  void block[5];
  int v117;
  io_registry_entry_t entry;
  unsigned __int8 v119;
  __int16 v120;
  SInt32 theScore;
  IOUSBInterfaceStruct942 **v122;
  uint32_t busyState[2];
  unsigned char v124[12];
  __int16 v125;
  uint8_t *v126;
  uint8_t buf[32];
  long long v128;
  long long v129;
  long long v130;
  long long v131;
  long long v132;
  long long v133;
  uint64_t v134;

  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v134 = *MEMORY[0x263EF8340];
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
    int v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    int v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[AccessoryIAPInterface configureInterface:skipPipeSetup:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v5;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v4;
    _os_log_impl(&dword_222C74000, v9, OS_LOG_TYPE_DEFAULT, "%s: service %d, skipPipeSetup %d", buf, 0x18u);
  }

  io_service_t ParentOfClass = usbUtil_findParentOfClass(v5, "IOUSBDevice", "IOService");
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects <= 0;
  }
  else {
    BOOL v11 = 1;
  }
  int v12 = !v11;
  if (!ParentOfClass)
  {
    if (v12)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v15 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[AccessoryIAPInterface configureInterface:skipPipeSetup:]();
    }

    goto LABEL_70;
  }
  io_service_t v13 = ParentOfClass;
  if (v12)
  {
    id v14 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[AccessoryIAPInterface configureInterface:skipPipeSetup:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v13;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "%s: Found parent (%d) of iAP Interface (%d)", buf, 0x18u);
  }

  busyState[0] = 0;
  if (!IOServiceGetBusyState(v13, busyState))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      uint64_t v17 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[AccessoryIAPInterface configureInterface:skipPipeSetup:]9((uint64_t)busyState, v17, v20, v21, v22, v23, v24, v25);
    }

    if (!IOServiceWaitQuiet(v13, 0))
    {
      busyState[0] = 0;
      if (!IOServiceGetBusyState(v13, busyState))
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          int v26 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          int v26 = MEMORY[0x263EF8438];
          id v27 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[AccessoryIAPInterface configureInterface:skipPipeSetup:]9((uint64_t)busyState, v26, v28, v29, v30, v31, v32, v33);
        }
      }
    }
  }
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v34 = MEMORY[0x223CA5600](v5, buf);
  if (gLogObjects) {
    BOOL v35 = gNumLogObjects <= 0;
  }
  else {
    BOOL v35 = 1;
  }
  int v36 = !v35;
  if (!v34)
  {
    if (v36)
    {
      v39 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v39 = MEMORY[0x263EF8438];
      id v50 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v124 = 136315394;
      *(void *)&v124[4] = "-[AccessoryIAPInterface configureInterface:skipPipeSetup:]";
      v125 = 2080;
      v126 = buf;
      _os_log_impl(&dword_222C74000, v39, OS_LOG_TYPE_DEFAULT, "%s: Registry entry name: '%s'", v124, 0x16u);
    }

    if (buf[0]
      && (*(void *)buf == 0x65746E4920504169 ? (BOOL v51 = *(void *)&buf[6] == 0x65636166726574) : (BOOL v51 = 0), v51))
    {
      InterfaceAndNameString = 0;
    }
    else
    {
      CFUUIDRef v52 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 1u, 0xA2u, 0xD0u, 0xE9u, 0x42u, 0xF6u, 0x4Au, 0x87u, 0x8Bu, 0x8Bu, 0x77u, 5u, 0x7Cu, 0x8Cu, 0xE0u, 0xCEu);
      CFUUIDRef v53 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Au, 0x41u, 0x5Au, 0x15u, 0x1Au, 0x7Bu, 0x4Bu, 0x5Bu, 0x86u, 0x9Cu, 0x69u, 0x4Fu, 0xEEu, 0xCu, 0x6Cu, 0x6Bu);
      InterfaceAndNameString = (void *)usbUtil_getInterfaceAndNameString(v13, v52, v5, v53, 0);
    }
    IOObjectRelease(v13);
    if (!v5) {
      goto LABEL_71;
    }
    self->_registryEntryID = +[AccessoryIAPInterface getRegistryEntryIDFromService:v5];
    *(void *)v124 = 0;
    if (IORegistryEntryCreateCFProperties(v5, (CFMutableDictionaryRef *)v124, (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)
      || !*(void *)v124)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v63 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        v63 = MEMORY[0x263EF8438];
        id v64 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        -[AccessoryIAPInterface configureInterface:skipPipeSetup:]4();
      }
    }
    else
    {
      v54 = [*(id *)v124 objectForKey:@"locationID"];
      self->_locationID = [v54 intValue];

      ioregProperties = self->_ioregProperties;
      self->_ioregProperties = *(NSDictionary **)v124;

      v122 = 0;
      *(void *)busyState = 0;
      theScore = 0;
      v120 = 0;
      v119 = 0;
      CFUUIDRef v56 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      CFUUIDRef v57 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      if (IOCreatePlugInInterfaceForService(v5, v56, v57, (IOCFPlugInInterface ***)busyState, &theScore)
        || (uint64_t v58 = *(void *)busyState) == 0)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v63 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          v63 = MEMORY[0x263EF8438];
          id v65 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          -[AccessoryIAPInterface configureInterface:skipPipeSetup:]2();
        }
      }
      else
      {
        v59 = *(uint64_t (**)(uint64_t, void, void, IOUSBInterfaceStruct942 ***))(**(void **)busyState
                                                                                             + 8);
        CFUUIDRef v60 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Au, 0x41u, 0x5Au, 0x15u, 0x1Au, 0x7Bu, 0x4Bu, 0x5Bu, 0x86u, 0x9Cu, 0x69u, 0x4Fu, 0xEEu, 0xCu, 0x6Cu, 0x6Bu);
        CFUUIDBytes v61 = CFUUIDGetUUIDBytes(v60);
        LODWORD(v59) = v59(v58, *(void *)&v61.byte0, *(void *)&v61.byte8, &v122);
        (*(void (**)(void))(**(void **)busyState + 24))(*(void *)busyState);
        if (!v59)
        {
          v62 = v122;
          if (v122)
          {
            self->_interface = v122;
            if (v4)
            {
LABEL_93:
              BOOL v48 = 1;
              goto LABEL_72;
            }
            if (!((unsigned int (*)(IOUSBInterfaceStruct942 **, char *))(*v62)->GetInterfaceClass)(v62, (char *)&v120 + 1)&& !((unsigned int (*)(IOUSBInterfaceStruct942 **, __int16 *))(*self->_interface)->GetInterfaceSubClass)(self->_interface, &v120))
            {
              v67 = logObjectForModule();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:]9((unsigned __int8 *)&v120 + 1, (unsigned __int8 *)&v120, v67);
              }
            }
            entry = 0;
            if (((unsigned int (*)(IOUSBInterfaceStruct942 **, io_registry_entry_t *))(*self->_interface)->GetDevice)(self->_interface, &entry))
            {
              v68 = logObjectForModule();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR)) {
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:]8();
              }
            }
            else
            {
              RegistryEntryID = IORegistryEntryGetRegistryEntryID(entry, &self->_parentDeviceRegistryEntryID);
              v70 = logObjectForModule();
              v68 = v70;
              if (RegistryEntryID)
              {
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:]7();
                }
              }
              else if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                parentDeviceRegistryEntryID = self->_parentDeviceRegistryEntryID;
                *(_DWORD *)buf = 134217984;
                *(void *)&uint8_t buf[4] = parentDeviceRegistryEntryID;
                _os_log_impl(&dword_222C74000, v68, OS_LOG_TYPE_DEFAULT, "_parentDeviceRegistryEntryID = 0x%llX", buf, 0xCu);
              }
            }

            if (((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceOpen)(self->_interface))
            {
              v72 = logObjectForModule();
              if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:]6();
              }
              goto LABEL_135;
            }
            if (((unsigned int (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interface)->GetNumEndpoints)(self->_interface, &v119))
            {
              v73 = logObjectForModule();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                -[AccessoryIAPInterface configureInterface:skipPipeSetup:]5();
              }

              if (!((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface)) {
                goto LABEL_136;
              }
              v72 = logObjectForModule();
              if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                goto LABEL_135;
              }
            }
            else
            {
              Pipe = findPipe((uint64_t)self->_interface, v119, 0, 2, &self->_bulkOutPipeRef, &self->_bulkOutPipeMaxPacketSize);
              if (!self->_bulkOutPipeRef)
              {
                v75 = logObjectForModule();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR)) {
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:]3();
                }
              }
              if (Pipe)
              {
                v76 = logObjectForModule();
                if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:]2();
                }

                if (!((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface)) {
                  goto LABEL_136;
                }
                v72 = logObjectForModule();
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_135;
                }
              }
              else
              {
                v77 = findPipe((uint64_t)self->_interface, v119, 1, 2, &self->_bulkInPipeRef, &self->_bulkInPipeMaxPacketSize);
                if (!self->_bulkInPipeRef)
                {
                  v78 = logObjectForModule();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
                    -[AccessoryIAPInterface configureInterface:skipPipeSetup:]0();
                  }
                }
                if (!v77)
                {
                  v80 = findPipe((uint64_t)self->_interface, v119, 1, 3, &self->_interruptInPipeRef, &self->_interruptInPipeMaxPacketSize);
                  if (self->_interruptInPipeRef)
                  {
                    v81 = logObjectForModule();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_222C74000, v81, OS_LOG_TYPE_DEFAULT, "Found interrupt in endpoint!", buf, 2u);
                    }
                  }
                  if (v80)
                  {
                    v82 = logObjectForModule();
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
                      -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.7();
                    }
                  }
                  v83 = logObjectForModule();
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                  {
                    bulkOutPipeRef = self->_bulkOutPipeRef;
                    bulkOutPipeMaxPacketSize = self->_bulkOutPipeMaxPacketSize;
                    bulkInPipeRef = self->_bulkInPipeRef;
                    bulkInPipeMaxPacketSize = self->_bulkInPipeMaxPacketSize;
                    interruptInPipeRef = self->_interruptInPipeRef;
                    interruptInPipeMaxPacketSize = self->_interruptInPipeMaxPacketSize;
                    *(_DWORD *)buf = 67110400;
                    *(_DWORD *)&uint8_t buf[4] = bulkOutPipeRef;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = bulkOutPipeMaxPacketSize;
                    *(_WORD *)&buf[14] = 1024;
                    *(_DWORD *)&buf[16] = bulkInPipeRef;
                    *(_WORD *)&buf[20] = 1024;
                    *(_DWORD *)&buf[22] = bulkInPipeMaxPacketSize;
                    *(_WORD *)&buf[26] = 1024;
                    *(_DWORD *)&buf[28] = interruptInPipeRef;
                    LOWORD(v128) = 1024;
                    *(_DWORD *)((char *)&v128 + 2) = interruptInPipeMaxPacketSize;
                    _os_log_debug_impl(&dword_222C74000, v83, OS_LOG_TYPE_DEBUG, "Bulk out pipe: %d maxPacketSize: %d, Bulk in pipe: %d, maxPacketSize: %d, Interrupt in pipe: %d, maxPacketSize: %d", buf, 0x26u);
                  }

                  v84 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
                  dataBufLock = self->_dataBufLock;
                  self->_dataBufLock = v84;

                  v86 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
                  inUseDataBufArray = self->_inUseDataBufArray;
                  self->_inUseDataBufArray = v86;

                  v88 = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:8];
                  interruptBulkReadList = self->_interruptBulkReadList;
                  self->_interruptBulkReadList = v88;

                  if (self->_interruptInPipeRef)
                  {
                    v90 = [[IAPDataBuffer alloc] initWithiAPInterface:self];
                    v91 = [(AccessoryIAPInterface *)self dataBufLock];
                    [v91 lock];

                    v92 = [(AccessoryIAPInterface *)self inUseDataBufArray];
                    [v92 addObject:v90];

                    v93 = [(AccessoryIAPInterface *)self dataBufLock];
                    [v93 unlock];
                  }
                  else
                  {
                    v94 = [(AccessoryIAPInterface *)self dataBufLock];
                    [v94 lock];

                    v95 = 8;
                    do
                    {
                      v96 = [[IAPDataBuffer alloc] initWithiAPInterface:self];
                      v97 = [(AccessoryIAPInterface *)self inUseDataBufArray];
                      [v97 addObject:v96];

                      --v95;
                    }
                    while (v95);
                    v90 = [(AccessoryIAPInterface *)self dataBufLock];
                    [(IAPDataBuffer *)v90 unlock];
                  }

                  v117 = 0;
                  v98 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, int *))(*self->_interface)->CreateInterfaceAsyncPort)(self->_interface, &v117);
                  v99 = v117;
                  v100 = logObjectForModule();
                  v101 = v100;
                  if (v98) {
                    v102 = 1;
                  }
                  else {
                    v102 = v99 == 0;
                  }
                  if (v102)
                  {
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
                      -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.6();
                    }

                    v103 = 0;
                  }
                  else
                  {
                    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_222C74000, v101, OS_LOG_TYPE_DEFAULT, "Casting to IOUSBInterfaceInterface400", buf, 2u);
                    }

                    v105 = (IONotificationPort *)((uint64_t (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->GetEndpointPropertiesV3)(self->_interface);
                    v106 = logObjectForModule();
                    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      *(void *)&uint8_t buf[4] = v105;
                      _os_log_impl(&dword_222C74000, v106, OS_LOG_TYPE_DEFAULT, "notificationPort = %p", buf, 0xCu);
                    }

                    if (v105)
                    {
                      IONotificationPortSetDispatchQueue(v105, (dispatch_queue_t)usbHostNotificationQ);
                      v107 = logObjectForModule();
                      if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
                        -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.5();
                      }

                      block[0] = MEMORY[0x263EF8330];
                      block[1] = 3221225472;
                      block[2] = __58__AccessoryIAPInterface_configureInterface_skipPipeSetup___block_invoke;
                      block[3] = &unk_264667290;
                      block[4] = self;
                      dispatch_async((dispatch_queue_t)usbHostNotificationQ, block);
                      v103 = 1;
                    }
                    else
                    {
                      v108 = logObjectForModule();
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
                        -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.4();
                      }

                      if (((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface))
                      {
                        v109 = logObjectForModule();
                        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
                          -[AccessoryIAPInterface dealloc]();
                        }
                      }
                      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->Release)(self->_interface);
                      v103 = 0;
                      self->_interface = 0;
                    }
                  }
                  self->_interfaceConfigured = v103;
                  goto LABEL_93;
                }
                v79 = logObjectForModule();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
                  -[AccessoryIAPInterface configureInterface:skipPipeSetup:].cold.9();
                }

                if (!((unsigned int (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->USBInterfaceClose)(self->_interface))
                {
LABEL_136:
                  ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interface)->Release)(self->_interface);
                  BOOL v48 = 0;
                  self->_interface = 0;
                  goto LABEL_72;
                }
                v72 = logObjectForModule();
                if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
LABEL_135:

                  goto LABEL_136;
                }
              }
            }
            -[AccessoryIAPInterface dealloc]();
            goto LABEL_135;
          }
        }
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v63 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          v63 = MEMORY[0x263EF8438];
          id v66 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
          -[AccessoryIAPInterface configureInterface:skipPipeSetup:]0();
        }
      }
    }

    goto LABEL_71;
  }
  uint64_t v37 = v34;
  if (v36)
  {
    v38 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v38 = MEMORY[0x263EF8438];
    id v40 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
    -[AccessoryIAPInterface configureInterface:skipPipeSetup:]7(v37, v38, v41, v42, v43, v44, v45, v46);
  }

  IOObjectRelease(v13);
LABEL_70:
  InterfaceAndNameString = 0;
LABEL_71:
  BOOL v48 = 0;
LABEL_72:

  return v48;
}

void __58__AccessoryIAPInterface_configureInterface_skipPipeSetup___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    BOOL v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v9 = 0;
    _os_log_impl(&dword_222C74000, v4, OS_LOG_TYPE_DEFAULT, "Trigger start of reading on dispatch_queue", v9, 2u);
  }

  uint64_t v5 = *(unsigned char **)(a1 + 32);
  if (v5[11])
  {
    InterruptReadCompletion(v5, 0, 0);
  }
  else
  {
    for (uint64_t i = 0; i != 8; ++i)
    {
      BOOL v7 = [*(id *)(a1 + 32) inUseDataBufArray];
      id v8 = [v7 objectAtIndex:i];

      ReadCompletion(v8, 0, 0);
    }
  }
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<USBInfo: %p, regEntryID: %llu>", self, -[AccessoryIAPInterface registryEntryID](self, "registryEntryID")];
}

- (BOOL)writeData:(id)a3
{
  id v4 = a3;
  if (![(AccessoryIAPInterface *)self interface] || !*[(AccessoryIAPInterface *)self interface]) {
    goto LABEL_30;
  }
  uint64_t v5 = (uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, uint64_t, void))(*[(AccessoryIAPInterface *)self interface])[256];
  uint8_t v6 = [(AccessoryIAPInterface *)self interface];
  uint64_t v7 = [(AccessoryIAPInterface *)self bulkOutPipeRef];
  id v8 = v4;
  int v9 = v5(v6, v7, [v8 bytes], (unsigned __int16)objc_msgSend(v8, "length"));
  if (v9 == -536850432)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      int v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v26 = 0;
      _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_INFO, "USB Pipe stalled, clear and retry!", v26, 2u);
    }

    ((void (*)(IOUSBInterfaceStruct942 **, void))(*[(AccessoryIAPInterface *)self interface])[240])([(AccessoryIAPInterface *)self interface], [(AccessoryIAPInterface *)self bulkOutPipeRef]);
    int v12 = (uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, uint64_t, void))(*[(AccessoryIAPInterface *)self interface])[256];
    io_service_t v13 = [(AccessoryIAPInterface *)self interface];
    uint64_t v14 = [(AccessoryIAPInterface *)self bulkOutPipeRef];
    id v15 = v8;
    int v9 = v12(v13, v14, [v15 bytes], (unsigned __int16)objc_msgSend(v15, "length"));
  }
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects <= 0;
  }
  else {
    BOOL v16 = 1;
  }
  int v17 = !v16;
  if (v9)
  {
    if (v17)
    {
      id v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v18 = MEMORY[0x263EF8438];
      id v20 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
  }
  else
  {
    if (v17)
    {
      id v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v19 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[AccessoryIAPInterface writeData:](v8, v19);
    }

    if (![(AccessoryIAPInterface *)self needOutZLP]
      || ![v8 length]
      || (uint64_t v24 = [v8 length], v24 == -[AccessoryIAPInterface maxOutLength](self, "maxOutLength"))
      || (unint64_t v25 = [v8 length],
          v25 % [(AccessoryIAPInterface *)self bulkOutPipeMaxPacketSize])
      || !((unsigned int (*)(IOUSBInterfaceStruct942 **, void, void *, void))(*[(AccessoryIAPInterface *)self interface])[256])([(AccessoryIAPInterface *)self interface], [(AccessoryIAPInterface *)self bulkOutPipeRef], &writeData__zlpBuffer, 0))
    {
      BOOL v21 = 1;
      goto LABEL_31;
    }
    id v18 = logObjectForModule();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
  }
  -[AccessoryIAPInterface writeData:]();
LABEL_29:

LABEL_30:
  BOOL v21 = 0;
LABEL_31:

  return v21;
}

- (BOOL)setProperty:(id)a3 forInterfaceNum:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(AccessoryIAPInterface *)self interfacePropertiesArray];

  if (!v7)
  {
    id v8 = [MEMORY[0x263EFF980] array];
    [(AccessoryIAPInterface *)self setInterfacePropertiesArray:v8];
  }
  int v9 = [(AccessoryIAPInterface *)self interfacePropertiesArray];

  if (v9)
  {
    int v10 = [(AccessoryIAPInterface *)self interfacePropertiesArray];
    unint64_t v11 = [v10 count];

    if (v11 <= v4)
    {
      uint64_t v12 = v4 - v11 + 1;
      do
      {
        io_service_t v13 = [(AccessoryIAPInterface *)self interfacePropertiesArray];
        uint64_t v14 = [NSDictionary dictionary];
        [v13 addObject:v14];

        --v12;
      }
      while (v12);
    }
    id v15 = [(AccessoryIAPInterface *)self interfacePropertiesArray];
    [v15 setObject:v6 atIndexedSubscript:v4];
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    BOOL v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    BOOL v16 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    id v18 = [(AccessoryIAPInterface *)self interfacePropertiesArray];
    v20[0] = 67109634;
    v20[1] = v4;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    uint64_t v24 = v18;
    _os_log_impl(&dword_222C74000, v16, OS_LOG_TYPE_INFO, "Set property for interface number %u: %@\ninterfacePropertiesArray: %@", (uint8_t *)v20, 0x1Cu);
  }
  return v9 != 0;
}

- (BOOL)setInterfaceProperties:(id)a3
{
  kern_return_t v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  id v15;
  id v17;
  io_registry_entry_t entry;

  id v4 = a3;
  if ([(AccessoryIAPInterface *)self interface])
  {
    entry = 0;
    if (((unsigned int (*)(IOUSBInterfaceStruct942 **, io_registry_entry_t *))(*[(AccessoryIAPInterface *)self interface])[168])([(AccessoryIAPInterface *)self interface], &entry))
    {
      BOOL v5 = 1;
    }
    else
    {
      BOOL v5 = entry == 0;
    }
    if (v5)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v6 = MEMORY[0x263EF8438];
        uint64_t v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[AccessoryIAPInterface setInterfaceProperties:].cold.7();
      }
    }
    else
    {
      int v9 = IORegistryEntrySetCFProperties(entry, v4);
      if (gLogObjects) {
        int v10 = gNumLogObjects <= 0;
      }
      else {
        int v10 = 1;
      }
      unint64_t v11 = !v10;
      if (!v9)
      {
        if (v11)
        {
          id v6 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          id v6 = MEMORY[0x263EF8438];
          id v17 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[AccessoryIAPInterface setInterfaceProperties:]((uint64_t)v4, v6);
        }
        io_service_t v13 = 1;
        goto LABEL_43;
      }
      if (v11)
      {
        id v6 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v6 = MEMORY[0x263EF8438];
        id v15 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[AccessoryIAPInterface setInterfaceProperties:].cold.5();
      }
    }
    io_service_t v13 = 0;
LABEL_43:

    goto LABEL_44;
  }
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
    uint64_t v12 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[AccessoryIAPInterface setInterfaceProperties:]();
  }

  io_service_t v13 = 0;
LABEL_44:

  return v13;
}

- (BOOL)setUSBHostHIDInterface:(unsigned __int8)a3 withHIDFunction:(unsigned int)a4
{
  uint64_t v5 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
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
    int v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    int v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    int v17 = v5;
    __int16 v18 = 1024;
    unsigned int v19 = a4;
    _os_log_impl(&dword_222C74000, v9, OS_LOG_TYPE_INFO, "Setting USBHost HID interface: %d with HIDFunctionType: %d", buf, 0xEu);
  }

  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", a4, @"IAPHIDAccessoryCategoryKey");
  id v15 = v10;
  unint64_t v11 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  BOOL v12 = [(AccessoryIAPInterface *)self setProperty:v11 forInterfaceNum:v5];

  return v12;
}

- (BOOL)clearUSBHostHIDInterfaces
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(AccessoryIAPInterface *)self setInterfacePropertiesArray:0];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 1;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(AccessoryIAPInterface *)self interfacePropertiesArray];
    int v8 = 138412290;
    int v9 = v6;
    _os_log_impl(&dword_222C74000, v5, OS_LOG_TYPE_INFO, "interfacePropertiesArray %@...", (uint8_t *)&v8, 0xCu);
  }
  return 1;
}

- (BOOL)configureNCMInterface:(unsigned __int8)a3 asCarPlay:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v7 = objc_opt_new();
  if (v7)
  {
    int v8 = [NSNumber numberWithUnsignedLong:0x20000000];
    [v7 setObject:v8 forKeyedSubscript:@"NetworkInterfaceFlags"];

    if (v4) {
      [v7 setObject:@"CarPlay" forKeyedSubscript:@"InterfaceRole"];
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      int v9 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109120;
      v13[1] = v5;
      _os_log_impl(&dword_222C74000, v9, OS_LOG_TYPE_INFO, "Setting NCM interface number to %u...", (uint8_t *)v13, 8u);
    }

    BOOL v10 = [(AccessoryIAPInterface *)self setProperty:v7 forInterfaceNum:v5];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)unlockOtherInterfaces
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = [(AccessoryIAPInterface *)self interfacePropertiesArray];

  if (v4)
  {
    uint64_t v5 = [(AccessoryIAPInterface *)self interfacePropertiesArray];
    [v3 setObject:v5 forKey:@"InterfaceProperties"];
  }
  id v6 = [NSNumber numberWithBool:1];
  [v3 setObject:v6 forKey:@"Authenticated"];

  BOOL v7 = [(AccessoryIAPInterface *)self setInterfaceProperties:v3];
  return v7;
}

- (BOOL)lockOtherInterfaces
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v4 = [NSNumber numberWithBool:0];
  [v3 setObject:v4 forKey:@"Authenticated"];

  LOBYTE(self) = [(AccessoryIAPInterface *)self setInterfaceProperties:v3];
  return (char)self;
}

- (void)presentNotSupportNotification
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = acc_userNotifications_accessoryNotSupported();
  BOOL v4 = (void *)[(NSString *)self->_identifier copy];
  [v3 setGroupIdentifier:v4];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int vid = self->_vid;
    int pid = self->_pid;
    unint64_t registryEntryID = self->_registryEntryID;
    id v11 = [v3 groupIdentifier];
    int v13 = 136316418;
    uint64_t v14 = "-[AccessoryIAPInterface presentNotSupportNotification]";
    __int16 v15 = 1024;
    int v16 = vid;
    __int16 v17 = 1024;
    int v18 = pid;
    __int16 v19 = 2048;
    unint64_t v20 = registryEntryID;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v3;
    _os_log_impl(&dword_222C74000, v7, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@, pAccErrorNotification %@", (uint8_t *)&v13, 0x36u);
  }
  BOOL v12 = +[ACCUserNotificationManager sharedManager];
  [v12 presentNotification:v3 completionHandler:0];
}

- (void)dismissNotSupportNotification
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)[(NSString *)self->_identifier copy];
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
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int vid = self->_vid;
    int pid = self->_pid;
    unint64_t registryEntryID = self->_registryEntryID;
    int v11 = 136316162;
    BOOL v12 = "-[AccessoryIAPInterface dismissNotSupportNotification]";
    __int16 v13 = 1024;
    int v14 = vid;
    __int16 v15 = 1024;
    int v16 = pid;
    __int16 v17 = 2048;
    unint64_t v18 = registryEntryID;
    __int16 v19 = 2112;
    unint64_t v20 = v3;
    _os_log_impl(&dword_222C74000, v6, OS_LOG_TYPE_DEFAULT, "%s: vid/pid 0x%X/0x%X, registryID 0x%llx, groupidentifer %@", (uint8_t *)&v11, 0x2Cu);
  }

  BOOL v10 = +[ACCUserNotificationManager sharedManager];
  [v10 dismissNotificationsWithGroupIdentifier:v3];
}

+ (unint64_t)getRegistryEntryIDFromService:(unsigned int)a3
{
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(a3, &entryID)) {
    return 0;
  }
  else {
    return entryID;
  }
}

- (unint64_t)registryEntryID
{
  return self->_registryEntryID;
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (unint64_t)parentDeviceRegistryEntryID
{
  return self->_parentDeviceRegistryEntryID;
}

- (NSDictionary)ioregProperties
{
  return self->_ioregProperties;
}

- (id)dataInHandler
{
  return self->_dataInHandler;
}

- (void)setDataInHandler:(id)a3
{
}

- (BOOL)needOutZLP
{
  return self->_needOutZLP;
}

- (void)setNeedOutZLP:(BOOL)a3
{
  self->_needOutZLP = a3;
}

- (unsigned)maxOutLength
{
  return self->_maxOutLength;
}

- (void)setMaxOutLength:(unsigned int)a3
{
  self->_maxOutLength = a3;
}

- (unsigned)vid
{
  return self->_vid;
}

- (unsigned)pid
{
  return self->_pid;
}

- (unsigned)vidpid
{
  return self->_vidpid;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)aidInfo
{
  return self->_aidInfo;
}

- (void)setAidInfo:(id)a3
{
}

- (IOUSBInterfaceStruct942)interface
{
  return self->_interface;
}

- (void)setInterface:(IOUSBInterfaceStruct942 *)a3
{
  self->_interface = a3;
}

- (unsigned)bulkOutPipeRef
{
  return self->_bulkOutPipeRef;
}

- (void)setBulkOutPipeRef:(unsigned __int8)a3
{
  self->_bulkOutPipeRef = a3;
}

- (unsigned)bulkOutPipeMaxPacketSize
{
  return self->_bulkOutPipeMaxPacketSize;
}

- (void)setBulkOutPipeMaxPacketSize:(unsigned __int16)a3
{
  self->_bulkOutPipeMaxPacketSize = a3;
}

- (unsigned)bulkInPipeRef
{
  return self->_bulkInPipeRef;
}

- (void)setBulkInPipeRef:(unsigned __int8)a3
{
  self->_bulkInPipeRef = a3;
}

- (unsigned)bulkInPipeMaxPacketSize
{
  return self->_bulkInPipeMaxPacketSize;
}

- (void)setBulkInPipeMaxPacketSize:(unsigned __int16)a3
{
  self->_bulkInPipeMaxPacketSize = a3;
}

- (unsigned)interruptInPipeRef
{
  return self->_interruptInPipeRef;
}

- (void)setInterruptInPipeRef:(unsigned __int8)a3
{
  self->_interruptInPipeRef = a3;
}

- (unsigned)interruptInPipeMaxPacketSize
{
  return self->_interruptInPipeMaxPacketSize;
}

- (void)setInterruptInPipeMaxPacketSize:(unsigned __int16)a3
{
  self->_interruptInPipeMaxPacketSize = a3;
}

- (char)interruptInPipeBuffer
{
  return self->_interruptInPipeBuffer;
}

- (void)setInterruptInPipeBuffer:(char *)a3
{
  self->_interruptInPipeBuffer = a3;
}

- (NSMutableArray)interfacePropertiesArray
{
  return self->_interfacePropertiesArray;
}

- (void)setInterfacePropertiesArray:(id)a3
{
}

- (NSMutableArray)inUseDataBufArray
{
  return self->_inUseDataBufArray;
}

- (void)setInUseDataBufArray:(id)a3
{
}

- (NSLock)dataBufLock
{
  return self->_dataBufLock;
}

- (void)setDataBufLock:(id)a3
{
}

- (BOOL)hasReadInterruptPipe
{
  return self->_hasReadInterruptPipe;
}

- (void)setHasReadInterruptPipe:(BOOL)a3
{
  self->_hasReadInterruptPipe = a3;
}

- (NSMutableArray)interruptBulkReadList
{
  return self->_interruptBulkReadList;
}

- (void)setInterruptBulkReadList:(id)a3
{
}

- (unsigned)interruptBulkReadAllocCount
{
  return self->_interruptBulkReadAllocCount;
}

- (void)setInterruptBulkReadAllocCount:(unsigned int)a3
{
  self->_interruptBulkReadAllocCount = a3;
}

- (unsigned)interruptBulkReadReleaseCount
{
  return self->_interruptBulkReadReleaseCount;
}

- (void)setInterruptBulkReadReleaseCount:(unsigned int)a3
{
  self->_interruptBulkReadReleaseCount = a3;
}

- (BOOL)interfaceConfigured
{
  return self->_interfaceConfigured;
}

- (void)setInterfaceConfigured:(BOOL)a3
{
  self->_interfaceConfigured = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interruptBulkReadList, 0);
  objc_storeStrong((id *)&self->_dataBufLock, 0);
  objc_storeStrong((id *)&self->_inUseDataBufArray, 0);
  objc_storeStrong((id *)&self->_interfacePropertiesArray, 0);
  objc_storeStrong((id *)&self->_aidInfo, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_dataInHandler, 0);
  objc_storeStrong((id *)&self->_ioregProperties, 0);
}

- (void)configureInterface:skipPipeSetup:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "findParentOfClass returned IO_OBJECT_NULL", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "Unable to retrieve asynchronous port", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.5()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_222C74000, v0, OS_LOG_TYPE_DEBUG, "Asynchronous event source added to run loop", v1, 2u);
}

- (void)configureInterface:skipPipeSetup:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "failed to create async port 0x%08x", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.7()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error getting interrupt pipe properties (%08x), but ignoring", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.9()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error getting kUSBIn kUSBBulk pipe properties (%08x)", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "Unable to find bulk in endpoint!", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.12()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error getting kUSBOut kUSBBulk pipe properties (%08x)", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.13()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "Unable to find bulk out endpoint!", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.15()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to get number of endpoints (%08x)", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.16()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to open interface (%08x)", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.17()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error getting usb device ID: %u", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.18()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "Unable to get parent USB device ID", v2, v3, v4, v5, v6);
}

- (void)configureInterface:(os_log_t)log skipPipeSetup:.cold.19(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl(&dword_222C74000, log, OS_LOG_TYPE_DEBUG, "Interface class %d, subclass %d", (uint8_t *)v5, 0xEu);
}

- (void)configureInterface:skipPipeSetup:.cold.20()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Couldn’t create a device interface for the interface (%08x)", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.22()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to create a plug-in (%08x)", v2, v3, v4, v5, v6);
}

- (void)configureInterface:skipPipeSetup:.cold.24()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Failed to get serviceProperties error: %08x", v2, v3, v4, v5, v6);
}

- (void)configureInterface:(uint64_t)a3 skipPipeSetup:(uint64_t)a4 .cold.27(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)configureInterface:(uint64_t)a3 skipPipeSetup:(uint64_t)a4 .cold.29(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)writeData:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Unable to perform bulk write (%08x)", v2, v3, v4, v5, v6);
}

- (void)writeData:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_debug_impl(&dword_222C74000, a2, OS_LOG_TYPE_DEBUG, "Wrote %lu bytes to USB!", (uint8_t *)&v3, 0xCu);
}

- (void)setInterfaceProperties:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_222C74000, v0, v1, "Error, USB Host interface not found!", v2, v3, v4, v5, v6);
}

- (void)setInterfaceProperties:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_222C74000, a2, OS_LOG_TYPE_DEBUG, "Set USB Host interface properties:\n%@", (uint8_t *)&v2, 0xCu);
}

- (void)setInterfaceProperties:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error setting USB Host interface properties: 0x%x", v2, v3, v4, v5, v6);
}

- (void)setInterfaceProperties:.cold.7()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_1(&dword_222C74000, v0, v1, "Error getting USB Host interface: 0x%x", v2, v3, v4, v5, v6);
}

@end