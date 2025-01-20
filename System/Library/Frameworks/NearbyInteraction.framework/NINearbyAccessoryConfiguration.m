@interface NINearbyAccessoryConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)dataExchangeDisabledAndUsingParameterOverrides;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isEqual:(id)a3;
- (NIDiscoveryToken)accessoryDiscoveryToken;
- (NINearbyAccessoryConfiguration)initWithAccessoryData:(NSData *)accessoryData bluetoothPeerIdentifier:(NSUUID *)identifier error:(NSError *)error;
- (NINearbyAccessoryConfiguration)initWithCoder:(id)a3;
- (NINearbyAccessoryConfiguration)initWithData:(NSData *)data error:(NSError *)error;
- (NINearbyAccessoryConfiguration)initWithDataExchangeDisabledAndUsingParameterOverrides:(id)a3;
- (NSData)accessoryConfigData;
- (NSDictionary)debugParameters;
- (NSUUID)bluetoothDeviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)backgroundMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundMode:(int64_t)a3;
- (void)setBluetoothDeviceIdentifier:(id)a3;
- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled;
- (void)setDebugParameters:(id)a3;
@end

@implementation NINearbyAccessoryConfiguration

- (NINearbyAccessoryConfiguration)initWithData:(NSData *)data error:(NSError *)error
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v7 = data;
  if (!v7)
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 647, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  v36.receiver = self;
  v36.super_class = (Class)NINearbyAccessoryConfiguration;
  v8 = [(NIConfiguration *)&v36 initInternal];
  if (!v8) {
    goto LABEL_22;
  }
  v9 = v7;
  v10 = [(NSData *)v9 bytes];
  size_t v11 = [(NSData *)v9 length];
  __p = 0;
  v34 = 0;
  uint64_t v35 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, v10, (uint64_t)v10 + v11, v11);
  size_t v12 = v34 - (unsigned char *)__p;
  if ((unint64_t)(v34 - (unsigned char *)__p) < 0x14) {
    goto LABEL_5;
  }
  uint64_t v14 = 0;
  unsigned int v15 = *(unsigned __int16 *)__p;
  BOOL v16 = !*((_WORD *)__p + 1) && v15 == 1;
  BOOL v17 = *((_WORD *)__p + 1) && v15 == 1;
  unsigned int v18 = *((unsigned __int16 *)__p + 8);
  uint64_t v19 = *((unsigned __int16 *)__p + 9);
  do
  {
    if (__PAIR64__(v19, v18) == __PAIR64__((unsigned __int16)rose::fira::kUWBInteropSpecificationSupportedVersions[v14 + 1], (unsigned __int16)rose::fira::kUWBInteropSpecificationSupportedVersions[v14]))
    {
      int v22 = 1;
      goto LABEL_25;
    }
    v14 += 2;
  }
  while (v14 != 6);
  int v22 = 0;
LABEL_25:
  BOOL v23 = v18 == 1 && v19 > 2;
  int v24 = v23;
  int v25 = v18 <= 1 ? v24 : 1;
  int v26 = v15 > 1 || v16;
  if ((v26 | v17) != 1 || !(v22 | v25)) {
    goto LABEL_5;
  }
  if (v22)
  {
    if (v18 != 1 || v19 >= 3) {
      __assert_rtn("UWBConfigDataTotalLengthBytes", "NIFiRaDefinitions.h", 375, "false");
    }
    if (v12 != 2 * v19 + 35 || *((unsigned __int8 *)__p + 15) != (2 * v19 + 19)) {
      goto LABEL_5;
    }
  }
  else if (v25)
  {
    if (v12 < 0x27 || *((unsigned __int8 *)__p + 15) < 0x17u) {
      goto LABEL_5;
    }
    size_t v12 = 39;
  }
  else
  {
    size_t v12 = 0;
  }
  int __dst = 0;
  int v41 = 0;
  int v44 = 0;
  uint64_t v39 = 0;
  __int16 v40 = 0;
  memcpy(&__dst, __p, v12);
  if (v38 <= 0x14u
    && ((1 << v38) & 0x100401) != 0
    && v42 <= 1u
    && BYTE2(v44) <= 1u
    && HIBYTE(v44) <= 8u
    && ((1 << SHIBYTE(v44)) & 0x10D) != 0)
  {
    uint64_t v27 = v43;
    uint64_t v28 = [(NSData *)v9 copy];
    v29 = (void *)v8[4];
    v8[4] = v28;

    v30 = [[NIDiscoveryToken alloc] initWithDeviceAddress:v27];
    v31 = (void *)v8[6];
    v8[6] = v30;

    *((unsigned char *)v8 + 40) = 0;
    v8[9] = 0;
    char v13 = 1;
    goto LABEL_19;
  }
LABEL_5:
  if (error)
  {
    NIErrorWithCodeAndUserInfo(-5888, 0);
    char v13 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v13 = 0;
  }
LABEL_19:
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
  if ((v13 & 1) == 0)
  {
    v20 = 0;
    goto LABEL_24;
  }
LABEL_22:
  v20 = v8;
LABEL_24:

  return v20;
}

- (NINearbyAccessoryConfiguration)initWithAccessoryData:(NSData *)accessoryData bluetoothPeerIdentifier:(NSUUID *)identifier error:(NSError *)error
{
  v9 = accessoryData;
  v10 = identifier;
  size_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 680, @"Invalid parameter not satisfying: %@", @"accessoryData" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  BOOL v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 681, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

LABEL_3:
  size_t v12 = [(NINearbyAccessoryConfiguration *)self initWithData:v9 error:error];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bluetoothDeviceIdentifier, identifier);
    v13->_backgroundMode = 2;
    uint64_t v14 = v13;
  }

  return v13;
}

- (NINearbyAccessoryConfiguration)initWithDataExchangeDisabledAndUsingParameterOverrides:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 702, @"Invalid parameter not satisfying: %@", @"parameterOverrides" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)NINearbyAccessoryConfiguration;
  v6 = [(NIConfiguration *)&v23 initInternal];
  if (v6)
  {
    v7 = objc_opt_new();
    [v7 setObject:MEMORY[0x1E4F1CC38] forKey:@"DisableDataExchangeAndUseParameterOverrides"];
    [v7 addEntriesFromDictionary:v5];
    objc_storeStrong((id *)&v6->_debugParameters, v7);
    v8 = [(NSDictionary *)v6->_debugParameters objectForKeyedSubscript:@"UWBSessionIdOverride"];
    uint64_t v9 = [v8 unsignedLongLongValue];
    v10 = [(NSDictionary *)v6->_debugParameters objectForKeyedSubscript:@"LocalAddressOverride"];
    uint64_t v11 = [v10 unsignedLongLongValue];
    size_t v12 = [(NSDictionary *)v6->_debugParameters objectForKeyedSubscript:@"PeerAddressOverride"];
    uint64_t v13 = (v9 << 32) | (v11 << 16) | [v12 unsignedLongLongValue];

    uint64_t v22 = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v22 length:8];
    rawData = v6->_rawData;
    v6->_rawData = (NSData *)v14;

    BOOL v16 = [NIDiscoveryToken alloc];
    BOOL v17 = [(NSDictionary *)v6->_debugParameters objectForKeyedSubscript:@"PeerAddressOverride"];
    uint64_t v18 = -[NIDiscoveryToken initWithDeviceAddress:](v16, "initWithDeviceAddress:", [v17 unsignedShortValue]);
    accessoryDiscoveryToken = v6->_accessoryDiscoveryToken;
    v6->_accessoryDiscoveryToken = (NIDiscoveryToken *)v18;

    v6->_cameraAssistanceEnabled = 0;
    v6->_backgroundMode = 0;
  }
  return v6;
}

- (BOOL)dataExchangeDisabledAndUsingParameterOverrides
{
  if (!+[NIPlatformInfo isInternalBuild]) {
    return 0;
  }
  v3 = [(NSDictionary *)self->_debugParameters objectForKeyedSubscript:@"DisableDataExchangeAndUseParameterOverrides"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSData)accessoryConfigData
{
  return self->_rawData;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NINearbyAccessoryConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v13, sel_copyWithZone_);
  [v5 setBluetoothDeviceIdentifier:self->_bluetoothDeviceIdentifier];
  [v5 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v5 setBackgroundMode:self->_backgroundMode];
  uint64_t v6 = [(NSData *)self->_rawData copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(NIDiscoveryToken *)self->_accessoryDiscoveryToken copyWithZone:a3];
  uint64_t v9 = (void *)v5[6];
  v5[6] = v8;

  if (self->_debugParameters)
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugParameters, 1);
    uint64_t v11 = (void *)v5[8];
    v5[8] = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NINearbyAccessoryConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_rawData forKey:@"rawData"];
  [v4 encodeObject:self->_accessoryDiscoveryToken forKey:@"accessoryDiscoveryToken"];
  [v4 encodeObject:self->_bluetoothDeviceIdentifier forKey:@"bluetoothDeviceIdentifier"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeInteger:self->_backgroundMode forKey:@"backgroundMode"];
}

- (NINearbyAccessoryConfiguration)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessoryDiscoveryToken"];
  id v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawData"];
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothDeviceIdentifier"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v8 = [v6 setWithArray:v7];

  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
  uint64_t v11 = [v9 setWithArray:v10];

  size_t v12 = [v4 decodeDictionaryWithKeysOfClasses:v8 objectsOfClasses:v11 forKey:@"debugParameters"];
  char v13 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
  unint64_t v14 = [v4 decodeIntegerForKey:@"backgroundMode"];
  v21.receiver = self;
  v21.super_class = (Class)NINearbyAccessoryConfiguration;
  unsigned int v15 = [(NIConfiguration *)&v21 initWithCoder:v4];
  BOOL v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accessoryDiscoveryToken, obj);
    objc_storeStrong((id *)&v16->_debugParameters, v12);
    objc_storeStrong((id *)&v16->_rawData, v19);
    objc_storeStrong((id *)&v16->_bluetoothDeviceIdentifier, v5);
    v16->_cameraAssistanceEnabled = v13;
    if (v14 >= 3) {
      unint64_t v17 = 0;
    }
    else {
      unint64_t v17 = v14;
    }
    v16->_backgroundMode = v17;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NINearbyAccessoryConfiguration *)v4;
    uint64_t v6 = v5;
    if (v5 == self)
    {
      char v12 = 1;
    }
    else
    {
      rawData = self->_rawData;
      id v8 = [(NINearbyAccessoryConfiguration *)v5 accessoryConfigData];
      BOOL v9 = [(NSData *)rawData isEqualToData:v8];

      uint64_t v10 = [(NINearbyAccessoryConfiguration *)v6 bluetoothDeviceIdentifier];
      if (v10) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = self->_bluetoothDeviceIdentifier == 0;
      }

      char v13 = [(NINearbyAccessoryConfiguration *)v6 bluetoothDeviceIdentifier];
      int v14 = [v13 isEqual:self->_bluetoothDeviceIdentifier];

      int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      int v16 = [(NINearbyAccessoryConfiguration *)v6 isCameraAssistanceEnabled];
      int64_t backgroundMode = self->_backgroundMode;
      uint64_t v24 = [(NINearbyAccessoryConfiguration *)v6 backgroundMode];
      int64_t v25 = backgroundMode;
      uint64_t v18 = [(NINearbyAccessoryConfiguration *)v6 debugParameters];
      BOOL v19 = v9;
      if (v18) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = self->_debugParameters == 0;
      }

      v20 = [(NINearbyAccessoryConfiguration *)v6 debugParameters];
      char v21 = [v20 isEqualToDictionary:self->_debugParameters];

      char v12 = 0;
      if ((v19 & (v11 | v14)) == 1 && cameraAssistanceEnabled == v16)
      {
        if (v25 == v24) {
          char v12 = v23 | v21;
        }
        else {
          char v12 = 0;
        }
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_rawData hash];
  unint64_t v4 = [(NIDiscoveryToken *)self->_accessoryDiscoveryToken hash];
  return v3 ^ v4 ^ [(NSUUID *)self->_bluetoothDeviceIdentifier hash] ^ self->_cameraAssistanceEnabled ^ self->_backgroundMode ^ 0x1F;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  unint64_t v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(NINearbyAccessoryConfiguration *)self descriptionInternal];
  v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EF5D0E08];
  accessoryDiscoveryToken = self->_accessoryDiscoveryToken;
  if (accessoryDiscoveryToken)
  {
    objc_super v5 = [(NIDiscoveryToken *)accessoryDiscoveryToken descriptionInternal];
    [v3 appendFormat:@"Device Token: %@", v5];
  }
  else
  {
    [v3 appendString:@"Device Token: null"];
  }
  bluetoothDeviceIdentifier = self->_bluetoothDeviceIdentifier;
  if (bluetoothDeviceIdentifier)
  {
    v7 = [(NSUUID *)bluetoothDeviceIdentifier UUIDString];
    [v3 appendFormat:@", Bluetooth Device: %@", v7];
  }
  else
  {
    [v3 appendString:@", Bluetooth Device: null"];
  }
  if (self->_cameraAssistanceEnabled) {
    id v8 = "Yes";
  }
  else {
    id v8 = "No";
  }
  [v3 appendFormat:@", isCameraAssistanceEnabled: %s", v8];
  [v3 appendFormat:@", backgroundMode: %s", +[NIInternalUtils NISessionBackgroundModeToString:](NIInternalUtils, "NISessionBackgroundModeToString:", self->_backgroundMode)];

  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (NIDiscoveryToken)accessoryDiscoveryToken
{
  return self->_accessoryDiscoveryToken;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_int cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (NSUUID)bluetoothDeviceIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBluetoothDeviceIdentifier:(id)a3
{
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDebugParameters:(id)a3
{
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_int64_t backgroundMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryDiscoveryToken, 0);

  objc_storeStrong((id *)&self->_rawData, 0);
}

@end