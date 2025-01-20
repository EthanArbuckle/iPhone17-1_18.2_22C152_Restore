void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
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
  v2 = &off_222242000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    v6 = MEMORY[0x263EF8438];
    do
    {
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_22223C000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          uint64_t v7 = *(void *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
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
          _os_log_debug_impl(&dword_22223C000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        __int16 v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_22223C000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_222242000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 57);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_22223C000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(void *)(a1 + 40);
  gNumLogSignpostObjects = v11;
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

void _AttachToBTServer(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    uint64_t v4 = MEMORY[0x263EF8438];
    id v3 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v4 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v1;
    _os_log_impl(&dword_22223C000, v4, OS_LOG_TYPE_INFO, "_AttachToBTServer object=%@", buf, 0xCu);
  }

  if ([v1 btUpdatesStarted])
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      uint64_t v5 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      uint64_t v5 = MEMORY[0x263EF8438];
      id v9 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v1;
      _os_log_impl(&dword_22223C000, v5, OS_LOG_TYPE_INFO, "btUpdates NOT Started, object=%@", buf, 0xCu);
    }
  }
  else
  {
    *(void *)buf = _BTSessionCallback;
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.iaptransportd-%d", getpid());
    uint64_t v5 = objc_claimAutoreleasedReturnValue();
    [v5 cStringUsingEncoding:4];
    uint64_t v6 = [v1 btEventQueue];
    int v7 = BTSessionAttachWithQueue();

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        uint64_t v8 = MEMORY[0x263EF8438];
        id v10 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)unint64_t v11 = 67109120;
        int v12 = v7;
        _os_log_impl(&dword_22223C000, v8, OS_LOG_TYPE_DEFAULT, "ERROR - failed attaching to BT server, result=%d", v11, 8u);
      }

      [v1 setBtSession:0];
    }
    else
    {
      [v1 setBtUpdatesStarted:1];
    }
  }
}

unint64_t _BTGetAccessoryManager(uint64_t a1)
{
  unint64_t v11 = 0xAAAAAAAAAAAAAAAALL;
  if (!a1)
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 1;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      uint64_t v6 = MEMORY[0x263EF8438];
      id v4 = MEMORY[0x263EF8438];
    }
    else
    {
      uint64_t v6 = *(id *)gLogObjects;
    }
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    int v7 = "Error - NULL BT session";
    uint64_t v8 = buf;
    goto LABEL_24;
  }
  if (!BTAccessoryManagerGetDefault()) {
    return v11;
  }
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 1;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    uint64_t v6 = MEMORY[0x263EF8438];
    id v2 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    __int16 v9 = 0;
    int v7 = "Error - Failed to get BT Accessory Manager";
    uint64_t v8 = (uint8_t *)&v9;
LABEL_24:
    _os_log_impl(&dword_22223C000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
  }
LABEL_25:

  return 0;
}

uint64_t _BTGetDevice(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = v7;
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v28 = 0;
  int v26 = -1431655766;
  __int16 v25 = -21846;
  int v24 = -1431655766;
  uint64_t v29 = 0;
  if (a1 && a2 && v7 && a4)
  {
    id v9 = [v7 name];
    [v9 UTF8String];

    id v10 = [v8 macAddr];
    [v10 getBytes:&v24 length:6];

    if (BTLocalDeviceGetDefault())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        unint64_t v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        unint64_t v11 = MEMORY[0x263EF8438];
        id v16 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_39;
      }
      *(_WORD *)v23 = 0;
      int v17 = "Error - Failed to get local BT device";
LABEL_38:
      _os_log_impl(&dword_22223C000, v11, OS_LOG_TYPE_INFO, v17, v23, 2u);
LABEL_39:

      uint64_t v15 = 1;
      goto LABEL_40;
    }
    if (BTLocalDeviceGetModulePower())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        unint64_t v11 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        unint64_t v11 = MEMORY[0x263EF8438];
        id v19 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
        goto LABEL_39;
      }
      *(_WORD *)v23 = 0;
      int v17 = "Error - Failed to get local BT device power status";
      goto LABEL_38;
    }
    if (BTAccessoryManagerRegisterDevice())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v18 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginBluetooth accessoryAttached:]();
        }
        uint64_t v18 = MEMORY[0x263EF8438];
        id v22 = MEMORY[0x263EF8438];
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_50;
      }
      *(_WORD *)v23 = 0;
      v21 = "Error - Failed to get device.";
    }
    else
    {
      if (v26 == -1)
      {
        uint64_t v15 = 0;
        goto LABEL_40;
      }
      uint64_t v18 = logObjectForModule();
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO)) {
        goto LABEL_50;
      }
      *(_WORD *)v23 = 0;
      v21 = "Error - Bluetooth is not enabled.";
    }
    _os_log_impl(&dword_22223C000, v18, OS_LOG_TYPE_INFO, v21, v23, 2u);
LABEL_50:

    uint64_t v15 = 0;
    *a4 = 0;
    goto LABEL_40;
  }
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    uint64_t v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_22223C000, v14, OS_LOG_TYPE_INFO, "Error - NULL parameter", v23, 2u);
  }

  uint64_t v15 = 3;
LABEL_40:

  return v15;
}

void __notifyComponentStatus(void *a1, void *a2, char a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  if (v5 && v6)
  {
    int v17 = 0;
    uint64_t v8 = [v6 macAddr];

    if (v8 && (a3 & 1) == 0)
    {
      __int16 v16 = -21846;
      int v15 = -1431655766;
      id v9 = [v7 macAddr];
      [v9 getBytes:&v15 length:6];

      unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
      if (![v5 btSession] || BTDeviceFromAddress())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          id v10 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCPlatformPluginBluetooth accessoryAttached:]();
          }
          id v10 = MEMORY[0x263EF8438];
          id v11 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl(&dword_22223C000, v10, OS_LOG_TYPE_DEFAULT, "ERROR - BTDeviceFromAddress failed.", v13, 2u);
        }
        goto LABEL_18;
      }
      if (BTDeviceGetConnectedServices()) {
        int v17 = 0;
      }
    }
    id v10 = [v7 accessoryUID];
    BOOL v12 = [v7 componentUID];
    _sendBluetoothConnectionStatusNotification(v10, v12, v17);

LABEL_18:
  }
}

void _sendBluetoothConnectionStatusNotification(void *a1, void *a2, int a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (a3)
  {
    BOOL v12 = [NSNumber numberWithInt:0];
    [v8 addObject:v12];

    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  id v13 = [NSNumber numberWithInt:1];
  [v8 addObject:v13];

  if ((a3 & 8) == 0)
  {
LABEL_4:
    if ((a3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v14 = [NSNumber numberWithInt:3];
  [v8 addObject:v14];

  if ((a3 & 0x10) == 0)
  {
LABEL_5:
    if ((a3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  int v15 = [NSNumber numberWithInt:4];
  [v8 addObject:v15];

  if ((a3 & 0x20) == 0)
  {
LABEL_6:
    if ((a3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  __int16 v16 = [NSNumber numberWithInt:5];
  [v8 addObject:v16];

  if ((a3 & 0x40) == 0)
  {
LABEL_7:
    if ((a3 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  int v17 = [NSNumber numberWithInt:6];
  [v8 addObject:v17];

  if ((a3 & 0x80) == 0)
  {
LABEL_8:
    if ((a3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v18 = [NSNumber numberWithInt:7];
  [v8 addObject:v18];

  if ((a3 & 0x100) == 0)
  {
LABEL_9:
    if ((a3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  id v19 = [NSNumber numberWithInt:8];
  [v8 addObject:v19];

  if ((a3 & 0x200) == 0)
  {
LABEL_10:
    if ((a3 & 0x400) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  v20 = [NSNumber numberWithInt:9];
  [v8 addObject:v20];

  if ((a3 & 0x400) == 0)
  {
LABEL_11:
    if ((a3 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  v21 = [NSNumber numberWithInt:10];
  [v8 addObject:v21];

  if ((a3 & 0x800) == 0)
  {
LABEL_12:
    if ((a3 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  id v22 = [NSNumber numberWithInt:11];
  [v8 addObject:v22];

  if ((a3 & 0x1000) == 0)
  {
LABEL_13:
    if ((a3 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  v23 = [NSNumber numberWithInt:12];
  [v8 addObject:v23];

  if ((a3 & 0x2000) == 0)
  {
LABEL_14:
    if ((a3 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  int v24 = [NSNumber numberWithInt:13];
  [v8 addObject:v24];

  if ((a3 & 0x4000) == 0)
  {
LABEL_15:
    if ((a3 & 0x8000) == 0) {
      goto LABEL_16;
    }
LABEL_35:
    int v26 = [NSNumber numberWithInt:15];
    [v8 addObject:v26];

    if ((a3 & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_34:
  __int16 v25 = [NSNumber numberWithInt:14];
  [v8 addObject:v25];

  if ((a3 & 0x8000) != 0) {
    goto LABEL_35;
  }
LABEL_16:
  if ((a3 & 0x10000) != 0)
  {
LABEL_17:
    id v9 = [NSNumber numberWithInt:16];
    [v8 addObject:v9];
  }
LABEL_18:
  [v7 setObject:v5 forKey:@"ACCBluetoothStatusComponentUpdateInfoAccessoryUID"];
  [v7 setObject:v6 forKey:@"ACCBluetoothStatusComponentUpdateInfoUID"];
  [v7 setObject:v8 forKey:@"ACCBluetoothStatusComponentUpdateInfoProfiles"];
  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"ACCBluetoothStatusComponentUpdateNotification" object:0 userInfo:v7];

  if (gLogObjects && gNumLogObjects >= 1)
  {
    id v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    id v11 = MEMORY[0x263EF8438];
    id v27 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v28[0] = 67109890;
    v28[1] = a3;
    __int16 v29 = 1024;
    int v30 = 131067;
    __int16 v31 = 2112;
    id v32 = v5;
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_22223C000, v11, OS_LOG_TYPE_DEFAULT, "BluetoothConnectionStatusNotification: service mask 0x%04X(0x%04X), accessoryUID: %@, componentUID: %@", (uint8_t *)v28, 0x22u);
  }
}

void _BTSessionCallback(uint64_t a1, int a2, int a3, void *a4)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (gLogObjects) {
      BOOL v5 = gNumLogObjects < 1;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      id v11 = MEMORY[0x263EF8438];
      id v6 = MEMORY[0x263EF8438];
    }
    else
    {
      id v11 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_22223C000, v11, OS_LOG_TYPE_DEFAULT, "ERROR - called with a BTResult of %d", buf, 8u);
    }
    goto LABEL_50;
  }
  id v11 = a4;
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 1;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    BOOL v12 = MEMORY[0x263EF8438];
    id v10 = MEMORY[0x263EF8438];
  }
  else
  {
    BOOL v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_22223C000, v12, OS_LOG_TYPE_INFO, "_BTSessionCallback object=%@", buf, 0xCu);
  }

  if (a2 == 2)
  {
    [v11 setBtSession:0];
    [v11 iterateRegisteredComponentsForKnownAddresses:0 allOFF:1];
    _AttachToBTServer(v11);
    goto LABEL_50;
  }
  if (!a2)
  {
    if (a1)
    {
      [v11 setBtSession:a1];
      if (!BTLocalDeviceGetDefault())
      {
        *(_OWORD *)buf = xmmword_26D4AB460;
        *(void *)&long long v33 = qword_26D4AB470;
        BTLocalDeviceAddCallbacks();
      }
      BTServiceAddCallbacks();
      BTAccessoryManagerGetDefault();
      uint64_t v13 = [v11 btSession];
      id v14 = objc_alloc_init(MEMORY[0x263EFF9C0]);
      unint64_t v30 = 0xAAAAAAAAAAAAAAAALL;
      unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v38 = v15;
      long long v39 = v15;
      long long v36 = v15;
      long long v37 = v15;
      long long v34 = v15;
      long long v35 = v15;
      *(_OWORD *)buf = v15;
      long long v33 = v15;
      if (v13 && !BTLocalDeviceGetDefault())
      {
        if (!BTLocalDeviceGetConnectedDevices())
        {
          uint64_t v22 = 0;
          while (1)
          {
            memset(v29, 170, 6);
            if (_BTGetMACAddress()) {
              break;
            }
            v23 = [MEMORY[0x263EFF8F8] dataWithBytes:v29 length:6];
            [v14 addObject:v23];

            if (++v22 >= v30) {
              goto LABEL_75;
            }
          }
          if (gLogObjects) {
            BOOL v25 = gNumLogObjects < 1;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25)
          {
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              -[ACCPlatformPluginBluetooth accessoryAttached:]();
            }
            id v27 = MEMORY[0x263EF8438];
            id v26 = MEMORY[0x263EF8438];
          }
          else
          {
            id v27 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v28 = 0;
            _os_log_impl(&dword_22223C000, v27, OS_LOG_TYPE_DEFAULT, "ERROR - failed getting MAC address for device", v28, 2u);
          }

LABEL_75:
          id v20 = v14;
          goto LABEL_43;
        }
        if (gLogObjects && gNumLogObjects >= 1)
        {
          __int16 v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCPlatformPluginBluetooth accessoryAttached:]();
          }
          __int16 v16 = MEMORY[0x263EF8438];
          id v24 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
LABEL_42:

          id v20 = 0;
LABEL_43:

          [v11 iterateRegisteredComponentsForKnownAddresses:v20 allOFF:0];
          goto LABEL_50;
        }
        *(_WORD *)__int16 v29 = 0;
        id v19 = "ERROR - failed getting connected BT devices";
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          __int16 v16 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[ACCPlatformPluginBluetooth accessoryAttached:]();
          }
          __int16 v16 = MEMORY[0x263EF8438];
          id v18 = MEMORY[0x263EF8438];
        }
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_42;
        }
        *(_WORD *)__int16 v29 = 0;
        id v19 = "ERROR - failed getting local BT device";
      }
      _os_log_impl(&dword_22223C000, v16, OS_LOG_TYPE_DEFAULT, v19, v29, 2u);
      goto LABEL_42;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCPlatformPluginBluetooth accessoryAttached:]();
      }
      int v17 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22223C000, v17, OS_LOG_TYPE_DEFAULT, "ERROR - called with a NULL BTSession", buf, 2u);
    }
  }
LABEL_50:
}

void _BTLocalDeviceCallback(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (gLogObjects) {
    BOOL v6 = gNumLogObjects < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    id v8 = MEMORY[0x263EF8438];
    id v7 = MEMORY[0x263EF8438];
  }
  else
  {
    id v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)BOOL v9 = 138412290;
    *(void *)&v9[4] = v5;
    _os_log_impl(&dword_22223C000, v8, OS_LOG_TYPE_INFO, "_BTLocalDeviceCallback object=%@", v9, 0xCu);
  }

  if (!a2)
  {
    *(_DWORD *)BOOL v9 = -1431655766;
    if (BTLocalDeviceGetModulePower())
    {
      *(_DWORD *)BOOL v9 = 0;
    }
    else if (*(_DWORD *)v9)
    {
      goto LABEL_16;
    }
    objc_msgSend(v5, "iterateRegisteredComponentsForKnownAddresses:allOFF:", 0, 1, *(void *)v9);
  }
LABEL_16:
}

void _BTServiceCallback(uint64_t a1, int a2, int a3, int a4, int a5, void *a6)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v10 = a6;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 1;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginBluetooth accessoryAttached:]();
    }
    uint64_t v13 = MEMORY[0x263EF8438];
    id v12 = MEMORY[0x263EF8438];
  }
  else
  {
    uint64_t v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v10;
    _os_log_impl(&dword_22223C000, v13, OS_LOG_TYPE_INFO, "_BTServiceCallback object=%@", (uint8_t *)&v14, 0xCu);
  }

  if (a3 != 1)
  {
    if (a3 || (a2 & 0x1FFFB) == 0 || a4 != 11 || a5) {
      goto LABEL_20;
    }
LABEL_19:
    _BTPostConnectionStatus(v10);
    goto LABEL_20;
  }
  if ((a2 & 0x1FFFB) != 0 && a4 == 12) {
    goto LABEL_19;
  }
LABEL_20:
}

void _BTPostConnectionStatus(void *a1)
{
  id v1 = a1;
  __int16 v6 = -21846;
  int v5 = -1431655766;
  if (!_BTGetMACAddress())
  {
    id v2 = (void *)MEMORY[0x263EFFA08];
    BOOL v3 = [MEMORY[0x263EFF8F8] dataWithBytes:&v5 length:6];
    id v4 = [v2 setWithObject:v3];

    [v1 iterateRegisteredComponentsForKnownAddresses:v4 allOFF:0];
  }
}

uint64_t _BTGetMACAddress()
{
  uint64_t result = BTDeviceGetAddressString();
  if (!result) {
    return BTDeviceAddressFromString();
  }
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 3, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
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
  id v2 = &off_222242000;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    int v5 = 0;
    __int16 v6 = MEMORY[0x263EF8438];
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
          _os_log_error_impl(&dword_22223C000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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
          uint64_t v13 = v8;
          __int16 v14 = 2080;
          id v15 = v9;
          _os_log_debug_impl(&dword_22223C000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        id v15 = v9;
        _os_log_error_impl(&dword_22223C000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      unint64_t v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    id v2 = &off_222242000;
  }
  else
  {
    LODWORD(v11) = 0;
    int v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((void *)v2 + 57);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_22223C000, MEMORY[0x263EF8438], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(void *)(a1 + 40);
  gNumLogObjects = v11;
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_22223C000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_22223C000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x270F4A998]();
}

uint64_t BTAccessoryManagerPlugInDevice()
{
  return MEMORY[0x270F4AA88]();
}

uint64_t BTAccessoryManagerRegisterDevice()
{
  return MEMORY[0x270F4AA98]();
}

uint64_t BTAccessoryManagerUnplugDevice()
{
  return MEMORY[0x270F4AB28]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x270F4AB30]();
}

uint64_t BTDeviceConnect()
{
  return MEMORY[0x270F4AB40]();
}

uint64_t BTDeviceDisconnect()
{
  return MEMORY[0x270F4AB50]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x270F4AB58]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x270F4AB68]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x270F4AB78]();
}

uint64_t BTDeviceGetName()
{
  return MEMORY[0x270F4ABC0]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x270F4AC70]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x270F4ACA0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x270F4ACB8]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x270F4ACD8]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x270F4AD78]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x270F4AD90]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x270F4AD98]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}