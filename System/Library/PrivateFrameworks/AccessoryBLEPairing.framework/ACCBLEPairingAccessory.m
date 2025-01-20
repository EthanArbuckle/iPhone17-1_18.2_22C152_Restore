@interface ACCBLEPairingAccessory
- (ACCBLEPairingAccessory)initWithAccessoryUID:(id)a3 blePairingUUID:(id)a4 andAccInfo:(id)a5 supportedPairTypes:(id)a6;
- (BOOL)blePairingFinished;
- (BOOL)desiredBLEPairingState;
- (NSData)blePairingUUID;
- (NSData)supportedPairTypes;
- (NSDictionary)accInfo;
- (NSString)accessoryUID;
- (void)setAccInfo:(id)a3;
- (void)setAccessoryUID:(id)a3;
- (void)setBlePairingFinished:(BOOL)a3;
- (void)setBlePairingUUID:(id)a3;
- (void)setDesiredBLEPairingState:(BOOL)a3;
- (void)setSupportedPairTypes:(id)a3;
@end

@implementation ACCBLEPairingAccessory

- (ACCBLEPairingAccessory)initWithAccessoryUID:(id)a3 blePairingUUID:(id)a4 andAccInfo:(id)a5 supportedPairTypes:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ACCBLEPairingAccessory;
  v15 = [(ACCBLEPairingAccessory *)&v20 init];
  if (v15)
  {
    id v19 = v11;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]();
      }
      v16 = &_os_log_internal;
      id v17 = &_os_log_internal;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v22 = v19;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_220C96000, v16, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingAccessory init, accessoryUID %@, blePairingUUID %@, accInfo %@, supportedPairTypes %@", buf, 0x2Au);
    }

    objc_storeStrong((id *)&v15->_accessoryUID, a3);
    v15->_desiredBLEPairingState = 0;
    objc_storeStrong((id *)&v15->_accInfo, a5);
    objc_storeStrong((id *)&v15->_blePairingUUID, a4);
    objc_storeStrong((id *)&v15->_supportedPairTypes, a6);
    v15->_blePairingFinished = 0;
    id v11 = v19;
  }

  return v15;
}

- (NSString)accessoryUID
{
  return self->_accessoryUID;
}

- (void)setAccessoryUID:(id)a3
{
}

- (BOOL)desiredBLEPairingState
{
  return self->_desiredBLEPairingState;
}

- (void)setDesiredBLEPairingState:(BOOL)a3
{
  self->_desiredBLEPairingState = a3;
}

- (NSDictionary)accInfo
{
  return self->_accInfo;
}

- (void)setAccInfo:(id)a3
{
}

- (NSData)blePairingUUID
{
  return self->_blePairingUUID;
}

- (void)setBlePairingUUID:(id)a3
{
}

- (NSData)supportedPairTypes
{
  return self->_supportedPairTypes;
}

- (void)setSupportedPairTypes:(id)a3
{
}

- (BOOL)blePairingFinished
{
  return self->_blePairingFinished;
}

- (void)setBlePairingFinished:(BOOL)a3
{
  self->_blePairingFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPairTypes, 0);
  objc_storeStrong((id *)&self->_blePairingUUID, 0);
  objc_storeStrong((id *)&self->_accInfo, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
}

- (void)initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_220C96000, &_os_log_internal, v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

@end