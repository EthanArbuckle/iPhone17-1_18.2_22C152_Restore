@interface AXRemoteHearingAidDevice
- (AXHARemoteUpdateProtocol)updateDelegate;
- (AXHearingAidMode)leftSelectedProgram;
- (AXHearingAidMode)leftSelectedStreamingProgram;
- (AXHearingAidMode)rightSelectedProgram;
- (AXHearingAidMode)rightSelectedStreamingProgram;
- (AXRemoteHearingAidDevice)init;
- (AXRemoteHearingAidDevice)initWithPersistentRepresentation:(id)a3;
- (AXRemoteHearingAidDevice)initWithRemoteRepresentation:(id)a3 andDeviceID:(id)a4;
- (BOOL)checkDidLoadProperties:(unint64_t)a3;
- (BOOL)containsPeripheralWithUUID:(id)a3;
- (BOOL)didLoadBasicProperties;
- (BOOL)didLoadProperty:(unint64_t)a3;
- (BOOL)didLoadRequiredPeerProperties;
- (BOOL)didLoadRequiredProperties;
- (BOOL)hasConnection;
- (BOOL)isBluetoothPaired;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isLeftConnected;
- (BOOL)isPaired;
- (BOOL)isRightConnected;
- (BOOL)keepInSync;
- (BOOL)leftAvailable;
- (BOOL)leftConnected;
- (BOOL)programsListsAreEqual;
- (BOOL)propertyIsAvailable:(unint64_t)a3 forEar:(int)a4;
- (BOOL)requiresBinauralStreaming;
- (BOOL)requiresCombinedPresets;
- (BOOL)requiresCombinedVolumes;
- (BOOL)rightAvailable;
- (BOOL)rightConnected;
- (BOOL)shouldDisplayCombinedVolume;
- (BOOL)shouldOnlyShowIndividualVolumesForProperty:(unint64_t)a3;
- (BOOL)showCombinedPrograms;
- (BOOL)supportsBinauralStreaming;
- (BOOL)supportsCombinedPresets;
- (BOOL)supportsCombinedVolumes;
- (BOOL)supportsCombinedVolumesForProperty:(unint64_t)a3;
- (NSArray)leftPrograms;
- (NSArray)rightPrograms;
- (NSDate)leftBatteryLowDate;
- (NSDate)rightBatteryLowDate;
- (NSMutableArray)manufacturer;
- (NSMutableArray)model;
- (NSString)description;
- (NSString)deviceUUID;
- (NSString)leftFirmwareVersion;
- (NSString)leftHardwareVersion;
- (NSString)leftPeripheralUUID;
- (NSString)leftUUID;
- (NSString)name;
- (NSString)rightFirmwareVersion;
- (NSString)rightHardwareVersion;
- (NSString)rightPeripheralUUID;
- (NSString)rightUUID;
- (char)leftBass;
- (char)leftTreble;
- (char)rightBass;
- (char)rightTreble;
- (double)combinedVolumeForProperty:(unint64_t)a3;
- (double)leftBatteryLevel;
- (double)leftMicrophoneVolume;
- (double)leftMixedVolume;
- (double)leftSensitivity;
- (double)leftStreamVolume;
- (double)rightBatteryLevel;
- (double)rightMicrophoneVolume;
- (double)rightMixedVolume;
- (double)rightSensitivity;
- (double)rightStreamVolume;
- (id)_valueForProperty:(unint64_t)a3;
- (id)combinedPrograms;
- (id)programAtIndex:(unsigned __int8)a3 forEar:(int)a4;
- (id)programs;
- (id)selectedProgramIndexes;
- (id)selectedPrograms;
- (id)valueForProperty:(unint64_t)a3;
- (int)availableEars;
- (int)availableInputEars;
- (int)earsSupportingWatch;
- (signed)leftMicrophoneVolumeSteps;
- (signed)leftMixedVolumeSteps;
- (signed)leftSensitivitySteps;
- (signed)leftStreamVolumeSteps;
- (signed)rightMicrophoneVolumeSteps;
- (signed)rightMixedVolumeSteps;
- (signed)rightSensitivitySteps;
- (signed)rightStreamVolumeSteps;
- (unint64_t)deviceType;
- (unint64_t)leftAvailableProperties;
- (unint64_t)leftLeaVersion;
- (unint64_t)loadedProperties;
- (unint64_t)pendingPropertyWrites;
- (unint64_t)requiredProperties;
- (unint64_t)rightAvailableProperties;
- (unint64_t)rightLeaVersion;
- (void)_delayWriteProperties;
- (void)_updateSelectedProgramsProperties;
- (void)_writeAllProgramSelectionsToPeripheral;
- (void)connect;
- (void)dealloc;
- (void)disconnectAndUnpair:(BOOL)a3;
- (void)loadRequiredProperties;
- (void)selectProgram:(id)a3 forEar:(int)a4;
- (void)setAvailableEars:(int)a3;
- (void)setAvailableInputEars:(int)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setDeviceUUID:(id)a3;
- (void)setEarsSupportingWatch:(int)a3;
- (void)setIsBluetoothPaired:(BOOL)a3;
- (void)setIsConnecting:(BOOL)a3;
- (void)setIsPaired:(BOOL)a3;
- (void)setKeepInSync:(BOOL)a3;
- (void)setLeftAvailableProperties:(unint64_t)a3;
- (void)setLeftBass:(char)a3;
- (void)setLeftBatteryLevel:(double)a3;
- (void)setLeftBatteryLowDate:(id)a3;
- (void)setLeftConnected:(BOOL)a3;
- (void)setLeftFirmwareVersion:(id)a3;
- (void)setLeftHardwareVersion:(id)a3;
- (void)setLeftLeaVersion:(unint64_t)a3;
- (void)setLeftMicrophoneVolume:(double)a3;
- (void)setLeftMicrophoneVolumeSteps:(signed __int16)a3;
- (void)setLeftMixedVolume:(double)a3;
- (void)setLeftMixedVolumeSteps:(signed __int16)a3;
- (void)setLeftPeripheralUUID:(id)a3;
- (void)setLeftPrograms:(id)a3;
- (void)setLeftSelectedProgram:(id)a3;
- (void)setLeftSelectedStreamingProgram:(id)a3;
- (void)setLeftSensitivity:(double)a3;
- (void)setLeftSensitivitySteps:(signed __int16)a3;
- (void)setLeftStreamVolume:(double)a3;
- (void)setLeftStreamVolumeSteps:(signed __int16)a3;
- (void)setLeftTreble:(char)a3;
- (void)setLeftUUID:(id)a3;
- (void)setLoadedProperties:(unint64_t)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setPendingPropertyWrites:(unint64_t)a3;
- (void)setRequiredProperties:(unint64_t)a3;
- (void)setRequiresBinauralStreaming:(BOOL)a3;
- (void)setRequiresCombinedPresets:(BOOL)a3;
- (void)setRequiresCombinedVolumes:(BOOL)a3;
- (void)setRightAvailableProperties:(unint64_t)a3;
- (void)setRightBass:(char)a3;
- (void)setRightBatteryLevel:(double)a3;
- (void)setRightBatteryLowDate:(id)a3;
- (void)setRightConnected:(BOOL)a3;
- (void)setRightFirmwareVersion:(id)a3;
- (void)setRightHardwareVersion:(id)a3;
- (void)setRightLeaVersion:(unint64_t)a3;
- (void)setRightMicrophoneVolume:(double)a3;
- (void)setRightMicrophoneVolumeSteps:(signed __int16)a3;
- (void)setRightMixedVolume:(double)a3;
- (void)setRightMixedVolumeSteps:(signed __int16)a3;
- (void)setRightPeripheralUUID:(id)a3;
- (void)setRightPrograms:(id)a3;
- (void)setRightSelectedProgram:(id)a3;
- (void)setRightSelectedStreamingProgram:(id)a3;
- (void)setRightSensitivity:(double)a3;
- (void)setRightSensitivitySteps:(signed __int16)a3;
- (void)setRightStreamVolume:(double)a3;
- (void)setRightStreamVolumeSteps:(signed __int16)a3;
- (void)setRightTreble:(char)a3;
- (void)setRightUUID:(id)a3;
- (void)setSupportsBinauralStreaming:(BOOL)a3;
- (void)setSupportsCombinedPresets:(BOOL)a3;
- (void)setSupportsCombinedVolumes:(BOOL)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setValue:(id)a3 forProperty:(unint64_t)a4;
- (void)writeVolumesForProperty:(unint64_t)a3;
@end

@implementation AXRemoteHearingAidDevice

- (AXRemoteHearingAidDevice)init
{
  v9.receiver = self;
  v9.super_class = (Class)AXRemoteHearingAidDevice;
  v2 = [(AXRemoteHearingAidDevice *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x263EFFA68];
    [(AXRemoteHearingAidDevice *)v2 setLeftPrograms:MEMORY[0x263EFFA68]];
    [(AXRemoteHearingAidDevice *)v3 setRightPrograms:v4];
    v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &stru_26C1D5720, &stru_26C1D5720, 0);
    [(AXRemoteHearingAidDevice *)v3 setManufacturer:v5];

    v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &stru_26C1D5720, &stru_26C1D5720, 0);
    [(AXRemoteHearingAidDevice *)v3 setModel:v6];

    [(AXRemoteHearingAidDevice *)v3 setSupportsCombinedPresets:1];
    [(AXRemoteHearingAidDevice *)v3 setSupportsCombinedVolumes:1];
    [(AXRemoteHearingAidDevice *)v3 setSupportsBinauralStreaming:1];
    v7 = +[AXHAServer sharedInstance];
    [(AXRemoteHearingAidDevice *)v3 setUpdateDelegate:v7];

    [(AXRemoteHearingAidDevice *)v3 setRequiredProperties:0xD07D42105FCLL];
  }
  return v3;
}

- (AXRemoteHearingAidDevice)initWithRemoteRepresentation:(id)a3 andDeviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AXRemoteHearingAidDevice *)self init];
  objc_super v9 = v8;
  if (v8)
  {
    [(AXRemoteHearingAidDevice *)v8 setDeviceUUID:v7];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __69__AXRemoteHearingAidDevice_initWithRemoteRepresentation_andDeviceID___block_invoke;
    v11[3] = &unk_2640FCDB0;
    v12 = v9;
    [v6 enumerateKeysAndObjectsUsingBlock:v11];
  }
  return v9;
}

void __69__AXRemoteHearingAidDevice_initWithRemoteRepresentation_andDeviceID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));
}

- (AXRemoteHearingAidDevice)initWithPersistentRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(AXRemoteHearingAidDevice *)self init];
  id v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__AXRemoteHearingAidDevice_initWithPersistentRepresentation___block_invoke;
    v9[3] = &unk_2640FCDB0;
    id v7 = v5;
    v10 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    [(AXRemoteHearingAidDevice *)v7 setIsPaired:1];
  }
  return v6;
}

void __61__AXRemoteHearingAidDevice_initWithPersistentRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v5 = a3;
  if ([v28 isEqualToString:@"ax_hearing_device_man_key"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length])
    {
      id v6 = [*(id *)(a1 + 32) manufacturer];
LABEL_9:
      id v7 = v6;
      [v6 replaceObjectAtIndex:0 withObject:v5];
LABEL_18:

      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    v8 = [*(id *)(a1 + 32) manufacturer];
    goto LABEL_17;
  }
  if ([v28 isEqualToString:@"ax_hearing_device_model_key"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 length])
    {
      id v6 = [*(id *)(a1 + 32) model];
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    v8 = [*(id *)(a1 + 32) model];
LABEL_17:
    id v7 = v8;
    [v8 setArray:v5];
    goto LABEL_18;
  }
  if ([v28 isEqualToString:@"ax_hearing_device_man_model_key"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    objc_super v9 = *(void **)(a1 + 32);
    v10 = [&unk_26C1E57B0 stringValue];
    v11 = [v5 objectForKey:v10];
    [v9 setValue:v11 forProperty:0x80000];

    v12 = *(void **)(a1 + 32);
    v13 = [&unk_26C1E57C8 stringValue];
    v14 = [v5 objectForKey:v13];
    [v12 setValue:v14 forProperty:0x100000];
    goto LABEL_46;
  }
  if ([v28 isEqualToString:@"ax_hearing_device_name_key"])
  {
    [*(id *)(a1 + 32) setName:v5];
    goto LABEL_19;
  }
  if ([v28 isEqualToString:@"ax_hearing_device_lr_key"])
  {
    uint64_t v15 = [v5 intValue];
    if (v15 <= 6 && ((1 << v15) & 0x54) != 0) {
      [*(id *)(a1 + 32) setAvailableEars:v15];
    }
  }
  else if (([v28 isEqualToString:@"ax_hearing_device_left_peripheral_key"] & 1) != 0 {
         || [v28 isEqualToString:@"ax_hearing_device_right_peripheral_key"])
  }
  {
    v16 = [v5 objectForKey:@"ax_hearing_device_isleft_key"];
    int v17 = [v16 BOOLValue];

    v13 = [v5 objectForKey:@"ax_hearing_device_hiid_key"];
    v14 = [v5 objectForKey:@"ax_hearing_device_hiidother_key"];
    v18 = [v5 objectForKey:@"ax_hearing_device_uuid_key"];
    v19 = [v5 objectForKey:@"ax_hearing_device_lea_version_key"];
    int v20 = [v19 intValue];

    if ([v18 length] && (objc_msgSend(v13, "length") || objc_msgSend(v14, "length")))
    {
      char v21 = [v18 hasPrefix:*MEMORY[0x263F47278]];
      if (v17)
      {
        if ((v21 & 1) == 0) {
          [*(id *)(a1 + 32) setLeftPeripheralUUID:v18];
        }
        [*(id *)(a1 + 32) setLeftUUID:v13];
        [*(id *)(a1 + 32) setRightUUID:v14];
        [*(id *)(a1 + 32) setLeftLeaVersion:v20];
      }
      else
      {
        if ((v21 & 1) == 0) {
          [*(id *)(a1 + 32) setRightPeripheralUUID:v18];
        }
        [*(id *)(a1 + 32) setLeftUUID:v14];
        [*(id *)(a1 + 32) setRightUUID:v13];
        [*(id *)(a1 + 32) setRightLeaVersion:v20];
      }
      v22 = [*(id *)(a1 + 32) leftUUID];

      v23 = [*(id *)(a1 + 32) rightUUID];
      v24 = v23;
      if (v22)
      {

        if (v24)
        {
          v25 = NSString;
          v26 = [*(id *)(a1 + 32) leftUUID];
          v27 = [*(id *)(a1 + 32) rightUUID];
          v24 = [v25 stringWithFormat:@"%@_%@", v26, v27];
        }
        else
        {
          v24 = [*(id *)(a1 + 32) leftUUID];
        }
      }
      [*(id *)(a1 + 32) setDeviceUUID:v24];
    }
LABEL_46:
  }
LABEL_19:
}

- (void)dealloc
{
  [(AXRemoteHearingAidDevice *)self setManufacturer:0];
  [(AXRemoteHearingAidDevice *)self setModel:0];
  [(AXRemoteHearingAidDevice *)self setLeftFirmwareVersion:0];
  [(AXRemoteHearingAidDevice *)self setRightFirmwareVersion:0];
  [(AXRemoteHearingAidDevice *)self setLeftHardwareVersion:0];
  [(AXRemoteHearingAidDevice *)self setRightHardwareVersion:0];
  [(AXRemoteHearingAidDevice *)self setRightPrograms:0];
  [(AXRemoteHearingAidDevice *)self setLeftPrograms:0];
  [(AXRemoteHearingAidDevice *)self setLeftPeripheralUUID:0];
  [(AXRemoteHearingAidDevice *)self setRightPeripheralUUID:0];
  [(AXRemoteHearingAidDevice *)self setLeftSelectedProgram:0];
  [(AXRemoteHearingAidDevice *)self setRightSelectedProgram:0];
  [(AXRemoteHearingAidDevice *)self setLeftUUID:0];
  [(AXRemoteHearingAidDevice *)self setRightUUID:0];
  [(AXRemoteHearingAidDevice *)self setLeftSelectedStreamingProgram:0];
  [(AXRemoteHearingAidDevice *)self setRightSelectedStreamingProgram:0];
  [(AXRemoteHearingAidDevice *)self setLeftBatteryLowDate:0];
  [(AXRemoteHearingAidDevice *)self setRightBatteryLowDate:0];
  [(AXRemoteHearingAidDevice *)self setDeviceUUID:0];
  [(AXRemoteHearingAidDevice *)self setName:0];
  v3.receiver = self;
  v3.super_class = (Class)AXRemoteHearingAidDevice;
  [(AXRemoteHearingAidDevice *)&v3 dealloc];
}

- (void)connect
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  objc_super v3 = [NSString stringWithFormat:@"Requesting connect: %@", self];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice connect]", 283, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    id v7 = v5;
    *(_DWORD *)buf = 136446210;
    uint64_t v11 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v8 = [(AXRemoteHearingAidDevice *)self updateDelegate];
  objc_super v9 = [(AXRemoteHearingAidDevice *)self deviceUUID];
  [v8 writeValue:&unk_26C1E57E0 forProperty:0x200000 andDeviceID:v9];
}

- (void)disconnectAndUnpair:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  id v4 = [NSString stringWithFormat:@"Requesting disconnect: %@", self];
  id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice disconnectAndUnpair:]", 289, v4];
  id v6 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = [v7 UTF8String];
    _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  objc_super v9 = [(AXRemoteHearingAidDevice *)self updateDelegate];
  v10 = [(AXRemoteHearingAidDevice *)self deviceUUID];
  [v9 writeValue:&unk_26C1E57F8 forProperty:0x200000 andDeviceID:v10];
}

- (BOOL)leftAvailable
{
  return ([(AXRemoteHearingAidDevice *)self availableEars] >> 1) & 1;
}

- (BOOL)rightAvailable
{
  return ([(AXRemoteHearingAidDevice *)self availableEars] >> 2) & 1;
}

- (BOOL)isConnected
{
  BOOL v3 = [(AXRemoteHearingAidDevice *)self leftAvailable];
  if (v3 != [(AXRemoteHearingAidDevice *)self leftConnected]) {
    return 0;
  }
  BOOL v5 = [(AXRemoteHearingAidDevice *)self rightAvailable];
  return v5 ^ [(AXRemoteHearingAidDevice *)self rightConnected] ^ 1;
}

- (BOOL)hasConnection
{
  if ([(AXRemoteHearingAidDevice *)self leftConnected]) {
    return 1;
  }

  return [(AXRemoteHearingAidDevice *)self rightConnected];
}

- (BOOL)isLeftConnected
{
  if ([(AXRemoteHearingAidDevice *)self leftAvailable])
  {
    if ([(AXRemoteHearingAidDevice *)self leftConnected])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v4 = +[AXHAServer sharedInstance];
      if ([v4 hearingAidReachable]) {
        BOOL v3 = ![(AXRemoteHearingAidDevice *)self rightConnected];
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)isRightConnected
{
  if ([(AXRemoteHearingAidDevice *)self rightAvailable])
  {
    if ([(AXRemoteHearingAidDevice *)self rightConnected])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      id v4 = +[AXHAServer sharedInstance];
      if ([v4 hearingAidReachable]) {
        BOOL v3 = ![(AXRemoteHearingAidDevice *)self leftConnected];
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)containsPeripheralWithUUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXRemoteHearingAidDevice *)self deviceUUID];
  uint64_t v6 = [v5 rangeOfString:v4];

  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)didLoadProperty:(unint64_t)a3
{
  return (a3 & ~[(AXRemoteHearingAidDevice *)self loadedProperties]) == 0;
}

- (BOOL)didLoadBasicProperties
{
  return 1;
}

- (BOOL)didLoadRequiredPeerProperties
{
  unint64_t v3 = [(AXRemoteHearingAidDevice *)self requiredProperties] & 0xFFFFFFFFFBDFFFFFLL;

  return [(AXRemoteHearingAidDevice *)self checkDidLoadProperties:v3];
}

- (BOOL)didLoadRequiredProperties
{
  unint64_t v3 = [(AXRemoteHearingAidDevice *)self requiredProperties];

  return [(AXRemoteHearingAidDevice *)self checkDidLoadProperties:v3];
}

- (BOOL)checkDidLoadProperties:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v4 = [(AXRemoteHearingAidDevice *)self didLoadProperty:a3];
  if (!v4 && [MEMORY[0x263F472B0] isInternalInstall])
  {
    BOOL v5 = [MEMORY[0x263EFF980] array];
    unint64_t v6 = [(AXRemoteHearingAidDevice *)self requiredProperties];
    for (uint64_t i = 0; i != 64; ++i)
    {
      if (((1 << i) & v6) != 0 && ![(AXRemoteHearingAidDevice *)self didLoadProperty:1 << i])
      {
        v8 = hearingPropertyDescription(1 << i);
        [v5 addObject:v8];
      }
    }
    HAInitializeLogging();
    objc_super v9 = NSString;
    v10 = [v5 componentsJoinedByString:@" and "];
    uint64_t v11 = [v9 stringWithFormat:@"Haven't loaded %@", v10];

    uint64_t v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice checkDidLoadProperties:]", 375, v11];
    uint64_t v13 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      uint64_t v15 = v13;
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = [v14 UTF8String];
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  return v4;
}

- (void)loadRequiredProperties
{
  id v5 = [(AXRemoteHearingAidDevice *)self updateDelegate];
  unint64_t v3 = [(AXRemoteHearingAidDevice *)self requiredProperties] | 0xFF800105C4;
  BOOL v4 = [(AXRemoteHearingAidDevice *)self deviceUUID];
  [v5 updateProperty:v3 forDeviceID:v4];
}

- (BOOL)propertyIsAvailable:(unint64_t)a3 forEar:(int)a4
{
  switch(a4)
  {
    case 6:
      if ((a3 & ~[(AXRemoteHearingAidDevice *)self leftAvailableProperties]) == 0) {
        return 1;
      }
      goto LABEL_7;
    case 4:
LABEL_7:
      unint64_t v6 = [(AXRemoteHearingAidDevice *)self rightAvailableProperties];
      return (a3 & ~v6) == 0;
    case 2:
      unint64_t v6 = [(AXRemoteHearingAidDevice *)self leftAvailableProperties];
      return (a3 & ~v6) == 0;
  }
  return 0;
}

- (void)_delayWriteProperties
{
  self->_delayWritePending = 1;
  if (([(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0x40) != 0)
  {
    unint64_t v3 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    BOOL v4 = (void *)MEMORY[0x263EFF8C0];
    id v5 = [NSNumber numberWithDouble:self->_leftMicrophoneVolume];
    unint64_t v6 = [NSNumber numberWithDouble:self->_rightMicrophoneVolume];
    id v7 = objc_msgSend(v4, "arrayWithObjects:", v5, v6, 0);
    v8 = [(AXRemoteHearingAidDevice *)self deviceUUID];
    [v3 writeValue:v7 forProperty:64 andDeviceID:v8];

    [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0xFFFFFFFFFFFFFFBFLL];
  }
  if (([(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0x80) != 0)
  {
    objc_super v9 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    v10 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v11 = [NSNumber numberWithDouble:self->_leftStreamVolume];
    uint64_t v12 = [NSNumber numberWithDouble:self->_rightStreamVolume];
    uint64_t v13 = objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);
    id v14 = [(AXRemoteHearingAidDevice *)self deviceUUID];
    [v9 writeValue:v13 forProperty:128 andDeviceID:v14];

    [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0xFFFFFFFFFFFFFF7FLL];
  }
  if (([(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0x80000000) != 0)
  {
    uint64_t v15 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    v16 = (void *)MEMORY[0x263EFF8C0];
    int v17 = [NSNumber numberWithDouble:self->_leftSensitivity];
    uint64_t v18 = [NSNumber numberWithDouble:self->_rightSensitivity];
    uint64_t v19 = objc_msgSend(v16, "arrayWithObjects:", v17, v18, 0);
    int v20 = [(AXRemoteHearingAidDevice *)self deviceUUID];
    [v15 writeValue:v19 forProperty:0x80000000 andDeviceID:v20];

    [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0xFFFFFFFF7FFFFFFFLL];
  }
  if (([(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0x2000000000) != 0)
  {
    char v21 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    v22 = (void *)MEMORY[0x263EFF8C0];
    v23 = [NSNumber numberWithChar:self->_leftTreble];
    v24 = [NSNumber numberWithChar:self->_rightTreble];
    v25 = objc_msgSend(v22, "arrayWithObjects:", v23, v24, 0);
    v26 = [(AXRemoteHearingAidDevice *)self deviceUUID];
    [v21 writeValue:v25 forProperty:0x2000000000 andDeviceID:v26];

    [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0xFFFFFFDFFFFFFFFFLL];
  }
  if (([(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0x1000000000) != 0)
  {
    v27 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    id v28 = (void *)MEMORY[0x263EFF8C0];
    v29 = [NSNumber numberWithChar:self->_leftBass];
    v30 = [NSNumber numberWithChar:self->_rightBass];
    v31 = objc_msgSend(v28, "arrayWithObjects:", v29, v30, 0);
    v32 = [(AXRemoteHearingAidDevice *)self deviceUUID];
    [v27 writeValue:v31 forProperty:0x1000000000 andDeviceID:v32];

    [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0xFFFFFFEFFFFFFFFFLL];
  }
  if (([(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0x4000000000) != 0)
  {
    v33 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    v34 = (void *)MEMORY[0x263EFF8C0];
    v35 = [NSNumber numberWithDouble:self->_leftMixedVolume];
    v36 = [NSNumber numberWithDouble:self->_rightMixedVolume];
    v37 = objc_msgSend(v34, "arrayWithObjects:", v35, v36, 0);
    v38 = [(AXRemoteHearingAidDevice *)self deviceUUID];
    [v33 writeValue:v37 forProperty:0x4000000000 andDeviceID:v38];

    [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] & 0xFFFFFFBFFFFFFFFFLL];
  }
  dispatch_time_t v39 = dispatch_time(0, 100000000);
  v40 = dispatch_get_global_queue(17, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__AXRemoteHearingAidDevice__delayWriteProperties__block_invoke;
  block[3] = &unk_2640FC960;
  block[4] = self;
  dispatch_after(v39, v40, block);
}

uint64_t __49__AXRemoteHearingAidDevice__delayWriteProperties__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _delayWriteProperties];
}

- (void)writeVolumesForProperty:(unint64_t)a3
{
  [(AXRemoteHearingAidDevice *)self setPendingPropertyWrites:[(AXRemoteHearingAidDevice *)self pendingPropertyWrites] | a3];
  if ((uint64_t)a3 > 0xFFFFFFFFFLL)
  {
    if (a3 != 0x1000000000 && a3 != 0x4000000000)
    {
      uint64_t v5 = 0x2000000000;
LABEL_8:
      if (a3 != v5) {
        return;
      }
    }
  }
  else if (a3 != 64 && a3 != 128)
  {
    uint64_t v5 = 0x80000000;
    goto LABEL_8;
  }
  if (!self->_delayWritePending)
  {
    [(AXRemoteHearingAidDevice *)self _delayWriteProperties];
  }
}

- (void)setLeftMicrophoneVolume:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_leftMicrophoneVolume != v4)
  {
    self->_leftMicrophoneVolume = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:64];
  }
}

- (void)setRightMicrophoneVolume:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_rightMicrophoneVolume != v4)
  {
    self->_rightMicrophoneVolume = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:64];
  }
}

- (void)setLeftStreamVolume:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_leftStreamVolume != v4)
  {
    self->_leftStreamVolume = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:128];
  }
}

- (void)setRightStreamVolume:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_rightStreamVolume != v4)
  {
    self->_rightStreamVolume = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:128];
  }
}

- (void)setLeftSensitivity:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_leftSensitivity != v4)
  {
    self->_leftSensitivity = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x80000000];
  }
}

- (void)setRightSensitivity:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_rightSensitivity != v4)
  {
    self->_rightSensitivity = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x80000000];
  }
}

- (void)setLeftTreble:(char)a3
{
  if (a3 <= -127) {
    char v3 = -127;
  }
  else {
    char v3 = a3;
  }
  if (self->_leftTreble != v3)
  {
    self->_leftTreble = v3;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x2000000000];
  }
}

- (void)setRightTreble:(char)a3
{
  if (a3 <= -127) {
    char v3 = -127;
  }
  else {
    char v3 = a3;
  }
  if (self->_rightTreble != v3)
  {
    self->_rightTreble = v3;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x2000000000];
  }
}

- (void)setLeftBass:(char)a3
{
  if (a3 <= -127) {
    char v3 = -127;
  }
  else {
    char v3 = a3;
  }
  if (self->_leftBass != v3)
  {
    self->_leftBass = v3;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x1000000000];
  }
}

- (void)setRightBass:(char)a3
{
  if (a3 <= -127) {
    char v3 = -127;
  }
  else {
    char v3 = a3;
  }
  if (self->_rightBass != v3)
  {
    self->_rightBass = v3;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x1000000000];
  }
}

- (void)setLeftMixedVolume:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_leftMixedVolume != v4)
  {
    self->_leftMixedVolume = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x4000000000];
  }
}

- (void)setRightMixedVolume:(double)a3
{
  double v3 = 0.0;
  if (a3 >= 0.0) {
    double v3 = a3;
  }
  if (a3 <= 1.0) {
    double v4 = v3;
  }
  else {
    double v4 = 1.0;
  }
  if (self->_rightMixedVolume != v4)
  {
    self->_rightMixedVolume = v4;
    [(AXRemoteHearingAidDevice *)self writeVolumesForProperty:0x4000000000];
  }
}

- (id)programAtIndex:(unsigned __int8)a3 forEar:(int)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__7;
  id v14 = __Block_byref_object_dispose__7;
  id v15 = 0;
  if (a4 == 2) {
    [(AXRemoteHearingAidDevice *)self leftPrograms];
  }
  else {
  uint64_t v5 = [(AXRemoteHearingAidDevice *)self rightPrograms];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__AXRemoteHearingAidDevice_programAtIndex_forEar___block_invoke;
  v8[3] = &unk_2640FEA40;
  unsigned __int8 v9 = a3;
  v8[4] = &v10;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v6;
}

void __50__AXRemoteHearingAidDevice_programAtIndex_forEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 index] == *(unsigned __int8 *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (BOOL)supportsCombinedVolumesForProperty:(unint64_t)a3
{
  BOOL v5 = [(AXRemoteHearingAidDevice *)self leftAvailable];
  if (v5 != [(AXRemoteHearingAidDevice *)self rightAvailable]) {
    return 1;
  }
  BOOL result = 0;
  if ((uint64_t)a3 > 0x7FFFFFFF)
  {
    if (a3 == 0x80000000)
    {
      int v15 = [(AXRemoteHearingAidDevice *)self leftSensitivitySteps];
      if (v15 == [(AXRemoteHearingAidDevice *)self rightSensitivitySteps])
      {
        [(AXRemoteHearingAidDevice *)self leftSensitivity];
        double v9 = v16;
        [(AXRemoteHearingAidDevice *)self rightSensitivity];
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
    else
    {
      if (a3 != 0x4000000000) {
        return result;
      }
      int v11 = [(AXRemoteHearingAidDevice *)self leftMixedVolumeSteps];
      if (v11 == [(AXRemoteHearingAidDevice *)self rightMixedVolumeSteps])
      {
        [(AXRemoteHearingAidDevice *)self leftMixedVolume];
        double v9 = v12;
        [(AXRemoteHearingAidDevice *)self rightMixedVolume];
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
  }
  else if (a3 == 64)
  {
    int v13 = [(AXRemoteHearingAidDevice *)self leftMicrophoneVolumeSteps];
    if (v13 == [(AXRemoteHearingAidDevice *)self rightMicrophoneVolumeSteps])
    {
      [(AXRemoteHearingAidDevice *)self leftMicrophoneVolume];
      double v9 = v14;
      [(AXRemoteHearingAidDevice *)self rightMicrophoneVolume];
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  else
  {
    if (a3 != 128) {
      return result;
    }
    int v7 = [(AXRemoteHearingAidDevice *)self leftStreamVolumeSteps];
    if (v7 == [(AXRemoteHearingAidDevice *)self rightStreamVolumeSteps])
    {
      [(AXRemoteHearingAidDevice *)self leftStreamVolume];
      double v9 = v8;
      [(AXRemoteHearingAidDevice *)self rightStreamVolume];
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  return 0;
}

- (BOOL)shouldDisplayCombinedVolume
{
  double v3 = +[HUHearingAidSettings sharedInstance];
  BOOL v4 = (![v3 independentHearingAidSettings]
     || [(AXRemoteHearingAidDevice *)self requiresCombinedVolumes])
    && [(AXRemoteHearingAidDevice *)self supportsCombinedVolumes]
    && [(AXRemoteHearingAidDevice *)self isLeftConnected]
    && [(AXRemoteHearingAidDevice *)self isRightConnected];

  return v4;
}

- (BOOL)shouldOnlyShowIndividualVolumesForProperty:(unint64_t)a3
{
  BOOL v5 = +[HUHearingAidSettings sharedInstance];
  if ((![v5 independentHearingAidSettings]
     || [(AXRemoteHearingAidDevice *)self requiresCombinedVolumes]
     || ![(AXRemoteHearingAidDevice *)self isLeftConnected]
     || ![(AXRemoteHearingAidDevice *)self isRightConnected])
    && [(AXRemoteHearingAidDevice *)self supportsCombinedVolumes]
    && (BOOL v6 = [(AXRemoteHearingAidDevice *)self isLeftConnected],
        v6 == [(AXRemoteHearingAidDevice *)self isRightConnected]))
  {
    BOOL v7 = ![(AXRemoteHearingAidDevice *)self supportsCombinedVolumesForProperty:a3];
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BOOL)programsListsAreEqual
{
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  double v3 = [(AXRemoteHearingAidDevice *)self leftPrograms];
  uint64_t v4 = [v3 count];
  BOOL v5 = [(AXRemoteHearingAidDevice *)self rightPrograms];
  LOBYTE(v4) = v4 == [v5 count];

  char v18 = v4;
  if (!*((unsigned char *)v16 + 24)) {
    goto LABEL_5;
  }
  BOOL v6 = [(AXRemoteHearingAidDevice *)self leftPrograms];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__AXRemoteHearingAidDevice_programsListsAreEqual__block_invoke;
  v14[3] = &unk_2640FE9C8;
  v14[4] = self;
  v14[5] = &v15;
  [v6 enumerateObjectsUsingBlock:v14];

  if (*((unsigned char *)v16 + 24))
  {
    BOOL v7 = [(AXRemoteHearingAidDevice *)self leftSelectedProgram];
    double v8 = [(AXRemoteHearingAidDevice *)self rightSelectedProgram];
    if ([v7 isEqual:v8])
    {
      double v9 = [(AXRemoteHearingAidDevice *)self leftSelectedStreamingProgram];
      double v10 = [(AXRemoteHearingAidDevice *)self rightSelectedStreamingProgram];
      char v11 = [v9 isEqual:v10];
      *((unsigned char *)v16 + 24) = v11;
    }
    else
    {
      *((unsigned char *)v16 + 24) = 0;
    }

    BOOL v12 = *((unsigned char *)v16 + 24) != 0;
  }
  else
  {
LABEL_5:
    BOOL v12 = 0;
  }
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __49__AXRemoteHearingAidDevice_programsListsAreEqual__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = [a2 index];
  double v8 = [*(id *)(a1 + 32) rightPrograms];
  double v9 = [v8 objectAtIndex:a3];
  int v10 = [v9 index];

  if (v7 != v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)showCombinedPrograms
{
  if (![(AXRemoteHearingAidDevice *)self supportsCombinedPresets]) {
    return 0;
  }
  double v3 = +[HUHearingAidSettings sharedInstance];
  BOOL v4 = (![v3 independentHearingAidSettings]
     || [(AXRemoteHearingAidDevice *)self requiresCombinedPresets])
    && [(AXRemoteHearingAidDevice *)self programsListsAreEqual];

  return v4;
}

- (id)programs
{
  double v3 = [(AXRemoteHearingAidDevice *)self leftPrograms];
  BOOL v4 = [(AXRemoteHearingAidDevice *)self rightPrograms];
  BOOL v5 = [v3 arrayByAddingObjectsFromArray:v4];
  BOOL v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_16];

  return v6;
}

uint64_t __36__AXRemoteHearingAidDevice_programs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [v4 index];
  unsigned int v7 = [v5 index];
  BOOL v8 = v6 == v7;
  if (v6 < v7) {
    uint64_t v9 = -1;
  }
  else {
    uint64_t v9 = 1;
  }
  if (v8)
  {
    [v4 setEar:6];
    [v5 setEar:6];
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)combinedPrograms
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = [(AXRemoteHearingAidDevice *)self programs];
  double v3 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __44__AXRemoteHearingAidDevice_combinedPrograms__block_invoke;
        v13[3] = &unk_2640FEA68;
        v13[4] = v8;
        if ([v3 indexOfObjectPassingTest:v13] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = [v8 name];
          uint64_t v10 = [v9 length];

          if (v10) {
            [v3 addObject:v8];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v3;
}

BOOL __44__AXRemoteHearingAidDevice_combinedPrograms__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v6 = [a2 index];
  int v7 = [*(id *)(a1 + 32) index];
  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

- (void)_updateSelectedProgramsProperties
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  double v3 = NSString;
  uint64_t v4 = [(AXRemoteHearingAidDevice *)self programs];
  uint64_t v5 = [v3 stringWithFormat:@"%@", v4];

  int v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice _updateSelectedProgramsProperties]", 732, v5];
  int v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136446210;
    uint64_t v23 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AXRemoteHearingAidDevice *)self setLeftSelectedStreamingProgram:0];
  [(AXRemoteHearingAidDevice *)self setRightSelectedStreamingProgram:0];
  [(AXRemoteHearingAidDevice *)self setRightSelectedProgram:0];
  [(AXRemoteHearingAidDevice *)self setLeftSelectedProgram:0];
  uint64_t v10 = [(AXRemoteHearingAidDevice *)self leftPrograms];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke;
  v21[3] = &unk_2640FD3F0;
  v21[4] = self;
  [v10 enumerateObjectsUsingBlock:v21];

  char v11 = [(AXRemoteHearingAidDevice *)self rightPrograms];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke_2;
  v20[3] = &unk_2640FD3F0;
  v20[4] = self;
  [v11 enumerateObjectsUsingBlock:v20];

  BOOL v12 = [(AXRemoteHearingAidDevice *)self leftSelectedProgram];

  if (!v12)
  {
    int v13 = [(AXRemoteHearingAidDevice *)self leftSelectedStreamingProgram];
    [(AXRemoteHearingAidDevice *)self setLeftSelectedProgram:v13];
  }
  long long v14 = [(AXRemoteHearingAidDevice *)self leftSelectedStreamingProgram];

  if (!v14)
  {
    long long v15 = [(AXRemoteHearingAidDevice *)self leftSelectedProgram];
    [(AXRemoteHearingAidDevice *)self setLeftSelectedStreamingProgram:v15];
  }
  long long v16 = [(AXRemoteHearingAidDevice *)self rightSelectedProgram];

  if (!v16)
  {
    long long v17 = [(AXRemoteHearingAidDevice *)self rightSelectedStreamingProgram];
    [(AXRemoteHearingAidDevice *)self setRightSelectedProgram:v17];
  }
  char v18 = [(AXRemoteHearingAidDevice *)self rightSelectedStreamingProgram];

  if (!v18)
  {
    uint64_t v19 = [(AXRemoteHearingAidDevice *)self rightSelectedProgram];
    [(AXRemoteHearingAidDevice *)self setRightSelectedStreamingProgram:v19];
  }
}

void __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isSelected])
  {
    int v3 = [v5 isStreamOrMixingStream];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 setLeftSelectedStreamingProgram:v5];
    }
    else {
      [v4 setLeftSelectedProgram:v5];
    }
  }
}

void __61__AXRemoteHearingAidDevice__updateSelectedProgramsProperties__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isSelected])
  {
    int v3 = [v5 isStreamOrMixingStream];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 setRightSelectedStreamingProgram:v5];
    }
    else {
      [v4 setRightSelectedProgram:v5];
    }
  }
}

- (void)_writeAllProgramSelectionsToPeripheral
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v3 = [(AXRemoteHearingAidDevice *)self leftSelectedStreamingProgram];
  uint64_t v4 = [(AXRemoteHearingAidDevice *)self leftSelectedProgram];
  id v5 = [(AXRemoteHearingAidDevice *)self rightSelectedStreamingProgram];
  int v6 = [(AXRemoteHearingAidDevice *)self rightSelectedProgram];
  unint64_t v7 = 0x263EFF000uLL;
  unint64_t v8 = 0x263F08000uLL;
  if ([(AXRemoteHearingAidDevice *)self propertyIsAvailable:0x800000000 forEar:2]
    || [(AXRemoteHearingAidDevice *)self propertyIsAvailable:0x800000000 forEar:4])
  {
    uint64_t v9 = [(AXRemoteHearingAidDevice *)self updateDelegate];
    uint64_t v10 = (void *)MEMORY[0x263EFF8C0];
    char v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "index"));
    BOOL v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "index"));
    int v13 = objc_msgSend(v10, "arrayWithObjects:", v11, v12, 0);
    [(AXRemoteHearingAidDevice *)self deviceUUID];
    long long v14 = v4;
    long long v15 = v5;
    long long v17 = v16 = v3;
    [v9 writeValue:v13 forProperty:0x800000000 andDeviceID:v17];

    int v3 = v16;
    id v5 = v15;
    uint64_t v4 = v14;
    unint64_t v8 = 0x263F08000;

    unint64_t v7 = 0x263EFF000;
  }
  else
  {
    HAInitializeLogging();
    uint64_t v9 = [NSString stringWithFormat:@"AXHearingPropertyStreamingProgramActive not available"];
    char v18 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice _writeAllProgramSelectionsToPeripheral]", 787, v9];
    uint64_t v19 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v20 = v18;
      char v21 = v19;
      v22 = v20;
      unint64_t v7 = 0x263EFF000uLL;
      *(_DWORD *)buf = 136446210;
      uint64_t v30 = [v22 UTF8String];
      _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }

  uint64_t v23 = [(AXRemoteHearingAidDevice *)self updateDelegate];
  uint64_t v24 = *(void **)(v7 + 2240);
  v25 = objc_msgSend(*(id *)(v8 + 2584), "numberWithInt:", objc_msgSend(v4, "index"));
  v26 = objc_msgSend(*(id *)(v8 + 2584), "numberWithInt:", objc_msgSend(v6, "index"));
  v27 = objc_msgSend(v24, "arrayWithObjects:", v25, v26, 0);
  id v28 = [(AXRemoteHearingAidDevice *)self deviceUUID];
  [v23 writeValue:v27 forProperty:1024 andDeviceID:v28];
}

- (void)selectProgram:(id)a3 forEar:(int)a4
{
  id v11 = a3;
  if ([(AXRemoteHearingAidDevice *)self showCombinedPrograms])
  {
    int v6 = [(AXRemoteHearingAidDevice *)self leftPrograms];
    objc_msgSend(v6, "setProgram:withOtherSidePrograms:selected:", v11, 0, objc_msgSend(v11, "isSelected"));

    unint64_t v7 = [(AXRemoteHearingAidDevice *)self rightPrograms];
    objc_msgSend(v7, "setProgram:withOtherSidePrograms:selected:", v11, 0, objc_msgSend(v11, "isSelected"));
LABEL_7:

    goto LABEL_8;
  }
  if ((a4 & [v11 ear] & 2) != 0)
  {
    unint64_t v8 = [(AXRemoteHearingAidDevice *)self leftPrograms];
    uint64_t v9 = [(AXRemoteHearingAidDevice *)self rightPrograms];
    objc_msgSend(v8, "setProgram:withOtherSidePrograms:selected:", v11, v9, objc_msgSend(v11, "isSelected"));
  }
  if ((a4 & [v11 ear] & 4) != 0)
  {
    unint64_t v7 = [(AXRemoteHearingAidDevice *)self rightPrograms];
    uint64_t v10 = [(AXRemoteHearingAidDevice *)self leftPrograms];
    objc_msgSend(v7, "setProgram:withOtherSidePrograms:selected:", v11, v10, objc_msgSend(v11, "isSelected"));

    goto LABEL_7;
  }
LABEL_8:
  [(AXRemoteHearingAidDevice *)self _updateSelectedProgramsProperties];
  [(AXRemoteHearingAidDevice *)self _writeAllProgramSelectionsToPeripheral];
}

- (id)selectedPrograms
{
  int v3 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v4 = [(AXRemoteHearingAidDevice *)self leftSelectedProgram];
  id v5 = [(AXRemoteHearingAidDevice *)self rightSelectedProgram];
  int v6 = [(AXRemoteHearingAidDevice *)self leftSelectedStreamingProgram];
  unint64_t v7 = [(AXRemoteHearingAidDevice *)self rightSelectedStreamingProgram];
  unint64_t v8 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);

  uint64_t v9 = [v8 indexesOfObjectsPassingTest:&__block_literal_global_83];
  uint64_t v10 = [v8 objectsAtIndexes:v9];

  return v10;
}

uint64_t __44__AXRemoteHearingAidDevice_selectedPrograms__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (id)selectedProgramIndexes
{
  v2 = [(AXRemoteHearingAidDevice *)self programs];
  int v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_86];

  return v3;
}

uint64_t __50__AXRemoteHearingAidDevice_selectedProgramIndexes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (void)setKeepInSync:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_keepInSync != a3)
  {
    self->_keepInSync = a3;
    if (a3)
    {
      if ([(AXRemoteHearingAidDevice *)self didLoadRequiredProperties])
      {
        id v10 = [(AXRemoteHearingAidDevice *)self updateDelegate];
        uint64_t v4 = [(AXRemoteHearingAidDevice *)self deviceUUID];
        [v10 updateProperty:0xFF800105C4 forDeviceID:v4];
      }
      else
      {
        HAInitializeLogging();
        id v5 = [NSString stringWithFormat:@"Not completely loaded, trying again"];
        int v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice setKeepInSync:]", 848, v5];
        unint64_t v7 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          id v8 = v6;
          uint64_t v9 = v7;
          *(_DWORD *)buf = 136446210;
          uint64_t v12 = [v8 UTF8String];
          _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [(AXRemoteHearingAidDevice *)self loadRequiredProperties];
      }
    }
  }
}

- (void)setValue:(id)a3 forProperty:(unint64_t)a4
{
  uint64_t v132 = *MEMORY[0x263EF8340];
  id v6 = a3;
  HAInitializeLogging();
  unint64_t v7 = NSString;
  id v8 = hearingPropertyDescription(a4);
  uint64_t v9 = [v7 stringWithFormat:@"%p = property:%@ - value:%@", self, v8, v6];

  id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice setValue:forProperty:]", 861, v9];
  id v11 = (os_log_t *)MEMORY[0x263F47290];
  uint64_t v12 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = self;
    id v14 = v10;
    long long v15 = v12;
    long long v16 = v14;
    self = v13;
    uint64_t v17 = [v16 UTF8String];
    *(_DWORD *)buf = 136446210;
    uint64_t v131 = v17;
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if ((uint64_t)a4 <= 0x3FFFFFF)
  {
    if ((uint64_t)a4 <= 1023)
    {
      if ((uint64_t)a4 > 63)
      {
        if ((uint64_t)a4 <= 255)
        {
          if (a4 == 64)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
              goto LABEL_177;
            }
            v83 = [v6 firstObject];
            [v83 doubleValue];
            self->_leftMicrophoneVolume = v84;

            v85 = [v6 lastObject];
            [v85 doubleValue];
            self->_rightMicrophoneVolume = v86;

            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x40;
          }
          else
          {
            if (a4 != 128) {
              goto LABEL_163;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
              goto LABEL_177;
            }
            v32 = [v6 firstObject];
            [v32 doubleValue];
            self->_leftStreamVolume = v33;

            v34 = [v6 lastObject];
            [v34 doubleValue];
            self->_rightStreamVolume = v35;

            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x80;
          }
          goto LABEL_176;
        }
        if (a4 != 256)
        {
          if (a4 != 512) {
            goto LABEL_163;
          }
          v55 = [v6 objectForKey:&unk_26C1E57B0];
          [(AXRemoteHearingAidDevice *)self setValue:v55 forProperty:0x80000];

          v56 = [v6 objectForKey:&unk_26C1E57C8];
          [(AXRemoteHearingAidDevice *)self setValue:v56 forProperty:0x100000];

          unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x200;
          goto LABEL_176;
        }
        HAInitializeLogging();
        v96 = NSString;
        v97 = [(AXRemoteHearingAidDevice *)self programs];
        v98 = [v96 stringWithFormat:@"AXHearingPropertyProgramsAvailable %@", v97];

        v99 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice setValue:forProperty:]", 916, v98];
        os_log_t v100 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          id v101 = v99;
          v102 = v100;
          uint64_t v103 = [v101 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v131 = v103;
          _os_log_impl(&dword_20CC86000, v102, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
          goto LABEL_177;
        }
        uint64_t v31 = [v6 firstObject];
        v104 = [v6 lastObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v105 = [MEMORY[0x263EFF980] array];
          v128[0] = MEMORY[0x263EF8330];
          v128[1] = 3221225472;
          v128[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke;
          v128[3] = &unk_2640FEAB0;
          id v129 = v105;
          id v106 = v105;
          [v31 enumerateObjectsUsingBlock:v128];
          [(AXRemoteHearingAidDevice *)self setLeftPrograms:v106];
          v127[0] = MEMORY[0x263EF8330];
          v127[1] = 3221225472;
          v127[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_2;
          v127[3] = &unk_2640FD3F0;
          v127[4] = self;
          [v106 enumerateObjectsUsingBlock:v127];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v107 = [MEMORY[0x263EFF980] array];
          v125[0] = MEMORY[0x263EF8330];
          v125[1] = 3221225472;
          v125[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_3;
          v125[3] = &unk_2640FEAB0;
          id v126 = v107;
          id v108 = v107;
          [v104 enumerateObjectsUsingBlock:v125];
          [(AXRemoteHearingAidDevice *)self setRightPrograms:v108];
          v124[0] = MEMORY[0x263EF8330];
          v124[1] = 3221225472;
          v124[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_4;
          v124[3] = &unk_2640FD3F0;
          v124[4] = self;
          [v108 enumerateObjectsUsingBlock:v124];
        }
        [(AXRemoteHearingAidDevice *)self _updateSelectedProgramsProperties];
        [(AXRemoteHearingAidDevice *)self setLoadedProperties:[(AXRemoteHearingAidDevice *)self loadedProperties] | 0x100];
      }
      else
      {
        if ((uint64_t)a4 <= 15)
        {
          if (a4 != 4)
          {
            if (a4 == 8)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                int v27 = [(AXRemoteHearingAidDevice *)self availableEars];
                if (v27 != [v6 intValue] && (int)objc_msgSend(v6, "intValue") >= 1) {
                  -[AXRemoteHearingAidDevice setAvailableEars:](self, "setAvailableEars:", [v6 intValue]);
                }
              }
              unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 8;
              goto LABEL_176;
            }
            goto LABEL_163;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
            goto LABEL_177;
          }
          v68 = [v6 firstObject];
          [v68 doubleValue];
          -[AXRemoteHearingAidDevice setLeftBatteryLevel:](self, "setLeftBatteryLevel:");

          v69 = [v6 lastObject];
          [v69 doubleValue];
          -[AXRemoteHearingAidDevice setRightBatteryLevel:](self, "setRightBatteryLevel:");

          unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 4;
          goto LABEL_176;
        }
        if (a4 != 16 && a4 != 32) {
          goto LABEL_163;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
          goto LABEL_177;
        }
        v40 = [v6 firstObject];
        [(AXRemoteHearingAidDevice *)self setLeftUUID:v40];

        v41 = [v6 lastObject];
        [(AXRemoteHearingAidDevice *)self setRightUUID:v41];

        [(AXRemoteHearingAidDevice *)self setLoadedProperties:[(AXRemoteHearingAidDevice *)self loadedProperties] | a4];
        v42 = [(AXRemoteHearingAidDevice *)self leftUUID];
        uint64_t v43 = [v42 length];

        v44 = [(AXRemoteHearingAidDevice *)self rightUUID];
        uint64_t v31 = v44;
        if (v43)
        {
          uint64_t v45 = [v44 length];

          if (v45)
          {
            v46 = NSString;
            v47 = [(AXRemoteHearingAidDevice *)self leftUUID];
            v48 = [(AXRemoteHearingAidDevice *)self rightUUID];
            uint64_t v31 = [v46 stringWithFormat:@"%@_%@", v47, v48];
          }
          else
          {
            uint64_t v31 = [(AXRemoteHearingAidDevice *)self leftUUID];
          }
        }
        [(AXRemoteHearingAidDevice *)self setDeviceUUID:v31];
      }
      goto LABEL_180;
    }
    if ((uint64_t)a4 >= 0x100000)
    {
      if ((uint64_t)a4 >= 0x400000)
      {
        switch(a4)
        {
          case 0x400000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
              goto LABEL_177;
            }
            v61 = [v6 firstObject];
            [(AXRemoteHearingAidDevice *)self setLeftFirmwareVersion:v61];

            v62 = [v6 lastObject];
            [(AXRemoteHearingAidDevice *)self setRightFirmwareVersion:v62];

            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x400000;
            break;
          case 0x800000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
              goto LABEL_177;
            }
            v63 = [v6 firstObject];
            [(AXRemoteHearingAidDevice *)self setLeftHardwareVersion:v63];

            v64 = [v6 lastObject];
            [(AXRemoteHearingAidDevice *)self setRightHardwareVersion:v64];

            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x800000;
            break;
          case 0x1000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_177;
            }
            [(AXRemoteHearingAidDevice *)self setDeviceUUID:v6];
            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x1000000;
            break;
          default:
            goto LABEL_163;
        }
LABEL_176:
        [(AXRemoteHearingAidDevice *)self setLoadedProperties:v24];
        goto LABEL_177;
      }
      if (a4 != 0x100000)
      {
        if (a4 != 0x200000) {
          goto LABEL_163;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
          goto LABEL_177;
        }
        v38 = [v6 firstObject];
        -[AXRemoteHearingAidDevice setLeftConnected:](self, "setLeftConnected:", [v38 intValue] == 2);

        dispatch_time_t v39 = [v6 lastObject];
        -[AXRemoteHearingAidDevice setRightConnected:](self, "setRightConnected:", [v39 intValue] == 2);

        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x200000;
        goto LABEL_176;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
      {
        v91 = [(AXRemoteHearingAidDevice *)self model];
        [v91 setArray:v6];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_175:
          unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x100000;
          goto LABEL_176;
        }
        v91 = [(AXRemoteHearingAidDevice *)self model];
        [v91 replaceObjectAtIndex:0 withObject:v6];
      }

      goto LABEL_175;
    }
    if ((uint64_t)a4 < 0x40000)
    {
      if (a4 == 1024)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
        {
          v76 = [v6 firstObject];
          int v77 = [v76 intValue];

          if (v77 != -1)
          {
            v78 = [(AXRemoteHearingAidDevice *)self leftPrograms];
            v122[0] = MEMORY[0x263EF8330];
            v122[1] = 3221225472;
            v122[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_5;
            v122[3] = &unk_2640FD438;
            int v123 = v77;
            v122[4] = self;
            [v78 enumerateObjectsUsingBlock:v122];
          }
          v79 = [v6 lastObject];
          int v80 = [v79 intValue];

          if (v80 != -1)
          {
            v81 = [(AXRemoteHearingAidDevice *)self rightPrograms];
            v120[0] = MEMORY[0x263EF8330];
            v120[1] = 3221225472;
            v120[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_6;
            v120[3] = &unk_2640FD438;
            int v121 = v80;
            v120[4] = self;
            [v81 enumerateObjectsUsingBlock:v120];
          }
          unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x400;
          goto LABEL_176;
        }
        goto LABEL_177;
      }
      if (a4 == 0x10000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
          goto LABEL_177;
        }
        id v28 = [v6 firstObject];
        -[AXRemoteHearingAidDevice setLeftAvailableProperties:](self, "setLeftAvailableProperties:", [v28 unsignedLongLongValue]);

        v29 = [v6 lastObject];
        -[AXRemoteHearingAidDevice setRightAvailableProperties:](self, "setRightAvailableProperties:", [v29 unsignedLongLongValue]);

        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x10000;
        goto LABEL_176;
      }
      goto LABEL_163;
    }
    if (a4 == 0x40000)
    {
      [(AXRemoteHearingAidDevice *)self setName:v6];
      unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x40000;
      goto LABEL_176;
    }
    if (a4 != 0x80000) {
      goto LABEL_163;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
    {
      v52 = [(AXRemoteHearingAidDevice *)self manufacturer];
      [v52 setArray:v6];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_171:
        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x80000;
        goto LABEL_176;
      }
      v52 = [(AXRemoteHearingAidDevice *)self manufacturer];
      [v52 replaceObjectAtIndex:0 withObject:v6];
    }

    goto LABEL_171;
  }
  if ((uint64_t)a4 > 0xFFFFFFFFFLL)
  {
    if ((uint64_t)a4 > 0xFFFFFFFFFFLL)
    {
      if ((uint64_t)a4 > 0x3FFFFFFFFFFLL)
      {
        switch(a4)
        {
          case 0x40000000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_177;
            }
            -[AXRemoteHearingAidDevice setEarsSupportingWatch:](self, "setEarsSupportingWatch:", [v6 intValue]);
            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x40000000000;
            break;
          case 0x80000000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 4) {
              goto LABEL_177;
            }
            v65 = [v6 objectAtIndex:1];
            -[AXRemoteHearingAidDevice setRequiresCombinedPresets:](self, "setRequiresCombinedPresets:", [v65 BOOLValue]);

            v66 = [v6 objectAtIndex:2];
            -[AXRemoteHearingAidDevice setRequiresCombinedVolumes:](self, "setRequiresCombinedVolumes:", [v66 BOOLValue]);

            v67 = [v6 objectAtIndex:3];
            -[AXRemoteHearingAidDevice setRequiresBinauralStreaming:](self, "setRequiresBinauralStreaming:", [v67 BOOLValue]);

            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x80000000000;
            break;
          case 0x100000000000uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
              goto LABEL_177;
            }
            v25 = [v6 firstObject];
            [(AXRemoteHearingAidDevice *)self setLeftPeripheralUUID:v25];

            v26 = [v6 lastObject];
            [(AXRemoteHearingAidDevice *)self setRightPeripheralUUID:v26];

            unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x100000000000;
            break;
          default:
            goto LABEL_163;
        }
        goto LABEL_176;
      }
      if (a4 == 0x10000000000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_177;
        }
        -[AXRemoteHearingAidDevice setAvailableInputEars:](self, "setAvailableInputEars:", [v6 intValue]);
        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x10000000000;
        goto LABEL_176;
      }
      if (a4 == 0x20000000000)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          -[AXRemoteHearingAidDevice setDeviceType:](self, "setDeviceType:", [v6 unsignedIntegerValue]);
        }
        goto LABEL_177;
      }
LABEL_163:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v115[0] = MEMORY[0x263EF8330];
        v115[1] = 3221225472;
        v115[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_102;
        v115[3] = &unk_2640FCDB0;
        v115[4] = self;
        [v6 enumerateKeysAndObjectsUsingBlock:v115];
      }
      HAInitializeLogging();
      v109 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown property: %lld", a4);
      v110 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice setValue:forProperty:]", 1334, v109];
      os_log_t v111 = *v11;
      if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
      {
        id v112 = v110;
        v113 = v111;
        uint64_t v114 = [v112 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v131 = v114;
        _os_log_impl(&dword_20CC86000, v113, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      goto LABEL_177;
    }
    if ((uint64_t)a4 > 0x3FFFFFFFFFLL)
    {
      if (a4 == 0x4000000000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
          goto LABEL_177;
        }
        v92 = [v6 firstObject];
        [v92 doubleValue];
        self->_leftMixedVolume = v93;

        v94 = [v6 lastObject];
        [v94 doubleValue];
        self->_rightMixedVolume = v95;

        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x4000000000;
      }
      else
      {
        if (a4 != 0x8000000000) {
          goto LABEL_163;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
          goto LABEL_177;
        }
        v53 = [v6 firstObject];
        -[AXRemoteHearingAidDevice setLeftMixedVolumeSteps:](self, "setLeftMixedVolumeSteps:", [v53 shortValue]);

        v54 = [v6 lastObject];
        -[AXRemoteHearingAidDevice setRightMixedVolumeSteps:](self, "setRightMixedVolumeSteps:", [v54 shortValue]);

        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x8000000000;
      }
      goto LABEL_176;
    }
    if (a4 == 0x1000000000)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
        goto LABEL_177;
      }
      v82 = [v6 firstObject];
      -[AXRemoteHearingAidDevice setLeftBass:](self, "setLeftBass:", [v82 charValue]);

      uint64_t v31 = [v6 lastObject];
      -[AXRemoteHearingAidDevice setRightBass:](self, "setRightBass:", [v31 charValue]);
    }
    else
    {
      if (a4 != 0x2000000000) {
        goto LABEL_163;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
        goto LABEL_177;
      }
      uint64_t v30 = [v6 firstObject];
      -[AXRemoteHearingAidDevice setLeftTreble:](self, "setLeftTreble:", [v30 charValue]);

      uint64_t v31 = [v6 lastObject];
      -[AXRemoteHearingAidDevice setRightTreble:](self, "setRightTreble:", [v31 charValue]);
    }
LABEL_180:

    goto LABEL_177;
  }
  if ((uint64_t)a4 <= 0x7FFFFFFF)
  {
    if ((uint64_t)a4 > 0x1FFFFFFF)
    {
      if (a4 == 0x20000000)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_177;
        }
        -[AXRemoteHearingAidDevice setIsBluetoothPaired:](self, "setIsBluetoothPaired:", [v6 BOOLValue]);
        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x20000000;
      }
      else
      {
        if (a4 != 0x40000000) {
          goto LABEL_163;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 4) {
          goto LABEL_177;
        }
        v49 = [v6 objectAtIndex:1];
        -[AXRemoteHearingAidDevice setSupportsCombinedPresets:](self, "setSupportsCombinedPresets:", [v49 BOOLValue]);

        v50 = [v6 objectAtIndex:2];
        -[AXRemoteHearingAidDevice setSupportsCombinedVolumes:](self, "setSupportsCombinedVolumes:", [v50 BOOLValue]);

        v51 = [v6 objectAtIndex:3];
        -[AXRemoteHearingAidDevice setSupportsBinauralStreaming:](self, "setSupportsBinauralStreaming:", [v51 BOOLValue]);

        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x40000000;
      }
    }
    else
    {
      if (a4 == 0x4000000)
      {
        HAInitializeLogging();
        v70 = [NSString stringWithFormat:@"RemoteDevice Paired %@", v6];
        v71 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice setValue:forProperty:]", 1173, v70];
        os_log_t v72 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
        {
          id v73 = v71;
          v74 = v72;
          uint64_t v75 = [v73 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v131 = v75;
          _os_log_impl(&dword_20CC86000, v74, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        -[AXRemoteHearingAidDevice setIsPaired:](self, "setIsPaired:", [v6 BOOLValue]);
        unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x4000000;
        goto LABEL_176;
      }
      if (a4 != 0x10000000) {
        goto LABEL_163;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_177;
      }
      unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x10000000;
    }
    goto LABEL_176;
  }
  if ((uint64_t)a4 <= 0x1FFFFFFFFLL)
  {
    if (a4 == 0x80000000)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
        goto LABEL_177;
      }
      v87 = [v6 firstObject];
      [v87 doubleValue];
      self->_leftSensitivity = v88;

      v89 = [v6 lastObject];
      [v89 doubleValue];
      self->_rightSensitivity = v90;

      unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x80000000;
    }
    else
    {
      if (a4 != 0x100000000) {
        goto LABEL_163;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
        goto LABEL_177;
      }
      v36 = [v6 firstObject];
      -[AXRemoteHearingAidDevice setLeftMicrophoneVolumeSteps:](self, "setLeftMicrophoneVolumeSteps:", [v36 shortValue]);

      v37 = [v6 lastObject];
      -[AXRemoteHearingAidDevice setRightMicrophoneVolumeSteps:](self, "setRightMicrophoneVolumeSteps:", [v37 shortValue]);

      unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x100000000;
    }
    goto LABEL_176;
  }
  if (a4 == 0x200000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
      goto LABEL_177;
    }
    v57 = [v6 firstObject];
    -[AXRemoteHearingAidDevice setLeftStreamVolumeSteps:](self, "setLeftStreamVolumeSteps:", [v57 shortValue]);

    v58 = [v6 lastObject];
    -[AXRemoteHearingAidDevice setRightStreamVolumeSteps:](self, "setRightStreamVolumeSteps:", [v58 shortValue]);

    unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x200000000;
    goto LABEL_176;
  }
  if (a4 == 0x400000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
      goto LABEL_177;
    }
    v59 = [v6 firstObject];
    -[AXRemoteHearingAidDevice setLeftSensitivitySteps:](self, "setLeftSensitivitySteps:", [v59 shortValue]);

    v60 = [v6 lastObject];
    -[AXRemoteHearingAidDevice setRightSensitivitySteps:](self, "setRightSensitivitySteps:", [v60 shortValue]);

    unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x400000000;
    goto LABEL_176;
  }
  if (a4 != 0x800000000) {
    goto LABEL_163;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
  {
    char v18 = [v6 firstObject];
    int v19 = [v18 intValue];

    id v20 = [v6 lastObject];
    int v21 = [v20 intValue];

    if (v19 != -1)
    {
      v22 = [(AXRemoteHearingAidDevice *)self leftPrograms];
      v118[0] = MEMORY[0x263EF8330];
      v118[1] = 3221225472;
      v118[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_7;
      v118[3] = &unk_2640FD438;
      int v119 = v19;
      v118[4] = self;
      [v22 enumerateObjectsUsingBlock:v118];
    }
    if (v21 != -1)
    {
      uint64_t v23 = [(AXRemoteHearingAidDevice *)self rightPrograms];
      v116[0] = MEMORY[0x263EF8330];
      v116[1] = 3221225472;
      v116[2] = __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_8;
      v116[3] = &unk_2640FD438;
      int v117 = v21;
      v116[4] = self;
      [v23 enumerateObjectsUsingBlock:v116];
    }
    unint64_t v24 = [(AXRemoteHearingAidDevice *)self loadedProperties] | 0x800000000;
    goto LABEL_176;
  }
LABEL_177:
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[AXHearingAidMode alloc] initWithRepresentation:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isSelected])
  {
    id v3 = [*(id *)(a1 + 32) leftPrograms];
    uint64_t v4 = [*(id *)(a1 + 32) rightPrograms];
    objc_msgSend(v3, "setProgram:withOtherSidePrograms:selected:", v5, v4, objc_msgSend(v5, "isSelected"));
  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [[AXHearingAidMode alloc] initWithRepresentation:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    uint64_t v4 = v5;
  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 isSelected])
  {
    id v3 = [*(id *)(a1 + 32) rightPrograms];
    uint64_t v4 = [*(id *)(a1 + 32) leftPrograms];
    objc_msgSend(v3, "setProgram:withOtherSidePrograms:selected:", v5, v4, objc_msgSend(v5, "isSelected"));
  }
}

uint64_t __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  uint64_t v7 = [v12 index];
  id v8 = v12;
  if (v6 == v7)
  {
    [*(id *)(a1 + 32) setLeftSelectedProgram:v12];
    if (([v12 isSelected] & 1) == 0)
    {
      uint64_t v9 = [*(id *)(a1 + 32) leftPrograms];
      id v10 = [*(id *)(a1 + 32) rightPrograms];
      [v9 setProgram:v12 withOtherSidePrograms:v10 selected:1];
    }
    uint64_t v7 = [v12 isStreamOrMixingStream];
    if (v7) {
      uint64_t v7 = [*(id *)(a1 + 32) setLeftSelectedStreamingProgram:v12];
    }
    *a4 = 1;
    id v8 = v12;
  }

  return MEMORY[0x270F9A758](v7, v8);
}

uint64_t __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  int v6 = *(_DWORD *)(a1 + 40);
  uint64_t v7 = [v12 index];
  id v8 = v12;
  if (v6 == v7)
  {
    [*(id *)(a1 + 32) setRightSelectedProgram:v12];
    if (([v12 isSelected] & 1) == 0)
    {
      uint64_t v9 = [*(id *)(a1 + 32) rightPrograms];
      id v10 = [*(id *)(a1 + 32) leftPrograms];
      [v9 setProgram:v12 withOtherSidePrograms:v10 selected:1];
    }
    uint64_t v7 = [v12 isStreamOrMixingStream];
    if (v7) {
      uint64_t v7 = [*(id *)(a1 + 32) setRightSelectedStreamingProgram:v12];
    }
    *a4 = 1;
    id v8 = v12;
  }

  return MEMORY[0x270F9A758](v7, v8);
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = *(_DWORD *)(a1 + 40);
  id v11 = v6;
  if (v7 == [v6 index])
  {
    id v8 = [*(id *)(a1 + 32) leftSelectedStreamingProgram];
    [v8 setIsSelected:0];

    [*(id *)(a1 + 32) setLeftSelectedStreamingProgram:v11];
    uint64_t v9 = [*(id *)(a1 + 32) leftPrograms];
    id v10 = [*(id *)(a1 + 32) rightPrograms];
    [v9 setProgram:v11 withOtherSidePrograms:v10 selected:1];

    *a4 = 1;
  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  int v7 = *(_DWORD *)(a1 + 40);
  id v11 = v6;
  if (v7 == [v6 index])
  {
    id v8 = [*(id *)(a1 + 32) rightSelectedStreamingProgram];
    [v8 setIsSelected:0];

    [*(id *)(a1 + 32) setRightSelectedStreamingProgram:v11];
    uint64_t v9 = [*(id *)(a1 + 32) rightPrograms];
    id v10 = [*(id *)(a1 + 32) leftPrograms];
    [v9 setProgram:v11 withOtherSidePrograms:v10 selected:1];

    *a4 = 1;
  }
}

void __49__AXRemoteHearingAidDevice_setValue_forProperty___block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  objc_msgSend(v4, "setValue:forProperty:", v5, objc_msgSend(a2, "unsignedLongLongValue"));
}

- (id)_valueForProperty:(unint64_t)a3
{
  v80[2] = *MEMORY[0x263EF8340];
  if ((uint64_t)a3 > 0x3FFFFFF)
  {
    if ((uint64_t)a3 <= 0xFFFFFFFFFLL)
    {
      if ((uint64_t)a3 > 0x7FFFFFFF)
      {
        if ((uint64_t)a3 <= 0x1FFFFFFFFLL)
        {
          if (a3 == 0x80000000)
          {
            unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
            v56 = NSNumber;
            [(AXRemoteHearingAidDevice *)self leftSensitivity];
            v26 = objc_msgSend(v56, "numberWithDouble:");
            int v27 = NSNumber;
            [(AXRemoteHearingAidDevice *)self rightSensitivity];
            goto LABEL_112;
          }
          if (a3 != 0x100000000) {
            goto LABEL_114;
          }
          unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
          v26 = objc_msgSend(NSNumber, "numberWithShort:", -[AXRemoteHearingAidDevice leftMicrophoneVolumeSteps](self, "leftMicrophoneVolumeSteps"));
          id v28 = NSNumber;
          uint64_t v29 = [(AXRemoteHearingAidDevice *)self rightMicrophoneVolumeSteps];
        }
        else
        {
          switch(a3)
          {
            case 0x200000000uLL:
              unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
              v26 = objc_msgSend(NSNumber, "numberWithShort:", -[AXRemoteHearingAidDevice leftStreamVolumeSteps](self, "leftStreamVolumeSteps"));
              id v28 = NSNumber;
              uint64_t v29 = [(AXRemoteHearingAidDevice *)self rightStreamVolumeSteps];
              break;
            case 0x400000000uLL:
              unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
              v26 = objc_msgSend(NSNumber, "numberWithShort:", -[AXRemoteHearingAidDevice leftSensitivitySteps](self, "leftSensitivitySteps"));
              id v28 = NSNumber;
              uint64_t v29 = [(AXRemoteHearingAidDevice *)self rightSensitivitySteps];
              break;
            case 0x800000000uLL:
              id v5 = (void *)MEMORY[0x263EFF8C0];
              id v11 = NSNumber;
              id v7 = [(AXRemoteHearingAidDevice *)self leftSelectedStreamingProgram];
              id v8 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v7, "index"));
              uint64_t v9 = NSNumber;
              id v10 = [(AXRemoteHearingAidDevice *)self rightSelectedStreamingProgram];
              goto LABEL_16;
            default:
              goto LABEL_114;
          }
        }
        goto LABEL_87;
      }
      if ((uint64_t)a3 <= 0x1FFFFFFF)
      {
        if (a3 != 0x4000000)
        {
          if (a3 == 0x10000000)
          {
            id v14 = (void *)MEMORY[0x263EFFA88];
            goto LABEL_134;
          }
          goto LABEL_114;
        }
        v53 = NSNumber;
        BOOL v54 = [(AXRemoteHearingAidDevice *)self isPaired];
        goto LABEL_108;
      }
      if (a3 == 0x20000000)
      {
        v53 = NSNumber;
        BOOL v54 = [(AXRemoteHearingAidDevice *)self isBluetoothPaired];
LABEL_108:
        uint64_t v15 = [v53 numberWithBool:v54];
        goto LABEL_110;
      }
      if (a3 != 0x40000000) {
        goto LABEL_114;
      }
      v78[0] = &unk_26C1E57F8;
      objc_msgSend(NSNumber, "numberWithBool:", -[AXRemoteHearingAidDevice supportsCombinedPresets](self, "supportsCombinedPresets"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      v78[1] = v7;
      int v21 = objc_msgSend(NSNumber, "numberWithBool:", -[AXRemoteHearingAidDevice supportsCombinedVolumes](self, "supportsCombinedVolumes"));
      v78[2] = v21;
      v37 = objc_msgSend(NSNumber, "numberWithBool:", -[AXRemoteHearingAidDevice supportsBinauralStreaming](self, "supportsBinauralStreaming"));
      v78[3] = v37;
      v38 = (void *)MEMORY[0x263EFF8C0];
      dispatch_time_t v39 = v78;
LABEL_94:
      id v14 = [v38 arrayWithObjects:v39 count:4];

LABEL_100:
      goto LABEL_133;
    }
    if ((uint64_t)a3 <= 0xFFFFFFFFFFLL)
    {
      if ((uint64_t)a3 <= 0x3FFFFFFFFFLL)
      {
        if (a3 == 0x1000000000)
        {
          id v7 = [NSNumber numberWithChar:self->_leftBass];
          v76[0] = v7;
          int v21 = [NSNumber numberWithChar:self->_rightBass];
          v76[1] = v21;
          v22 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v23 = v76;
        }
        else
        {
          if (a3 != 0x2000000000) {
            goto LABEL_114;
          }
          id v7 = [NSNumber numberWithChar:self->_leftTreble];
          v77[0] = v7;
          int v21 = [NSNumber numberWithChar:self->_rightTreble];
          v77[1] = v21;
          v22 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v23 = v77;
        }
        goto LABEL_98;
      }
      if (a3 == 0x4000000000)
      {
        unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
        v57 = NSNumber;
        [(AXRemoteHearingAidDevice *)self leftMixedVolume];
        v26 = objc_msgSend(v57, "numberWithDouble:");
        int v27 = NSNumber;
        [(AXRemoteHearingAidDevice *)self rightMixedVolume];
        goto LABEL_112;
      }
      if (a3 != 0x8000000000) {
        goto LABEL_114;
      }
      unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
      v26 = objc_msgSend(NSNumber, "numberWithShort:", -[AXRemoteHearingAidDevice leftMixedVolumeSteps](self, "leftMixedVolumeSteps"));
      id v28 = NSNumber;
      uint64_t v29 = [(AXRemoteHearingAidDevice *)self rightMixedVolumeSteps];
LABEL_87:
      uint64_t v34 = [v28 numberWithShort:v29];
      goto LABEL_113;
    }
    if ((uint64_t)a3 <= 0x3FFFFFFFFFFLL)
    {
      if (a3 != 0x10000000000)
      {
        if (a3 != 0x20000000000) {
          goto LABEL_114;
        }
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXRemoteHearingAidDevice deviceType](self, "deviceType"));
        goto LABEL_110;
      }
      v50 = NSNumber;
      uint64_t v51 = [(AXRemoteHearingAidDevice *)self availableInputEars];
    }
    else
    {
      if (a3 != 0x40000000000)
      {
        if (a3 != 0x80000000000)
        {
          if (a3 != 0x100000000000) {
            goto LABEL_114;
          }
          id v7 = [MEMORY[0x263EFF980] array];
          long long v16 = [(AXRemoteHearingAidDevice *)self leftPeripheralUUID];
          if (v16)
          {
            uint64_t v17 = [(AXRemoteHearingAidDevice *)self leftPeripheralUUID];
            [v7 addObject:v17];
          }
          else
          {
            [v7 addObject:&stru_26C1D5720];
          }

          v64 = [(AXRemoteHearingAidDevice *)self rightPeripheralUUID];
          if (v64)
          {
            uint64_t v65 = [(AXRemoteHearingAidDevice *)self rightPeripheralUUID];
            goto LABEL_130;
          }
LABEL_131:
          [v7 addObject:&stru_26C1D5720];
          goto LABEL_132;
        }
        v74[0] = &unk_26C1E57F8;
        objc_msgSend(NSNumber, "numberWithBool:", -[AXRemoteHearingAidDevice requiresCombinedPresets](self, "requiresCombinedPresets"));
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v74[1] = v7;
        int v21 = objc_msgSend(NSNumber, "numberWithBool:", -[AXRemoteHearingAidDevice requiresCombinedVolumes](self, "requiresCombinedVolumes"));
        v74[2] = v21;
        v37 = objc_msgSend(NSNumber, "numberWithBool:", -[AXRemoteHearingAidDevice requiresBinauralStreaming](self, "requiresBinauralStreaming"));
        v74[3] = v37;
        v38 = (void *)MEMORY[0x263EFF8C0];
        dispatch_time_t v39 = v74;
        goto LABEL_94;
      }
      v50 = NSNumber;
      uint64_t v51 = [(AXRemoteHearingAidDevice *)self earsSupportingWatch];
    }
    uint64_t v19 = v51;
    id v20 = v50;
LABEL_106:
    uint64_t v15 = [v20 numberWithUnsignedInt:v19];
    goto LABEL_110;
  }
  if ((uint64_t)a3 > 4095)
  {
    if ((uint64_t)a3 >= 0x100000)
    {
      if ((uint64_t)a3 >= 0x400000)
      {
        if (a3 == 0x400000)
        {
          id v7 = [MEMORY[0x263EFF980] array];
          v46 = [(AXRemoteHearingAidDevice *)self leftFirmwareVersion];
          if (v46)
          {
            v47 = [(AXRemoteHearingAidDevice *)self leftFirmwareVersion];
            [v7 addObject:v47];
          }
          else
          {
            [v7 addObject:&stru_26C1D5720];
          }

          v64 = [(AXRemoteHearingAidDevice *)self rightFirmwareVersion];
          if (v64)
          {
            uint64_t v65 = [(AXRemoteHearingAidDevice *)self rightFirmwareVersion];
            goto LABEL_130;
          }
          goto LABEL_131;
        }
        if (a3 == 0x800000)
        {
          id v7 = [MEMORY[0x263EFF980] array];
          v48 = [(AXRemoteHearingAidDevice *)self leftHardwareVersion];
          if (v48)
          {
            v49 = [(AXRemoteHearingAidDevice *)self leftHardwareVersion];
            [v7 addObject:v49];
          }
          else
          {
            [v7 addObject:&stru_26C1D5720];
          }

          v64 = [(AXRemoteHearingAidDevice *)self rightHardwareVersion];
          if (v64)
          {
            uint64_t v65 = [(AXRemoteHearingAidDevice *)self rightHardwareVersion];
            goto LABEL_130;
          }
          goto LABEL_131;
        }
        if (a3 != 0x1000000) {
          goto LABEL_114;
        }
        uint64_t v15 = [(AXRemoteHearingAidDevice *)self deviceUUID];
LABEL_110:
        id v14 = (void *)v15;
        goto LABEL_134;
      }
      if (a3 == 0x100000)
      {
        uint64_t v15 = [(AXRemoteHearingAidDevice *)self model];
        goto LABEL_110;
      }
      if (a3 != 0x200000) {
        goto LABEL_114;
      }
      unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v30 = NSNumber;
      if ([(AXRemoteHearingAidDevice *)self leftConnected]) {
        uint64_t v31 = 2;
      }
      else {
        uint64_t v31 = 0;
      }
      v26 = [v30 numberWithInt:v31];
      v32 = NSNumber;
      if ([(AXRemoteHearingAidDevice *)self rightConnected]) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 0;
      }
      uint64_t v34 = [v32 numberWithInt:v33];
LABEL_113:
      v58 = (void *)v34;
      id v14 = objc_msgSend(v24, "arrayWithObjects:", v26, v34, 0);

      goto LABEL_134;
    }
    if ((uint64_t)a3 >= 0x40000)
    {
      if (a3 == 0x40000)
      {
        uint64_t v15 = [(AXRemoteHearingAidDevice *)self name];
      }
      else
      {
        if (a3 != 0x80000) {
          goto LABEL_114;
        }
        uint64_t v15 = [(AXRemoteHearingAidDevice *)self manufacturer];
      }
      goto LABEL_110;
    }
    if (a3 == 4096)
    {
LABEL_117:
      id v14 = 0;
      goto LABEL_134;
    }
    if (a3 != 0x10000)
    {
LABEL_114:
      HAInitializeLogging();
      v59 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown property: %ld", a3);
      v60 = [NSString stringWithFormat:@"%s:%d %@", "-[AXRemoteHearingAidDevice _valueForProperty:]", 1566, v59];
      v61 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v62 = v60;
        v63 = v61;
        *(_DWORD *)buf = 136446210;
        uint64_t v73 = [v62 UTF8String];
        _os_log_impl(&dword_20CC86000, v63, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      goto LABEL_117;
    }
    id v7 = [NSNumber numberWithUnsignedLongLong:self->_leftAvailableProperties];
    v75[0] = v7;
    int v21 = [NSNumber numberWithUnsignedLongLong:self->_rightAvailableProperties];
    v75[1] = v21;
    v22 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v23 = v75;
LABEL_98:
    uint64_t v45 = [v22 arrayWithObjects:v23 count:2];
    goto LABEL_99;
  }
  if ((uint64_t)a3 <= 63)
  {
    if ((uint64_t)a3 <= 15)
    {
      if (a3 != 4)
      {
        if (a3 != 8) {
          goto LABEL_114;
        }
        if ([(AXRemoteHearingAidDevice *)self leftAvailable]) {
          unsigned int v18 = 2;
        }
        else {
          unsigned int v18 = 0;
        }
        if ([(AXRemoteHearingAidDevice *)self rightAvailable]) {
          uint64_t v19 = v18 | 4;
        }
        else {
          uint64_t v19 = v18;
        }
        id v20 = NSNumber;
        goto LABEL_106;
      }
      unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
      v52 = NSNumber;
      [(AXRemoteHearingAidDevice *)self leftBatteryLevel];
      v26 = objc_msgSend(v52, "numberWithDouble:");
      int v27 = NSNumber;
      [(AXRemoteHearingAidDevice *)self rightBatteryLevel];
LABEL_112:
      uint64_t v34 = objc_msgSend(v27, "numberWithDouble:");
      goto LABEL_113;
    }
    if (a3 != 16 && a3 != 32) {
      goto LABEL_114;
    }
    id v7 = [MEMORY[0x263EFF980] array];
    double v35 = [(AXRemoteHearingAidDevice *)self leftUUID];
    if (v35)
    {
      v36 = [(AXRemoteHearingAidDevice *)self leftUUID];
      [v7 addObject:v36];
    }
    else
    {
      [v7 addObject:&stru_26C1D5720];
    }

    v64 = [(AXRemoteHearingAidDevice *)self rightUUID];
    if (v64)
    {
      uint64_t v65 = [(AXRemoteHearingAidDevice *)self rightUUID];
LABEL_130:
      v66 = (void *)v65;
      [v7 addObject:v65];

LABEL_132:
      id v14 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
      goto LABEL_133;
    }
    goto LABEL_131;
  }
  if ((uint64_t)a3 <= 255)
  {
    if (a3 == 64)
    {
      unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
      v55 = NSNumber;
      [(AXRemoteHearingAidDevice *)self leftMicrophoneVolume];
      v26 = objc_msgSend(v55, "numberWithDouble:");
      int v27 = NSNumber;
      [(AXRemoteHearingAidDevice *)self rightMicrophoneVolume];
    }
    else
    {
      if (a3 != 128) {
        goto LABEL_114;
      }
      unint64_t v24 = (void *)MEMORY[0x263EFF8C0];
      v25 = NSNumber;
      [(AXRemoteHearingAidDevice *)self leftStreamVolume];
      v26 = objc_msgSend(v25, "numberWithDouble:");
      int v27 = NSNumber;
      [(AXRemoteHearingAidDevice *)self rightStreamVolume];
    }
    goto LABEL_112;
  }
  if (a3 == 256)
  {
    v40 = [MEMORY[0x263EFF980] array];
    v41 = [(AXRemoteHearingAidDevice *)self leftPrograms];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke;
    v70[3] = &unk_2640FD3F0;
    id v71 = v40;
    id v7 = v40;
    [v41 enumerateObjectsUsingBlock:v70];

    v42 = [MEMORY[0x263EFF980] array];
    uint64_t v43 = [(AXRemoteHearingAidDevice *)self rightPrograms];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke_2;
    v68[3] = &unk_2640FD3F0;
    id v69 = v42;
    id v44 = v42;
    [v43 enumerateObjectsUsingBlock:v68];

    id v14 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v44, 0);

    goto LABEL_133;
  }
  if (a3 == 512)
  {
    v79[0] = &unk_26C1E57B0;
    id v7 = [(AXRemoteHearingAidDevice *)self manufacturer];
    v79[1] = &unk_26C1E57C8;
    v80[0] = v7;
    int v21 = [(AXRemoteHearingAidDevice *)self model];
    v80[1] = v21;
    uint64_t v45 = [NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];
LABEL_99:
    id v14 = (void *)v45;
    goto LABEL_100;
  }
  if (a3 != 1024) {
    goto LABEL_114;
  }
  id v5 = (void *)MEMORY[0x263EFF8C0];
  id v6 = NSNumber;
  id v7 = [(AXRemoteHearingAidDevice *)self leftSelectedProgram];
  id v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "index"));
  uint64_t v9 = NSNumber;
  id v10 = [(AXRemoteHearingAidDevice *)self rightSelectedProgram];
LABEL_16:
  id v12 = v10;
  uint64_t v13 = objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "index"));
  id v14 = objc_msgSend(v5, "arrayWithObjects:", v8, v13, 0);

LABEL_133:
LABEL_134:

  return v14;
}

void __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 transportRepresentation];
  [v2 addObject:v3];
}

void __46__AXRemoteHearingAidDevice__valueForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 transportRepresentation];
  [v2 addObject:v3];
}

- (id)valueForProperty:(unint64_t)a3
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  for (uint64_t i = 0; i != 64; ++i)
  {
    if (((1 << i) & a3) != 0)
    {
      id v7 = [(AXRemoteHearingAidDevice *)self _valueForProperty:1 << i];
      if (v7)
      {
        id v8 = [NSNumber numberWithUnsignedLongLong:1 << i];
        [v5 setObject:v7 forKey:v8];
      }
    }
  }
  if ((unint64_t)[v5 count] < 2)
  {
    if ([v5 count] == 1)
    {
      id v10 = [v5 allValues];
      uint64_t v9 = [v10 firstObject];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = [NSDictionary dictionaryWithDictionary:v5];
  }

  return v9;
}

- (double)combinedVolumeForProperty:(unint64_t)a3
{
  if (propertyContainsProperty(0x40800000C0, a3))
  {
    id v5 = [(AXRemoteHearingAidDevice *)self _valueForProperty:a3];
    objc_opt_class();
    double v6 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count] == 2)
    {
      id v7 = [v5 firstObject];
      [v7 doubleValue];
      double v9 = v8;

      id v10 = [v5 lastObject];
      [v10 doubleValue];
      double v12 = v11;

      BOOL v13 = [(AXRemoteHearingAidDevice *)self leftAvailable];
      if (v13) {
        double v14 = 1.0;
      }
      else {
        double v14 = 0.0;
      }
      if (v13) {
        double v15 = v9 + 0.0;
      }
      else {
        double v15 = 0.0;
      }
      BOOL v16 = [(AXRemoteHearingAidDevice *)self rightAvailable];
      double v17 = v14 + 1.0;
      if (!v16) {
        double v17 = v14;
      }
      double v18 = -0.0;
      if (v16) {
        double v18 = v12;
      }
      double v6 = (v15 + v18) / v17;
    }
LABEL_26:

    return v6;
  }
  if (a3 == 0x2000000000 || (double v6 = 0.0, a3 == 0x1000000000))
  {
    id v5 = [(AXRemoteHearingAidDevice *)self _valueForProperty:a3];
    objc_opt_class();
    double v6 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 count] == 2)
    {
      uint64_t v19 = [v5 firstObject];
      int v20 = [v19 charValue];

      int v21 = [v5 lastObject];
      double v22 = (double)(int)[v21 charValue];

      if ((double)v20 != v22 && v20 == 0) {
        double v24 = v22;
      }
      else {
        double v24 = (double)v20;
      }
      double v6 = v24 / 255.0 + 0.5;
    }
    goto LABEL_26;
  }
  return v6;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = [(AXRemoteHearingAidDevice *)self name];
  id v5 = [(AXRemoteHearingAidDevice *)self manufacturer];
  double v6 = [(AXRemoteHearingAidDevice *)self model];
  uint64_t v7 = [(AXRemoteHearingAidDevice *)self availableEars];
  double v8 = [(AXRemoteHearingAidDevice *)self deviceUUID];
  double v9 = [v3 stringWithFormat:@"AXRemoteHearingAidDevice:%p:[%@] [%@, %@] [%d] {%@}", self, v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)keepInSync
{
  return self->_keepInSync;
}

- (double)rightMicrophoneVolume
{
  return self->_rightMicrophoneVolume;
}

- (double)leftMicrophoneVolume
{
  return self->_leftMicrophoneVolume;
}

- (double)rightStreamVolume
{
  return self->_rightStreamVolume;
}

- (double)leftStreamVolume
{
  return self->_leftStreamVolume;
}

- (double)leftSensitivity
{
  return self->_leftSensitivity;
}

- (double)rightSensitivity
{
  return self->_rightSensitivity;
}

- (int)availableEars
{
  return self->availableEars;
}

- (void)setAvailableEars:(int)a3
{
  self->availableEars = a3;
}

- (char)leftTreble
{
  return self->_leftTreble;
}

- (char)rightTreble
{
  return self->_rightTreble;
}

- (char)leftBass
{
  return self->_leftBass;
}

- (char)rightBass
{
  return self->_rightBass;
}

- (double)leftMixedVolume
{
  return self->_leftMixedVolume;
}

- (double)rightMixedVolume
{
  return self->_rightMixedVolume;
}

- (unint64_t)rightLeaVersion
{
  return self->rightLeaVersion;
}

- (void)setRightLeaVersion:(unint64_t)a3
{
  self->rightLeaVersion = a3;
}

- (unint64_t)leftLeaVersion
{
  return self->leftLeaVersion;
}

- (void)setLeftLeaVersion:(unint64_t)a3
{
  self->leftLeaVersion = a3;
}

- (AXHARemoteUpdateProtocol)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  return (AXHARemoteUpdateProtocol *)WeakRetained;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (BOOL)isBluetoothPaired
{
  return self->_isBluetoothPaired;
}

- (void)setIsBluetoothPaired:(BOOL)a3
{
  self->_isBluetoothPaired = a3;
}

- (BOOL)isPaired
{
  return self->_isPaired;
}

- (void)setIsPaired:(BOOL)a3
{
  self->_isPaired = a3;
}

- (BOOL)isConnecting
{
  return self->_isConnecting;
}

- (void)setIsConnecting:(BOOL)a3
{
  self->_isConnecting = a3;
}

- (BOOL)leftConnected
{
  return self->_leftConnected;
}

- (void)setLeftConnected:(BOOL)a3
{
  self->_leftConnected = a3;
}

- (BOOL)rightConnected
{
  return self->_rightConnected;
}

- (void)setRightConnected:(BOOL)a3
{
  self->_rightConnected = a3;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)manufacturer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSMutableArray)model
{
  return (NSMutableArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)leftFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLeftFirmwareVersion:(id)a3
{
}

- (NSString)rightFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRightFirmwareVersion:(id)a3
{
}

- (NSString)leftHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLeftHardwareVersion:(id)a3
{
}

- (NSString)rightHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setRightHardwareVersion:(id)a3
{
}

- (NSString)rightUUID
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRightUUID:(id)a3
{
}

- (NSString)leftUUID
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLeftUUID:(id)a3
{
}

- (NSString)leftPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setLeftPeripheralUUID:(id)a3
{
}

- (NSString)rightPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setRightPeripheralUUID:(id)a3
{
}

- (double)rightBatteryLevel
{
  return self->_rightBatteryLevel;
}

- (void)setRightBatteryLevel:(double)a3
{
  self->_rightBatteryLevel = a3;
}

- (double)leftBatteryLevel
{
  return self->_leftBatteryLevel;
}

- (void)setLeftBatteryLevel:(double)a3
{
  self->_leftBatteryLevel = a3;
}

- (NSDate)leftBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 256, 1);
}

- (void)setLeftBatteryLowDate:(id)a3
{
}

- (NSDate)rightBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRightBatteryLowDate:(id)a3
{
}

- (signed)leftMicrophoneVolumeSteps
{
  return self->_leftMicrophoneVolumeSteps;
}

- (void)setLeftMicrophoneVolumeSteps:(signed __int16)a3
{
  self->_leftMicrophoneVolumeSteps = a3;
}

- (signed)rightMicrophoneVolumeSteps
{
  return self->_rightMicrophoneVolumeSteps;
}

- (void)setRightMicrophoneVolumeSteps:(signed __int16)a3
{
  self->_rightMicrophoneVolumeSteps = a3;
}

- (signed)leftStreamVolumeSteps
{
  return self->_leftStreamVolumeSteps;
}

- (void)setLeftStreamVolumeSteps:(signed __int16)a3
{
  self->_leftStreamVolumeSteps = a3;
}

- (signed)rightStreamVolumeSteps
{
  return self->_rightStreamVolumeSteps;
}

- (void)setRightStreamVolumeSteps:(signed __int16)a3
{
  self->_rightStreamVolumeSteps = a3;
}

- (signed)leftSensitivitySteps
{
  return self->_leftSensitivitySteps;
}

- (void)setLeftSensitivitySteps:(signed __int16)a3
{
  self->_leftSensitivitySteps = a3;
}

- (signed)rightSensitivitySteps
{
  return self->_rightSensitivitySteps;
}

- (void)setRightSensitivitySteps:(signed __int16)a3
{
  self->_rightSensitivitySteps = a3;
}

- (signed)leftMixedVolumeSteps
{
  return self->_leftMixedVolumeSteps;
}

- (void)setLeftMixedVolumeSteps:(signed __int16)a3
{
  self->_leftMixedVolumeSteps = a3;
}

- (signed)rightMixedVolumeSteps
{
  return self->_rightMixedVolumeSteps;
}

- (void)setRightMixedVolumeSteps:(signed __int16)a3
{
  self->_rightMixedVolumeSteps = a3;
}

- (BOOL)supportsBinauralStreaming
{
  return self->_supportsBinauralStreaming;
}

- (void)setSupportsBinauralStreaming:(BOOL)a3
{
  self->_supportsBinauralStreaming = a3;
}

- (BOOL)supportsCombinedPresets
{
  return self->_supportsCombinedPresets;
}

- (void)setSupportsCombinedPresets:(BOOL)a3
{
  self->_supportsCombinedPresets = a3;
}

- (BOOL)supportsCombinedVolumes
{
  return self->_supportsCombinedVolumes;
}

- (void)setSupportsCombinedVolumes:(BOOL)a3
{
  self->_supportsCombinedVolumes = a3;
}

- (BOOL)requiresBinauralStreaming
{
  return self->_requiresBinauralStreaming;
}

- (void)setRequiresBinauralStreaming:(BOOL)a3
{
  self->_requiresBinauralStreaming = a3;
}

- (BOOL)requiresCombinedPresets
{
  return self->_requiresCombinedPresets;
}

- (void)setRequiresCombinedPresets:(BOOL)a3
{
  self->_requiresCombinedPresets = a3;
}

- (BOOL)requiresCombinedVolumes
{
  return self->_requiresCombinedVolumes;
}

- (void)setRequiresCombinedVolumes:(BOOL)a3
{
  self->_requiresCombinedVolumes = a3;
}

- (NSArray)rightPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setRightPrograms:(id)a3
{
}

- (NSArray)leftPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)setLeftPrograms:(id)a3
{
}

- (AXHearingAidMode)leftSelectedProgram
{
  return self->_leftSelectedProgram;
}

- (void)setLeftSelectedProgram:(id)a3
{
}

- (AXHearingAidMode)rightSelectedProgram
{
  return self->_rightSelectedProgram;
}

- (void)setRightSelectedProgram:(id)a3
{
}

- (AXHearingAidMode)leftSelectedStreamingProgram
{
  return self->_leftSelectedStreamingProgram;
}

- (void)setLeftSelectedStreamingProgram:(id)a3
{
}

- (AXHearingAidMode)rightSelectedStreamingProgram
{
  return self->_rightSelectedStreamingProgram;
}

- (void)setRightSelectedStreamingProgram:(id)a3
{
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
}

- (unint64_t)requiredProperties
{
  return self->_requiredProperties;
}

- (void)setRequiredProperties:(unint64_t)a3
{
  self->_requiredProperties = a3;
}

- (unint64_t)loadedProperties
{
  return self->_loadedProperties;
}

- (void)setLoadedProperties:(unint64_t)a3
{
  self->_loadedProperties = a3;
}

- (unint64_t)pendingPropertyWrites
{
  return self->_pendingPropertyWrites;
}

- (void)setPendingPropertyWrites:(unint64_t)a3
{
  self->_pendingPropertyWrites = a3;
}

- (unint64_t)leftAvailableProperties
{
  return self->_leftAvailableProperties;
}

- (void)setLeftAvailableProperties:(unint64_t)a3
{
  self->_leftAvailableProperties = a3;
}

- (unint64_t)rightAvailableProperties
{
  return self->_rightAvailableProperties;
}

- (void)setRightAvailableProperties:(unint64_t)a3
{
  self->_rightAvailableProperties = a3;
}

- (int)availableInputEars
{
  return self->_availableInputEars;
}

- (void)setAvailableInputEars:(int)a3
{
  self->_availableInputEars = a3;
}

- (int)earsSupportingWatch
{
  return self->_earsSupportingWatch;
}

- (void)setEarsSupportingWatch:(int)a3
{
  self->_earsSupportingWatch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_rightSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_rightSelectedProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedProgram, 0);
  objc_storeStrong((id *)&self->_leftPrograms, 0);
  objc_storeStrong((id *)&self->_rightPrograms, 0);
  objc_storeStrong((id *)&self->_rightBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_leftBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_rightPeripheralUUID, 0);
  objc_storeStrong((id *)&self->_leftPeripheralUUID, 0);
  objc_storeStrong((id *)&self->_leftUUID, 0);
  objc_storeStrong((id *)&self->_rightUUID, 0);
  objc_storeStrong((id *)&self->_rightHardwareVersion, 0);
  objc_storeStrong((id *)&self->_leftHardwareVersion, 0);
  objc_storeStrong((id *)&self->_rightFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_leftFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_destroyWeak((id *)&self->_updateDelegate);
}

@end