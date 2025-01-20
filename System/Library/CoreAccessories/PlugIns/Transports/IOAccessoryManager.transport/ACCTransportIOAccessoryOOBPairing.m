@interface ACCTransportIOAccessoryOOBPairing
- (ACCTransportIOAccessoryOOBPairing)initWithDelegate:(id)a3 andIOService:(unsigned int)a4;
- (ACCTransportIOAccessoryOOBPairingProtocol)delegate;
- (BOOL)_handleIncomingOOBPairingInfoData:(int)a3;
- (BOOL)openServiceSession;
- (BOOL)supportsType:(int)a3;
- (BOOL)transmitData:(id)a3;
- (NSMutableData)deviceSupportedTypes;
- (NSNumber)devicePlatformID;
- (NSNumber)supports2way;
- (NSString)deviceDockType;
- (NSString)deviceFirmwareRevision;
- (NSString)deviceHardwareRevision;
- (NSString)deviceModelNumber;
- (NSString)deviceName;
- (NSString)deviceSerialNumber;
- (NSString)deviceUID;
- (NSString)deviceVendorName;
- (NSString)endpointUUID;
- (NSString)parentConnectionUUID;
- (id)description;
- (int)_convertOOBPairingTypeFromIOAccessory:(int)a3;
- (int)activeType;
- (void)_checkAccInfo;
- (void)_registerReadCallback;
- (void)closeServiceSession;
- (void)dealloc;
- (void)setActiveType:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceDockType:(id)a3;
- (void)setDeviceFirmwareRevision:(id)a3;
- (void)setDeviceHardwareRevision:(id)a3;
- (void)setDeviceModelNumber:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDevicePlatformID:(id)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setDeviceSupportedTypes:(id)a3;
- (void)setDeviceUID:(id)a3;
- (void)setDeviceVendorName:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setParentConnectionUUID:(id)a3;
- (void)setSupports2way:(id)a3;
@end

@implementation ACCTransportIOAccessoryOOBPairing

- (ACCTransportIOAccessoryOOBPairing)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCTransportIOAccessoryOOBPairing;
  v7 = [(ACCTransportIOAccessoryBase *)&v11 initWithIOAccessoryClass:4 ioService:v4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentConnectionUUID, 0);
    endpointUUID = v8->_endpointUUID;
    v8->_endpointUUID = 0;

    objc_storeWeak((id *)&v8->_delegate, v6);
    v8->super._ioConnect = 0;
    v8->_oobPairingInfoReadBuffer = (char *)malloc_type_malloc(0x400uLL, 0x6BAB4F8uLL);
    v8->_oobPairingInfoReadBufferLength = 1024;
    v8->_oobPairingDataReadBuffer = (char *)malloc_type_malloc(0x400uLL, 0xD991719EuLL);
    v8->_oobPairingDataReadBufferLength = 1024;
    [(ACCTransportIOAccessoryOOBPairing *)v8 _checkAccInfo];
  }

  return v8;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_222CE3000, MEMORY[0x263EF8438], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

- (BOOL)openServiceSession
{
  kern_return_t v10;
  kern_return_t v11;
  id v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  BOOL v17;
  id v18;
  void *v19;
  id v21;
  unsigned int v22;
  int v23;
  unsigned char v24[20];
  uint64_t v25;

  v25 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 8;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint8_t v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    uint8_t v5 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(ACCTransportIOAccessoryBase *)self ioService];
    v7 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
    v23 = 67109378;
    *(_DWORD *)v24 = v6;
    *(_WORD *)&v24[4] = 2112;
    *(void *)&v24[6] = v7;
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "OOBPairing openServiceSession, ioService = %d, endpointUUID %@", (uint8_t *)&v23, 0x12u);
  }
  if (self->super._ioConnect)
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v8 = MEMORY[0x263EF8438];
      v12 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v13 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
    v23 = 138412290;
    *(void *)v24 = v13;
    v14 = "OOB Pairing is already open (endpointUUID %@)";
    v15 = v8;
    v16 = 12;
LABEL_24:
    _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v23, v16);

LABEL_25:
    v17 = 1;
    goto LABEL_35;
  }
  io_service_t v9 = [(ACCTransportIOAccessoryBase *)self ioService];
  v10 = IOServiceOpen(v9, *MEMORY[0x263EF8960], 0, &self->super._ioConnect);
  if (!v10)
  {
    [(ACCTransportIOAccessoryOOBPairing *)self _registerReadCallback];
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v8 = MEMORY[0x263EF8438];
      v21 = MEMORY[0x263EF8438];
    }
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    v22 = [(ACCTransportIOAccessoryBase *)self ioService];
    v13 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
    v23 = 67109634;
    *(_DWORD *)v24 = v22;
    *(_WORD *)&v24[4] = 1024;
    *(_DWORD *)&v24[6] = 0;
    *(_WORD *)&v24[10] = 2112;
    *(void *)&v24[12] = v13;
    v14 = "OOB Pairing for self.ioService %d is open, result = 0x%X (endpointUUID %@)";
    v15 = v8;
    v16 = 24;
    goto LABEL_24;
  }
  objc_super v11 = v10;
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v8 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v8 = MEMORY[0x263EF8438];
    v18 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
    v23 = 67109378;
    *(_DWORD *)v24 = v11;
    *(_WORD *)&v24[4] = 2112;
    *(void *)&v24[6] = v19;
    _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, "ERROR: OOB Pairing open failed! result %xh (endpointUUID %@)", (uint8_t *)&v23, 0x12u);
  }
  v17 = 0;
LABEL_35:

  return v17;
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
      BOOL v4 = gNumLogObjects < 8;
    }
    else {
      BOOL v4 = 1;
    }
    if (v4)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v8 = MEMORY[0x263EF8438];
      id v5 = MEMORY[0x263EF8438];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      io_service_t v9 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
      int v11 = 138412290;
      v12 = v9;
      v10 = "OOB Pairing is closed (endpointUUID %@)";
LABEL_22:
      _os_log_impl(&dword_222CE3000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v6 = gNumLogObjects < 8;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v8 = MEMORY[0x263EF8438];
      id v7 = MEMORY[0x263EF8438];
    }
    else
    {
      v8 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      io_service_t v9 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
      int v11 = 138412290;
      v12 = v9;
      v10 = "OOB Pairing is already closed (endpointUUID %@)";
      goto LABEL_22;
    }
  }
}

- (BOOL)supportsType:(int)a3
{
  if (a3 > 1 || ![(NSMutableData *)self->_deviceSupportedTypes length]) {
    return 0;
  }
  unint64_t v5 = 0;
  do
  {
    int v6 = *(unsigned __int8 *)([(NSMutableData *)self->_deviceSupportedTypes bytes] + v5);
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    ++v5;
  }
  while ([(NSMutableData *)self->_deviceSupportedTypes length] > v5);
  return v7;
}

- (BOOL)_handleIncomingOOBPairingInfoData:(int)a3
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a3 == 1)
    {
      unint64_t v9 = 0x26ABFC000uLL;
      if (gLogObjects) {
        BOOL v10 = gNumLogObjects < 8;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v56 = MEMORY[0x263EF8438];
        id v11 = MEMORY[0x263EF8438];
      }
      else
      {
        v56 = *(id *)(gLogObjects + 56);
      }
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:]0(self);
      }

      p_unsigned int ioConnect = (int *)&self->super._ioConnect;
      if (self->super._ioConnect)
      {
        int v57 = 0;
        p_unint64_t oobPairingDataReadBufferLength = &self->_oobPairingDataReadBufferLength;
        v59 = MEMORY[0x263EF8438];
        while (1)
        {
          *p_unint64_t oobPairingDataReadBufferLength = 1024;
          uint64_t v60 = gLogObjects;
          int v61 = *(_DWORD *)(v9 + 2272);
          if (!gLogObjects || v61 < 8)
          {
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v115 = v60;
              *(_WORD *)&v115[8] = 1024;
              *(_DWORD *)&v115[10] = v61;
              _os_log_error_impl(&dword_222CE3000, v59, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v63 = v59;
            v64 = v59;
          }
          else
          {
            v64 = *(id *)(gLogObjects + 56);
          }
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v82 = *p_oobPairingDataReadBufferLength;
            v83 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
            int v84 = *p_ioConnect;
            *(_DWORD *)buf = 134218498;
            *(void *)v115 = v82;
            *(_WORD *)&v115[8] = 2112;
            *(void *)&v115[10] = v83;
            *(_WORD *)&v115[18] = 1024;
            *(_DWORD *)&v115[20] = v84;
            _os_log_debug_impl(&dword_222CE3000, v64, OS_LOG_TYPE_DEBUG, "read upto %zu bytes for OOB Pairing Data (endpointUUID %@), call IOAccessoryOOBPairingInterfaceGetPairingData, ioConnect %d", buf, 0x1Cu);
          }
          int PairingData = IOAccessoryOOBPairingInterfaceGetPairingData();
          uint64_t v66 = gLogObjects;
          int v67 = *(_DWORD *)(v9 + 2272);
          if (gLogObjects && v67 >= 8)
          {
            v68 = *(id *)(gLogObjects + 56);
          }
          else
          {
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v115 = v66;
              *(_WORD *)&v115[8] = 1024;
              *(_DWORD *)&v115[10] = v67;
              _os_log_error_impl(&dword_222CE3000, v59, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v69 = v59;
            v68 = v59;
          }
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            unint64_t v85 = *p_oobPairingDataReadBufferLength;
            v86 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
            *(_DWORD *)buf = 134218498;
            *(void *)v115 = v85;
            *(_WORD *)&v115[8] = 2112;
            *(void *)&v115[10] = v86;
            *(_WORD *)&v115[18] = 1024;
            *(_DWORD *)&v115[20] = PairingData;
            _os_log_debug_impl(&dword_222CE3000, v68, OS_LOG_TYPE_DEBUG, "read %zu bytes for OOB Pairing Data (endpointUUID %@), result = 0x%X", buf, 0x1Cu);

            unint64_t v9 = 0x26ABFC000;
          }

          if (PairingData) {
            break;
          }
          unint64_t v70 = *p_oobPairingDataReadBufferLength;
          if (!*p_oobPairingDataReadBufferLength) {
            goto LABEL_110;
          }
          uint64_t v71 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
          if (!v71) {
            goto LABEL_110;
          }
          v72 = (void *)v71;
          v73 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
          char v74 = objc_opt_respondsToSelector();

          unint64_t v9 = 0x26ABFC000;
          if (v74)
          {
            *(_WORD *)buf = 5;
            __int16 activeType = self->_activeType;
            id v75 = objc_alloc_init(MEMORY[0x263EFF990]);
            [v75 appendBytes:buf length:2];
            [v75 appendBytes:&activeType length:2];
            [v75 appendBytes:self->_oobPairingDataReadBuffer length:*p_oobPairingDataReadBufferLength];
            v76 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
            v77 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
            [v76 IOAccessoryOOBPairingDataArrived:v75 endpointUUID:v77];

            unint64_t v9 = 0x26ABFC000;
          }
          else
          {
LABEL_110:
            uint64_t v78 = gLogObjects;
            int v79 = *(_DWORD *)(v9 + 2272);
            if (gLogObjects && v79 >= 8)
            {
              v80 = *(id *)(gLogObjects + 56);
            }
            else
            {
              if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(void *)v115 = v78;
                *(_WORD *)&v115[8] = 1024;
                *(_DWORD *)&v115[10] = v79;
                _os_log_error_impl(&dword_222CE3000, v59, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v81 = v59;
              v80 = v59;
            }
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              unint64_t v87 = *p_oobPairingDataReadBufferLength;
              v88 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
              v89 = [(ACCTransportIOAccessoryOOBPairing *)self parentConnectionUUID];
              *(_DWORD *)buf = 134218754;
              *(void *)v115 = v87;
              *(_WORD *)&v115[8] = 2112;
              *(void *)&v115[10] = v88;
              *(_WORD *)&v115[18] = 2112;
              *(void *)&v115[20] = v89;
              *(_WORD *)&v115[28] = 1024;
              int v116 = 0;
              _os_log_error_impl(&dword_222CE3000, v80, OS_LOG_TYPE_ERROR, "received OOB Pairing Data (%zu) but delegate doesn't handle it or no data, endpointUUID %@, parentUUID %@, result %d", buf, 0x26u);

              unint64_t v9 = 0x26ABFC000;
            }
          }
          int v57 = 1;
          if (v70 != 1024) {
            return v57 != 0;
          }
        }
        uint64_t v101 = gLogObjects;
        int v102 = *(_DWORD *)(v9 + 2272);
        if (gLogObjects && v102 >= 8)
        {
          v103 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(void *)v115 = v101;
            *(_WORD *)&v115[8] = 1024;
            *(_DWORD *)&v115[10] = v102;
            _os_log_error_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v103 = MEMORY[0x263EF8438];
          id v106 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        {
          v109 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
          v110 = [(ACCTransportIOAccessoryOOBPairing *)self parentConnectionUUID];
          *(_DWORD *)buf = 138412802;
          *(void *)v115 = v109;
          *(_WORD *)&v115[8] = 2112;
          *(void *)&v115[10] = v110;
          *(_WORD *)&v115[18] = 1024;
          *(_DWORD *)&v115[20] = PairingData;
          _os_log_error_impl(&dword_222CE3000, v103, OS_LOG_TYPE_ERROR, "error reading OOB Pairing Data, endpointUUID %@, parentUUID %@, result %d", buf, 0x1Cu);
        }
        return v57 != 0;
      }
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v95 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v95 = MEMORY[0x263EF8438];
        id v105 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR)) {
        [(ACCTransportIOAccessoryOOBPairing *)p_ioConnect _handleIncomingOOBPairingInfoData:v95];
      }
    }
    else
    {
      if (a3 == 2)
      {
        if (gLogObjects) {
          BOOL v5 = gNumLogObjects < 8;
        }
        else {
          BOOL v5 = 1;
        }
        if (v5)
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v90 = MEMORY[0x263EF8438];
          id v6 = MEMORY[0x263EF8438];
        }
        else
        {
          v90 = *(id *)(gLogObjects + 56);
        }
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG)) {
          -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.4(self);
        }

        [(ACCTransportIOAccessoryBase *)self ioService];
        uint64_t ActivePairingType = IOAccessoryOOBPairingInterfaceGetActivePairingType();
        if (gLogObjects && gNumLogObjects >= 8)
        {
          v92 = *(id *)(gLogObjects + 56);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v92 = MEMORY[0x263EF8438];
          id v93 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG)) {
          [(ACCTransportIOAccessoryOOBPairing *)self _handleIncomingOOBPairingInfoData:v92];
        }

        self->___int16 activeType = [(ACCTransportIOAccessoryOOBPairing *)self _convertOOBPairingTypeFromIOAccessory:ActivePairingType];
        return 1;
      }
      if (gLogObjects) {
        BOOL v12 = gNumLogObjects < 8;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v95 = MEMORY[0x263EF8438];
        id v13 = MEMORY[0x263EF8438];
      }
      else
      {
        v95 = *(id *)(gLogObjects + 56);
      }
      if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
      {
        v96 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
        v97 = [(ACCTransportIOAccessoryOOBPairing *)self parentConnectionUUID];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v115 = a3;
        *(_WORD *)&v115[4] = 2112;
        *(void *)&v115[6] = v96;
        *(_WORD *)&v115[14] = 2112;
        *(void *)&v115[16] = v97;
        _os_log_impl(&dword_222CE3000, v95, OS_LOG_TYPE_DEFAULT, "Wrong OOB Pairing data type (%d), endpointUUID %@, parentUUID %@", buf, 0x1Cu);
      }
    }

    return 0;
  }
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 8;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v14 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    v14 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryOOBPairing _handleIncomingOOBPairingInfoData:].cold.6(self);
  }

  uint64_t v15 = 0;
  p_oobPairingInfoReadBufferLength = &self->_oobPairingInfoReadBufferLength;
  v17 = MEMORY[0x263EF8438];
  while (1)
  {
    unint64_t *p_oobPairingInfoReadBufferLength = 1024;
    uint64_t v18 = gLogObjects;
    int v19 = gNumLogObjects;
    if (gLogObjects) {
      BOOL v20 = gNumLogObjects < 8;
    }
    else {
      BOOL v20 = 1;
    }
    if (v20)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v115 = v18;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v19;
        _os_log_error_impl(&dword_222CE3000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v21 = v17;
      v22 = v17;
    }
    else
    {
      v22 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v44 = *p_oobPairingInfoReadBufferLength;
      v45 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
      unsigned int ioConnect = self->super._ioConnect;
      *(_DWORD *)buf = 134218498;
      *(void *)v115 = v44;
      *(_WORD *)&v115[8] = 2112;
      *(void *)&v115[10] = v45;
      *(_WORD *)&v115[18] = 1024;
      *(_DWORD *)&v115[20] = ioConnect;
      _os_log_debug_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEBUG, "read upto %zu bytes for OOB Pairing Info (endpointUUID %@), call IOAccessoryOOBPairingInterfaceGetPairingInfo, ioConnect %d", buf, 0x1Cu);
    }
    if (!self->super._ioConnect)
    {
      uint64_t v27 = gLogObjects;
      int v28 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v29 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v115 = v27;
          *(_WORD *)&v115[8] = 1024;
          *(_DWORD *)&v115[10] = v28;
          _os_log_error_impl(&dword_222CE3000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v43 = v17;
        v29 = v17;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        unsigned int v51 = self->super._ioConnect;
        v52 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
        [(ACCTransportIOAccessoryOOBPairing *)self parentConnectionUUID];
        v54 = uint64_t v53 = v15;
        unsigned int v55 = [(ACCTransportIOAccessoryBase *)self ioService];
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v115 = v51;
        *(_WORD *)&v115[4] = 2112;
        *(void *)&v115[6] = v52;
        *(_WORD *)&v115[14] = 2112;
        *(void *)&v115[16] = v54;
        *(_WORD *)&v115[24] = 1024;
        *(_DWORD *)&v115[26] = v55;
        _os_log_error_impl(&dword_222CE3000, v29, OS_LOG_TYPE_ERROR, "ERROR: No _ioConnect(%d) while trying to get OOB Pairing Info, endpointUUID %@, parentUUID %@, ioService %d", buf, 0x22u);

        uint64_t v15 = v53;
      }

      uint64_t v31 = 1024;
      goto LABEL_81;
    }
    int PairingInfo = IOAccessoryOOBPairingInterfaceGetPairingInfo();
    uint64_t v24 = gLogObjects;
    int v25 = gNumLogObjects;
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v26 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)v115 = v24;
        *(_WORD *)&v115[8] = 1024;
        *(_DWORD *)&v115[10] = v25;
        _os_log_error_impl(&dword_222CE3000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
      }
      v30 = v17;
      v26 = v17;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v47 = *p_oobPairingInfoReadBufferLength;
      [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
      uint64_t v15 = v111 = v15;
      *(_DWORD *)buf = 134218498;
      *(void *)v115 = v47;
      *(_WORD *)&v115[8] = 2112;
      *(void *)&v115[10] = v15;
      *(_WORD *)&v115[18] = 1024;
      *(_DWORD *)&v115[20] = PairingInfo;
      _os_log_debug_impl(&dword_222CE3000, v26, OS_LOG_TYPE_DEBUG, "read %zu bytes for OOB Pairing Info (endpointUUID %@), result = 0x%X", buf, 0x1Cu);

      LOBYTE(v15) = v111;
    }

    if (PairingInfo) {
      break;
    }
    uint64_t v31 = *p_oobPairingInfoReadBufferLength;
    uint64_t v32 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
    if (v32
      && (v33 = (void *)v32,
          [(ACCTransportIOAccessoryOOBPairing *)self delegate],
          v34 = objc_claimAutoreleasedReturnValue(),
          char v35 = objc_opt_respondsToSelector(),
          v34,
          v33,
          (v35 & 1) != 0))
    {
      *(_WORD *)buf = 4;
      __int16 activeType = self->_activeType;
      id v36 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v36 appendBytes:buf length:2];
      [v36 appendBytes:&activeType length:2];
      [v36 appendBytes:self->_oobPairingInfoReadBuffer length:*p_oobPairingInfoReadBufferLength];
      v37 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
      v38 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
      [v37 IOAccessoryOOBPairingInfoArrived:v36 endpointUUID:v38];
    }
    else
    {
      uint64_t v39 = gLogObjects;
      int v40 = gNumLogObjects;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v41 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)v115 = v39;
          *(_WORD *)&v115[8] = 1024;
          *(_DWORD *)&v115[10] = v40;
          _os_log_error_impl(&dword_222CE3000, v17, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v42 = v17;
        v41 = v17;
      }
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        unint64_t oobPairingDataReadBufferLength = self->_oobPairingDataReadBufferLength;
        v49 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
        v50 = [(ACCTransportIOAccessoryOOBPairing *)self parentConnectionUUID];
        *(_DWORD *)buf = 134218754;
        *(void *)v115 = oobPairingDataReadBufferLength;
        *(_WORD *)&v115[8] = 2112;
        *(void *)&v115[10] = v49;
        *(_WORD *)&v115[18] = 2112;
        *(void *)&v115[20] = v50;
        *(_WORD *)&v115[28] = 1024;
        int v116 = 0;
        _os_log_error_impl(&dword_222CE3000, v41, OS_LOG_TYPE_ERROR, "received OOB Pairing Info (%zu) but delegate doesn't handle it, endpointUUID %@, parentUUID %@, result = %02x", buf, 0x26u);
      }
    }
    uint64_t v15 = 1;
LABEL_81:
    if (v31 != 1024) {
      return v15;
    }
  }
  uint64_t v98 = gLogObjects;
  int v99 = gNumLogObjects;
  if (gLogObjects && gNumLogObjects >= 8)
  {
    v100 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)v115 = v98;
      *(_WORD *)&v115[8] = 1024;
      *(_DWORD *)&v115[10] = v99;
      _os_log_error_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
    }
    v100 = MEMORY[0x263EF8438];
    id v104 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
  {
    v107 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
    v108 = [(ACCTransportIOAccessoryOOBPairing *)self parentConnectionUUID];
    *(_DWORD *)buf = 138412802;
    *(void *)v115 = v107;
    *(_WORD *)&v115[8] = 2112;
    *(void *)&v115[10] = v108;
    *(_WORD *)&v115[18] = 1024;
    *(_DWORD *)&v115[20] = PairingInfo;
    _os_log_error_impl(&dword_222CE3000, v100, OS_LOG_TYPE_ERROR, "error reading OOB Pairing Info, endpointUUID %@, parentUUID %@, result = %02x", buf, 0x1Cu);
  }
  return v15;
}

- (void)_registerReadCallback
{
}

- (void)_checkAccInfo
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  [(ACCTransportIOAccessoryBase *)self ioService];
  BOOL v3 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceVendorName();
  deviceVendorName = self->_deviceVendorName;
  self->_deviceVendorName = v3;

  if (!self->_deviceVendorName)
  {
    self->_deviceVendorName = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  BOOL v5 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceName();
  deviceName = self->_deviceName;
  self->_deviceName = v5;

  if (!self->_deviceName)
  {
    self->_deviceName = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  BOOL v7 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber();
  deviceModelNumber = self->_deviceModelNumber;
  self->_deviceModelNumber = v7;

  if (!self->_deviceModelNumber)
  {
    self->_deviceModelNumber = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  unint64_t v9 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision();
  deviceHardwareRevision = self->_deviceHardwareRevision;
  self->_deviceHardwareRevision = v9;

  if (!self->_deviceHardwareRevision)
  {
    self->_deviceHardwareRevision = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  id v11 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision();
  deviceFirmwareRevision = self->_deviceFirmwareRevision;
  self->_deviceFirmwareRevision = v11;

  if (!self->_deviceFirmwareRevision)
  {
    self->_deviceFirmwareRevision = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  id v13 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber();
  deviceSerialNumber = self->_deviceSerialNumber;
  self->_deviceSerialNumber = v13;

  if (!self->_deviceSerialNumber)
  {
    self->_deviceSerialNumber = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  uint64_t v15 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceDockType();
  deviceDockType = self->_deviceDockType;
  self->_deviceDockType = v15;

  if (!self->_deviceDockType)
  {
    self->_deviceDockType = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  SupportedPairingTypes = (NSMutableData *)IOAccessoryOOBPairingInterfaceGetSupportedPairingTypes();
  deviceSupportedTypes = self->_deviceSupportedTypes;
  self->_deviceSupportedTypes = SupportedPairingTypes;

  if (!self->_deviceSupportedTypes)
  {
    int v19 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    BOOL v20 = self->_deviceSupportedTypes;
    self->_deviceSupportedTypes = v19;
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  self->_int activeType = [(ACCTransportIOAccessoryOOBPairing *)self _convertOOBPairingTypeFromIOAccessory:IOAccessoryOOBPairingInterfaceGetActivePairingType()];
  [(ACCTransportIOAccessoryBase *)self ioService];
  [NSNumber numberWithBool:IOAccessoryOOBPairingInterfaceSupports2Way() != 0];
  v21 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  supports2way = self->_supports2way;
  self->_supports2way = v21;

  [(ACCTransportIOAccessoryBase *)self ioService];
  v23 = [NSNumber numberWithUnsignedLongLong:IOAccessoryOOBPairingInterfaceCopyDevicePlatformID()];
  devicePlatformID = self->_devicePlatformID;
  self->_devicePlatformID = v23;

  if (gLogObjects && gNumLogObjects >= 8)
  {
    int v25 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v25 = MEMORY[0x263EF8438];
    id v26 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    unsigned int v27 = [(ACCTransportIOAccessoryBase *)self ioService];
    uint64_t v28 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
    v29 = self->_deviceVendorName;
    v30 = self->_deviceName;
    uint64_t v31 = self->_deviceModelNumber;
    uint64_t v32 = self->_deviceHardwareRevision;
    v33 = self->_deviceFirmwareRevision;
    v34 = self->_deviceSerialNumber;
    char v35 = self->_deviceDockType;
    id v36 = self->_deviceSupportedTypes;
    int activeType = self->_activeType;
    v38 = self->_supports2way;
    uint64_t v39 = self->_devicePlatformID;
    *(_DWORD *)buf = 136318722;
    v42 = "-[ACCTransportIOAccessoryOOBPairing _checkAccInfo]";
    __int16 v43 = 1024;
    int v44 = 437;
    __int16 v45 = 1024;
    unsigned int v46 = v27;
    __int16 v47 = 2112;
    uint64_t v48 = v28;
    int v40 = (void *)v28;
    __int16 v49 = 2112;
    v50 = v29;
    __int16 v51 = 2112;
    v52 = v30;
    __int16 v53 = 2112;
    v54 = v31;
    __int16 v55 = 2112;
    v56 = v32;
    __int16 v57 = 2112;
    v58 = v33;
    __int16 v59 = 2112;
    uint64_t v60 = v34;
    __int16 v61 = 2112;
    v62 = v35;
    __int16 v63 = 2112;
    v64 = v36;
    __int16 v65 = 1024;
    int v66 = activeType;
    __int16 v67 = 2112;
    v68 = v38;
    __int16 v69 = 2112;
    unint64_t v70 = v39;
    _os_log_impl(&dword_222CE3000, v25, OS_LOG_TYPE_INFO, "%s:%d ioService = %d, endpointUUID %@, vendorName %@, name %@, model %@, hwRev %@, fwRev %@, ser %@, dock %@, supported %@, active %d, 2way %@, platformID %@", buf, 0x8Cu);
  }
}

- (int)_convertOOBPairingTypeFromIOAccessory:(int)a3
{
  if (a3 == 1) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)transmitData:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    BOOL v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v7 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportIOAccessoryOOBPairing transmitData:].cold.7();
  }

  if (!v4) {
    goto LABEL_68;
  }
  id v8 = v4;
  unint64_t v9 = (unsigned __int16 *)[v8 bytes];
  unint64_t v10 = [v8 length];
  unint64_t v11 = v10;
  if (!v9 || (unint64_t v12 = v10 - 4, v10 < 4))
  {
    if (gLogObjects && gNumLogObjects >= 8)
    {
      v16 = *(id *)(gLogObjects + 56);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v16 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      endpointUUID = self->_endpointUUID;
      int v35 = 134218242;
      *(void *)id v36 = v11;
      *(_WORD *)&v36[8] = 2112;
      *(void *)&v36[10] = endpointUUID;
      _os_log_impl(&dword_222CE3000, v16, OS_LOG_TYPE_DEFAULT, "ERROR: Not enough bytes (%lu) for message header for OOBPairing transmit, endpointUUID %@", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_67;
  }
  unsigned int v13 = *v9;
  if (v13 >= 2)
  {
    int v14 = v9[1];
    if (![(ACCTransportIOAccessoryOOBPairing *)self supportsType:v9[1]])
    {
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v22 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v22 = MEMORY[0x263EF8438];
        id v26 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v27 = self->_endpointUUID;
        int v35 = 67109378;
        *(_DWORD *)id v36 = v14;
        *(_WORD *)&v36[4] = 2112;
        *(void *)&v36[6] = v27;
        uint64_t v28 = "ERROR: PairingType (%d) not supported for OOBPairing transmit, endpointUUID %@";
LABEL_57:
        _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v35, 0x12u);
      }
LABEL_58:

LABEL_59:
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v16 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v16 = MEMORY[0x263EF8438];
        id v31 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing transmitData:]();
      }
LABEL_67:

LABEL_68:
      BOOL v25 = 0;
      goto LABEL_69;
    }
  }
  if (gLogObjects && gNumLogObjects >= 8)
  {
    uint64_t v15 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v15 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v33 = self->_endpointUUID;
    unsigned int ioConnect = self->super._ioConnect;
    int v35 = 138413058;
    *(void *)id v36 = v33;
    *(_WORD *)&v36[8] = 1024;
    *(_DWORD *)&v36[10] = ioConnect;
    *(_WORD *)&v36[14] = 1024;
    *(_DWORD *)&v36[16] = v13;
    __int16 v37 = 2048;
    unint64_t v38 = v12;
    _os_log_debug_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEBUG, "OOBPairing: endpointUUID %@, ioConnect %d, transmitData: messageID %d, payloadLen %lu", (uint8_t *)&v35, 0x22u);
  }

  switch(v13)
  {
    case 0u:
      BOOL v20 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
      char v21 = [v20 IOAccessoryOOBPairingDataStartedForEndpointUUID:self->_endpointUUID];
      goto LABEL_38;
    case 1u:
      BOOL v20 = [(ACCTransportIOAccessoryOOBPairing *)self delegate];
      char v21 = [v20 IOAccessoryOOBPairingDataFinishedForEndpointUUID:self->_endpointUUID];
LABEL_38:
      char v23 = v21;

      if ((v23 & 1) == 0) {
        goto LABEL_59;
      }
      goto LABEL_43;
    case 2u:
      int v24 = IOAccessoryOOBPairingInterfaceSendPairingInfo();
      goto LABEL_42;
    case 3u:
      int v24 = IOAccessoryOOBPairingInterfaceSendPairingData();
LABEL_42:
      if (v24) {
        goto LABEL_59;
      }
LABEL_43:
      BOOL v25 = 1;
      break;
    default:
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v22 = *(id *)(gLogObjects + 56);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v22 = MEMORY[0x263EF8438];
        id v29 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_58;
      }
      v30 = self->_endpointUUID;
      int v35 = 67109378;
      *(_DWORD *)id v36 = v13;
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = v30;
      uint64_t v28 = "ERROR: Invalid messageID (%d) for OOBPairing transmit, endpointUUID %@";
      goto LABEL_57;
  }
LABEL_69:

  return v25;
}

- (id)description
{
  int v3 = [MEMORY[0x263F089D8] string];
  id v4 = NSString;
  BOOL v5 = [(ACCTransportIOAccessoryOOBPairing *)self endpointUUID];
  id v6 = [v4 stringWithFormat:@"OOBPairing %@\n", v5];
  [v3 appendFormat:@"%@", v6];

  BOOL v7 = NSString;
  id v8 = [(ACCTransportIOAccessoryOOBPairing *)self deviceVendorName];
  unint64_t v9 = [v7 stringWithFormat:@"    deviceVendorName %@\n", v8];
  [v3 appendFormat:@"%@", v9];

  unint64_t v10 = NSString;
  unint64_t v11 = [(ACCTransportIOAccessoryOOBPairing *)self deviceName];
  unint64_t v12 = [v10 stringWithFormat:@"    deviceName %@\n", v11];
  [v3 appendFormat:@"%@", v12];

  unsigned int v13 = NSString;
  int v14 = [(ACCTransportIOAccessoryOOBPairing *)self deviceModelNumber];
  uint64_t v15 = [v13 stringWithFormat:@"    deviceModelNumber %@\n", v14];
  [v3 appendFormat:@"%@", v15];

  v16 = NSString;
  id v17 = [(ACCTransportIOAccessoryOOBPairing *)self deviceHardwareRevision];
  uint64_t v18 = [v16 stringWithFormat:@"    deviceHardwareRevision %@\n", v17];
  [v3 appendFormat:@"%@", v18];

  id v19 = NSString;
  BOOL v20 = [(ACCTransportIOAccessoryOOBPairing *)self deviceFirmwareRevision];
  char v21 = [v19 stringWithFormat:@"    deviceFirmwareRevision %@\n", v20];
  [v3 appendFormat:@"%@", v21];

  v22 = NSString;
  char v23 = [(ACCTransportIOAccessoryOOBPairing *)self deviceSerialNumber];
  int v24 = [v22 stringWithFormat:@"    deviceSerialNumber %@\n", v23];
  [v3 appendFormat:@"%@", v24];

  BOOL v25 = NSString;
  id v26 = [(ACCTransportIOAccessoryOOBPairing *)self deviceDockType];
  unsigned int v27 = [v25 stringWithFormat:@"    deviceDockType %@\n", v26];
  [v3 appendFormat:@"%@", v27];

  uint64_t v28 = NSString;
  id v29 = [(ACCTransportIOAccessoryOOBPairing *)self deviceUID];
  v30 = [v28 stringWithFormat:@"    deviceUID %@\n", v29];
  [v3 appendFormat:@"%@", v30];

  id v31 = NSString;
  uint64_t v32 = [(ACCTransportIOAccessoryOOBPairing *)self deviceSupportedTypes];
  v33 = [v31 stringWithFormat:@"    deviceSupportedTypes %@\n", v32];
  [v3 appendFormat:@"%@", v33];

  v34 = objc_msgSend(NSString, "stringWithFormat:", @"    activeType %d\n", -[ACCTransportIOAccessoryOOBPairing activeType](self, "activeType"));
  [v3 appendFormat:@"%@", v34];

  int v35 = NSString;
  id v36 = [(ACCTransportIOAccessoryOOBPairing *)self supports2way];
  __int16 v37 = [v35 stringWithFormat:@"    Supports2Way %@\n", v36];
  [v3 appendFormat:@"%@", v37];

  unint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"    IOService %d\n", -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  [v3 appendFormat:@"%@", v38];

  return v3;
}

- (NSString)deviceVendorName
{
  deviceVendorName = self->_deviceVendorName;
  if (!deviceVendorName || [(NSString *)deviceVendorName isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceVendorName();
    BOOL v5 = self->_deviceVendorName;
    self->_deviceVendorName = v4;

    if (!self->_deviceVendorName)
    {
      self->_deviceVendorName = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceVendorName;
  return v6;
}

- (NSString)deviceName
{
  deviceName = self->_deviceName;
  if (!deviceName || [(NSString *)deviceName isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceName();
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

- (NSString)deviceModelNumber
{
  deviceModelNumber = self->_deviceModelNumber;
  if (!deviceModelNumber || [(NSString *)deviceModelNumber isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceModelNumber();
    BOOL v5 = self->_deviceModelNumber;
    self->_deviceModelNumber = v4;

    if (!self->_deviceModelNumber)
    {
      self->_deviceModelNumber = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceModelNumber;
  return v6;
}

- (NSString)deviceHardwareRevision
{
  deviceHardwareRevision = self->_deviceHardwareRevision;
  if (!deviceHardwareRevision
    || [(NSString *)deviceHardwareRevision isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceHardwareRevision();
    BOOL v5 = self->_deviceHardwareRevision;
    self->_deviceHardwareRevision = v4;

    if (!self->_deviceHardwareRevision)
    {
      self->_deviceHardwareRevision = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceHardwareRevision;
  return v6;
}

- (NSString)deviceFirmwareRevision
{
  deviceFirmwareRevision = self->_deviceFirmwareRevision;
  if (!deviceFirmwareRevision
    || [(NSString *)deviceFirmwareRevision isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceFirmwareRevision();
    BOOL v5 = self->_deviceFirmwareRevision;
    self->_deviceFirmwareRevision = v4;

    if (!self->_deviceFirmwareRevision)
    {
      self->_deviceFirmwareRevision = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceFirmwareRevision;
  return v6;
}

- (NSString)deviceSerialNumber
{
  deviceSerialNumber = self->_deviceSerialNumber;
  if (!deviceSerialNumber || [(NSString *)deviceSerialNumber isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceSerialNumber();
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

- (NSString)deviceDockType
{
  deviceDockType = self->_deviceDockType;
  if (!deviceDockType || [(NSString *)deviceDockType isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryOOBPairingInterfaceCopyDeviceDockType();
    BOOL v5 = self->_deviceDockType;
    self->_deviceDockType = v4;

    if (!self->_deviceDockType)
    {
      self->_deviceDockType = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_deviceDockType;
  return v6;
}

- (NSString)deviceUID
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  deviceUID = self->_deviceUID;
  if (deviceUID && ![(NSString *)deviceUID isEqualToString:@"Unknown"]) {
    goto LABEL_26;
  }
  [(ACCTransportIOAccessoryBase *)self upstreamManagerService];
  id v4 = (NSString *)IOAccessoryManagerCopyAccessoryDeviceUID();
  if (!v4)
  {
    if (gLogObjects) {
      BOOL v7 = gNumLogObjects < 8;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      unint64_t v11 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    else
    {
      unint64_t v11 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_DEFAULT, "ERROR: IOAccessoryManagerCopyAccessoryDeviceUID failed", (uint8_t *)&v19, 2u);
    }

    goto LABEL_25;
  }
  BOOL v5 = self->_deviceUID;
  self->_deviceUID = v4;

  if (gLogObjects && gNumLogObjects >= 8)
  {
    id v6 = *(id *)(gLogObjects + 56);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v10 = self->_deviceUID;
    int v19 = 138412290;
    BOOL v20 = v10;
    _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_INFO, "from IOAccessoryManagerCopyAccessoryDeviceUID, _deviceUID: %@", (uint8_t *)&v19, 0xCu);
  }

  if (!self->_deviceUID)
  {
LABEL_25:
    unint64_t v12 = self->_deviceUID;
    self->_deviceUID = (NSString *)@"Unknown";
  }
LABEL_26:
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 8;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    uint64_t v15 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v15 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = self->_deviceUID;
    int v19 = 138412290;
    BOOL v20 = v16;
    _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_INFO, "return _deviceUID: %@", (uint8_t *)&v19, 0xCu);
  }

  id v17 = self->_deviceUID;
  return v17;
}

- (NSNumber)devicePlatformID
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!self->_devicePlatformID)
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    int v3 = [NSNumber numberWithUnsignedLongLong:IOAccessoryOOBPairingInterfaceCopyDevicePlatformID()];
    devicePlatformID = self->_devicePlatformID;
    self->_devicePlatformID = v3;

    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 8;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      BOOL v7 = *(id *)(gLogObjects + 56);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = self->_devicePlatformID;
      int v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_INFO, "from IOAccessoryOOBPairingInterfaceCopyDevicePlatformID, _devicePlatformID: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    unint64_t v11 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    unint64_t v11 = *(id *)(gLogObjects + 56);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    unint64_t v12 = self->_devicePlatformID;
    int v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_222CE3000, v11, OS_LOG_TYPE_INFO, "return _devicePlatformID: %@", (uint8_t *)&v15, 0xCu);
  }

  BOOL v13 = self->_devicePlatformID;
  return v13;
}

- (NSMutableData)deviceSupportedTypes
{
  deviceSupportedTypes = self->_deviceSupportedTypes;
  if (!deviceSupportedTypes)
  {
    id v4 = (NSMutableData *)objc_alloc_init(MEMORY[0x263EFF990]);
    BOOL v5 = self->_deviceSupportedTypes;
    self->_deviceSupportedTypes = v4;

    deviceSupportedTypes = self->_deviceSupportedTypes;
  }
  return deviceSupportedTypes;
}

- (NSNumber)supports2way
{
  supports2way = self->_supports2way;
  if (!supports2way)
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    [NSNumber numberWithBool:IOAccessoryOOBPairingInterfaceSupports2Way() != 0];
    id v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = self->_supports2way;
    self->_supports2way = v4;

    supports2way = self->_supports2way;
  }
  return supports2way;
}

- (ACCTransportIOAccessoryOOBPairingProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportIOAccessoryOOBPairingProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDeviceVendorName:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (void)setDeviceModelNumber:(id)a3
{
}

- (void)setDeviceHardwareRevision:(id)a3
{
}

- (void)setDeviceFirmwareRevision:(id)a3
{
}

- (void)setDeviceSerialNumber:(id)a3
{
}

- (void)setDeviceDockType:(id)a3
{
}

- (void)setDeviceUID:(id)a3
{
}

- (void)setDevicePlatformID:(id)a3
{
}

- (void)setDeviceSupportedTypes:(id)a3
{
}

- (int)activeType
{
  return self->_activeType;
}

- (void)setActiveType:(int)a3
{
  self->_int activeType = a3;
}

- (void)setSupports2way:(id)a3
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentConnectionUUID);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_supports2way, 0);
  objc_storeStrong((id *)&self->_deviceSupportedTypes, 0);
  objc_storeStrong((id *)&self->_devicePlatformID, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_deviceDockType, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceHardwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceVendorName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleIncomingOOBPairingInfoData:(NSObject *)a3 .cold.2(_DWORD *a1, int a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = [a1 endpointUUID];
  int v7 = a1[22];
  int v8 = 138412802;
  BOOL v9 = v6;
  __int16 v10 = 1024;
  int v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2;
  _os_log_debug_impl(&dword_222CE3000, a3, OS_LOG_TYPE_DEBUG, "notified of active OOB Pairing Type (endpointUUID %@), %d -> %d", (uint8_t *)&v8, 0x18u);
}

- (void)_handleIncomingOOBPairingInfoData:(void *)a1 .cold.4(void *a1)
{
  uint64_t v2 = [a1 endpointUUID];
  [a1 ioService];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_222CE3000, v3, v4, "notified of active OOB Pairing Type (endpointUUID %@), call IOAccessoryOOBPairingInterfaceGetActivePairingType, ioService %d", v5, v6, v7, v8, v9);
}

- (void)_handleIncomingOOBPairingInfoData:(void *)a1 .cold.6(void *a1)
{
  uint64_t v2 = [a1 endpointUUID];
  [a1 ioService];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_222CE3000, v3, v4, "notified of available OOB Pairing info (endpointUUID %@), ioService %d", v5, v6, v7, v8, v9);
}

- (void)_handleIncomingOOBPairingInfoData:(NSObject *)a3 .cold.8(int *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = *a1;
  uint64_t v6 = [a2 endpointUUID];
  uint64_t v7 = [a2 parentConnectionUUID];
  v8[0] = 67109890;
  v8[1] = v5;
  __int16 v9 = 2112;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  __int16 v12 = v7;
  __int16 v13 = 1024;
  int v14 = [a2 ioService];
  _os_log_error_impl(&dword_222CE3000, a3, OS_LOG_TYPE_ERROR, "ERROR: No _ioConnect(%d) while trying to get OOB Pairing Data, endpointUUID %@, parentUUID %@, ioService %d", (uint8_t *)v8, 0x22u);
}

- (void)_handleIncomingOOBPairingInfoData:(void *)a1 .cold.10(void *a1)
{
  uint64_t v2 = [a1 endpointUUID];
  [a1 ioService];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_222CE3000, v3, v4, "notified of available OOB Pairing Data (endpointUUID %@), ioService %d", v5, v6, v7, v8, v9);
}

- (void)transmitData:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  int v3 = v0;
  _os_log_error_impl(&dword_222CE3000, v1, OS_LOG_TYPE_ERROR, "ERROR: send OOB pairing data, endpointUUID %@, error 0x%X", v2, 0x12u);
}

- (void)transmitData:.cold.7()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  int v4 = v0;
  __int16 v5 = 2112;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_222CE3000, v2, OS_LOG_TYPE_DEBUG, "OOBPairing: endpointUUID %@, ioConnect %d, transmitData: %@", v3, 0x1Cu);
}

@end