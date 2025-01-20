@interface ACCiAP2ShimAccessory
- (ACCiAP2ShimAccessory)initWithUID:(id)a3 keyTag:(id)a4 features:(unsigned int)a5;
- (BOOL)dontPublish;
- (NSString)accessoryUID;
- (NSString)firmwareVersion;
- (NSString)hardwareVersion;
- (NSString)keyAccessoryUID;
- (NSString)keyConnectionID;
- (NSString)keyTag;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)serialNumber;
- (id)accessoryInfoDict;
- (id)connectionIDObj;
- (id)context;
- (id)description;
- (unsigned)connectionID;
- (unsigned)featureTypeMask;
- (void)addFeature:(int)a3;
- (void)removeFeature:(int)a3;
- (void)setConnectionID:(unsigned int)a3;
- (void)setContext:(id)a3;
- (void)setDontPublish:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHardwareVersion:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setSerialNumber:(id)a3;
@end

@implementation ACCiAP2ShimAccessory

- (ACCiAP2ShimAccessory)initWithUID:(id)a3 keyTag:(id)a4 features:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ACCiAP2ShimAccessory;
  v11 = [(ACCiAP2ShimAccessory *)&v25 init];
  if (v11)
  {
    if (_Generate32BitConnectionID_onceToken != -1) {
      dispatch_once(&_Generate32BitConnectionID_onceToken, &__block_literal_global_2);
    }
    if (((_Generate32BitConnectionID_connectionID + 1) & 0xFFFFFF) != 0) {
      int v12 = _Generate32BitConnectionID_connectionID + 1;
    }
    else {
      int v12 = _Generate32BitConnectionID_connectionID + 2;
    }
    _Generate32BitConnectionID_connectionID = v12 & 0xFFFFFF | 0x2000000;
    v11->_connectionID = _Generate32BitConnectionID_connectionID;
    objc_storeStrong((id *)&v11->_accessoryUID, a3);
    objc_storeStrong((id *)&v11->_keyTag, a4);
    name = v11->_name;
    v11->_name = (NSString *)@"TEST_NAME";

    model = v11->_model;
    v11->_model = (NSString *)@"TEST_MODEL";

    manufacturer = v11->_manufacturer;
    v11->_manufacturer = (NSString *)@"TEST_MANUFACTURER";

    serialNumber = v11->_serialNumber;
    v11->_serialNumber = (NSString *)@"TEST_SER_NUM";

    firmwareVersion = v11->_firmwareVersion;
    v11->_firmwareVersion = (NSString *)@"0.0.0";

    hardwareVersion = v11->_hardwareVersion;
    v11->_hardwareVersion = (NSString *)@"0.0.0";

    v11->_featureTypeMask = a5;
    v11->_dontPublish = 0;
    id context = v11->_context;
    v11->_id context = 0;

    uint64_t v20 = [NSString stringWithFormat:@"%@-%@", v11->_keyTag, v11->_accessoryUID];
    keyAccessoryUID = v11->_keyAccessoryUID;
    v11->_keyAccessoryUID = (NSString *)v20;

    uint64_t v22 = [NSString stringWithFormat:@"%@-%u", v11->_keyTag, v11->_connectionID];
    keyConnectionID = v11->_keyConnectionID;
    v11->_keyConnectionID = (NSString *)v22;
  }
  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<ACCiAP2ShimAccessory>[_connectionID=%u _accessoryUID=%@ _keyTag=%@ _featureTypeMask=%xh _dontPublish=%d _name='%@']", self->_connectionID, self->_accessoryUID, self->_keyTag, self->_featureTypeMask, self->_dontPublish, self->_name];
}

- (void)setConnectionID:(unsigned int)a3
{
  self->_connectionID = a3;
  self->_keyConnectionID = [NSString stringWithFormat:@"%@-%lu", self->_keyTag, *(void *)&a3];
  MEMORY[0x270F9A758]();
}

- (id)accessoryInfoDict
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = [NSNumber numberWithUnsignedLong:self->_connectionID];
  [v3 setObject:v4 forKey:*MEMORY[0x263F49DE0]];

  v5 = [NSString stringWithString:self->_name];
  [v3 setObject:v5 forKey:*MEMORY[0x263F49DC8]];

  v6 = [NSString stringWithString:self->_manufacturer];
  [v3 setObject:v6 forKey:*MEMORY[0x263F49DB8]];

  v7 = [NSString stringWithString:self->_model];
  [v3 setObject:v7 forKey:*MEMORY[0x263F49DC0]];

  v8 = [NSString stringWithString:self->_serialNumber];
  [v3 setObject:v8 forKey:*MEMORY[0x263F49DD8]];

  id v9 = [NSString stringWithString:self->_firmwareVersion];
  [v3 setObject:v9 forKey:*MEMORY[0x263F49DA8]];

  id v10 = [NSString stringWithString:self->_hardwareVersion];
  [v3 setObject:v10 forKey:*MEMORY[0x263F49DB0]];

  [v3 setObject:self->_accessoryUID forKey:@"IAPAppAccessoryUIDKey"];
  int v11 = 0;
  uint64_t v12 = 0;
  while (((self->_featureTypeMask >> v11) & 1) == 0)
  {
LABEL_11:
    if (++v11 == 25) {
      goto LABEL_12;
    }
  }
  switch(v11)
  {
    case 3:
LABEL_7:
      uint64_t v12 = v12 | 2;
      goto LABEL_11;
    case 4:
      v13 = [NSNumber numberWithBool:1];
      [v3 setObject:v13 forKey:@"IAPAppBTPairingIsSupportedKey"];

      goto LABEL_11;
    case 5:
      uint64_t v12 = v12 | 0x800;
      goto LABEL_11;
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      goto LABEL_11;
    case 12:
      uint64_t v12 = v12 | 8;
      goto LABEL_11;
    default:
      switch(v11)
      {
        case 15:
          uint64_t v12 = v12 | 0x2000;
          goto LABEL_11;
        case 21:
          goto LABEL_7;
        case 23:
          uint64_t v12 = v12 | 0x80000;
          goto LABEL_11;
        case 24:
          uint64_t v12 = v12 | 0x100000;
          break;
        default:
          goto LABEL_11;
      }
      break;
  }
LABEL_12:
  v14 = [NSNumber numberWithUnsignedInt:v12];
  [v3 setObject:v14 forKey:*MEMORY[0x263F49D98]];

  return v3;
}

- (id)connectionIDObj
{
  return (id)[NSNumber numberWithUnsignedLong:self->_connectionID];
}

- (void)addFeature:(int)a3
{
  self->_featureTypeMask |= 1 << a3;
}

- (void)removeFeature:(int)a3
{
  self->_featureTypeMask &= ~(1 << a3);
}

- (NSString)keyTag
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)keyAccessoryUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)keyConnectionID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unsigned)connectionID
{
  return self->_connectionID;
}

- (unsigned)featureTypeMask
{
  return self->_featureTypeMask;
}

- (NSString)accessoryUID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHardwareVersion:(id)a3
{
}

- (id)context
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setContext:(id)a3
{
}

- (BOOL)dontPublish
{
  return self->_dontPublish;
}

- (void)setDontPublish:(BOOL)a3
{
  self->_dontPublish = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessoryUID, 0);
  objc_storeStrong((id *)&self->_keyConnectionID, 0);
  objc_storeStrong((id *)&self->_keyAccessoryUID, 0);
  objc_storeStrong((id *)&self->_keyTag, 0);
}

@end