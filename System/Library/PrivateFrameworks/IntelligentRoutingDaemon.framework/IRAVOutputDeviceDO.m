@interface IRAVOutputDeviceDO
+ (BOOL)supportsSecureCoding;
+ (IRAVOutputDeviceDO)aVOutputDeviceDOWithDeviceID:(id)a3 modelID:(id)a4 deviceName:(id)a5 hasAirplayProperties:(BOOL)a6 discoveredOverInfra:(BOOL)a7 discoveredWithBroker:(BOOL)a8 deviceType:(unint64_t)a9 deviceSubType:(unint64_t)a10;
+ (id)AVOutputDeviceToDO:(id)a3;
- (BOOL)discoveredOverInfra;
- (BOOL)discoveredWithBroker;
- (BOOL)hasAirplayProperties;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAVOutputDeviceDO:(id)a3;
- (IRAVOutputDeviceDO)initWithCoder:(id)a3;
- (IRAVOutputDeviceDO)initWithDeviceID:(id)a3 modelID:(id)a4 deviceName:(id)a5 hasAirplayProperties:(BOOL)a6 discoveredOverInfra:(BOOL)a7 discoveredWithBroker:(BOOL)a8 deviceType:(unint64_t)a9 deviceSubType:(unint64_t)a10;
- (NSString)deviceID;
- (NSString)deviceName;
- (NSString)modelID;
- (id)copyWithReplacementDeviceID:(id)a3;
- (id)copyWithReplacementDeviceName:(id)a3;
- (id)copyWithReplacementDeviceSubType:(unint64_t)a3;
- (id)copyWithReplacementDeviceType:(unint64_t)a3;
- (id)copyWithReplacementDiscoveredOverInfra:(BOOL)a3;
- (id)copyWithReplacementDiscoveredWithBroker:(BOOL)a3;
- (id)copyWithReplacementHasAirplayProperties:(BOOL)a3;
- (id)copyWithReplacementModelID:(id)a3;
- (id)description;
- (id)exportAsDictionary;
- (unint64_t)deviceSubType;
- (unint64_t)deviceType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRAVOutputDeviceDO

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_modelID, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceID hash];
  NSUInteger v4 = [(NSString *)self->_modelID hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_deviceName hash];
  uint64_t v6 = self->_hasAirplayProperties - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  uint64_t v7 = self->_discoveredOverInfra - v6 + 32 * v6;
  uint64_t v8 = self->_discoveredWithBroker - v7 + 32 * v7;
  unint64_t v9 = self->_deviceType - v8 + 32 * v8;
  return self->_deviceSubType - v9 + 32 * v9;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (IRAVOutputDeviceDO *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRAVOutputDeviceDO *)self isEqualToAVOutputDeviceDO:v5];

  return v6;
}

- (BOOL)isEqualToAVOutputDeviceDO:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = v4;
  if (!v4) {
    goto LABEL_16;
  }
  int v6 = self->_deviceID != 0;
  uint64_t v7 = [v4 deviceID];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_16;
  }
  deviceID = self->_deviceID;
  if (deviceID)
  {
    v10 = [v5 deviceID];
    int v11 = [(NSString *)deviceID isEqual:v10];

    if (!v11) {
      goto LABEL_16;
    }
  }
  int v12 = self->_modelID != 0;
  v13 = [v5 modelID];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_16;
  }
  modelID = self->_modelID;
  if (modelID)
  {
    v16 = [v5 modelID];
    int v17 = [(NSString *)modelID isEqual:v16];

    if (!v17) {
      goto LABEL_16;
    }
  }
  int v18 = self->_deviceName != 0;
  v19 = [v5 deviceName];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_16;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    v22 = [v5 deviceName];
    int v23 = [(NSString *)deviceName isEqual:v22];

    if (!v23) {
      goto LABEL_16;
    }
  }
  int hasAirplayProperties = self->_hasAirplayProperties;
  if (hasAirplayProperties == [v5 hasAirplayProperties]
    && (int discoveredOverInfra = self->_discoveredOverInfra,
        discoveredOverInfra == [v5 discoveredOverInfra])
    && (int discoveredWithBroker = self->_discoveredWithBroker,
        discoveredWithBroker == [v5 discoveredWithBroker])
    && (unint64_t deviceType = self->_deviceType, deviceType == [v5 deviceType]))
  {
    unint64_t deviceSubType = self->_deviceSubType;
    BOOL v29 = deviceSubType == [v5 deviceSubType];
  }
  else
  {
LABEL_16:
    BOOL v29 = 0;
  }

  return v29;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

+ (id)AVOutputDeviceToDO:(id)a3
{
  id v3 = a3;
  id v4 = [v3 airPlayProperties];

  NSUInteger v5 = [v3 airPlayProperties];
  int v6 = [v5 objectForKeyedSubscript:@"IsDiscoveredOverInfra"];

  if (v6) {
    uint64_t v7 = [v6 BOOLValue];
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = [v3 airPlayProperties];
  unint64_t v9 = [v8 objectForKeyedSubscript:@"IsDiscoveredWithBroker"];

  if (v9) {
    unsigned int v10 = [v9 BOOLValue];
  }
  else {
    unsigned int v10 = 0;
  }
  int v11 = +[IRPreferences shared];
  int v12 = [v11 loiSameSpaceOverrideBrokerForAVODIDArray];
  v13 = [v3 deviceID];
  int v14 = [v12 containsObject:v13];

  uint64_t v15 = v14 | v10;
  v16 = [v3 deviceID];
  int v17 = [v3 modelID];
  int v18 = [v3 deviceName];
  v19 = +[IRAVOutputDeviceDO aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:](IRAVOutputDeviceDO, "aVOutputDeviceDOWithDeviceID:modelID:deviceName:hasAirplayProperties:discoveredOverInfra:discoveredWithBroker:deviceType:deviceSubType:", v16, v17, v18, v4 != 0, v7, v15, [v3 deviceType], objc_msgSend(v3, "deviceSubType"));

  return v19;
}

+ (IRAVOutputDeviceDO)aVOutputDeviceDOWithDeviceID:(id)a3 modelID:(id)a4 deviceName:(id)a5 hasAirplayProperties:(BOOL)a6 discoveredOverInfra:(BOOL)a7 discoveredWithBroker:(BOOL)a8 deviceType:(unint64_t)a9 deviceSubType:(unint64_t)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithDeviceID:v18 modelID:v17 deviceName:v16 hasAirplayProperties:v12 discoveredOverInfra:v11 discoveredWithBroker:v10 deviceType:a9 deviceSubType:a10];

  return (IRAVOutputDeviceDO *)v19;
}

- (IRAVOutputDeviceDO)initWithDeviceID:(id)a3 modelID:(id)a4 deviceName:(id)a5 hasAirplayProperties:(BOOL)a6 discoveredOverInfra:(BOOL)a7 discoveredWithBroker:(BOOL)a8 deviceType:(unint64_t)a9 deviceSubType:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IRAVOutputDeviceDO;
  int v20 = [(IRAVOutputDeviceDO *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceID, a3);
    objc_storeStrong((id *)&v21->_modelID, a4);
    objc_storeStrong((id *)&v21->_deviceName, a5);
    v21->_int hasAirplayProperties = a6;
    v21->_int discoveredOverInfra = a7;
    v21->_int discoveredWithBroker = a8;
    v21->_unint64_t deviceType = a9;
    v21->_unint64_t deviceSubType = a10;
  }

  return v21;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (BOOL)hasAirplayProperties
{
  return self->_hasAirplayProperties;
}

- (BOOL)discoveredWithBroker
{
  return self->_discoveredWithBroker;
}

- (BOOL)discoveredOverInfra
{
  return self->_discoveredOverInfra;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (unint64_t)deviceSubType
{
  return self->_deviceSubType;
}

- (id)exportAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = objc_alloc_init(MEMORY[0x263F08790]);
  [v4 setDateFormat:@"yyyy-MMM-dd HH:mm:ss.SSSSSS"];
  NSUInteger v5 = [(IRAVOutputDeviceDO *)self deviceName];
  [v3 setObject:v5 forKeyedSubscript:@"deviceName"];

  int v6 = [(IRAVOutputDeviceDO *)self deviceID];
  [v3 setObject:v6 forKeyedSubscript:@"deviceID"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[IRAVOutputDeviceDO discoveredOverInfra](self, "discoveredOverInfra"));
  [v3 setObject:v7 forKeyedSubscript:@"discoveredOverInfra"];

  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[IRAVOutputDeviceDO discoveredWithBroker](self, "discoveredWithBroker"));
  [v3 setObject:v8 forKeyedSubscript:@"isDiscoveredWithBroker"];

  unint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", -[IRAVOutputDeviceDO hasAirplayProperties](self, "hasAirplayProperties"));
  [v3 setObject:v9 forKeyedSubscript:@"hasAirplayProperties"];

  BOOL v10 = IRAVOutputDeviceTypeToString([(IRAVOutputDeviceDO *)self deviceType]);
  [v3 setObject:v10 forKeyedSubscript:@"deviceType"];

  BOOL v11 = IRAVOutputDeviceSubTypeToString([(IRAVOutputDeviceDO *)self deviceSubType]);
  [v3 setObject:v11 forKeyedSubscript:@"deviceSubType"];

  return v3;
}

- (id)copyWithReplacementDeviceID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:v4 modelID:self->_modelID deviceName:self->_deviceName hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:self->_discoveredWithBroker deviceType:self->_deviceType deviceSubType:self->_deviceSubType];

  return v5;
}

- (id)copyWithReplacementModelID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:v4 deviceName:self->_deviceName hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:self->_discoveredWithBroker deviceType:self->_deviceType deviceSubType:self->_deviceSubType];

  return v5;
}

- (id)copyWithReplacementDeviceName:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:self->_modelID deviceName:v4 hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:self->_discoveredWithBroker deviceType:self->_deviceType deviceSubType:self->_deviceSubType];

  return v5;
}

- (id)copyWithReplacementHasAirplayProperties:(BOOL)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:self->_modelID deviceName:self->_deviceName hasAirplayProperties:a3 discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:self->_discoveredWithBroker deviceType:self->_deviceType deviceSubType:self->_deviceSubType];
}

- (id)copyWithReplacementDiscoveredOverInfra:(BOOL)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:self->_modelID deviceName:self->_deviceName hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:a3 discoveredWithBroker:self->_discoveredWithBroker deviceType:self->_deviceType deviceSubType:self->_deviceSubType];
}

- (id)copyWithReplacementDiscoveredWithBroker:(BOOL)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:self->_modelID deviceName:self->_deviceName hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:a3 deviceType:self->_deviceType deviceSubType:self->_deviceSubType];
}

- (id)copyWithReplacementDeviceType:(unint64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:self->_modelID deviceName:self->_deviceName hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:self->_discoveredWithBroker deviceType:a3 deviceSubType:self->_deviceSubType];
}

- (id)copyWithReplacementDeviceSubType:(unint64_t)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithDeviceID:self->_deviceID modelID:self->_modelID deviceName:self->_deviceName hasAirplayProperties:self->_hasAirplayProperties discoveredOverInfra:self->_discoveredOverInfra discoveredWithBroker:self->_discoveredWithBroker deviceType:self->_deviceType deviceSubType:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRAVOutputDeviceDO)initWithCoder:(id)a3
{
  v53[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      unint64_t v9 = NSStringFromClass(v8);
      BOOL v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRAVOutputDeviceDO key \"deviceID\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v52 = *MEMORY[0x263F08320];
      v53[0] = v10;
      BOOL v11 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
      BOOL v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRAVOutputDeviceDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_15:

LABEL_16:
LABEL_17:
      int v14 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_6:
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelID"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v15 = (objc_class *)objc_opt_class();
        unint64_t v9 = NSStringFromClass(v15);
        id v16 = (objc_class *)objc_opt_class();
        BOOL v10 = NSStringFromClass(v16);
        BOOL v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRAVOutputDeviceDO key \"modelID\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v50 = *MEMORY[0x263F08320];
        v51 = v11;
        BOOL v12 = [NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
        id v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRAVOutputDeviceDOOCNTErrorDomain" code:3 userInfo:v12];
        [v4 failWithError:v17];
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      id v18 = [v4 error];

      if (v18)
      {
        int v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    unint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v19 = (objc_class *)objc_opt_class();
        BOOL v10 = NSStringFromClass(v19);
        int v20 = (objc_class *)objc_opt_class();
        BOOL v11 = NSStringFromClass(v20);
        BOOL v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRAVOutputDeviceDO key \"deviceName\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v48 = *MEMORY[0x263F08320];
        v49 = v12;
        id v17 = [NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRAVOutputDeviceDOOCNTErrorDomain" code:3 userInfo:v17];
        [v4 failWithError:v21];

        goto LABEL_14;
      }
    }
    else
    {
      objc_super v23 = [v4 error];

      if (v23) {
        goto LABEL_17;
      }
    }
    uint64_t v24 = [v4 decodeInt64ForKey:@"hasAirplayProperties"];
    if (v24) {
      goto LABEL_23;
    }
    BOOL v29 = [v4 error];

    if (v29) {
      goto LABEL_17;
    }
    if ([v4 containsValueForKey:@"hasAirplayProperties"])
    {
LABEL_23:
      uint64_t v25 = [v4 decodeInt64ForKey:@"discoveredOverInfra"];
      if (v25) {
        goto LABEL_24;
      }
      v33 = [v4 error];

      if (v33) {
        goto LABEL_17;
      }
      if ([v4 containsValueForKey:@"discoveredOverInfra"])
      {
LABEL_24:
        uint64_t v26 = [v4 decodeInt64ForKey:@"discoveredWithBroker"];
        if (v26) {
          goto LABEL_25;
        }
        v34 = [v4 error];

        if (v34) {
          goto LABEL_17;
        }
        if ([v4 containsValueForKey:@"discoveredWithBroker"])
        {
LABEL_25:
          uint64_t v27 = [v4 decodeInt64ForKey:@"deviceType"];
          if (v27) {
            goto LABEL_26;
          }
          v35 = [v4 error];

          if (v35) {
            goto LABEL_17;
          }
          if ([v4 containsValueForKey:@"deviceType"])
          {
LABEL_26:
            uint64_t v28 = [v4 decodeInt64ForKey:@"deviceSubType"];
            if (v28) {
              goto LABEL_27;
            }
            uint64_t v37 = v27;
            v36 = [v4 error];

            if (v36) {
              goto LABEL_17;
            }
            uint64_t v27 = v37;
            if ([v4 containsValueForKey:@"deviceSubType"])
            {
LABEL_27:
              self = [(IRAVOutputDeviceDO *)self initWithDeviceID:v5 modelID:v7 deviceName:v9 hasAirplayProperties:v24 != 0 discoveredOverInfra:v25 != 0 discoveredWithBroker:v26 != 0 deviceType:v27 deviceSubType:v28];
              int v14 = self;
              goto LABEL_18;
            }
            uint64_t v38 = *MEMORY[0x263F08320];
            v39 = @"Missing serialized value for IRAVOutputDeviceDO.deviceSubType";
            v30 = NSDictionary;
            v31 = &v39;
            v32 = &v38;
          }
          else
          {
            uint64_t v40 = *MEMORY[0x263F08320];
            v41 = @"Missing serialized value for IRAVOutputDeviceDO.deviceType";
            v30 = NSDictionary;
            v31 = &v41;
            v32 = &v40;
          }
        }
        else
        {
          uint64_t v42 = *MEMORY[0x263F08320];
          v43 = @"Missing serialized value for IRAVOutputDeviceDO.discoveredWithBroker";
          v30 = NSDictionary;
          v31 = &v43;
          v32 = &v42;
        }
      }
      else
      {
        uint64_t v44 = *MEMORY[0x263F08320];
        v45 = @"Missing serialized value for IRAVOutputDeviceDO.discoveredOverInfra";
        v30 = NSDictionary;
        v31 = &v45;
        v32 = &v44;
      }
    }
    else
    {
      uint64_t v46 = *MEMORY[0x263F08320];
      v47 = @"Missing serialized value for IRAVOutputDeviceDO.hasAirplayProperties";
      v30 = NSDictionary;
      v31 = &v47;
      v32 = &v46;
    }
    BOOL v10 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:1];
    BOOL v11 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRAVOutputDeviceDOOCNTErrorDomain" code:1 userInfo:v10];
    [v4 failWithError:v11];
    goto LABEL_16;
  }
  v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = 0;
LABEL_20:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  deviceID = self->_deviceID;
  id v8 = v4;
  if (deviceID)
  {
    [v4 encodeObject:deviceID forKey:@"deviceID"];
    id v4 = v8;
  }
  modelID = self->_modelID;
  if (modelID)
  {
    [v8 encodeObject:modelID forKey:@"modelID"];
    id v4 = v8;
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    [v8 encodeObject:deviceName forKey:@"deviceName"];
    id v4 = v8;
  }
  [v4 encodeInt64:self->_hasAirplayProperties forKey:@"hasAirplayProperties"];
  [v8 encodeInt64:self->_discoveredOverInfra forKey:@"discoveredOverInfra"];
  [v8 encodeInt64:self->_discoveredWithBroker forKey:@"discoveredWithBroker"];
  [v8 encodeInt64:self->_deviceType forKey:@"deviceType"];
  [v8 encodeInt64:self->_deviceSubType forKey:@"deviceSubType"];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v12 = *(_OWORD *)&self->_deviceID;
  deviceName = self->_deviceName;
  NSUInteger v5 = [NSNumber numberWithBool:self->_hasAirplayProperties];
  int v6 = [NSNumber numberWithBool:self->_discoveredOverInfra];
  uint64_t v7 = [NSNumber numberWithBool:self->_discoveredWithBroker];
  id v8 = [NSNumber numberWithUnsignedInteger:self->_deviceType];
  unint64_t v9 = [NSNumber numberWithUnsignedInteger:self->_deviceSubType];
  BOOL v10 = (void *)[v3 initWithFormat:@"<IRAVOutputDeviceDO | deviceID:%@ modelID:%@ deviceName:%@ hasAirplayProperties:%@ discoveredOverInfra:%@ discoveredWithBroker:%@ deviceType:%@ deviceSubType:%@>", v12, deviceName, v5, v6, v7, v8, v9];

  return v10;
}

@end