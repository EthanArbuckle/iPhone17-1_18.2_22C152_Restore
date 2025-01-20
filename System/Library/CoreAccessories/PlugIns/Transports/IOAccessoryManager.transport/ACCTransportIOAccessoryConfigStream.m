@interface ACCTransportIOAccessoryConfigStream
- (ACCTransportIOAccessoryConfigStream)initWithDelegate:(id)a3 andIOService:(unsigned int)a4;
- (ACCTransportIOAccessoryConfigStreamProtocol)delegate;
- (BOOL)IOAccessoryConfigStreamRequestGetPropertyForCategoryID:(unsigned __int16)a3 propertyID:(unsigned __int8)a4;
- (BOOL)IOAccessoryConfigStreamSetPropertyData:(id)a3 categoryID:(unsigned __int16)a4 propertyID:(unsigned __int8)a5;
- (BOOL)accInfoValid;
- (BOOL)categoriesAvailable;
- (BOOL)openServiceSession;
- (BOOL)requestPending;
- (BOOL)transmitData:(id)a3;
- (NSString)deviceFirmwareVersion;
- (NSString)deviceHardwareVersion;
- (NSString)deviceIdentifier;
- (NSString)deviceManufacturer;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)devicePPID;
- (NSString)deviceSerialNumber;
- (NSString)endpointUUID;
- (NSString)parentConnectionUUID;
- (OS_dispatch_source)requestTimer;
- (id)IOAccessoryConfigStreamCopyDataForCategoryID:(unsigned __int16)a3 propertyID:(unsigned __int8)a4;
- (id)_getCategories;
- (id)_getPropertyData:(unsigned __int8)a3 forCategory:(unsigned __int16)a4;
- (id)_getStringProperty:(unsigned __int8)a3 forCategory:(unsigned __int16)a4;
- (id)description;
- (unsigned)requestedCategoryID;
- (unsigned)requestedPropertyID;
- (void)_checkAccInfo;
- (void)_getCategories;
- (void)_registerForInterestNotifications;
- (void)closeServiceSession;
- (void)dealloc;
- (void)handlePropertyDataReceived;
- (void)setAccInfoValid:(BOOL)a3;
- (void)setCategoriesAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceFirmwareVersion:(id)a3;
- (void)setDeviceHardwareVersion:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceManufacturer:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDevicePPID:(id)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setParentConnectionUUID:(id)a3;
- (void)setRequestPending:(BOOL)a3;
- (void)setRequestTimer:(id)a3;
- (void)setRequestedCategoryID:(unsigned __int16)a3;
- (void)setRequestedPropertyID:(unsigned __int8)a3;
@end

@implementation ACCTransportIOAccessoryConfigStream

- (ACCTransportIOAccessoryConfigStream)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ACCTransportIOAccessoryConfigStream;
  v7 = [(ACCTransportIOAccessoryBase *)&v17 initWithIOAccessoryClass:6 ioService:v4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentConnectionUUID, 0);
    endpointUUID = v8->_endpointUUID;
    v8->_endpointUUID = 0;

    objc_storeWeak((id *)&v8->_delegate, v6);
    v8->super._ioConnect = 0;
    v8->_categoriesAvailable = 0;
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    requestTimer = v8->_requestTimer;
    v8->_requestTimer = (OS_dispatch_source *)v10;

    v12 = v8->_requestTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __69__ACCTransportIOAccessoryConfigStream_initWithDelegate_andIOService___block_invoke;
    handler[3] = &unk_26466B8C8;
    v13 = v8;
    v16 = v13;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_source_set_timer((dispatch_source_t)v8->_requestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume((dispatch_object_t)v8->_requestTimer);
    [(ACCTransportIOAccessoryConfigStream *)v13 _registerForInterestNotifications];
    [(ACCTransportIOAccessoryConfigStream *)v13 _checkAccInfo];
  }
  return v8;
}

void __69__ACCTransportIOAccessoryConfigStream_initWithDelegate_andIOService___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 10;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(unsigned __int16 *)(v5 + 60);
    LODWORD(v5) = *(unsigned __int8 *)(v5 + 58);
    int v11 = 67109376;
    int v12 = v6;
    LOWORD(v13[0]) = 1024;
    *(_DWORD *)((char *)v13 + 2) = v5;
    _os_log_impl(&dword_222CE3000, v4, OS_LOG_TYPE_DEFAULT, "ConfigStream request timed out! categoryID 0x%x, propertyID %u", (uint8_t *)&v11, 0xEu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  if (WeakRetained)
  {
    LOWORD(v11) = 6;
    uint64_t v8 = *(void *)(a1 + 32);
    HIWORD(v11) = *(_WORD *)(v8 + 60);
    int v12 = *(unsigned __int8 *)(v8 + 58);
    v13[0] = -536870186;
    id v9 = objc_alloc_init(MEMORY[0x263EFF990]);
    [v9 appendBytes:&v11 length:12];
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
    [v10 IOAccessoryConfigStreamMessageArrived:v9 endpointUUID:*(void *)(*(void *)(a1 + 32) + 136)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 0;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v16 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "deallocing ConfigStream %d", buf, 8u);
  }

  dispatch_source_cancel((dispatch_source_t)self->_requestTimer);
  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_parentConnectionUUID, 0);
  endpointUUID = self->_endpointUUID;
  self->_endpointUUID = 0;

  deviceIdentifier = self->_deviceIdentifier;
  self->_deviceIdentifier = 0;

  deviceName = self->_deviceName;
  self->_deviceName = 0;

  deviceManufacturer = self->_deviceManufacturer;
  self->_deviceManufacturer = 0;

  deviceModel = self->_deviceModel;
  self->_deviceModel = 0;

  deviceHardwareVersion = self->_deviceHardwareVersion;
  self->_deviceHardwareVersion = 0;

  deviceFirmwareVersion = self->_deviceFirmwareVersion;
  self->_deviceFirmwareVersion = 0;

  deviceSerialNumber = self->_deviceSerialNumber;
  self->_deviceSerialNumber = 0;

  v14.receiver = self;
  v14.super_class = (Class)ACCTransportIOAccessoryConfigStream;
  [(ACCTransportIOAccessoryBase *)&v14 dealloc];
}

- (BOOL)openServiceSession
{
  kern_return_t v10;
  BOOL v11;
  int v12;
  kern_return_t v13;
  id v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  BOOL v19;
  id v20;
  void *v21;
  id v23;
  unsigned int v24;
  int v25;
  unsigned char v26[20];
  uint64_t v27;

  v27 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(ACCTransportIOAccessoryBase *)self ioService];
    v7 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
    v25 = 67109378;
    *(_DWORD *)v26 = v6;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v7;
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "ConfigStream openServiceSession, ioService = %d, endpointUUID %@", (uint8_t *)&v25, 0x12u);
  }
  if (self->super._ioConnect)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      uint64_t v8 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      objc_super v14 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v15 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
    v25 = 138412290;
    *(void *)v26 = v15;
    unsigned int v16 = "ConfigStream is already open (endpointUUID %@)";
    uint64_t v17 = v8;
    v18 = 12;
LABEL_29:
    _os_log_impl(&dword_222CE3000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v25, v18);

LABEL_30:
    v19 = 1;
    goto LABEL_39;
  }
  io_service_t v9 = [(ACCTransportIOAccessoryBase *)self ioService];
  id v10 = IOServiceOpen(v9, *MEMORY[0x263EF8960], 0, &self->super._ioConnect);
  if (gLogObjects) {
    int v11 = gNumLogObjects <= 9;
  }
  else {
    int v11 = 1;
  }
  int v12 = !v11;
  if (!v10)
  {
    if (v12)
    {
      uint64_t v8 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      v23 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    v24 = [(ACCTransportIOAccessoryBase *)self ioService];
    v15 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
    v25 = 67109634;
    *(_DWORD *)v26 = v24;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = 0;
    *(_WORD *)&v26[10] = 2112;
    *(void *)&v26[12] = v15;
    unsigned int v16 = "ConfigStream for self.ioService %d is open, result = 0x%X (endpointUUID %@)";
    uint64_t v17 = v8;
    v18 = 24;
    goto LABEL_29;
  }
  v13 = v10;
  if (v12)
  {
    uint64_t v8 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v8 = MEMORY[0x263EF8438];
    v20 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
    v25 = 67109378;
    *(_DWORD *)v26 = v13;
    *(_WORD *)&v26[4] = 2112;
    *(void *)&v26[6] = v21;
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: ConfigStream open failed! result %xh (endpointUUID %@)", (uint8_t *)&v25, 0x12u);
  }
  v19 = 0;
LABEL_39:

  return v19;
}

- (void)closeServiceSession
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  io_connect_t ioConnect = self->super._ioConnect;
  if (ioConnect)
  {
    IOServiceClose(ioConnect);
    self->super._io_connect_t ioConnect = 0;
    if (gLogObjects) {
      BOOL v4 = gNumLogObjects < 10;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v8 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      io_service_t v9 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
      int v11 = 138412290;
      int v12 = v9;
      id v10 = "ConfigStream is closed (endpointUUID %@)";
LABEL_22:
      _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 10;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v8 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      io_service_t v9 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
      int v11 = 138412290;
      int v12 = v9;
      id v10 = "ConfigStream is already closed (endpointUUID %@)";
      goto LABEL_22;
    }
  }
}

- (id)_getCategories
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  unsigned int v51 = 8;
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    id v5 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(ACCTransportIOAccessoryConfigStream *)self _getCategories];
  }

  [(ACCTransportIOAccessoryBase *)self ioService];
  int Categories = IOAccessoryConfigStreamInterfaceGetCategories();
  if (gLogObjects && gNumLogObjects >= 10)
  {
    id v7 = *(id *)(gLogObjects + 72);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136317698;
    v53 = "-[ACCTransportIOAccessoryConfigStream _getCategories]";
    __int16 v54 = 1024;
    *(_DWORD *)v55 = v51;
    *(_WORD *)&v55[4] = 2048;
    *(void *)&v55[6] = v87;
    __int16 v56 = 2048;
    *(void *)v57 = *((void *)&v87 + 1);
    *(_WORD *)&v57[8] = 2048;
    *(void *)&v57[10] = v88;
    *(_WORD *)&v57[18] = 2048;
    *(void *)&v57[20] = *((void *)&v88 + 1);
    *(_WORD *)&v57[28] = 2048;
    *(void *)&v57[30] = v89;
    *(_WORD *)&v57[38] = 2048;
    *(void *)&v57[40] = *((void *)&v89 + 1);
    *(_WORD *)&v57[48] = 2048;
    *(void *)&v57[50] = v90;
    *(_WORD *)&v57[58] = 2048;
    *(void *)&v57[60] = *((void *)&v90 + 1);
    *(_WORD *)&v57[68] = 1024;
    *(_DWORD *)&v57[70] = Categories;
    _os_log_debug_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEBUG, "%s: after GetCategories: categoryIDsCount %u. [%llx %llx %llx %llx %llx %llx %llx %llx], ret %x \n", buf, 0x68u);
  }

  if (Categories)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      io_service_t v9 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      io_service_t v9 = MEMORY[0x263EF8438];
      id v33 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      deviceIdentifier = self->_deviceIdentifier;
      *(_DWORD *)buf = 138412546;
      v53 = (const char *)deviceIdentifier;
      __int16 v54 = 1024;
      *(_DWORD *)v55 = Categories;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "Error retrieving categories for deviceIdentifier %@, ret %x \n", buf, 0x12u);
    }
LABEL_67:
    v32 = 0;
  }
  else
  {
    for (unint64_t i = 0; i < v51; ++i)
    {
      int v11 = [NSNumber numberWithUnsignedInt:(unsigned __int16)*((void *)&v87 + i)];
      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
      [v2 setObject:v12 forKey:v11];
    }
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = [v2 allKeys];
    uint64_t v13 = [obj countByEnumeratingWithState:&v47 objects:v86 count:16];
    if (v13)
    {
      uint64_t v15 = v13;
      uint64_t v45 = *(void *)v48;
      *(void *)&long long v14 = 134218240;
      long long v42 = v14;
      v44 = v2;
      while (2)
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v48 != v45) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          [(ACCTransportIOAccessoryBase *)self ioService];
          [v17 unsignedIntValue];
          int CategoryProperties = IOAccessoryConfigStreamInterfaceGetCategoryProperties();
          int v19 = CategoryProperties;
          uint64_t v20 = gLogObjects;
          int v21 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 10)
          {
            v22 = *(id *)(gLogObjects + 72);
          }
          else
          {
            int v23 = CategoryProperties;
            uint64_t v24 = v15;
            v25 = MEMORY[0x263EF8438];
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v42;
              v53 = (const char *)v20;
              __int16 v54 = 1024;
              *(_DWORD *)v55 = v21;
              _os_log_error_impl(&dword_222CE3000, v25, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v26 = v25;
            v22 = v25;
            uint64_t v15 = v24;
            int v19 = v23;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v30 = self->_deviceIdentifier;
            int v31 = [v17 unsignedIntValue];
            *(_DWORD *)buf = 136320258;
            v53 = "-[ACCTransportIOAccessoryConfigStream _getCategories]";
            __int16 v54 = 2112;
            *(void *)v55 = v30;
            *(_WORD *)&v55[8] = 1024;
            *(_DWORD *)&v55[10] = v31;
            __int16 v56 = 1024;
            *(_DWORD *)v57 = 16;
            *(_WORD *)&v57[4] = 2048;
            *(void *)&v57[6] = v78;
            *(_WORD *)&v57[14] = 2048;
            *(void *)&v57[16] = *((void *)&v78 + 1);
            *(_WORD *)&v57[24] = 2048;
            *(void *)&v57[26] = v79;
            *(_WORD *)&v57[34] = 2048;
            *(void *)&v57[36] = *((void *)&v79 + 1);
            *(_WORD *)&v57[44] = 2048;
            *(void *)&v57[46] = v80;
            *(_WORD *)&v57[54] = 2048;
            *(void *)&v57[56] = *((void *)&v80 + 1);
            *(_WORD *)&v57[64] = 2048;
            *(void *)&v57[66] = v81;
            __int16 v58 = 2048;
            uint64_t v59 = *((void *)&v81 + 1);
            __int16 v60 = 2048;
            uint64_t v61 = v82;
            __int16 v62 = 2048;
            uint64_t v63 = *((void *)&v82 + 1);
            __int16 v64 = 2048;
            uint64_t v65 = v83;
            __int16 v66 = 2048;
            uint64_t v67 = *((void *)&v83 + 1);
            __int16 v68 = 2048;
            uint64_t v69 = v84;
            __int16 v70 = 2048;
            uint64_t v71 = *((void *)&v84 + 1);
            __int16 v72 = 2048;
            uint64_t v73 = v85;
            __int16 v74 = 2048;
            uint64_t v75 = *((void *)&v85 + 1);
            __int16 v76 = 1024;
            int v77 = v19;
            _os_log_debug_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEBUG, "%s: after GetCategoryProperties: deviceIdentifier %@, categoryID %04x, propertyIDsCount %u. [%llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx %llx], ret %x \n", buf, 0xC8u);
          }

          if (v19)
          {
            if (gLogObjects && gNumLogObjects >= 10)
            {
              v35 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              v35 = MEMORY[0x263EF8438];
              id v36 = MEMORY[0x263EF8438];
            }
            id v2 = v44;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v37 = self->_deviceIdentifier;
              int v38 = [v17 unsignedIntValue];
              *(_DWORD *)buf = 138412802;
              v53 = (const char *)v37;
              __int16 v54 = 1024;
              *(_DWORD *)v55 = v38;
              *(_WORD *)&v55[4] = 1024;
              *(_DWORD *)&v55[6] = v19;
              _os_log_impl(&dword_222CE3000, v35, OS_LOG_TYPE_DEFAULT, "Error retrieving properties for deviceIdentifier %@, categoryID %04x, ret %x \n", buf, 0x18u);
            }

            if (gLogObjects && gNumLogObjects > 9)
            {
              io_service_t v9 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              io_service_t v9 = MEMORY[0x263EF8438];
              id v39 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
              -[ACCTransportIOAccessoryConfigStream _getCategories]();
            }
            goto LABEL_67;
          }
          id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
          for (unint64_t k = 0; k < 0x10; ++k)
          {
            v29 = [NSNumber numberWithUnsignedInt:(unsigned __int16)*((void *)&v78 + k)];
            [v27 addObject:v29];
          }
          id v2 = v44;
          [v44 setObject:v27 forKey:v17];
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v47 objects:v86 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    v32 = (void *)[v2 copy];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      io_service_t v9 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      io_service_t v9 = MEMORY[0x263EF8438];
      id v41 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[ACCTransportIOAccessoryConfigStream _getCategories]();
    }
  }

  return v32;
}

- (id)_getPropertyData:(unsigned __int8)a3 forCategory:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v30 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  [(ACCTransportIOAccessoryBase *)self ioService];
  int Property = IOAccessoryConfigStreamInterfaceGetProperty();
  if (Property)
  {
    int v8 = Property;
    if (gLogObjects) {
      BOOL v9 = gNumLogObjects < 10;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v10 = MEMORY[0x263EF8438];
    }
    else
    {
      id v12 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      deviceIdentifier = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316162;
      int v19 = "-[ACCTransportIOAccessoryConfigStream _getPropertyData:forCategory:]";
      __int16 v20 = 2112;
      int v21 = deviceIdentifier;
      __int16 v22 = 1024;
      int v23 = v4;
      __int16 v24 = 1024;
      int v25 = v5;
      __int16 v26 = 1024;
      LODWORD(v27) = v8;
      _os_log_debug_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEBUG, "%s: Failed to got property data: device %@, categoryID 0x%04x, propertyID 0x%02x, ret %x \n", buf, 0x28u);
    }
    int v11 = 0;
  }
  else
  {
    int v11 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", __b);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v12 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v16 = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316418;
      int v19 = "-[ACCTransportIOAccessoryConfigStream _getPropertyData:forCategory:]";
      __int16 v20 = 2112;
      int v21 = v16;
      __int16 v22 = 1024;
      int v23 = v4;
      __int16 v24 = 1024;
      int v25 = v5;
      __int16 v26 = 2048;
      uint64_t v27 = 1024;
      __int16 v28 = 2112;
      v29 = v11;
      _os_log_debug_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEBUG, "%s: Got property data: device %@, categoryID 0x%04x, propertyID 0x%02x, dataLen %zu, result %@ \n", buf, 0x36u);
    }
  }

  return v11;
}

- (id)_getStringProperty:(unsigned __int8)a3 forCategory:(unsigned __int16)a4
{
  int v4 = a4;
  int v5 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  memset(__b, 170, sizeof(__b));
  [(ACCTransportIOAccessoryBase *)self ioService];
  int Property = IOAccessoryConfigStreamInterfaceGetProperty();
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 10;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    id v10 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    deviceIdentifier = self->_deviceIdentifier;
    unsigned int v16 = [MEMORY[0x263EFF8F8] dataWithBytes:__b length:1024];
    *(_DWORD *)buf = 136316674;
    __int16 v22 = "-[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:]";
    __int16 v23 = 2112;
    __int16 v24 = deviceIdentifier;
    __int16 v25 = 1024;
    int v26 = v4;
    __int16 v27 = 1024;
    int v28 = v5;
    __int16 v29 = 1024;
    *(_DWORD *)uint64_t v30 = Property;
    *(_WORD *)&v30[4] = 2048;
    *(void *)&v30[6] = 1024;
    *(_WORD *)&v30[14] = 2112;
    *(void *)&v30[16] = v16;
    _os_log_debug_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEBUG, "%s: device %@, categoryID 0x%04x, propertyID 0x%02x, ret %x, dataLen %zu, data = %@ \n", buf, 0x3Cu);
  }
  if (Property)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      int v11 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v11 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316162;
      __int16 v22 = "-[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:]";
      __int16 v23 = 2112;
      __int16 v24 = v17;
      __int16 v25 = 1024;
      int v26 = v4;
      __int16 v27 = 1024;
      int v28 = v5;
      __int16 v29 = 1024;
      *(_DWORD *)uint64_t v30 = Property;
      _os_log_debug_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEBUG, "%s: Failed to get string property: device %@, categoryID 0x%04x, propertyID 0x%02x, ret %x \n", buf, 0x28u);
    }
    id v12 = 0;
  }
  else
  {
    uint8_t __b[1024] = 0;
    id v12 = [NSString stringWithUTF8String:__b];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      int v11 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v11 = MEMORY[0x263EF8438];
      id v14 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = self->_deviceIdentifier;
      *(_DWORD *)buf = 136316418;
      __int16 v22 = "-[ACCTransportIOAccessoryConfigStream _getStringProperty:forCategory:]";
      __int16 v23 = 2112;
      __int16 v24 = v18;
      __int16 v25 = 1024;
      int v26 = v4;
      __int16 v27 = 1024;
      int v28 = v5;
      __int16 v29 = 2048;
      *(void *)uint64_t v30 = 1024;
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = v12;
      _os_log_debug_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEBUG, "%s: Got string property: device %@, categoryID 0x%04x, propertyID 0x%02x, dataLen %zu, result %@ \n", buf, 0x36u);
    }
  }

  return v12;
}

- (void)_checkAccInfo
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_222CE3000, v0, OS_LOG_TYPE_DEBUG, "%s: _deviceIdentifier %@ \n", (uint8_t *)v1, 0x16u);
}

- (void)_registerForInterestNotifications
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "error 0X%X  IOServiceAddInterestNotification", (uint8_t *)v2, 8u);
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  int v4 = NSString;
  int v5 = [(ACCTransportIOAccessoryConfigStream *)self endpointUUID];
  BOOL v6 = [v4 stringWithFormat:@"ConfigStream %@\n", v5];
  [v3 appendFormat:@"%@", v6];

  id v7 = NSString;
  BOOL v8 = [(ACCTransportIOAccessoryConfigStream *)self deviceIdentifier];
  id v9 = [v7 stringWithFormat:@"    deviceIdentifier %@\n", v8];
  [v3 appendFormat:@"%@", v9];

  id v10 = NSString;
  int v11 = [(ACCTransportIOAccessoryConfigStream *)self deviceName];
  id v12 = [v10 stringWithFormat:@"    deviceName %@\n", v11];
  [v3 appendFormat:@"%@", v12];

  id v13 = NSString;
  id v14 = [(ACCTransportIOAccessoryConfigStream *)self deviceManufacturer];
  uint64_t v15 = [v13 stringWithFormat:@"    deviceManufacturer %@\n", v14];
  [v3 appendFormat:@"%@", v15];

  unsigned int v16 = NSString;
  uint64_t v17 = [(ACCTransportIOAccessoryConfigStream *)self deviceModel];
  v18 = [v16 stringWithFormat:@"    deviceModel %@\n", v17];
  [v3 appendFormat:@"%@", v18];

  int v19 = NSString;
  __int16 v20 = [(ACCTransportIOAccessoryConfigStream *)self deviceHardwareVersion];
  int v21 = [v19 stringWithFormat:@"    deviceHardwareVersion %@\n", v20];
  [v3 appendFormat:@"%@", v21];

  __int16 v22 = NSString;
  __int16 v23 = [(ACCTransportIOAccessoryConfigStream *)self deviceFirmwareVersion];
  __int16 v24 = [v22 stringWithFormat:@"    deviceFirmwareVersion %@\n", v23];
  [v3 appendFormat:@"%@", v24];

  __int16 v25 = NSString;
  int v26 = [(ACCTransportIOAccessoryConfigStream *)self deviceSerialNumber];
  __int16 v27 = [v25 stringWithFormat:@"    deviceSerialNumber %@\n", v26];
  [v3 appendFormat:@"%@", v27];

  int v28 = NSString;
  __int16 v29 = [(ACCTransportIOAccessoryConfigStream *)self devicePPID];
  uint64_t v30 = [v28 stringWithFormat:@"    devicePPID %@\n", v29];
  [v3 appendFormat:@"%@", v30];

  uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"    IOService %d\n", -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  [v3 appendFormat:@"%@", v31];

  return v3;
}

- (id)IOAccessoryConfigStreamCopyDataForCategoryID:(unsigned __int16)a3 propertyID:(unsigned __int8)a4
{
  return [(ACCTransportIOAccessoryConfigStream *)self _getPropertyData:a4 forCategory:a3];
}

- (BOOL)IOAccessoryConfigStreamRequestGetPropertyForCategoryID:(unsigned __int16)a3 propertyID:(unsigned __int8)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_requestPending)
  {
    int Property = -536870187;
  }
  else
  {
    int v5 = a4;
    int v6 = a3;
    self->_requestPending = 1;
    self->_requestedCategoryID = a3;
    self->_requestedPropertyID = a4;
    [(ACCTransportIOAccessoryBase *)self ioService];
    int Property = IOAccessoryConfigStreamInterfaceRequestGetProperty();
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 4;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      id v10 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17[0] = 67109632;
      v17[1] = v6;
      __int16 v18 = 1024;
      int v19 = v5;
      __int16 v20 = 1024;
      int v21 = Property;
      _os_log_debug_impl(&dword_222CE3000, v10, OS_LOG_TYPE_DEBUG, "IOAccessoryConfigStreamRequestGetPropertyForCategoryID: called IOAccessoryConfigStreamInterfaceRequestGetProperty, categoryID 0x%x, propertyID %u, ret 0X%X", (uint8_t *)v17, 0x14u);
    }

    if (!Property)
    {
      requestTimer = self->_requestTimer;
      dispatch_time_t v16 = dispatch_time(0, 15000000000);
      dispatch_source_set_timer(requestTimer, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      return 1;
    }
  }
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 4;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessoryConfigStream IOAccessoryConfigStreamRequestGetPropertyForCategoryID:propertyID:](Property, v13);
  }

  return 0;
}

- (BOOL)IOAccessoryConfigStreamSetPropertyData:(id)a3 categoryID:(unsigned __int16)a4 propertyID:(unsigned __int8)a5
{
  int v5 = a5;
  int v6 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  memset(v20, 170, sizeof(v20));
  if ((unint64_t)[v8 length] > 0x400)
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 4;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v15 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v15 = *(id *)(gLogObjects + 24);
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v8 length];
      *(_DWORD *)buf = 134218752;
      *(void *)uint64_t v22 = v16;
      *(_WORD *)&v22[8] = 2048;
      *(void *)__int16 v23 = 1024;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)__int16 v24 = v6;
      *(_WORD *)&v24[4] = 1024;
      int v25 = v5;
      _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "IOAccessoryConfigStreamSetPropertyData: dataLen too large! (%lu > %lu) categoryID 0x%x, propertyID %u", buf, 0x22u);
    }
    goto LABEL_30;
  }
  [v8 getBytes:v20 length:1024];
  uint64_t v9 = [v8 length];
  [(ACCTransportIOAccessoryBase *)self ioService];
  int v10 = IOAccessoryConfigStreamInterfaceSetProperty();
  if (gLogObjects && gNumLogObjects >= 4)
  {
    BOOL v11 = *(id *)(gLogObjects + 24);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v11 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)uint64_t v22 = v6;
    *(_WORD *)&v22[4] = 1024;
    *(_DWORD *)&v22[6] = v5;
    *(_WORD *)__int16 v23 = 2048;
    *(void *)&v23[2] = v9;
    *(_WORD *)__int16 v24 = 1024;
    *(_DWORD *)&v24[2] = v10;
    _os_log_debug_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEBUG, "IOAccessoryConfigStreamSetPropertyData: called IOAccessoryConfigStreamInterfaceSetProperty, categoryID 0x%x, propertyID %u, dataLen %lu, ret 0X%X", buf, 0x1Eu);
  }

  if (v10)
  {
    if (gLogObjects && gNumLogObjects >= 4)
    {
      uint64_t v15 = *(id *)(gLogObjects + 24);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v15 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)uint64_t v22 = v6;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v5;
      *(_WORD *)__int16 v23 = 2048;
      *(void *)&v23[2] = v9;
      *(_WORD *)__int16 v24 = 1024;
      *(_DWORD *)&v24[2] = v10;
      _os_log_error_impl(&dword_222CE3000, v15, OS_LOG_TYPE_ERROR, "IOAccessoryConfigStreamSetPropertyData: Failed call to IOAccessoryConfigStreamInterfaceSetProperty, categoryID 0x%x, propertyID %u, dataLen %lu, error 0X%X", buf, 0x1Eu);
    }
LABEL_30:

    BOOL v17 = 0;
    goto LABEL_31;
  }
  BOOL v17 = 1;
LABEL_31:

  return v17;
}

- (BOOL)transmitData:(id)a3
{
  uint64_t v135 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    id v7 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryConfigStream transmitData:]0();
  }

  if (v4 && self->_categoriesAvailable)
  {
    id v8 = v4;
    uint64_t v9 = (unsigned __int16 *)[v8 bytes];
    unint64_t v10 = [v8 length];
    unint64_t v11 = v10;
    if (v9)
    {
      unint64_t v12 = v10 - 12;
      if (v10 >= 0xC)
      {
        if (gLogObjects && gNumLogObjects >= 10)
        {
          id v13 = *(id *)(gLogObjects + 72);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          id v13 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          endpointUUID = self->_endpointUUID;
          unsigned int ioConnect = self->super._ioConnect;
          int v81 = *v9;
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = endpointUUID;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = ioConnect;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v81;
          *(_WORD *)&buf[24] = 2048;
          *(void *)&buf[26] = v12;
          _os_log_debug_impl(&dword_222CE3000, v13, OS_LOG_TYPE_DEBUG, "ConfigStream: endpointUUID %@, ioConnect %d, transmitData: messageID %d, payloadLen %lu", buf, 0x22u);
        }

        switch(*v9)
        {
          case 1u:
            uint64_t v24 = [(ACCTransportIOAccessoryConfigStream *)self IOAccessoryConfigStreamCopyCategories];
            id v25 = (id)v24;
            if (v24) {
              int v26 = 0;
            }
            else {
              int v26 = -536870212;
            }
            int v97 = v26;
            if (!v24) {
              goto LABEL_140;
            }
            location = &self->_delegate;
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

            if (!WeakRetained) {
              goto LABEL_140;
            }
            __int16 v124 = -21846;
            *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v122 = v28;
            long long v123 = v28;
            long long v120 = v28;
            long long v121 = v28;
            long long v118 = v28;
            long long v119 = v28;
            *(_OWORD *)&buf[32] = v28;
            long long v117 = v28;
            *(_OWORD *)buf = v28;
            *(_OWORD *)&buf[16] = v28;
            id v25 = v25;
            long long v112 = 0u;
            long long v113 = 0u;
            long long v114 = 0u;
            long long v115 = 0u;
            obuint64_t j = [v25 allKeys];
            uint64_t v102 = [obj countByEnumeratingWithState:&v112 objects:&v131 count:16];
            if (v102)
            {
              v93 = self;
              id v94 = v4;
              LODWORD(self) = 0;
              uint64_t v29 = *(void *)v113;
              uint64_t v30 = MEMORY[0x263EF8438];
              v99 = v9;
              id v100 = v25;
              uint64_t v96 = *(void *)v113;
              do
              {
                uint64_t v31 = 0;
                self = (ACCTransportIOAccessoryConfigStream *)(int)self;
                v107 = &buf[20 * (int)self + 6];
                do
                {
                  if (*(void *)v113 != v29) {
                    objc_enumerationMutation(obj);
                  }
                  v106 = *(void **)(*((void *)&v112 + 1) + 8 * v31);
                  uint64_t v32 = objc_msgSend(v25, "objectForKey:");
                  id v33 = (void *)v32;
                  if (v32)
                  {
                    uint64_t v103 = v31;
                    uint64_t v34 = gLogObjects;
                    int v35 = gNumLogObjects;
                    id v36 = (void *)v32;
                    if (gLogObjects) {
                      BOOL v37 = gNumLogObjects < 10;
                    }
                    else {
                      BOOL v37 = 1;
                    }
                    if (v37)
                    {
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v125 = 134218240;
                        *(void *)v126 = v34;
                        *(_WORD *)&v126[8] = 1024;
                        *(_DWORD *)v127 = v35;
                        _os_log_error_impl(&dword_222CE3000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v125, 0x12u);
                      }
                      int v38 = v30;
                      id v39 = v30;
                    }
                    else
                    {
                      id v39 = *(id *)(gLogObjects + 72);
                    }
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                    {
                      int v62 = [v106 unsignedIntValue];
                      *(_DWORD *)v125 = 67109376;
                      *(_DWORD *)v126 = self;
                      *(_WORD *)&v126[4] = 1024;
                      *(_DWORD *)&v126[6] = v62;
                      _os_log_debug_impl(&dword_222CE3000, v39, OS_LOG_TYPE_DEBUG, "ConfigStream _fillCategoryList [%d] categoryID 0x%x", v125, 0xEu);
                    }

                    if ((uint64_t)self > 7)
                    {
                      int v64 = (int)self;
                      if (gLogObjects && gNumLogObjects >= 10)
                      {
                        long long v82 = *(id *)(gLogObjects + 72);
                        self = v93;
                        id v4 = v94;
                      }
                      else
                      {
                        self = v93;
                        id v4 = v94;
                        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                          -[ACCTransportIOAccessoryOOBPairing dealloc]();
                        }
                        long long v82 = MEMORY[0x263EF8438];
                        id v83 = MEMORY[0x263EF8438];
                      }
                      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
                        -[ACCTransportIOAccessoryConfigStream transmitData:].cold.5(v64, v82);
                      }

                      id v25 = v100;
                      goto LABEL_130;
                    }
                    *(_WORD *)&buf[20 * (void)self + 2] = [v106 unsignedIntValue];
                    long long v108 = 0u;
                    long long v109 = 0u;
                    long long v110 = 0u;
                    long long v111 = 0u;
                    id v33 = v36;
                    id v40 = v36;
                    uint64_t v41 = [v40 countByEnumeratingWithState:&v108 objects:v130 count:16];
                    if (!v41)
                    {
                      __int16 v57 = 0;
                      id v25 = v100;
                      goto LABEL_96;
                    }
                    uint64_t v42 = v41;
                    v101 = v36;
                    v104 = self;
                    int v43 = 0;
                    uint64_t v44 = *(void *)v109;
LABEL_65:
                    uint64_t v45 = 0;
                    if (v43 <= 16) {
                      int v46 = 16;
                    }
                    else {
                      int v46 = v43;
                    }
                    uint64_t v47 = (v46 - v43);
                    int v105 = v43;
                    long long v48 = &v107[v43];
                    while (1)
                    {
                      if (*(void *)v109 != v44) {
                        objc_enumerationMutation(v40);
                      }
                      long long v49 = *(void **)(*((void *)&v108 + 1) + 8 * v45);
                      uint64_t v50 = gLogObjects;
                      int v51 = gNumLogObjects;
                      if (!gLogObjects || gNumLogObjects < 10)
                      {
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v125 = 134218240;
                          *(void *)v126 = v50;
                          *(_WORD *)&v126[8] = 1024;
                          *(_DWORD *)v127 = v51;
                          _os_log_error_impl(&dword_222CE3000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v125, 0x12u);
                        }
                        v53 = v30;
                        __int16 v54 = v30;
                      }
                      else
                      {
                        __int16 v54 = *(id *)(gLogObjects + 72);
                      }
                      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                      {
                        int v55 = [v106 unsignedIntValue];
                        int v56 = [v49 unsignedIntValue];
                        *(_DWORD *)v125 = 67109888;
                        *(_DWORD *)v126 = v104;
                        *(_WORD *)&v126[4] = 1024;
                        *(_DWORD *)&v126[6] = v105 + v45;
                        *(_WORD *)v127 = 1024;
                        *(_DWORD *)&v127[2] = v55;
                        __int16 v128 = 1024;
                        int v129 = v56;
                        _os_log_debug_impl(&dword_222CE3000, v54, OS_LOG_TYPE_DEBUG, "ConfigStream _fillCategoryList [%d, %d] categoryID 0x%x, propertyID %d", v125, 0x1Au);
                      }

                      if (v47 == v45) {
                        break;
                      }
                      v48[v45++] = [v49 unsignedIntValue];
                      if (v42 == v45)
                      {
                        int v43 = v105 + v45;
                        uint64_t v42 = [v40 countByEnumeratingWithState:&v108 objects:v130 count:16];
                        if (!v42)
                        {
                          __int16 v57 = v105 + v45;
                          id v25 = v100;
                          self = v104;
                          uint64_t v29 = v96;
                          goto LABEL_95;
                        }
                        goto LABEL_65;
                      }
                    }
                    uint64_t v58 = gLogObjects;
                    int v59 = gNumLogObjects;
                    if (gLogObjects && gNumLogObjects >= 10)
                    {
                      __int16 v60 = *(id *)(gLogObjects + 72);
                      id v25 = v100;
                      self = v104;
                    }
                    else
                    {
                      id v25 = v100;
                      self = v104;
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v125 = 134218240;
                        *(void *)v126 = v58;
                        *(_WORD *)&v126[8] = 1024;
                        *(_DWORD *)v127 = v59;
                        _os_log_error_impl(&dword_222CE3000, v30, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v125, 0x12u);
                      }
                      uint64_t v61 = v30;
                      __int16 v60 = v30;
                    }
                    __int16 v57 = v105 + v45;
                    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                    {
                      int v63 = [v106 unsignedIntValue];
                      *(_DWORD *)v125 = 67109888;
                      *(_DWORD *)v126 = self;
                      *(_WORD *)&v126[4] = 1024;
                      *(_DWORD *)&v126[6] = v63;
                      *(_WORD *)v127 = 1024;
                      *(_DWORD *)&v127[2] = v105 + v45;
                      __int16 v128 = 1024;
                      int v129 = 16;
                      _os_log_error_impl(&dword_222CE3000, v60, OS_LOG_TYPE_ERROR, "ConfigStream _fillCategoryList [%d] categoryID 0x%x, propertyIndex too large!  %d >= %d", v125, 0x1Au);
                    }

                    uint64_t v29 = v96;
LABEL_95:
                    id v33 = v101;
LABEL_96:

                    *(_WORD *)&buf[20 * (void)self + 4] = v57;
                    uint64_t v9 = v99;
                    uint64_t v31 = v103;
                  }
                  self = (ACCTransportIOAccessoryConfigStream *)((char *)self + 1);

                  ++v31;
                  v107 += 20;
                }
                while (v31 != v102);
                uint64_t v102 = [obj countByEnumeratingWithState:&v112 objects:&v131 count:16];
              }
              while (v102);
              LOWORD(v64) = (_WORD)self;
              self = v93;
              id v4 = v94;
            }
            else
            {
              LOWORD(v64) = 0;
            }
LABEL_130:

            *(_WORD *)buf = v64;
            if (gLogObjects && gNumLogObjects >= 10)
            {
              long long v84 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              long long v84 = MEMORY[0x263EF8438];
              id v85 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
              -[ACCTransportIOAccessoryConfigStream transmitData:](v84);
            }

            __int16 v131 = 5;
            int v132 = *(_DWORD *)(v9 + 1);
            __int16 v133 = 162;
            int v134 = v97;
            id v69 = objc_alloc_init(MEMORY[0x263EFF990]);
            [v69 appendBytes:&v131 length:12];
            v86 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:162];
            [v69 appendData:v86];

            p_delegate = location;
            goto LABEL_139;
          case 2u:
            uint64_t v66 = [(ACCTransportIOAccessoryConfigStream *)self IOAccessoryConfigStreamCopyDataForCategoryID:v9[1] propertyID:*((unsigned __int8 *)v9 + 4)];
            id v25 = (id)v66;
            if (v66) {
              int v67 = 0;
            }
            else {
              int v67 = -536870212;
            }
            int v97 = v67;
            if (v66)
            {
              id v68 = objc_loadWeakRetained((id *)&self->_delegate);

              if (v68)
              {
                *(_WORD *)buf = 6;
                *(_DWORD *)&buf[2] = *(_DWORD *)(v9 + 1);
                *(_WORD *)&buf[6] = [v25 length];
                *(_DWORD *)&buf[8] = 0;
                id v69 = objc_alloc_init(MEMORY[0x263EFF990]);
                [v69 appendBytes:buf length:12];
                [v69 appendData:v25];
                p_delegate = &self->_delegate;
LABEL_139:
                id v87 = objc_loadWeakRetained((id *)p_delegate);
                [v87 IOAccessoryConfigStreamMessageArrived:v69 endpointUUID:self->_endpointUUID];
              }
            }
LABEL_140:

            if (v97) {
              goto LABEL_141;
            }
            goto LABEL_144;
          case 3u:
            if ([(ACCTransportIOAccessoryConfigStream *)self IOAccessoryConfigStreamRequestGetPropertyForCategoryID:v9[1] propertyID:*((unsigned __int8 *)v9 + 4)])
            {
              goto LABEL_144;
            }
            *(_WORD *)buf = 6;
            *(_DWORD *)&buf[2] = *(_DWORD *)(v9 + 1);
            *(_WORD *)&buf[6] = 0;
            int v97 = -536870212;
            *(_DWORD *)&buf[8] = -536870212;
            id v71 = objc_alloc_init(MEMORY[0x263EFF990]);
            [v71 appendBytes:buf length:12];
            id v72 = objc_loadWeakRetained((id *)&self->_delegate);
            [v72 IOAccessoryConfigStreamMessageArrived:v71 endpointUUID:self->_endpointUUID];

            goto LABEL_141;
          case 4u:
            uint64_t v73 = [MEMORY[0x263EFF8F8] dataWithBytes:v9 + 6 length:v12];
            BOOL v74 = [(ACCTransportIOAccessoryConfigStream *)self IOAccessoryConfigStreamSetPropertyData:v73 categoryID:v9[1] propertyID:*((unsigned __int8 *)v9 + 4)];

            if (v74)
            {
LABEL_144:
              BOOL v88 = 1;
              goto LABEL_151;
            }
            int v75 = -536870212;
LABEL_119:
            int v97 = v75;
LABEL_141:
            if (gLogObjects && gNumLogObjects >= 10)
            {
              id v14 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              id v14 = MEMORY[0x263EF8438];
              id v89 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              int v91 = *v9;
              v92 = self->_endpointUUID;
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&uint8_t buf[4] = v91;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v92;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v97;
              _os_log_error_impl(&dword_222CE3000, v14, OS_LOG_TYPE_ERROR, "ERROR: configStream messaID %u, endpointUUID %@, error 0x%X", buf, 0x18u);
            }
            goto LABEL_150;
          default:
            if (gLogObjects && gNumLogObjects >= 10)
            {
              uint64_t v65 = *(id *)(gLogObjects + 72);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCTransportIOAccessoryOOBPairing dealloc]();
              }
              uint64_t v65 = MEMORY[0x263EF8438];
              id v76 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              int v77 = *v9;
              long long v78 = self->_endpointUUID;
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v77;
              *(_WORD *)&buf[8] = 2112;
              *(void *)&buf[10] = v78;
              _os_log_impl(&dword_222CE3000, v65, OS_LOG_TYPE_DEFAULT, "ERROR: Invalid messageID (%d) for ConfigStream transmit, endpointUUID %@", buf, 0x12u);
            }

            int v75 = -536870202;
            goto LABEL_119;
        }
      }
    }
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v14 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v14 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = self->_endpointUUID;
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v22;
      id v18 = "ERROR: Not enough bytes (%lu) for message header for ConfigStream transmit, endpointUUID %@";
      int v19 = v14;
      uint32_t v20 = 22;
      goto LABEL_34;
    }
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v14 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v14 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      BOOL categoriesAvailable = self->_categoriesAvailable;
      BOOL v17 = self->_endpointUUID;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = categoriesAvailable;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v4 != 0;
      *(_WORD *)&buf[14] = 2112;
      *(void *)&buf[16] = v17;
      id v18 = "ERROR: Not ready(%d) or no message data(%d) to handle ConfigStream transmit, endpointUUID %@";
      int v19 = v14;
      uint32_t v20 = 24;
LABEL_34:
      _os_log_impl(&dword_222CE3000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
LABEL_150:

  BOOL v88 = 0;
LABEL_151:

  return v88;
}

- (void)handlePropertyDataReceived
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (self->_requestPending)
  {
    dispatch_source_set_timer((dispatch_source_t)self->_requestTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    unsigned __int16 requestedCategoryID = self->_requestedCategoryID;
    __int16 requestedPropertyID = self->_requestedPropertyID;
    BOOL v5 = [(ACCTransportIOAccessoryConfigStream *)self IOAccessoryConfigStreamCopyDataForCategoryID:requestedCategoryID propertyID:self->_requestedPropertyID];
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v6 = *(id *)(gLogObjects + 72);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL requestPending = self->_requestPending;
      int v11 = self->_requestedCategoryID;
      int v12 = self->_requestedPropertyID;
      LODWORD(v19) = 67109890;
      HIDWORD(v19) = requestPending;
      *(_WORD *)uint32_t v20 = 1024;
      *(_DWORD *)&v20[2] = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v5;
      _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "handlePropertyDataReceived: _requestPending %d, _requestedCategoryID 0x%x, _requestedPropertyID %u, propertyData %@", (uint8_t *)&v19, 0x1Eu);
    }

    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained)
      {
        LOWORD(v19) = 6;
        WORD1(v19) = requestedCategoryID;
        WORD2(v19) = requestedPropertyID;
        HIWORD(v19) = [v5 length];
        *(_DWORD *)uint32_t v20 = 0;
        id v14 = objc_alloc_init(MEMORY[0x263EFF990]);
        [v14 appendBytes:&v19 length:12];
        [v14 appendData:v5];
        id v15 = objc_loadWeakRetained((id *)&self->_delegate);
        [v15 IOAccessoryConfigStreamMessageArrived:v14 endpointUUID:self->_endpointUUID];
      }
    }
    self->_BOOL requestPending = 0;
  }
  else
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 10;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v5 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v5 = *(id *)(gLogObjects + 72);
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v16 = self->_requestPending;
      int v17 = self->_requestedCategoryID;
      int v18 = self->_requestedPropertyID;
      LODWORD(v19) = 67109632;
      HIDWORD(v19) = v16;
      *(_WORD *)uint32_t v20 = 1024;
      *(_DWORD *)&v20[2] = v17;
      __int16 v21 = 1024;
      int v22 = v18;
      _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "handlePropertyDataReceived: received without pending request, _requestPending %d, _requestedCategoryID 0x%x, _requestedPropertyID %u", (uint8_t *)&v19, 0x14u);
    }
  }
}

- (NSString)deviceIdentifier
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  deviceIdentifier = self->_deviceIdentifier;
  if (!deviceIdentifier || [(NSString *)deviceIdentifier isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryBase *)self ioService];
    CFint Property = (NSString *)IORegistryEntryCreateCFProperty(v4, @"IOAccessoryConfigStreamIdentifier", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    if (CFProperty)
    {
      id v6 = self->_deviceIdentifier;
      self->_deviceIdentifier = CFProperty;
    }
    if (!self->_deviceIdentifier)
    {
      self->_deviceIdentifier = (NSString *)@"Unknown";
    }
  }
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 10;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)(gLogObjects + 72);
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v10 = self->_deviceIdentifier;
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_INFO, "return _deviceIdentifier: %@", (uint8_t *)&v13, 0xCu);
  }

  int v11 = self->_deviceIdentifier;
  return v11;
}

- (NSString)deviceName
{
  deviceName = self->_deviceName;
  if (!deviceName || [(NSString *)deviceName isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:5 forCategory:0];
    BOOL v5 = self->_deviceName;
    self->_deviceName = v4;

    if (!self->_deviceName)
    {
      self->_deviceName = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceName;
  return v6;
}

- (NSString)deviceManufacturer
{
  deviceManufacturer = self->_deviceManufacturer;
  if (!deviceManufacturer || [(NSString *)deviceManufacturer isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:4 forCategory:0];
    BOOL v5 = self->_deviceManufacturer;
    self->_deviceManufacturer = v4;

    if (!self->_deviceManufacturer)
    {
      self->_deviceManufacturer = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceManufacturer;
  return v6;
}

- (NSString)deviceModel
{
  deviceModel = self->_deviceModel;
  if (!deviceModel || [(NSString *)deviceModel isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:6 forCategory:0];
    BOOL v5 = self->_deviceModel;
    self->_deviceModel = v4;

    if (!self->_deviceModel)
    {
      self->_deviceModel = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceModel;
  return v6;
}

- (NSString)deviceHardwareVersion
{
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (!deviceHardwareVersion
    || [(NSString *)deviceHardwareVersion isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:2 forCategory:0];
    BOOL v5 = self->_deviceHardwareVersion;
    self->_deviceHardwareVersion = v4;

    if (!self->_deviceHardwareVersion)
    {
      self->_deviceHardwareVersion = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceHardwareVersion;
  return v6;
}

- (NSString)deviceFirmwareVersion
{
  deviceFirmwareVersion = self->_deviceFirmwareVersion;
  if (!deviceFirmwareVersion
    || [(NSString *)deviceFirmwareVersion isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:3 forCategory:0];
    BOOL v5 = self->_deviceFirmwareVersion;
    self->_deviceFirmwareVersion = v4;

    if (!self->_deviceFirmwareVersion)
    {
      self->_deviceFirmwareVersion = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceFirmwareVersion;
  return v6;
}

- (NSString)deviceSerialNumber
{
  deviceSerialNumber = self->_deviceSerialNumber;
  if (!deviceSerialNumber || [(NSString *)deviceSerialNumber isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:7 forCategory:0];
    BOOL v5 = self->_deviceSerialNumber;
    self->_deviceSerialNumber = v4;

    if (!self->_deviceSerialNumber)
    {
      self->_deviceSerialNumber = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceSerialNumber;
  return v6;
}

- (NSString)devicePPID
{
  devicePPID = self->_devicePPID;
  if (!devicePPID || [(NSString *)devicePPID isEqualToString:@"Unknown"])
  {
    io_registry_entry_t v4 = [(ACCTransportIOAccessoryConfigStream *)self _getStringProperty:1 forCategory:4096];
    BOOL v5 = self->_devicePPID;
    self->_devicePPID = v4;

    if (!self->_devicePPID)
    {
      self->_devicePPID = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_devicePPID;
  return v6;
}

- (ACCTransportIOAccessoryConfigStreamProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportIOAccessoryConfigStreamProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (void)setDeviceManufacturer:(id)a3
{
}

- (void)setDeviceModel:(id)a3
{
}

- (void)setDeviceHardwareVersion:(id)a3
{
}

- (void)setDeviceFirmwareVersion:(id)a3
{
}

- (void)setDeviceSerialNumber:(id)a3
{
}

- (void)setDevicePPID:(id)a3
{
}

- (NSString)endpointUUID
{
  return self->_endpointUUID;
}

- (void)setEndpointUUID:(id)a3
{
}

- (NSString)parentConnectionUUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentConnectionUUID);
  return (NSString *)WeakRetained;
}

- (void)setParentConnectionUUID:(id)a3
{
}

- (BOOL)categoriesAvailable
{
  return self->_categoriesAvailable;
}

- (void)setCategoriesAvailable:(BOOL)a3
{
  self->_BOOL categoriesAvailable = a3;
}

- (BOOL)requestPending
{
  return self->_requestPending;
}

- (void)setRequestPending:(BOOL)a3
{
  self->_BOOL requestPending = a3;
}

- (unsigned)requestedCategoryID
{
  return self->_requestedCategoryID;
}

- (void)setRequestedCategoryID:(unsigned __int16)a3
{
  self->_unsigned __int16 requestedCategoryID = a3;
}

- (unsigned)requestedPropertyID
{
  return self->_requestedPropertyID;
}

- (void)setRequestedPropertyID:(unsigned __int8)a3
{
  self->___int16 requestedPropertyID = a3;
}

- (BOOL)accInfoValid
{
  return self->_accInfoValid;
}

- (void)setAccInfoValid:(BOOL)a3
{
  self->_accInfoValid = a3;
}

- (OS_dispatch_source)requestTimer
{
  return self->_requestTimer;
}

- (void)setRequestTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestTimer, 0);
  objc_destroyWeak((id *)&self->_parentConnectionUUID);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_devicePPID, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceHardwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_getCategories
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v4 = [a1 ioService];
  uint64_t v5 = a1[9];
  int v6 = 136315650;
  BOOL v7 = "-[ACCTransportIOAccessoryConfigStream _getCategories]";
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_222CE3000, a2, OS_LOG_TYPE_DEBUG, "%s: service %d, call GetCategories for deviceIdentifier %@ \n", (uint8_t *)&v6, 0x1Cu);
}

- (void)IOAccessoryConfigStreamRequestGetPropertyForCategoryID:(int)a1 propertyID:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "IOAccessoryConfigStreamRequestGetPropertyForCategoryID: Failed call to IOAccessoryConfigStreamInterfaceRequestGetProperty, error 0X%X", (uint8_t *)v2, 8u);
}

- (void)transmitData:(os_log_t)log .cold.3(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_debug_impl(&dword_222CE3000, log, OS_LOG_TYPE_DEBUG, "ConfigStream _fillCategoryList success=%d", (uint8_t *)v1, 8u);
}

- (void)transmitData:(int)a1 .cold.5(int a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 8;
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "ConfigStream _fillCategoryList categoryIndex too large!  %d >= %d", (uint8_t *)v2, 0xEu);
}

- (void)transmitData:.cold.10()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x22u);
}

@end