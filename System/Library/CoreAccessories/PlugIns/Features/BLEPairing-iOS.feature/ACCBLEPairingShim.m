@interface ACCBLEPairingShim
- (ACCBLEPairingShim)initWithDelegate:(id)a3;
- (ACCBLEPairingShimProtocol)delegate;
- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5;
- (NSString)uid;
- (id)description;
- (id)getUID;
- (void)accessoryAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6;
- (void)accessoryDetached:(id)a3 blePairingUUID:(id)a4;
- (void)dataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)stateUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfoList:(id)a6;
- (void)stateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8;
@end

@implementation ACCBLEPairingShim

- (ACCBLEPairingShim)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCBLEPairingShim;
  v5 = [(ACCBLEPairingShim *)&v10 init];
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
  v4.super_class = (Class)ACCBLEPairingShim;
  [(ACCBLEPairingShim *)&v4 dealloc];
}

- (id)description
{
  v2 = NSString;
  uid = self->_uid;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = [v2 stringWithFormat:@"<ACCBLEPairingShim>[_uid=%@ _delegate=%@]", uid, WeakRetained];

  return v5;
}

- (void)accessoryAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (gLogObjects) {
    BOOL v13 = gNumLogObjects < 1;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
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
    id v39 = v9;
    __int16 v40 = 2112;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    __int16 v44 = 2112;
    id v45 = v12;
    _os_log_impl(&dword_225708000, v15, OS_LOG_TYPE_INFO, "accessoryAttached: %@, blePairingUUID=%@, accInfoDict=%@ supportedPairTypes=%@", buf, 0x2Au);
  }

  if (v9 && v10 && v12)
  {
    id v34 = v11;
    id v35 = v10;
    [MEMORY[0x263F23098] postNotifydNotificationType:*MEMORY[0x263F22C70]];
    v16 = [v9 iap2ShimAccessory];
    v17 = [v16 accessoryInfoDict];
    v18 = [v17 mutableCopy];

    v19 = [NSNumber numberWithBool:1];
    [v18 setObject:v19 forKey:*MEMORY[0x263F22C68]];

    v20 = NSNumber;
    v21 = [v9 iap2ShimAccessory];
    uint64_t v22 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "connectionID"));

    v36[0] = *MEMORY[0x263F22C18];
    v33 = [v9 iap2ShimAccessory];
    v23 = [v33 manufacturer];
    v24 = v23;
    if (!v23)
    {
      v24 = [MEMORY[0x263EFF9D0] null];
    }
    v37[0] = v24;
    v36[1] = *MEMORY[0x263F22C20];
    v25 = [v9 iap2ShimAccessory];
    v26 = [v25 model];
    v27 = v26;
    if (!v26)
    {
      v27 = [MEMORY[0x263EFF9D0] null];
    }
    uint64_t v28 = *MEMORY[0x263F22C38];
    v37[1] = v27;
    v37[2] = v22;
    v29 = (void *)v22;
    uint64_t v30 = *MEMORY[0x263F22CA8];
    v36[2] = v28;
    v36[3] = v30;
    v36[4] = *MEMORY[0x263F22CA0];
    v37[3] = v35;
    v37[4] = v12;
    v31 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:5];
    if (!v26) {

    }
    if (!v23) {
    [MEMORY[0x263F23098] notifyInterestedClientsOfACCBLEAccessoryEvent:*MEMORY[0x263F22C40] withPayload:v31];
    }

    id v11 = v34;
    id v10 = v35;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      v18 = MEMORY[0x263EF8438];
      id v32 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v39 = v9;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 2112;
      id v43 = v12;
      _os_log_impl(&dword_225708000, v18, OS_LOG_TYPE_DEFAULT, "Invalid bleAccessory(%@) or blePairingUUID(%@) or supportedPairTypes(%@)", buf, 0x20u);
    }
  }
}

- (void)accessoryDetached:(id)a3 blePairingUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v5;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_225708000, v9, OS_LOG_TYPE_INFO, "accessoryDetached: %@, blePairingUUID=%@", buf, 0x16u);
  }

  if (v5 && v6)
  {
    id v10 = NSNumber;
    id v11 = [v5 iap2ShimAccessory];
    id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "connectionID"));

    uint64_t v13 = *MEMORY[0x263F22CA8];
    v16[0] = *MEMORY[0x263F22C38];
    v16[1] = v13;
    v17[0] = v12;
    v17[1] = v6;
    id v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    [MEMORY[0x263F23098] notifyInterestedClientsOfACCBLEAccessoryEvent:*MEMORY[0x263F22C48] withPayload:v14];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      id v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      id v12 = MEMORY[0x263EF8438];
      id v15 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_225708000, v12, OS_LOG_TYPE_DEFAULT, "Invalid bleAccessory(%@) or blePairingUUID(%@)", buf, 0x16u);
    }
  }
}

- (void)stateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v17 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413570;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 1024;
    unsigned int v35 = a5;
    __int16 v36 = 1024;
    BOOL v37 = v10;
    __int16 v38 = 1024;
    int v39 = a7;
    __int16 v40 = 1024;
    BOOL v41 = v8;
    _os_log_impl(&dword_225708000, v17, OS_LOG_TYPE_INFO, "stateUpdate: %@ blePairingUUID:%@ validMask:%xh btRadioOn:%d pairingState:%d pairingModeOn:%d", buf, 0x2Eu);
  }

  if (v13 && v14 && a5)
  {
    v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v19 = NSNumber;
    __int16 v20 = [v13 iap2ShimAccessory];
    id v21 = objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "connectionID"));

    uint64_t v22 = *MEMORY[0x263F22CA8];
    v28[0] = *MEMORY[0x263F22C38];
    v28[1] = v22;
    v29[0] = v21;
    v29[1] = v14;
    v23 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    [v18 addEntriesFromDictionary:v23];

    if (a5)
    {
      v26 = [NSNumber numberWithBool:v10];
      [v18 setObject:v26 forKey:*MEMORY[0x263F22C98]];

      if ((a5 & 2) == 0)
      {
LABEL_16:
        if ((a5 & 4) == 0)
        {
LABEL_18:
          [MEMORY[0x263F23098] notifyInterestedClientsOfACCBLEAccessoryEvent:*MEMORY[0x263F22C60] withPayload:v18];

          goto LABEL_27;
        }
LABEL_17:
        v24 = [NSNumber numberWithBool:v8];
        [v18 setObject:v24 forKey:*MEMORY[0x263F22C88]];

        goto LABEL_18;
      }
    }
    else if ((a5 & 2) == 0)
    {
      goto LABEL_16;
    }
    v27 = [NSNumber numberWithChar:(char)a7];
    [v18 setObject:v27 forKey:*MEMORY[0x263F22C90]];

    if ((a5 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v18 = MEMORY[0x263EF8438];
    id v25 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v31 = v13;
    __int16 v32 = 2112;
    id v33 = v14;
    __int16 v34 = 1024;
    unsigned int v35 = a5;
    _os_log_impl(&dword_225708000, v18, OS_LOG_TYPE_DEFAULT, "Invalid bleAccessory(%@) or blePairingUUID(%@) or validMask(%x)", buf, 0x1Cu);
  }
LABEL_27:
}

- (void)stateUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfoList:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    id v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 1024;
    int v27 = a5;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_225708000, v14, OS_LOG_TYPE_INFO, "stateUpdate: %@ blePairingUUID:%@ pairType:%d pairInfoList:%@", buf, 0x26u);
  }

  if (v9 && v10 && a5 <= 1)
  {
    BOOL v15 = NSNumber;
    id v16 = [v9 iap2ShimAccessory];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "connectionID"));

    uint64_t v18 = *MEMORY[0x263F22CA8];
    v20[0] = *MEMORY[0x263F22C38];
    v20[1] = v18;
    v21[0] = v17;
    v21[1] = v10;
    v20[2] = *MEMORY[0x263F22C80];
    v21[2] = v11;
    id v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    [MEMORY[0x263F23098] notifyInterestedClientsOfACCBLEAccessoryEvent:*MEMORY[0x263F22C58] withPayload:v19];
  }
}

- (void)dataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (gLogObjects) {
    BOOL v12 = gNumLogObjects < 1;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    id v14 = MEMORY[0x263EF8438];
    id v13 = MEMORY[0x263EF8438];
  }
  else
  {
    id v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    __int16 v26 = 1024;
    int v27 = a5;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_225708000, v14, OS_LOG_TYPE_INFO, "dataUpdate: %@ blePairingUUID:%@ pairType:%d pairData:%@", buf, 0x26u);
  }

  if (v9 && v10 && a5 <= 1)
  {
    BOOL v15 = NSNumber;
    id v16 = [v9 iap2ShimAccessory];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "connectionID"));

    uint64_t v18 = *MEMORY[0x263F22CA8];
    v20[0] = *MEMORY[0x263F22C38];
    v20[1] = v18;
    v21[0] = v17;
    v21[1] = v10;
    v20[2] = *MEMORY[0x263F22C78];
    v21[2] = v11;
    id v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    [MEMORY[0x263F23098] notifyInterestedClientsOfACCBLEAccessoryEvent:*MEMORY[0x263F22C50] withPayload:v19];
  }
}

- (id)getUID
{
  return self->_uid;
}

- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5
{
  id v7 = a3;
  BOOL v8 = (_xpc_connection_s *)a4;
  string = xpc_dictionary_get_string(v7, MEMORY[0x263F230B8]);
  unint64_t v10 = 0x26ABFC000uLL;
  unint64_t v11 = 0x26ABFC000uLL;
  if (!string)
  {
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects < 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingFeaturePlugin startPlugin]();
      }
      id v14 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    else
    {
      id v14 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v75[0]) = 0;
      _os_log_impl(&dword_225708000, v14, OS_LOG_TYPE_DEFAULT, "RequestType not specified in xpc message!", (uint8_t *)v75, 2u);
    }

    string = "<nil>";
  }
  if (gLogObjects) {
    BOOL v15 = gNumLogObjects < 1;
  }
  else {
    BOOL v15 = 1;
  }
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v17 = MEMORY[0x263EF8438];
    id v16 = MEMORY[0x263EF8438];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:]4((uint64_t)string, v17);
  }

  if (!strcmp(string, "IAPBluetoothDeviceGetAccessoryPairingInfo"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (reply)
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(v7, MEMORY[0x263F230B0]);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v22 = [WeakRetained bleAccessoryForConnectionID:uint64];

      if (v22)
      {
        id v23 = [v22 blePairingUUID];
        __int16 v24 = [v22 supportedPairTypes];
        id v25 = [v22 iap2ShimAccessory];
        id v26 = [v25 manufacturer];
        xpc_dictionary_set_string(reply, "btInfoAccessoryMfg", (const char *)[v26 UTF8String]);

        int v27 = [v22 iap2ShimAccessory];
        id v28 = [v27 model];
        xpc_dictionary_set_string(reply, "btInfoAccessoryModel", (const char *)[v28 UTF8String]);

        unint64_t v11 = 0x26ABFC000;
        id v29 = v23;
        xpc_dictionary_set_data(reply, "btInfoPairUUID", (const void *)[v29 bytes], objc_msgSend(v29, "length"));
        id v30 = v24;
        uint64_t v31 = [v30 bytes];
        size_t v32 = [v30 length];
        id v33 = (const void *)v31;
        unint64_t v10 = 0x26ABFC000;
        xpc_dictionary_set_data(reply, "btInfoPairTypes", v33, v32);

        uint64_t v34 = 0;
      }
      else
      {
        uint64_t v34 = 19;
      }
      xpc_dictionary_set_uint64(reply, MEMORY[0x263F230B0], uint64);
      xpc_dictionary_set_uint64(reply, MEMORY[0x263F230C0], v34);
      xpc_connection_send_message(v8, reply);
      [MEMORY[0x263F23098] markClientAsInterestedInBleNotifications:v8];
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingFeaturePlugin startPlugin]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v58 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:]();
      }
    }
    goto LABEL_102;
  }
  if (!strcmp(string, "IAPBluetoothDeviceStartBLEUpdates"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingFeaturePlugin startPlugin]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v64 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.5();
      }
      goto LABEL_102;
    }
    uint64_t v35 = xpc_dictionary_get_uint64(v7, MEMORY[0x263F230B0]);
    p_delegate = &self->_delegate;
    id v37 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [v37 bleAccessoryForConnectionID:v35];

    if (!v22)
    {
      NSLog(&cfstr_ErrorDevicesta.isa);
      goto LABEL_100;
    }
    uint64_t v38 = xpc_dictionary_get_uint64(v7, "btParmPairType");
    BOOL v39 = xpc_dictionary_get_BOOL(v7, "btParmUpdatesRadio");
    BOOL v40 = xpc_dictionary_get_BOOL(v7, "btParmUpdatesPairInfo");
    [v22 setSelectedPairType:v38];
    id v41 = objc_loadWeakRetained((id *)p_delegate);
    BOOL v42 = v40;
    unint64_t v10 = 0x26ABFC000;
    [v41 deviceStartBLEUpdates:v22 pairType:v38 btRadio:v39 pairInfo:v42];
LABEL_39:

LABEL_60:
    uint64_t v63 = 0;
LABEL_101:
    xpc_dictionary_set_uint64(reply, MEMORY[0x263F230C0], v63);
    xpc_connection_send_message(v8, reply);
LABEL_102:

    char v18 = 1;
    goto LABEL_103;
  }
  if (!strcmp(string, "IAPBluetoothDeviceStateUpdate"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingFeaturePlugin startPlugin]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v68 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.7();
      }
      goto LABEL_102;
    }
    uint64_t v43 = xpc_dictionary_get_uint64(v7, MEMORY[0x263F230B0]);
    __int16 v44 = &self->_delegate;
    id v45 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [v45 bleAccessoryForConnectionID:v43];

    if (!v22)
    {
      NSLog(&cfstr_ErrorDevicesta_0.isa);
      goto LABEL_100;
    }
    uint64_t v46 = xpc_dictionary_get_uint64(v7, "btParmPairStatus");
    BOOL v47 = xpc_dictionary_get_BOOL(v7, "btParmRadioOn");
    BOOL v48 = xpc_dictionary_get_BOOL(v7, "btParmPairModeOn");
    BOOL v49 = xpc_dictionary_get_BOOL(v7, "bParmForceUpdates");
    id v41 = objc_loadWeakRetained((id *)v44);
    BOOL v50 = v48;
    unint64_t v10 = 0x26ABFC000;
    BOOL v51 = v49;
    unint64_t v11 = 0x26ABFC000;
    [v41 deviceStateUpdate:v22 btRadio:v47 pairStatus:v46 pairModeOn:v50 forceUpdates:v51];
    goto LABEL_39;
  }
  if (!strcmp(string, "IAPBluetoothDevicePairingData"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingFeaturePlugin startPlugin]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v69 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:].cold.9();
      }
      goto LABEL_102;
    }
    uint64_t v52 = xpc_dictionary_get_uint64(v7, MEMORY[0x263F230B0]);
    v53 = &self->_delegate;
    id v54 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [v54 bleAccessoryForConnectionID:v52];

    if (!v22)
    {
      NSLog(&cfstr_ErrorDevicepai.isa);
      goto LABEL_100;
    }
    v75[0] = 0;
    data = xpc_dictionary_get_data(v7, "btParmPairData", v75);
    v56 = [MEMORY[0x263EFF8F8] dataWithBytes:data length:v75[0]];
    id v57 = objc_loadWeakRetained((id *)v53);
    objc_msgSend(v57, "deviceSend:pairType:pairingData:", v22, -[NSObject selectedPairType](v22, "selectedPairType"), v56);
LABEL_59:

    goto LABEL_60;
  }
  if (!strcmp(string, "IAPBluetoothDevicePairingInfoUpdate"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        uint64_t v22 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[ACCBLEPairingFeaturePlugin startPlugin]();
        }
        uint64_t v22 = MEMORY[0x263EF8438];
        id v70 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:]1();
      }
      goto LABEL_102;
    }
    uint64_t v59 = xpc_dictionary_get_uint64(v7, MEMORY[0x263F230B0]);
    v60 = &self->_delegate;
    id v61 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [v61 bleAccessoryForConnectionID:v59];

    if (!v22)
    {
      NSLog(&cfstr_ErrorDevicepai_0.isa);
      goto LABEL_100;
    }
    v75[0] = 0;
    v62 = xpc_dictionary_get_data(v7, "btParmPairInfo", v75);
    v56 = [MEMORY[0x263EFF8F8] dataWithBytes:v62 length:v75[0]];
    id v57 = objc_loadWeakRetained((id *)v60);
    objc_msgSend(v57, "deviceUpdate:pairType:pairInfo:", v22, -[NSObject selectedPairType](v22, "selectedPairType"), v56);
    goto LABEL_59;
  }
  if (!strcmp(string, "IAPBluetoothDeviceStopBLEUpdates"))
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v7);
    if (!reply)
    {
      uint64_t v22 = logObjectForModule();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:]3();
      }
      goto LABEL_102;
    }
    uint64_t v65 = xpc_dictionary_get_uint64(v7, MEMORY[0x263F230B0]);
    v66 = &self->_delegate;
    id v67 = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v22 = [v67 bleAccessoryForConnectionID:v65];

    if (v22)
    {
      id v41 = objc_loadWeakRetained((id *)v66);
      [v41 deviceStopBLEUpdates:v22];
      goto LABEL_39;
    }
    NSLog(&cfstr_ErrorDevicesto.isa);
LABEL_100:
    uint64_t v63 = 19;
    goto LABEL_101;
  }
  char v18 = 0;
LABEL_103:
  v71 = *(id **)(v10 + 3016);
  if (v71 && *(int *)(v11 + 3024) >= 1)
  {
    v72 = *v71;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[ACCBLEPairingFeaturePlugin startPlugin]();
    }
    v72 = MEMORY[0x263EF8438];
    id v73 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    -[ACCBLEPairingShim tryProcessXPCMessage:connection:server:]((uint64_t)string, v18, v72);
  }

  return v18;
}

- (ACCBLEPairingShimProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ACCBLEPairingShimProtocol *)WeakRetained;
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

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(char)a2 server:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 136315394;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_225708000, log, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s processed=%d", (uint8_t *)&v3, 0x12u);
}

- (void)tryProcessXPCMessage:connection:server:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_225708000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceGetAccessoryPairingInfo xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_225708000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceStartBLEUpdatesStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_225708000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceStateUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.9()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_225708000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDevicePairingDataStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.11()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_225708000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDevicePairingInfoUpdateStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:connection:server:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_225708000, v0, v1, "tryProcessXPCMessage: ERROR: Client sent kXPCIAPBluetoothDeviceStopBLEUpdatesStr xpc message without a reply context", v2, v3, v4, v5, v6);
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(NSObject *)a2 server:.cold.14(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_225708000, a2, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s", (uint8_t *)&v2, 0xCu);
}

@end