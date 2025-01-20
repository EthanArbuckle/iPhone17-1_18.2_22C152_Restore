@interface IRNodeDO
+ (BOOL)supportsSecureCoding;
+ (id)nodeDOFromNode:(id)a3;
+ (id)nodeDOWithAvOutpuDeviceIdentifier:(id)a3 rapportIdentifier:(id)a4 idsIdentifier:(id)a5 avOutputDevice:(id)a6 rapportDevice:(id)a7 isLocal:(BOOL)a8;
+ (id)nodeFromNodeDO:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNodeDO:(id)a3;
- (BOOL)isLocal;
- (IRAVOutputDeviceDO)avOutputDevice;
- (IRNodeDO)initWithAvOutpuDeviceIdentifier:(id)a3 rapportIdentifier:(id)a4 idsIdentifier:(id)a5 avOutputDevice:(id)a6 rapportDevice:(id)a7 isLocal:(BOOL)a8;
- (IRNodeDO)initWithCoder:(id)a3;
- (IRRapportDeviceDO)rapportDevice;
- (NSString)avOutpuDeviceIdentifier;
- (NSString)idsIdentifier;
- (NSString)rapportIdentifier;
- (id)computeName;
- (id)computedIdsIdentifier;
- (id)computedMediaRemoteIdenfifier;
- (id)computedMediaRouteIdentifier;
- (id)copyWithReplacementAvOutpuDeviceIdentifier:(id)a3;
- (id)copyWithReplacementAvOutputDevice:(id)a3;
- (id)copyWithReplacementIdsIdentifier:(id)a3;
- (id)copyWithReplacementIsLocal:(BOOL)a3;
- (id)copyWithReplacementRapportDevice:(id)a3;
- (id)copyWithReplacementRapportIdentifier:(id)a3;
- (id)description;
- (id)deviceTypeAndSubType;
- (id)exportAsDictionary;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRNodeDO

- (IRNodeDO)initWithAvOutpuDeviceIdentifier:(id)a3 rapportIdentifier:(id)a4 idsIdentifier:(id)a5 avOutputDevice:(id)a6 rapportDevice:(id)a7 isLocal:(BOOL)a8
{
  id v22 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IRNodeDO;
  v18 = [(IRNodeDO *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_avOutpuDeviceIdentifier, a3);
    objc_storeStrong((id *)&v19->_rapportIdentifier, a4);
    objc_storeStrong((id *)&v19->_idsIdentifier, a5);
    objc_storeStrong((id *)&v19->_avOutputDevice, a6);
    objc_storeStrong((id *)&v19->_rapportDevice, a7);
    v19->_isLocal = a8;
  }

  return v19;
}

+ (id)nodeDOWithAvOutpuDeviceIdentifier:(id)a3 rapportIdentifier:(id)a4 idsIdentifier:(id)a5 avOutputDevice:(id)a6 rapportDevice:(id)a7 isLocal:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = (void *)[objc_alloc((Class)a1) initWithAvOutpuDeviceIdentifier:v18 rapportIdentifier:v17 idsIdentifier:v16 avOutputDevice:v15 rapportDevice:v14 isLocal:v8];

  return v19;
}

- (id)copyWithReplacementAvOutpuDeviceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAvOutpuDeviceIdentifier:v4 rapportIdentifier:self->_rapportIdentifier idsIdentifier:self->_idsIdentifier avOutputDevice:self->_avOutputDevice rapportDevice:self->_rapportDevice isLocal:self->_isLocal];

  return v5;
}

- (id)copyWithReplacementRapportIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAvOutpuDeviceIdentifier:self->_avOutpuDeviceIdentifier rapportIdentifier:v4 idsIdentifier:self->_idsIdentifier avOutputDevice:self->_avOutputDevice rapportDevice:self->_rapportDevice isLocal:self->_isLocal];

  return v5;
}

- (id)copyWithReplacementIdsIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAvOutpuDeviceIdentifier:self->_avOutpuDeviceIdentifier rapportIdentifier:self->_rapportIdentifier idsIdentifier:v4 avOutputDevice:self->_avOutputDevice rapportDevice:self->_rapportDevice isLocal:self->_isLocal];

  return v5;
}

- (id)copyWithReplacementAvOutputDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAvOutpuDeviceIdentifier:self->_avOutpuDeviceIdentifier rapportIdentifier:self->_rapportIdentifier idsIdentifier:self->_idsIdentifier avOutputDevice:v4 rapportDevice:self->_rapportDevice isLocal:self->_isLocal];

  return v5;
}

- (id)copyWithReplacementRapportDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAvOutpuDeviceIdentifier:self->_avOutpuDeviceIdentifier rapportIdentifier:self->_rapportIdentifier idsIdentifier:self->_idsIdentifier avOutputDevice:self->_avOutputDevice rapportDevice:v4 isLocal:self->_isLocal];

  return v5;
}

- (id)copyWithReplacementIsLocal:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  rapportIdentifier = self->_rapportIdentifier;
  idsIdentifier = self->_idsIdentifier;
  avOutputDevice = self->_avOutputDevice;
  rapportDevice = self->_rapportDevice;

  return (id)[v5 initWithAvOutpuDeviceIdentifier:avOutpuDeviceIdentifier rapportIdentifier:rapportIdentifier idsIdentifier:idsIdentifier avOutputDevice:avOutputDevice rapportDevice:rapportDevice isLocal:v3];
}

- (BOOL)isEqualToNodeDO:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_18;
  }
  int v6 = self->_avOutpuDeviceIdentifier != 0;
  v7 = [v4 avOutpuDeviceIdentifier];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_18;
  }
  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  if (avOutpuDeviceIdentifier)
  {
    v10 = [v5 avOutpuDeviceIdentifier];
    int v11 = [(NSString *)avOutpuDeviceIdentifier isEqual:v10];

    if (!v11) {
      goto LABEL_18;
    }
  }
  int v12 = self->_rapportIdentifier != 0;
  v13 = [v5 rapportIdentifier];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_18;
  }
  rapportIdentifier = self->_rapportIdentifier;
  if (rapportIdentifier)
  {
    id v16 = [v5 rapportIdentifier];
    int v17 = [(NSString *)rapportIdentifier isEqual:v16];

    if (!v17) {
      goto LABEL_18;
    }
  }
  int v18 = self->_idsIdentifier != 0;
  v19 = [v5 idsIdentifier];
  int v20 = v19 == 0;

  if (v18 == v20) {
    goto LABEL_18;
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    id v22 = [v5 idsIdentifier];
    int v23 = [(NSString *)idsIdentifier isEqual:v22];

    if (!v23) {
      goto LABEL_18;
    }
  }
  int v24 = self->_avOutputDevice != 0;
  v25 = [v5 avOutputDevice];
  int v26 = v25 == 0;

  if (v24 == v26) {
    goto LABEL_18;
  }
  avOutputDevice = self->_avOutputDevice;
  if (avOutputDevice)
  {
    v28 = [v5 avOutputDevice];
    BOOL v29 = [(IRAVOutputDeviceDO *)avOutputDevice isEqual:v28];

    if (!v29) {
      goto LABEL_18;
    }
  }
  int v30 = self->_rapportDevice != 0;
  v31 = [v5 rapportDevice];
  int v32 = v31 == 0;

  if (v30 == v32
    || (rapportDevice = self->_rapportDevice) != 0
    && ([v5 rapportDevice],
        v34 = objc_claimAutoreleasedReturnValue(),
        BOOL v35 = [(IRRapportDeviceDO *)rapportDevice isEqual:v34],
        v34,
        !v35))
  {
LABEL_18:
    BOOL v37 = 0;
  }
  else
  {
    int isLocal = self->_isLocal;
    BOOL v37 = isLocal == [v5 isLocal];
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IRNodeDO *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(IRNodeDO *)self isEqualToNodeDO:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_avOutpuDeviceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_rapportIdentifier hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_idsIdentifier hash] - v4 + 32 * v4;
  unint64_t v6 = [(IRAVOutputDeviceDO *)self->_avOutputDevice hash] - v5 + 32 * v5;
  unint64_t v7 = [(IRRapportDeviceDO *)self->_rapportDevice hash];
  return self->_isLocal - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IRNodeDO)initWithCoder:(id)a3
{
  v37[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  NSUInteger v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avOutpuDeviceIdentifier"];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unint64_t v6 = (objc_class *)objc_opt_class();
      unint64_t v7 = NSStringFromClass(v6);
      int v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      v10 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNodeDO key \"avOutpuDeviceIdentifier\" (expected %@, decoded %@)", v7, v9, 0];
      uint64_t v36 = *MEMORY[0x263F08320];
      v37[0] = v10;
      int v11 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      int v12 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNodeDOOCNTErrorDomain" code:3 userInfo:v11];
      [v4 failWithError:v12];
LABEL_16:

LABEL_17:
      int v14 = 0;
LABEL_18:

LABEL_19:
LABEL_20:

      goto LABEL_21;
    }
LABEL_6:
    unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rapportIdentifier"];
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v15 = (objc_class *)objc_opt_class();
        v9 = NSStringFromClass(v15);
        id v16 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v16);
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNodeDO key \"rapportIdentifier\" (expected %@, decoded %@)", v9, v10, 0];
        uint64_t v34 = *MEMORY[0x263F08320];
        BOOL v35 = v11;
        int v12 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v17 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v18 = 3;
        goto LABEL_9;
      }
    }
    else
    {
      int v20 = [v4 error];

      if (v20)
      {
        int v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v21);
        id v22 = (objc_class *)objc_opt_class();
        int v11 = NSStringFromClass(v22);
        int v12 = (void *)[[NSString alloc] initWithFormat:@"Unarchived unexpected class for IRNodeDO key \"idsIdentifier\" (expected %@, decoded %@)", v10, v11, 0];
        uint64_t v32 = *MEMORY[0x263F08320];
        v33 = v12;
        v19 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        int v23 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithDomain:@"IRNodeDOOCNTErrorDomain" code:3 userInfo:v19];
        [v4 failWithError:v23];

        goto LABEL_15;
      }
    }
    else
    {
      v25 = [v4 error];

      if (v25)
      {
        int v14 = 0;
        goto LABEL_20;
      }
    }
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avOutputDevice"];
    if (!v10)
    {
      v27 = [v4 error];

      if (v27)
      {
        int v14 = 0;
        goto LABEL_19;
      }
    }
    int v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rapportDevice"];
    if (!v11)
    {
      v28 = [v4 error];

      if (v28) {
        goto LABEL_17;
      }
    }
    uint64_t v26 = [v4 decodeInt64ForKey:@"isLocal"];
    if (v26) {
      goto LABEL_28;
    }
    BOOL v29 = [v4 error];

    if (v29) {
      goto LABEL_17;
    }
    if ([v4 containsValueForKey:@"isLocal"])
    {
LABEL_28:
      self = [(IRNodeDO *)self initWithAvOutpuDeviceIdentifier:v5 rapportIdentifier:v7 idsIdentifier:v9 avOutputDevice:v10 rapportDevice:v11 isLocal:v26 != 0];
      int v14 = self;
      goto LABEL_18;
    }
    uint64_t v30 = *MEMORY[0x263F08320];
    v31 = @"Missing serialized value for IRNodeDO.isLocal";
    int v12 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v17 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v18 = 1;
LABEL_9:
    v19 = (void *)[v17 initWithDomain:@"IRNodeDOOCNTErrorDomain" code:v18 userInfo:v12];
    [v4 failWithError:v19];
LABEL_15:

    goto LABEL_16;
  }
  v13 = [v4 error];

  if (!v13) {
    goto LABEL_6;
  }
  int v14 = 0;
LABEL_22:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  id v10 = v4;
  if (avOutpuDeviceIdentifier)
  {
    [v4 encodeObject:avOutpuDeviceIdentifier forKey:@"avOutpuDeviceIdentifier"];
    id v4 = v10;
  }
  rapportIdentifier = self->_rapportIdentifier;
  if (rapportIdentifier)
  {
    [v10 encodeObject:rapportIdentifier forKey:@"rapportIdentifier"];
    id v4 = v10;
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    [v10 encodeObject:idsIdentifier forKey:@"idsIdentifier"];
    id v4 = v10;
  }
  avOutputDevice = self->_avOutputDevice;
  if (avOutputDevice)
  {
    [v10 encodeObject:avOutputDevice forKey:@"avOutputDevice"];
    id v4 = v10;
  }
  rapportDevice = self->_rapportDevice;
  if (rapportDevice)
  {
    [v10 encodeObject:rapportDevice forKey:@"rapportDevice"];
    id v4 = v10;
  }
  [v4 encodeInt64:self->_isLocal forKey:@"isLocal"];
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v9 = *(_OWORD *)&self->_avOutpuDeviceIdentifier;
  long long v8 = *(_OWORD *)&self->_idsIdentifier;
  rapportDevice = self->_rapportDevice;
  NSUInteger v5 = [NSNumber numberWithBool:self->_isLocal];
  unint64_t v6 = (void *)[v3 initWithFormat:@"<IRNodeDO | avOutpuDeviceIdentifier:%@ rapportIdentifier:%@ idsIdentifier:%@ avOutputDevice:%@ rapportDevice:%@ isLocal:%@>", v9, v8, rapportDevice, v5];

  return v6;
}

- (NSString)avOutpuDeviceIdentifier
{
  return self->_avOutpuDeviceIdentifier;
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (IRAVOutputDeviceDO)avOutputDevice
{
  return self->_avOutputDevice;
}

- (IRRapportDeviceDO)rapportDevice
{
  return self->_rapportDevice;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapportDevice, 0);
  objc_storeStrong((id *)&self->_avOutputDevice, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);

  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, 0);
}

+ (id)nodeDOFromNode:(id)a3
{
  id v3 = a3;
  id v4 = [IRNodeDO alloc];
  NSUInteger v5 = [v3 avOutpuDeviceIdentifier];
  unint64_t v6 = [v3 rapportIdentifier];
  unint64_t v7 = [v3 idsIdentifier];
  uint64_t v8 = [v3 isLocal];

  long long v9 = [(IRNodeDO *)v4 initWithAvOutpuDeviceIdentifier:v5 rapportIdentifier:v6 idsIdentifier:v7 avOutputDevice:0 rapportDevice:0 isLocal:v8];

  return v9;
}

+ (id)nodeFromNodeDO:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F500F0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  unint64_t v6 = [v4 avOutpuDeviceIdentifier];
  [v5 setAvOutpuDeviceIdentifier:v6];

  unint64_t v7 = [v4 rapportIdentifier];
  [v5 setRapportIdentifier:v7];

  uint64_t v8 = [v4 idsIdentifier];
  [v5 setIdsIdentifier:v8];

  long long v9 = [v4 computeName];
  [v5 setName:v9];

  uint64_t v10 = [v4 isLocal];
  [v5 setIsLocal:v10];

  return v5;
}

- (id)computedIdsIdentifier
{
  id v3 = [(IRNodeDO *)self idsIdentifier];
  if (!v3)
  {
    id v4 = [(IRNodeDO *)self rapportDevice];
    id v3 = [v4 idsID];
  }

  return v3;
}

- (id)computedMediaRemoteIdenfifier
{
  id v3 = [(IRNodeDO *)self avOutpuDeviceIdentifier];
  if (!v3)
  {
    id v4 = [(IRNodeDO *)self avOutputDevice];
    id v3 = [v4 deviceID];

    if (!v3)
    {
      id v5 = [(IRNodeDO *)self rapportDevice];
      id v3 = [v5 mediaRemoteIdentifier];
    }
  }

  return v3;
}

- (id)computedMediaRouteIdentifier
{
  id v3 = [(IRNodeDO *)self avOutpuDeviceIdentifier];
  if (!v3)
  {
    id v4 = [(IRNodeDO *)self avOutputDevice];
    id v3 = [v4 deviceID];

    if (!v3)
    {
      id v5 = [(IRNodeDO *)self rapportDevice];
      id v3 = [v5 mediaRouteIdentifier];
    }
  }

  return v3;
}

- (id)exportAsDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(IRNodeDO *)self avOutpuDeviceIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"avOutpuDeviceIdentifier"];

  id v5 = [(IRNodeDO *)self rapportIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"rapportIdentifier"];

  unint64_t v6 = [(IRNodeDO *)self idsIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"idsIdentifier"];

  unint64_t v7 = [(IRNodeDO *)self avOutputDevice];
  uint64_t v8 = [v7 exportAsDictionary];
  [v3 setObject:v8 forKeyedSubscript:@"avOutputDevice"];

  long long v9 = [(IRNodeDO *)self rapportDevice];
  uint64_t v10 = [v9 exportAsDictionary];
  [v3 setObject:v10 forKeyedSubscript:@"rapportDevice"];

  return v3;
}

- (id)computeName
{
  id v3 = [(IRNodeDO *)self avOutputDevice];
  id v4 = [v3 deviceName];

  if (v4)
  {
    id v5 = [(IRNodeDO *)self avOutputDevice];
    uint64_t v6 = [v5 deviceName];
LABEL_5:
    long long v9 = (void *)v6;

    goto LABEL_6;
  }
  unint64_t v7 = [(IRNodeDO *)self rapportDevice];
  uint64_t v8 = [v7 name];

  if (v8)
  {
    id v5 = [(IRNodeDO *)self rapportDevice];
    uint64_t v6 = [v5 name];
    goto LABEL_5;
  }
  long long v9 = 0;
LABEL_6:

  return v9;
}

- (id)deviceTypeAndSubType
{
  if ([(IRNodeDO *)self isLocal])
  {
    id v3 = +[IRPair pairWithFirst:&unk_2703AF2F0 second:&unk_2703AF308];
  }
  else
  {
    id v4 = [(IRNodeDO *)self avOutputDevice];
    id v5 = [v4 deviceID];

    if (v5)
    {
      uint64_t v6 = NSNumber;
      unint64_t v7 = [(IRNodeDO *)self avOutputDevice];
      uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "deviceType"));
      long long v9 = NSNumber;
      uint64_t v10 = [(IRNodeDO *)self avOutputDevice];
      int v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "deviceSubType"));
      id v3 = +[IRPair pairWithFirst:v8 second:v11];
    }
    else
    {
      id v3 = 0;
    }
  }

  return v3;
}

@end