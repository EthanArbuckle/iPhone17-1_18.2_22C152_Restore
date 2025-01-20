@interface AFBluetoothDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFBluetoothDeviceInfo)init;
- (AFBluetoothDeviceInfo)initWithAddress:(id)a3 name:(id)a4 deviceUID:(id)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7 isAdvancedAppleAudioDevice:(BOOL)a8 supportsInEarDetection:(BOOL)a9 supportsVoiceTrigger:(BOOL)a10 supportsJustSiri:(BOOL)a11 supportsSpokenNotification:(BOOL)a12 supportsListeningModeANC:(BOOL)a13 supportsListeningModeTransparency:(BOOL)a14 supportsListeningModeAutomatic:(BOOL)a15 supportsConversationAwareness:(BOOL)a16 supportsPersonalVolume:(BOOL)a17 supportsAnnounceCall:(BOOL)a18 headGestureConfiguration:(id)a19;
- (AFBluetoothDeviceInfo)initWithBuilder:(id)a3;
- (AFBluetoothDeviceInfo)initWithCoder:(id)a3;
- (AFBluetoothHeadGestureConfiguration)headGestureConfiguration;
- (BOOL)isAdvancedAppleAudioDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsAnnounceCall;
- (BOOL)supportsConversationAwareness;
- (BOOL)supportsInEarDetection;
- (BOOL)supportsJustSiri;
- (BOOL)supportsListeningModeANC;
- (BOOL)supportsListeningModeAutomatic;
- (BOOL)supportsListeningModeTransparency;
- (BOOL)supportsPersonalVolume;
- (BOOL)supportsSpokenNotification;
- (BOOL)supportsVoiceTrigger;
- (NSString)address;
- (NSString)name;
- (NSUUID)deviceUID;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unsigned)productID;
- (unsigned)vendorID;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFBluetoothDeviceInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headGestureConfiguration, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

- (AFBluetoothHeadGestureConfiguration)headGestureConfiguration
{
  return self->_headGestureConfiguration;
}

- (BOOL)supportsAnnounceCall
{
  return self->_supportsAnnounceCall;
}

- (BOOL)supportsPersonalVolume
{
  return self->_supportsPersonalVolume;
}

- (BOOL)supportsConversationAwareness
{
  return self->_supportsConversationAwareness;
}

- (BOOL)supportsListeningModeAutomatic
{
  return self->_supportsListeningModeAutomatic;
}

- (BOOL)supportsListeningModeTransparency
{
  return self->_supportsListeningModeTransparency;
}

- (BOOL)supportsListeningModeANC
{
  return self->_supportsListeningModeANC;
}

- (BOOL)supportsSpokenNotification
{
  return self->_supportsSpokenNotification;
}

- (BOOL)supportsJustSiri
{
  return self->_supportsJustSiri;
}

- (BOOL)supportsVoiceTrigger
{
  return self->_supportsVoiceTrigger;
}

- (BOOL)supportsInEarDetection
{
  return self->_supportsInEarDetection;
}

- (BOOL)isAdvancedAppleAudioDevice
{
  return self->_isAdvancedAppleAudioDevice;
}

- (unsigned)productID
{
  return self->_productID;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (NSUUID)deviceUID
{
  return self->_deviceUID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)address
{
  return self->_address;
}

- (void)encodeWithCoder:(id)a3
{
  address = self->_address;
  id v18 = a3;
  [v18 encodeObject:address forKey:@"AFBluetoothDeviceInfo::address"];
  [v18 encodeObject:self->_name forKey:@"AFBluetoothDeviceInfo::name"];
  [v18 encodeObject:self->_deviceUID forKey:@"AFBluetoothDeviceInfo::deviceUID"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_vendorID];
  [v18 encodeObject:v5 forKey:@"AFBluetoothDeviceInfo::vendorID"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_productID];
  [v18 encodeObject:v6 forKey:@"AFBluetoothDeviceInfo::productID"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAdvancedAppleAudioDevice];
  [v18 encodeObject:v7 forKey:@"AFBluetoothDeviceInfo::isAdvancedAppleAudioDevice"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsInEarDetection];
  [v18 encodeObject:v8 forKey:@"AFBluetoothDeviceInfo::supportsInEarDetection"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsVoiceTrigger];
  [v18 encodeObject:v9 forKey:@"AFBluetoothDeviceInfo::supportsVoiceTrigger"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsJustSiri];
  [v18 encodeObject:v10 forKey:@"AFBluetoothDeviceInfo::supportsJustSiri"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsSpokenNotification];
  [v18 encodeObject:v11 forKey:@"AFBluetoothDeviceInfo::supportsSpokenNotification"];

  v12 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsListeningModeANC];
  [v18 encodeObject:v12 forKey:@"AFBluetoothDeviceInfo::supportsListeningModeANC"];

  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsListeningModeTransparency];
  [v18 encodeObject:v13 forKey:@"AFBluetoothDeviceInfo::supportsListeningModeTransparency"];

  v14 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsListeningModeAutomatic];
  [v18 encodeObject:v14 forKey:@"AFBluetoothDeviceInfo::supportsListeningModeAutomatic"];

  v15 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsConversationAwareness];
  [v18 encodeObject:v15 forKey:@"AFBluetoothDeviceInfo::supportsConversationAwareness"];

  v16 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsPersonalVolume];
  [v18 encodeObject:v16 forKey:@"AFBluetoothDeviceInfo::supportsPersonalVolume"];

  v17 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsAnnounceCall];
  [v18 encodeObject:v17 forKey:@"AFBluetoothDeviceInfo::supportsAnnounceCall"];

  [v18 encodeObject:self->_headGestureConfiguration forKey:@"AFBluetoothDeviceInfo::headGestureConfiguration"];
}

- (AFBluetoothDeviceInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::address"];
  v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::name"];
  v33 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::deviceUID"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::vendorID"];
  unsigned int v32 = [v4 unsignedIntValue];

  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::productID"];
  unsigned int v31 = [v5 unsignedIntValue];

  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::isAdvancedAppleAudioDevice"];
  unsigned int v30 = [v6 BOOLValue];

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsInEarDetection"];
  char v29 = [v7 BOOLValue];

  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsVoiceTrigger"];
  char v28 = [v8 BOOLValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsJustSiri"];
  char v10 = [v9 BOOLValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsSpokenNotification"];
  char v12 = [v11 BOOLValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsListeningModeANC"];
  char v14 = [v13 BOOLValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsListeningModeTransparency"];
  char v16 = [v15 BOOLValue];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsListeningModeAutomatic"];
  LOBYTE(v15) = [v17 BOOLValue];

  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsConversationAwareness"];
  LOBYTE(v17) = [v18 BOOLValue];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsPersonalVolume"];
  char v20 = [v19 BOOLValue];

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::supportsAnnounceCall"];
  char v22 = [v21 BOOLValue];

  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFBluetoothDeviceInfo::headGestureConfiguration"];

  BYTE1(v27) = v22;
  LOBYTE(v27) = v20;
  HIBYTE(v26) = (_BYTE)v17;
  BYTE6(v26) = (_BYTE)v15;
  BYTE5(v26) = v16;
  BYTE4(v26) = v14;
  BYTE3(v26) = v12;
  BYTE2(v26) = v10;
  BYTE1(v26) = v28;
  LOBYTE(v26) = v29;
  v24 = -[AFBluetoothDeviceInfo initWithAddress:name:deviceUID:vendorID:productID:isAdvancedAppleAudioDevice:supportsInEarDetection:supportsVoiceTrigger:supportsJustSiri:supportsSpokenNotification:supportsListeningModeANC:supportsListeningModeTransparency:supportsListeningModeAutomatic:supportsConversationAwareness:supportsPersonalVolume:supportsAnnounceCall:headGestureConfiguration:](self, "initWithAddress:name:deviceUID:vendorID:productID:isAdvancedAppleAudioDevice:supportsInEarDetection:supportsVoiceTrigger:supportsJustSiri:supportsSpokenNotification:supportsListeningModeANC:supportsListeningModeTransparency:supportsListeningModeAutomatic:supportsConversationAwareness:supportsPersonalVolume:supportsAnnounceCall:headGestureConfiguration:", v35, v34, v33, v32, v31, v30, v26, v27, v23);

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFBluetoothDeviceInfo *)a3;
  if (self == v4)
  {
    BOOL v27 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unsigned int vendorID = self->_vendorID;
      if (vendorID != [(AFBluetoothDeviceInfo *)v5 vendorID]) {
        goto LABEL_27;
      }
      unsigned int productID = self->_productID;
      if (productID != [(AFBluetoothDeviceInfo *)v5 productID]) {
        goto LABEL_27;
      }
      BOOL isAdvancedAppleAudioDevice = self->_isAdvancedAppleAudioDevice;
      if (isAdvancedAppleAudioDevice != [(AFBluetoothDeviceInfo *)v5 isAdvancedAppleAudioDevice])goto LABEL_27; {
      BOOL supportsInEarDetection = self->_supportsInEarDetection;
      }
      if (supportsInEarDetection != [(AFBluetoothDeviceInfo *)v5 supportsInEarDetection]) {
        goto LABEL_27;
      }
      BOOL supportsVoiceTrigger = self->_supportsVoiceTrigger;
      if (supportsVoiceTrigger != [(AFBluetoothDeviceInfo *)v5 supportsVoiceTrigger]) {
        goto LABEL_27;
      }
      BOOL supportsJustSiri = self->_supportsJustSiri;
      if (supportsJustSiri != [(AFBluetoothDeviceInfo *)v5 supportsJustSiri]) {
        goto LABEL_27;
      }
      BOOL supportsSpokenNotification = self->_supportsSpokenNotification;
      if (supportsSpokenNotification == [(AFBluetoothDeviceInfo *)v5 supportsSpokenNotification]&& (BOOL supportsListeningModeANC = self->_supportsListeningModeANC, supportsListeningModeANC == [(AFBluetoothDeviceInfo *)v5 supportsListeningModeANC])&& (supportsListeningModeTransparency = self->_supportsListeningModeTransparency, supportsListeningModeTransparency == [(AFBluetoothDeviceInfo *)v5 supportsListeningModeTransparency])&& (supportsListeningModeAutomatic = self->_supportsListeningModeAutomatic, supportsListeningModeAutomatic == [(AFBluetoothDeviceInfo *)v5 supportsListeningModeAutomatic])&& (supportsConversationAwareness = self->_supportsConversationAwareness, supportsConversationAwareness == [(AFBluetoothDeviceInfo *)v5 supportsConversationAwareness])&& (supportsPersonalVolume = self->_supportsPersonalVolume,
            supportsPersonalVolume == [(AFBluetoothDeviceInfo *)v5 supportsPersonalVolume])
        && (BOOL supportsAnnounceCall = self->_supportsAnnounceCall,
            supportsAnnounceCall == [(AFBluetoothDeviceInfo *)v5 supportsAnnounceCall]))
      {
        v19 = [(AFBluetoothDeviceInfo *)v5 address];
        address = self->_address;
        if (address == v19 || [(NSString *)address isEqual:v19])
        {
          v21 = [(AFBluetoothDeviceInfo *)v5 name];
          name = self->_name;
          if (name == v21 || [(NSString *)name isEqual:v21])
          {
            v23 = [(AFBluetoothDeviceInfo *)v5 deviceUID];
            deviceUID = self->_deviceUID;
            if (deviceUID == v23 || [(NSUUID *)deviceUID isEqual:v23])
            {
              v25 = [(AFBluetoothDeviceInfo *)v5 headGestureConfiguration];
              headGestureConfiguration = self->_headGestureConfiguration;
              BOOL v27 = headGestureConfiguration == v25
                 || [(AFBluetoothHeadGestureConfiguration *)headGestureConfiguration isEqual:v25];
            }
            else
            {
              BOOL v27 = 0;
            }
          }
          else
          {
            BOOL v27 = 0;
          }
        }
        else
        {
          BOOL v27 = 0;
        }
      }
      else
      {
LABEL_27:
        BOOL v27 = 0;
      }
    }
    else
    {
      BOOL v27 = 0;
    }
  }

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_address hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  uint64_t v5 = v4 ^ [(NSUUID *)self->_deviceUID hash];
  v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_vendorID];
  uint64_t v6 = v5 ^ [v33 hash];
  unsigned int v32 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:self->_productID];
  uint64_t v7 = [v32 hash];
  unsigned int v31 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isAdvancedAppleAudioDevice];
  uint64_t v8 = v6 ^ v7 ^ [v31 hash];
  unsigned int v30 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsInEarDetection];
  uint64_t v9 = [v30 hash];
  char v29 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsVoiceTrigger];
  uint64_t v10 = v9 ^ [v29 hash];
  char v28 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsJustSiri];
  uint64_t v11 = v8 ^ v10 ^ [v28 hash];
  BOOL v27 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsSpokenNotification];
  uint64_t v12 = [v27 hash];
  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsListeningModeANC];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsListeningModeTransparency];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsListeningModeAutomatic];
  uint64_t v18 = v11 ^ v16 ^ [v17 hash];
  v19 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsConversationAwareness];
  uint64_t v20 = [v19 hash];
  v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsPersonalVolume];
  uint64_t v22 = v20 ^ [v21 hash];
  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_supportsAnnounceCall];
  uint64_t v24 = v22 ^ [v23 hash];
  unint64_t v25 = v18 ^ v24 ^ [(AFBluetoothHeadGestureConfiguration *)self->_headGestureConfiguration hash];

  return v25;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v19.receiver = self;
  v19.super_class = (Class)AFBluetoothDeviceInfo;
  uint64_t v5 = [(AFBluetoothDeviceInfo *)&v19 description];
  uint64_t v6 = @"YES";
  if (self->_isAdvancedAppleAudioDevice) {
    uint64_t v7 = @"YES";
  }
  else {
    uint64_t v7 = @"NO";
  }
  if (self->_supportsInEarDetection) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  if (self->_supportsVoiceTrigger) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if (self->_supportsJustSiri) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_supportsSpokenNotification) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_supportsListeningModeANC) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (self->_supportsListeningModeTransparency) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  if (self->_supportsListeningModeAutomatic) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  if (self->_supportsConversationAwareness) {
    v15 = @"YES";
  }
  else {
    v15 = @"NO";
  }
  if (self->_supportsPersonalVolume) {
    uint64_t v16 = @"YES";
  }
  else {
    uint64_t v16 = @"NO";
  }
  if (!self->_supportsAnnounceCall) {
    uint64_t v6 = @"NO";
  }
  v17 = objc_msgSend(v4, "initWithFormat:", @"%@ {address = %@, name = %@, deviceUID = %@, unsigned int vendorID = %u, productID = %u, isAdvancedAppleAudioDevice = %@, supportsInEarDetection = %@, supportsVoiceTrigger = %@, supportsJustSiri = %@, supportsSpokenNotification = %@, supportsListeningModeANC = %@, supportsListeningModeTransparency = %@, supportsListeningModeAutomatic = %@, supportsConversationAwareness = %@, supportsPersonalVolume = %@, supportsAnnounceCall = %@, headGestureConfiguration = %@}", v5, *(_OWORD *)&self->_address, self->_deviceUID, self->_vendorID, self->_productID, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v6,
                  self->_headGestureConfiguration);

  return v17;
}

- (id)description
{
  return [(AFBluetoothDeviceInfo *)self _descriptionWithIndent:0];
}

- (AFBluetoothDeviceInfo)initWithAddress:(id)a3 name:(id)a4 deviceUID:(id)a5 vendorID:(unsigned int)a6 productID:(unsigned int)a7 isAdvancedAppleAudioDevice:(BOOL)a8 supportsInEarDetection:(BOOL)a9 supportsVoiceTrigger:(BOOL)a10 supportsJustSiri:(BOOL)a11 supportsSpokenNotification:(BOOL)a12 supportsListeningModeANC:(BOOL)a13 supportsListeningModeTransparency:(BOOL)a14 supportsListeningModeAutomatic:(BOOL)a15 supportsConversationAwareness:(BOOL)a16 supportsPersonalVolume:(BOOL)a17 supportsAnnounceCall:(BOOL)a18 headGestureConfiguration:(id)a19
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a19;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __379__AFBluetoothDeviceInfo_initWithAddress_name_deviceUID_vendorID_productID_isAdvancedAppleAudioDevice_supportsInEarDetection_supportsVoiceTrigger_supportsJustSiri_supportsSpokenNotification_supportsListeningModeANC_supportsListeningModeTransparency_supportsListeningModeAutomatic_supportsConversationAwareness_supportsPersonalVolume_supportsAnnounceCall_headGestureConfiguration___block_invoke;
  v35[3] = &unk_1E5927498;
  id v36 = v21;
  id v37 = v22;
  unsigned int v40 = a6;
  unsigned int v41 = a7;
  BOOL v42 = a8;
  BOOL v43 = a9;
  BOOL v44 = a10;
  BOOL v45 = a11;
  BOOL v46 = a12;
  BOOL v47 = a13;
  BOOL v48 = a14;
  BOOL v49 = a15;
  BOOL v50 = a16;
  BOOL v51 = a17;
  BOOL v52 = a18;
  id v38 = v23;
  id v39 = v24;
  id v25 = v24;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  char v29 = [(AFBluetoothDeviceInfo *)self initWithBuilder:v35];

  return v29;
}

void __379__AFBluetoothDeviceInfo_initWithAddress_name_deviceUID_vendorID_productID_isAdvancedAppleAudioDevice_supportsInEarDetection_supportsVoiceTrigger_supportsJustSiri_supportsSpokenNotification_supportsListeningModeANC_supportsListeningModeTransparency_supportsListeningModeAutomatic_supportsConversationAwareness_supportsPersonalVolume_supportsAnnounceCall_headGestureConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setAddress:v3];
  [v4 setName:*(void *)(a1 + 40)];
  [v4 setDeviceUID:*(void *)(a1 + 48)];
  [v4 setVendorID:*(unsigned int *)(a1 + 64)];
  [v4 setProductID:*(unsigned int *)(a1 + 68)];
  [v4 setIsAdvancedAppleAudioDevice:*(unsigned __int8 *)(a1 + 72)];
  [v4 setSupportsInEarDetection:*(unsigned __int8 *)(a1 + 73)];
  [v4 setSupportsVoiceTrigger:*(unsigned __int8 *)(a1 + 74)];
  [v4 setSupportsJustSiri:*(unsigned __int8 *)(a1 + 75)];
  [v4 setSupportsSpokenNotification:*(unsigned __int8 *)(a1 + 76)];
  [v4 setSupportsListeningModeANC:*(unsigned __int8 *)(a1 + 77)];
  [v4 setSupportsListeningModeTransparency:*(unsigned __int8 *)(a1 + 78)];
  [v4 setSupportsListeningModeAutomatic:*(unsigned __int8 *)(a1 + 79)];
  [v4 setSupportsConversationAwareness:*(unsigned __int8 *)(a1 + 80)];
  [v4 setSupportsPersonalVolume:*(unsigned __int8 *)(a1 + 81)];
  [v4 setSupportsAnnounceCall:*(unsigned __int8 *)(a1 + 82)];
  [v4 setHeadGestureConfiguration:*(void *)(a1 + 56)];
}

- (AFBluetoothDeviceInfo)init
{
  return [(AFBluetoothDeviceInfo *)self initWithBuilder:0];
}

- (AFBluetoothDeviceInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothDeviceInfoMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)AFBluetoothDeviceInfo;
  uint64_t v5 = [(AFBluetoothDeviceInfo *)&v21 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFBluetoothDeviceInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFBluetoothDeviceInfoMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFBluetoothDeviceInfoMutation *)v7 getAddress];
      uint64_t v9 = [v8 copy];
      address = v6->_address;
      v6->_address = (NSString *)v9;

      uint64_t v11 = [(_AFBluetoothDeviceInfoMutation *)v7 getName];
      uint64_t v12 = [v11 copy];
      name = v6->_name;
      v6->_name = (NSString *)v12;

      uint64_t v14 = [(_AFBluetoothDeviceInfoMutation *)v7 getDeviceUID];
      uint64_t v15 = [v14 copy];
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v15;

      v6->_unsigned int vendorID = [(_AFBluetoothDeviceInfoMutation *)v7 getVendorID];
      v6->_unsigned int productID = [(_AFBluetoothDeviceInfoMutation *)v7 getProductID];
      v6->_BOOL isAdvancedAppleAudioDevice = [(_AFBluetoothDeviceInfoMutation *)v7 getIsAdvancedAppleAudioDevice];
      v6->_BOOL supportsInEarDetection = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsInEarDetection];
      v6->_BOOL supportsVoiceTrigger = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsVoiceTrigger];
      v6->_BOOL supportsJustSiri = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsJustSiri];
      v6->_BOOL supportsSpokenNotification = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsSpokenNotification];
      v6->_BOOL supportsListeningModeANC = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsListeningModeANC];
      v6->_BOOL supportsListeningModeTransparency = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsListeningModeTransparency];
      v6->_BOOL supportsListeningModeAutomatic = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsListeningModeAutomatic];
      v6->_BOOL supportsConversationAwareness = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsConversationAwareness];
      v6->_BOOL supportsPersonalVolume = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsPersonalVolume];
      v6->_BOOL supportsAnnounceCall = [(_AFBluetoothDeviceInfoMutation *)v7 getSupportsAnnounceCall];
      v17 = [(_AFBluetoothDeviceInfoMutation *)v7 getHeadGestureConfiguration];
      uint64_t v18 = [v17 copy];
      headGestureConfiguration = v6->_headGestureConfiguration;
      v6->_headGestureConfiguration = (AFBluetoothHeadGestureConfiguration *)v18;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFBluetoothDeviceInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFBluetoothDeviceInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFBluetoothDeviceInfoMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFBluetoothDeviceInfo);
      uint64_t v7 = [(_AFBluetoothDeviceInfoMutation *)v5 getAddress];
      uint64_t v8 = [v7 copy];
      address = v6->_address;
      v6->_address = (NSString *)v8;

      uint64_t v10 = [(_AFBluetoothDeviceInfoMutation *)v5 getName];
      uint64_t v11 = [v10 copy];
      name = v6->_name;
      v6->_name = (NSString *)v11;

      v13 = [(_AFBluetoothDeviceInfoMutation *)v5 getDeviceUID];
      uint64_t v14 = [v13 copy];
      deviceUID = v6->_deviceUID;
      v6->_deviceUID = (NSUUID *)v14;

      v6->_unsigned int vendorID = [(_AFBluetoothDeviceInfoMutation *)v5 getVendorID];
      v6->_unsigned int productID = [(_AFBluetoothDeviceInfoMutation *)v5 getProductID];
      v6->_BOOL isAdvancedAppleAudioDevice = [(_AFBluetoothDeviceInfoMutation *)v5 getIsAdvancedAppleAudioDevice];
      v6->_BOOL supportsInEarDetection = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsInEarDetection];
      v6->_BOOL supportsVoiceTrigger = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsVoiceTrigger];
      v6->_BOOL supportsJustSiri = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsJustSiri];
      v6->_BOOL supportsSpokenNotification = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsSpokenNotification];
      v6->_BOOL supportsListeningModeANC = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsListeningModeANC];
      v6->_BOOL supportsListeningModeTransparency = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsListeningModeTransparency];
      v6->_BOOL supportsListeningModeAutomatic = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsListeningModeAutomatic];
      v6->_BOOL supportsConversationAwareness = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsConversationAwareness];
      v6->_BOOL supportsPersonalVolume = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsPersonalVolume];
      v6->_BOOL supportsAnnounceCall = [(_AFBluetoothDeviceInfoMutation *)v5 getSupportsAnnounceCall];
      uint64_t v16 = [(_AFBluetoothDeviceInfoMutation *)v5 getHeadGestureConfiguration];
      uint64_t v17 = [v16 copy];
      headGestureConfiguration = v6->_headGestureConfiguration;
      v6->_headGestureConfiguration = (AFBluetoothHeadGestureConfiguration *)v17;
    }
    else
    {
      uint64_t v6 = (AFBluetoothDeviceInfo *)[(AFBluetoothDeviceInfo *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFBluetoothDeviceInfo *)[(AFBluetoothDeviceInfo *)self copy];
  }

  return v6;
}

@end