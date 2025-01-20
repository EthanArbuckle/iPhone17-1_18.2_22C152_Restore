@interface NINearbyPeerConfiguration
+ (BOOL)supportsSecureCoding;
+ (NINearbyPeerConfiguration)new;
- (BOOL)_internalIsCameraAssistanceEnabled;
- (BOOL)_internalIsExtendedDistanceMeasurementEnabled;
- (BOOL)isCameraAssistanceEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtendedDistanceMeasurementEnabled;
- (BOOL)isLongRangeEnabled;
- (NIDiscoveryToken)peerDiscoveryToken;
- (NINearbyPeerConfiguration)init;
- (NINearbyPeerConfiguration)initWithCoder:(id)a3;
- (NINearbyPeerConfiguration)initWithPeerToken:(NIDiscoveryToken *)peerToken;
- (NSDictionary)debugParameters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (int64_t)backgroundMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBackgroundMode:(int64_t)a3;
- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled;
- (void)setDebugParameters:(id)a3;
- (void)setExtendedDistanceMeasurementEnabled:(BOOL)extendedDistanceMeasurementEnabled;
- (void)setLongRangeEnabled:(BOOL)a3;
- (void)setPeerDiscoveryToken:(id)a3;
@end

@implementation NINearbyPeerConfiguration

- (NINearbyPeerConfiguration)initWithPeerToken:(NIDiscoveryToken *)peerToken
{
  v6 = peerToken;
  if (!v6)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"NIConfiguration.mm", 461, @"Invalid parameter not satisfying: %@", @"peerToken" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)NINearbyPeerConfiguration;
  v7 = [(NIConfiguration *)&v12 initInternal];
  v8 = (NINearbyPeerConfiguration *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 5, peerToken);
    v8->_longRangeEnabled = 1;
    v8->_cameraAssistanceEnabled = 0;
    v8->_backgroundMode = 0;
    debugParameters = v8->_debugParameters;
    v8->_debugParameters = 0;

    v8->_extendedDistanceMeasurementEnabled = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NINearbyPeerConfiguration;
  id v5 = -[NIConfiguration copyWithZone:](&v10, sel_copyWithZone_);
  [v5 setLongRangeEnabled:self->_longRangeEnabled];
  [v5 setCameraAssistanceEnabled:self->_cameraAssistanceEnabled];
  [v5 setBackgroundMode:self->_backgroundMode];
  id v6 = [(NIDiscoveryToken *)self->_peerDiscoveryToken copyWithZone:a3];
  v7 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v6;

  if (self->_debugParameters)
  {
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "allocWithZone:", a3), "initWithDictionary:copyItems:", self->_debugParameters, 1);
    [v5 setDebugParameters:v8];
  }
  *((unsigned char *)v5 + 33) = self->_extendedDistanceMeasurementEnabled;
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NINearbyPeerConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_peerDiscoveryToken forKey:@"peerDiscoveryToken"];
  [v4 encodeBool:self->_longRangeEnabled forKey:@"longRangeEnabled"];
  [v4 encodeBool:self->_cameraAssistanceEnabled forKey:@"cameraAssistanceEnabled"];
  [v4 encodeInteger:self->_backgroundMode forKey:@"backgroundMode"];
  [v4 encodeObject:self->_debugParameters forKey:@"debugParameters"];
  [v4 encodeBool:self->_extendedDistanceMeasurementEnabled forKey:@"extendedDistanceMeasurementEnabled"];
}

- (NINearbyPeerConfiguration)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerDiscoveryToken"];
  char v5 = [v4 decodeBoolForKey:@"longRangeEnabled"];
  char v6 = [v4 decodeBoolForKey:@"cameraAssistanceEnabled"];
  unint64_t v7 = [v4 decodeIntegerForKey:@"backgroundMode"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  v23[0] = objc_opt_class();
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  objc_super v10 = [v8 setWithArray:v9];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  objc_super v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v13 = [v11 setWithArray:v12];

  v14 = [v4 decodeDictionaryWithKeysOfClasses:v10 objectsOfClasses:v13 forKey:@"debugParameters"];
  char v15 = [v4 decodeBoolForKey:@"extendedDistanceMeasurementEnabled"];
  v21.receiver = self;
  v21.super_class = (Class)NINearbyPeerConfiguration;
  v16 = [(NIConfiguration *)&v21 initWithCoder:v4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_peerDiscoveryToken, obj);
    v17->_longRangeEnabled = v5;
    v17->_cameraAssistanceEnabled = v6;
    objc_storeStrong((id *)&v17->_debugParameters, v14);
    if (v7 >= 3) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v7;
    }
    v17->_backgroundMode = v18;
    v17->_extendedDistanceMeasurementEnabled = v15;
  }

  return v17;
}

- (NINearbyPeerConfiguration)init
{
}

+ (NINearbyPeerConfiguration)new
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v5 = (NINearbyPeerConfiguration *)v4;
    char v6 = v5;
    if (v5 == self)
    {
      BOOL v20 = 1;
LABEL_16:

      goto LABEL_17;
    }
    peerDiscoveryToken = self->_peerDiscoveryToken;
    v8 = [(NINearbyPeerConfiguration *)v5 peerDiscoveryToken];
    BOOL v9 = [(NIDiscoveryToken *)peerDiscoveryToken isEqual:v8];

    int longRangeEnabled = self->_longRangeEnabled;
    int v11 = [(NINearbyPeerConfiguration *)v6 isLongRangeEnabled];
    int cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
    int v13 = [(NINearbyPeerConfiguration *)v6 isCameraAssistanceEnabled];
    int64_t backgroundMode = self->_backgroundMode;
    uint64_t v22 = [(NINearbyPeerConfiguration *)v6 backgroundMode];
    debugParameters = self->_debugParameters;
    if (!debugParameters)
    {
      char v15 = [(NINearbyPeerConfiguration *)v6 debugParameters];

      if (!v15)
      {
        char v17 = 1;
        goto LABEL_7;
      }
      debugParameters = self->_debugParameters;
    }
    v16 = [(NINearbyPeerConfiguration *)v6 debugParameters];
    char v17 = [(NSDictionary *)debugParameters isEqual:v16];

LABEL_7:
    int extendedDistanceMeasurementEnabled = self->_extendedDistanceMeasurementEnabled;
    int v19 = [(NINearbyPeerConfiguration *)v6 isExtendedDistanceMeasurementEnabled];
    BOOL v20 = 0;
    if (v9 && longRangeEnabled == v11 && cameraAssistanceEnabled == v13 && backgroundMode == v23)
    {
      if (extendedDistanceMeasurementEnabled == v19) {
        BOOL v20 = v17;
      }
      else {
        BOOL v20 = 0;
      }
    }
    goto LABEL_16;
  }
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NIDiscoveryToken *)self->_peerDiscoveryToken hash];
  BOOL longRangeEnabled = self->_longRangeEnabled;
  BOOL cameraAssistanceEnabled = self->_cameraAssistanceEnabled;
  int64_t backgroundMode = self->_backgroundMode;
  return v3 ^ longRangeEnabled ^ cameraAssistanceEnabled ^ backgroundMode ^ [(NSDictionary *)self->_debugParameters hash] ^ self->_extendedDistanceMeasurementEnabled ^ 0x1F;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  char v6 = [(NINearbyPeerConfiguration *)self descriptionInternal];
  unint64_t v7 = (void *)[v3 initWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1EF5D0E08];
  peerDiscoveryToken = self->_peerDiscoveryToken;
  if (peerDiscoveryToken)
  {
    char v5 = [(NIDiscoveryToken *)peerDiscoveryToken descriptionInternal];
    [v3 appendFormat:@"Peer Token: %@", v5];
  }
  else
  {
    [v3 appendString:@"Peer Token: null"];
  }
  if (self->_cameraAssistanceEnabled) {
    char v6 = "Yes";
  }
  else {
    char v6 = "No";
  }
  [v3 appendFormat:@", isCameraAssistanceEnabled: %s", v6];
  [v3 appendFormat:@", backgroundMode: %s", +[NIInternalUtils NISessionBackgroundModeToString:](NIInternalUtils, "NISessionBackgroundModeToString:", self->_backgroundMode)];
  unint64_t v7 = [(NSDictionary *)self->_debugParameters description];
  [v3 appendFormat:@", debugParameters:%@", v7];

  if (self->_longRangeEnabled) {
    v8 = "Yes";
  }
  else {
    v8 = "No";
  }
  [v3 appendFormat:@", isLongRangeEnabled: %s", v8];
  if (self->_extendedDistanceMeasurementEnabled) {
    BOOL v9 = "Yes";
  }
  else {
    BOOL v9 = "No";
  }
  [v3 appendFormat:@", isExtendedDistanceMeasurementEnabled: %s", v9];

  return v3;
}

- (BOOL)_internalIsCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (BOOL)_internalIsExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (NIDiscoveryToken)peerDiscoveryToken
{
  return self->_peerDiscoveryToken;
}

- (void)setPeerDiscoveryToken:(id)a3
{
}

- (BOOL)isCameraAssistanceEnabled
{
  return self->_cameraAssistanceEnabled;
}

- (void)setCameraAssistanceEnabled:(BOOL)cameraAssistanceEnabled
{
  self->_BOOL cameraAssistanceEnabled = cameraAssistanceEnabled;
}

- (BOOL)isExtendedDistanceMeasurementEnabled
{
  return self->_extendedDistanceMeasurementEnabled;
}

- (void)setExtendedDistanceMeasurementEnabled:(BOOL)extendedDistanceMeasurementEnabled
{
  self->_int extendedDistanceMeasurementEnabled = extendedDistanceMeasurementEnabled;
}

- (BOOL)isLongRangeEnabled
{
  return self->_longRangeEnabled;
}

- (void)setLongRangeEnabled:(BOOL)a3
{
  self->_BOOL longRangeEnabled = a3;
}

- (int64_t)backgroundMode
{
  return self->_backgroundMode;
}

- (void)setBackgroundMode:(int64_t)a3
{
  self->_int64_t backgroundMode = a3;
}

- (NSDictionary)debugParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDebugParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugParameters, 0);

  objc_storeStrong((id *)&self->_peerDiscoveryToken, 0);
}

@end