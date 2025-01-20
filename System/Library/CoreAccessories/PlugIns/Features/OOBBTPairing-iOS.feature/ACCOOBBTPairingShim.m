@interface ACCOOBBTPairingShim
- (ACCOOBBTPairingShim)initWithDelegate:(id)a3;
- (ACCOOBBTPairingShimProtocol)delegate;
- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5;
- (NSString)uid;
- (id)description;
- (id)getUID;
- (void)accessoryAttached:(id)a3 accInfoDict:(id)a4;
- (void)accessoryDetached:(id)a3;
- (void)accessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6;
- (void)accessoryPairingCompletion:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 sendStop:(BOOL)a6 result:(unsigned __int8)a7;
- (void)beginPairingWithCurrentAccessory:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ACCOOBBTPairingShim

- (ACCOOBBTPairingShim)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCOOBBTPairingShim;
  v5 = [(ACCOOBBTPairingShim *)&v10 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08C38] UUID];
    uint64_t v7 = [v6 UUIDString];
    uid = v5->_uid;
    v5->_uid = (NSString *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  uid = self->_uid;
  self->_uid = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCOOBBTPairingShim;
  [(ACCOOBBTPairingShim *)&v4 dealloc];
}

- (id)description
{
  v2 = NSString;
  uid = self->_uid;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [v2 stringWithFormat:@"<ACCOOBBTPairingShim>[_uid=%@ _delegate=%@]", uid, WeakRetained];

  return v5;
}

- (void)beginPairingWithCurrentAccessory:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 1;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    uint64_t v7 = MEMORY[0x263EF8438];
    id v6 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_221CBA000, v7, OS_LOG_TYPE_INFO, "Beginning OOB BT pairing: accessory=%@", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained startOOBBTPairing:v4];
}

- (void)accessoryAttached:(id)a3 accInfoDict:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F23080];
  v8 = [v6 objectForKey:*MEMORY[0x263F23080]];

  if (v8)
  {
    int v9 = [v6 objectForKey:v7];
    [v5 setDisplayName:v9];
  }
  uint64_t v10 = *MEMORY[0x263F23068];
  uint64_t v11 = [v6 objectForKey:*MEMORY[0x263F23068]];

  if (v11)
  {
    v12 = [v6 objectForKey:v10];
    [v5 setCertData:v12];
  }
  uint64_t v13 = *MEMORY[0x263F23070];
  v14 = [v6 objectForKey:*MEMORY[0x263F23070]];

  if (v14)
  {
    v15 = [v6 objectForKey:v13];
    [v5 setCertSerial:v15];
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v16 = MEMORY[0x263EF8438];
    id v17 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_221CBA000, v16, OS_LOG_TYPE_INFO, "accessoryAttached: %@", (uint8_t *)&v18, 0xCu);
  }
}

- (void)accessoryDetached:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v6 = MEMORY[0x263EF8438];
    id v5 = MEMORY[0x263EF8438];
  }
  else
  {
    id v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_221CBA000, v6, OS_LOG_TYPE_INFO, "accessoryDetached: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)accessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    v15 = MEMORY[0x263EF8438];
    id v14 = MEMORY[0x263EF8438];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v12;
    LOWORD(v49) = 1024;
    *(_DWORD *)((char *)&v49 + 2) = a6;
    _os_log_impl(&dword_221CBA000, v15, OS_LOG_TYPE_INFO, "accessoryInfo: %@ oobBtPairingUID:%@ accessoryMacAddr:%@ deviceClass:%d", buf, 0x26u);
  }

  if (v10 && v11)
  {
    __int16 v44 = -21846;
    int v43 = -1431655766;
    *(void *)&long long v16 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v49 = v16;
    long long v50 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    v47[0] = 0xAAAAAAAAAAAAAAAALL;
    v47[1] = 0xAAAAAAAAAAAAAAAALL;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      id v17 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 138412290;
      id v46 = v12;
      _os_log_impl(&dword_221CBA000, v17, OS_LOG_TYPE_INFO, "Remote MAC Address: %@", v45, 0xCu);
    }

    id v20 = v12;
    [v20 bytes];
    [v10 setCurrentRemoteMACAddress:v20];
    [v10 setCurrentOOBBTPairingUID:v11];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      v21 = MEMORY[0x263EF8438];
      id v23 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v24 = [v10 currentRemoteMACAddress];
      *(_DWORD *)v45 = 138412290;
      id v46 = v24;
      _os_log_impl(&dword_221CBA000, v21, OS_LOG_TYPE_INFO, "Storing remote MAC Address: %@", v45, 0xCu);
    }
    [v10 BTSession];
    if (BTLocalDeviceGetDefault())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id WeakRetained = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        id WeakRetained = MEMORY[0x263EF8438];
        id v26 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:]3();
      }
    }
    else if (BTLocalDeviceGetAddressString())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id WeakRetained = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        id WeakRetained = MEMORY[0x263EF8438];
        id v27 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:]1();
      }
    }
    else
    {
      if (BTDeviceAddressFromString())
      {
LABEL_62:
        [v10 setCurrentRemoteMACAddress:0];
        [v10 setCurrentOOBBTPairingUID:0];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained stopOOBBTPairing:v10];
LABEL_63:

        goto LABEL_64;
      }
      [v10 BTSession];
      if (BTDeviceFromAddress())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id WeakRetained = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCOOBBTPairingAccessory init]();
          }
          id WeakRetained = MEMORY[0x263EF8438];
          id v28 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.9();
        }
      }
      else if (BTDeviceGetPairingStatus())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id WeakRetained = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCOOBBTPairingAccessory init]();
          }
          id WeakRetained = MEMORY[0x263EF8438];
          id v29 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.7();
        }
      }
      else
      {
        [v10 setCurrentRemoteBTDevice:0];
        [v10 BTAccessoryManager];
        if (BTAccessoryManagerGenerateLinkKey())
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            id WeakRetained = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCOOBBTPairingAccessory init]();
            }
            id WeakRetained = MEMORY[0x263EF8438];
            id v36 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
            -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.5();
          }
        }
        else
        {
          v30 = [v10 displayName];
          if (!v30)
          {
            v31 = [v10 iap2ShimAccessory];
            v30 = [v31 name];
          }
          [v10 BTAccessoryManager];
          id WeakRetained = v30;
          [WeakRetained UTF8String];
          int v32 = BTAccessoryManagerSetLinkKeyEx();
          if (gLogObjects) {
            BOOL v33 = gNumLogObjects <= 0;
          }
          else {
            BOOL v33 = 1;
          }
          int v34 = !v33;
          if (!v32)
          {
            if (v34)
            {
              v37 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                -[ACCOOBBTPairingAccessory init]();
              }
              v37 = MEMORY[0x263EF8438];
              id v39 = MEMORY[0x263EF8438];
            }
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v45 = 0;
              _os_log_impl(&dword_221CBA000, v37, OS_LOG_TYPE_INFO, "Sending Link Key to accessory", v45, 2u);
            }

            v40 = [MEMORY[0x263EFF8F8] dataWithBytes:v47 length:16];
            v41 = [MEMORY[0x263EFF8F8] dataWithBytes:&v43 length:6];
            id v42 = objc_loadWeakRetained((id *)&self->_delegate);
            [v42 linkKey:v40 deviceMacAddr:v41 accessory:v10];

            goto LABEL_63;
          }
          if (v34)
          {
            v35 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCOOBBTPairingAccessory init]();
            }
            v35 = MEMORY[0x263EF8438];
            id v38 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:]();
          }
        }
      }
    }

    goto LABEL_62;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    int v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    int v18 = MEMORY[0x263EF8438];
    id v22 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl(&dword_221CBA000, v18, OS_LOG_TYPE_DEFAULT, "Invalid accessory(%@) or oobBtPairingUID(%@)", buf, 0x16u);
  }

LABEL_64:
}

- (void)accessoryPairingCompletion:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 sendStop:(BOOL)a6 result:(unsigned __int8)a7
{
  int v7 = a7;
  BOOL v8 = a6;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v17 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  else
  {
    id v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v32 = 138413314;
    *(void *)&v32[4] = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 1024;
    BOOL v38 = v8;
    __int16 v39 = 1024;
    int v40 = v7;
    _os_log_impl(&dword_221CBA000, v17, OS_LOG_TYPE_INFO, "accessoryPairingCompletion: %@ oobBtPairingUID:%@ accessoryMacAddr:%@ sendStop:%d result:%d", v32, 0x2Cu);
  }

  if (v12 && v13)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      int v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v32 = 0;
      _os_log_impl(&dword_221CBA000, v18, OS_LOG_TYPE_INFO, "Asking BTServer to connect to the remote device...", v32, 2u);
    }

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v20 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        id v20 = MEMORY[0x263EF8438];
        id v22 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
      *(_DWORD *)int v32 = 67109120;
      *(_DWORD *)&v32[4] = v7;
      id v23 = "Skip call to BTDeviceConnect(device), result (%d) was not success (0)";
    }
    else
    {
      if (![v12 currentRemoteBTDevice] || (objc_msgSend(v12, "carPlaySupported") & 1) != 0)
      {
        if (![v12 currentRemoteBTDevice])
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v21 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCOOBBTPairingAccessory init]();
            }
            v21 = MEMORY[0x263EF8438];
            id v30 = MEMORY[0x263EF8438];
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v32 = 0;
            _os_log_impl(&dword_221CBA000, v21, OS_LOG_TYPE_DEFAULT, "No stored remote BTDevice, not connecting.", v32, 2u);
          }
        }
        if (![v12 carPlaySupported]) {
          goto LABEL_39;
        }
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id v20 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCOOBBTPairingAccessory init]();
          }
          id v20 = MEMORY[0x263EF8438];
          id v31 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_38:

LABEL_39:
          objc_msgSend(v12, "setCurrentRemoteMACAddress:", 0, *(void *)v32);
          if (v8)
          {
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            [WeakRetained stopOOBBTPairing:v12];
          }
          goto LABEL_41;
        }
        *(_WORD *)int v32 = 0;
        id v23 = "BT connection not initiated due to CarPlay support.";
        v24 = v20;
        os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
        uint32_t v26 = 2;
LABEL_37:
        _os_log_impl(&dword_221CBA000, v24, v25, v23, v32, v26);
        goto LABEL_38;
      }
      [v12 currentRemoteBTDevice];
      int v28 = BTDeviceConnect();
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v20 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCOOBBTPairingAccessory init]();
        }
        id v20 = MEMORY[0x263EF8438];
        id v29 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
      *(_DWORD *)int v32 = 67109120;
      *(_DWORD *)&v32[4] = v28;
      id v23 = "BTDeviceConnect(device) result (zero == success): %d";
    }
    v24 = v20;
    os_log_type_t v25 = OS_LOG_TYPE_INFO;
    uint32_t v26 = 8;
    goto LABEL_37;
  }
LABEL_41:
}

- (id)getUID
{
  return self->_uid;
}

- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, MEMORY[0x263F230B8]);
  if (!string)
  {
    if (gLogObjects) {
      BOOL v8 = gNumLogObjects < 1;
    }
    else {
      BOOL v8 = 1;
    }
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      id v10 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    else
    {
      id v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_221CBA000, v10, OS_LOG_TYPE_DEFAULT, "RequestType not specified in xpc message!", (uint8_t *)v23, 2u);
    }

    string = "<nil>";
  }
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    id v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[ACCOOBBTPairingShim tryProcessXPCMessage:connection:server:].cold.4((uint64_t)string, v13);
  }

  int v14 = strcmp(string, "IAPAppBeginOOBPairingStr");
  if (!v14)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, MEMORY[0x263F230B0]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v17 = [WeakRetained oobBtAccessoryForConnectionID:uint64];

    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCOOBBTPairingAccessory init]();
      }
      int v18 = MEMORY[0x263EF8438];
      id v19 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v23[0] = 67109378;
      v23[1] = uint64;
      __int16 v24 = 2112;
      os_log_type_t v25 = v17;
      _os_log_impl(&dword_221CBA000, v18, OS_LOG_TYPE_INFO, "Handling kXPCIAPAppBeginOOBPairingStr: connectionID=%d accessory=%@", (uint8_t *)v23, 0x12u);
    }

    if (v17) {
      [(ACCOOBBTPairingShim *)self beginPairingWithCurrentAccessory:v17];
    }
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCOOBBTPairingAccessory init]();
    }
    id v20 = MEMORY[0x263EF8438];
    id v21 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    -[ACCOOBBTPairingShim tryProcessXPCMessage:connection:server:]((uint64_t)string, v14 == 0, v20);
  }

  return v14 == 0;
}

- (ACCOOBBTPairingShimProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCOOBBTPairingShimProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "failed to set link key", v2, v3, v4, v5, v6);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "failed to generate link key", v2, v3, v4, v5, v6);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "failed to get BT pairing status", v2, v3, v4, v5, v6);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "failed to get BTDevice from address", v2, v3, v4, v5, v6);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "unable to get local BT device MAC address", v2, v3, v4, v5, v6);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_221CBA000, v0, v1, "failed to get local BT device", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(char)a2 server:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_221CBA000, log, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s processed=%d", (uint8_t *)&v3, 0x12u);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(NSObject *)a2 server:.cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_221CBA000, a2, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s", (uint8_t *)&v2, 0xCu);
}

@end