@interface AXHearingAidDevice
+ (id)characteristicsUUIDs;
+ (id)deviceIDFromLeftID:(id)a3 andRightID:(id)a4;
- (AXHearingAidDevice)initWithLeftDevice:(id)a3 andRightDevice:(id)a4;
- (AXHearingAidDevice)initWithPeripheral:(id)a3;
- (AXHearingAidDevice)initWithPersistentRepresentation:(id)a3;
- (AXHearingAidMode)currentLeftProgram;
- (AXHearingAidMode)currentLeftStreamingProgram;
- (AXHearingAidMode)currentRightProgram;
- (AXHearingAidMode)currentRightStreamingProgram;
- (AXHearingAidMode)leftSelectedProgram;
- (AXHearingAidMode)leftSelectedStreamingProgram;
- (AXHearingAidMode)rightSelectedProgram;
- (AXHearingAidMode)rightSelectedStreamingProgram;
- (BOOL)addPeripheral:(id)a3;
- (BOOL)addPeripheral:(id)a3 asLeft:(BOOL)a4;
- (BOOL)containsPeripheralWithUUID:(id)a3;
- (BOOL)deviceSupportsProperty:(unint64_t)a3;
- (BOOL)didLoadBasicProperties;
- (BOOL)didLoadOptionalBasicProperties;
- (BOOL)didLoadPersistentProperties;
- (BOOL)didLoadRequiredProperties;
- (BOOL)hasConnection;
- (BOOL)isAnyPeripheralInConnectingState;
- (BOOL)isConnected;
- (BOOL)isConnecting;
- (BOOL)isFakeDevice;
- (BOOL)isLeftConnected;
- (BOOL)isPaired;
- (BOOL)isPersistent;
- (BOOL)isRightConnected;
- (BOOL)keepInSync;
- (BOOL)leftAvailable;
- (BOOL)leftPeripheralPaired;
- (BOOL)peripheral:(id)a3 didLoadProperty:(unint64_t)a4;
- (BOOL)readsWatchSupportCharacteristic;
- (BOOL)requiresBinauralStreaming;
- (BOOL)requiresCombinedPresets;
- (BOOL)requiresCombinedVolumes;
- (BOOL)rightAvailable;
- (BOOL)rightPeripheralPaired;
- (BOOL)supportsBinauralStreaming;
- (BOOL)supportsCombinedPresets;
- (BOOL)supportsCombinedVolumes;
- (CBPeripheral)leftPeripheral;
- (CBPeripheral)rightPeripheral;
- (NSArray)leftPrograms;
- (NSArray)rightPrograms;
- (NSDate)leftBatteryLowDate;
- (NSDate)rightBatteryLowDate;
- (NSMutableArray)manufacturer;
- (NSMutableArray)model;
- (NSMutableDictionary)leftPropertiesLoadCount;
- (NSMutableDictionary)rightPropertiesLoadCount;
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
- (char)signedValueForProperty:(unint64_t)a3 andPeripheral:(id)a4;
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
- (id)descriptionForCBPeripheralState:(int64_t)a3;
- (id)deviceDescription;
- (id)peripheral:(id)a3 characteristicForProperty:(unint64_t)a4;
- (id)peripheral:(id)a3 characteristicForUUID:(id)a4;
- (id)persistentRepresentation;
- (id)programs;
- (id)selectedProgramIndexes;
- (id)selectedPrograms;
- (id)serviceUUID;
- (id)valueForProperty:(unint64_t)a3;
- (int)availableEars;
- (int)availableInputEars;
- (int)connectedEars;
- (int)earsSupportingWatch;
- (signed)leftMicrophoneVolumeSteps;
- (signed)leftMixedVolumeSteps;
- (signed)leftSensitivitySteps;
- (signed)leftStreamVolumeSteps;
- (signed)rightMicrophoneVolumeSteps;
- (signed)rightMixedVolumeSteps;
- (signed)rightSensitivitySteps;
- (signed)rightStreamVolumeSteps;
- (unint64_t)availablePropertiesForPeripheral:(id)a3;
- (unint64_t)deviceType;
- (unint64_t)leftLeaVersion;
- (unint64_t)leftLoadedProperties;
- (unint64_t)leftWriteRequestProperties;
- (unint64_t)leftWriteResponseProperties;
- (unint64_t)peripheral:(id)a3 propertyForCharacteristic:(id)a4;
- (unint64_t)requiredProperties;
- (unint64_t)rightLeaVersion;
- (unint64_t)rightLoadedProperties;
- (unint64_t)rightWriteRequestProperties;
- (unint64_t)rightWriteResponseProperties;
- (unsigned)leftPresetBitmask;
- (unsigned)leftProgramVersion;
- (unsigned)rightPresetBitmask;
- (unsigned)rightProgramVersion;
- (unsigned)volumeValueForProperty:(unint64_t)a3 andPeripheral:(id)a4;
- (void)_init;
- (void)_sendDelayedWrites;
- (void)checkPairingStatusWithCompletion:(id)a3;
- (void)connect;
- (void)connectionDidChange;
- (void)dealloc;
- (void)delayWriteProperty:(unint64_t)a3 forPeripheral:(id)a4;
- (void)disconnectAndUnpair:(BOOL)a3;
- (void)loadBasicProperties;
- (void)loadFailedProperties;
- (void)loadProperties:(unint64_t)a3 forPeripheral:(id)a4 withRetryPeriod:(double)a5;
- (void)loadRequiredProperties;
- (void)mateWithDevice:(id)a3;
- (void)pairingDidCompleteForPeripheral:(id)a3;
- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didDiscoverServices:(id)a4;
- (void)peripheral:(id)a3 didInvalidateServices:(id)a4;
- (void)peripheral:(id)a3 didModifyServices:(id)a4;
- (void)peripheral:(id)a3 didUpdateCharacteristic:(id)a4;
- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5;
- (void)peripheralDidUnpair:(id)a3;
- (void)peripheralDidUpdateName:(id)a3;
- (void)readProperty:(unint64_t)a3 fromPeripheral:(id)a4;
- (void)readValueForCharacteristic:(id)a3 fromPeripheral:(id)a4;
- (void)selectProgram:(id)a3 forEar:(int)a4;
- (void)setAvailableEars:(int)a3;
- (void)setAvailableInputEars:(int)a3;
- (void)setBass:(char)a3 forLeft:(BOOL)a4;
- (void)setCurrentLeftProgram:(id)a3;
- (void)setCurrentLeftStreamingProgram:(id)a3;
- (void)setCurrentRightProgram:(id)a3;
- (void)setCurrentRightStreamingProgram:(id)a3;
- (void)setEarsSupportingWatch:(int)a3;
- (void)setIsConnecting:(BOOL)a3;
- (void)setIsPaired:(BOOL)a3;
- (void)setIsPersistent:(BOOL)a3;
- (void)setKeepInSync:(BOOL)a3;
- (void)setLeftBass:(char)a3;
- (void)setLeftBatteryLevel:(double)a3;
- (void)setLeftBatteryLowDate:(id)a3;
- (void)setLeftFirmwareVersion:(id)a3;
- (void)setLeftHardwareVersion:(id)a3;
- (void)setLeftLeaVersion:(unint64_t)a3;
- (void)setLeftLoadedProperties:(unint64_t)a3;
- (void)setLeftMicrophoneVolume:(double)a3;
- (void)setLeftMicrophoneVolumeSteps:(signed __int16)a3;
- (void)setLeftMixedVolume:(double)a3;
- (void)setLeftMixedVolumeSteps:(signed __int16)a3;
- (void)setLeftPeripheral:(id)a3;
- (void)setLeftPeripheralPaired:(BOOL)a3;
- (void)setLeftPeripheralUUID:(id)a3;
- (void)setLeftPresetBitmask:(unsigned int)a3;
- (void)setLeftProgramVersion:(unsigned int)a3;
- (void)setLeftPrograms:(id)a3;
- (void)setLeftPropertiesLoadCount:(id)a3;
- (void)setLeftSelectedProgram:(id)a3;
- (void)setLeftSelectedStreamingProgram:(id)a3;
- (void)setLeftSensitivity:(double)a3;
- (void)setLeftSensitivitySteps:(signed __int16)a3;
- (void)setLeftStreamVolume:(double)a3;
- (void)setLeftStreamVolumeSteps:(signed __int16)a3;
- (void)setLeftTreble:(char)a3;
- (void)setLeftUUID:(id)a3;
- (void)setLeftWriteRequestProperties:(unint64_t)a3;
- (void)setLeftWriteResponseProperties:(unint64_t)a3;
- (void)setManufacturer:(id)a3;
- (void)setMixedVolume:(double)a3 forLeft:(BOOL)a4;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setNotify:(BOOL)a3 forPeripheral:(id)a4;
- (void)setRequiresBinauralStreaming:(BOOL)a3;
- (void)setRequiresCombinedPresets:(BOOL)a3;
- (void)setRequiresCombinedVolumes:(BOOL)a3;
- (void)setRightBass:(char)a3;
- (void)setRightBatteryLevel:(double)a3;
- (void)setRightBatteryLowDate:(id)a3;
- (void)setRightFirmwareVersion:(id)a3;
- (void)setRightHardwareVersion:(id)a3;
- (void)setRightLeaVersion:(unint64_t)a3;
- (void)setRightLoadedProperties:(unint64_t)a3;
- (void)setRightMicrophoneVolume:(double)a3;
- (void)setRightMicrophoneVolumeSteps:(signed __int16)a3;
- (void)setRightMixedVolume:(double)a3;
- (void)setRightMixedVolumeSteps:(signed __int16)a3;
- (void)setRightPeripheral:(id)a3;
- (void)setRightPeripheralPaired:(BOOL)a3;
- (void)setRightPeripheralUUID:(id)a3;
- (void)setRightPresetBitmask:(unsigned int)a3;
- (void)setRightProgramVersion:(unsigned int)a3;
- (void)setRightPrograms:(id)a3;
- (void)setRightPropertiesLoadCount:(id)a3;
- (void)setRightSelectedProgram:(id)a3;
- (void)setRightSelectedStreamingProgram:(id)a3;
- (void)setRightSensitivity:(double)a3;
- (void)setRightSensitivitySteps:(signed __int16)a3;
- (void)setRightStreamVolume:(double)a3;
- (void)setRightStreamVolumeSteps:(signed __int16)a3;
- (void)setRightTreble:(char)a3;
- (void)setRightUUID:(id)a3;
- (void)setRightWriteRequestProperties:(unint64_t)a3;
- (void)setRightWriteResponseProperties:(unint64_t)a3;
- (void)setSupportsBinauralStreaming:(BOOL)a3;
- (void)setSupportsCombinedPresets:(BOOL)a3;
- (void)setSupportsCombinedVolumes:(BOOL)a3;
- (void)setTreble:(char)a3 forLeft:(BOOL)a4;
- (void)setValue:(id)a3 forProperty:(unint64_t)a4;
- (void)updateBatteryServiceForPeripheral:(id)a3;
- (void)updateInputTagsAndReset:(BOOL)a3;
- (void)updateName;
- (void)updateNameWithAdvertisingData:(id)a3;
- (void)watchWristOrientationDidChange:(id)a3;
- (void)writeInt:(unsigned __int8)a3 toEar:(int)a4 forProperty:(unint64_t)a5;
- (void)writeSignedInt:(char)a3 toEar:(int)a4 forProperty:(unint64_t)a5;
- (void)writeValueForProperty:(unint64_t)a3;
@end

@implementation AXHearingAidDevice

+ (id)characteristicsUUIDs
{
  v2 = (void *)characteristicsUUIDs_CharacteristicsUUIDs;
  if (!characteristicsUUIDs_CharacteristicsUUIDs)
  {
    id v20 = objc_alloc(NSDictionary);
    v58 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x24E1DFF3-AE90-41BF-BFBD-2CF8DF42BF87"];
    v57 = [NSNumber numberWithUnsignedLongLong:4];
    v56 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x8D17AC2F-1D54-4742-A49A-EF4B20784EB3"];
    v55 = [NSNumber numberWithUnsignedLongLong:8];
    v54 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xC97D21D3-D79D-4DF8-9230-BB33FA805F4E"];
    v53 = [NSNumber numberWithUnsignedLongLong:16];
    v52 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x497EEB9E-B194-4F35-BC82-36FD300482A6"];
    v51 = [NSNumber numberWithUnsignedLongLong:32];
    v50 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xF3F594F9-E210-48F3-85E2-4B0CF235A9D3"];
    v49 = [NSNumber numberWithUnsignedLongLong:64];
    v48 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x6AC46200-24EA-46D8-A136-81133C65840A"];
    v47 = [NSNumber numberWithUnsignedLongLong:128];
    v46 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x21FF4275-C41D-4486-A0E3-DC11138BCDE6"];
    v45 = [NSNumber numberWithUnsignedLongLong:256];
    v44 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xA391C6F1-20BB-495A-ABBF-2017098FBC61"];
    v43 = [NSNumber numberWithUnsignedLongLong:1024];
    v39 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xA28B6BE1-2FA4-42F8-AEB2-B15A1DBD837A"];
    v41 = [NSNumber numberWithUnsignedLongLong:4096];
    v42 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x7BE94A55-8D91-4592-BC0F-EA3664CCD3A9"];
    v40 = [NSNumber numberWithUnsignedLongLong:0x2000];
    v36 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x9C12A3DB-9CE8-4865-A217-D394B3BC9311"];
    v38 = [NSNumber numberWithUnsignedLongLong:0x4000];
    v32 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xADC3023D-BFD2-43FD-86F6-7AE05A619092"];
    v37 = [NSNumber numberWithUnsignedLongLong:0x20000];
    v35 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x16438C66-E95A-4C6F-8117-A6B745BD86FC"];
    v30 = [NSNumber numberWithUnsignedLongLong:0x10000000];
    v34 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xAEA12A32-60ED-43BA-BE6F-BA6092000FDB"];
    v19 = [NSNumber numberWithUnsignedLongLong:0x40000000];
    v33 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xEAF6FB18-090C-4EF7-AAB8-06518E16D502"];
    v31 = [NSNumber numberWithUnsignedLongLong:0x80000000];
    v29 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x76B3DB1F-44C4-46CC-A7B5-E9CE7DFBEF50"];
    v18 = [NSNumber numberWithUnsignedLongLong:0x100000000];
    v28 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x98924A39-6559-40A8-B302-3C8E40DBF834"];
    v17 = [NSNumber numberWithUnsignedLongLong:0x200000000];
    v27 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x066E7E7F-93E9-4D26-89AC-AECCDBAFA825"];
    v16 = [NSNumber numberWithUnsignedLongLong:0x400000000];
    v26 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x4656D3AC-C2DF-4096-96E7-713580B69CCD"];
    v25 = [NSNumber numberWithUnsignedLongLong:0x800000000];
    v24 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xF6E6AC8D-248E-433F-BC2C-E51E47DF3ECA"];
    v23 = [NSNumber numberWithUnsignedLongLong:0x1000000000];
    v22 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xC60E7C73-203B-4B7C-AFC5-2FE79C5F2F01"];
    v21 = [NSNumber numberWithUnsignedLongLong:0x2000000000];
    v15 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x4603580D-3C15-4FEC-93BE-B86B243ADA64"];
    v14 = [NSNumber numberWithUnsignedLongLong:0x4000000000];
    v3 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xE893C687-7C43-4999-8FD0-6CB11D0F88CD"];
    v13 = [NSNumber numberWithUnsignedLongLong:0x8000000000];
    v4 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x61D1B37D-94D5-4281-A88F-9B67F8F96314"];
    v12 = [NSNumber numberWithUnsignedLongLong:0x10000000000];
    v5 = [MEMORY[0x263EFEF88] UUIDWithString:@"0xCE9CDC7E-7D7A-4135-9F3F-CA1E2EB2C8D5"];
    v6 = [NSNumber numberWithUnsignedLongLong:0x40000000000];
    v7 = [MEMORY[0x263EFEF88] UUIDWithString:@"0x8E750BB1-40C1-48DF-B450-97F245C57E0C"];
    v8 = [NSNumber numberWithUnsignedLongLong:0x80000000000];
    uint64_t v9 = objc_msgSend(v20, "initWithObjectsAndKeys:", v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v46, v45, v44, v43, v39,
           v41,
           v42,
           v40,
           v36,
           v38,
           v32,
           v37,
           v35,
           v30,
           v34,
           v19,
           v33,
           v31,
           v29,
           v18,
           v28,
           v17,
           v27,
           v16,
           v26,
           v25,
           v24,
           v23,
           v22,
           v21,
           v15,
           v14,
           v3,
           v13,
           v4,
           v12,
           v5,
           v6,
           v7,
           v8,
           0);
    v10 = (void *)characteristicsUUIDs_CharacteristicsUUIDs;
    characteristicsUUIDs_CharacteristicsUUIDs = v9;

    v2 = (void *)characteristicsUUIDs_CharacteristicsUUIDs;
  }

  return v2;
}

+ (id)deviceIDFromLeftID:(id)a3 andRightID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v6 length])
    {
      id v7 = [NSString stringWithFormat:@"%@_%@", v5, v6];
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (void)_init
{
  uint64_t v3 = MEMORY[0x263EFFA68];
  [(AXHearingAidDevice *)self setRightPrograms:MEMORY[0x263EFFA68]];
  [(AXHearingAidDevice *)self setLeftPrograms:v3];
  v4 = [MEMORY[0x263EFF9A0] dictionary];
  [(AXHearingAidDevice *)self setLeftPropertiesLoadCount:v4];

  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  [(AXHearingAidDevice *)self setRightPropertiesLoadCount:v5];

  [(AXHearingAidDevice *)self setCurrentLeftProgram:0];
  [(AXHearingAidDevice *)self setCurrentRightProgram:0];
  [(AXHearingAidDevice *)self setCurrentLeftStreamingProgram:0];
  [(AXHearingAidDevice *)self setCurrentRightStreamingProgram:0];
  id v6 = hearingLocString(@"HearingAidLabel");
  [(AXHearingAidDevice *)self setName:v6];

  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &stru_26C1D5720, &stru_26C1D5720, 0);
  [(AXHearingAidDevice *)self setManufacturer:v7];

  v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", &stru_26C1D5720, &stru_26C1D5720, 0);
  [(AXHearingAidDevice *)self setModel:v8];

  [(AXHearingAidDevice *)self setSupportsBinauralStreaming:1];
  [(AXHearingAidDevice *)self setSupportsCombinedPresets:1];
  [(AXHearingAidDevice *)self setSupportsCombinedVolumes:1];
  [(AXHearingAidDevice *)self setRequiresCombinedPresets:0];
  [(AXHearingAidDevice *)self setRequiresCombinedVolumes:0];
  [(AXHearingAidDevice *)self setRequiresBinauralStreaming:0];
  [(AXHearingAidDevice *)self setLeftMicrophoneVolumeSteps:1];
  [(AXHearingAidDevice *)self setLeftSensitivitySteps:1];
  [(AXHearingAidDevice *)self setLeftStreamVolumeSteps:1];
  [(AXHearingAidDevice *)self setLeftMixedVolumeSteps:1];
  [(AXHearingAidDevice *)self setRightMicrophoneVolumeSteps:1];
  [(AXHearingAidDevice *)self setRightSensitivitySteps:1];
  [(AXHearingAidDevice *)self setRightStreamVolumeSteps:1];
  [(AXHearingAidDevice *)self setRightMixedVolumeSteps:1];
  [(AXHearingAidDevice *)self setLeftLeaVersion:1];
  [(AXHearingAidDevice *)self setRightLeaVersion:1];
  uint64_t v9 = +[HUHearingAidSettings sharedInstance];
  -[AXHearingAidDevice setAvailableInputEars:](self, "setAvailableInputEars:", [v9 availableInputEars]);

  if ([MEMORY[0x263F472B0] isInternalInstall]) {
    uint64_t v10 = 6;
  }
  else {
    uint64_t v10 = 0;
  }
  [(AXHearingAidDevice *)self setEarsSupportingWatch:v10];
  v11 = (AXDispatchTimer *)objc_alloc_init(MEMORY[0x263F21398]);
  propertyWriteTimer = self->_propertyWriteTimer;
  self->_propertyWriteTimer = v11;

  v13 = self->_propertyWriteTimer;

  [(AXDispatchTimer *)v13 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
}

- (AXHearingAidDevice)initWithPeripheral:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXHearingAidDevice;
  id v5 = [(AXHearingAidDevice *)&v15 init];
  id v6 = v5;
  if (v5)
  {
    [(AXHearingAidDevice *)v5 _init];
    [v4 setDelegate:v6];
    if (v4)
    {
      [(AXHearingAidDevice *)v6 setLeftPeripheral:v4];
      id v7 = [v4 identifier];

      if (v7)
      {
        v8 = [v4 identifier];
        uint64_t v9 = [v8 UUIDString];

        [(AXHearingAidDevice *)v6 setLeftPeripheralUUID:v9];
      }
    }
    [(AXHearingAidDevice *)v6 updateName];
    uint64_t v10 = [v4 services];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __41__AXHearingAidDevice_initWithPeripheral___block_invoke;
    v12[3] = &unk_2640FD180;
    v13 = v6;
    id v14 = v4;
    [v10 enumerateObjectsUsingBlock:v12];
  }
  return v6;
}

void __41__AXHearingAidDevice_initWithPeripheral___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__AXHearingAidDevice_initWithPeripheral___block_invoke_2;
  v4[3] = &unk_2640FD158;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 enumerateObjectsUsingBlock:v4];
}

uint64_t __41__AXHearingAidDevice_initWithPeripheral___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) peripheral:*(void *)(a1 + 40) didUpdateCharacteristic:a2];
}

- (AXHearingAidDevice)initWithPersistentRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXHearingAidDevice;
  id v5 = [(AXHearingAidDevice *)&v11 init];
  id v6 = v5;
  if (v5)
  {
    [(AXHearingAidDevice *)v5 _init];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__AXHearingAidDevice_initWithPersistentRepresentation___block_invoke;
    v9[3] = &unk_2640FCDB0;
    id v7 = v6;
    uint64_t v10 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:v9];
    [(AXHearingAidDevice *)v7 setIsPersistent:1];
    [(AXHearingAidDevice *)v7 setIsPaired:1];
  }
  return v6;
}

void __55__AXHearingAidDevice_initWithPersistentRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v22 = a2;
  id v5 = a3;
  if ([v22 isEqualToString:@"ax_hearing_device_man_key"])
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
  if ([v22 isEqualToString:@"ax_hearing_device_model_key"])
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
  if ([v22 isEqualToString:@"ax_hearing_device_man_model_key"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [&unk_26C1E54F8 stringValue];
    objc_super v11 = [v5 objectForKey:v10];
    [v9 setValue:v11 forProperty:0x80000];

    v12 = *(void **)(a1 + 32);
    v13 = [&unk_26C1E5510 stringValue];
    id v14 = [v5 objectForKey:v13];
    [v12 setValue:v14 forProperty:0x100000];
    goto LABEL_51;
  }
  if ([v22 isEqualToString:@"ax_hearing_device_name_key"]
    && [v5 length])
  {
    [*(id *)(a1 + 32) setName:v5];
    goto LABEL_19;
  }
  if (![v22 isEqualToString:@"ax_hearing_device_lr_key"])
  {
    if (([v22 isEqualToString:@"ax_hearing_device_left_peripheral_key"] & 1) == 0
      && ![v22 isEqualToString:@"ax_hearing_device_right_peripheral_key"])
    {
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_19;
    }
    v16 = [v5 objectForKey:@"ax_hearing_device_isleft_key"];
    int v17 = [v16 BOOLValue];

    v13 = [v5 objectForKey:@"ax_hearing_device_hiid_key"];
    id v14 = [v5 objectForKey:@"ax_hearing_device_hiidother_key"];
    v18 = [v5 objectForKey:@"ax_hearing_device_uuid_key"];
    v19 = [v5 objectForKey:@"ax_hearing_device_lea_version_key"];
    int v20 = [v19 intValue];

    if ([v18 length])
    {
      char v21 = [v18 hasPrefix:*MEMORY[0x263F47278]];
      if (v17)
      {
        if ((v21 & 1) == 0) {
          [*(id *)(a1 + 32) setLeftPeripheralUUID:v18];
        }
        if ([v13 length]) {
          [*(id *)(a1 + 32) setLeftUUID:v13];
        }
        if ([v14 length]) {
          [*(id *)(a1 + 32) setRightUUID:v14];
        }
        if (v20) {
          [*(id *)(a1 + 32) setLeftLeaVersion:v20];
        }
      }
      else
      {
        if ((v21 & 1) == 0) {
          [*(id *)(a1 + 32) setRightPeripheralUUID:v18];
        }
        if ([v14 length]) {
          [*(id *)(a1 + 32) setLeftUUID:v14];
        }
        if ([v13 length]) {
          [*(id *)(a1 + 32) setRightUUID:v13];
        }
        if (v20) {
          [*(id *)(a1 + 32) setRightLeaVersion:v20];
        }
      }
    }

LABEL_51:
    goto LABEL_19;
  }
  uint64_t v15 = [v5 intValue];
  if (v15 <= 6 && ((1 << v15) & 0x54) != 0) {
    [*(id *)(a1 + 32) setAvailableEars:v15];
  }
LABEL_19:
}

- (AXHearingAidDevice)initWithLeftDevice:(id)a3 andRightDevice:(id)a4
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v78.receiver = self;
  v78.super_class = (Class)AXHearingAidDevice;
  v8 = [(AXHearingAidDevice *)&v78 init];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_57;
  }
  [(AXHearingAidDevice *)v8 _init];
  uint64_t v10 = [v6 leftUUID];
  [(AXHearingAidDevice *)v9 setLeftUUID:v10];

  objc_super v11 = [v6 leftPeripheral];
  [(AXHearingAidDevice *)v9 setLeftPeripheral:v11];

  v12 = [(AXHearingAidDevice *)v9 leftPeripheral];
  [v12 setDelegate:v9];

  [v6 leftMicrophoneVolume];
  -[AXHearingAidDevice setLeftMicrophoneVolume:](v9, "setLeftMicrophoneVolume:");
  [v6 leftBatteryLevel];
  -[AXHearingAidDevice setLeftBatteryLevel:](v9, "setLeftBatteryLevel:");
  v13 = [v6 leftPrograms];
  [(AXHearingAidDevice *)v9 setLeftPrograms:v13];

  id v14 = [v6 currentLeftProgram];
  [(AXHearingAidDevice *)v9 setCurrentLeftProgram:v14];

  -[AXHearingAidDevice setLeftLoadedProperties:](v9, "setLeftLoadedProperties:", [v6 leftLoadedProperties]);
  -[AXHearingAidDevice setLeftStreamVolumeSteps:](v9, "setLeftStreamVolumeSteps:", [v6 leftStreamVolumeSteps]);
  -[AXHearingAidDevice setLeftSensitivitySteps:](v9, "setLeftSensitivitySteps:", [v6 leftSensitivitySteps]);
  [v6 leftSensitivity];
  -[AXHearingAidDevice setLeftSensitivity:](v9, "setLeftSensitivity:");
  -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](v9, "setLeftMicrophoneVolumeSteps:", [v6 leftMicrophoneVolumeSteps]);
  -[AXHearingAidDevice setLeftTreble:](v9, "setLeftTreble:", [v6 leftTreble]);
  -[AXHearingAidDevice setLeftBass:](v9, "setLeftBass:", [v6 leftBass]);
  [v6 leftMixedVolume];
  -[AXHearingAidDevice setLeftMixedVolume:](v9, "setLeftMixedVolume:");
  -[AXHearingAidDevice setLeftMixedVolumeSteps:](v9, "setLeftMixedVolumeSteps:", [v6 leftMixedVolumeSteps]);
  [v6 setLeftPeripheral:0];
  [v6 setLeftPeripheralUUID:0];
  [v6 setLeftUUID:0];
  [v6 setRightPeripheral:0];
  [v6 setRightPeripheralUUID:0];
  [v6 setRightUUID:0];
  -[AXHearingAidDevice setLeftLeaVersion:](v9, "setLeftLeaVersion:", [v6 leftLeaVersion]);
  uint64_t v15 = [v7 rightUUID];
  [(AXHearingAidDevice *)v9 setRightUUID:v15];

  v16 = [v7 rightPeripheral];
  [(AXHearingAidDevice *)v9 setRightPeripheral:v16];

  int v17 = [(AXHearingAidDevice *)v9 rightPeripheral];
  [v17 setDelegate:v9];

  [v7 rightMicrophoneVolume];
  -[AXHearingAidDevice setRightMicrophoneVolume:](v9, "setRightMicrophoneVolume:");
  [v7 rightBatteryLevel];
  -[AXHearingAidDevice setRightBatteryLevel:](v9, "setRightBatteryLevel:");
  v18 = [v7 rightPrograms];
  [(AXHearingAidDevice *)v9 setRightPrograms:v18];

  v19 = [v7 currentRightProgram];
  [(AXHearingAidDevice *)v9 setCurrentRightProgram:v19];

  -[AXHearingAidDevice setRightLoadedProperties:](v9, "setRightLoadedProperties:", [v7 rightLoadedProperties]);
  -[AXHearingAidDevice setRightStreamVolumeSteps:](v9, "setRightStreamVolumeSteps:", [v7 rightStreamVolumeSteps]);
  -[AXHearingAidDevice setRightSensitivitySteps:](v9, "setRightSensitivitySteps:", [v7 rightSensitivitySteps]);
  [v7 rightSensitivity];
  -[AXHearingAidDevice setRightSensitivity:](v9, "setRightSensitivity:");
  -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](v9, "setRightMicrophoneVolumeSteps:", [v7 rightMicrophoneVolumeSteps]);
  -[AXHearingAidDevice setRightTreble:](v9, "setRightTreble:", [v7 rightTreble]);
  -[AXHearingAidDevice setRightBass:](v9, "setRightBass:", [v7 rightBass]);
  [v7 rightMixedVolume];
  -[AXHearingAidDevice setRightMixedVolume:](v9, "setRightMixedVolume:");
  -[AXHearingAidDevice setRightMixedVolumeSteps:](v9, "setRightMixedVolumeSteps:", [v7 rightMixedVolumeSteps]);
  [v7 setRightPeripheral:0];
  [v7 setRightPeripheralUUID:0];
  [v7 setRightUUID:0];
  [v7 setLeftPeripheral:0];
  [v7 setLeftPeripheralUUID:0];
  [v7 setLeftUUID:0];
  -[AXHearingAidDevice setRightLeaVersion:](v9, "setRightLeaVersion:", [v7 rightLeaVersion]);
  int v20 = [v7 currentRightStreamingProgram];
  [(AXHearingAidDevice *)v9 setCurrentRightStreamingProgram:v20];

  char v21 = [v6 currentLeftStreamingProgram];
  [(AXHearingAidDevice *)v9 setCurrentLeftStreamingProgram:v21];

  -[AXHearingAidDevice setLeftLoadedProperties:](v9, "setLeftLoadedProperties:", [v6 leftLoadedProperties] | 0x20);
  -[AXHearingAidDevice setRightLoadedProperties:](v9, "setRightLoadedProperties:", [v7 rightLoadedProperties] | 0x20);
  if ([v6 isPaired]) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = [v7 isPaired];
  }
  [(AXHearingAidDevice *)v9 setIsPaired:v22];
  if ([v6 isPersistent]) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = [v7 isPersistent];
  }
  [(AXHearingAidDevice *)v9 setIsPersistent:v23];
  if ([v6 supportsBinauralStreaming]) {
    uint64_t v24 = [v7 supportsBinauralStreaming];
  }
  else {
    uint64_t v24 = 0;
  }
  [(AXHearingAidDevice *)v9 setSupportsBinauralStreaming:v24];
  if ([v6 supportsCombinedPresets]) {
    uint64_t v25 = [v7 supportsCombinedPresets];
  }
  else {
    uint64_t v25 = 0;
  }
  [(AXHearingAidDevice *)v9 setSupportsCombinedPresets:v25];
  if ([v6 supportsCombinedVolumes]) {
    uint64_t v26 = [v7 supportsCombinedVolumes];
  }
  else {
    uint64_t v26 = 0;
  }
  [(AXHearingAidDevice *)v9 setSupportsCombinedVolumes:v26];
  if ([v6 requiresBinauralStreaming]) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = [v7 requiresBinauralStreaming];
  }
  [(AXHearingAidDevice *)v9 setRequiresBinauralStreaming:v27];
  if ([v6 requiresCombinedPresets]) {
    uint64_t v28 = [v7 requiresCombinedPresets];
  }
  else {
    uint64_t v28 = 0;
  }
  [(AXHearingAidDevice *)v9 setRequiresCombinedPresets:v28];
  if ([v6 requiresCombinedVolumes]) {
    uint64_t v29 = [v7 requiresCombinedVolumes];
  }
  else {
    uint64_t v29 = 0;
  }
  [(AXHearingAidDevice *)v9 setRequiresCombinedVolumes:v29];
  v30 = (void *)MEMORY[0x263EFF980];
  v31 = [v6 manufacturer];
  v32 = [v31 firstObject];
  v33 = [v7 manufacturer];
  v34 = [v33 lastObject];
  v35 = objc_msgSend(v30, "arrayWithObjects:", v32, v34, 0);
  [(AXHearingAidDevice *)v9 setManufacturer:v35];

  v36 = (void *)MEMORY[0x263EFF980];
  v37 = [v6 model];
  v38 = [v37 firstObject];
  v39 = [v7 model];
  v40 = [v39 lastObject];
  v41 = objc_msgSend(v36, "arrayWithObjects:", v38, v40, 0);
  [(AXHearingAidDevice *)v9 setModel:v41];

  v42 = [v7 name];
  [(AXHearingAidDevice *)v9 setName:v42];

  v43 = [(AXHearingAidDevice *)v9 leftPeripheral];
  v44 = [v43 identifier];
  v45 = [v44 UUIDString];

  [(AXHearingAidDevice *)v9 setLeftPeripheralUUID:v45];
  if (!v45)
  {
    HAInitializeLogging();
    v46 = [NSString stringWithFormat:@"Missing left peripheral UUID %@", v9];
    v47 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice initWithLeftDevice:andRightDevice:]", 530, v46];
    v48 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v49 = v47;
      v50 = v48;
      uint64_t v51 = [v49 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v80 = v51;
      _os_log_impl(&dword_20CC86000, v50, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  v52 = [(AXHearingAidDevice *)v9 rightPeripheral];
  v53 = [v52 identifier];
  v54 = [v53 UUIDString];

  [(AXHearingAidDevice *)v9 setRightPeripheralUUID:v54];
  if (!v54)
  {
    HAInitializeLogging();
    v55 = [NSString stringWithFormat:@"Missing right peripheral UUID %@", v9];
    v56 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice initWithLeftDevice:andRightDevice:]", 538, v55];
    v57 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v58 = v56;
      v59 = v57;
      uint64_t v60 = [v58 UTF8String];
      *(_DWORD *)buf = 136446210;
      uint64_t v80 = v60;
      _os_log_impl(&dword_20CC86000, v59, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  -[AXHearingAidDevice setLeftLoadedProperties:](v9, "setLeftLoadedProperties:", [v6 leftLoadedProperties] | 0x100000000000);
  -[AXHearingAidDevice setRightLoadedProperties:](v9, "setRightLoadedProperties:", [v7 rightLoadedProperties] | 0x100000000000);
  if ([(AXHearingAidDevice *)v9 leftAvailable]) {
    unsigned int v61 = 2;
  }
  else {
    unsigned int v61 = 0;
  }
  if ([(AXHearingAidDevice *)v9 rightAvailable]) {
    uint64_t v62 = v61 | 4;
  }
  else {
    uint64_t v62 = v61;
  }
  [(AXHearingAidDevice *)v9 setAvailableEars:v62];
  -[AXHearingAidDevice setAvailableInputEars:](v9, "setAvailableInputEars:", [v7 availableInputEars] | objc_msgSend(v6, "availableInputEars"));
  if ([MEMORY[0x263F472B0] isInternalInstall])
  {
    uint64_t v63 = 6;
  }
  else
  {
    int v64 = [v6 earsSupportingWatch];
    uint64_t v63 = [v7 earsSupportingWatch] | v64;
  }
  [(AXHearingAidDevice *)v9 setEarsSupportingWatch:v63];
  v65 = +[HUHearingAidSettings sharedInstance];
  objc_msgSend(v65, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v9, "availableInputEars"));

  v66 = +[HANanoSettings sharedInstance];
  objc_msgSend(v66, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v9, "availableInputEars"));

  v67 = +[HUHearingAidSettings sharedInstance];
  objc_msgSend(v67, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v9, "earsSupportingWatch"));

  v68 = +[HANanoSettings sharedInstance];
  objc_msgSend(v68, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v9, "earsSupportingWatch"));

  v69 = [(AXHearingAidDevice *)v9 leftPeripheral];
  v70 = [(AXHearingAidDevice *)v9 deviceUUID];
  [v69 tag:v70];

  v71 = [(AXHearingAidDevice *)v9 leftPeripheral];
  [v71 tag:@"Left HA"];

  v72 = [(AXHearingAidDevice *)v9 rightPeripheral];
  v73 = [(AXHearingAidDevice *)v9 deviceUUID];
  [v72 tag:v73];

  v74 = [(AXHearingAidDevice *)v9 rightPeripheral];
  [v74 tag:@"Right HA"];

  v75 = +[HUHearingAidSettings sharedInstance];
  if ([v75 isiCloudPaired])
  {

LABEL_45:
    [(AXHearingAidDevice *)v9 disconnectAndUnpair:0];
    goto LABEL_51;
  }
  if (([v6 isConnected] & 1) != 0
    || ([v6 isPaired] & 1) != 0
    || ([v7 isConnected] & 1) != 0)
  {
  }
  else
  {
    char v77 = [v7 isPaired];

    if ((v77 & 1) == 0) {
      goto LABEL_45;
    }
  }
  [(AXHearingAidDevice *)v9 connect];
LABEL_51:
  if ([(AXHearingAidDevice *)v9 isPaired]
    && [(AXHearingAidDevice *)v9 isPersistent]
    && [(AXHearingAidDevice *)v9 isConnected]
    && ![(AXHearingAidDevice *)v9 didLoadRequiredProperties])
  {
    [(AXHearingAidDevice *)v9 loadRequiredProperties];
  }
  [v6 setIsPersistent:0];
  [v6 setIsPaired:0];
  [v7 setIsPersistent:0];
  [v7 setIsPaired:0];

LABEL_57:
  return v9;
}

- (void)dealloc
{
  if (self->_rightPowerSourceID)
  {
    IOPSReleasePowerSource();
    self->_rightPowerSourceID = 0;
  }
  if (self->_leftPowerSouceID)
  {
    IOPSReleasePowerSource();
    self->_leftPowerSouceID = 0;
  }
  rightPowerSourceDictionary = self->_rightPowerSourceDictionary;
  self->_rightPowerSourceDictionary = 0;

  leftPowerSouceDictionary = self->_leftPowerSouceDictionary;
  self->_leftPowerSouceDictionary = 0;

  [(AXHearingAidDevice *)self disconnectAndUnpair:0];
  [(AXHearingAidDevice *)self setManufacturer:0];
  [(AXHearingAidDevice *)self setModel:0];
  [(AXHearingAidDevice *)self setLeftFirmwareVersion:0];
  [(AXHearingAidDevice *)self setRightFirmwareVersion:0];
  [(AXHearingAidDevice *)self setLeftHardwareVersion:0];
  [(AXHearingAidDevice *)self setRightHardwareVersion:0];
  [(AXHearingAidDevice *)self setRightPrograms:0];
  [(AXHearingAidDevice *)self setLeftPrograms:0];
  id v5 = [(AXHearingAidDevice *)self leftPeripheral];
  [v5 setDelegate:0];

  id v6 = [(AXHearingAidDevice *)self rightPeripheral];
  [v6 setDelegate:0];

  [(AXHearingAidDevice *)self setLeftPropertiesLoadCount:0];
  [(AXHearingAidDevice *)self setRightPropertiesLoadCount:0];
  [(AXHearingAidDevice *)self setCurrentLeftProgram:0];
  [(AXHearingAidDevice *)self setCurrentRightProgram:0];
  [(AXHearingAidDevice *)self setCurrentLeftStreamingProgram:0];
  [(AXHearingAidDevice *)self setCurrentRightStreamingProgram:0];
  [(AXHearingAidDevice *)self setLeftBatteryLowDate:0];
  [(AXHearingAidDevice *)self setRightBatteryLowDate:0];
  v7.receiver = self;
  v7.super_class = (Class)AXHearingAidDevice;
  [(AXHearingAidDevice *)&v7 dealloc];
}

- (void)connect
{
  uint64_t v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "HearingAidDevice Connect", buf, 2u);
  }

  if (![(AXHearingAidDevice *)self isConnected])
  {
    [(AXHearingAidDevice *)self setIsConnecting:1];
    id v5 = +[HUHearingAidSettings sharedInstance];
    if ([v5 shouldStreamToLeftAid])
    {
      id v6 = +[HUHearingAidSettings sharedInstance];
      if ([v6 shouldStreamToRightAid]
        && [(AXHearingAidDevice *)self leftAvailable]
        && [(AXHearingAidDevice *)self rightAvailable])
      {
        char v7 = supportsBinauralStreamingForHearingAid(self);

        if (v7)
        {
LABEL_17:
          v8 = +[AXHearingAidDeviceController sharedController];
          uint64_t v9 = [(AXHearingAidDevice *)self leftPeripheral];
          [v8 connectToPeripheral:v9];

          uint64_t v10 = +[AXHearingAidDeviceController sharedController];
          objc_super v11 = [(AXHearingAidDevice *)self rightPeripheral];
          [v10 connectToPeripheral:v11];

          return;
        }
        id v5 = +[HUHearingAidSettings sharedInstance];
        [v5 setShouldStreamToLeftAid:0];
      }
      else
      {
      }
    }

    goto LABEL_17;
  }
  if (![(AXHearingAidDevice *)self isPaired])
  {
    id v4 = HCLogHearingHandoff();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_20CC86000, v4, OS_LOG_TYPE_DEFAULT, "Set isPaired to YES", v12, 2u);
    }
  }
  [(AXHearingAidDevice *)self setIsPaired:1];
}

- (void)disconnectAndUnpair:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(AXHearingAidDevice *)self isFakeDevice] && !v3)
  {
    id v5 = +[AXHearingAidDeviceController sharedController];
    id v6 = [(AXHearingAidDevice *)self leftPeripheral];
    [v5 disconnectFromPeripheral:v6];

    char v7 = +[AXHearingAidDeviceController sharedController];
    v8 = [(AXHearingAidDevice *)self rightPeripheral];
    [v7 disconnectFromPeripheral:v8];
  }
  if (v3)
  {
    if (![(AXHearingAidDevice *)self isFakeDevice])
    {
      uint64_t v9 = +[AXHearingAidDeviceController sharedController];
      uint64_t v10 = [(AXHearingAidDevice *)self leftPeripheralUUID];
      [v9 unpairPeripheralWithUUID:v10];

      objc_super v11 = +[AXHearingAidDeviceController sharedController];
      v12 = [(AXHearingAidDevice *)self rightPeripheralUUID];
      [v11 unpairPeripheralWithUUID:v12];
    }
    [(AXHearingAidDevice *)self setIsPaired:0];
    if ([(AXHearingAidDevice *)self isPaired])
    {
      v13 = +[HUHearingAidSettings sharedInstance];
      [v13 setPairedHearingAids:0];
    }
    [(AXHearingAidDevice *)self setLeftPresetBitmask:0];
    [(AXHearingAidDevice *)self setRightPresetBitmask:0];
  }
  id v14 = +[AXHearingAidDeviceController sharedController];
  [v14 device:self didUpdateProperty:606076928];

  [(AXHearingAidDevice *)self setIsConnecting:0];
  [(AXHearingAidDevice *)self setIsPersistent:0];
  uint64_t v15 = [MEMORY[0x263EFF980] array];
  [(AXHearingAidDevice *)self setRightPrograms:v15];

  v16 = [MEMORY[0x263EFF980] array];
  [(AXHearingAidDevice *)self setLeftPrograms:v16];

  [(AXHearingAidDevice *)self setCurrentRightProgram:0];
  [(AXHearingAidDevice *)self setCurrentLeftProgram:0];
  [(AXHearingAidDevice *)self setCurrentRightStreamingProgram:0];
  [(AXHearingAidDevice *)self setCurrentLeftStreamingProgram:0];
  [(AXHearingAidDevice *)self setRightLoadedProperties:[(AXHearingAidDevice *)self rightLoadedProperties] & 0xFFFFFFFFFFFFFEFFLL];
  [(AXHearingAidDevice *)self setLeftLoadedProperties:[(AXHearingAidDevice *)self leftLoadedProperties] & 0xFFFFFFFFFFFFFEFFLL];
  int v17 = [(AXHearingAidDevice *)self rightPropertiesLoadCount];
  v18 = [NSNumber numberWithUnsignedLongLong:256];
  [v17 removeObjectForKey:v18];

  id v20 = [(AXHearingAidDevice *)self leftPropertiesLoadCount];
  v19 = [NSNumber numberWithUnsignedLongLong:256];
  [v20 removeObjectForKey:v19];
}

- (void)connectionDidChange
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = HCLogHearingHandoff();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109376;
    HIDWORD(buf) = [(AXHearingAidDevice *)self isConnecting];
    __int16 v17 = 1024;
    BOOL v18 = [(AXHearingAidDevice *)self isConnected];
    _os_log_impl(&dword_20CC86000, v3, OS_LOG_TYPE_DEFAULT, "HearingAidDevice connectionDidChange connecting: %d connected: %d", (uint8_t *)&buf, 0xEu);
  }

  id v4 = +[HUUtilities sharedUtilities];
  [v4 clearAudioRoutes];

  if ([(AXHearingAidDevice *)self isConnecting])
  {
    [(AXHearingAidDevice *)self setIsConnecting:0];
    [(AXHearingAidDevice *)self setIsPaired:1];
    [(AXHearingAidDevice *)self setIsPersistent:1];
    id v5 = [(AXHearingAidDevice *)self leftPropertiesLoadCount];
    [v5 removeAllObjects];

    id v6 = [(AXHearingAidDevice *)self rightPropertiesLoadCount];
    [v6 removeAllObjects];

    char v7 = +[AXHearingAidDeviceController sharedController];
    [v7 device:self didUpdateProperty:0x100024200038];
  }
  if ([(AXHearingAidDevice *)self isConnected])
  {
    v8 = +[AXHearingAidDeviceController sharedController];
    [v8 device:self didUpdateProperty:0x200000];

    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke;
    v15[3] = &unk_2640FD1A8;
    v15[4] = self;
    [(AXHearingAidDevice *)self checkPairingStatusWithCompletion:v15];
  }
  else
  {
    self->_leftWriteResponseProperties = 0;
    self->_rightWriteResponseProperties = 0;
  }
  if (!self->_isListeningForStreamingChanges)
  {
    uint64_t v9 = +[HUHearingAidSettings sharedInstance];
    objc_initWeak(&buf, self);
    [v9 shouldStreamToLeftAid];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke_160;
    v13[3] = &unk_2640FD1D0;
    v13[4] = self;
    objc_copyWeak(&v14, &buf);
    [v9 registerUpdateBlock:v13 forRetrieveSelector:sel_shouldStreamToLeftAid withListener:self];
    [v9 shouldStreamToRightAid];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke_167;
    v11[3] = &unk_2640FD1D0;
    v11[4] = self;
    objc_copyWeak(&v12, &buf);
    [v9 registerUpdateBlock:v11 forRetrieveSelector:sel_shouldStreamToRightAid withListener:self];
    [(AXHearingAidDevice *)self updateInputTagsAndReset:0];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __41__AXHearingAidDevice_connectionDidChange__block_invoke_170;
    v10[3] = &unk_2640FC960;
    v10[4] = self;
    [v9 registerUpdateBlock:v10 forRetrieveSelector:sel_preferredInputEar withListener:self];
    self->_isListeningForStreamingChanges = 1;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&buf);
  }
}

uint64_t __41__AXHearingAidDevice_connectionDidChange__block_invoke(uint64_t a1, int a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isPaired]) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = +[HUHearingAidSettings sharedInstance];
    id v6 = [v5 pairedHearingAids];

    if (!v6)
    {
      if ([*(id *)(a1 + 32) leftAvailable])
      {
        char v7 = [*(id *)(a1 + 32) leftPeripheral];
        v8 = [v7 identifier];

        if (v8)
        {
          uint64_t v9 = [*(id *)(a1 + 32) leftPeripheral];
          uint64_t v10 = [v9 identifier];
          objc_super v11 = [v10 UUIDString];

          [*(id *)(a1 + 32) setLeftPeripheralUUID:v11];
        }
      }
      if ([*(id *)(a1 + 32) rightAvailable])
      {
        id v12 = [*(id *)(a1 + 32) rightPeripheral];
        v13 = [v12 identifier];

        if (v13)
        {
          id v14 = [*(id *)(a1 + 32) rightPeripheral];
          uint64_t v15 = [v14 identifier];
          v16 = [v15 UUIDString];

          [*(id *)(a1 + 32) setRightPeripheralUUID:v16];
        }
      }
      HAInitializeLogging();
      __int16 v17 = NSString;
      BOOL v18 = [*(id *)(a1 + 32) persistentRepresentation];
      uint64_t v19 = [v17 stringWithFormat:@"Paired: %@ - %@", v18, *(void *)(a1 + 32)];

      id v20 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice connectionDidChange]_block_invoke", 774, v19];
      char v21 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v22 = v20;
        uint64_t v23 = v21;
        *(_DWORD *)id buf = 136446210;
        uint64_t v37 = [v22 UTF8String];
        _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      uint64_t v24 = +[HUHearingAidSettings sharedInstance];
      uint64_t v25 = [*(id *)(a1 + 32) persistentRepresentation];
      [v24 setPairedHearingAids:v25];
    }
  }
  [*(id *)(a1 + 32) updateName];
  uint64_t v26 = *(unsigned char **)(a1 + 32);
  if (v26[60])
  {
    uint64_t v27 = [*(id *)(a1 + 32) leftPeripheral];
    [v26 setNotify:1 forPeripheral:v27];

    uint64_t v28 = *(unsigned __int8 **)(a1 + 32);
    uint64_t v29 = v28[60];
    v30 = [v28 rightPeripheral];
    [v28 setNotify:v29 forPeripheral:v30];

    objc_msgSend(*(id *)(a1 + 32), "setLeftLoadedProperties:", objc_msgSend(*(id *)(a1 + 32), "leftLoadedProperties") & 0xFFFFFF007FFEFA3BLL);
    objc_msgSend(*(id *)(a1 + 32), "setRightLoadedProperties:", objc_msgSend(*(id *)(a1 + 32), "rightLoadedProperties") & 0xFFFFFF007FFEFA3BLL);
    v31 = *(void **)(a1 + 32);
    v32 = [v31 leftPeripheral];
    [v31 loadProperties:0xFF800105C4 forPeripheral:v32 withRetryPeriod:0.0];

    v33 = *(void **)(a1 + 32);
    v34 = [v33 rightPeripheral];
    [v33 loadProperties:0xFF800105C4 forPeripheral:v34 withRetryPeriod:0.0];

    uint64_t v26 = *(unsigned char **)(a1 + 32);
  }
  if (([v26 didLoadBasicProperties] & 1) == 0) {
    [*(id *)(a1 + 32) loadBasicProperties];
  }
  uint64_t result = [*(id *)(a1 + 32) isPaired];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) didLoadRequiredProperties];
    if ((result & 1) == 0) {
      return [*(id *)(a1 + 32) loadRequiredProperties];
    }
  }
  return result;
}

void __41__AXHearingAidDevice_connectionDidChange__block_invoke_160(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isPaired]
    && (+[HUHearingAidSettings sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 pairedHearingAids],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    BOOL v4 = +[HUHearingAidSettings sharedInstance];
    int v5 = [v4 preferredInputEar];

    if (v5 == 2)
    {
      id v6 = +[HUHearingAidSettings sharedInstance];
      [v6 setPreferredInputEar:6];
    }
    id v14 = +[AXHearingAidDeviceController sharedController];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = [WeakRetained leftPeripheral];
    [v14 resetConnectionToPeripheral:v8];
  }
  else
  {
    HAInitializeLogging();
    uint64_t v9 = [NSString stringWithFormat:@"Hearing aid isn't paired, but we're changing streaming prefs %@", *(void *)(a1 + 32)];
    uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice connectionDidChange]_block_invoke", 828, v9];
    objc_super v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      v13 = v11;
      *(_DWORD *)id buf = 136446210;
      uint64_t v16 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

void __41__AXHearingAidDevice_connectionDidChange__block_invoke_167(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) isPaired]
    && (+[HUHearingAidSettings sharedInstance],
        v2 = objc_claimAutoreleasedReturnValue(),
        [v2 pairedHearingAids],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    BOOL v4 = +[HUHearingAidSettings sharedInstance];
    int v5 = [v4 preferredInputEar];

    if (v5 == 4)
    {
      id v6 = +[HUHearingAidSettings sharedInstance];
      [v6 setPreferredInputEar:6];
    }
    id v14 = +[AXHearingAidDeviceController sharedController];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = [WeakRetained rightPeripheral];
    [v14 resetConnectionToPeripheral:v8];
  }
  else
  {
    HAInitializeLogging();
    uint64_t v9 = [NSString stringWithFormat:@"Hearing aid isn't paired, but we're changing streaming prefs %@", *(void *)(a1 + 32)];
    uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice connectionDidChange]_block_invoke", 847, v9];
    objc_super v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      v13 = v11;
      *(_DWORD *)id buf = 136446210;
      uint64_t v16 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __41__AXHearingAidDevice_connectionDidChange__block_invoke_170(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInputTagsAndReset:1];
}

- (BOOL)containsPeripheralWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    int v5 = [(AXHearingAidDevice *)self leftPeripheralUUID];
    if ([v5 isEqualToString:v4])
    {
      char v6 = 1;
    }
    else
    {
      char v7 = [(AXHearingAidDevice *)self rightPeripheralUUID];
      if ([v7 isEqualToString:v4])
      {
        char v6 = 1;
      }
      else
      {
        v8 = [(AXHearingAidDevice *)self deviceUUID];
        char v6 = [v8 isEqualToString:v4];
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)deviceUUID
{
  BOOL v3 = [(AXHearingAidDevice *)self leftUUID];
  id v4 = [(AXHearingAidDevice *)self rightUUID];
  int v5 = +[AXHearingAidDevice deviceIDFromLeftID:v3 andRightID:v4];

  return (NSString *)v5;
}

- (BOOL)peripheral:(id)a3 didLoadProperty:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AXHearingAidDevice *)self leftPeripheral];

  if (v7 == v6) {
    unint64_t v8 = [(AXHearingAidDevice *)self leftLoadedProperties];
  }
  else {
    unint64_t v8 = [(AXHearingAidDevice *)self rightLoadedProperties];
  }
  unint64_t v9 = v8;

  return (a4 & ~v9) == 0;
}

- (BOOL)didLoadPersistentProperties
{
  BOOL v3 = [(AXHearingAidDevice *)self name];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  int v5 = [(AXHearingAidDevice *)self deviceUUID];
  uint64_t v6 = [v5 length];

  if (!v6) {
    return 0;
  }
  id v7 = [(AXHearingAidDevice *)self manufacturer];
  unint64_t v8 = [v7 firstObject];
  if ([v8 length])
  {
  }
  else
  {
    unint64_t v9 = [(AXHearingAidDevice *)self manufacturer];
    uint64_t v10 = [v9 lastObject];
    uint64_t v11 = [v10 length];

    if (!v11) {
      return 0;
    }
  }
  id v12 = [(AXHearingAidDevice *)self model];
  v13 = [v12 firstObject];
  if ([v13 length])
  {

    return [(AXHearingAidDevice *)self availableEars] != 0;
  }
  id v14 = [(AXHearingAidDevice *)self model];
  uint64_t v15 = [v14 lastObject];
  uint64_t v16 = [v15 length];

  if (v16) {
    return [(AXHearingAidDevice *)self availableEars] != 0;
  }
  return 0;
}

- (BOOL)didLoadOptionalBasicProperties
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0;
  if ([MEMORY[0x263F472B0] supportsLEA2]) {
    uint64_t v3 = 0x50000000002;
  }
  else {
    uint64_t v3 = 2;
  }
  uint64_t v4 = subPropertiesOfProperty(v3);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __52__AXHearingAidDevice_didLoadOptionalBasicProperties__block_invoke;
  v23[3] = &unk_2640FD1F8;
  v23[4] = self;
  v23[5] = &v28;
  v23[6] = &v24;
  [v4 enumerateObjectsUsingBlock:v23];

  BOOL v5 = [(AXHearingAidDevice *)self leftAvailable];
  uint64_t v6 = (id *)MEMORY[0x263F47290];
  if (v5 && v29[3])
  {
    id v7 = [(AXHearingAidDevice *)self leftPeripheral];
    BOOL v8 = [(AXHearingAidDevice *)self peripheral:v7 didLoadProperty:v29[3]];
  }
  else
  {
    HAInitializeLogging();
    id v7 = [NSString stringWithFormat:@"No optional properties on left"];
    unint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadOptionalBasicProperties]", 929, v7];
    uint64_t v10 = *v6;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 UTF8String];
      *(_DWORD *)id buf = 136446210;
      uint64_t v33 = v11;
      _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    BOOL v8 = 1;
  }

  if ([(AXHearingAidDevice *)self rightAvailable] && v25[3])
  {
    id v12 = [(AXHearingAidDevice *)self rightPeripheral];
    BOOL v13 = [(AXHearingAidDevice *)self peripheral:v12 didLoadProperty:v25[3]];
  }
  else
  {
    HAInitializeLogging();
    id v12 = [NSString stringWithFormat:@"No optional properties on right"];
    id v14 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadOptionalBasicProperties]", 939, v12];
    uint64_t v15 = *v6;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 UTF8String];
      *(_DWORD *)id buf = 136446210;
      uint64_t v33 = v16;
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    BOOL v13 = 1;
  }

  if ([(AXHearingAidDevice *)self leftAvailable]
    || [(AXHearingAidDevice *)self rightAvailable])
  {
    BOOL v17 = v8 & v13;
  }
  else
  {
    BOOL v17 = 0;
  }
  HAInitializeLogging();
  BOOL v18 = [NSString stringWithFormat:@"{%d} LEFT [%d, %d] RIGHT [%d, %d]", v17, -[AXHearingAidDevice leftAvailable](self, "leftAvailable"), v8, -[AXHearingAidDevice rightAvailable](self, "rightAvailable"), v13];
  uint64_t v19 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadOptionalBasicProperties]", 946, v18];
  id v20 = *v6;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [v19 UTF8String];
    *(_DWORD *)id buf = 136446210;
    uint64_t v33 = v21;
    _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  return v17;
}

void __52__AXHearingAidDevice_didLoadOptionalBasicProperties__block_invoke(void *a1, void *a2)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a2 unsignedLongLongValue];
  HAInitializeLogging();
  uint64_t v4 = NSString;
  BOOL v5 = hearingPropertyDescription(v3);
  uint64_t v6 = [v4 stringWithFormat:@"Checking %@", v5];

  id v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadOptionalBasicProperties]_block_invoke", 909, v6];
  BOOL v8 = (os_log_t *)MEMORY[0x263F47290];
  unint64_t v9 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v7;
    uint64_t v11 = v9;
    *(_DWORD *)id buf = 136446210;
    uint64_t v41 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v12 = (void *)a1[4];
  BOOL v13 = [v12 leftPeripheral];
  id v14 = [v12 peripheral:v13 characteristicForProperty:v3];

  if (v14)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) |= v3;
    HAInitializeLogging();
    uint64_t v15 = NSString;
    uint64_t v16 = hearingPropertyDescription(v3);
    BOOL v17 = (void *)a1[4];
    BOOL v18 = [v17 leftPeripheral];
    uint64_t v19 = [v17 peripheral:v18 characteristicForProperty:v3];
    id v20 = [v15 stringWithFormat:@"Adding available %@ - %@", v16, v19];

    uint64_t v21 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadOptionalBasicProperties]_block_invoke", 913, v20];
    os_log_t v22 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v21;
      uint64_t v24 = v22;
      uint64_t v25 = [v23 UTF8String];
      *(_DWORD *)id buf = 136446210;
      uint64_t v41 = v25;
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  uint64_t v26 = (void *)a1[4];
  uint64_t v27 = [v26 rightPeripheral];
  uint64_t v28 = [v26 peripheral:v27 characteristicForProperty:v3];

  if (v28)
  {
    *(void *)(*(void *)(a1[6] + 8) + 24) |= v3;
    HAInitializeLogging();
    uint64_t v29 = NSString;
    uint64_t v30 = hearingPropertyDescription(v3);
    uint64_t v31 = (void *)a1[4];
    v32 = [v31 rightPeripheral];
    uint64_t v33 = [v31 peripheral:v32 characteristicForProperty:v3];
    uint64_t v34 = [v29 stringWithFormat:@"Adding available %@ - %@", v30, v33];

    v35 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadOptionalBasicProperties]_block_invoke", 918, v34];
    os_log_t v36 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      id v37 = v35;
      uint64_t v38 = v36;
      uint64_t v39 = [v37 UTF8String];
      *(_DWORD *)id buf = 136446210;
      uint64_t v41 = v39;
      _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (BOOL)didLoadBasicProperties
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if ([(AXHearingAidDevice *)self leftAvailable]
    || [(AXHearingAidDevice *)self rightAvailable])
  {
    BOOL v3 = [(AXHearingAidDevice *)self leftAvailable];
    uint64_t v4 = [(AXHearingAidDevice *)self leftPeripheral];
    if (v3 == [(AXHearingAidDevice *)self peripheral:v4 didLoadProperty:56])
    {
      BOOL v5 = [(AXHearingAidDevice *)self rightAvailable];
      uint64_t v6 = [(AXHearingAidDevice *)self rightPeripheral];
      BOOL v7 = v5 == [(AXHearingAidDevice *)self peripheral:v6 didLoadProperty:56]
        && [(AXHearingAidDevice *)self didLoadOptionalBasicProperties];
      BOOL v32 = v7;
    }
    else
    {
      BOOL v32 = 0;
    }
  }
  else
  {
    BOOL v32 = 0;
  }
  HAInitializeLogging();
  uint64_t v29 = NSString;
  BOOL v28 = [(AXHearingAidDevice *)self leftAvailable];
  uint64_t v31 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v26 = [(AXHearingAidDevice *)self peripheral:v31 didLoadProperty:8];
  uint64_t v30 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v24 = [(AXHearingAidDevice *)self peripheral:v30 didLoadProperty:16];
  uint64_t v27 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v23 = [(AXHearingAidDevice *)self peripheral:v27 didLoadProperty:32];
  uint64_t v25 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v8 = [(AXHearingAidDevice *)self peripheral:v25 didLoadProperty:0x100000000000];
  BOOL v9 = [(AXHearingAidDevice *)self rightAvailable];
  id v10 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v11 = [(AXHearingAidDevice *)self peripheral:v10 didLoadProperty:8];
  id v12 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v13 = [(AXHearingAidDevice *)self peripheral:v12 didLoadProperty:16];
  id v14 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v15 = [(AXHearingAidDevice *)self peripheral:v14 didLoadProperty:32];
  uint64_t v16 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v17 = [v29 stringWithFormat:@"{%d} LEFT [%d]: (%d, %d, %d, %d) RIGHT [%d]: (%d, %d, %d, %d)", v32, v28, v26, v24, v23, v8, v9, v11, v13, v15, -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v16, 0x100000000000)];

  BOOL v18 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadBasicProperties]", 969, v17];
  uint64_t v19 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v20 = v18;
    uint64_t v21 = v19;
    *(_DWORD *)id buf = 136446210;
    uint64_t v34 = [v20 UTF8String];
    _os_log_impl(&dword_20CC86000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return v32;
}

- (BOOL)didLoadRequiredProperties
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([(AXHearingAidDevice *)self leftAvailable]
    || [(AXHearingAidDevice *)self rightAvailable])
  {
    BOOL v3 = [(AXHearingAidDevice *)self leftAvailable];
    uint64_t v4 = [(AXHearingAidDevice *)self leftPeripheral];
    if (v3 == [(AXHearingAidDevice *)self peripheral:v4 didLoadProperty:[(AXHearingAidDevice *)self requiredProperties]])
    {
      BOOL v5 = [(AXHearingAidDevice *)self rightAvailable];
      uint64_t v6 = [(AXHearingAidDevice *)self rightPeripheral];
      uint64_t v32 = v5 ^ [(AXHearingAidDevice *)self peripheral:v6 didLoadProperty:[(AXHearingAidDevice *)self requiredProperties]] ^ 1;
    }
    else
    {
      uint64_t v32 = 0;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }
  HAInitializeLogging();
  uint64_t v31 = NSString;
  BOOL v30 = [(AXHearingAidDevice *)self leftAvailable];
  id v37 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v29 = [(AXHearingAidDevice *)self peripheral:v37 didLoadProperty:56];
  os_log_t v36 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v28 = [(AXHearingAidDevice *)self peripheral:v36 didLoadProperty:4];
  uint64_t v35 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v27 = [(AXHearingAidDevice *)self peripheral:v35 didLoadProperty:64];
  uint64_t v34 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v26 = [(AXHearingAidDevice *)self peripheral:v34 didLoadProperty:256];
  uint64_t v33 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v25 = [(AXHearingAidDevice *)self peripheral:v33 didLoadProperty:1024];
  BOOL v24 = [(AXHearingAidDevice *)self rightAvailable];
  BOOL v7 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v8 = [(AXHearingAidDevice *)self peripheral:v7 didLoadProperty:56];
  BOOL v9 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v10 = [(AXHearingAidDevice *)self peripheral:v9 didLoadProperty:4];
  BOOL v11 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v12 = [(AXHearingAidDevice *)self peripheral:v11 didLoadProperty:64];
  BOOL v13 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v14 = [(AXHearingAidDevice *)self peripheral:v13 didLoadProperty:256];
  BOOL v15 = [(AXHearingAidDevice *)self rightPeripheral];
  uint64_t v16 = [v31 stringWithFormat:@"{%d} LEFT [%d]: (%d, %d, %d, %d, %d) RIGHT [%d]: (%d, %d, %d, %d, %d)", v32, v30, v29, v28, v27, v26, v25, v24, v8, v10, v12, v14, -[AXHearingAidDevice peripheral:didLoadProperty:](self, "peripheral:didLoadProperty:", v15, 1024)];

  BOOL v17 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice didLoadRequiredProperties]", 980, v16];
  BOOL v18 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v17;
    id v20 = v18;
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = [v19 UTF8String];
    _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x2020000000;
  BOOL v21 = 1;
  char v41 = 1;
  if ((v32 & 1) == 0)
  {
    os_log_t v22 = [(id)objc_opt_class() characteristicsUUIDs];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __47__AXHearingAidDevice_didLoadRequiredProperties__block_invoke;
    v38[3] = &unk_2640FD220;
    v38[4] = self;
    v38[5] = &buf;
    [v22 enumerateKeysAndObjectsUsingBlock:v38];

    BOOL v21 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;
  }
  _Block_object_dispose(&buf, 8);
  return v21;
}

void __47__AXHearingAidDevice_didLoadRequiredProperties__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v17 = a2;
  uint64_t v6 = [v17 unsignedLongLongValue];
  if ((v6 & ~[*(id *)(a1 + 32) requiredProperties]) == 0)
  {
    if ([*(id *)(a1 + 32) leftAvailable])
    {
      BOOL v7 = *(void **)(a1 + 32);
      BOOL v8 = [v7 leftPeripheral];
      if ([v7 peripheral:v8 didLoadProperty:v6])
      {
      }
      else
      {
        BOOL v9 = [*(id *)(a1 + 32) leftPropertiesLoadCount];
        BOOL v10 = [v9 objectForKey:v17];
        int v11 = [v10 intValue];

        if (v11 <= 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
    if ([*(id *)(a1 + 32) rightAvailable])
    {
      BOOL v12 = *(void **)(a1 + 32);
      BOOL v13 = [v12 rightPeripheral];
      if ([v12 peripheral:v13 didLoadProperty:v6])
      {
      }
      else
      {
        BOOL v14 = [*(id *)(a1 + 32) rightPropertiesLoadCount];
        BOOL v15 = [v14 objectForKey:v17];
        int v16 = [v15 intValue];

        if (v16 <= 2)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          *a4 = 1;
        }
      }
    }
  }
}

- (void)mateWithDevice:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  BOOL v5 = [NSString stringWithFormat:@"MATE: self: %@ other %@", self, v4];
  uint64_t v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice mateWithDevice:]", 1009, v5];
  BOOL v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    BOOL v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v19 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  if (!v4) {
    goto LABEL_10;
  }
  BOOL v10 = [(AXHearingAidDevice *)self leftUUID];
  int v11 = [v4 leftUUID];
  if (![v10 isEqualToString:v11]) {
    goto LABEL_9;
  }
  BOOL v12 = [(AXHearingAidDevice *)self rightUUID];
  BOOL v13 = [v4 rightUUID];
  if (![v12 isEqualToString:v13])
  {

LABEL_9:
    goto LABEL_10;
  }
  int v14 = [(AXHearingAidDevice *)self leftAvailable];
  if (v14 != [v4 leftAvailable])
  {

LABEL_13:
    BOOL v15 = +[AXHearingAidDeviceController sharedController];
    [v15 mergeDevice:self withDevice:v4];
    goto LABEL_11;
  }
  int v16 = [(AXHearingAidDevice *)self rightAvailable];
  int v17 = [v4 rightAvailable];

  if (v16 != v17) {
    goto LABEL_13;
  }
LABEL_10:
  BOOL v15 = +[AXHearingAidDeviceController sharedController];
  [v15 replaceDevice:v4 withDevice:self];
LABEL_11:
}

- (BOOL)leftAvailable
{
  v2 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)rightAvailable
{
  v2 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isLeftConnected
{
  v2 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v3 = [v2 state] == 2;

  return v3;
}

- (BOOL)isRightConnected
{
  v2 = [(AXHearingAidDevice *)self rightPeripheral];
  BOOL v3 = [v2 state] == 2;

  return v3;
}

- (BOOL)isConnected
{
  BOOL v3 = [(AXHearingAidDevice *)self leftPeripheral];
  uint64_t v4 = [v3 state];

  BOOL v5 = [(AXHearingAidDevice *)self rightPeripheral];
  uint64_t v6 = [v5 state];

  if ([(AXHearingAidDevice *)self leftAvailable]
    || (BOOL v7 = [(AXHearingAidDevice *)self rightAvailable]))
  {
    if ((v4 != 2) == [(AXHearingAidDevice *)self leftAvailable]) {
      LOBYTE(v7) = 0;
    }
    else {
      LOBYTE(v7) = (v6 != 2) ^ [(AXHearingAidDevice *)self rightAvailable];
    }
  }
  return v7;
}

- (BOOL)hasConnection
{
  BOOL v3 = [(AXHearingAidDevice *)self leftPeripheral];
  uint64_t v4 = [v3 state];

  BOOL v5 = [(AXHearingAidDevice *)self rightPeripheral];
  uint64_t v6 = [v5 state];

  return v4 == 2 || v6 == 2;
}

- (BOOL)isAnyPeripheralInConnectingState
{
  BOOL v3 = [(AXHearingAidDevice *)self leftPeripheral];
  uint64_t v4 = [v3 state];

  BOOL v5 = [(AXHearingAidDevice *)self rightPeripheral];
  uint64_t v6 = [v5 state];

  return v4 == 1 || v6 == 1;
}

- (int)connectedEars
{
  BOOL v3 = [(AXHearingAidDevice *)self leftPeripheral];
  BOOL v4 = [v3 state] == 2;

  BOOL v5 = [(AXHearingAidDevice *)self rightPeripheral];
  uint64_t v6 = [v5 state];

  if (v6 == 2) {
    return (2 * v4) | 4;
  }
  else {
    return 2 * v4;
  }
}

- (id)programs
{
  BOOL v3 = [(AXHearingAidDevice *)self leftPrograms];
  BOOL v4 = [(AXHearingAidDevice *)self rightPrograms];
  BOOL v5 = [v3 arrayByAddingObjectsFromArray:v4];
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_5];

  return v6;
}

uint64_t __30__AXHearingAidDevice_programs__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (unint64_t)peripheral:(id)a3 propertyForCharacteristic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x2020000000;
  uint64_t v17 = 2;
  unsigned int v7 = [(id)objc_opt_class() characteristicsUUIDs];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__AXHearingAidDevice_peripheral_propertyForCharacteristic___block_invoke;
  v11[3] = &unk_2640FD220;
  id v8 = v6;
  id v12 = v8;
  BOOL v13 = &v14;
  [v7 enumerateKeysAndObjectsUsingBlock:v11];

  unint64_t v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __59__AXHearingAidDevice_peripheral_propertyForCharacteristic___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  unsigned int v7 = *(void **)(a1 + 32);
  id v8 = a3;
  unint64_t v9 = [v7 UUID];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v11 unsignedLongLongValue];
    *a4 = 1;
  }
}

- (id)peripheral:(id)a3 characteristicForProperty:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() characteristicsUUIDs];
  unsigned int v7 = [NSNumber numberWithUnsignedLongLong:a4];
  id v8 = [v6 objectForKey:v7];

  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  uint64_t v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  unint64_t v9 = [v5 services];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke;
  v13[3] = &unk_2640FD290;
  id v10 = v8;
  id v14 = v10;
  BOOL v15 = &v16;
  [v9 enumerateObjectsUsingBlock:v13];

  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

void __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke_2;
  v9[3] = &unk_2640FD268;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __59__AXHearingAidDevice_peripheral_characteristicForProperty___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 UUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

- (unint64_t)availablePropertiesForPeripheral:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  unint64_t v5 = 2;
  uint64_t v14 = 2;
  if (v4)
  {
    id v6 = [(id)objc_opt_class() characteristicsUUIDs];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__AXHearingAidDevice_availablePropertiesForPeripheral___block_invoke;
    v8[3] = &unk_2640FD2B8;
    v8[4] = self;
    id v9 = v4;
    id v10 = &v11;
    [v6 enumerateKeysAndObjectsUsingBlock:v8];

    unint64_t v5 = v12[3];
  }
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __55__AXHearingAidDevice_availablePropertiesForPeripheral___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedLongLongValue];
  id v4 = [*(id *)(a1 + 32) peripheral:*(void *)(a1 + 40) characteristicForProperty:v3];

  if (v4) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v3;
  }
}

- (id)peripheral:(id)a3 characteristicForUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v14 = 0;
  BOOL v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__0;
  uint64_t v18 = __Block_byref_object_dispose__0;
  id v19 = 0;
  id v7 = [v5 services];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke;
  v11[3] = &unk_2640FD290;
  id v8 = v6;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];

  id v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke_2;
  v9[3] = &unk_2640FD268;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __55__AXHearingAidDevice_peripheral_characteristicForUUID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 UUID];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;
  }
}

- (void)setNotify:(BOOL)a3 forPeripheral:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    HAInitializeLogging();
    id v7 = NSString;
    int v8 = [v6 services];
    id v9 = [v7 stringWithFormat:@"Setting notify %d for peripheral: %@ - %@", v4, v6, v8];

    id v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice setNotify:forPeripheral:]", 1166, v9];
    uint64_t v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      uint64_t v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v19 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v14 = [v6 services];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke;
    v15[3] = &unk_2640FD308;
    v15[4] = self;
    id v16 = v6;
    BOOL v17 = v4;
    [v14 enumerateObjectsUsingBlock:v15];
  }
}

void __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 characteristics];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke_2;
  v5[3] = &unk_2640FD2E0;
  BOOL v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  char v7 = *(unsigned char *)(a1 + 48);
  [v3 enumerateObjectsUsingBlock:v5];
}

void __46__AXHearingAidDevice_setNotify_forPeripheral___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "peripheral:propertyForCharacteristic:", *(void *)(a1 + 40)) & 0xFFFFFE007FFDFB3BLL) == 0) {
    [*(id *)(a1 + 40) setNotifyValue:*(unsigned __int8 *)(a1 + 48) forCharacteristic:v3];
  }
}

- (void)setKeepInSync:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_keepInSync != a3)
  {
    BOOL v3 = a3;
    self->_BOOL keepInSync = a3;
    id v5 = [(AXHearingAidDevice *)self leftPeripheral];
    [(AXHearingAidDevice *)self setNotify:v3 forPeripheral:v5];

    BOOL keepInSync = self->_keepInSync;
    char v7 = [(AXHearingAidDevice *)self rightPeripheral];
    [(AXHearingAidDevice *)self setNotify:keepInSync forPeripheral:v7];

    if (self->_keepInSync)
    {
      [(AXHearingAidDevice *)self loadFailedProperties];
      if (![(AXHearingAidDevice *)self didLoadRequiredProperties])
      {
        HAInitializeLogging();
        int v8 = [NSString stringWithFormat:@"Not completely loaded, trying again"];
        id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice setKeepInSync:]", 1195, v8];
        id v10 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v9;
          id v12 = v10;
          *(_DWORD *)long long buf = 136446210;
          uint64_t v14 = [v11 UTF8String];
          _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
        [(AXHearingAidDevice *)self loadRequiredProperties];
      }
    }
  }
}

- (void)loadProperties:(unint64_t)a3 forPeripheral:(id)a4 withRetryPeriod:(double)a5
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = v8;
  if (a3 != 2 && v8)
  {
    HAInitializeLogging();
    id v10 = NSString;
    id v11 = hearingPropertyDescription(a3);
    id v12 = [v10 stringWithFormat:@"Loading %@ for %@", v11, v9];

    uint64_t v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:]", 1206, v12];
    uint64_t v14 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      id v16 = v14;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v15 UTF8String];
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v35 = 0x2020000000;
    char v36 = 0;
    BOOL v17 = [(AXHearingAidDevice *)self leftPeripheral];
    if (v17 == v9) {
      [(AXHearingAidDevice *)self leftPropertiesLoadCount];
    }
    else {
    uint64_t v18 = [(AXHearingAidDevice *)self rightPropertiesLoadCount];
    }

    uint64_t v19 = [v9 services];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke;
    v28[3] = &unk_2640FD358;
    id v20 = v9;
    id v29 = v20;
    BOOL v30 = self;
    id v21 = v18;
    id v31 = v21;
    p_long long buf = &buf;
    unint64_t v33 = a3;
    [v19 enumerateObjectsUsingBlock:v28];

    if (a5 > 0.0 && *(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      dispatch_time_t v22 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      BOOL v23 = dispatch_get_global_queue(-32768, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_213;
      block[3] = &unk_2640FD380;
      block[4] = self;
      unint64_t v26 = a3;
      id v25 = v20;
      double v27 = a5;
      dispatch_after(v22, v23, block);
    }
    _Block_object_dispose(&buf, 8);
  }
}

void __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 characteristics];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_2;
  v9[3] = &unk_2640FD330;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = v8;
  id v12 = v7;
  [v3 enumerateObjectsUsingBlock:v9];
}

void __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) leftPeripheral];
  id v6 = *(void **)(a1 + 40);
  if (v4 == v5) {
    uint64_t v7 = [v6 leftLoadedProperties];
  }
  else {
    uint64_t v7 = [v6 rightLoadedProperties];
  }
  uint64_t v8 = v7;

  uint64_t v9 = [*(id *)(a1 + 40) peripheral:*(void *)(a1 + 32) propertyForCharacteristic:v3];
  id v10 = *(void **)(a1 + 48);
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:v9];
  id v12 = [v10 objectForKey:v11];
  uint64_t v13 = [v12 intValue];

  if (v9 == 2
    || (v9 & ~*(void *)(a1 + 64)) != 0
    || ([*(id *)(a1 + 40) peripheral:*(void *)(a1 + 32) didLoadProperty:v9] & 1) != 0)
  {
    HAInitializeLogging();
    uint64_t v14 = NSString;
    id v15 = hearingPropertyDescription(v9);
    unsigned int v16 = [*(id *)(a1 + 40) peripheral:*(void *)(a1 + 32) didLoadProperty:v9];
    BOOL v17 = hearingPropertyDescription(v8);
    uint64_t v18 = [v14 stringWithFormat:@"Not loading %@, %d, %d - %@ = %@", v15, v13, v16, v3, v17];

    uint64_t v19 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice loadProperties:forPeripheral:withRetryPeriod:]_block_invoke_2", 1224, v18];
    id v20 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v19;
      dispatch_time_t v22 = v20;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = [v21 UTF8String];
      _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    BOOL v23 = *(void **)(a1 + 48);
    BOOL v24 = [NSNumber numberWithInt:(v13 + 1)];
    id v25 = [NSNumber numberWithUnsignedLongLong:v9];
    [v23 setObject:v24 forKey:v25];

    [*(id *)(a1 + 40) readValueForCharacteristic:v3 fromPeripheral:*(void *)(a1 + 32)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (v9 & 0xFFFFFF007FFEFA3BLL) != 0;
  }
}

uint64_t __67__AXHearingAidDevice_loadProperties_forPeripheral_withRetryPeriod___block_invoke_213(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadProperties:*(void *)(a1 + 48) forPeripheral:*(void *)(a1 + 40) withRetryPeriod:*(double *)(a1 + 56)];
}

- (void)loadBasicProperties
{
  if (!self->_finishedLoading)
  {
    id v3 = [(AXHearingAidDevice *)self leftPeripheral];
    [(AXHearingAidDevice *)self loadProperties:0x5000000003ALL forPeripheral:v3 withRetryPeriod:0.0];

    id v4 = [(AXHearingAidDevice *)self rightPeripheral];
    [(AXHearingAidDevice *)self loadProperties:0x5000000003ALL forPeripheral:v4 withRetryPeriod:0.0];
  }
}

- (void)loadRequiredProperties
{
  id v3 = +[AXHearingAidDeviceController sharedController];
  id v4 = [(AXHearingAidDevice *)self leftPeripheral];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__AXHearingAidDevice_loadRequiredProperties__block_invoke;
  v8[3] = &unk_2640FCA50;
  v8[4] = self;
  [v3 checkPeripheralPaired:v4 withCompletion:v8];

  uint64_t v5 = +[AXHearingAidDeviceController sharedController];
  id v6 = [(AXHearingAidDevice *)self rightPeripheral];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__AXHearingAidDevice_loadRequiredProperties__block_invoke_218;
  v7[3] = &unk_2640FCA50;
  v7[4] = self;
  [v5 checkPeripheralPaired:v6 withCompletion:v7];
}

void __44__AXHearingAidDevice_loadRequiredProperties__block_invoke(uint64_t a1, int a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  char v4 = [*(id *)(a1 + 32) isPaired];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 leftPeripheral];
  id v33 = (id)v6;
  if ((v4 & 1) != 0 || a2)
  {
    char v7 = objc_msgSend(v5, "peripheral:didLoadProperty:", v6, objc_msgSend(*(id *)(a1 + 32), "requiredProperties"));

    if ((v7 & 1) == 0)
    {
      HAInitializeLogging();
      uint64_t v32 = NSString;
      id v31 = [*(id *)(a1 + 32) leftPeripheral];
      uint64_t v8 = *(void **)(a1 + 32);
      id v34 = [v8 leftPeripheral];
      unsigned int v30 = [v8 peripheral:v34 didLoadProperty:56];
      uint64_t v9 = *(void **)(a1 + 32);
      id v10 = [v9 leftPeripheral];
      unsigned int v29 = [v9 peripheral:v10 didLoadProperty:4];
      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = [v11 leftPeripheral];
      unsigned int v13 = [v11 peripheral:v12 didLoadProperty:64];
      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = [v14 leftPeripheral];
      unsigned int v16 = [v14 peripheral:v15 didLoadProperty:128];
      BOOL v17 = *(void **)(a1 + 32);
      uint64_t v18 = [v17 leftPeripheral];
      LODWORD(v17) = [v17 peripheral:v18 didLoadProperty:256];
      uint64_t v19 = *(void **)(a1 + 32);
      id v20 = [v19 leftPeripheral];
      id v21 = [v32 stringWithFormat:@"Loading required properties for %@ - (%d, %d, %d, %d, %d, %d)", v31, v30, v29, v13, v16, v17, objc_msgSend(v19, "peripheral:didLoadProperty:", v20, 1024)];

      dispatch_time_t v22 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice loadRequiredProperties]_block_invoke", 1262, v21];
      BOOL v23 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v22;
        id v25 = v23;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v36 = [v24 UTF8String];
        _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      unint64_t v26 = *(void **)(a1 + 32);
      uint64_t v27 = [v26 requiredProperties];
      uint64_t v28 = [*(id *)(a1 + 32) leftPeripheral];
      [v26 loadProperties:v27 forPeripheral:v28 withRetryPeriod:10.0];
    }
  }
  else
  {
    [v5 loadProperties:64 forPeripheral:v6 withRetryPeriod:0.0];
  }
}

void __44__AXHearingAidDevice_loadRequiredProperties__block_invoke_218(uint64_t a1, int a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  char v4 = [*(id *)(a1 + 32) isPaired];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 rightPeripheral];
  id v33 = (id)v6;
  if ((v4 & 1) != 0 || a2)
  {
    char v7 = objc_msgSend(v5, "peripheral:didLoadProperty:", v6, objc_msgSend(*(id *)(a1 + 32), "requiredProperties"));

    if ((v7 & 1) == 0)
    {
      HAInitializeLogging();
      uint64_t v32 = NSString;
      id v31 = [*(id *)(a1 + 32) rightPeripheral];
      uint64_t v8 = *(void **)(a1 + 32);
      id v34 = [v8 rightPeripheral];
      unsigned int v30 = [v8 peripheral:v34 didLoadProperty:56];
      uint64_t v9 = *(void **)(a1 + 32);
      id v10 = [v9 rightPeripheral];
      unsigned int v29 = [v9 peripheral:v10 didLoadProperty:4];
      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = [v11 rightPeripheral];
      unsigned int v13 = [v11 peripheral:v12 didLoadProperty:64];
      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = [v14 rightPeripheral];
      unsigned int v16 = [v14 peripheral:v15 didLoadProperty:128];
      BOOL v17 = *(void **)(a1 + 32);
      uint64_t v18 = [v17 rightPeripheral];
      LODWORD(v17) = [v17 peripheral:v18 didLoadProperty:256];
      uint64_t v19 = *(void **)(a1 + 32);
      id v20 = [v19 rightPeripheral];
      id v21 = [v32 stringWithFormat:@"Loading required properties for %@ - (%d, %d, %d, %d, %d, %d)", v31, v30, v29, v13, v16, v17, objc_msgSend(v19, "peripheral:didLoadProperty:", v20, 1024)];

      dispatch_time_t v22 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice loadRequiredProperties]_block_invoke", 1278, v21];
      BOOL v23 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v24 = v22;
        id v25 = v23;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v36 = [v24 UTF8String];
        _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      unint64_t v26 = *(void **)(a1 + 32);
      uint64_t v27 = [v26 requiredProperties];
      uint64_t v28 = [*(id *)(a1 + 32) rightPeripheral];
      [v26 loadProperties:v27 forPeripheral:v28 withRetryPeriod:10.0];
    }
  }
  else
  {
    [v5 loadProperties:64 forPeripheral:v6 withRetryPeriod:0.0];
  }
}

- (void)loadFailedProperties
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ([(AXHearingAidDevice *)self isPaired])
  {
    uint64_t v22 = 0;
    BOOL v23 = &v22;
    uint64_t v24 = 0x2020000000;
    uint64_t v25 = 2;
    id v3 = [(AXHearingAidDevice *)self leftPropertiesLoadCount];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __42__AXHearingAidDevice_loadFailedProperties__block_invoke;
    v21[3] = &unk_2640FD220;
    v21[4] = self;
    v21[5] = &v22;
    [v3 enumerateKeysAndObjectsUsingBlock:v21];

    uint64_t v4 = v23[3];
    uint64_t v5 = [(AXHearingAidDevice *)self leftPeripheral];
    [(AXHearingAidDevice *)self loadProperties:v4 forPeripheral:v5 withRetryPeriod:0.0];

    uint64_t v17 = 0;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 2;
    uint64_t v6 = [(AXHearingAidDevice *)self rightPropertiesLoadCount];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __42__AXHearingAidDevice_loadFailedProperties__block_invoke_2;
    v16[3] = &unk_2640FD220;
    v16[4] = self;
    v16[5] = &v17;
    [v6 enumerateKeysAndObjectsUsingBlock:v16];

    uint64_t v7 = v18[3];
    uint64_t v8 = [(AXHearingAidDevice *)self rightPeripheral];
    [(AXHearingAidDevice *)self loadProperties:v7 forPeripheral:v8 withRetryPeriod:0.0];

    HAInitializeLogging();
    uint64_t v9 = NSString;
    id v10 = hearingPropertyDescription(v23[3]);
    uint64_t v11 = hearingPropertyDescription(v18[3]);
    id v12 = [v9 stringWithFormat:@"(%@ - %@)", v10, v11];

    unsigned int v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice loadFailedProperties]", 1316, v12];
    uint64_t v14 = (id)*MEMORY[0x263F47290];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v13 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = v15;
      _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v22, 8);
  }
}

void __42__AXHearingAidDevice_loadFailedProperties__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = [a2 unsignedLongLongValue];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 leftPeripheral];
  if ([v6 peripheral:v7 didLoadProperty:v5])
  {
  }
  else
  {
    int v8 = [v9 intValue];

    if (v8 >= 3) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    }
  }
}

void __42__AXHearingAidDevice_loadFailedProperties__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  uint64_t v5 = [a2 unsignedLongLongValue];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 rightPeripheral];
  if ([v6 peripheral:v7 didLoadProperty:v5])
  {
  }
  else
  {
    int v8 = [v9 intValue];

    if (v8 >= 3) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v5;
    }
  }
}

- (BOOL)deviceSupportsProperty:(unint64_t)a3
{
  if ([(AXHearingAidDevice *)self leftAvailable])
  {
    uint64_t v5 = [(AXHearingAidDevice *)self leftPeripheral];
    uint64_t v6 = [(AXHearingAidDevice *)self peripheral:v5 characteristicForProperty:a3];

    BOOL v7 = [(AXHearingAidDevice *)self rightAvailable];
    if (v6) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = v7;
    }
    if (v7 && !v6)
    {
      id v9 = [(AXHearingAidDevice *)self rightPeripheral];
      id v10 = [(AXHearingAidDevice *)self peripheral:v9 characteristicForProperty:a3];
      BOOL v8 = v10 != 0;
    }
  }
  else
  {
    [(AXHearingAidDevice *)self rightAvailable];
    return 1;
  }
  return v8;
}

- (void)updateName
{
}

- (void)updateNameWithAdvertisingData:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(AXHearingAidDevice *)self rightPeripheral];
  uint64_t v5 = [v4 name];

  if (![(AXHearingAidDevice *)self rightAvailable]
    && [(AXHearingAidDevice *)self leftAvailable])
  {
    uint64_t v6 = [(AXHearingAidDevice *)self leftPeripheral];
    uint64_t v7 = [v6 name];

    uint64_t v5 = (void *)v7;
  }
  if ([v5 length])
  {
    BOOL v8 = [MEMORY[0x263F08708] newlineCharacterSet];
    uint64_t v9 = [v5 stringByTrimmingCharactersInSet:v8];

    [(AXHearingAidDevice *)self setName:v9];
    id v10 = +[AXHearingAidDeviceController sharedController];
    [v10 device:self didUpdateProperty:0x40000];

    uint64_t v5 = (void *)v9;
  }
  HAInitializeLogging();
  uint64_t v11 = [NSString stringWithFormat:@"New name: %@", v5];
  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice updateNameWithAdvertisingData:]", 1355, v11];
  unsigned int v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    uint64_t v15 = v13;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v17 = [v14 UTF8String];
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)updateBatteryServiceForPeripheral:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AXHearingAidDevice *)self rightPeripheral];

    uint64_t v6 = 88;
    if (v5 == v4) {
      uint64_t v6 = 96;
    }
    uint64_t v7 = *(OpaqueIOPSPowerSourceID **)((char *)&self->super.isa + v6);
    if ([v4 state] == 2)
    {
      if (!v7)
      {
        uint64_t v8 = IOPSCreatePowerSource();
        if (v8)
        {
          uint64_t v9 = v8;
          HAInitializeLogging();
          id v10 = [NSString stringWithFormat:@"Failed to initialize the power source for peripheral \"%@\": 0x%X", v4, v9];
          uint64_t v11 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice updateBatteryServiceForPeripheral:]", 1373, v10];
          id v12 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v13 = v11;
            id v14 = v12;
            *(_DWORD *)long long buf = 136446210;
            uint64_t v43 = [v13 UTF8String];
            _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          }
        }
        else if (v5 == v4)
        {
          self->_rightPowerSourceID = v7;
        }
        else
        {
          self->_leftPowerSouceID = v7;
        }
      }
      if (v5 == v4) {
        uint64_t v15 = 112;
      }
      else {
        uint64_t v15 = 104;
      }
      unsigned int v16 = (objc_class *)*(id *)((char *)&self->super.isa + v15);
      if (!v16)
      {
        unsigned int v16 = (objc_class *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v17 = *(Class *)((char *)&self->super.isa + v15);
        *(Class *)((char *)&self->super.isa + v15) = v16;
      }
      uint64_t v18 = [(AXHearingAidDevice *)self name];
      if ([v18 length]) {
        [(AXHearingAidDevice *)self name];
      }
      else {
      uint64_t v19 = hearingLocString(@"HearingAidLabel");
      }

      uint64_t v20 = NSString;
      if (v5 == v4)
      {
        BOOL v23 = hearingLocString(@"RightHearingAidLabel");
        uint64_t v22 = [v20 stringWithFormat:@"%@ %@", v19, v23];

        [(AXHearingAidDevice *)self rightPeripheralUUID];
      }
      else
      {
        id v21 = hearingLocString(@"LeftHearingAidLabel");
        uint64_t v22 = [v20 stringWithFormat:@"%@ %@", v19, v21];

        [(AXHearingAidDevice *)self leftPeripheralUUID];
      uint64_t v24 = };
      uint64_t v25 = [(AXHearingAidDevice *)self deviceUUID];
      if ([v24 length] && objc_msgSend(v25, "length"))
      {
        v40[0] = @"Type";
        v40[1] = @"Transport Type";
        v41[0] = @"Accessory Source";
        v41[1] = @"Bluetooth LE";
        v40[2] = @"Accessory Identifier";
        v40[3] = @"Max Capacity";
        v41[2] = v24;
        v41[3] = &unk_26C1E5528;
        v40[4] = @"Part Name";
        v40[5] = @"Name";
        v41[4] = v22;
        v41[5] = v19;
        v41[6] = v25;
        v40[6] = @"Group Identifier";
        v40[7] = @"Current Capacity";
        unint64_t v26 = NSNumber;
        if (v5 == v4)
        {
          [(AXHearingAidDevice *)self rightBatteryLevel];
          uint64_t v28 = @"Right";
        }
        else
        {
          [(AXHearingAidDevice *)self leftBatteryLevel];
          uint64_t v28 = @"Left";
        }
        id v34 = [v26 numberWithDouble:v27 * 10.0];
        v41[7] = v34;
        v41[8] = @"Battery Power";
        v40[8] = @"Power Source State";
        v40[9] = @"Accessory Category";
        v40[10] = @"Part Identifier";
        v41[9] = @"HearingAid";
        v41[10] = v28;
        uint64_t v35 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:11];
        [(objc_class *)v16 setDictionary:v35];

        uint64_t v36 = IOPSSetPowerSourceDetails();
        if (!v36) {
          goto LABEL_40;
        }
        uint64_t v37 = v36;
        HAInitializeLogging();
        unsigned int v29 = [NSString stringWithFormat:@"Failed to update the power source for peripheral \"%@\": 0x%X - %@", v4, v37, v16];
        id v30 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice updateBatteryServiceForPeripheral:]", 1424, v29];
        uint64_t v38 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v30;
          uint64_t v32 = v38;
          uint64_t v39 = [v30 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v43 = v39;
          goto LABEL_38;
        }
      }
      else
      {
        HAInitializeLogging();
        unsigned int v29 = [NSString stringWithFormat:@"Failed to update the power source with periperalUUID %@ and deviceUUID %@", v24, v25];
        id v30 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice updateBatteryServiceForPeripheral:]", 1429, v29];
        id v31 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
          id v30 = v30;
          uint64_t v32 = v31;
          uint64_t v33 = [v30 UTF8String];
          *(_DWORD *)long long buf = 136446210;
          uint64_t v43 = v33;
LABEL_38:
          _os_log_impl(&dword_20CC86000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
      }

LABEL_40:
      goto LABEL_41;
    }
    if (v7)
    {
      IOPSReleasePowerSource();
      if (v5 == v4) {
        self->_rightPowerSourceID = 0;
      }
      else {
        self->_leftPowerSouceID = 0;
      }
    }
  }
LABEL_41:
}

- (void)watchWristOrientationDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  id v5 = [NSString stringWithFormat:@"Wrist orientation changed %@", v4];

  uint64_t v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice watchWristOrientationDidChange:]", 1453, v5];
  uint64_t v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    uint64_t v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AXHearingAidDevice *)self updateInputTagsAndReset:1];
}

- (void)updateInputTagsAndReset:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AXHearingAidDevice *)self isPaired]
    && [MEMORY[0x263F472B0] supportsLEA2])
  {
    id v18 = [MEMORY[0x263EFF980] array];
    id v5 = [MEMORY[0x263EFF980] array];
    uint64_t v6 = +[HUHearingAidSettings sharedInstance];
    int v7 = [v6 preferredInputEar];

    switch(v7)
    {
      case 0:
LABEL_4:
        id v8 = [(AXHearingAidDevice *)self leftPeripheral];
        uint64_t v9 = v18;
        goto LABEL_8;
      case 2:
LABEL_7:
        id v8 = [(AXHearingAidDevice *)self leftPeripheral];
        uint64_t v9 = v5;
LABEL_8:
        [v9 hcSafeAddObject:v8];

        id v10 = [(AXHearingAidDevice *)self rightPeripheral];
        uint64_t v11 = v18;
        goto LABEL_11;
      case 4:
LABEL_9:
        uint64_t v12 = [(AXHearingAidDevice *)self leftPeripheral];
        id v13 = v18;
LABEL_10:
        [v13 hcSafeAddObject:v12];

        id v10 = [(AXHearingAidDevice *)self rightPeripheral];
        uint64_t v11 = v5;
LABEL_11:
        [v11 hcSafeAddObject:v10];

        break;
      case 6:
        switch([(AXHearingAidDevice *)self availableInputEars])
        {
          case 0:
            goto LABEL_4;
          case 2:
            goto LABEL_7;
          case 4:
            goto LABEL_9;
          case 6:
            uint64_t v12 = [(AXHearingAidDevice *)self leftPeripheral];
            id v13 = v5;
            goto LABEL_10;
          default:
            goto LABEL_12;
        }
      default:
        break;
    }
LABEL_12:
    [v18 enumerateObjectsUsingBlock:&__block_literal_global_303];
    [v5 enumerateObjectsUsingBlock:&__block_literal_global_315];
    if (v3)
    {
      id v14 = +[AXHearingAidDeviceController sharedController];
      uint64_t v15 = [(AXHearingAidDevice *)self leftPeripheral];
      [v14 resetConnectionToPeripheral:v15];

      unsigned int v16 = +[AXHearingAidDeviceController sharedController];
      uint64_t v17 = [(AXHearingAidDevice *)self rightPeripheral];
      [v16 resetConnectionToPeripheral:v17];
    }
  }
}

void __46__AXHearingAidDevice_updateInputTagsAndReset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  BOOL v3 = [NSString stringWithFormat:@"Disabling input for %@", v2];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice updateInputTagsAndReset:]_block_invoke", 1537, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    int v7 = v5;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [v2 axTag:@"Disable Input"];
  [v2 axUntag:@"Enable Input"];
}

void __46__AXHearingAidDevice_updateInputTagsAndReset___block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  HAInitializeLogging();
  BOOL v3 = [NSString stringWithFormat:@"Enabling input for %@", v2];
  id v4 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice updateInputTagsAndReset:]_block_invoke", 1543, v3];
  id v5 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v4;
    int v7 = v5;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v9 = [v6 UTF8String];
    _os_log_impl(&dword_20CC86000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [v2 axUntag:@"Disable Input"];
  [v2 axTag:@"Enable Input"];
}

- (void)writeValueForProperty:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ((a3 & ~self->leftWriteRequestProperties) == 0)
  {
    if ((self->_leftWriteResponseProperties & a3) != 0)
    {
      p_leftWriteResponseProperties = &self->_leftWriteResponseProperties;
      HAInitializeLogging();
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"FAILED left write response check %lld", *p_leftWriteResponseProperties);
      int v7 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice writeValueForProperty:]", 1591, v6];
      id v8 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v7;
        uint64_t v10 = v8;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v38 = [v9 UTF8String];
        _os_log_impl(&dword_20CC86000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      p_leftWriteResponseProperties = &self->leftWriteRequestProperties;
      if ((a3 & 0xFFFFFFBF7FFFFF3FLL) == 0)
      {
        uint64_t v22 = [(AXHearingAidDevice *)self leftPeripheral];
        uint64_t v23 = [(AXHearingAidDevice *)self volumeValueForProperty:a3 andPeripheral:v22];

        [(AXHearingAidDevice *)self writeInt:v23 toEar:2 forProperty:a3];
        goto LABEL_7;
      }
      if ((a3 & 0xFFFFFFFFFFFFFBFFLL) != 0)
      {
        if ((a3 & 0xFFFFFFF7FFFFFFFFLL) != 0)
        {
          id v18 = [(AXHearingAidDevice *)self leftPeripheral];
          uint64_t v19 = [(AXHearingAidDevice *)self signedValueForProperty:a3 andPeripheral:v18];

          [(AXHearingAidDevice *)self writeSignedInt:v19 toEar:2 forProperty:a3];
        }
        else
        {
          double v27 = [(AXHearingAidDevice *)self leftSelectedStreamingProgram];
          uint64_t v28 = [(AXHearingAidDevice *)self leftSelectedProgram];
          unsigned int v29 = (void *)v28;
          if (v27) {
            id v30 = v27;
          }
          else {
            id v30 = (void *)v28;
          }
          id v31 = v30;

          -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", [v31 index], 2, 0x800000000);
        }
        goto LABEL_7;
      }
      id v6 = [(AXHearingAidDevice *)self leftSelectedProgram];
      -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", [v6 index], 2, 1024);
    }

LABEL_7:
    *p_leftWriteResponseProperties &= ~a3;
  }
  if ((a3 & ~self->rightWriteRequestProperties) == 0)
  {
    if ((self->_rightWriteResponseProperties & a3) != 0)
    {
      p_rightWriteResponseProperties = &self->_rightWriteResponseProperties;
      HAInitializeLogging();
      uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"FAILED right write response check %lld", self->_rightWriteResponseProperties);
      id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice writeValueForProperty:]", 1625, v12];
      id v14 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v15 = v13;
        unsigned int v16 = v14;
        uint64_t v17 = [v15 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v38 = v17;
        _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      p_rightWriteResponseProperties = &self->rightWriteRequestProperties;
      if ((a3 & 0xFFFFFFBF7FFFFF3FLL) != 0)
      {
        if ((a3 & 0xFFFFFFFFFFFFFBFFLL) != 0)
        {
          if ((a3 & 0xFFFFFFF7FFFFFFFFLL) != 0)
          {
            uint64_t v20 = [(AXHearingAidDevice *)self rightPeripheral];
            uint64_t v21 = [(AXHearingAidDevice *)self signedValueForProperty:a3 andPeripheral:v20];

            [(AXHearingAidDevice *)self writeSignedInt:v21 toEar:4 forProperty:a3];
          }
          else
          {
            uint64_t v32 = [(AXHearingAidDevice *)self rightSelectedStreamingProgram];
            uint64_t v33 = [(AXHearingAidDevice *)self rightSelectedProgram];
            id v34 = (void *)v33;
            if (v32) {
              uint64_t v35 = v32;
            }
            else {
              uint64_t v35 = (void *)v33;
            }
            id v36 = v35;

            -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", [v36 index], 4, 0x800000000);
          }
        }
        else
        {
          unint64_t v26 = [(AXHearingAidDevice *)self rightSelectedProgram];
          -[AXHearingAidDevice writeInt:toEar:forProperty:](self, "writeInt:toEar:forProperty:", [v26 index], 4, 1024);
        }
      }
      else
      {
        uint64_t v24 = [(AXHearingAidDevice *)self rightPeripheral];
        uint64_t v25 = [(AXHearingAidDevice *)self volumeValueForProperty:a3 andPeripheral:v24];

        [(AXHearingAidDevice *)self writeInt:v25 toEar:4 forProperty:a3];
      }
    }
    *p_rightWriteResponseProperties &= ~a3;
  }
}

- (void)_sendDelayedWrites
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXHearingAidDevice *)self isPaired];
  HAInitializeLogging();
  if (v3)
  {
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Left %lld - Right %lld", self->leftWriteRequestProperties, self->rightWriteRequestProperties);
    id v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice _sendDelayedWrites]", 1634, v4];
    id v6 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v5;
      id v8 = v6;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v7 UTF8String];
      _os_log_impl(&dword_20CC86000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v9 = [(id)objc_opt_class() characteristicsUUIDs];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __40__AXHearingAidDevice__sendDelayedWrites__block_invoke;
    v18[3] = &unk_2640FCDB0;
    v18[4] = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v18];

    if ([(AXHearingAidDevice *)self keepInSync]
      && (self->leftWriteRequestProperties || self->rightWriteRequestProperties))
    {
      [(AXDispatchTimer *)self->_propertyWriteTimer cancel];
      objc_initWeak((id *)buf, self);
      propertyWriteTimer = self->_propertyWriteTimer;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __40__AXHearingAidDevice__sendDelayedWrites__block_invoke_2;
      v16[3] = &unk_2640FC910;
      objc_copyWeak(&v17, (id *)buf);
      [(AXDispatchTimer *)propertyWriteTimer afterDelay:v16 processBlock:0.1];
      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    uint64_t v11 = [NSString stringWithFormat:@"Not paired"];
    uint64_t v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice _sendDelayedWrites]", 1652, v11];
    id v13 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v12;
      id v15 = v13;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v14 UTF8String];
      _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __40__AXHearingAidDevice__sendDelayedWrites__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 unsignedLongLongValue];
  id v4 = *(void **)(a1 + 32);

  return [v4 writeValueForProperty:v3];
}

void __40__AXHearingAidDevice__sendDelayedWrites__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendDelayedWrites];
}

- (void)delayWriteProperty:(unint64_t)a3 forPeripheral:(id)a4
{
  id v6 = a4;
  id v7 = +[AXHearingAidDeviceController sharedController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__AXHearingAidDevice_delayWriteProperty_forPeripheral___block_invoke;
  v9[3] = &unk_2640FD3C8;
  void v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  [v7 checkPeripheralPaired:v8 withCompletion:v9];
}

void __55__AXHearingAidDevice_delayWriteProperty_forPeripheral___block_invoke(uint64_t a1, char a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F47290];
  if (a2 & 1) != 0 || ([*(id *)(a1 + 32) isFakeDevice])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) leftPeripheral];
    if ([v4 isEqual:v5] && objc_msgSend(*(id *)(a1 + 32), "leftAvailable"))
    {
      uint64_t v6 = *(void *)(a1 + 48) & *(void *)(*(void *)(a1 + 32) + 456);

      if (!v6)
      {
        int v7 = 0;
        *(void *)(*(void *)(a1 + 32) + 456) |= *(void *)(a1 + 48);
LABEL_9:
        id v8 = *(void **)(a1 + 40);
        id v9 = [*(id *)(a1 + 32) rightPeripheral];
        if ([v8 isEqual:v9]
          && [*(id *)(a1 + 32) rightAvailable])
        {
          uint64_t v10 = *(void *)(a1 + 48) & *(void *)(*(void *)(a1 + 32) + 464);

          if (!v10)
          {
            *(void *)(*(void *)(a1 + 32) + 464) |= *(void *)(a1 + 48);
            uint64_t v11 = *(void *)(a1 + 32);
            goto LABEL_17;
          }
        }
        else
        {
        }
        uint64_t v11 = *(void *)(a1 + 32);
        if (v7)
        {
          if (*(void *)(v11 + 456))
          {
            unsigned int v12 = 0;
          }
          else
          {
            unsigned int v12 = 0;
            if (!*(void *)(v11 + 464)) {
              goto LABEL_23;
            }
          }
          goto LABEL_18;
        }
LABEL_17:
        unsigned int v12 = 1;
LABEL_18:
        if (([*(id *)(v11 + 72) isPending] & 1) == 0) {
          [*(id *)(a1 + 32) _sendDelayedWrites];
        }
        goto LABEL_23;
      }
    }
    else
    {
    }
    int v7 = 1;
    goto LABEL_9;
  }
  HAInitializeLogging();
  id v13 = [NSString stringWithFormat:@"Not writing because peripheral isn't paired"];
  id v14 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice delayWriteProperty:forPeripheral:]_block_invoke", 1662, v13];
  os_log_t v15 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v14;
    id v17 = v15;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v25 = [v16 UTF8String];
    _os_log_impl(&dword_20CC86000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  unsigned int v12 = 0;
LABEL_23:
  HAInitializeLogging();
  id v18 = [NSString stringWithFormat:@"[%d] %lld - %@", v12, *(void *)(a1 + 48), *(void *)(a1 + 40)];
  uint64_t v19 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice delayWriteProperty:forPeripheral:]_block_invoke", 1683, v18];
  os_log_t v20 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = v19;
    uint64_t v22 = v20;
    uint64_t v23 = [v21 UTF8String];
    *(_DWORD *)long long buf = 136446210;
    uint64_t v25 = v23;
    _os_log_impl(&dword_20CC86000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)writeInt:(unsigned __int8)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  unsigned int v6 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  unsigned __int8 v26 = a3;
  if (a4 == 2) {
    [(AXHearingAidDevice *)self leftPeripheral];
  }
  else {
  id v8 = [(AXHearingAidDevice *)self rightPeripheral];
  }
  if (v8)
  {
    id v9 = [(AXHearingAidDevice *)self peripheral:v8 characteristicForProperty:a5];
    HAInitializeLogging();
    uint64_t v10 = NSString;
    uint64_t v11 = hearingPropertyDescription(a5);
    unsigned int v12 = [v10 stringWithFormat:@"Writing %d for %@ - %@", v6, v11, v9];

    id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice writeInt:toEar:forProperty:]", 1694, v12];
    id v14 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      id v16 = v14;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v28 = [v15 UTF8String];
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:&v26 length:1];
    id v18 = (void *)v17;
    if (v9 && v17)
    {
      [v8 writeValue:v17 forCharacteristic:v9 type:0];
      uint64_t v19 = [(AXHearingAidDevice *)self leftPeripheral];
      int v20 = [v8 isEqual:v19];

      if (v20)
      {
        unint64_t v21 = [(AXHearingAidDevice *)self leftWriteResponseProperties] | a5;
LABEL_13:
        [(AXHearingAidDevice *)self setLeftWriteResponseProperties:v21];
LABEL_17:

        goto LABEL_18;
      }
      unint64_t v25 = [(AXHearingAidDevice *)self rightWriteResponseProperties] | a5;
    }
    else
    {
      uint64_t v22 = [(AXHearingAidDevice *)self leftPeripheral];
      int v23 = [v8 isEqual:v22];

      unint64_t v24 = ~a5;
      if (v23)
      {
        unint64_t v21 = [(AXHearingAidDevice *)self leftWriteResponseProperties] & v24;
        goto LABEL_13;
      }
      unint64_t v25 = [(AXHearingAidDevice *)self rightWriteResponseProperties] & v24;
    }
    [(AXHearingAidDevice *)self setRightWriteResponseProperties:v25];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)writeSignedInt:(char)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  int v6 = a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v26 = a3;
  if (a4 == 2) {
    [(AXHearingAidDevice *)self leftPeripheral];
  }
  else {
  id v8 = [(AXHearingAidDevice *)self rightPeripheral];
  }
  if (v8)
  {
    id v9 = [(AXHearingAidDevice *)self peripheral:v8 characteristicForProperty:a5];
    HAInitializeLogging();
    uint64_t v10 = NSString;
    uint64_t v11 = hearingPropertyDescription(a5);
    unsigned int v12 = [v10 stringWithFormat:@"Writing %d for %@ - %@", v6, v11, v9];

    id v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice writeSignedInt:toEar:forProperty:]", 1730, v12];
    id v14 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      id v16 = v14;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v28 = [v15 UTF8String];
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v17 = [MEMORY[0x263EFF8F8] dataWithBytes:&v26 length:1];
    id v18 = (void *)v17;
    if (v9 && v17)
    {
      [v8 writeValue:v17 forCharacteristic:v9 type:0];
      uint64_t v19 = [(AXHearingAidDevice *)self leftPeripheral];
      int v20 = [v8 isEqual:v19];

      if (v20)
      {
        unint64_t v21 = [(AXHearingAidDevice *)self leftWriteResponseProperties] | a5;
LABEL_13:
        [(AXHearingAidDevice *)self setLeftWriteResponseProperties:v21];
LABEL_17:

        goto LABEL_18;
      }
      unint64_t v25 = [(AXHearingAidDevice *)self rightWriteResponseProperties] | a5;
    }
    else
    {
      uint64_t v22 = [(AXHearingAidDevice *)self leftPeripheral];
      int v23 = [v8 isEqual:v22];

      unint64_t v24 = ~a5;
      if (v23)
      {
        unint64_t v21 = [(AXHearingAidDevice *)self leftWriteResponseProperties] & v24;
        goto LABEL_13;
      }
      unint64_t v25 = [(AXHearingAidDevice *)self rightWriteResponseProperties] & v24;
    }
    [(AXHearingAidDevice *)self setRightWriteResponseProperties:v25];
    goto LABEL_17;
  }
LABEL_18:
}

- (void)readValueForCharacteristic:(id)a3 fromPeripheral:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  HAInitializeLogging();
  int v7 = NSString;
  if (v5)
  {
    id v8 = [v5 UUID];
    id v9 = [v7 stringWithFormat:@"Reading %@ from %@", v8, v6];

    uint64_t v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:]", 1766, v9];
    uint64_t v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    [v6 readValueForCharacteristic:v5];
  }
  else
  {
    id v14 = [NSString stringWithFormat:@"Reading nil characteristic"];
    id v15 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice readValueForCharacteristic:fromPeripheral:]", 1771, v14];
    id v16 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v15;
      id v18 = v16;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v20 = [v17 UTF8String];
      _os_log_impl(&dword_20CC86000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
}

- (void)readProperty:(unint64_t)a3 fromPeripheral:(id)a4
{
  id v6 = a4;
  id v7 = [(AXHearingAidDevice *)self peripheral:v6 characteristicForProperty:a3];
  [(AXHearingAidDevice *)self readValueForCharacteristic:v7 fromPeripheral:v6];
}

- (void)selectProgram:(id)a3 forEar:(int)a4
{
  id v6 = a3;
  if ((a4 & [v6 ear] & 2) != 0)
  {
    if ([v6 isStreamOrMixingStream]) {
      [(AXHearingAidDevice *)self setLeftSelectedStreamingProgram:v6];
    }
    else {
      [(AXHearingAidDevice *)self setLeftSelectedProgram:v6];
    }
  }
  else
  {
    id v7 = [(AXHearingAidDevice *)self leftPrograms];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__AXHearingAidDevice_selectProgram_forEar___block_invoke;
    v10[3] = &unk_2640FD3F0;
    v10[4] = self;
    [v7 enumerateObjectsUsingBlock:v10];
  }
  if ((a4 & [v6 ear] & 4) != 0)
  {
    if ([v6 isStreamOrMixingStream]) {
      [(AXHearingAidDevice *)self setRightSelectedStreamingProgram:v6];
    }
    else {
      [(AXHearingAidDevice *)self setRightSelectedProgram:v6];
    }
  }
  else
  {
    id v8 = [(AXHearingAidDevice *)self rightPrograms];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __43__AXHearingAidDevice_selectProgram_forEar___block_invoke_2;
    v9[3] = &unk_2640FD3F0;
    void v9[4] = self;
    [v8 enumerateObjectsUsingBlock:v9];
  }
}

void __43__AXHearingAidDevice_selectProgram_forEar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 category] == 1)
  {
    [*(id *)(a1 + 32) setLeftSelectedProgram:v6];
    *a4 = 1;
  }
}

void __43__AXHearingAidDevice_selectProgram_forEar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 category] == 1)
  {
    [*(id *)(a1 + 32) setRightSelectedProgram:v6];
    *a4 = 1;
  }
}

- (id)selectedPrograms
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(AXHearingAidDevice *)self programs];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__AXHearingAidDevice_selectedPrograms__block_invoke;
  v8[3] = &unk_2640FD3F0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = [MEMORY[0x263EFF8C0] arrayWithArray:v5];

  return v6;
}

void __38__AXHearingAidDevice_selectedPrograms__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isSelected]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)selectedProgramIndexes
{
  id v2 = [(AXHearingAidDevice *)self programs];
  id v3 = [v2 indexesOfObjectsPassingTest:&__block_literal_global_350];

  return v3;
}

uint64_t __44__AXHearingAidDevice_selectedProgramIndexes__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSelected];
}

- (char)signedValueForProperty:(unint64_t)a3 andPeripheral:(id)a4
{
  id v6 = a4;
  id v7 = [(AXHearingAidDevice *)self leftPeripheral];
  int v8 = [v6 isEqual:v7];

  if (a3 == 0x1000000000)
  {
    BOOL v9 = v8 == 0;
    uint64_t v10 = 58;
  }
  else
  {
    if (a3 != 0x2000000000)
    {
      LOBYTE(v11) = 0;
      return v11;
    }
    BOOL v9 = v8 == 0;
    uint64_t v10 = 56;
  }
  if (v9) {
    ++v10;
  }
  int v11 = *((char *)&self->super.isa + v10);
  if (v11 <= -127) {
    LOBYTE(v11) = -127;
  }
  return v11;
}

- (unsigned)volumeValueForProperty:(unint64_t)a3 andPeripheral:(id)a4
{
  id v6 = a4;
  id v7 = [(AXHearingAidDevice *)self leftPeripheral];
  int v8 = [v6 isEqual:v7];

  LOBYTE(v9) = 0;
  if ((uint64_t)a3 > 0x7FFFFFFF)
  {
    if (a3 == 0x80000000)
    {
      BOOL v10 = v8 == 0;
      uint64_t v11 = 384;
      uint64_t v12 = 376;
    }
    else
    {
      if (a3 != 0x4000000000) {
        return v9;
      }
      BOOL v10 = v8 == 0;
      uint64_t v11 = 400;
      uint64_t v12 = 392;
    }
  }
  else if (a3 == 64)
  {
    BOOL v10 = v8 == 0;
    uint64_t v11 = 32;
    uint64_t v12 = 24;
  }
  else
  {
    if (a3 != 128) {
      return v9;
    }
    BOOL v10 = v8 == 0;
    uint64_t v11 = 48;
    uint64_t v12 = 40;
  }
  if (!v10) {
    uint64_t v11 = v12;
  }
  return (int)(*(double *)((char *)&self->super.isa + v11) * 255.0);
}

- (void)setLeftMicrophoneVolume:(double)a3
{
  if (self->_leftMicrophoneVolume != -1.0)
  {
    double v4 = 0.0;
    if (a3 >= 0.0) {
      double v4 = a3;
    }
    if (a3 <= 1.0) {
      double v5 = v4;
    }
    else {
      double v5 = 1.0;
    }
    self->_leftMicrophoneVolume = v5;
  }
  id v6 = [(AXHearingAidDevice *)self leftPeripheral];
  [(AXHearingAidDevice *)self delayWriteProperty:64 forPeripheral:v6];
}

- (void)setRightMicrophoneVolume:(double)a3
{
  if (self->_rightMicrophoneVolume != -1.0)
  {
    double v4 = 0.0;
    if (a3 >= 0.0) {
      double v4 = a3;
    }
    if (a3 <= 1.0) {
      double v5 = v4;
    }
    else {
      double v5 = 1.0;
    }
    self->_rightMicrophoneVolume = v5;
  }
  id v6 = [(AXHearingAidDevice *)self rightPeripheral];
  [(AXHearingAidDevice *)self delayWriteProperty:64 forPeripheral:v6];
}

- (void)setLeftStreamVolume:(double)a3
{
  if (self->_leftStreamVolume != -1.0)
  {
    double v4 = 0.0;
    if (a3 >= 0.0) {
      double v4 = a3;
    }
    if (a3 <= 1.0) {
      double v5 = v4;
    }
    else {
      double v5 = 1.0;
    }
    self->_leftStreamVolume = v5;
  }
  id v6 = [(AXHearingAidDevice *)self leftPeripheral];
  [(AXHearingAidDevice *)self delayWriteProperty:128 forPeripheral:v6];
}

- (void)setRightStreamVolume:(double)a3
{
  if (self->_rightStreamVolume != -1.0)
  {
    double v4 = 0.0;
    if (a3 >= 0.0) {
      double v4 = a3;
    }
    if (a3 <= 1.0) {
      double v5 = v4;
    }
    else {
      double v5 = 1.0;
    }
    self->_rightStreamVolume = v5;
  }
  id v6 = [(AXHearingAidDevice *)self rightPeripheral];
  [(AXHearingAidDevice *)self delayWriteProperty:128 forPeripheral:v6];
}

- (void)setLeftSensitivity:(double)a3
{
  if (self->_leftSensitivity != -1.0)
  {
    double v4 = 0.0;
    if (a3 >= 0.0) {
      double v4 = a3;
    }
    if (a3 <= 1.0) {
      double v5 = v4;
    }
    else {
      double v5 = 1.0;
    }
    self->_leftSensitivity = v5;
  }
  id v6 = [(AXHearingAidDevice *)self leftPeripheral];
  [(AXHearingAidDevice *)self delayWriteProperty:0x80000000 forPeripheral:v6];
}

- (void)setRightSensitivity:(double)a3
{
  if (self->_rightSensitivity != -1.0)
  {
    double v4 = 0.0;
    if (a3 >= 0.0) {
      double v4 = a3;
    }
    if (a3 <= 1.0) {
      double v5 = v4;
    }
    else {
      double v5 = 1.0;
    }
    self->_rightSensitivity = v5;
  }
  id v6 = [(AXHearingAidDevice *)self rightPeripheral];
  [(AXHearingAidDevice *)self delayWriteProperty:0x80000000 forPeripheral:v6];
}

- (void)setTreble:(char)a3 forLeft:(BOOL)a4
{
  if (a4)
  {
    self->_leftTreble = a3;
    [(AXHearingAidDevice *)self leftPeripheral];
  }
  else
  {
    self->_rightTreble = a3;
    [(AXHearingAidDevice *)self rightPeripheral];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AXHearingAidDevice *)self delayWriteProperty:0x2000000000 forPeripheral:v5];
}

- (void)setBass:(char)a3 forLeft:(BOOL)a4
{
  if (a4)
  {
    self->_leftBass = a3;
    [(AXHearingAidDevice *)self leftPeripheral];
  }
  else
  {
    self->_rightBass = a3;
    [(AXHearingAidDevice *)self rightPeripheral];
  }
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AXHearingAidDevice *)self delayWriteProperty:0x1000000000 forPeripheral:v5];
}

- (void)setMixedVolume:(double)a3 forLeft:(BOOL)a4
{
  double v5 = 0.0;
  if (a3 >= 0.0) {
    double v5 = a3;
  }
  if (a3 <= 1.0) {
    double v6 = v5;
  }
  else {
    double v6 = 1.0;
  }
  if (a4)
  {
    self->_leftMixedVolume = v6;
    [(AXHearingAidDevice *)self leftPeripheral];
  }
  else
  {
    self->_rightMixedVolume = v6;
    [(AXHearingAidDevice *)self rightPeripheral];
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(AXHearingAidDevice *)self delayWriteProperty:0x4000000000 forPeripheral:v7];
}

- (void)setValue:(id)a3 forProperty:(unint64_t)a4
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ((uint64_t)a4 < 0x800000)
  {
    if ((uint64_t)a4 <= 1023)
    {
      if ((uint64_t)a4 > 127)
      {
        switch(a4)
        {
          case 0x80uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
            {
              uint64_t v33 = [v6 firstObject];
              [v33 doubleValue];
              -[AXHearingAidDevice setLeftStreamVolume:](self, "setLeftStreamVolume:");

              int v8 = [v6 lastObject];
              [v8 doubleValue];
              -[AXHearingAidDevice setRightStreamVolume:](self, "setRightStreamVolume:");
              goto LABEL_120;
            }
            goto LABEL_125;
          case 0x100uLL:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
            {
              id v34 = [v6 firstObject];
              uint64_t v35 = [v6 lastObject];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v58 = v35;
                id v36 = [MEMORY[0x263EFF980] array];
                long long v72 = 0u;
                long long v73 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                v59 = v34;
                id v37 = v34;
                uint64_t v38 = [v37 countByEnumeratingWithState:&v72 objects:v79 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v73;
                  do
                  {
                    for (uint64_t i = 0; i != v39; ++i)
                    {
                      if (*(void *)v73 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      uint64_t v42 = [[AXHearingAidMode alloc] initWithRepresentation:*(void *)(*((void *)&v72 + 1) + 8 * i)];
                      if (v42) {
                        [v36 addObject:v42];
                      }
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v72 objects:v79 count:16];
                  }
                  while (v39);
                }

                [(AXHearingAidDevice *)self setLeftPrograms:v36];
                uint64_t v35 = v58;
                id v34 = v59;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v43 = v35;
                uint64_t v44 = [MEMORY[0x263EFF980] array];
                long long v68 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                uint64_t v45 = [v44 countByEnumeratingWithState:&v68 objects:v78 count:16];
                if (v45)
                {
                  uint64_t v46 = v45;
                  uint64_t v47 = *(void *)v69;
                  do
                  {
                    for (uint64_t j = 0; j != v46; ++j)
                    {
                      if (*(void *)v69 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      id v49 = [[AXHearingAidMode alloc] initWithRepresentation:*(void *)(*((void *)&v68 + 1) + 8 * j)];
                      if (v49) {
                        [v44 addObject:v49];
                      }
                    }
                    uint64_t v46 = [v44 countByEnumeratingWithState:&v68 objects:v78 count:16];
                  }
                  while (v46);
                }
                [(AXHearingAidDevice *)self setRightPrograms:v44];

                uint64_t v35 = v43;
              }
            }
            goto LABEL_125;
          case 0x200uLL:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v14 = [v6 objectForKey:&unk_26C1E54F8];
              [(AXHearingAidDevice *)self setValue:v14 forProperty:0x80000];

              int v8 = [v6 objectForKey:&unk_26C1E5510];
              [(AXHearingAidDevice *)self setValue:v8 forProperty:0x100000];
              goto LABEL_120;
            }
            goto LABEL_125;
        }
        goto LABEL_121;
      }
      if (a4 == 4)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
        {
          id v18 = [v6 firstObject];
          [v18 doubleValue];
          -[AXHearingAidDevice setLeftBatteryLevel:](self, "setLeftBatteryLevel:");

          int v8 = [v6 lastObject];
          [v8 doubleValue];
          -[AXHearingAidDevice setRightBatteryLevel:](self, "setRightBatteryLevel:");
          goto LABEL_120;
        }
        goto LABEL_125;
      }
      if (a4 != 8)
      {
        if (a4 == 64)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
          {
            id v7 = [v6 firstObject];
            [v7 doubleValue];
            -[AXHearingAidDevice setLeftMicrophoneVolume:](self, "setLeftMicrophoneVolume:");

            int v8 = [v6 lastObject];
            [v8 doubleValue];
            -[AXHearingAidDevice setRightMicrophoneVolume:](self, "setRightMicrophoneVolume:");
LABEL_120:

            goto LABEL_125;
          }
          goto LABEL_125;
        }
LABEL_121:
        HAInitializeLogging();
        int v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown property: %ld", a4);
        BOOL v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice setValue:forProperty:]", 2361, v9];
        uint64_t v11 = (void *)*MEMORY[0x263F47290];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
        {
LABEL_122:
          id v55 = v10;
          v56 = v11;
          *(_DWORD *)long long buf = 136446210;
          uint64_t v77 = [v55 UTF8String];
          _os_log_impl(&dword_20CC86000, v56, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        }
LABEL_123:

        goto LABEL_124;
      }
LABEL_15:
      HAInitializeLogging();
      int v9 = objc_msgSend(NSString, "stringWithFormat:", @"Attempting to set readonly property: %ld", a4);
      BOOL v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice setValue:forProperty:]", 2357, v9];
      uint64_t v11 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      goto LABEL_123;
    }
    if ((uint64_t)a4 >= 0x100000)
    {
      if (a4 != 0x100000)
      {
        if (a4 == 0x200000)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v52 = [v6 integerValue];
            if (v52)
            {
              if (v52 == 2) {
                [(AXHearingAidDevice *)self connect];
              }
            }
            else
            {
              [(AXHearingAidDevice *)self disconnectAndUnpair:0];
            }
          }
          goto LABEL_125;
        }
        if (a4 == 0x400000)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
          {
            id v16 = [v6 firstObject];
            [(AXHearingAidDevice *)self setLeftFirmwareVersion:v16];

            int v8 = [v6 lastObject];
            [(AXHearingAidDevice *)self setRightFirmwareVersion:v8];
            goto LABEL_120;
          }
          goto LABEL_125;
        }
        goto LABEL_121;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
      {
        uint64_t v12 = [(AXHearingAidDevice *)self model];
        goto LABEL_109;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_125;
      }
      v57 = [(AXHearingAidDevice *)self model];
LABEL_130:
      int v9 = v57;
      [v57 replaceObjectAtIndex:0 withObject:v6];
      goto LABEL_124;
    }
    if (a4 != 1024)
    {
      if (a4 == 0x40000)
      {
        [(AXHearingAidDevice *)self setName:v6];
        goto LABEL_125;
      }
      if (a4 != 0x80000) {
        goto LABEL_121;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
      {
        uint64_t v12 = [(AXHearingAidDevice *)self manufacturer];
LABEL_109:
        int v9 = v12;
        [v12 setArray:v6];
LABEL_124:

        goto LABEL_125;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_125;
      }
      v57 = [(AXHearingAidDevice *)self manufacturer];
      goto LABEL_130;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v6 count] != 2) {
      goto LABEL_125;
    }
    uint64_t v20 = [v6 firstObject];
    int v21 = [v20 intValue];

    uint64_t v22 = [(AXHearingAidDevice *)self leftPrograms];
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke;
    v66[3] = &unk_2640FD438;
    int v67 = v21;
    v66[4] = self;
    [v22 enumerateObjectsUsingBlock:v66];

    int v23 = [v6 lastObject];
    int v24 = [v23 intValue];

    unint64_t v25 = [(AXHearingAidDevice *)self rightPrograms];
    int v8 = v25;
    v64[0] = MEMORY[0x263EF8330];
    v64[1] = 3221225472;
    v64[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke_2;
    v64[3] = &unk_2640FD438;
    int v65 = v24;
    v64[4] = self;
    char v26 = v64;
LABEL_71:
    [v25 enumerateObjectsUsingBlock:v26];
    goto LABEL_120;
  }
  if ((uint64_t)a4 <= 0x3FFFFFFFFLL)
  {
    if ((uint64_t)a4 > 0x7FFFFFFF)
    {
      switch(a4)
      {
        case 0x80000000uLL:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
          {
            v50 = [v6 firstObject];
            [v50 doubleValue];
            -[AXHearingAidDevice setLeftSensitivity:](self, "setLeftSensitivity:");

            int v8 = [v6 lastObject];
            [v8 doubleValue];
            -[AXHearingAidDevice setRightSensitivity:](self, "setRightSensitivity:");
            goto LABEL_120;
          }
          goto LABEL_125;
        case 0x100000000uLL:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
          {
            uint64_t v51 = [v6 firstObject];
            -[AXHearingAidDevice setLeftMicrophoneVolumeSteps:](self, "setLeftMicrophoneVolumeSteps:", [v51 shortValue]);

            int v8 = [v6 lastObject];
            -[AXHearingAidDevice setRightMicrophoneVolumeSteps:](self, "setRightMicrophoneVolumeSteps:", [v8 shortValue]);
            goto LABEL_120;
          }
          goto LABEL_125;
        case 0x200000000uLL:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
          {
            id v15 = [v6 firstObject];
            -[AXHearingAidDevice setLeftStreamVolumeSteps:](self, "setLeftStreamVolumeSteps:", [v15 shortValue]);

            int v8 = [v6 lastObject];
            -[AXHearingAidDevice setRightStreamVolumeSteps:](self, "setRightStreamVolumeSteps:", [v8 shortValue]);
            goto LABEL_120;
          }
          goto LABEL_125;
      }
      goto LABEL_121;
    }
    if (a4 == 0x800000)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
      {
        uint64_t v19 = [v6 firstObject];
        [(AXHearingAidDevice *)self setLeftHardwareVersion:v19];

        int v8 = [v6 lastObject];
        [(AXHearingAidDevice *)self setRightHardwareVersion:v8];
        goto LABEL_120;
      }
      goto LABEL_125;
    }
    if (a4 != 0x1000000 && a4 != 0x20000000) {
      goto LABEL_121;
    }
    goto LABEL_15;
  }
  if ((uint64_t)a4 > 0x1FFFFFFFFFLL)
  {
    switch(a4)
    {
      case 0x2000000000uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
        {
          v53 = [v6 firstObject];
          -[AXHearingAidDevice setTreble:forLeft:](self, "setTreble:forLeft:", [v53 charValue], 1);

          int v8 = [v6 lastObject];
          -[AXHearingAidDevice setTreble:forLeft:](self, "setTreble:forLeft:", [v8 charValue], 0);
          goto LABEL_120;
        }
        goto LABEL_125;
      case 0x4000000000uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
        {
          v54 = [v6 firstObject];
          [v54 doubleValue];
          -[AXHearingAidDevice setMixedVolume:forLeft:](self, "setMixedVolume:forLeft:", 1);

          int v8 = [v6 lastObject];
          [v8 doubleValue];
          -[AXHearingAidDevice setMixedVolume:forLeft:](self, "setMixedVolume:forLeft:", 0);
          goto LABEL_120;
        }
        goto LABEL_125;
      case 0x8000000000uLL:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
        {
          id v17 = [v6 firstObject];
          -[AXHearingAidDevice setLeftMixedVolumeSteps:](self, "setLeftMixedVolumeSteps:", [v17 shortValue]);

          int v8 = [v6 lastObject];
          -[AXHearingAidDevice setRightMixedVolumeSteps:](self, "setRightMixedVolumeSteps:", [v8 shortValue]);
          goto LABEL_120;
        }
        goto LABEL_125;
    }
    goto LABEL_121;
  }
  if (a4 == 0x400000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
    {
      double v27 = [v6 firstObject];
      -[AXHearingAidDevice setLeftSensitivitySteps:](self, "setLeftSensitivitySteps:", [v27 shortValue]);

      int v8 = [v6 lastObject];
      -[AXHearingAidDevice setRightSensitivitySteps:](self, "setRightSensitivitySteps:", [v8 shortValue]);
      goto LABEL_120;
    }
    goto LABEL_125;
  }
  if (a4 == 0x800000000)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || [v6 count] != 2
      || ![(AXHearingAidDevice *)self deviceSupportsProperty:0x800000000])
    {
      goto LABEL_125;
    }
    uint64_t v28 = [v6 firstObject];
    int v29 = [v28 intValue];

    id v30 = [(AXHearingAidDevice *)self leftPrograms];
    v62[0] = MEMORY[0x263EF8330];
    v62[1] = 3221225472;
    v62[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke_3;
    v62[3] = &unk_2640FD438;
    int v63 = v29;
    v62[4] = self;
    [v30 enumerateObjectsUsingBlock:v62];

    id v31 = [v6 lastObject];
    int v32 = [v31 intValue];

    unint64_t v25 = [(AXHearingAidDevice *)self rightPrograms];
    int v8 = v25;
    v60[0] = MEMORY[0x263EF8330];
    v60[1] = 3221225472;
    v60[2] = __43__AXHearingAidDevice_setValue_forProperty___block_invoke_4;
    v60[3] = &unk_2640FD438;
    int v61 = v32;
    v60[4] = self;
    char v26 = v60;
    goto LABEL_71;
  }
  if (a4 != 0x1000000000) {
    goto LABEL_121;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count] == 2)
  {
    id v13 = [v6 firstObject];
    -[AXHearingAidDevice setBass:forLeft:](self, "setBass:forLeft:", [v13 charValue], 1);

    int v8 = [v6 lastObject];
    -[AXHearingAidDevice setBass:forLeft:](self, "setBass:forLeft:", [v8 charValue], 0);
    goto LABEL_120;
  }
LABEL_125:
}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 40);
  id v9 = v3;
  if (v4 == [v3 index])
  {
    [v9 setIsSelected:1];
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) leftSelectedStreamingProgram];
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));
  }
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == [v9 index])
  {
    [*(id *)(a1 + 32) setLeftSelectedProgram:v9];
    id v7 = *(void **)(a1 + 32);
    int v8 = [v7 leftPeripheral];
    [v7 delayWriteProperty:1024 forPeripheral:v8];
  }
}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 40);
  id v9 = v3;
  if (v4 == [v3 index])
  {
    [v9 setIsSelected:1];
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) rightSelectedStreamingProgram];
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));
  }
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == [v9 index])
  {
    [*(id *)(a1 + 32) setRightSelectedProgram:v9];
    id v7 = *(void **)(a1 + 32);
    int v8 = [v7 rightPeripheral];
    [v7 delayWriteProperty:1024 forPeripheral:v8];
  }
}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 40);
  id v9 = v3;
  if (v4 == [v3 index])
  {
    [v9 setIsSelected:1];
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) leftSelectedProgram];
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));
  }
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == [v9 index])
  {
    [*(id *)(a1 + 32) setLeftSelectedStreamingProgram:v9];
    if ([*(id *)(a1 + 32) deviceSupportsProperty:0x800000000])
    {
      id v7 = *(void **)(a1 + 32);
      int v8 = [v7 leftPeripheral];
      [v7 delayWriteProperty:0x800000000 forPeripheral:v8];
    }
  }
}

void __43__AXHearingAidDevice_setValue_forProperty___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(a1 + 40);
  id v9 = v3;
  if (v4 == [v3 index])
  {
    [v9 setIsSelected:1];
  }
  else
  {
    double v5 = [*(id *)(a1 + 32) rightSelectedProgram];
    objc_msgSend(v9, "setIsSelected:", objc_msgSend(v5, "index") == objc_msgSend(v9, "index"));
  }
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == [v9 index])
  {
    [*(id *)(a1 + 32) setRightSelectedStreamingProgram:v9];
    if ([*(id *)(a1 + 32) deviceSupportsProperty:0x800000000])
    {
      id v7 = *(void **)(a1 + 32);
      int v8 = [v7 rightPeripheral];
      [v7 delayWriteProperty:0x800000000 forPeripheral:v8];
    }
  }
}

- (id)valueForProperty:(unint64_t)a3
{
  v114[2] = *MEMORY[0x263EF8340];
  if ((uint64_t)a3 >= 0x800000)
  {
    if ((uint64_t)a3 > 0x3FFFFFFFFLL)
    {
      if ((uint64_t)a3 > 0x7FFFFFFFFFLL)
      {
        if ((uint64_t)a3 <= 0x3FFFFFFFFFFLL)
        {
          if (a3 != 0x8000000000)
          {
            if (a3 != 0x10000000000)
            {
              if (a3 == 0x20000000000)
              {
                uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXHearingAidDevice deviceType](self, "deviceType"));
                goto LABEL_134;
              }
              goto LABEL_113;
            }
            uint64_t v45 = NSNumber;
            uint64_t v46 = [(AXHearingAidDevice *)self availableInputEars];
            goto LABEL_98;
          }
          id v18 = (void *)MEMORY[0x263EFF8C0];
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithShort:", -[AXHearingAidDevice leftMixedVolumeSteps](self, "leftMixedVolumeSteps"));
          unint64_t v25 = NSNumber;
          uint64_t v26 = [(AXHearingAidDevice *)self rightMixedVolumeSteps];
          goto LABEL_105;
        }
        if (a3 == 0x40000000000)
        {
          uint64_t v45 = NSNumber;
          uint64_t v46 = [(AXHearingAidDevice *)self earsSupportingWatch];
          goto LABEL_98;
        }
        if (a3 != 0x80000000000)
        {
          if (a3 == 0x100000000000)
          {
            id v7 = [MEMORY[0x263EFF980] array];
            int v29 = [(AXHearingAidDevice *)self leftPeripheralUUID];
            if (v29)
            {
              id v30 = [(AXHearingAidDevice *)self leftPeripheralUUID];
              [v7 addObject:v30];
            }
            else
            {
              [v7 addObject:&stru_26C1D5720];
            }

            v86 = [(AXHearingAidDevice *)self rightPeripheralUUID];
            if (v86)
            {
              uint64_t v87 = [(AXHearingAidDevice *)self rightPeripheralUUID];
              goto LABEL_154;
            }
            goto LABEL_155;
          }
          goto LABEL_113;
        }
        v108[0] = &unk_26C1E5540;
        objc_msgSend(NSNumber, "numberWithBool:", -[AXHearingAidDevice requiresCombinedPresets](self, "requiresCombinedPresets"));
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v108[1] = v7;
        id v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AXHearingAidDevice requiresCombinedVolumes](self, "requiresCombinedVolumes"));
        v108[2] = v15;
        uint64_t v42 = objc_msgSend(NSNumber, "numberWithBool:", -[AXHearingAidDevice requiresBinauralStreaming](self, "requiresBinauralStreaming"));
        v108[3] = v42;
        uint64_t v43 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v44 = v108;
LABEL_100:
        BOOL v10 = [v43 arrayWithObjects:v44 count:4];

        goto LABEL_101;
      }
      if ((uint64_t)a3 > 0xFFFFFFFFFLL)
      {
        if (a3 == 0x1000000000)
        {
          id v7 = [NSNumber numberWithChar:self->_leftBass];
          v109[0] = v7;
          id v15 = [NSNumber numberWithChar:self->_rightBass];
          v109[1] = v15;
          id v16 = (void *)MEMORY[0x263EFF8C0];
          id v17 = v109;
          goto LABEL_88;
        }
        if (a3 == 0x2000000000)
        {
          id v7 = [NSNumber numberWithChar:self->_leftTreble];
          v110[0] = v7;
          id v15 = [NSNumber numberWithChar:self->_rightTreble];
          v110[1] = v15;
          id v16 = (void *)MEMORY[0x263EFF8C0];
          id v17 = v110;
          goto LABEL_88;
        }
        if (a3 != 0x4000000000) {
          goto LABEL_113;
        }
        id v18 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v19 = NSNumber;
        [(AXHearingAidDevice *)self leftMixedVolume];
        uint64_t v20 = objc_msgSend(v19, "numberWithDouble:");
        int v21 = NSNumber;
        [(AXHearingAidDevice *)self rightMixedVolume];
        goto LABEL_107;
      }
      if (a3 != 0x400000000)
      {
        if (a3 != 0x800000000) {
          goto LABEL_113;
        }
        uint64_t v39 = [(AXHearingAidDevice *)self leftSelectedStreamingProgram];
        if (v39)
        {
          uint64_t v40 = [(AXHearingAidDevice *)self leftSelectedStreamingProgram];
          uint64_t v24 = [v40 index];
        }
        else
        {
          uint64_t v24 = 0xFFFFFFFFLL;
        }

        v88 = [(AXHearingAidDevice *)self rightSelectedStreamingProgram];
        if (v88)
        {
          v89 = [(AXHearingAidDevice *)self rightSelectedStreamingProgram];
          goto LABEL_147;
        }
LABEL_148:
        uint64_t v91 = 0xFFFFFFFFLL;
        goto LABEL_149;
      }
      id v18 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithShort:", -[AXHearingAidDevice leftSensitivitySteps](self, "leftSensitivitySteps"));
      unint64_t v25 = NSNumber;
      uint64_t v26 = [(AXHearingAidDevice *)self rightSensitivitySteps];
LABEL_105:
      uint64_t v66 = [v25 numberWithShort:v26];
LABEL_108:
      long long v68 = (void *)v66;
      objc_msgSend(v18, "arrayWithObjects:", v20, v66, 0);
      BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_159;
    }
    if ((uint64_t)a3 > 0x1FFFFFFF)
    {
      if ((uint64_t)a3 > 0x7FFFFFFF)
      {
        switch(a3)
        {
          case 0x80000000uLL:
            id v18 = (void *)MEMORY[0x263EFF8C0];
            v56 = NSNumber;
            [(AXHearingAidDevice *)self leftSensitivity];
            uint64_t v20 = objc_msgSend(v56, "numberWithDouble:");
            int v21 = NSNumber;
            [(AXHearingAidDevice *)self rightSensitivity];
            goto LABEL_107;
          case 0x100000000uLL:
            id v18 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithShort:", -[AXHearingAidDevice leftMicrophoneVolumeSteps](self, "leftMicrophoneVolumeSteps"));
            unint64_t v25 = NSNumber;
            uint64_t v26 = [(AXHearingAidDevice *)self rightMicrophoneVolumeSteps];
            break;
          case 0x200000000uLL:
            id v18 = (void *)MEMORY[0x263EFF8C0];
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithShort:", -[AXHearingAidDevice leftStreamVolumeSteps](self, "leftStreamVolumeSteps"));
            unint64_t v25 = NSNumber;
            uint64_t v26 = [(AXHearingAidDevice *)self rightStreamVolumeSteps];
            break;
          default:
            goto LABEL_113;
        }
        goto LABEL_105;
      }
      if (a3 != 0x20000000)
      {
        if (a3 != 0x40000000) {
          goto LABEL_113;
        }
        v112[0] = &unk_26C1E5540;
        objc_msgSend(NSNumber, "numberWithBool:", -[AXHearingAidDevice supportsCombinedPresets](self, "supportsCombinedPresets"));
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        v112[1] = v7;
        id v15 = objc_msgSend(NSNumber, "numberWithBool:", -[AXHearingAidDevice supportsCombinedVolumes](self, "supportsCombinedVolumes"));
        v112[2] = v15;
        uint64_t v42 = objc_msgSend(NSNumber, "numberWithBool:", -[AXHearingAidDevice supportsBinauralStreaming](self, "supportsBinauralStreaming"));
        v112[3] = v42;
        uint64_t v43 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v44 = v112;
        goto LABEL_100;
      }
      if (([(AXHearingAidDevice *)self leftAvailable]
         || [(AXHearingAidDevice *)self rightAvailable])
        && (BOOL leftPeripheralPaired = self->_leftPeripheralPaired,
            leftPeripheralPaired == [(AXHearingAidDevice *)self leftAvailable]))
      {
        BOOL rightPeripheralPaired = self->_rightPeripheralPaired;
        BOOL v48 = rightPeripheralPaired == [(AXHearingAidDevice *)self rightAvailable];
      }
      else
      {
        BOOL v48 = 0;
      }
      id v49 = NSNumber;
    }
    else
    {
      if ((uint64_t)a3 <= 0x1FFFFFF)
      {
        if (a3 == 0x800000)
        {
          id v7 = [MEMORY[0x263EFF980] array];
          int v64 = [(AXHearingAidDevice *)self leftHardwareVersion];
          if (v64)
          {
            int v65 = [(AXHearingAidDevice *)self leftHardwareVersion];
            [v7 addObject:v65];
          }
          else
          {
            [v7 addObject:&stru_26C1D5720];
          }

          v86 = [(AXHearingAidDevice *)self rightHardwareVersion];
          if (v86)
          {
            uint64_t v87 = [(AXHearingAidDevice *)self rightHardwareVersion];
            goto LABEL_154;
          }
          goto LABEL_155;
        }
        if (a3 == 0x1000000)
        {
          uint64_t v6 = [(AXHearingAidDevice *)self deviceUUID];
          goto LABEL_134;
        }
        goto LABEL_113;
      }
      if (a3 == 0x2000000) {
        goto LABEL_68;
      }
      if (a3 != 0x4000000)
      {
        if (a3 == 0x10000000)
        {
          BOOL v10 = (__CFString *)MEMORY[0x263EFFA88];
          goto LABEL_159;
        }
        goto LABEL_113;
      }
      uint64_t v47 = NSNumber;
      BOOL v48 = [(AXHearingAidDevice *)self isPaired];
      id v49 = v47;
    }
    uint64_t v6 = [v49 numberWithBool:v48];
    goto LABEL_134;
  }
  if ((uint64_t)a3 <= 4095)
  {
    if ((uint64_t)a3 <= 63)
    {
      if ((uint64_t)a3 > 7)
      {
        if (a3 != 8)
        {
          if (a3 == 16 || a3 == 32)
          {
            id v7 = [MEMORY[0x263EFF980] array];
            int v8 = [(AXHearingAidDevice *)self leftUUID];
            if (v8)
            {
              id v9 = [(AXHearingAidDevice *)self leftUUID];
              [v7 addObject:v9];
            }
            else
            {
              [v7 addObject:&stru_26C1D5720];
            }

            v86 = [(AXHearingAidDevice *)self rightUUID];
            if (v86)
            {
              uint64_t v87 = [(AXHearingAidDevice *)self rightUUID];
LABEL_154:
              v93 = (void *)v87;
              [v7 addObject:v87];

LABEL_156:
              uint64_t v57 = [MEMORY[0x263EFF8C0] arrayWithArray:v7];
              goto LABEL_157;
            }
LABEL_155:
            [v7 addObject:&stru_26C1D5720];
            goto LABEL_156;
          }
          goto LABEL_113;
        }
        uint64_t v45 = NSNumber;
        uint64_t v46 = [(AXHearingAidDevice *)self availableEars];
LABEL_98:
        uint64_t v6 = [v45 numberWithUnsignedInt:v46];
        goto LABEL_134;
      }
      if (a3 == 2) {
        goto LABEL_68;
      }
      if (a3 != 4) {
        goto LABEL_113;
      }
      id v18 = (void *)MEMORY[0x263EFF8C0];
      id v31 = NSNumber;
      [(AXHearingAidDevice *)self leftBatteryLevel];
      uint64_t v20 = objc_msgSend(v31, "numberWithDouble:");
      int v21 = NSNumber;
      [(AXHearingAidDevice *)self rightBatteryLevel];
      goto LABEL_107;
    }
    if ((uint64_t)a3 > 255)
    {
      if (a3 == 256)
      {
        uint64_t v51 = [MEMORY[0x263EFF980] array];
        uint64_t v52 = [(AXHearingAidDevice *)self leftPrograms];
        v104[0] = MEMORY[0x263EF8330];
        v104[1] = 3221225472;
        v104[2] = __39__AXHearingAidDevice_valueForProperty___block_invoke;
        v104[3] = &unk_2640FD3F0;
        id v105 = v51;
        id v7 = v51;
        [v52 enumerateObjectsUsingBlock:v104];

        v53 = [MEMORY[0x263EFF980] array];
        v54 = [(AXHearingAidDevice *)self rightPrograms];
        v102[0] = MEMORY[0x263EF8330];
        v102[1] = 3221225472;
        v102[2] = __39__AXHearingAidDevice_valueForProperty___block_invoke_2;
        v102[3] = &unk_2640FD3F0;
        id v103 = v53;
        id v55 = v53;
        [v54 enumerateObjectsUsingBlock:v102];

        objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", v7, v55, 0);
        BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_158:
        goto LABEL_159;
      }
      if (a3 == 512)
      {
        v113[0] = &unk_26C1E54F8;
        id v7 = [(AXHearingAidDevice *)self manufacturer];
        v113[1] = &unk_26C1E5510;
        v114[0] = v7;
        id v15 = [(AXHearingAidDevice *)self model];
        v114[1] = v15;
        uint64_t v50 = [NSDictionary dictionaryWithObjects:v114 forKeys:v113 count:2];
        goto LABEL_91;
      }
      if (a3 != 1024) {
        goto LABEL_113;
      }
      uint64_t v22 = [(AXHearingAidDevice *)self leftSelectedProgram];
      if (v22)
      {
        int v23 = [(AXHearingAidDevice *)self leftSelectedProgram];
        uint64_t v24 = [v23 index];
      }
      else
      {
        uint64_t v24 = 0xFFFFFFFFLL;
      }

      v88 = [(AXHearingAidDevice *)self rightSelectedProgram];
      if (v88)
      {
        v89 = [(AXHearingAidDevice *)self rightSelectedProgram];
LABEL_147:
        v90 = v89;
        uint64_t v91 = [v89 index];

LABEL_149:
        v92 = (void *)MEMORY[0x263EFF8C0];
        id v7 = [NSNumber numberWithInt:v24];
        uint64_t v60 = [NSNumber numberWithInt:v91];
        objc_msgSend(v92, "arrayWithObjects:", v7, v60, 0);
        BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_150:

        goto LABEL_158;
      }
      goto LABEL_148;
    }
    if (a3 == 64)
    {
      id v18 = (void *)MEMORY[0x263EFF8C0];
      int v67 = NSNumber;
      [(AXHearingAidDevice *)self leftMicrophoneVolume];
      uint64_t v20 = objc_msgSend(v67, "numberWithDouble:");
      int v21 = NSNumber;
      [(AXHearingAidDevice *)self rightMicrophoneVolume];
    }
    else
    {
      if (a3 != 128) {
        goto LABEL_113;
      }
      id v18 = (void *)MEMORY[0x263EFF8C0];
      char v41 = NSNumber;
      [(AXHearingAidDevice *)self leftStreamVolume];
      uint64_t v20 = objc_msgSend(v41, "numberWithDouble:");
      int v21 = NSNumber;
      [(AXHearingAidDevice *)self rightStreamVolume];
    }
LABEL_107:
    uint64_t v66 = objc_msgSend(v21, "numberWithDouble:");
    goto LABEL_108;
  }
  if ((uint64_t)a3 >= 0x20000)
  {
    if ((uint64_t)a3 < 0x100000)
    {
      if (a3 != 0x20000)
      {
        if (a3 != 0x40000)
        {
          if (a3 == 0x80000)
          {
            double v5 = [(AXHearingAidDevice *)self manufacturer];
LABEL_95:
            id v7 = v5;
            uint64_t v57 = [v5 firstObject];
LABEL_157:
            BOOL v10 = (__CFString *)v57;
            goto LABEL_158;
          }
          goto LABEL_113;
        }
        uint64_t v6 = [(AXHearingAidDevice *)self name];
LABEL_134:
        BOOL v10 = (__CFString *)v6;
        goto LABEL_159;
      }
LABEL_68:
      HAInitializeLogging();
      int v32 = NSString;
      uint64_t v33 = hearingPropertyDescription(a3);
      id v34 = [v32 stringWithFormat:@"Reading component property %@", v33];

      uint64_t v35 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice valueForProperty:]", 2602, v34];
      id v36 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
        id v37 = v35;
        uint64_t v38 = v36;
        *(_DWORD *)long long buf = 136446210;
        uint64_t v107 = [v37 UTF8String];
        _os_log_impl(&dword_20CC86000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
      BOOL v10 = &stru_26C1D5720;
      goto LABEL_159;
    }
    if (a3 == 0x100000)
    {
      double v5 = [(AXHearingAidDevice *)self model];
      goto LABEL_95;
    }
    if (a3 != 0x200000)
    {
      if (a3 == 0x400000)
      {
        id v7 = [MEMORY[0x263EFF980] array];
        double v27 = [(AXHearingAidDevice *)self leftFirmwareVersion];
        if (v27)
        {
          uint64_t v28 = [(AXHearingAidDevice *)self leftFirmwareVersion];
          [v7 addObject:v28];
        }
        else
        {
          [v7 addObject:&stru_26C1D5720];
        }

        v86 = [(AXHearingAidDevice *)self rightFirmwareVersion];
        if (v86)
        {
          uint64_t v87 = [(AXHearingAidDevice *)self rightFirmwareVersion];
          goto LABEL_154;
        }
        goto LABEL_155;
      }
      goto LABEL_113;
    }
    id v58 = (void *)MEMORY[0x263EFF8C0];
    v59 = NSNumber;
    id v7 = [(AXHearingAidDevice *)self leftPeripheral];
    uint64_t v60 = objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v7, "state"));
    int v61 = NSNumber;
    uint64_t v62 = [(AXHearingAidDevice *)self rightPeripheral];
    int v63 = objc_msgSend(v61, "numberWithInteger:", objc_msgSend(v62, "state"));
    objc_msgSend(v58, "arrayWithObjects:", v60, v63, 0);
    BOOL v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_150;
  }
  if ((uint64_t)a3 < 0x4000)
  {
    if (a3 == 4096 || a3 == 0x2000) {
      goto LABEL_68;
    }
    goto LABEL_113;
  }
  if (a3 == 0x4000 || a3 == 0x8000) {
    goto LABEL_68;
  }
  if (a3 == 0x10000)
  {
    uint64_t v11 = [(AXHearingAidDevice *)self leftPeripheral];
    unint64_t v12 = [(AXHearingAidDevice *)self availablePropertiesForPeripheral:v11];

    id v13 = [(AXHearingAidDevice *)self rightPeripheral];
    unint64_t v14 = [(AXHearingAidDevice *)self availablePropertiesForPeripheral:v13];

    id v7 = [NSNumber numberWithUnsignedLongLong:v12];
    v111[0] = v7;
    id v15 = [NSNumber numberWithUnsignedLongLong:v14];
    v111[1] = v15;
    id v16 = (void *)MEMORY[0x263EFF8C0];
    id v17 = v111;
LABEL_88:
    uint64_t v50 = [v16 arrayWithObjects:v17 count:2];
LABEL_91:
    BOOL v10 = (__CFString *)v50;
LABEL_101:

    goto LABEL_158;
  }
LABEL_113:
  HAInitializeLogging();
  long long v71 = objc_msgSend(NSString, "stringWithFormat:", @"Compound property: %ld", a3);
  long long v72 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice valueForProperty:]", 2607, v71];
  long long v73 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v74 = v72;
    long long v75 = v73;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v107 = [v74 UTF8String];
    _os_log_impl(&dword_20CC86000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v76 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v77 = 0;
  while (((1 << v77) & a3) == 0)
  {
LABEL_126:
    if (++v77 == 64) {
      goto LABEL_164;
    }
  }
  objc_super v78 = [(id)objc_opt_class() characteristicsUUIDs];
  v79 = [NSNumber numberWithUnsignedLongLong:1 << v77];
  uint64_t v80 = [v78 objectForKey:v79];

  if (v77 != 16 && !v80)
  {
    HAInitializeLogging();
    uint64_t v81 = objc_msgSend(NSString, "stringWithFormat:", @"Ignored property without characteristic: %ld", a3);
    id v82 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice valueForProperty:]", 2636, v81];
    v83 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v82 = v82;
      v84 = v83;
      uint64_t v85 = [v82 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v107 = v85;
      _os_log_impl(&dword_20CC86000, v84, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    goto LABEL_124;
  }
  if (1 << v77 != a3)
  {
    uint64_t v81 = [(AXHearingAidDevice *)self valueForProperty:1 << v77];
    if (!v81)
    {
LABEL_125:

      goto LABEL_126;
    }
    id v82 = [NSNumber numberWithUnsignedLongLong:1 << v77];
    [v76 setObject:v81 forKey:v82];
LABEL_124:

    goto LABEL_125;
  }
  v95 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_FAULT)) {
    -[AXHearingAidDevice valueForProperty:](v95, a3);
  }
LABEL_164:
  if ([v76 count])
  {
    BOOL v10 = [NSDictionary dictionaryWithDictionary:v76];
  }
  else
  {
    HAInitializeLogging();
    v96 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown property: %ld", a3);
    v97 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice valueForProperty:]", 2647, v96];
    v98 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v99 = v97;
      v100 = v98;
      uint64_t v101 = [v99 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v107 = v101;
      _os_log_impl(&dword_20CC86000, v100, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    BOOL v10 = &stru_26C1D5720;
  }

LABEL_159:

  return v10;
}

void __39__AXHearingAidDevice_valueForProperty___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 transportRepresentation];
  [v2 addObject:v3];
}

void __39__AXHearingAidDevice_valueForProperty___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 transportRepresentation];
  [v2 addObject:v3];
}

- (id)deviceDescription
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = [(AXHearingAidDevice *)self deviceUUID];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    double v5 = [MEMORY[0x263EFF9A0] dictionary];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__AXHearingAidDevice_deviceDescription__block_invoke;
    v15[3] = &unk_2640FD460;
    v15[4] = self;
    id v16 = v5;
    id v6 = v5;
    [&unk_26C1E5D48 enumerateObjectsUsingBlock:v15];
    id v7 = NSDictionary;
    int v8 = [(AXHearingAidDevice *)self deviceUUID];
    id v9 = [v7 dictionaryWithObject:v6 forKey:v8];
  }
  else
  {
    HAInitializeLogging();
    id v6 = [NSString stringWithFormat:@"DeviceUUID NULL %@", self];
    BOOL v10 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice deviceDescription]", 2660, v6];
    uint64_t v11 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v10;
      id v13 = v11;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v18 = [v12 UTF8String];
      _os_log_impl(&dword_20CC86000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

void __39__AXHearingAidDevice_deviceDescription__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "valueForProperty:", objc_msgSend(v4, "integerValue"));
  if (v3) {
    [*(id *)(a1 + 40) setObject:v3 forKey:v4];
  }
}

- (void)peripheralDidUpdateName:(id)a3
{
  id v4 = [a3 name];

  if (v4)
  {
    [(AXHearingAidDevice *)self updateName];
  }
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  HAInitializeLogging();
  int v8 = [NSString stringWithFormat:@"Reloading services %@, %@", v6, v7];

  id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didModifyServices:]", 2692, v8];
  BOOL v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    id v12 = v10;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v19 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v13 = (void *)MEMORY[0x263EFF8C0];
  unint64_t v14 = [(AXHearingAidDevice *)self serviceUUID];
  id v15 = [MEMORY[0x263EFEF88] UUIDWithString:@"180a"];
  id v16 = [MEMORY[0x263EFEF88] UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
  id v17 = objc_msgSend(v13, "arrayWithObjects:", v14, v15, v16, 0);
  [v6 discoverServices:v17];
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    HAInitializeLogging();
    id v8 = [NSString stringWithFormat:@"Error discovering services (%@): %@", v6, v7];
    id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverServices:]", 2747, v8];
    BOOL v10 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
LABEL_3:
      id v9 = v9;
      id v11 = v10;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v33 = [v9 UTF8String];
      _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    id v12 = [v6 services];
    uint64_t v13 = [v12 count];

    HAInitializeLogging();
    unint64_t v14 = NSString;
    if (!v13)
    {
      id v8 = [NSString stringWithFormat:@"EMPTY SERVICES"];
      id v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverServices:]", 2705, v8];
      BOOL v10 = (void *)*MEMORY[0x263F47290];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
    id v15 = [v6 services];
    id v16 = [v14 stringWithFormat:@"%@ - %@", v6, v15];

    id v17 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverServices:]", 2709, v16];
    uint64_t v18 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v19 = v17;
      uint64_t v20 = v18;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v33 = [v19 UTF8String];
      _os_log_impl(&dword_20CC86000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    int v21 = [(AXHearingAidDevice *)self serviceUUID];
    uint64_t v22 = [MEMORY[0x263EFEF88] UUIDWithString:@"180a"];
    int v23 = [MEMORY[0x263EFEF88] UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
    uint64_t v24 = [v6 services];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke;
    v26[3] = &unk_2640FD4B0;
    id v27 = v22;
    id v28 = v23;
    id v29 = v6;
    id v30 = v21;
    id v31 = self;
    id v25 = v21;
    id v9 = v23;
    id v8 = v22;
    [v24 enumerateObjectsUsingBlock:v26];
  }
LABEL_9:
}

void __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a2;
  double v5 = [v4 UUID];
  char v6 = [v5 isEqual:*(void *)(a1 + 32)];
  if ((v6 & 1) != 0
    || ([v4 UUID],
        id v2 = objc_claimAutoreleasedReturnValue(),
        ([v2 isEqual:*(void *)(a1 + 40)] & 1) != 0))
  {
    id v7 = [v4 characteristics];
    uint64_t v8 = [v7 count];

    if ((v6 & 1) == 0) {
    if (!v8)
    }
      goto LABEL_13;
  }
  else
  {
  }
  id v9 = [v4 UUID];
  if ([v9 isEqual:*(void *)(a1 + 56)])
  {
    BOOL v10 = [v4 characteristics];
    uint64_t v11 = [v10 count];

    if (!v11)
    {
      objc_msgSend(*(id *)(a1 + 64), "setLeftLoadedProperties:", objc_msgSend(*(id *)(a1 + 64), "leftLoadedProperties") | 0x8000);
      objc_msgSend(*(id *)(a1 + 64), "setRightLoadedProperties:", objc_msgSend(*(id *)(a1 + 64), "rightLoadedProperties") | 0x8000);
      id v12 = [MEMORY[0x263EFF980] array];
      uint64_t v13 = [(id)objc_opt_class() characteristicsUUIDs];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke_2;
      v26[3] = &unk_2640FD488;
      id v27 = v12;
      id v14 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:v26];

      [*(id *)(a1 + 48) discoverCharacteristics:v14 forService:v4];
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v15 = [v4 UUID];
  int v16 = [v15 isEqual:*(void *)(a1 + 40)];

  if (v16)
  {
LABEL_13:
    [*(id *)(a1 + 48) discoverCharacteristics:0 forService:v4];
    goto LABEL_19;
  }
  id v17 = [v4 characteristics];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    [*(id *)(a1 + 64) loadBasicProperties];
  }
  else
  {
    HAInitializeLogging();
    id v19 = NSString;
    uint64_t v20 = [v4 UUID];
    int v21 = [v19 stringWithFormat:@"Unknown service: %@ - %@", v4, v20];

    uint64_t v22 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverServices:]_block_invoke", 2736, v21];
    int v23 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v24 = v22;
      id v25 = v23;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = [v24 UTF8String];
      _os_log_impl(&dword_20CC86000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
LABEL_19:
}

uint64_t __53__AXHearingAidDevice_peripheral_didDiscoverServices___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10)
  {
    id v15 = [v9 characteristics];
    uint64_t v16 = [v15 count];

    HAInitializeLogging();
    id v17 = NSString;
    if (!v16)
    {
      uint64_t v11 = [NSString stringWithFormat:@"EMPTY CHARACTERISTICS %@", v9];
      id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2759, v11];
      uint64_t v13 = (void *)*MEMORY[0x263F47290];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      goto LABEL_3;
    }
    uint64_t v18 = [v9 characteristics];
    id v19 = [v17 stringWithFormat:@"%@ - %@", v8, v18];

    uint64_t v20 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2763, v19];
    int v21 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v20;
      int v23 = v21;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v61 = [v22 UTF8String];
      _os_log_impl(&dword_20CC86000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    uint64_t v11 = [(AXHearingAidDevice *)self serviceUUID];
    id v12 = [MEMORY[0x263EFEF88] UUIDWithString:@"180a"];
    id v14 = [MEMORY[0x263EFEF88] UUIDWithString:@"8341F2B4-C013-4F04-8197-C4CDB42E26DC"];
    id v24 = [v9 UUID];
    int v25 = [v24 isEqual:v12];

    if (v25)
    {
      uint64_t v26 = [v9 characteristics];
      uint64_t v27 = [v26 count];

      if (v27)
      {
        id v28 = [v9 characteristics];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __76__AXHearingAidDevice_peripheral_didDiscoverCharacteristicsForService_error___block_invoke;
        v58[3] = &unk_2640FD4D8;
        v58[4] = self;
        id v59 = v8;
        [v28 enumerateObjectsUsingBlock:v58];
      }
      else
      {
        [v8 discoverCharacteristics:0 forService:v9];
      }
      goto LABEL_4;
    }
    uint64_t v29 = [v9 UUID];
    int v30 = [v29 isEqual:v14];

    if (v30)
    {
      HAInitializeLogging();
      id v31 = [NSString stringWithFormat:@"Loaded auth service characteristics"];
      int v32 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2783, v31];
      uint64_t v33 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        id v40 = v32;
        char v41 = v33;
        uint64_t v42 = [v40 UTF8String];
        *(_DWORD *)long long buf = 136446210;
        uint64_t v61 = v42;
        _os_log_impl(&dword_20CC86000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v34 = [v9 UUID];
      int v35 = [v34 isEqual:v11];

      if (v35)
      {
        [(AXHearingAidDevice *)self setLeftLoadedProperties:[(AXHearingAidDevice *)self leftLoadedProperties] | 0x10000];
        [(AXHearingAidDevice *)self setRightLoadedProperties:[(AXHearingAidDevice *)self rightLoadedProperties] | 0x10000];
        if ([(AXHearingAidDevice *)self isPaired]
          || [(AXHearingAidDevice *)self peripheral:v8 didLoadProperty:56])
        {
          if (![(AXHearingAidDevice *)self isPaired]) {
            goto LABEL_4;
          }
          id v36 = [(AXHearingAidDevice *)self rightPeripheral];

          if (v36 == v8)
          {
            [(AXHearingAidDevice *)self setRightMicrophoneVolumeSteps:1];
            [(AXHearingAidDevice *)self setRightSensitivitySteps:1];
            [(AXHearingAidDevice *)self setRightStreamVolumeSteps:1];
            [(AXHearingAidDevice *)self setRightMixedVolumeSteps:1];
          }
          else
          {
            [(AXHearingAidDevice *)self setLeftMicrophoneVolumeSteps:1];
            [(AXHearingAidDevice *)self setLeftSensitivitySteps:1];
            [(AXHearingAidDevice *)self setLeftStreamVolumeSteps:1];
            [(AXHearingAidDevice *)self setLeftMixedVolumeSteps:1];
          }
          uint64_t v50 = +[AXHearingAidDeviceController sharedController];
          [v50 device:self didUpdateProperty:0x5F7800000C0];

          [(AXHearingAidDevice *)self loadRequiredProperties];
          if (!self->_keepInSync) {
            goto LABEL_4;
          }
          uint64_t v51 = [(AXHearingAidDevice *)self leftPeripheral];
          [(AXHearingAidDevice *)self setNotify:1 forPeripheral:v51];

          BOOL keepInSync = self->_keepInSync;
          v53 = [(AXHearingAidDevice *)self rightPeripheral];
          [(AXHearingAidDevice *)self setNotify:keepInSync forPeripheral:v53];

          [(AXHearingAidDevice *)self setLeftLoadedProperties:[(AXHearingAidDevice *)self leftLoadedProperties] & 0xFFFFFF007FFEFA3BLL];
          [(AXHearingAidDevice *)self setRightLoadedProperties:[(AXHearingAidDevice *)self rightLoadedProperties] & 0xFFFFFF007FFEFA3BLL];
          v54 = [(AXHearingAidDevice *)self leftPeripheral];
          [(AXHearingAidDevice *)self loadProperties:0xFF800105C4 forPeripheral:v54 withRetryPeriod:0.0];

          uint64_t v43 = [(AXHearingAidDevice *)self rightPeripheral];
          [(AXHearingAidDevice *)self loadProperties:0xFF800105C4 forPeripheral:v43 withRetryPeriod:0.0];
        }
        else
        {
          uint64_t v43 = [(AXHearingAidDevice *)self peripheral:v8 characteristicForProperty:8];
          if (v43) {
            [(AXHearingAidDevice *)self readValueForCharacteristic:v43 fromPeripheral:v8];
          }
          uint64_t v44 = [(AXHearingAidDevice *)self peripheral:v8 characteristicForProperty:0x10000000000];
          if (!v44)
          {
            HAInitializeLogging();
            v56 = [NSString stringWithFormat:@"The characteristic for input availability is nil"];
            id v57 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2802, v56];
            uint64_t v45 = (void *)*MEMORY[0x263F47290];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
            {
              id v55 = v57;
              uint64_t v46 = v45;
              uint64_t v47 = [v55 UTF8String];
              *(_DWORD *)long long buf = 136446210;
              uint64_t v61 = v47;
              _os_log_impl(&dword_20CC86000, v46, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            }
            BOOL v48 = +[HUHearingAidSettings sharedInstance];
            [v48 setAvailableInputEars:0];

            [(AXHearingAidDevice *)self setAvailableInputEars:0];
            id v49 = [(AXHearingAidDevice *)self rightPeripheral];

            if (v49 == v8) {
              [(AXHearingAidDevice *)self setRightLeaVersion:1];
            }
            else {
              [(AXHearingAidDevice *)self setLeftLeaVersion:1];
            }
          }
          [(AXHearingAidDevice *)self updateName];
        }
LABEL_4:

        goto LABEL_5;
      }
      HAInitializeLogging();
      id v37 = NSString;
      unsigned int v38 = [v8 hasTag:@"IsMFiAuthenticated_CertClass0B"];
      uint64_t v39 = [v9 UUID];
      id v31 = [v37 stringWithFormat:@"Unknown service: (%d) %@ - %@", v38, v9, v39];

      int v32 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2851, v31];
      uint64_t v33 = (void *)*MEMORY[0x263F47290];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
    }

    goto LABEL_4;
  }
  HAInitializeLogging();
  uint64_t v11 = [NSString stringWithFormat:@"Error discovering characteristics (%@): %@", v9, v10];
  id v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didDiscoverCharacteristicsForService:error:]", 2857, v11];
  uint64_t v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
LABEL_3:
    id v12 = v12;
    id v14 = v13;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v61 = [v12 UTF8String];
    _os_log_impl(&dword_20CC86000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    goto LABEL_4;
  }
LABEL_5:
}

uint64_t __76__AXHearingAidDevice_peripheral_didDiscoverCharacteristicsForService_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) readValueForCharacteristic:a2 fromPeripheral:*(void *)(a1 + 40)];
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v9 = a4;
  if (v8)
  {
    HAInitializeLogging();
    id v10 = NSString;
    uint64_t v11 = [v9 UUID];
    uint64_t v12 = [v10 stringWithFormat:@"Error reading characteristic value (%@)(%@): %@", v9, v11, v8];

    uint64_t v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateValueForCharacteristic:error:]", 2871, v12];
    id v14 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      uint64_t v16 = v14;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v18 = [v15 UTF8String];
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    id v9 = (id)v12;
  }
  else
  {
    [(AXHearingAidDevice *)self peripheral:a3 didUpdateCharacteristic:v9];
  }
}

- (void)peripheral:(id)a3 didUpdateCharacteristic:(id)a4
{
  uint64_t v433 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [(AXHearingAidDevice *)self isFakeDevice];
  v398 = v7;
  v399 = v8;
  if (v7) {
    int v10 = 1;
  }
  else {
    int v10 = v9;
  }
  if (v8 && v10)
  {
    v397 = self;
    v394 = [(AXHearingAidDevice *)self serviceUUID];
    v395 = [MEMORY[0x263EFEF88] UUIDWithString:@"180a"];
    v396 = [v8 service];
    uint64_t v11 = [v396 UUID];
    int v12 = [v11 isEqual:v395];

    if (v12)
    {
      uint64_t v13 = [MEMORY[0x263EFEF88] UUIDWithString:@"2a29"];
      id v14 = [MEMORY[0x263EFEF88] UUIDWithString:@"2a24"];
      id v15 = [MEMORY[0x263EFEF88] UUIDWithString:@"2a26"];
      v392 = [MEMORY[0x263EFEF88] UUIDWithString:@"2a27"];
      uint64_t v16 = [v399 value];
      if (![v16 length])
      {
LABEL_246:

        goto LABEL_472;
      }
      id v17 = [(AXHearingAidDevice *)v397 rightPeripheral];

      id v18 = [NSString alloc];
      uint64_t v19 = [v399 value];
      uint64_t v20 = (void *)[v18 initWithData:v19 encoding:4];

      int v21 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      id v22 = [v20 stringByTrimmingCharactersInSet:v21];

      if ([v22 length])
      {
        int v23 = [v399 UUID];
        int v24 = [v23 isEqual:v13];

        if (v24)
        {
          HAInitializeLogging();
          int v25 = [NSString stringWithFormat:@"Manufacturer found: |%@|", v22];
          uint64_t v26 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2903, v25];
          uint64_t v27 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v28 = v26;
            uint64_t v29 = v27;
            LODWORD(buf) = 136446210;
            *(void *)((char *)&buf + 4) = [v28 UTF8String];
            _os_log_impl(&dword_20CC86000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          }
          NSLog(&cfstr_HearingAidManu.isa, v22);
          int v30 = [(AXHearingAidDevice *)v397 manufacturer];
          char v31 = [v30 containsObject:v22];

          if (v31) {
            goto LABEL_245;
          }
          int v32 = [(AXHearingAidDevice *)v397 manufacturer];
          uint64_t v33 = [(AXHearingAidDevice *)v397 leftPeripheral];
          [v32 replaceObjectAtIndex:v33 != v398 withObject:v22];

          uint64_t v34 = +[AXHearingAidDeviceController sharedController];
          [v34 device:v397 didUpdateProperty:0x80000];
          goto LABEL_244;
        }
        uint64_t v61 = [v399 UUID];
        int v62 = [v61 isEqual:v14];

        if (v62)
        {
          HAInitializeLogging();
          int v63 = [NSString stringWithFormat:@"Model Number found: |%@|", v22];
          int v64 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2914, v63];
          int v65 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v66 = v64;
            int v67 = v65;
            LODWORD(buf) = 136446210;
            *(void *)((char *)&buf + 4) = [v66 UTF8String];
            _os_log_impl(&dword_20CC86000, v67, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          }
          NSLog(&cfstr_HearingAidMode.isa, v22);
          long long v68 = [(AXHearingAidDevice *)v397 model];
          char v69 = [v68 containsObject:v22];

          if (v69) {
            goto LABEL_245;
          }
          long long v70 = [(AXHearingAidDevice *)v397 model];
          long long v71 = [(AXHearingAidDevice *)v397 leftPeripheral];
          [v70 replaceObjectAtIndex:v71 != v398 withObject:v22];

          uint64_t v34 = +[AXHearingAidDeviceController sharedController];
          [v34 device:v397 didUpdateProperty:0x100000];
          goto LABEL_244;
        }
        v90 = [v399 UUID];
        int v91 = [v90 isEqual:v15];

        if (v91)
        {
          HAInitializeLogging();
          v92 = [NSString stringWithFormat:@"Firmware version found: %@", v22];
          v93 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2925, v92];
          v94 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v95 = v93;
            v96 = v94;
            LODWORD(buf) = 136446210;
            *(void *)((char *)&buf + 4) = [v95 UTF8String];
            _os_log_impl(&dword_20CC86000, v96, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          }
          if (v17 == v398)
          {
            NSLog(&cfstr_HearingAidRigh.isa, v22);
            [(AXHearingAidDevice *)v397 setRightFirmwareVersion:v22];
          }
          else
          {
            NSLog(&cfstr_HearingAidLeft.isa, v22);
            [(AXHearingAidDevice *)v397 setLeftFirmwareVersion:v22];
          }
          uint64_t v34 = +[AXHearingAidDeviceController sharedController];
          [v34 device:v397 didUpdateProperty:0x400000];
LABEL_244:

          goto LABEL_245;
        }
        v108 = [v399 UUID];
        int v109 = [v108 isEqual:v392];

        if (v109)
        {
          HAInitializeLogging();
          v110 = [NSString stringWithFormat:@"Hardware version found: %@", v22];
          v111 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2941, v110];
          v112 = (void *)*MEMORY[0x263F47290];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
          {
            id v113 = v111;
            v114 = v112;
            LODWORD(buf) = 136446210;
            *(void *)((char *)&buf + 4) = [v113 UTF8String];
            _os_log_impl(&dword_20CC86000, v114, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          }
          if (v17 == v398)
          {
            NSLog(&cfstr_HearingAidRigh_0.isa, v22);
            [(AXHearingAidDevice *)v397 setRightHardwareVersion:v22];
          }
          else
          {
            NSLog(&cfstr_HearingAidLeft_0.isa, v22);
            [(AXHearingAidDevice *)v397 setLeftHardwareVersion:v22];
          }
          uint64_t v34 = +[AXHearingAidDeviceController sharedController];
          [v34 device:v397 didUpdateProperty:0x800000];
          goto LABEL_244;
        }
      }
LABEL_245:

      goto LABEL_246;
    }
    int v35 = [v396 UUID];
    int v36 = [v35 isEqual:v394];

    if (!v36)
    {
LABEL_472:

      goto LABEL_473;
    }
    uint64_t v37 = [(AXHearingAidDevice *)v397 peripheral:v398 propertyForCharacteristic:v399];
    HAInitializeLogging();
    unsigned int v38 = NSString;
    uint64_t v39 = hearingPropertyDescription(v37);
    id v40 = [v399 value];
    char v41 = [(AXHearingAidDevice *)v397 leftPeripheral];
    uint64_t v42 = @"Right";
    if (v41 == v398) {
      uint64_t v42 = @"Left";
    }
    uint64_t v43 = [v38 stringWithFormat:@"Getting property: %@ (%@) for %@ - %@", v39, v40, v42, v398];

    uint64_t v44 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 2961, v43];
    uint64_t v45 = (os_log_t *)MEMORY[0x263F47290];
    uint64_t v46 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v47 = v44;
      BOOL v48 = v46;
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = [v47 UTF8String];
      _os_log_impl(&dword_20CC86000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    }
    v427[0] = MEMORY[0x263EF8330];
    v427[1] = 3221225472;
    v427[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke;
    v427[3] = &unk_2640FD500;
    v427[4] = v397;
    v427[5] = v37;
    [(AXHearingAidDevice *)v397 checkPairingStatusWithCompletion:v427];
    if (v37 <= 0x3FFFFFFF)
    {
      id v49 = v397;
      if (v37 > 255)
      {
        if (v37 >= 0x2000)
        {
          if (v37 < 0x20000)
          {
            if (v37 == 0x2000)
            {
              v134 = [(AXHearingAidDevice *)v397 rightPeripheral];

              char v416 = 0;
              v135 = [(AXHearingAidDevice *)v397 peripheral:v398 characteristicForProperty:4096];
              v136 = [v135 value];
              [v136 getBytes:&v416 length:1];

              if (v134 == v398)
              {
                v137 = [(AXHearingAidDevice *)v397 rightPrograms];
                [(AXHearingAidDevice *)v397 rightSelectedProgram];
              }
              else
              {
                v137 = [(AXHearingAidDevice *)v397 leftPrograms];
                [(AXHearingAidDevice *)v397 leftSelectedProgram];
              v238 = };
              *(void *)&long long buf = 0;
              *((void *)&buf + 1) = &buf;
              uint64_t v429 = 0x3032000000;
              v430 = __Block_byref_object_copy__0;
              v431 = __Block_byref_object_dispose__0;
              id v432 = 0;
              uint64_t v410 = 0;
              v411 = &v410;
              uint64_t v412 = 0x3032000000;
              v413 = __Block_byref_object_copy__0;
              v414 = __Block_byref_object_dispose__0;
              id v415 = 0;
              v408[0] = MEMORY[0x263EF8330];
              v408[1] = 3221225472;
              v408[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_477;
              v408[3] = &unk_2640FD5E0;
              char v409 = v416;
              v408[4] = &buf;
              v408[5] = &v410;
              [v137 enumerateObjectsUsingBlock:v408];
              v239 = v398;
              if (*(void *)(*((void *)&buf + 1) + 40))
              {
                uint64_t v402 = 0;
                v403 = &v402;
                uint64_t v404 = 0x3032000000;
                v405 = __Block_byref_object_copy__0;
                v406 = __Block_byref_object_dispose__0;
                id v407 = 0;
                id v240 = [v399 value];
                uint64_t v241 = [v240 bytes];

                if (v241)
                {
                  id v242 = [NSString alloc];
                  v243 = [v399 value];
                  uint64_t v244 = objc_msgSend(v242, "initWithBytes:length:encoding:", v241, objc_msgSend(v243, "length"), 4);
                  v245 = (void *)v403[5];
                  v403[5] = v244;

                  v246 = (void *)v403[5];
                  v247 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
                  uint64_t v248 = [v246 stringByTrimmingCharactersInSet:v247];
                  v249 = (void *)v403[5];
                  v403[5] = v248;

                  v250 = (void *)v403[5];
                  v251 = [MEMORY[0x263F08708] controlCharacterSet];
                  uint64_t v252 = [v250 stringByTrimmingCharactersInSet:v251];
                  v253 = (void *)v403[5];
                  v403[5] = v252;
                }
                if (![(id)v403[5] length])
                {
                  v254 = NSString;
                  v255 = hearingLocString(@"DefaultProgramName");
                  v256 = (void *)MEMORY[0x263F08A30];
                  v257 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "index"));
                  v258 = [v256 localizedStringFromNumber:v257 numberStyle:1];
                  uint64_t v259 = objc_msgSend(v254, "stringWithFormat:", v255, v258);
                  v260 = (void *)v403[5];
                  v403[5] = v259;

                  if (v134 == v398) {
                    [(AXHearingAidDevice *)v397 leftPrograms];
                  }
                  else {
                  v341 = [(AXHearingAidDevice *)v397 rightPrograms];
                  }
                  v401[0] = MEMORY[0x263EF8330];
                  v401[1] = 3221225472;
                  v401[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_478;
                  v401[3] = &unk_2640FD608;
                  v401[4] = &buf;
                  v401[5] = &v402;
                  [v341 enumerateObjectsUsingBlock:v401];
                }
                [*(id *)(*((void *)&buf + 1) + 40) setName:v403[5]];
                v342 = +[AXHearingAidDeviceController sharedController];
                [v342 device:v397 didUpdateProperty:1280];

                _Block_object_dispose(&v402, 8);
                v239 = v398;
              }
              v343 = (void *)v411[5];
              if (v343)
              {
                objc_msgSend(v343, "setSyncAttempts:", objc_msgSend((id)v411[5], "syncAttempts") + 1);
                uint64_t v344 = v411[5];
                if (v134 == v239) {
                  [(AXHearingAidDevice *)v397 setCurrentRightProgram:v344];
                }
                else {
                  [(AXHearingAidDevice *)v397 setCurrentLeftProgram:v344];
                }
                uint64_t v345 = [(id)v411[5] index];
                if (v134 == v239) {
                  uint64_t v346 = 4;
                }
                else {
                  uint64_t v346 = 2;
                }
                [(AXHearingAidDevice *)v397 writeInt:v345 toEar:v346 forProperty:4096];
              }
              else if (!v238)
              {
                [(AXHearingAidDevice *)v397 readProperty:1024 fromPeripheral:v239];
              }
              _Block_object_dispose(&v410, 8);

              _Block_object_dispose(&buf, 8);
              goto LABEL_451;
            }
            if (v37 == 0x4000)
            {
              LOBYTE(v410) = 0;
              uint64_t v50 = [(AXHearingAidDevice *)v397 peripheral:v398 characteristicForProperty:4096];
              uint64_t v51 = [v50 value];
              [v51 getBytes:&v410 length:1];

              uint64_t v52 = [(AXHearingAidDevice *)v397 rightPeripheral];
              if (v52 == v398) {
                [(AXHearingAidDevice *)v397 rightPrograms];
              }
              else {
              v228 = [(AXHearingAidDevice *)v397 leftPrograms];
              }

              v417[0] = MEMORY[0x263EF8330];
              v417[1] = 3221225472;
              v417[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3_472;
              v417[3] = &__block_descriptor_33_e33_B32__0__AXHearingAidMode_8Q16_B24l;
              char v418 = v410;
              uint64_t v229 = [v228 indexOfObjectPassingTest:v417];
              if (v229 == 0x7FFFFFFFFFFFFFFFLL)
              {
                HAInitializeLogging();
                v230 = [NSString stringWithFormat:@"Not setting category"];
                id v231 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3478, v230];
                os_log_t v232 = *v45;
                if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
                {
                  id v231 = v231;
                  v233 = v232;
                  uint64_t v234 = [v231 UTF8String];
                  LODWORD(buf) = 136446210;
                  *(void *)((char *)&buf + 4) = v234;
                  _os_log_impl(&dword_20CC86000, v233, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
                }
              }
              else
              {
                v230 = [v228 objectAtIndex:v229];
                id v231 = [v399 value];
                LODWORD(buf) = 0;
                [v231 getBytes:&buf length:4];
                [v230 setCategory:buf];
                v235 = +[AXHearingAidDeviceController sharedController];
                [v235 device:v397 didUpdateProperty:256];
              }
              goto LABEL_451;
            }
LABEL_452:
            if (!v49->_finishedLoading)
            {
              if ([(AXHearingAidDevice *)v49 didLoadBasicProperties])
              {
                BOOL v379 = [(AXHearingAidDevice *)v397 leftAvailable];
                v380 = v397;
                if (v379 || (BOOL v381 = [(AXHearingAidDevice *)v397 rightAvailable], v380 = v397, v381))
                {
                  v380->_finishedLoading = 1;
                  if (![(AXHearingAidDevice *)v380 leftAvailable]
                    || ![(AXHearingAidDevice *)v397 rightAvailable])
                  {
                    *(void *)&long long buf = 0;
                    *((void *)&buf + 1) = &buf;
                    uint64_t v429 = 0x3032000000;
                    v430 = __Block_byref_object_copy__0;
                    v431 = __Block_byref_object_dispose__0;
                    id v432 = 0;
                    if ([(AXHearingAidDevice *)v397 leftAvailable]) {
                      [(AXHearingAidDevice *)v397 leftUUID];
                    }
                    else {
                    v382 = [(AXHearingAidDevice *)v397 rightUUID];
                    }
                    v383 = +[AXHearingAidDeviceController sharedController];
                    v384 = [v383 hearingAidsForUUID:v382];
                    v400[0] = MEMORY[0x263EF8330];
                    v400[1] = 3221225472;
                    v400[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_488;
                    v400[3] = &unk_2640FD528;
                    v400[4] = v397;
                    v400[5] = &buf;
                    [v384 enumerateObjectsUsingBlock:v400];

                    if (*(void *)(*((void *)&buf + 1) + 40)
                      && [(AXHearingAidDevice *)v397 didLoadBasicProperties])
                    {
                      [(AXHearingAidDevice *)v397 mateWithDevice:*(void *)(*((void *)&buf + 1) + 40)];
                    }

                    _Block_object_dispose(&buf, 8);
                  }
                  v385 = +[AXHearingAidDeviceController sharedController];
                  [v385 deviceDidFinishLoading:v397];

                  if ([(AXHearingAidDevice *)v397 leftAvailable]) {
                    unsigned int v386 = 2;
                  }
                  else {
                    unsigned int v386 = 0;
                  }
                  if ([(AXHearingAidDevice *)v397 rightAvailable]) {
                    uint64_t v387 = v386 | 4;
                  }
                  else {
                    uint64_t v387 = v386;
                  }
                  [(AXHearingAidDevice *)v397 setAvailableEars:v387];
                }
              }
            }
            goto LABEL_472;
          }
          if (v37 != 0x20000)
          {
            if (v37 == 0x10000000)
            {
              v115 = [v399 value];
              if ([v115 length])
              {
                LODWORD(v410) = 0;
                [v115 getBytes:&v410 length:4];
                if ((v410 - 257) <= 0xFFFFFEFF)
                {
                  HAInitializeLogging();
                  v116 = objc_msgSend(NSString, "stringWithFormat:", @"Hearing aid out of spec: %d", v410);
                  v117 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3622, v116];
                  os_log_t v118 = *v45;
                  if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
                  {
                    id v119 = v117;
                    v120 = v118;
                    uint64_t v121 = [v119 UTF8String];
                    LODWORD(buf) = 136446210;
                    *(void *)((char *)&buf + 4) = v121;
                    _os_log_impl(&dword_20CC86000, v120, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
                  }
                  v122 = +[HUHearingAidSettings sharedInstance];
                  [v122 setPairedHearingAids:0];

                  [(AXHearingAidDevice *)v397 disconnectAndUnpair:1];
                }
                v123 = [(AXHearingAidDevice *)v397 leftPeripheral];
                BOOL v124 = v123 == v398;

                if (v124) {
                  [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x10000000];
                }
                else {
                  [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x10000000];
                }
                v322 = +[AXHearingAidDeviceController sharedController];
                [v322 device:v397 didUpdateProperty:0x10000000];
              }
              goto LABEL_451;
            }
            goto LABEL_452;
          }
          v211 = [(AXHearingAidDevice *)v397 rightPeripheral];

          v53 = [v399 value];
          if (![v53 length]) {
            goto LABEL_437;
          }
          BOOL v212 = v211 == v398;
          LODWORD(buf) = 0;
          [v53 getBytes:&buf length:4];
          int v213 = buf;
          if (v212)
          {
            if (v213 != [(AXHearingAidDevice *)v397 rightProgramVersion])
            {
              v310 = [MEMORY[0x263EFF980] array];
              [(AXHearingAidDevice *)v397 setRightPrograms:v310];

              [(AXHearingAidDevice *)v397 setCurrentRightProgram:0];
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] & 0xFFFFFFFFFFFFFEFFLL];
              v311 = [(AXHearingAidDevice *)v397 rightPropertiesLoadCount];
              v312 = [NSNumber numberWithUnsignedLongLong:256];
              [v311 removeObjectForKey:v312];

              uint64_t v217 = [(AXHearingAidDevice *)v397 rightPeripheral];
              goto LABEL_328;
            }
          }
          else if (v213 != [(AXHearingAidDevice *)v397 leftProgramVersion])
          {
            v214 = [MEMORY[0x263EFF980] array];
            [(AXHearingAidDevice *)v397 setLeftPrograms:v214];

            [(AXHearingAidDevice *)v397 setCurrentLeftProgram:0];
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] & 0xFFFFFFFFFFFFFEFFLL];
            v215 = [(AXHearingAidDevice *)v397 leftPropertiesLoadCount];
            v216 = [NSNumber numberWithUnsignedLongLong:256];
            [v215 removeObjectForKey:v216];

            uint64_t v217 = [(AXHearingAidDevice *)v397 leftPeripheral];
LABEL_328:
            v313 = (void *)v217;
            [(AXHearingAidDevice *)v397 loadProperties:256 forPeripheral:v217 withRetryPeriod:3.0];
          }
LABEL_437:

          goto LABEL_451;
        }
        if (v37 != 256)
        {
          if (v37 != 1024)
          {
            if (v37 != 4096) {
              goto LABEL_452;
            }
            LOBYTE(buf) = 0;
            v97 = [(AXHearingAidDevice *)v397 peripheral:v398 characteristicForProperty:4096];
            v98 = [v97 value];
            [v98 getBytes:&buf length:1];

            goto LABEL_451;
          }
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v429 = 0x2020000000;
          LOBYTE(v430) = 0;
          id v168 = [v399 value];
          uint64_t v169 = [v168 bytes];

          v170 = [(AXHearingAidDevice *)v397 rightPeripheral];

          if (v170 == v398) {
            [(AXHearingAidDevice *)v397 rightPrograms];
          }
          else {
          v237 = [(AXHearingAidDevice *)v397 leftPrograms];
          }
          v421[0] = MEMORY[0x263EF8330];
          v421[1] = 3221225472;
          v421[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_470;
          v421[3] = &unk_2640FD570;
          v421[6] = v169;
          BOOL v422 = v170 == v398;
          v421[4] = v397;
          v421[5] = &buf;
          [v237 enumerateObjectsUsingBlock:v421];
          if (*(unsigned char *)(*((void *)&buf + 1) + 24))
          {
            if (v170 == v398) {
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x400];
            }
            else {
              [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x400];
            }
            v269 = +[AXHearingAidDeviceController sharedController];
            [v269 device:v397 didUpdateProperty:1024];
          }
          else
          {
            v262 = [(AXHearingAidDevice *)v397 leftSelectedProgram];
            if (v262)
            {
              v263 = [(AXHearingAidDevice *)v397 leftPeripheral];
              BOOL v264 = v263 == v398;

              if (v264)
              {
                v265 = [(AXHearingAidDevice *)v397 leftSelectedProgram];
                [(AXHearingAidDevice *)v397 setLeftSelectedProgram:v265];
              }
            }
            v266 = [(AXHearingAidDevice *)v397 rightSelectedProgram];
            if (!v266) {
              goto LABEL_358;
            }
            v267 = [(AXHearingAidDevice *)v397 rightPeripheral];
            BOOL v268 = v267 == v398;

            if (!v268) {
              goto LABEL_358;
            }
            v269 = [(AXHearingAidDevice *)v397 rightSelectedProgram];
            [(AXHearingAidDevice *)v397 setRightSelectedProgram:v269];
          }

LABEL_358:
          _Block_object_dispose(&buf, 8);
          goto LABEL_451;
        }
        id v391 = [v399 value];
        if (![v391 length])
        {
LABEL_450:

          goto LABEL_451;
        }
        v393 = [MEMORY[0x263EFF980] array];
        v165 = (unsigned int *)[v391 bytes];
        v389 = [(AXHearingAidDevice *)v397 rightPeripheral];

        if (v389 == v398)
        {
          __int16 v166 = [(AXHearingAidDevice *)v397 rightLoadedProperties];
          unsigned int v167 = [(AXHearingAidDevice *)v397 rightPresetBitmask];
          [(AXHearingAidDevice *)v397 rightPrograms];
        }
        else
        {
          __int16 v166 = [(AXHearingAidDevice *)v397 leftLoadedProperties];
          unsigned int v167 = [(AXHearingAidDevice *)v397 leftPresetBitmask];
          [(AXHearingAidDevice *)v397 leftPrograms];
        v388 = };
        if (v167 == *v165 && [v388 count])
        {
          if (v389 == v398) {
            [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x100];
          }
          else {
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x100];
          }
LABEL_449:

          goto LABEL_450;
        }
        if ((v166 & 0x100) != 0)
        {
          HAInitializeLogging();
          v323 = [NSString stringWithFormat:@"Not reading presets, already reading"];
          v324 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3349, v323];
          os_log_t v325 = *v45;
          if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
          {
            id v326 = v324;
            v327 = v325;
            uint64_t v328 = [v326 UTF8String];
            LODWORD(buf) = 136446210;
            *(void *)((char *)&buf + 4) = v328;
            _os_log_impl(&dword_20CC86000, v327, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          }
          goto LABEL_449;
        }
        if (v389 == v398) {
          [(AXHearingAidDevice *)v397 rightPrograms];
        }
        else {
        v390 = [(AXHearingAidDevice *)v397 leftPrograms];
        }
        v347 = [v399 value];
        uint64_t v348 = [v347 length];

        uint64_t v349 = 8 * v348;
        v350 = v397;
        if (8 * v348 >= 1)
        {
          LODWORD(v351) = 0;
          if (v389 == v398) {
            unsigned int v352 = 4;
          }
          else {
            unsigned int v352 = 2;
          }
          do
          {
            if ((*v165 >> v351))
            {
              v353 = objc_alloc_init(AXHearingAidMode);
              [(AXHearingAidMode *)v353 setIndex:v351];
              v423[0] = MEMORY[0x263EF8330];
              v423[1] = 3221225472;
              v423[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_4;
              v423[3] = &__block_descriptor_36_e33_B32__0__AXHearingAidMode_8Q16_B24l;
              int v424 = v351;
              if ([v390 indexOfObjectPassingTest:v423] == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v354 = v352;
              }
              else {
                uint64_t v354 = 6;
              }
              [(AXHearingAidMode *)v353 setEar:v354];
              v355 = NSString;
              v356 = hearingLocString(@"DefaultProgramName");
              v357 = (void *)MEMORY[0x263F08A30];
              v358 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[AXHearingAidMode index](v353, "index"));
              v359 = [v357 localizedStringFromNumber:v358 numberStyle:1];
              v360 = objc_msgSend(v355, "stringWithFormat:", v356, v359);
              [(AXHearingAidMode *)v353 setName:v360];

              [v393 addObject:v353];
              v350 = v397;
            }
            uint64_t v351 = (v351 + 1);
          }
          while (v349 > v351);
        }
        if (v389 == v398)
        {
          [(AXHearingAidDevice *)v350 setRightPrograms:v393];
          [(AXHearingAidDevice *)v397 setRightPresetBitmask:*v165];
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x100];
          if ([v393 count] == 1)
          {
            v363 = [v393 firstObject];
            [v363 setIsSelected:1];

            v364 = [v393 firstObject];
            [(AXHearingAidDevice *)v397 setCurrentRightProgram:v364];

            goto LABEL_439;
          }
        }
        else
        {
          [(AXHearingAidDevice *)v350 setLeftPrograms:v393];
          [(AXHearingAidDevice *)v397 setLeftPresetBitmask:*v165];
          [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x100];
          if ([v393 count] == 1)
          {
            v361 = [v393 firstObject];
            [v361 setIsSelected:1];

            v362 = [v393 firstObject];
            [(AXHearingAidDevice *)v397 setCurrentLeftProgram:v362];

LABEL_439:
            if ([v393 count])
            {
              v372 = [v393 firstObject];
              if (v389 == v398)
              {
                v376 = [(AXHearingAidDevice *)v397 currentRightProgram];
                BOOL v377 = v376 == 0;

                if (v377) {
                  [(AXHearingAidDevice *)v397 setCurrentRightProgram:v372];
                }
                uint64_t v375 = 4;
              }
              else
              {
                v373 = [(AXHearingAidDevice *)v397 currentLeftProgram];
                BOOL v374 = v373 == 0;

                if (v374) {
                  [(AXHearingAidDevice *)v397 setCurrentLeftProgram:v372];
                }
                uint64_t v375 = 2;
              }
              -[AXHearingAidDevice writeInt:toEar:forProperty:](v397, "writeInt:toEar:forProperty:", [v372 index], v375, 4096);
              v378 = +[AXHearingAidDeviceController sharedController];
              [v378 device:v397 didUpdateProperty:256];
            }
            goto LABEL_449;
          }
        }
        [(AXHearingAidDevice *)v397 readProperty:1024 fromPeripheral:v398];
        goto LABEL_439;
      }
      if (v37 <= 31)
      {
        if (v37 != 4)
        {
          if (v37 != 8)
          {
            if (v37 == 16)
            {
              id v72 = [v399 value];
              long long v73 = (void *)[v72 bytes];

              if (v73)
              {
                id v74 = [NSString alloc];
                long long v75 = [v399 value];
                v76 = (void *)[v74 initWithData:v75 encoding:4];

                uint64_t v77 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
                objc_super v78 = [v76 stringByTrimmingCharactersInSet:v77];

                v79 = [MEMORY[0x263F08708] controlCharacterSet];
                long long v73 = [v78 stringByTrimmingCharactersInSet:v79];
              }
              uint64_t v80 = [(AXHearingAidDevice *)v397 leftPeripheral];
              BOOL v81 = v80 == v398;

              if (v81)
              {
                [(AXHearingAidDevice *)v397 setLeftUUID:v73];
                id v82 = [(AXHearingAidDevice *)v397 rightUUID];
                [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x10];
              }
              else
              {
                [(AXHearingAidDevice *)v397 setRightUUID:v73];
                id v82 = [(AXHearingAidDevice *)v397 leftUUID];
                [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x10];
              }
              if ([v73 length] && objc_msgSend(v82, "length"))
              {
                *(void *)&long long buf = 0;
                *((void *)&buf + 1) = &buf;
                uint64_t v429 = 0x3032000000;
                v430 = __Block_byref_object_copy__0;
                v431 = __Block_byref_object_dispose__0;
                id v432 = 0;
                v270 = +[AXHearingAidDeviceController sharedController];
                v271 = [v270 hearingAidsForUUID:v73];
                v426[0] = MEMORY[0x263EF8330];
                v426[1] = 3221225472;
                v426[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2;
                v426[3] = &unk_2640FD528;
                v426[4] = v397;
                v426[5] = &buf;
                [v271 enumerateObjectsUsingBlock:v426];

                if (*(void *)(*((void *)&buf + 1) + 40)
                  && [(AXHearingAidDevice *)v397 didLoadBasicProperties])
                {
                  [(AXHearingAidDevice *)v397 mateWithDevice:*(void *)(*((void *)&buf + 1) + 40)];
                }
                _Block_object_dispose(&buf, 8);
              }
              v272 = +[AXHearingAidDeviceController sharedController];
              [v272 device:v397 didUpdateProperty:16];

              goto LABEL_451;
            }
            goto LABEL_452;
          }
          v53 = [v399 value];
          if ([v53 length])
          {
            LOBYTE(buf) = 0;
            [v53 getBytes:&buf length:1];
            if (buf == 1)
            {
              v149 = [(AXHearingAidDevice *)v397 rightPeripheral];
              BOOL v150 = v149 == v398;

              if (!v150)
              {
                v151 = [(AXHearingAidDevice *)v397 rightPeripheral];
                [(AXHearingAidDevice *)v397 setRightPeripheral:v398];
                [(AXHearingAidDevice *)v397 setLeftPeripheral:v151];
              }
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 8];
            }
            else
            {
              v277 = [(AXHearingAidDevice *)v397 leftPeripheral];
              BOOL v278 = v277 == v398;

              if (!v278)
              {
                v279 = [(AXHearingAidDevice *)v397 leftPeripheral];
                [(AXHearingAidDevice *)v397 setLeftPeripheral:v398];
                [(AXHearingAidDevice *)v397 setRightPeripheral:v279];
              }
              [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 8];
            }
            v280 = [(AXHearingAidDevice *)v397 leftPeripheral];
            v281 = [v280 identifier];
            v282 = [v281 UUIDString];

            [(AXHearingAidDevice *)v397 setLeftPeripheralUUID:v282];
            v283 = [(AXHearingAidDevice *)v397 rightPeripheral];
            v284 = [v283 identifier];
            v285 = [v284 UUIDString];

            [(AXHearingAidDevice *)v397 setRightPeripheralUUID:v285];
            if (![(AXHearingAidDevice *)v397 didLoadBasicProperties]) {
              [(AXHearingAidDevice *)v397 loadBasicProperties];
            }
          }
          goto LABEL_437;
        }
        v53 = [v399 value];
        if (![v53 length]) {
          goto LABEL_437;
        }
        LOBYTE(buf) = 0;
        [v53 getBytes:&buf length:1];
        LOBYTE(v4) = buf;
        v145 = [(AXHearingAidDevice *)v397 leftPeripheral];
        BOOL v146 = v145 == v398;

        if (v146)
        {
          -[AXHearingAidDevice setLeftBatteryLevel:](v397, "setLeftBatteryLevel:");
          [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 4];
          v147 = [(AXHearingAidDevice *)v397 leftBatteryLowDate];
          if (v147) {
            BOOL v314 = 0;
          }
          else {
            BOOL v314 = (double)v4 / 10.0 < 0.2;
          }
          if (!v314) {
            goto LABEL_335;
          }
        }
        else
        {
          -[AXHearingAidDevice setRightBatteryLevel:](v397, "setRightBatteryLevel:");
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 4];
          v147 = [(AXHearingAidDevice *)v397 rightBatteryLowDate];
          if (v147) {
            BOOL v148 = 0;
          }
          else {
            BOOL v148 = (double)v4 / 10.0 < 0.2;
          }
          if (!v148) {
            goto LABEL_335;
          }
        }
        [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-60.0];

LABEL_335:
        v315 = +[AXHearingAidDeviceController sharedController];
        [v315 device:v397 didUpdateProperty:4];

        [(AXHearingAidDevice *)v397 updateBatteryServiceForPeripheral:v398];
        goto LABEL_437;
      }
      if (v37 == 32)
      {
        id v183 = [v399 value];
        v184 = (void *)[v183 bytes];

        if (v184)
        {
          id v185 = [NSString alloc];
          v186 = [v399 value];
          v187 = (void *)[v185 initWithData:v186 encoding:4];

          v188 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
          v189 = [v187 stringByTrimmingCharactersInSet:v188];

          v190 = [MEMORY[0x263F08708] controlCharacterSet];
          v184 = [v189 stringByTrimmingCharactersInSet:v190];
        }
        v191 = [(AXHearingAidDevice *)v397 leftPeripheral];
        BOOL v192 = v191 == v398;

        if (v192)
        {
          [(AXHearingAidDevice *)v397 setRightUUID:v184];
          v193 = [(AXHearingAidDevice *)v397 leftUUID];
          [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x20];
        }
        else
        {
          [(AXHearingAidDevice *)v397 setLeftUUID:v184];
          v193 = [(AXHearingAidDevice *)v397 rightUUID];
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x20];
        }
        if ([v184 length] && objc_msgSend(v193, "length"))
        {
          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v429 = 0x3032000000;
          v430 = __Block_byref_object_copy__0;
          v431 = __Block_byref_object_dispose__0;
          id v432 = 0;
          v273 = +[AXHearingAidDeviceController sharedController];
          v274 = [v273 hearingAidsForUUID:v184];
          v425[0] = MEMORY[0x263EF8330];
          v425[1] = 3221225472;
          v425[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3;
          v425[3] = &unk_2640FD528;
          v425[4] = v397;
          v425[5] = &buf;
          [v274 enumerateObjectsUsingBlock:v425];

          if (*(void *)(*((void *)&buf + 1) + 40)
            && [(AXHearingAidDevice *)v397 didLoadBasicProperties])
          {
            [(AXHearingAidDevice *)v397 mateWithDevice:*(void *)(*((void *)&buf + 1) + 40)];
          }
          _Block_object_dispose(&buf, 8);
        }
        v275 = +[AXHearingAidDeviceController sharedController];
        [v275 device:v397 didUpdateProperty:32];

        goto LABEL_451;
      }
      if (v37 != 64)
      {
        if (v37 != 128) {
          goto LABEL_452;
        }
        v53 = [v399 value];
        if (![v53 length]) {
          goto LABEL_437;
        }
        LOBYTE(buf) = 0;
        [v53 getBytes:&buf length:1];
        LOBYTE(v4) = buf;
        v102 = [(AXHearingAidDevice *)v397 leftPeripheral];
        double v103 = (double)v4 / 255.0;
        if (v102 == v398)
        {
          BOOL v307 = v397->_leftStreamVolume != v103;

          if (v307)
          {
            v397->_leftStreamVolume = v103;
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x80];
LABEL_372:
            v332 = +[AXHearingAidDeviceController sharedController];
            [v332 device:v397 didUpdateProperty:128];

            goto LABEL_437;
          }
        }
        else
        {
        }
        v104 = [(AXHearingAidDevice *)v397 rightPeripheral];
        if (v104 == v398)
        {
          BOOL v331 = v397->_rightStreamVolume != v103;

          if (v331)
          {
            v397->_rightStreamVolume = v103;
            [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x80];
          }
        }
        else
        {
        }
        goto LABEL_372;
      }
      v53 = [v399 value];
      if (![v53 length]) {
        goto LABEL_437;
      }
      LOBYTE(buf) = 0;
      [v53 getBytes:&buf length:1];
      LOBYTE(v4) = buf;
      v194 = [(AXHearingAidDevice *)v397 leftPeripheral];
      double v195 = (double)v4 / 255.0;
      if (v194 != v398)
      {

LABEL_201:
        v196 = [(AXHearingAidDevice *)v397 rightPeripheral];
        if (v196 == v398)
        {
          double rightMicrophoneVolume = v397->_rightMicrophoneVolume;
          if (rightMicrophoneVolume == v195)
          {
            BOOL v370 = rightMicrophoneVolume == 0.0;

            if (!v370) {
              goto LABEL_436;
            }
          }
          else
          {
          }
          v397->_double rightMicrophoneVolume = v195;
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x40];
          goto LABEL_436;
        }

LABEL_436:
        v371 = +[AXHearingAidDeviceController sharedController];
        [v371 device:v397 didUpdateProperty:64];

        goto LABEL_437;
      }
      double leftMicrophoneVolume = v397->_leftMicrophoneVolume;
      if (leftMicrophoneVolume == v195)
      {
        BOOL v340 = leftMicrophoneVolume == 0.0;

        if (!v340) {
          goto LABEL_201;
        }
      }
      else
      {
      }
      v397->_double leftMicrophoneVolume = v195;
      [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x40];
      goto LABEL_436;
    }
    id v49 = v397;
    if (v37 > 0xFFFFFFFFFLL)
    {
      if (v37 > 0x7FFFFFFFFFLL)
      {
        if (v37 <= 0x3FFFFFFFFFFLL)
        {
          if (v37 == 0x8000000000)
          {
            v53 = [v399 value];
            if ([v53 length])
            {
              LOBYTE(buf) = 0;
              [v53 getBytes:&buf length:1];
              if ((_BYTE)buf)
              {
                float v138 = 255.0 / (double)buf;
                int v139 = (__int16)llroundf(v138);
                if (v139 <= 1) {
                  int v139 = 1;
                }
                if (v139 >= 0x14) {
                  __int16 v140 = 20;
                }
                else {
                  __int16 v140 = v139;
                }
                v141 = [(AXHearingAidDevice *)v397 leftPeripheral];
                BOOL v142 = v141 == v398;

                if (v142)
                {
                  [(AXHearingAidDevice *)v397 setLeftMixedVolumeSteps:v140];
                  [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x8000000000];
                }
                else
                {
                  v143 = [(AXHearingAidDevice *)v397 rightPeripheral];
                  BOOL v144 = v143 == v398;

                  if (v144)
                  {
                    [(AXHearingAidDevice *)v397 setRightMixedVolumeSteps:v140];
                    [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x8000000000];
                  }
                }
              }
              v337 = +[AXHearingAidDeviceController sharedController];
              [v337 device:v397 didUpdateProperty:0x8000000000];
            }
            goto LABEL_437;
          }
          if (v37 != 0x10000000000) {
            goto LABEL_452;
          }
          if ([MEMORY[0x263F472B0] supportsLEA2])
          {
            v53 = [v399 value];
            if (![v53 length]) {
              goto LABEL_437;
            }
            v54 = [(AXHearingAidDevice *)v397 rightPeripheral];
            if (v54 == v398) {
              int v55 = 4;
            }
            else {
              int v55 = 2;
            }

            int v56 = [(AXHearingAidDevice *)v397 availableInputEars];
            LODWORD(buf) = 0;
            [v53 getBytes:&buf length:4];
            if (buf) {
              uint64_t v57 = v56 | v55;
            }
            else {
              uint64_t v57 = v56 & ~v55;
            }
            [(AXHearingAidDevice *)v397 setAvailableInputEars:v57];
            id v58 = +[HUHearingAidSettings sharedInstance];
            objc_msgSend(v58, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v397, "availableInputEars"));

            id v59 = +[HANanoSettings sharedInstance];
            objc_msgSend(v59, "setAvailableInputEars:", -[AXHearingAidDevice availableInputEars](v397, "availableInputEars"));

            if (buf)
            {
              uint64_t v60 = [(AXHearingAidDevice *)v397 rightPeripheral];

              if (v60) {
                [(AXHearingAidDevice *)v397 setRightLeaVersion:2];
              }
              else {
                [(AXHearingAidDevice *)v397 setLeftLeaVersion:2];
              }
            }
          }
          v365 = [(AXHearingAidDevice *)v397 leftPeripheral];
          BOOL v366 = v365 == v398;

          if (v366)
          {
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x10000000000];
          }
          else
          {
            v367 = [(AXHearingAidDevice *)v397 rightPeripheral];
            BOOL v368 = v367 == v398;

            if (v368) {
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x10000000000];
            }
          }
          v369 = +[AXHearingAidDeviceController sharedController];
          [v369 device:v397 didUpdateProperty:0x10000000000];

          goto LABEL_451;
        }
        if (v37 == 0x40000000000)
        {
          if ([MEMORY[0x263F472B0] supportsLEA2]
            && [(AXHearingAidDevice *)v397 readsWatchSupportCharacteristic])
          {
            v53 = [v399 value];
            if (![v53 length]) {
              goto LABEL_437;
            }
            v218 = [(AXHearingAidDevice *)v397 rightPeripheral];
            if (v218 == v398) {
              int v219 = 4;
            }
            else {
              int v219 = 2;
            }

            int v220 = [(AXHearingAidDevice *)v397 earsSupportingWatch];
            LODWORD(buf) = 0;
            [v53 getBytes:&buf length:4];
            if (buf) {
              uint64_t v221 = v220 | v219;
            }
            else {
              uint64_t v221 = v220 & ~v219;
            }
            [(AXHearingAidDevice *)v397 setEarsSupportingWatch:v221];
            v222 = +[HUHearingAidSettings sharedInstance];
            objc_msgSend(v222, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v397, "earsSupportingWatch"));

            v223 = +[HANanoSettings sharedInstance];
            objc_msgSend(v223, "setEarsSupportingWatch:", -[AXHearingAidDevice earsSupportingWatch](v397, "earsSupportingWatch"));
          }
          v224 = [(AXHearingAidDevice *)v397 leftPeripheral];
          BOOL v225 = v224 == v398;

          if (v225)
          {
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x40000000000];
          }
          else
          {
            v226 = [(AXHearingAidDevice *)v397 rightPeripheral];
            BOOL v227 = v226 == v398;

            if (v227) {
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x40000000000];
            }
          }
          v276 = +[AXHearingAidDeviceController sharedController];
          [v276 device:v397 didUpdateProperty:0x40000000000];

          goto LABEL_451;
        }
        if (v37 != 0x80000000000) {
          goto LABEL_452;
        }
        id v125 = [v399 value];
        v126 = (_DWORD *)[v125 bytes];

        v127 = [v399 value];
        uint64_t v128 = [v127 length];

        v129 = v397;
        if (8 * v128 < 1)
        {
LABEL_127:
          if ([(AXHearingAidDevice *)v129 requiresBinauralStreaming])
          {
            v131 = +[HUHearingAidSettings sharedInstance];
            if ([v131 shouldStreamToLeftAid])
            {
              v132 = +[HUHearingAidSettings sharedInstance];
              uint64_t v133 = [v132 shouldStreamToRightAid];
            }
            else
            {
              uint64_t v133 = 0;
            }

            v286 = +[HUHearingAidSettings sharedInstance];
            [v286 setShouldStreamToLeftAid:v133];

            v287 = +[HUHearingAidSettings sharedInstance];
            [v287 setShouldStreamToRightAid:v133];
          }
          v288 = [(AXHearingAidDevice *)v397 leftPeripheral];
          BOOL v289 = v288 == v398;

          if (v289)
          {
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x80000000000];
          }
          else
          {
            v290 = [(AXHearingAidDevice *)v397 rightPeripheral];
            BOOL v291 = v290 == v398;

            if (v291) {
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x80000000000];
            }
          }
          v292 = +[AXHearingAidDeviceController sharedController];
          [v292 device:v397 didUpdateProperty:0x80000000000];

          goto LABEL_451;
        }
        LODWORD(v130) = 0;
        while (1)
        {
          if ((*v126 >> v130))
          {
            switch(v130)
            {
              case 3:
                [(AXHearingAidDevice *)v129 setRequiresBinauralStreaming:1];
                goto LABEL_125;
              case 2:
                [(AXHearingAidDevice *)v129 setRequiresCombinedVolumes:1];
                goto LABEL_125;
              case 1:
                [(AXHearingAidDevice *)v129 setRequiresCombinedPresets:1];
LABEL_125:
                v129 = v397;
                break;
            }
          }
          uint64_t v130 = (v130 + 1);
          if (8 * v128 <= v130) {
            goto LABEL_127;
          }
        }
      }
      if (v37 == 0x1000000000)
      {
        v53 = [v399 value];
        if ([v53 length])
        {
          LOBYTE(buf) = 0;
          [v53 getBytes:&buf length:1];
          v171 = [(AXHearingAidDevice *)v397 leftPeripheral];
          BOOL v172 = v171 == v398;

          if (v172)
          {
            int v316 = buf;
            v317 = v397;
            v397->_leftBass = buf;
            if (v397->_rightBass != v316)
            {
              [(AXHearingAidDevice *)v397 setRightBass:(char)v316];
              v317 = v397;
            }
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v317 leftLoadedProperties] | 0x1000000000];
          }
          else
          {
            v173 = [(AXHearingAidDevice *)v397 rightPeripheral];
            BOOL v174 = v173 == v398;

            if (v174)
            {
              int v175 = buf;
              v176 = v397;
              v397->_rightBass = buf;
              if (v397->_leftBass != v175)
              {
                [(AXHearingAidDevice *)v397 setLeftBass:(char)v175];
                v176 = v397;
              }
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v176 rightLoadedProperties] | 0x1000000000];
            }
          }
          v318 = +[AXHearingAidDeviceController sharedController];
          [v318 device:v397 didUpdateProperty:0x1000000000];
        }
        goto LABEL_437;
      }
      if (v37 == 0x2000000000)
      {
        v53 = [v399 value];
        if ([v53 length])
        {
          LOBYTE(buf) = 0;
          [v53 getBytes:&buf length:1];
          v177 = [(AXHearingAidDevice *)v397 leftPeripheral];
          BOOL v178 = v177 == v398;

          if (v178)
          {
            int v319 = buf;
            v320 = v397;
            v397->_leftTreble = buf;
            if (v397->_rightTreble != v319)
            {
              [(AXHearingAidDevice *)v397 setRightTreble:(char)v319];
              v320 = v397;
            }
            [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v320 leftLoadedProperties] | 0x2000000000];
          }
          else
          {
            v179 = [(AXHearingAidDevice *)v397 rightPeripheral];
            BOOL v180 = v179 == v398;

            if (v180)
            {
              int v181 = buf;
              v182 = v397;
              v397->_rightTreble = buf;
              if (v397->_leftTreble != v181)
              {
                [(AXHearingAidDevice *)v397 setLeftTreble:(char)v181];
                v182 = v397;
              }
              [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v182 rightLoadedProperties] | 0x2000000000];
            }
          }
          v321 = +[AXHearingAidDeviceController sharedController];
          [v321 device:v397 didUpdateProperty:0x2000000000];
        }
        goto LABEL_437;
      }
      if (v37 != 0x4000000000) {
        goto LABEL_452;
      }
      v53 = [v399 value];
      if (![v53 length]) {
        goto LABEL_437;
      }
      LOBYTE(buf) = 0;
      [v53 getBytes:&buf length:1];
      LOBYTE(v4) = buf;
      id v99 = [(AXHearingAidDevice *)v397 leftPeripheral];
      double v100 = (double)v4 / 255.0;
      if (v99 == v398)
      {
        BOOL v306 = v397->_leftMixedVolume != v100;

        if (v306)
        {
          v397->_leftMixedVolume = v100;
          [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x4000000000];
LABEL_368:
          v330 = +[AXHearingAidDeviceController sharedController];
          [v330 device:v397 didUpdateProperty:0x4000000000];

          goto LABEL_437;
        }
      }
      else
      {
      }
      uint64_t v101 = [(AXHearingAidDevice *)v397 rightPeripheral];
      if (v101 == v398)
      {
        BOOL v329 = v397->_rightMixedVolume != v100;

        if (v329)
        {
          v397->_rightMixedVolume = v100;
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x4000000000];
        }
      }
      else
      {
      }
      goto LABEL_368;
    }
    if (v37 > 0x1FFFFFFFFLL)
    {
      if (v37 == 0x200000000)
      {
        v53 = [v399 value];
        if ([v53 length])
        {
          LOBYTE(buf) = 0;
          [v53 getBytes:&buf length:1];
          if ((_BYTE)buf)
          {
            float v197 = 255.0 / (double)buf;
            int v198 = (__int16)llroundf(v197);
            if (v198 <= 1) {
              int v198 = 1;
            }
            if (v198 >= 0x14) {
              __int16 v199 = 20;
            }
            else {
              __int16 v199 = v198;
            }
            v200 = [(AXHearingAidDevice *)v397 leftPeripheral];
            BOOL v201 = v200 == v398;

            if (v201)
            {
              [(AXHearingAidDevice *)v397 setLeftStreamVolumeSteps:v199];
              [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x200000000];
            }
            else
            {
              v202 = [(AXHearingAidDevice *)v397 rightPeripheral];
              BOOL v203 = v202 == v398;

              if (v203)
              {
                [(AXHearingAidDevice *)v397 setRightStreamVolumeSteps:v199];
                [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x200000000];
              }
            }
          }
          v338 = +[AXHearingAidDeviceController sharedController];
          [v338 device:v397 didUpdateProperty:0x200000000];
        }
        goto LABEL_437;
      }
      if (v37 == 0x400000000)
      {
        v53 = [v399 value];
        if ([v53 length])
        {
          LOBYTE(buf) = 0;
          [v53 getBytes:&buf length:1];
          if ((_BYTE)buf)
          {
            float v204 = 255.0 / (double)buf;
            int v205 = (__int16)llroundf(v204);
            if (v205 <= 1) {
              int v205 = 1;
            }
            if (v205 >= 0x14) {
              __int16 v206 = 20;
            }
            else {
              __int16 v206 = v205;
            }
            v207 = [(AXHearingAidDevice *)v397 leftPeripheral];
            BOOL v208 = v207 == v398;

            if (v208)
            {
              [(AXHearingAidDevice *)v397 setLeftSensitivitySteps:v206];
              [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x400000000];
            }
            else
            {
              v209 = [(AXHearingAidDevice *)v397 rightPeripheral];
              BOOL v210 = v209 == v398;

              if (v210)
              {
                [(AXHearingAidDevice *)v397 setRightSensitivitySteps:v206];
                [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x400000000];
              }
            }
          }
          v339 = +[AXHearingAidDeviceController sharedController];
          [v339 device:v397 didUpdateProperty:0x400000000];
        }
        goto LABEL_437;
      }
      if (v37 != 0x800000000) {
        goto LABEL_452;
      }
      id v105 = [v399 value];
      uint64_t v106 = [v105 bytes];

      uint64_t v107 = [(AXHearingAidDevice *)v397 rightPeripheral];

      if (v107 == v398) {
        [(AXHearingAidDevice *)v397 rightPrograms];
      }
      else {
      v236 = [(AXHearingAidDevice *)v397 leftPrograms];
      }
      v419[0] = MEMORY[0x263EF8330];
      v419[1] = 3221225472;
      v419[2] = __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_471;
      v419[3] = &unk_2640FD598;
      BOOL v420 = v107 == v398;
      v419[4] = v397;
      v419[5] = v106;
      [v236 enumerateObjectsUsingBlock:v419];
      if (v107 == v398) {
        [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x800000000];
      }
      else {
        [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x800000000];
      }
      v261 = +[AXHearingAidDeviceController sharedController];
      [v261 device:v397 didUpdateProperty:0x800000000];

LABEL_451:
      id v49 = v397;
      goto LABEL_452;
    }
    if (v37 != 0x40000000)
    {
      if (v37 != 0x80000000)
      {
        if (v37 != 0x100000000) {
          goto LABEL_452;
        }
        v53 = [v399 value];
        if ([v53 length])
        {
          LOBYTE(buf) = 0;
          [v53 getBytes:&buf length:1];
          if ((_BYTE)buf)
          {
            float v83 = 255.0 / (double)buf;
            int v84 = (__int16)llroundf(v83);
            if (v84 <= 1) {
              int v84 = 1;
            }
            if (v84 >= 0x14) {
              __int16 v85 = 20;
            }
            else {
              __int16 v85 = v84;
            }
            v86 = [(AXHearingAidDevice *)v397 leftPeripheral];
            BOOL v87 = v86 == v398;

            if (v87)
            {
              [(AXHearingAidDevice *)v397 setLeftMicrophoneVolumeSteps:v85];
              [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x100000000];
            }
            else
            {
              v88 = [(AXHearingAidDevice *)v397 rightPeripheral];
              BOOL v89 = v88 == v398;

              if (v89)
              {
                [(AXHearingAidDevice *)v397 setRightMicrophoneVolumeSteps:v85];
                [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x100000000];
              }
            }
          }
          v336 = +[AXHearingAidDeviceController sharedController];
          [v336 device:v397 didUpdateProperty:0x100000000];
        }
        goto LABEL_437;
      }
      v53 = [v399 value];
      if (![v53 length]) {
        goto LABEL_437;
      }
      LOBYTE(buf) = 0;
      [v53 getBytes:&buf length:1];
      LOBYTE(v4) = buf;
      v162 = [(AXHearingAidDevice *)v397 leftPeripheral];
      double v163 = (double)v4 / 255.0;
      if (v162 == v398)
      {
        BOOL v308 = v397->_leftSensitivity != v163;

        if (v308)
        {
          v397->_leftSensitivity = v163;
          [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x80000000];
LABEL_376:
          v334 = +[AXHearingAidDeviceController sharedController];
          [v334 device:v397 didUpdateProperty:0x80000000];

          goto LABEL_437;
        }
      }
      else
      {
      }
      v164 = [(AXHearingAidDevice *)v397 rightPeripheral];
      if (v164 == v398)
      {
        BOOL v333 = v397->_rightSensitivity != v163;

        if (v333)
        {
          v397->_rightSensitivity = v163;
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x80000000];
        }
      }
      else
      {
      }
      goto LABEL_376;
    }
    id v152 = [v399 value];
    v153 = (_DWORD *)[v152 bytes];

    v154 = [v399 value];
    uint64_t v155 = [v154 length];

    v156 = v397;
    if (8 * v155 >= 1)
    {
      LODWORD(v157) = 0;
      do
      {
        if ((*v153 >> v157))
        {
          switch(v157)
          {
            case 3:
              [(AXHearingAidDevice *)v156 setSupportsBinauralStreaming:0];
              goto LABEL_163;
            case 2:
              [(AXHearingAidDevice *)v156 setSupportsCombinedVolumes:0];
              goto LABEL_163;
            case 1:
              [(AXHearingAidDevice *)v156 setSupportsCombinedPresets:0];
LABEL_163:
              v156 = v397;
              break;
          }
        }
        uint64_t v157 = (v157 + 1);
      }
      while (8 * v155 > v157);
    }
    if ([(AXHearingAidDevice *)v156 supportsBinauralStreaming])
    {
LABEL_313:
      v301 = [(AXHearingAidDevice *)v397 leftPeripheral];
      BOOL v302 = v301 == v398;

      if (v302)
      {
        [(AXHearingAidDevice *)v397 setLeftLoadedProperties:[(AXHearingAidDevice *)v397 leftLoadedProperties] | 0x40000000];
      }
      else
      {
        v303 = [(AXHearingAidDevice *)v397 rightPeripheral];
        BOOL v304 = v303 == v398;

        if (v304) {
          [(AXHearingAidDevice *)v397 setRightLoadedProperties:[(AXHearingAidDevice *)v397 rightLoadedProperties] | 0x40000000];
        }
      }
      v305 = +[AXHearingAidDeviceController sharedController];
      [v305 device:v397 didUpdateProperty:0x40000000];

      goto LABEL_451;
    }
    v158 = +[HUHearingAidSettings sharedInstance];
    if ([v158 shouldStreamToLeftAid])
    {
      v159 = +[HUHearingAidSettings sharedInstance];
      int v160 = [v159 shouldStreamToRightAid];

      if (!v160)
      {
LABEL_170:
        v161 = +[HUHearingAidSettings sharedInstance];
        if ([v161 shouldStreamToLeftAid]) {
          [(AXHearingAidDevice *)v397 rightPeripheral];
        }
        else {
        v293 = [(AXHearingAidDevice *)v397 leftPeripheral];
        }

        if (([v293 hasTag:@"DisableLEA"] & 1) == 0)
        {
          HAInitializeLogging();
          v294 = [NSString stringWithFormat:@"Resetting connection to disable streaming %@", v293];
          v295 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didUpdateCharacteristic:]", 3685, v294];
          os_log_t v296 = *v45;
          if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
          {
            id v297 = v295;
            v298 = v296;
            uint64_t v299 = [v297 UTF8String];
            LODWORD(buf) = 136446210;
            *(void *)((char *)&buf + 4) = v299;
            _os_log_impl(&dword_20CC86000, v298, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
          }
          v300 = +[AXHearingAidDeviceController sharedController];
          [v300 resetConnectionToPeripheral:v293];
        }
        goto LABEL_313;
      }
      v158 = +[HUHearingAidSettings sharedInstance];
      [v158 setShouldStreamToLeftAid:0];
    }

    goto LABEL_170;
  }
LABEL_473:
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke(uint64_t a1, int a2)
{
  if (propertyContainsProperty(0xFF800105C4, *(void *)(a1 + 40))
    && ([*(id *)(a1 + 32) isPaired] & 1) == 0
    && a2)
  {
    if ([*(id *)(a1 + 32) leftAvailable])
    {
      unint64_t v4 = [*(id *)(a1 + 32) leftPeripheral];
      double v5 = [v4 identifier];

      if (v5)
      {
        char v6 = [*(id *)(a1 + 32) leftPeripheral];
        id v7 = [v6 identifier];
        id v8 = [v7 UUIDString];

        [*(id *)(a1 + 32) setLeftPeripheralUUID:v8];
      }
    }
    if ([*(id *)(a1 + 32) rightAvailable])
    {
      BOOL v9 = [*(id *)(a1 + 32) rightPeripheral];
      int v10 = [v9 identifier];

      if (v10)
      {
        uint64_t v11 = [*(id *)(a1 + 32) rightPeripheral];
        int v12 = [v11 identifier];
        uint64_t v13 = [v12 UUIDString];

        [*(id *)(a1 + 32) setRightPeripheralUUID:v13];
      }
    }
    id v15 = +[HUHearingAidSettings sharedInstance];
    id v14 = [*(id *)(a1 + 32) persistentRepresentation];
    [v15 setPairedHearingAids:v14];
  }
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = v8;
    *a4 = 1;
  }
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = v8;
    *a4 = 1;
  }
}

BOOL __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_4(uint64_t a1, void *a2)
{
  return *(_DWORD *)(a1 + 32) == [a2 index];
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_470(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (**(_DWORD **)(a1 + 48) == [v4 index])
  {
    [v4 setIsSelected:1];
    id v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 56)) {
      [v3 setRightSelectedProgram:v4];
    }
    else {
      [v3 setLeftSelectedProgram:v4];
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (([v4 isStreamOrMixingStream] & 1) == 0)
  {
    [v4 setIsSelected:0];
  }
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_471(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (**(_DWORD **)(a1 + 40) == [v4 index])
  {
    [v4 setIsSelected:1];
    id v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48)) {
      [v3 setRightSelectedStreamingProgram:v4];
    }
    else {
      [v3 setLeftSelectedStreamingProgram:v4];
    }
  }
  else if ([v4 isStreamOrMixingStream])
  {
    [v4 setIsSelected:0];
  }
}

BOOL __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_3_472(uint64_t a1, void *a2)
{
  return [a2 index] == *(unsigned __int8 *)(a1 + 32);
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_477(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = NSString;
  id v4 = hearingLocString(@"DefaultProgramName");
  double v5 = (void *)MEMORY[0x263F08A30];
  char v6 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", objc_msgSend(v16, "index"));
  id v7 = [v5 localizedStringFromNumber:v6 numberStyle:1];
  id v8 = objc_msgSend(v3, "stringWithFormat:", v4, v7);

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && [v16 index] == *(unsigned __int8 *)(a1 + 48))
  {
    uint64_t v9 = *(void *)(a1 + 32);
LABEL_12:
    uint64_t v14 = *(void *)(v9 + 8);
    id v15 = v16;
    int v10 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v15;
    goto LABEL_13;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    goto LABEL_14;
  }
  int v10 = [v16 name];
  if (([v10 isEqualToString:v8] & 1) == 0)
  {
    int v12 = [v16 name];
    if ([v12 length])
    {

LABEL_13:
      goto LABEL_14;
    }
    int v13 = [v16 syncAttempts];

    if (v13 > 2) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  int v11 = [v16 syncAttempts];

  if (v11 < 3)
  {
LABEL_11:
    uint64_t v9 = *(void *)(a1 + 40);
    goto LABEL_12;
  }
LABEL_14:
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_2_478(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  int v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) index];
  if (v6 == [v10 index])
  {
    uint64_t v7 = [v10 name];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

void __57__AXHearingAidDevice_peripheral_didUpdateCharacteristic___block_invoke_488(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(id *)(a1 + 32) != v7)
  {
    id v8 = v7;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    id v7 = v8;
    *a4 = 1;
  }
}

- (BOOL)readsWatchSupportCharacteristic
{
  return [MEMORY[0x263F472B0] isInternalInstall] ^ 1;
}

- (void)peripheral:(id)a3 didInvalidateServices:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  HAInitializeLogging();
  id v8 = [NSString stringWithFormat:@"%@ peripheral %@, services %@", self, v7, v6];

  uint64_t v9 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didInvalidateServices:]", 4160, v8];
  id v10 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v9;
    int v12 = v10;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v14 = [v11 UTF8String];
    _os_log_impl(&dword_20CC86000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [(AXHearingAidDevice *)self peripheral:v8 propertyForCharacteristic:v10];
  if (v9)
  {
    [(AXHearingAidDevice *)self readValueForCharacteristic:v10 fromPeripheral:v8];
    HAInitializeLogging();
    int v12 = [NSString stringWithFormat:@"Error writing characteristic value (%@): %@", v10, v9];

    int v13 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didWriteValueForCharacteristic:error:]", 4187, v12];
    uint64_t v14 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v13;
      id v16 = v14;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = [v15 UTF8String];
      _os_log_impl(&dword_20CC86000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  else
  {
    HAInitializeLogging();
    id v17 = NSString;
    id v18 = hearingPropertyDescription(v11);
    uint64_t v19 = [v10 value];

    uint64_t v20 = [v17 stringWithFormat:@"%@ - %@", v18, v19];

    int v21 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheral:didWriteValueForCharacteristic:error:]", 4168, v20];
    id v22 = (void *)*MEMORY[0x263F47290];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
    {
      id v23 = v21;
      int v24 = v22;
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = [v23 UTF8String];
      _os_log_impl(&dword_20CC86000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
    if (v11 == 4096)
    {
      [(AXHearingAidDevice *)self readProperty:4096 fromPeripheral:v8];
      [(AXHearingAidDevice *)self readProperty:0x2000 fromPeripheral:v8];
      [(AXHearingAidDevice *)self readProperty:0x4000 fromPeripheral:v8];
    }
  }
  int v25 = [(AXHearingAidDevice *)self leftPeripheral];
  int v26 = [v8 isEqual:v25];

  uint64_t v27 = 480;
  if (v26) {
    uint64_t v27 = 472;
  }
  *(Class *)((char *)&self->super.isa + v27) = (Class)(*(uint64_t *)((char *)&self->super.isa + v27) & ~v11);
}

- (void)pairingDidCompleteForPeripheral:(id)a3
{
  id v4 = a3;
  double v5 = +[AXHearingAidDeviceController sharedController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke;
  v7[3] = &unk_2640FCBD8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 checkPeripheralPaired:v6 withCompletion:v7];
}

void __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  id v4 = [NSString stringWithFormat:@"Did pair with result %d - %@", a2, *(void *)(a1 + 32)];
  double v5 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice pairingDidCompleteForPeripheral:]_block_invoke", 4206, v4];
  id v6 = (os_log_t *)MEMORY[0x263F47290];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v5;
    id v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v36 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  id v10 = *(void **)(a1 + 40);
  uint64_t v11 = [*(id *)(a1 + 32) identifier];
  int v12 = [v11 UUIDString];
  LOBYTE(v10) = [v10 containsPeripheralWithUUID:v12];

  if ((v10 & 1) == 0)
  {
    int v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_FAULT)) {
      __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke_cold_1((uint64_t *)(a1 + 32), v13);
    }
  }
  uint64_t v14 = *(void **)(a1 + 32);
  id v15 = [*(id *)(a1 + 40) leftPeripheral];

  if (v14 != v15)
  {
    id v16 = *(void **)(a1 + 32);
    id v17 = [*(id *)(a1 + 40) rightPeripheral];

    if (v16 == v17) {
      [*(id *)(a1 + 40) setRightPeripheralPaired:a2];
    }
    if (a2) {
      goto LABEL_10;
    }
LABEL_22:
    [*(id *)(a1 + 40) disconnectAndUnpair:0];
    int v32 = +[HUHearingAidSettings sharedInstance];
    [v32 setPairedHearingAids:0];
    goto LABEL_23;
  }
  [*(id *)(a1 + 40) setLeftPeripheralPaired:a2];
  if (!a2) {
    goto LABEL_22;
  }
LABEL_10:
  if (([*(id *)(a1 + 32) hasTag:@"IsMFiAuthenticated_CertClass0B"] & 1) == 0)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    id v18 = *(void **)(a1 + 40);
    uint64_t v20 = [MEMORY[0x263EFEF88] UUIDWithString:@"9FBF120D-6301-42D9-8C58-25E699A21DBD"];
    int v21 = [v18 peripheral:v19 characteristicForUUID:v20];

    if (v21) {
      [*(id *)(a1 + 40) readValueForCharacteristic:v21 fromPeripheral:*(void *)(a1 + 32)];
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "loadProperties:forPeripheral:withRetryPeriod:", objc_msgSend(*(id *)(a1 + 40), "requiredProperties"), *(void *)(a1 + 32), 0.0);
  if ([*(id *)(a1 + 40) leftAvailable])
  {
    id v22 = [*(id *)(a1 + 40) leftPeripheral];
    id v23 = [v22 identifier];

    if (v23)
    {
      int v24 = [*(id *)(a1 + 40) leftPeripheral];
      int v25 = [v24 identifier];
      int v26 = [v25 UUIDString];

      [*(id *)(a1 + 40) setLeftPeripheralUUID:v26];
    }
  }
  if ([*(id *)(a1 + 40) rightAvailable])
  {
    uint64_t v27 = [*(id *)(a1 + 40) rightPeripheral];
    id v28 = [v27 identifier];

    if (v28)
    {
      uint64_t v29 = [*(id *)(a1 + 40) rightPeripheral];
      uint64_t v30 = [v29 identifier];
      char v31 = [v30 UUIDString];

      [*(id *)(a1 + 40) setRightPeripheralUUID:v31];
    }
  }
  int v32 = +[HUHearingAidSettings sharedInstance];
  uint64_t v33 = [*(id *)(a1 + 40) persistentRepresentation];
  [v32 setPairedHearingAids:v33];

LABEL_23:
  uint64_t v34 = +[AXHearingAidDeviceController sharedController];
  [v34 device:*(void *)(a1 + 40) didUpdateProperty:603979776];
}

- (void)peripheralDidUnpair:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  double v5 = [NSString stringWithFormat:@"Did Unpair: %@", v4];

  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice peripheralDidUnpair:]", 4262, v5];
  id v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    id v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v11 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [(AXHearingAidDevice *)self disconnectAndUnpair:1];
}

- (void)checkPairingStatusWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = +[AXHearingAidDeviceController sharedController];
    id v6 = [(AXHearingAidDevice *)self leftPeripheral];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke;
    v7[3] = &unk_2640FD658;
    void v7[4] = self;
    id v8 = v4;
    [v5 checkPeripheralPaired:v6 withCompletion:v7];
  }
}

void __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  char v2 = a2;
  [*(id *)(a1 + 32) setLeftPeripheralPaired:a2];
  id v4 = +[AXHearingAidDeviceController sharedController];
  double v5 = [*(id *)(a1 + 32) rightPeripheral];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke_2;
  v7[3] = &unk_2640FD630;
  id v6 = *(void **)(a1 + 40);
  void v7[4] = *(void *)(a1 + 32);
  char v9 = v2;
  id v8 = v6;
  [v4 checkPeripheralPaired:v5 withCompletion:v7];
}

uint64_t __55__AXHearingAidDevice_checkPairingStatusWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setRightPeripheralPaired:a2];
  id v3 = [*(id *)(a1 + 32) leftUUID];
  if ([v3 length])
  {
    id v4 = [*(id *)(a1 + 32) rightUUID];
    [v4 length];
  }
  if (([*(id *)(a1 + 32) leftAvailable] & 1) != 0
    || [*(id *)(a1 + 32) rightAvailable])
  {
    int v5 = *(unsigned __int8 *)(a1 + 48);
    if (v5 == [*(id *)(a1 + 32) leftAvailable]) {
      [*(id *)(a1 + 32) rightAvailable];
    }
  }
  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (NSString)description
{
  int v24 = NSString;
  id v23 = [(AXHearingAidDevice *)self model];
  BOOL v3 = [(AXHearingAidDevice *)self didLoadBasicProperties];
  id v4 = @"NOT LOADED";
  if (v3) {
    id v4 = @"LOADED";
  }
  id v22 = v4;
  BOOL v5 = [(AXHearingAidDevice *)self isPaired];
  id v6 = @"NOT PAIRED";
  if (v5) {
    id v6 = @"PAIRED";
  }
  int v21 = v6;
  BOOL v7 = [(AXHearingAidDevice *)self isPersistent];
  id v8 = @"NOT PERSISTENT";
  if (v7) {
    id v8 = @"PERSISTENT";
  }
  uint64_t v20 = v8;
  if ([(AXHearingAidDevice *)self isConnected]) {
    char v9 = @"Available";
  }
  else {
    char v9 = @"NOT Available";
  }
  BOOL v10 = [(AXHearingAidDevice *)self leftAvailable];
  BOOL v11 = [(AXHearingAidDevice *)self rightAvailable];
  uint64_t v12 = [(AXHearingAidDevice *)self leftUUID];
  int v13 = [(AXHearingAidDevice *)self rightUUID];
  uint64_t v14 = [(AXHearingAidDevice *)self leftPeripheralUUID];
  id v15 = [(AXHearingAidDevice *)self rightPeripheralUUID];
  id v16 = [(AXHearingAidDevice *)self leftPeripheral];
  id v17 = [(AXHearingAidDevice *)self rightPeripheral];
  id v18 = [v24 stringWithFormat:@"AXHearingAidDevice:%p:[%@] [%@, %@, %@, %@] L:%d R:%d, l-uuid: %@ r-uuid: %@ - [%@, %@] [%@, %@]", self, v23, v22, v21, v20, v9, v10, v11, v12, v13, v14, v15, v16, v17];

  return (NSString *)v18;
}

- (id)descriptionForCBPeripheralState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_2640FD678[a3];
  }
}

- (BOOL)addPeripheral:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  HAInitializeLogging();
  BOOL v5 = [NSString stringWithFormat:@"Adding periperal %@ - %@", v4, self];
  id v6 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice addPeripheral:]", 4317, v5];
  BOOL v7 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v6;
    char v9 = v7;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v21 = [v8 UTF8String];
    _os_log_impl(&dword_20CC86000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  BOOL v10 = [v4 identifier];

  if (!v10)
  {
    BOOL v15 = 0;
    goto LABEL_14;
  }
  BOOL v11 = [v4 identifier];
  uint64_t v12 = [v11 UUIDString];

  int v13 = [(AXHearingAidDevice *)self leftPeripheralUUID];
  int v14 = [v12 isEqualToString:v13];

  if (v14)
  {
    [(AXHearingAidDevice *)self setLeftPeripheral:v4];
    [(AXHearingAidDevice *)self setLeftPeripheralUUID:v12];
  }
  else
  {
    id v16 = [(AXHearingAidDevice *)self rightPeripheralUUID];
    int v17 = [v12 isEqualToString:v16];

    if (!v17)
    {
      BOOL v15 = 0;
      goto LABEL_11;
    }
    [(AXHearingAidDevice *)self setRightPeripheral:v4];
    [(AXHearingAidDevice *)self setRightPeripheralUUID:v12];
  }
  [v4 setDelegate:self];
  BOOL v15 = 1;
LABEL_11:
  id v18 = [v4 name];
  if ([v18 length]) {
    [(AXHearingAidDevice *)self setName:v18];
  }

LABEL_14:
  return v15;
}

- (BOOL)addPeripheral:(id)a3 asLeft:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  HAInitializeLogging();
  BOOL v7 = [NSString stringWithFormat:@"Adding periperal %@ - %@", v6, self];
  id v8 = [NSString stringWithFormat:@"%s:%d %@", "-[AXHearingAidDevice addPeripheral:asLeft:]", 4350, v7];
  char v9 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    BOOL v11 = v9;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v18 = [v10 UTF8String];
    _os_log_impl(&dword_20CC86000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  uint64_t v12 = [v6 identifier];

  if (v12)
  {
    int v13 = [v6 identifier];
    int v14 = [v13 UUIDString];

    if (v4)
    {
      [(AXHearingAidDevice *)self setLeftPeripheral:v6];
      [(AXHearingAidDevice *)self setLeftPeripheralUUID:v14];
    }
    else
    {
      [(AXHearingAidDevice *)self setRightPeripheral:v6];
      [(AXHearingAidDevice *)self setRightPeripheralUUID:v14];
    }
    [v6 setDelegate:self];
    BOOL v15 = [v6 name];
    if ([v15 length]) {
      [(AXHearingAidDevice *)self setName:v15];
    }
  }
  return v12 != 0;
}

- (id)persistentRepresentation
{
  v41[2] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263EFF9A0];
  BOOL v4 = [(AXHearingAidDevice *)self name];
  BOOL v5 = [&unk_26C1E54F8 stringValue];
  v40[0] = v5;
  id v6 = [(AXHearingAidDevice *)self manufacturer];
  v41[0] = v6;
  BOOL v7 = [&unk_26C1E5510 stringValue];
  v40[1] = v7;
  id v8 = [(AXHearingAidDevice *)self model];
  v41[1] = v8;
  char v9 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AXHearingAidDevice availableEars](self, "availableEars"));
  BOOL v11 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, @"ax_hearing_device_name_key", v9, @"ax_hearing_device_man_model_key", v10, @"ax_hearing_device_lr_key", 0);

  if ([(AXHearingAidDevice *)self leftAvailable])
  {
    uint64_t v12 = [(AXHearingAidDevice *)self leftPeripheral];
    int v13 = [v12 identifier];

    if (v13)
    {
      int v14 = [(AXHearingAidDevice *)self leftPeripheral];
      BOOL v15 = [v14 identifier];
      id v16 = [v15 UUIDString];

      int v17 = (void *)MEMORY[0x263EFF9A0];
      uint64_t v18 = [NSNumber numberWithBool:1];
      uint64_t v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, @"ax_hearing_device_isleft_key", 0);

      uint64_t v20 = [(AXHearingAidDevice *)self leftUUID];

      if (v20)
      {
        uint64_t v21 = [(AXHearingAidDevice *)self leftUUID];
        [v19 setObject:v21 forKey:@"ax_hearing_device_hiid_key"];
      }
      uint64_t v22 = [(AXHearingAidDevice *)self rightUUID];

      if (v22)
      {
        id v23 = [(AXHearingAidDevice *)self rightUUID];
        [v19 setObject:v23 forKey:@"ax_hearing_device_hiidother_key"];
      }
      if (v16) {
        [v19 setObject:v16 forKey:@"ax_hearing_device_uuid_key"];
      }
      int v24 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXHearingAidDevice leftLeaVersion](self, "leftLeaVersion"));
      [v19 setObject:v24 forKey:@"ax_hearing_device_lea_version_key"];

      [v11 setObject:v19 forKey:@"ax_hearing_device_left_peripheral_key"];
    }
  }
  if ([(AXHearingAidDevice *)self rightAvailable])
  {
    int v25 = [(AXHearingAidDevice *)self rightPeripheral];
    int v26 = [v25 identifier];

    if (v26)
    {
      uint64_t v27 = [(AXHearingAidDevice *)self rightPeripheral];
      id v28 = [v27 identifier];
      uint64_t v29 = [v28 UUIDString];

      uint64_t v30 = (void *)MEMORY[0x263EFF9A0];
      char v31 = [NSNumber numberWithBool:0];
      int v32 = objc_msgSend(v30, "dictionaryWithObjectsAndKeys:", v31, @"ax_hearing_device_isleft_key", 0);

      uint64_t v33 = [(AXHearingAidDevice *)self rightUUID];

      if (v33)
      {
        uint64_t v34 = [(AXHearingAidDevice *)self rightUUID];
        [v32 setObject:v34 forKey:@"ax_hearing_device_hiid_key"];
      }
      int v35 = [(AXHearingAidDevice *)self leftUUID];

      if (v35)
      {
        uint64_t v36 = [(AXHearingAidDevice *)self leftUUID];
        [v32 setObject:v36 forKey:@"ax_hearing_device_hiidother_key"];
      }
      if (v29) {
        [v32 setObject:v29 forKey:@"ax_hearing_device_uuid_key"];
      }
      uint64_t v37 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXHearingAidDevice rightLeaVersion](self, "rightLeaVersion"));
      [v32 setObject:v37 forKey:@"ax_hearing_device_lea_version_key"];

      [v11 setObject:v32 forKey:@"ax_hearing_device_right_peripheral_key"];
    }
  }
  if ((unint64_t)[v11 count] >= 4) {
    id v38 = v11;
  }
  else {
    id v38 = 0;
  }

  return v38;
}

- (BOOL)isFakeDevice
{
  return 0;
}

- (id)serviceUUID
{
  return (id)[MEMORY[0x263EFEF88] UUIDWithString:@"7D74F4BD-C74A-4431-862C-CCE884371592"];
}

- (unint64_t)requiredProperties
{
  return 0xD07D42105FCLL;
}

- (unint64_t)deviceType
{
  return 1;
}

- (NSString)leftUUID
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLeftUUID:(id)a3
{
}

- (NSString)rightUUID
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRightUUID:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)manufacturer
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setManufacturer:(id)a3
{
}

- (NSMutableArray)model
{
  return (NSMutableArray *)objc_getProperty(self, a2, 208, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)leftFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLeftFirmwareVersion:(id)a3
{
}

- (NSString)rightFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRightFirmwareVersion:(id)a3
{
}

- (NSString)leftHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setLeftHardwareVersion:(id)a3
{
}

- (NSString)rightHardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setRightHardwareVersion:(id)a3
{
}

- (double)rightBatteryLevel
{
  return self->rightBatteryLevel;
}

- (void)setRightBatteryLevel:(double)a3
{
  self->rightBatteryLevel = a3;
}

- (double)leftBatteryLevel
{
  return self->leftBatteryLevel;
}

- (void)setLeftBatteryLevel:(double)a3
{
  self->leftBatteryLevel = a3;
}

- (NSArray)rightPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setRightPrograms:(id)a3
{
}

- (NSArray)leftPrograms
{
  return (NSArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)setLeftPrograms:(id)a3
{
}

- (AXHearingAidMode)currentRightProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCurrentRightProgram:(id)a3
{
}

- (AXHearingAidMode)currentLeftProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 288, 1);
}

- (void)setCurrentLeftProgram:(id)a3
{
}

- (AXHearingAidMode)currentLeftStreamingProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 296, 1);
}

- (void)setCurrentLeftStreamingProgram:(id)a3
{
}

- (AXHearingAidMode)currentRightStreamingProgram
{
  return (AXHearingAidMode *)objc_getProperty(self, a2, 304, 1);
}

- (void)setCurrentRightStreamingProgram:(id)a3
{
}

- (CBPeripheral)leftPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 312, 1);
}

- (void)setLeftPeripheral:(id)a3
{
}

- (CBPeripheral)rightPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 320, 1);
}

- (void)setRightPeripheral:(id)a3
{
}

- (BOOL)isPaired
{
  return self->isPaired;
}

- (void)setIsPaired:(BOOL)a3
{
  self->isPaired = a3;
}

- (BOOL)isConnecting
{
  return self->isConnecting;
}

- (void)setIsConnecting:(BOOL)a3
{
  self->isConnecting = a3;
}

- (BOOL)isPersistent
{
  return self->isPersistent;
}

- (void)setIsPersistent:(BOOL)a3
{
  self->isPersistent = a3;
}

- (int)availableEars
{
  return self->_availableEars;
}

- (void)setAvailableEars:(int)a3
{
  self->_availableEars = a3;
}

- (unint64_t)leftLeaVersion
{
  return self->leftLeaVersion;
}

- (void)setLeftLeaVersion:(unint64_t)a3
{
  self->leftLeaVersion = a3;
}

- (unint64_t)rightLeaVersion
{
  return self->rightLeaVersion;
}

- (void)setRightLeaVersion:(unint64_t)a3
{
  self->rightLeaVersion = a3;
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

- (char)leftTreble
{
  return self->_leftTreble;
}

- (void)setLeftTreble:(char)a3
{
  self->_leftTreble = a3;
}

- (char)rightTreble
{
  return self->_rightTreble;
}

- (void)setRightTreble:(char)a3
{
  self->_rightTreble = a3;
}

- (char)leftBass
{
  return self->_leftBass;
}

- (void)setLeftBass:(char)a3
{
  self->_leftBass = a3;
}

- (char)rightBass
{
  return self->_rightBass;
}

- (void)setRightBass:(char)a3
{
  self->_rightBass = a3;
}

- (double)leftMixedVolume
{
  return self->_leftMixedVolume;
}

- (void)setLeftMixedVolume:(double)a3
{
  self->_leftMixedVolume = a3;
}

- (double)rightMixedVolume
{
  return self->_rightMixedVolume;
}

- (void)setRightMixedVolume:(double)a3
{
  self->_rightMixedVolume = a3;
}

- (BOOL)keepInSync
{
  return self->_keepInSync;
}

- (unint64_t)leftLoadedProperties
{
  return self->leftLoadedProperties;
}

- (void)setLeftLoadedProperties:(unint64_t)a3
{
  self->leftLoadedProperties = a3;
}

- (unint64_t)rightLoadedProperties
{
  return self->rightLoadedProperties;
}

- (void)setRightLoadedProperties:(unint64_t)a3
{
  self->rightLoadedProperties = a3;
}

- (NSMutableDictionary)leftPropertiesLoadCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (void)setLeftPropertiesLoadCount:(id)a3
{
}

- (NSMutableDictionary)rightPropertiesLoadCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 432, 1);
}

- (void)setRightPropertiesLoadCount:(id)a3
{
}

- (NSString)leftPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 440, 1);
}

- (void)setLeftPeripheralUUID:(id)a3
{
}

- (NSString)rightPeripheralUUID
{
  return (NSString *)objc_getProperty(self, a2, 448, 1);
}

- (void)setRightPeripheralUUID:(id)a3
{
}

- (unint64_t)leftWriteRequestProperties
{
  return self->leftWriteRequestProperties;
}

- (void)setLeftWriteRequestProperties:(unint64_t)a3
{
  self->leftWriteRequestProperties = a3;
}

- (unint64_t)rightWriteRequestProperties
{
  return self->rightWriteRequestProperties;
}

- (void)setRightWriteRequestProperties:(unint64_t)a3
{
  self->rightWriteRequestProperties = a3;
}

- (unsigned)leftProgramVersion
{
  return self->leftProgramVersion;
}

- (void)setLeftProgramVersion:(unsigned int)a3
{
  self->leftProgramVersion = a3;
}

- (unsigned)rightProgramVersion
{
  return self->rightProgramVersion;
}

- (void)setRightProgramVersion:(unsigned int)a3
{
  self->rightProgramVersion = a3;
}

- (unsigned)leftPresetBitmask
{
  return self->_leftPresetBitmask;
}

- (void)setLeftPresetBitmask:(unsigned int)a3
{
  self->_leftPresetBitmask = a3;
}

- (unsigned)rightPresetBitmask
{
  return self->_rightPresetBitmask;
}

- (void)setRightPresetBitmask:(unsigned int)a3
{
  self->_rightPresetBitmask = a3;
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

- (unint64_t)leftWriteResponseProperties
{
  return self->_leftWriteResponseProperties;
}

- (void)setLeftWriteResponseProperties:(unint64_t)a3
{
  self->_leftWriteResponseProperties = a3;
}

- (unint64_t)rightWriteResponseProperties
{
  return self->_rightWriteResponseProperties;
}

- (void)setRightWriteResponseProperties:(unint64_t)a3
{
  self->_rightWriteResponseProperties = a3;
}

- (NSDate)leftBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 488, 1);
}

- (void)setLeftBatteryLowDate:(id)a3
{
}

- (NSDate)rightBatteryLowDate
{
  return (NSDate *)objc_getProperty(self, a2, 496, 1);
}

- (void)setRightBatteryLowDate:(id)a3
{
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

- (BOOL)leftPeripheralPaired
{
  return self->_leftPeripheralPaired;
}

- (void)setLeftPeripheralPaired:(BOOL)a3
{
  self->_BOOL leftPeripheralPaired = a3;
}

- (BOOL)rightPeripheralPaired
{
  return self->_rightPeripheralPaired;
}

- (void)setRightPeripheralPaired:(BOOL)a3
{
  self->_BOOL rightPeripheralPaired = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_leftBatteryLowDate, 0);
  objc_storeStrong((id *)&self->rightPeripheralUUID, 0);
  objc_storeStrong((id *)&self->leftPeripheralUUID, 0);
  objc_storeStrong((id *)&self->rightPropertiesLoadCount, 0);
  objc_storeStrong((id *)&self->leftPropertiesLoadCount, 0);
  objc_storeStrong((id *)&self->_rightSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedStreamingProgram, 0);
  objc_storeStrong((id *)&self->_rightSelectedProgram, 0);
  objc_storeStrong((id *)&self->_leftSelectedProgram, 0);
  objc_storeStrong((id *)&self->rightPeripheral, 0);
  objc_storeStrong((id *)&self->leftPeripheral, 0);
  objc_storeStrong((id *)&self->currentRightStreamingProgram, 0);
  objc_storeStrong((id *)&self->currentLeftStreamingProgram, 0);
  objc_storeStrong((id *)&self->currentLeftProgram, 0);
  objc_storeStrong((id *)&self->currentRightProgram, 0);
  objc_storeStrong((id *)&self->leftPrograms, 0);
  objc_storeStrong((id *)&self->rightPrograms, 0);
  objc_storeStrong((id *)&self->rightHardwareVersion, 0);
  objc_storeStrong((id *)&self->leftHardwareVersion, 0);
  objc_storeStrong((id *)&self->rightFirmwareVersion, 0);
  objc_storeStrong((id *)&self->leftFirmwareVersion, 0);
  objc_storeStrong((id *)&self->model, 0);
  objc_storeStrong((id *)&self->manufacturer, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->rightUUID, 0);
  objc_storeStrong((id *)&self->leftUUID, 0);
  objc_storeStrong((id *)&self->_rightPowerSourceDictionary, 0);
  objc_storeStrong((id *)&self->_leftPowerSouceDictionary, 0);

  objc_storeStrong((id *)&self->_propertyWriteTimer, 0);
}

- (void)valueForProperty:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = a1;
  BOOL v4 = hearingPropertyDescription(a2);
  int v5 = 138543618;
  id v6 = v4;
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_20CC86000, v3, OS_LOG_TYPE_FAULT, "%{public}@ (%ld) is unhandled resulting in infinite recursion.", (uint8_t *)&v5, 0x16u);
}

void __54__AXHearingAidDevice_pairingDidCompleteForPeripheral___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_20CC86000, a2, OS_LOG_TYPE_FAULT, "Device paired but doesn't contain peripheral %@", (uint8_t *)&v3, 0xCu);
}

@end