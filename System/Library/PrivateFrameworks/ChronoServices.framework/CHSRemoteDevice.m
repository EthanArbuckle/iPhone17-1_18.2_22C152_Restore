@interface CHSRemoteDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPossibleSource;
- (CHSRemoteDevice)initWithCoder:(id)a3;
- (CHSRemoteDevice)initWithName:(id)a3 relationshipID:(id)a4 deviceID:(id)a5 currentSupportedVersion:(int64_t)a6 minSupportedVersion:(int64_t)a7 isPossibleSource:(BOOL)a8 pairingState:(int64_t)a9 lastConnectionDate:(id)a10;
- (NSDate)lastConnectionDate;
- (NSString)deviceID;
- (NSString)name;
- (NSUUID)relationshipID;
- (id)_initWithDevice:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)currentSupportedVersion;
- (int64_t)minSupportedVersion;
- (int64_t)pairingState;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSRemoteDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_relationshipID forKey:@"relationshipID"];
  [v4 encodeObject:self->_deviceID forKey:@"deviceID"];
  [v4 encodeInt32:LODWORD(self->_currentSupportedVersion) forKey:@"currentSupportedVersion"];
  [v4 encodeInt32:LODWORD(self->_minSupportedVersion) forKey:@"minSupportedVersion"];
  [v4 encodeBool:self->_isPossibleSource forKey:@"isPossibleSource"];
  [v4 encodeInt32:LODWORD(self->_pairingState) forKey:@"pairingState"];
  [v4 encodeObject:self->_lastConnectionDate forKey:@"lastConnectionDate"];
}

- (CHSRemoteDevice)initWithName:(id)a3 relationshipID:(id)a4 deviceID:(id)a5 currentSupportedVersion:(int64_t)a6 minSupportedVersion:(int64_t)a7 isPossibleSource:(BOOL)a8 pairingState:(int64_t)a9 lastConnectionDate:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a10;
  v30.receiver = self;
  v30.super_class = (Class)CHSRemoteDevice;
  v20 = [(CHSRemoteDevice *)&v30 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    uint64_t v23 = [v17 copy];
    relationshipID = v20->_relationshipID;
    v20->_relationshipID = (NSUUID *)v23;

    uint64_t v25 = [v18 copy];
    deviceID = v20->_deviceID;
    v20->_deviceID = (NSString *)v25;

    v20->_currentSupportedVersion = a6;
    v20->_minSupportedVersion = a7;
    v20->_isPossibleSource = a8;
    v20->_pairingState = a9;
    uint64_t v27 = [v19 copy];
    lastConnectionDate = v20->_lastConnectionDate;
    v20->_lastConnectionDate = (NSDate *)v27;
  }
  return v20;
}

- (CHSRemoteDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CHSRemoteDevice;
  v5 = [(CHSRemoteDevice *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relationshipID"];
    relationshipID = v5->_relationshipID;
    v5->_relationshipID = (NSUUID *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceID"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v10;

    v5->_currentSupportedVersion = (int)[v4 decodeInt32ForKey:@"currentSupportedVersion"];
    v5->_minSupportedVersion = (int)[v4 decodeInt32ForKey:@"minSupportedVersion"];
    v5->_isPossibleSource = [v4 decodeBoolForKey:@"isPossibleSource"];
    v5->_pairingState = (int)[v4 decodeInt32ForKey:@"pairingState"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastConnectionDate"];
    lastConnectionDate = v5->_lastConnectionDate;
    v5->_lastConnectionDate = (NSDate *)v12;
  }
  return v5;
}

- (id)_initWithDevice:(id)a3
{
  id v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CHSRemoteDevice;
  v5 = [(CHSRemoteDevice *)&v8 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_name, v4[1]);
    objc_storeStrong((id *)&v6->_relationshipID, v4[2]);
    objc_storeStrong((id *)&v6->_deviceID, v4[3]);
    v6->_currentSupportedVersion = (int64_t)v4[4];
    v6->_minSupportedVersion = (int64_t)v4[5];
    v6->_isPossibleSource = *((unsigned char *)v4 + 48);
    v6->_pairingState = (int64_t)v4[7];
    objc_storeStrong((id *)&v6->_lastConnectionDate, v4[8]);
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  objc_super v15 = [(CHSRemoteDevice *)self name];
  id v4 = [(CHSRemoteDevice *)self relationshipID];
  v5 = [v4 UUIDString];
  uint64_t v6 = [(CHSRemoteDevice *)self deviceID];
  int64_t v7 = [(CHSRemoteDevice *)self currentSupportedVersion];
  int64_t v8 = [(CHSRemoteDevice *)self minSupportedVersion];
  BOOL v9 = [(CHSRemoteDevice *)self isPossibleSource];
  int64_t v10 = [(CHSRemoteDevice *)self pairingState];
  v11 = [(CHSRemoteDevice *)self lastConnectionDate];
  uint64_t v12 = [v11 description];
  v13 = [v3 stringWithFormat:@"name: %@, relationshipID: %@, deviceID: %@, currentSupportedVersion: %lu, minSupportedVersion: %lu, isPossibleSource: %u, pairingState: %lu, lastConnectionDate: %@", v15, v5, v6, v7, v8, v9, v10, v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  uint64_t v6 = objc_opt_class();
  id v7 = v4;
  if (v6)
  {
    if (objc_opt_isKindOfClass()) {
      int64_t v8 = v7;
    }
    else {
      int64_t v8 = 0;
    }
  }
  else
  {
    int64_t v8 = 0;
  }
  id v9 = v8;

  name = self->_name;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __27__CHSRemoteDevice_isEqual___block_invoke;
  v52[3] = &unk_1E56C8508;
  id v11 = v9;
  id v53 = v11;
  id v12 = (id)[v5 appendObject:name counterpart:v52];
  relationshipID = self->_relationshipID;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __27__CHSRemoteDevice_isEqual___block_invoke_2;
  v50[3] = &unk_1E56C8F68;
  id v14 = v11;
  id v51 = v14;
  id v15 = (id)[v5 appendObject:relationshipID counterpart:v50];
  deviceID = self->_deviceID;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __27__CHSRemoteDevice_isEqual___block_invoke_3;
  v48[3] = &unk_1E56C8508;
  id v17 = v14;
  id v49 = v17;
  id v18 = (id)[v5 appendObject:deviceID counterpart:v48];
  int64_t currentSupportedVersion = self->_currentSupportedVersion;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __27__CHSRemoteDevice_isEqual___block_invoke_4;
  v46[3] = &unk_1E56C8530;
  id v20 = v17;
  id v47 = v20;
  id v21 = (id)[v5 appendInteger:currentSupportedVersion counterpart:v46];
  int64_t minSupportedVersion = self->_minSupportedVersion;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __27__CHSRemoteDevice_isEqual___block_invoke_5;
  v44[3] = &unk_1E56C8530;
  id v23 = v20;
  id v45 = v23;
  id v24 = (id)[v5 appendInteger:minSupportedVersion counterpart:v44];
  BOOL isPossibleSource = self->_isPossibleSource;
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __27__CHSRemoteDevice_isEqual___block_invoke_6;
  v42[3] = &unk_1E56C8468;
  id v26 = v23;
  id v43 = v26;
  id v27 = (id)[v5 appendBool:isPossibleSource counterpart:v42];
  int64_t pairingState = self->_pairingState;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __27__CHSRemoteDevice_isEqual___block_invoke_7;
  v40[3] = &unk_1E56C8530;
  id v29 = v26;
  id v41 = v29;
  id v30 = (id)[v5 appendInteger:pairingState counterpart:v40];
  lastConnectionDate = self->_lastConnectionDate;
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  v37 = __27__CHSRemoteDevice_isEqual___block_invoke_8;
  v38 = &unk_1E56C8F90;
  id v32 = v29;
  id v39 = v32;
  id v33 = (id)[v5 appendObject:lastConnectionDate counterpart:&v35];
  LOBYTE(v29) = objc_msgSend(v5, "isEqual", v35, v36, v37, v38);

  return (char)v29;
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) name];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) relationshipID];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deviceID];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) currentSupportedVersion];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) minSupportedVersion];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) isPossibleSource];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) pairingState];
}

uint64_t __27__CHSRemoteDevice_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) lastConnectionDate];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CHSRemoteDevice allocWithZone:a3];
  return [(CHSRemoteDevice *)v4 _initWithDevice:self];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[CHSMutableRemoteDevice allocWithZone:a3];
  return [(CHSRemoteDevice *)v4 _initWithDevice:self];
}

- (NSString)name
{
  return self->_name;
}

- (NSUUID)relationshipID
{
  return self->_relationshipID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (int64_t)currentSupportedVersion
{
  return self->_currentSupportedVersion;
}

- (int64_t)minSupportedVersion
{
  return self->_minSupportedVersion;
}

- (BOOL)isPossibleSource
{
  return self->_isPossibleSource;
}

- (int64_t)pairingState
{
  return self->_pairingState;
}

- (NSDate)lastConnectionDate
{
  return self->_lastConnectionDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConnectionDate, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_relationshipID, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end