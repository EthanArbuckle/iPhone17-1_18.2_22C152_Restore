@interface ACCTransportIOAccessoryEA
- (ACCTransportIOAccessoryEA)initWithDelegate:(id)a3 andIOService:(unsigned int)a4;
- (ACCTransportIOAccessoryEAProtocol)delegate;
- (BOOL)_handleIncomingEAData;
- (BOOL)openEAServiceSession;
- (BOOL)sessionOpen;
- (BOOL)transmitData:(id)a3;
- (NSString)deviceDockType;
- (NSString)deviceFirmwareRevision;
- (NSString)deviceHardwareRevision;
- (NSString)deviceModelNumber;
- (NSString)deviceName;
- (NSString)deviceSerialNumber;
- (NSString)deviceVendorName;
- (NSString)eaProtocol;
- (NSString)endpointUUID;
- (NSString)parentConnectionUUID;
- (id)description;
- (void)_checkEAInfo;
- (void)_handleIncomingEAData;
- (void)_registerEAReadCallback;
- (void)closeEAServiceSession;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDeviceDockType:(id)a3;
- (void)setDeviceFirmwareRevision:(id)a3;
- (void)setDeviceHardwareRevision:(id)a3;
- (void)setDeviceModelNumber:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceSerialNumber:(id)a3;
- (void)setDeviceVendorName:(id)a3;
- (void)setEaProtocol:(id)a3;
- (void)setEndpointUUID:(id)a3;
- (void)setParentConnectionUUID:(id)a3;
@end

@implementation ACCTransportIOAccessoryEA

- (ACCTransportIOAccessoryEA)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACCTransportIOAccessoryEA;
  v7 = [(ACCTransportIOAccessoryBase *)&v11 initWithIOAccessoryClass:2 ioService:v4];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentConnectionUUID, 0);
    endpointUUID = v8->_endpointUUID;
    v8->_endpointUUID = 0;

    v8->_sessionOpen = 0;
    objc_storeWeak((id *)&v8->_delegate, v6);
    [(ACCTransportIOAccessoryEA *)v8 _checkEAInfo];
    v8->_eaDataReadBuffer = (char *)malloc_type_malloc(0x400uLL, 0x98873154uLL);
    v8->_eaDataReadBufferDataLength = 1024;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 6;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v5 = MEMORY[0x263EF8438];
    id v4 = MEMORY[0x263EF8438];
  }
  else
  {
    v5 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v8 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "deallocing EA service %d", buf, 8u);
  }

  [(ACCTransportIOAccessoryEA *)self closeEAServiceSession];
  objc_storeWeak((id *)&self->_delegate, 0);
  free(self->_eaDataReadBuffer);
  v6.receiver = self;
  v6.super_class = (Class)ACCTransportIOAccessoryEA;
  [(ACCTransportIOAccessoryBase *)&v6 dealloc];
}

- (BOOL)openEAServiceSession
{
  kern_return_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  unsigned char v20[10];
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x263EF8340];
  if ([(ACCTransportIOAccessoryEA *)self sessionOpen])
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 6;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      uint64_t v9 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v9 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
      objc_super v11 = [(ACCTransportIOAccessoryEA *)self endpointUUID];
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      *(void *)v20 = v11;
      _os_log_impl(&dword_222CE3000, v9, OS_LOG_TYPE_DEFAULT, "EA session for protocol %@ is already open (endpointUUID %@)", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    io_service_t v5 = [(ACCTransportIOAccessoryBase *)self ioService];
    objc_super v6 = IOServiceOpen(v5, *MEMORY[0x263EF8960], 0, &self->super._ioConnect);
    [(ACCTransportIOAccessoryEA *)self _registerEAReadCallback];
    if (gLogObjects) {
      v7 = gNumLogObjects < 6;
    }
    else {
      v7 = 1;
    }
    if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v12 = MEMORY[0x263EF8438];
      unsigned int v8 = MEMORY[0x263EF8438];
    }
    else
    {
      v12 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
      v14 = [(ACCTransportIOAccessoryBase *)self ioService];
      v15 = [(ACCTransportIOAccessoryEA *)self endpointUUID];
      v17 = 138413058;
      v18 = v13;
      v19 = 1024;
      *(_DWORD *)v20 = v14;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v6;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_222CE3000, v12, OS_LOG_TYPE_DEFAULT, "EA session for protocol %@ self.ioService %d is open result = 0x%X (endpointUUID %@)", (uint8_t *)&v17, 0x22u);
    }
    self->_sessionOpen = 1;
  }
  return [(ACCTransportIOAccessoryEA *)self sessionOpen];
}

- (void)closeEAServiceSession
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if ([(ACCTransportIOAccessoryEA *)self sessionOpen])
  {
    IOServiceClose(self->super._ioConnect);
    self->super._ioConnect = 0;
    self->_sessionOpen = 0;
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 6;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v7 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
      int v10 = 138412290;
      objc_super v11 = v8;
      uint64_t v9 = "EA session for protocol %@ is closed";
LABEL_22:
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 6;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v7 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      v7 = *(id *)(gLogObjects + 40);
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
      int v10 = 138412290;
      objc_super v11 = v8;
      uint64_t v9 = "EA session for protocol %@ is already closed";
      goto LABEL_22;
    }
  }
}

- (BOOL)_handleIncomingEAData
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ACCTransportIOAccessoryEA *)self parentConnectionUUID];

  if (v3)
  {
    int v4 = 0;
    BOOL v5 = 0;
    p_eaDataReadBufferDataLength = &self->_eaDataReadBufferDataLength;
    v7 = MEMORY[0x263EF8438];
    while (1)
    {
      unint64_t *p_eaDataReadBufferDataLength = 1024;
      if (v4)
      {
        uint64_t v8 = gLogObjects;
        int v9 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v10 = gNumLogObjects < 6;
        }
        else {
          BOOL v10 = 1;
        }
        if (v10)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v34 = v8;
            __int16 v35 = 1024;
            LODWORD(v36) = v9;
            _os_log_error_impl(&dword_222CE3000, v7, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          objc_super v11 = v7;
          v16 = v7;
        }
        else
        {
          v16 = *(id *)(gLogObjects + 40);
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v24 = [(ACCTransportIOAccessoryEA *)self parentConnectionUUID];
          v25 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
          *(_DWORD *)buf = 138412546;
          unint64_t v34 = (unint64_t)v24;
          __int16 v35 = 2112;
          v36 = v25;
          _os_log_error_impl(&dword_222CE3000, v16, OS_LOG_TYPE_ERROR, "error reading from EA session UUID %@, protocol %@", buf, 0x16u);
        }
      }
      else
      {
        int v4 = IOAccessoryEAInterfaceReceiveData();
        uint64_t v12 = gLogObjects;
        int v13 = gNumLogObjects;
        if (gLogObjects) {
          BOOL v14 = gNumLogObjects < 6;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            unint64_t v34 = v12;
            __int16 v35 = 1024;
            LODWORD(v36) = v13;
            _os_log_error_impl(&dword_222CE3000, v7, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v15 = v7;
          v17 = v7;
        }
        else
        {
          v17 = *(id *)(gLogObjects + 40);
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          unint64_t v32 = *p_eaDataReadBufferDataLength;
          v26 = [(ACCTransportIOAccessoryEA *)self endpointUUID];
          v27 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
          *(_DWORD *)buf = 134218754;
          unint64_t v34 = v32;
          __int16 v35 = 2112;
          v36 = v26;
          __int16 v37 = 2112;
          v38 = v27;
          __int16 v39 = 1024;
          int v40 = v4;
          _os_log_debug_impl(&dword_222CE3000, v17, OS_LOG_TYPE_DEBUG, "read %zu bytes from EA session UUID %@, protocol %@, result = 0x%X", buf, 0x26u);
        }
        uint64_t v18 = [(ACCTransportIOAccessoryEA *)self delegate];
        if (!v18
          || (v19 = (void *)v18,
              [(ACCTransportIOAccessoryEA *)self delegate],
              v20 = objc_claimAutoreleasedReturnValue(),
              char v21 = objc_opt_respondsToSelector(),
              v20,
              v19,
              (v21 & 1) == 0))
        {
          BOOL v5 = 1;
          goto LABEL_29;
        }
        v16 = [MEMORY[0x263EFF8F8] dataWithBytes:self->_eaDataReadBuffer length:*p_eaDataReadBufferDataLength];
        v22 = [(ACCTransportIOAccessoryEA *)self delegate];
        v23 = [(ACCTransportIOAccessoryEA *)self endpointUUID];
        [v22 IOAccessoryEADataArrived:v16 eaEndpointUUID:v23];

        BOOL v5 = 1;
      }

LABEL_29:
      if (*p_eaDataReadBufferDataLength != 1024) {
        return v5;
      }
    }
  }
  if (gLogObjects) {
    BOOL v29 = gNumLogObjects < 6;
  }
  else {
    BOOL v29 = 1;
  }
  if (v29)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v31 = MEMORY[0x263EF8438];
    id v30 = MEMORY[0x263EF8438];
  }
  else
  {
    v31 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    -[ACCTransportIOAccessoryEA _handleIncomingEAData](self);
  }

  return 0;
}

- (void)_registerEAReadCallback
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_222CE3000, a2, OS_LOG_TYPE_ERROR, "ERROR registering EAReadCallback: 0x%x", (uint8_t *)v2, 8u);
}

- (void)_checkEAInfo
{
  [(ACCTransportIOAccessoryBase *)self ioService];
  uint64_t v3 = (NSString *)IOAccessoryEAInterfaceCopyProtocolString();
  eaProtocol = self->_eaProtocol;
  self->_eaProtocol = v3;

  if (!self->_eaProtocol)
  {
    self->_eaProtocol = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  BOOL v5 = (NSString *)IOAccessoryEAInterfaceCopyDeviceVendorName();
  deviceVendorName = self->_deviceVendorName;
  self->_deviceVendorName = v5;

  if (!self->_deviceVendorName)
  {
    self->_deviceVendorName = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  v7 = (NSString *)IOAccessoryEAInterfaceCopyDeviceName();
  deviceName = self->_deviceName;
  self->_deviceName = v7;

  if (!self->_deviceName)
  {
    self->_deviceName = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  int v9 = (NSString *)IOAccessoryEAInterfaceCopyDeviceModelNumber();
  deviceModelNumber = self->_deviceModelNumber;
  self->_deviceModelNumber = v9;

  if (!self->_deviceModelNumber)
  {
    self->_deviceModelNumber = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  objc_super v11 = (NSString *)IOAccessoryEAInterfaceCopyDeviceHardwareRevision();
  deviceHardwareRevision = self->_deviceHardwareRevision;
  self->_deviceHardwareRevision = v11;

  if (!self->_deviceHardwareRevision)
  {
    self->_deviceHardwareRevision = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  int v13 = (NSString *)IOAccessoryEAInterfaceCopyDeviceFirmwareRevision();
  deviceFirmwareRevision = self->_deviceFirmwareRevision;
  self->_deviceFirmwareRevision = v13;

  if (!self->_deviceFirmwareRevision)
  {
    self->_deviceFirmwareRevision = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  v15 = (NSString *)IOAccessoryEAInterfaceCopyDeviceSerialNumber();
  deviceSerialNumber = self->_deviceSerialNumber;
  self->_deviceSerialNumber = v15;

  if (!self->_deviceSerialNumber)
  {
    self->_deviceSerialNumber = (NSString *)@"Unknown";
  }
  [(ACCTransportIOAccessoryBase *)self ioService];
  v17 = (NSString *)IOAccessoryEAInterfaceCopyDeviceDockType();
  deviceDockType = self->_deviceDockType;
  self->_deviceDockType = v17;

  if (!self->_deviceDockType)
  {
    self->_deviceDockType = (NSString *)@"Unknown";
  }
}

- (BOOL)transmitData:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 6;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    v7 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCTransportIOAccessoryEA *)v4 transmitData:v7];
  }

  id v8 = v4;
  [v8 bytes];
  [v8 length];
  int v9 = IOAccessoryEAInterfaceSendData();
  if (v9)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      BOOL v10 = *(id *)(gLogObjects + 40);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      BOOL v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(ACCTransportIOAccessoryEA *)self transmitData:v10];
    }
  }
  return v9 == 0;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  id v4 = NSString;
  BOOL v5 = [(ACCTransportIOAccessoryEA *)self eaProtocol];
  id v6 = [v4 stringWithFormat:@"EAProtocol %@\n", v5];
  [v3 appendFormat:@"%@", v6];

  v7 = NSString;
  id v8 = [(ACCTransportIOAccessoryEA *)self deviceVendorName];
  int v9 = [v7 stringWithFormat:@"    deviceVendorName %@\n", v8];
  [v3 appendFormat:@"%@", v9];

  BOOL v10 = NSString;
  id v11 = [(ACCTransportIOAccessoryEA *)self deviceName];
  uint64_t v12 = [v10 stringWithFormat:@"    deviceName %@\n", v11];
  [v3 appendFormat:@"%@", v12];

  int v13 = NSString;
  BOOL v14 = [(ACCTransportIOAccessoryEA *)self deviceModelNumber];
  v15 = [v13 stringWithFormat:@"    deviceModelNumber %@\n", v14];
  [v3 appendFormat:@"%@", v15];

  v16 = NSString;
  v17 = [(ACCTransportIOAccessoryEA *)self deviceHardwareRevision];
  uint64_t v18 = [v16 stringWithFormat:@"    deviceHardwareRevision %@\n", v17];
  [v3 appendFormat:@"%@", v18];

  v19 = NSString;
  v20 = [(ACCTransportIOAccessoryEA *)self deviceFirmwareRevision];
  char v21 = [v19 stringWithFormat:@"    deviceFirmwareRevision %@\n", v20];
  [v3 appendFormat:@"%@", v21];

  v22 = NSString;
  v23 = [(ACCTransportIOAccessoryEA *)self deviceSerialNumber];
  v24 = [v22 stringWithFormat:@"    deviceSerialNumber %@\n", v23];
  [v3 appendFormat:@"%@", v24];

  v25 = NSString;
  v26 = [(ACCTransportIOAccessoryEA *)self deviceDockType];
  v27 = [v25 stringWithFormat:@"    deviceDockType %@\n", v26];
  [v3 appendFormat:@"%@", v27];

  v28 = objc_msgSend(NSString, "stringWithFormat:", @"    IOService %d\n", -[ACCTransportIOAccessoryBase ioService](self, "ioService"));
  [v3 appendFormat:@"%@", v28];

  return v3;
}

- (NSString)eaProtocol
{
  eaProtocol = self->_eaProtocol;
  if (!eaProtocol || [(NSString *)eaProtocol isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyProtocolString();
    BOOL v5 = self->_eaProtocol;
    self->_eaProtocol = v4;

    if (!self->_eaProtocol)
    {
      self->_eaProtocol = (NSString *)@"Unknown";
    }
  }
  id v6 = self->_eaProtocol;
  return v6;
}

- (NSString)deviceVendorName
{
  deviceVendorName = self->_deviceVendorName;
  if (!deviceVendorName || [(NSString *)deviceVendorName isEqualToString:@"Unknown"])
  {
    [(ACCTransportIOAccessoryBase *)self ioService];
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceVendorName();
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
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceName();
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
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceModelNumber();
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
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceHardwareRevision();
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
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceFirmwareRevision();
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
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceSerialNumber();
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
    id v4 = (NSString *)IOAccessoryEAInterfaceCopyDeviceDockType();
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

- (ACCTransportIOAccessoryEAProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportIOAccessoryEAProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setEaProtocol:(id)a3
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

- (BOOL)sessionOpen
{
  return self->_sessionOpen;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentConnectionUUID);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
  objc_storeStrong((id *)&self->_deviceDockType, 0);
  objc_storeStrong((id *)&self->_deviceSerialNumber, 0);
  objc_storeStrong((id *)&self->_deviceFirmwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceHardwareRevision, 0);
  objc_storeStrong((id *)&self->_deviceModelNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceVendorName, 0);
  objc_storeStrong((id *)&self->_eaProtocol, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleIncomingEAData
{
  v1 = [a1 eaProtocol];
  OUTLINED_FUNCTION_5_1(&dword_222CE3000, v2, v3, "EA session for protocol %@ is not open", v4, v5, v6, v7, 2u);
}

- (void)transmitData:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a1 eaProtocol];
  uint64_t v7 = [a1 parentConnectionUUID];
  int v8 = 138412802;
  int v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 1024;
  int v13 = a2;
  _os_log_error_impl(&dword_222CE3000, a3, OS_LOG_TYPE_ERROR, "ERROR sending data to EA protocol %@, (UUID %@) 0x%X", (uint8_t *)&v8, 0x1Cu);
}

- (void)transmitData:(NSObject *)a3 .cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 length];
  uint64_t v6 = [a2 eaProtocol];
  uint64_t v7 = [a2 parentConnectionUUID];
  int v8 = 134218498;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  id v11 = v6;
  __int16 v12 = 2112;
  int v13 = v7;
  _os_log_debug_impl(&dword_222CE3000, a3, OS_LOG_TYPE_DEBUG, "transmitting EA data length %lu for protocol %@ (Connection UUID %@)", (uint8_t *)&v8, 0x20u);
}

@end