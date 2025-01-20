@interface ACCTransportIOAccessoryPort
- (ACCTransportIOAccessoryPort)initWithDelegate:(id)a3 andIOService:(unsigned int)a4;
- (ACCTransportIOAccessoryPortProtocol)delegate;
- (BOOL)isAuthenticated;
- (BOOL)transmitData:(id)a3;
- (NSString)ioAccPortEndpointUUID;
- (NSString)ioAccPortParentConnectionUUID;
- (int)portIDNumber;
- (int)portStreamType;
- (int)portTransportType;
- (int)resistorID;
- (void)_handleAccessoryPortDetach;
- (void)_handleIncomingData:(id)a3;
- (void)_handlePropertyChange;
- (void)_handleResistorIDChange:(int)a3;
- (void)_registerForIOAccessoryPortInterestNotifications;
- (void)dealloc;
- (void)portServiceRegistrationComplete;
- (void)setDelegate:(id)a3;
- (void)setIoAccPortEndpointUUID:(id)a3;
- (void)setIoAccPortParentConnectionUUID:(id)a3;
- (void)setIsAuthenticated:(BOOL)a3;
@end

@implementation ACCTransportIOAccessoryPort

- (ACCTransportIOAccessoryPort)initWithDelegate:(id)a3 andIOService:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)ACCTransportIOAccessoryPort;
  v7 = [(ACCTransportIOAccessoryBase *)&v37 initWithIOAccessoryClass:1 ioService:v4];
  v8 = v7;
  if (v7)
  {
    v7->_isAuthenticated = 0;
    ioAccPortEndpointUUID = v7->_ioAccPortEndpointUUID;
    v7->_ioAccPortEndpointUUID = 0;

    objc_storeWeak((id *)&v8->_ioAccPortParentConnectionUUID, 0);
    v8->_notificationRunLoopSource = 0;
    v8->_resistorID = 100;
    objc_storeWeak((id *)&v8->_delegate, v6);
    io_service_t v10 = [(ACCTransportIOAccessoryBase *)v8 ioService];
    uint64_t v11 = IOServiceOpen(v10, *MEMORY[0x263EF8960], 0, &v8->super._ioConnect);
    if (v11)
    {
      uint64_t v12 = v11;
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v13 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v13 = MEMORY[0x263EF8438];
        id v14 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryPort initWithDelegate:andIOService:](v12, v13, v15, v16, v17, v18, v19, v20);
      }
    }
    v8->_int portIDNumber = IOAccessoryPortGetPort();
    v8->_int portTransportType = IOAccessoryPortGetTransportType();
    CFAllocatorRef v21 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, @"StreamType", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    CFNumberRef v23 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, @"ProtocolType", v21, 0);
    uint64_t valuePtr = 0;
    if (CFProperty && (CFNumberRef v24 = v23) != 0)
    {
      CFNumberGetValue(CFProperty, kCFNumberSInt32Type, (char *)&valuePtr + 4);
      CFNumberGetValue(v24, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr == 1)
      {
        int v25 = HIDWORD(valuePtr) == 1;
      }
      else if (valuePtr == 2 && HIDWORD(valuePtr) == 1)
      {
        int v25 = 5;
      }
      else
      {
        int v25 = 0;
      }
      v8->_int portStreamType = v25;
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v27 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v27 = MEMORY[0x263EF8438];
        id v28 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int portStreamType = v8->_portStreamType;
        *(_DWORD *)buf = 136316162;
        *(void *)v39 = "-[ACCTransportIOAccessoryPort initWithDelegate:andIOService:]";
        *(_WORD *)&v39[8] = 1024;
        *(_DWORD *)v40 = v4;
        *(_WORD *)&v40[4] = 1024;
        *(_DWORD *)v41 = HIDWORD(valuePtr);
        *(_WORD *)&v41[4] = 1024;
        int v42 = valuePtr;
        __int16 v43 = 1024;
        int v44 = portStreamType;
        _os_log_impl(&dword_222CE3000, v27, OS_LOG_TYPE_DEFAULT, "%s: init, service %d, (streamType %d, protocolType %d) -> portStreamType %d", buf, 0x24u);
      }
    }
    else
    {
      v8->_int portStreamType = IOAccessoryPortGetStreamType();
    }
    if (gLogObjects && gNumLogObjects >= 5)
    {
      v30 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      v30 = MEMORY[0x263EF8438];
      id v31 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int portIDNumber = v8->_portIDNumber;
      int portTransportType = v8->_portTransportType;
      int v34 = v8->_portStreamType;
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)v39 = v4;
      *(_WORD *)&v39[4] = 1024;
      *(_DWORD *)&v39[6] = portIDNumber;
      *(_WORD *)v40 = 1024;
      *(_DWORD *)&v40[2] = portTransportType;
      *(_WORD *)v41 = 1024;
      *(_DWORD *)&v41[2] = v34;
      _os_log_impl(&dword_222CE3000, v30, OS_LOG_TYPE_DEFAULT, "ACCTransportIOAccessoryPort: init, service %d, portID %d, portTransportType %d, portStreamType %d", buf, 0x1Au);
    }

    [(ACCTransportIOAccessoryPort *)v8 _registerForIOAccessoryPortInterestNotifications];
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
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
    v5 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v10 = [(ACCTransportIOAccessoryBase *)self ioService];
    _os_log_impl(&dword_222CE3000, v5, OS_LOG_TYPE_DEFAULT, "Deallocating IOAccessoryPort with service: %d", buf, 8u);
  }

  ioAccPortEndpointUUID = self->_ioAccPortEndpointUUID;
  self->_ioAccPortEndpointUUID = 0;

  objc_storeWeak((id *)&self->_ioAccPortParentConnectionUUID, 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_int portIDNumber = -1;
  if (self->_notificationRunLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_notificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRelease(self->_notificationRunLoopSource);
    self->_notificationRunLoopSource = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)ACCTransportIOAccessoryPort;
  [(ACCTransportIOAccessoryBase *)&v8 dealloc];
}

- (void)portServiceRegistrationComplete
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ACCTransportIOAccessoryPort *)self delegate];

  if (v3)
  {
    uint64_t v4 = [(ACCTransportIOAccessoryPort *)self delegate];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [(ACCTransportIOAccessoryPort *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        int portStreamType = self->_portStreamType;
        switch(portStreamType)
        {
          case 1:
            uint64_t v9 = 0;
            char v10 = 0;
            uint64_t v11 = 10;
            break;
          case 4:
            char v10 = 0;
            uint64_t v11 = 15;
            uint64_t v9 = 1;
            break;
          case 5:
            uint64_t v9 = 0;
            char v10 = 0;
            uint64_t v11 = 16;
            break;
          default:
            uint64_t v9 = 0;
            int v12 = 0;
            uint64_t v11 = 0;
            char v10 = 1;
            goto LABEL_12;
        }
        int v12 = 1;
LABEL_12:
        if (gLogObjects && gNumLogObjects >= 5)
        {
          v13 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v13 = MEMORY[0x263EF8438];
          id v14 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v26 = 67109120;
          int v27 = v11;
          _os_log_impl(&dword_222CE3000, v13, OS_LOG_TYPE_INFO, " protocol:%{coreacc:ACCEndpoint_Protocol_t}d", (uint8_t *)&v26, 8u);
        }

        if (v10)
        {
          if (gLogObjects && gNumLogObjects >= 5)
          {
            uint64_t v15 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v15 = MEMORY[0x263EF8438];
            id v20 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 67109120;
            int v27 = 0;
            _os_log_impl(&dword_222CE3000, v15, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID! wrong protocol! protocol:%{coreacc:ACCEndpoint_Protocol_t}d", (uint8_t *)&v26, 8u);
          }
          goto LABEL_50;
        }
        uint64_t v16 = [(ACCTransportIOAccessoryPort *)self delegate];
        uint64_t v15 = [v16 IOAccessoryPortArrived:self withEndpointProtocol:v11 publish:v9];

        if (v15)
        {
          uint64_t v17 = [NSString stringWithString:v15];
          ioAccPortEndpointUUID = self->_ioAccPortEndpointUUID;
          self->_ioAccPortEndpointUUID = v17;

          if (v12)
          {
            uint64_t v19 = [(ACCTransportIOAccessoryPort *)self delegate];
            [v19 IOAccessoryPortPublish:self];
LABEL_49:

LABEL_50:
            return;
          }
          if (gLogObjects && gNumLogObjects >= 5)
          {
            uint64_t v19 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v19 = MEMORY[0x263EF8438];
            id v25 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
            goto LABEL_49;
          }
          int v26 = 67109120;
          int v27 = v11;
          v22 = "Did not publish endpoint for protocol:%{coreacc:ACCEndpoint_Protocol_t}d";
          CFNumberRef v23 = v19;
          os_log_type_t v24 = OS_LOG_TYPE_INFO;
        }
        else
        {
          if (gLogObjects && gNumLogObjects >= 5)
          {
            uint64_t v19 = *(id *)(gLogObjects + 32);
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCTransportIOAccessoryOOBPairing dealloc]();
            }
            uint64_t v19 = MEMORY[0x263EF8438];
            id v21 = MEMORY[0x263EF8438];
          }
          if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_49;
          }
          int v26 = 67109120;
          int v27 = v11;
          v22 = "Failed to create endpointUUID! protocol:%{coreacc:ACCEndpoint_Protocol_t}d";
          CFNumberRef v23 = v19;
          os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
        }
        _os_log_impl(&dword_222CE3000, v23, v24, v22, (uint8_t *)&v26, 8u);
        goto LABEL_49;
      }
    }
  }
}

- (void)_registerForIOAccessoryPortInterestNotifications
{
}

- (void)_handleIncomingData:(id)a3
{
  id v4 = a3;
  notificationPortQueue = self->super._notificationPortQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke;
  v7[3] = &unk_26466BB38;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(notificationPortQueue, v7);
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    id v4 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_9(a1, v4);
  }

  v5 = (id *)(a1 + 40);
  id v6 = [*(id *)(a1 + 40) ioAccPortEndpointUUID];

  if (!v6)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      char v7 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      char v7 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *((_DWORD *)*v5 + 17);
      int v10 = *((_DWORD *)*v5 + 18);
      int v11 = *((_DWORD *)*v5 + 20);
      v36[0] = 67109632;
      v36[1] = v9;
      __int16 v37 = 1024;
      int v38 = v10;
      __int16 v39 = 1024;
      int v40 = v11;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "_handleIncomingData: on incoming data, endpoint not created yet, portID %d, portTransportType %d, portStreamType %d", (uint8_t *)v36, 0x14u);
    }

    uint64_t v12 = [*v5 delegate];
    if (v12
      && (v13 = (void *)v12,
          [*v5 delegate],
          id v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = objc_opt_respondsToSelector(),
          v14,
          v13,
          (v15 & 1) != 0))
    {
      int v16 = *((_DWORD *)*v5 + 20) - 1;
      if (v16 > 4) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = dword_222D4A2E8[v16];
      }
      id v20 = [*v5 delegate];
      uint64_t v18 = [v20 IOAccessoryPortArrived:*v5 withEndpointProtocol:v17 publish:1];

      if (v18)
      {
        uint64_t v21 = [NSString stringWithString:v18];
        v22 = *((void *)*v5 + 12);
        *((void *)*v5 + 12) = v21;
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 5)
        {
          v22 = *(id *)(gLogObjects + 32);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCTransportIOAccessoryOOBPairing dealloc]();
          }
          v22 = MEMORY[0x263EF8438];
          id v23 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v36[0]) = 0;
          _os_log_impl(&dword_222CE3000, v22, OS_LOG_TYPE_DEFAULT, "Failed to create endpointUUID!", (uint8_t *)v36, 2u);
        }
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 5)
      {
        uint64_t v18 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        uint64_t v18 = MEMORY[0x263EF8438];
        id v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_5(v18);
      }
    }
  }
  os_log_type_t v24 = [*v5 ioAccPortEndpointUUID];

  if (v24)
  {
    uint64_t v25 = [*v5 delegate];
    if (v25
      && (int v26 = (void *)v25,
          [*v5 delegate],
          int v27 = objc_claimAutoreleasedReturnValue(),
          char v28 = objc_opt_respondsToSelector(),
          v27,
          v26,
          (v28 & 1) != 0))
    {
      v29 = [*(id *)(a1 + 40) delegate];
      uint64_t v30 = *(void *)(a1 + 32);
      id v31 = [*(id *)(a1 + 40) ioAccPortEndpointUUID];
      LOBYTE(v30) = [v29 IOAccessoryPortDataArrived:v30 endpointUUID:v31];

      if (v30) {
        return;
      }
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 5)
      {
        v32 = *(id *)(gLogObjects + 32);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCTransportIOAccessoryOOBPairing dealloc]();
        }
        v32 = MEMORY[0x263EF8438];
        id v33 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_3(v32);
      }
    }
  }
  if (gLogObjects && gNumLogObjects >= 5)
  {
    int v34 = *(id *)(gLogObjects + 32);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    int v34 = MEMORY[0x263EF8438];
    id v35 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
    __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_1(v5, v34);
  }
}

- (BOOL)transmitData:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    char v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    char v7 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    [(ACCTransportIOAccessoryPort *)(uint64_t)v4 transmitData:v7];
  }

  id v8 = v4;
  [v8 bytes];
  [v8 length];
  uint64_t v9 = IOAccessoryPortTransmitData();
  if (v9)
  {
    if (gLogObjects && gNumLogObjects >= 5)
    {
      int v10 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      int v10 = MEMORY[0x263EF8438];
      id v11 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryPort transmitData:](v9, v10, v12, v13, v14, v15, v16, v17);
    }
  }
  return v9 == 0;
}

- (void)_handleAccessoryPortDetach
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = [(ACCTransportIOAccessoryPort *)self ioAccPortEndpointUUID];

  if (gLogObjects) {
    BOOL v4 = gNumLogObjects <= 4;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = !v4;
  if (v3)
  {
    if (v5)
    {
      id v6 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      id v6 = MEMORY[0x263EF8438];
      id v8 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(ACCTransportIOAccessoryPort *)self ioAccPortEndpointUUID];
      int v16 = 138412290;
      uint64_t v17 = v9;
      _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "detaching endpointUUID %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v10 = [(ACCTransportIOAccessoryPort *)self delegate];
    if (v10)
    {
      id v11 = (void *)v10;
      uint64_t v12 = [(ACCTransportIOAccessoryPort *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        uint64_t v14 = [(ACCTransportIOAccessoryPort *)self delegate];
        [v14 IOAccessoryPortDetach:self];
      }
    }
    [(ACCTransportIOAccessoryPort *)self setIoAccPortEndpointUUID:0];
    [(ACCTransportIOAccessoryPort *)self setIoAccPortParentConnectionUUID:0];
  }
  else
  {
    if (v5)
    {
      char v7 = *(id *)(gLogObjects + 32);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCTransportIOAccessoryOOBPairing dealloc]();
      }
      char v7 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_222CE3000, v7, OS_LOG_TYPE_DEFAULT, "no endpointUUID to detach", (uint8_t *)&v16, 2u);
    }
  }
}

- (void)_handleResistorIDChange:(int)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  self->_resistorID = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 5;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCTransportIOAccessoryOOBPairing dealloc]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)(gLogObjects + 32);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [(ACCTransportIOAccessoryPort *)self resistorID];
    _os_log_impl(&dword_222CE3000, v6, OS_LOG_TYPE_DEFAULT, "IO Accessory Port Connected resistorID %d, not doing anything with it", (uint8_t *)v7, 8u);
  }
}

- (void)_handlePropertyChange
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222CE3000, log, OS_LOG_TYPE_ERROR, "delegate does not handle IOAccessoryPortPropertyChanged!", v1, 2u);
}

- (NSString)ioAccPortParentConnectionUUID
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ioAccPortParentConnectionUUID);
  id v3 = (void *)[WeakRetained copy];

  return (NSString *)v3;
}

- (ACCTransportIOAccessoryPortProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCTransportIOAccessoryPortProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (void)setIsAuthenticated:(BOOL)a3
{
  self->_isAuthenticated = a3;
}

- (int)portIDNumber
{
  return self->_portIDNumber;
}

- (int)portTransportType
{
  return self->_portTransportType;
}

- (int)resistorID
{
  return self->_resistorID;
}

- (int)portStreamType
{
  return self->_portStreamType;
}

- (NSString)ioAccPortEndpointUUID
{
  return self->_ioAccPortEndpointUUID;
}

- (void)setIoAccPortEndpointUUID:(id)a3
{
}

- (void)setIoAccPortParentConnectionUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ioAccPortParentConnectionUUID);
  objc_storeStrong((id *)&self->_ioAccPortEndpointUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithDelegate:(uint64_t)a3 andIOService:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [*a1 ioAccPortEndpointUUID];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_222CE3000, a2, OS_LOG_TYPE_DEBUG, "dataReceivedSuccessfully failed for endpointUUID %@", (uint8_t *)&v4, 0xCu);
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222CE3000, log, OS_LOG_TYPE_DEBUG, "delegate does not handle portDataArrived!", v1, 2u);
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_5(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_222CE3000, log, OS_LOG_TYPE_DEBUG, "delegate does not handle portArrived!", v1, 2u);
}

void __51__ACCTransportIOAccessoryPort__handleIncomingData___block_invoke_cold_9(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_222CE3000, a2, OS_LOG_TYPE_DEBUG, "Received data %@", (uint8_t *)&v3, 0xCu);
}

- (void)transmitData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_222CE3000, a2, a3, "status when transmitting data = 0x%X", a5, a6, a7, a8, 0);
}

- (void)transmitData:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 ioAccPortEndpointUUID];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_222CE3000, a3, OS_LOG_TYPE_DEBUG, "IOAccessoryPort (lowest level of data); transmitting data %@ for endpointUUID %@",
    (uint8_t *)&v6,
    0x16u);
}

@end