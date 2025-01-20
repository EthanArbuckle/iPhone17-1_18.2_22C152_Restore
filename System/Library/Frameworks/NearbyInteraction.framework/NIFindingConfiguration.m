@interface NIFindingConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)localDeviceConfiguration;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsCameraAssistanceInClientProcess;
- (BOOL)canUpdateToConfiguration:(id)a3;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isCameraAssistanceInClientProcess;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinder;
- (BOOL)isObserver;
- (NIDiscoveryToken)findingDiscoveryToken;
- (NIDiscoveryToken)sessionDiscoveryToken;
- (NIDiscoveryToken)specifiedToken;
- (NIFindingConfiguration)initWithCoder:(id)a3;
- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5;
- (NSDictionary)debugParameters;
- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)configType;
- (int64_t)preferredUpdateRate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCameraAssistanceEnabled:(BOOL)a3;
- (void)setCameraAssistanceInClientProcess:(BOOL)a3;
- (void)setConfigType:(int64_t)a3;
- (void)setDebugParameters:(id)a3;
- (void)setIsFinder:(BOOL)a3;
- (void)setIsObserver:(BOOL)a3;
- (void)setPreferredUpdateRate:(int64_t)a3;
- (void)setSpecifiedToken:(id)a3;
@end

@implementation NIFindingConfiguration

+ (id)localDeviceConfiguration
{
  id v2 = [[NIFindingConfiguration alloc] _initInternalWithConfigType:2 isFinder:0 isObserver:0 specifiedToken:0 preferredUpdateRate:3];

  return v2;
}

- (NIFindingConfiguration)initWithRole:(int64_t)a3 discoveryToken:(id)a4 preferredUpdateRate:(int64_t)a5
{
  return (NIFindingConfiguration *)[(NIFindingConfiguration *)self _initInternalWithConfigType:1 isFinder:(a3 & 0xFFFFFFFFFFFFFFFDLL) == 0 isObserver:(a3 & 0xFFFFFFFFFFFFFFFELL) == 2 specifiedToken:a4 preferredUpdateRate:a5];
}

- (NIDiscoveryToken)sessionDiscoveryToken
{
  return self->_specifiedToken;
}

- (NIDiscoveryToken)findingDiscoveryToken
{
  return self->_specifiedToken;
}

- (id)_initInternalWithConfigType:(int64_t)a3 isFinder:(BOOL)a4 isObserver:(BOOL)a5 specifiedToken:(id)a6 preferredUpdateRate:(int64_t)a7
{
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NIFindingConfiguration;
  v14 = [(NIConfiguration *)&v18 initInternal];
  v15 = v14;
  if (v14)
  {
    *((unsigned char *)v14 + 34) = a4;
    *((unsigned char *)v14 + 35) = a5;
    v14[6] = (id)a3;
    objc_storeStrong(v14 + 7, a6);
    v15[5] = (id)a7;
    *((unsigned char *)v15 + 32) = 0;
    *((unsigned char *)v15 + 33) = 1;
    id v16 = v15[8];
    v15[8] = 0;
  }
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NIFindingConfiguration;
  id v4 = [(NIConfiguration *)&v8 copyWithZone:a3];
  [v4 setIsFinder:self->_isFinder];
  [v4 setIsObserver:self->_isObserver];
  [v4 setConfigType:self->_configType];
  v5 = (void *)[(NIDiscoveryToken *)self->_specifiedToken copy];
  [v4 setSpecifiedToken:v5];

  [v4 setPreferredUpdateRate:self->_preferredUpdateRate];
  [v4 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v4 setCameraAssistanceInClientProcess:self->_cameraAssistanceInClientProcess];
  v6 = (void *)[(NSDictionary *)self->_debugParameters copy];
  [v4 setDebugParameters:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIFindingConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_isFinder forKey:@"isFinder"];
  [v4 encodeBool:self->_isObserver forKey:@"isObserver"];
  [v4 encodeInteger:self->_configType forKey:@"configType"];
  [v4 encodeObject:self->_specifiedToken forKey:@"specifiedToken"];
  [v4 encodeInteger:self->_preferredUpdateRate forKey:@"preferredUpdateRate"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeBool:self->_cameraAssistanceInClientProcess forKey:@"cameraAssistanceInClientProcess"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
}

- (NIFindingConfiguration)initWithCoder:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NIFindingConfiguration;
  objc_super v5 = [(NIConfiguration *)&v23 initWithCoder:v4];
  if (v5)
  {
    char v6 = [v4 decodeBoolForKey:@"isFinder"];
    char v7 = [v4 decodeBoolForKey:@"isObserver"];
    uint64_t v8 = [v4 decodeIntegerForKey:@"configType"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifiedToken"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      && (uint64_t v10 = [v4 decodeIntegerForKey:@"preferredUpdateRate"],
          +[NIInternalUtils isIntValidNearbyObjectUpdateRate:v10]))
    {
      char v21 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
      BOOL v22 = v6;
      char v20 = [v4 decodeBoolForKey:@"cameraAssistanceInClientProcess"];
      v11 = (void *)MEMORY[0x1E4F1CAD0];
      v25[0] = objc_opt_class();
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      id v13 = [v11 setWithArray:v12];

      v14 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v24 = objc_opt_class();
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      id v16 = [v14 setWithArray:v15];

      v17 = [v4 decodeDictionaryWithKeysOfClasses:v13 objectsOfClasses:v16 forKey:@"debugParameters"];
      v5->_isFinder = v22;
      v5->_isObserver = v7;
      if (v8 == 1)
      {
        v5->_configType = 1;
        objc_storeStrong((id *)&v5->_specifiedToken, v9);
        v5->_preferredUpdateRate = v10;
        v5->_cameraAssistanceEnabled = v21;
        v5->_cameraAssistanceInClientProcess = v20;
        objc_storeStrong((id *)&v5->_debugParameters, v17);
        objc_super v18 = v5;
      }
      else
      {
        objc_super v18 = 0;
      }
    }
    else
    {
      objc_super v18 = 0;
    }
  }
  else
  {
    objc_super v18 = 0;
  }

  return v18;
}

- (BOOL)canUpdateToConfiguration:(id)a3
{
  id v4 = (NIFindingConfiguration *)a3;
  objc_super v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      BOOL v18 = 1;
    }
    else
    {
      int v6 = [(NIFindingConfiguration *)v4 isFinder];
      int isFinder = self->_isFinder;
      int v8 = [(NIFindingConfiguration *)v5 isObserver];
      BOOL isObserver = self->_isObserver;
      uint64_t v24 = [(NIFindingConfiguration *)v5 configType];
      int v23 = isObserver;
      int64_t configType = self->_configType;
      unint64_t specifiedToken = (unint64_t)v5->_specifiedToken;
      v12 = self->_specifiedToken;
      int v13 = [(id)specifiedToken isEqual:v12];
      if (specifiedToken | (unint64_t)v12) {
        int v14 = v13;
      }
      else {
        int v14 = 1;
      }
      int v15 = [(NIFindingConfiguration *)v5 isCameraAssistanceEnabled];
      int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
      BOOL v17 = [(NIFindingConfiguration *)v5 isCameraAssistanceInClientProcess];
      BOOL v18 = 0;
      BOOL v20 = isFinder == v6 && v23 == v8 && v24 == configType;
      if (v20 && ((v14 ^ 1) & 1) == 0) {
        BOOL v18 = cameraAssistanceEnabled == v15 && self->_cameraAssistanceInClientProcess == v17;
      }
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NIFindingConfiguration *)v4;
    if (v5 == self)
    {
      BOOL v12 = 1;
    }
    else if ([(NIFindingConfiguration *)self canUpdateToConfiguration:v5])
    {
      uint64_t v6 = [(NIFindingConfiguration *)v5 preferredUpdateRate];
      int64_t preferredUpdateRate = self->_preferredUpdateRate;
      debugParameters = v5->_debugParameters;
      v9 = self->_debugParameters;
      char v10 = [(NSDictionary *)debugParameters isEqualToDictionary:v9];
      if ((unint64_t)debugParameters | (unint64_t)v9) {
        char v11 = v10;
      }
      else {
        char v11 = 1;
      }
      if (v6 == preferredUpdateRate) {
        BOOL v12 = v11;
      }
      else {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = self->_isFinder ^ self->_isObserver ^ 0x1Fu;
  int64_t configType = self->_configType;
  unint64_t v5 = configType ^ [(NIDiscoveryToken *)self->_specifiedToken hash] ^ self->_preferredUpdateRate ^ v3;
  unint64_t v6 = self->_cameraAssistanceEnabled ^ (unint64_t)self->_cameraAssistanceInClientProcess;
  return v5 ^ v6 ^ [(NSDictionary *)self->_debugParameters hash];
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  unint64_t v5 = NSStringFromClass(v4);
  unint64_t v6 = [(NIFindingConfiguration *)self descriptionInternal];
  char v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = NSString;
  BOOL isFinder = self->_isFinder;
  BOOL isObserver = self->_isObserver;
  int64_t configType = self->_configType;
  char v7 = [(NIDiscoveryToken *)self->_specifiedToken descriptionInternal];
  int v8 = [v3 stringWithFormat:@"<finder: %d [observer %d], cfg-type: %d, ses-token: %@, rate: %s, camera: %d [client %d], debug-params: %@>", isFinder, isObserver, configType, v7, +[NIInternalUtils NINearbyObjectUpdateRateToString:](NIInternalUtils, "NINearbyObjectUpdateRateToString:", self->_preferredUpdateRate), self->_cameraAssistanceEnabled, self->_cameraAssistanceInClientProcess, self->_debugParameters];

  return v8;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (int64_t)preferredUpdateRate
{
  return self->_preferredUpdateRate;
}

- (void)setPreferredUpdateRate:(int64_t)a3
{
  self->_int64_t preferredUpdateRate = a3;
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)a3
{
  self->_int cameraAssistanceEnabled = a3;
}

- (BOOL)isCameraAssistanceInClientProcess
{
  return self->_cameraAssistanceInClientProcess;
}

- (void)setCameraAssistanceInClientProcess:(BOOL)a3
{
  self->_cameraAssistanceInClientProcess = a3;
}

- (BOOL)isFinder
{
  return self->_isFinder;
}

- (void)setIsFinder:(BOOL)a3
{
  self->_BOOL isFinder = a3;
}

- (BOOL)isObserver
{
  return self->_isObserver;
}

- (void)setIsObserver:(BOOL)a3
{
  self->_BOOL isObserver = a3;
}

- (int64_t)configType
{
  return self->_configType;
}

- (void)setConfigType:(int64_t)a3
{
  self->_int64_t configType = a3;
}

- (NIDiscoveryToken)specifiedToken
{
  return self->_specifiedToken;
}

- (void)setSpecifiedToken:(id)a3
{
}

- (NSDictionary)debugParameters
{
  return self->_debugParameters;
}

- (void)setDebugParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);

  objc_storeStrong((id *)&self->_specifiedToken, 0);
}

@end