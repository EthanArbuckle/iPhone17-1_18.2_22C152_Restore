@interface AXFakeHearingAidDevice
- (AXFakeHearingAidDevice)initWithDeviceType:(int)a3;
- (BOOL)connected;
- (BOOL)deviceSupportsProperty:(unint64_t)a3;
- (BOOL)didLoadBasicProperties;
- (BOOL)didLoadRequiredProperties;
- (BOOL)isConnecting;
- (BOOL)isFakeDevice;
- (BOOL)isPersistent;
- (BOOL)leftAvailable;
- (BOOL)programsListsAreEqual;
- (BOOL)propertyIsAvailable:(unint64_t)a3 forEar:(int)a4;
- (BOOL)rightAvailable;
- (BOOL)showCombinedPrograms;
- (BOOL)supportsCombinedVolumesForProperty:(unint64_t)a3;
- (CBPeripheral)leftPeripheral;
- (CBPeripheral)rightPeripheral;
- (NSArray)manufacturer;
- (NSArray)model;
- (NSDate)leftBatteryLowDate;
- (NSDate)rightBatteryLowDate;
- (NSString)leftFirmwareVersion;
- (NSString)leftHardwareVersion;
- (NSString)leftUUID;
- (NSString)name;
- (NSString)rightFirmwareVersion;
- (NSString)rightHardwareVersion;
- (NSString)rightUUID;
- (double)leftBatteryLevel;
- (double)rightBatteryLevel;
- (id)leftPrograms;
- (id)manufacturerForType;
- (id)modelForType;
- (id)persistentRepresentation;
- (id)rightPrograms;
- (id)valueForProperty:(unint64_t)a3;
- (int)type;
- (signed)leftMicrophoneVolumeSteps;
- (signed)rightMicrophoneVolumeSteps;
- (unint64_t)availablePropertiesForPeripheral:(id)a3;
- (unint64_t)excludedProperties;
- (void)connect;
- (void)createPrograms;
- (void)dealloc;
- (void)disconnect;
- (void)persist;
- (void)registerWriteBlock:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setExcludedProperties:(unint64_t)a3;
- (void)setIsConnecting:(BOOL)a3;
- (void)setLeftBatteryLevel:(double)a3;
- (void)setLeftBatteryLowDate:(id)a3;
- (void)setLeftFirmwareVersion:(id)a3;
- (void)setLeftHardwareVersion:(id)a3;
- (void)setLeftMicrophoneVolumeSteps:(signed __int16)a3;
- (void)setLeftPeripheral:(id)a3;
- (void)setLeftUUID:(id)a3;
- (void)setManufacturer:(id)a3;
- (void)setModel:(id)a3;
- (void)setName:(id)a3;
- (void)setRightBatteryLevel:(double)a3;
- (void)setRightBatteryLowDate:(id)a3;
- (void)setRightFirmwareVersion:(id)a3;
- (void)setRightHardwareVersion:(id)a3;
- (void)setRightMicrophoneVolumeSteps:(signed __int16)a3;
- (void)setRightPeripheral:(id)a3;
- (void)setRightUUID:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3 forProperty:(unint64_t)a4;
- (void)writeInt:(unsigned __int8)a3 toEar:(int)a4 forProperty:(unint64_t)a5;
- (void)writeSignedInt:(char)a3 toEar:(int)a4 forProperty:(unint64_t)a5;
@end

@implementation AXFakeHearingAidDevice

- (AXFakeHearingAidDevice)initWithDeviceType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v18[2] = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AXFakeHearingAidDevice;
  v4 = [(AXHearingAidDevice *)&v16 initWithPeripheral:0];
  v5 = v4;
  if (v4)
  {
    [(AXFakeHearingAidDevice *)v4 setType:v3];
    [(AXFakeHearingAidDevice *)v5 setName:@"Nathan's Hearing Aid"];
    v6 = [(AXFakeHearingAidDevice *)v5 manufacturerForType];
    v18[0] = v6;
    v18[1] = &stru_26C1D5720;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    [(AXFakeHearingAidDevice *)v5 setManufacturer:v7];

    v8 = [(AXFakeHearingAidDevice *)v5 modelForType];
    v17[0] = v8;
    v17[1] = &stru_26C1D5720;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [(AXFakeHearingAidDevice *)v5 setModel:v9];

    v10 = objc_msgSend(NSString, "stringWithFormat:", @"AppleLeft-%d", arc4random());
    [(AXFakeHearingAidDevice *)v5 setLeftUUID:v10];

    v11 = objc_msgSend(NSString, "stringWithFormat:", @"AppleRight-%d", arc4random());
    [(AXFakeHearingAidDevice *)v5 setRightUUID:v11];

    if ([(AXFakeHearingAidDevice *)v5 leftAvailable])
    {
      [(AXFakeHearingAidDevice *)v5 setLeftBatteryLevel:1.0];
      [(AXHearingAidDevice *)v5 setLeftMicrophoneVolume:0.5];
      [(AXHearingAidDevice *)v5 setLeftStreamVolume:0.5];
      [(AXFakeHearingAidDevice *)v5 setLeftFirmwareVersion:@"1.0"];
      [(AXFakeHearingAidDevice *)v5 setLeftHardwareVersion:@"1.0"];
      [(AXFakeHearingAidDevice *)v5 setLeftMicrophoneVolumeSteps:3];
      [(AXHearingAidDevice *)v5 setAvailableEars:[(AXHearingAidDevice *)v5 availableEars] | 2];
    }
    if ([(AXFakeHearingAidDevice *)v5 rightAvailable])
    {
      [(AXFakeHearingAidDevice *)v5 setRightBatteryLevel:0.850000024];
      v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-60.0];
      [(AXFakeHearingAidDevice *)v5 setRightBatteryLowDate:v12];

      [(AXHearingAidDevice *)v5 setRightMicrophoneVolume:0.5];
      [(AXHearingAidDevice *)v5 setRightStreamVolume:0.5];
      [(AXFakeHearingAidDevice *)v5 setRightFirmwareVersion:@"1.0"];
      [(AXFakeHearingAidDevice *)v5 setRightHardwareVersion:@"1.0"];
      [(AXHearingAidDevice *)v5 setAvailableEars:[(AXHearingAidDevice *)v5 availableEars] | 4];
    }
    [(AXFakeHearingAidDevice *)v5 createPrograms];
    v13 = [(AXHearingAidDevice *)v5 programs];
    v14 = [v13 firstObject];
    [(AXHearingAidDevice *)v5 selectProgram:v14 forEar:6];

    [(AXFakeHearingAidDevice *)v5 connect];
  }
  return v5;
}

- (void)dealloc
{
  [(AXFakeHearingAidDevice *)self setName:0];
  [(AXFakeHearingAidDevice *)self setManufacturer:0];
  [(AXFakeHearingAidDevice *)self setModel:0];
  [(AXFakeHearingAidDevice *)self setLeftUUID:0];
  [(AXFakeHearingAidDevice *)self setRightUUID:0];
  [(AXFakeHearingAidDevice *)self setLeftFirmwareVersion:0];
  [(AXFakeHearingAidDevice *)self setRightFirmwareVersion:0];
  [(AXFakeHearingAidDevice *)self setLeftHardwareVersion:0];
  [(AXFakeHearingAidDevice *)self setRightHardwareVersion:0];
  [(AXFakeHearingAidDevice *)self setLeftBatteryLowDate:0];
  [(AXFakeHearingAidDevice *)self setRightBatteryLowDate:0];
  v3.receiver = self;
  v3.super_class = (Class)AXFakeHearingAidDevice;
  [(AXHearingAidDevice *)&v3 dealloc];
}

- (id)manufacturerForType
{
  if ([(AXFakeHearingAidDevice *)self type] == 64) {
    return @"Carbondale";
  }
  else {
    return @"That Fruit Company";
  }
}

- (id)modelForType
{
  int v2 = [(AXFakeHearingAidDevice *)self type];
  objc_super v3 = @"DEMO";
  v4 = @"T0B1AS";
  v5 = @"P0E";
  v6 = @"IL5440";
  if (v2 != 64) {
    v6 = @"DEMO";
  }
  if (v2 != 32) {
    v5 = v6;
  }
  if (v2 != 16) {
    v4 = v5;
  }
  if (v2 == 8) {
    objc_super v3 = @"B0TH";
  }
  if (v2 == 4) {
    objc_super v3 = @"R1G4T";
  }
  if (v2 == 2) {
    objc_super v3 = @"L3FT";
  }
  if (v2 <= 15) {
    return v3;
  }
  else {
    return v4;
  }
}

- (void)connect
{
}

void __33__AXFakeHearingAidDevice_connect__block_invoke(uint64_t a1)
{
  id v2 = +[AXHearingAidDeviceController sharedController];
  [v2 device:*(void *)(a1 + 32) didUpdateProperty:0xD07D42105FCLL];
}

- (void)disconnect
{
}

- (BOOL)leftAvailable
{
  if (([(AXFakeHearingAidDevice *)self type] & 0x40) != 0
    || ([(AXFakeHearingAidDevice *)self type] & 2) != 0
    || ([(AXFakeHearingAidDevice *)self type] & 8) != 0
    || ([(AXFakeHearingAidDevice *)self type] & 0x10) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return ([(AXFakeHearingAidDevice *)self type] >> 5) & 1;
  }
  return v3;
}

- (BOOL)rightAvailable
{
  if (([(AXFakeHearingAidDevice *)self type] & 0x40) != 0
    || ([(AXFakeHearingAidDevice *)self type] & 4) != 0
    || ([(AXFakeHearingAidDevice *)self type] & 8) != 0
    || ([(AXFakeHearingAidDevice *)self type] & 0x10) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    return ([(AXFakeHearingAidDevice *)self type] >> 5) & 1;
  }
  return v3;
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)createPrograms
{
  if (!self->_leftFakePrograms)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    leftFakePrograms = self->_leftFakePrograms;
    self->_leftFakePrograms = v3;

    if ([(AXFakeHearingAidDevice *)self leftAvailable])
    {
      v5 = objc_alloc_init(AXHearingAidMode);
      [(AXHearingAidMode *)v5 setName:@"Default"];
      [(AXHearingAidMode *)v5 setCategory:1];
      [(AXHearingAidMode *)v5 setIndex:1];
      [(AXHearingAidMode *)v5 setEar:6];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v5];
      v6 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v6 setName:@"Theater"];
      [(AXHearingAidMode *)v6 setCategory:3];
      [(AXHearingAidMode *)v6 setIndex:4];
      [(AXHearingAidMode *)v6 setEar:6];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v6];
      v7 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v7 setName:@"Car"];
      [(AXHearingAidMode *)v7 setCategory:4];
      [(AXHearingAidMode *)v7 setIndex:7];
      [(AXHearingAidMode *)v7 setEar:2];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v7];
      v8 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v8 setName:@"Restaurant"];
      [(AXHearingAidMode *)v8 setCategory:3];
      [(AXHearingAidMode *)v8 setIndex:12];
      [(AXHearingAidMode *)v8 setEar:6];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v8];
      v9 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v9 setName:@"Television streamer"];
      [(AXHearingAidMode *)v9 setCategory:200];
      [(AXHearingAidMode *)v9 setIndex:14];
      [(AXHearingAidMode *)v9 setEar:6];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v9];
      v10 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v10 setName:@"Mixing streamer"];
      [(AXHearingAidMode *)v10 setCategory:100];
      [(AXHearingAidMode *)v10 setIndex:15];
      [(AXHearingAidMode *)v10 setEar:6];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v10];
      v11 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v11 setName:@"Mixing streamer 2"];
      [(AXHearingAidMode *)v11 setCategory:100];
      [(AXHearingAidMode *)v11 setIndex:16];
      [(AXHearingAidMode *)v11 setEar:6];
      [(NSMutableArray *)self->_leftFakePrograms addObject:v11];
      if ([(AXFakeHearingAidDevice *)self type] != 64)
      {
        v12 = objc_alloc_init(AXHearingAidMode);

        [(AXHearingAidMode *)v12 setName:@"Park"];
        [(AXHearingAidMode *)v12 setCategory:4];
        [(AXHearingAidMode *)v12 setIndex:8];
        [(AXHearingAidMode *)v12 setEar:2];
        [(NSMutableArray *)self->_leftFakePrograms addObject:v12];
        v13 = objc_alloc_init(AXHearingAidMode);

        [(AXHearingAidMode *)v13 setName:@"Bowling"];
        [(AXHearingAidMode *)v13 setCategory:4];
        [(AXHearingAidMode *)v13 setIndex:9];
        [(AXHearingAidMode *)v13 setEar:6];
        [(NSMutableArray *)self->_leftFakePrograms addObject:v13];
        v11 = objc_alloc_init(AXHearingAidMode);

        [(AXHearingAidMode *)v11 setName:@"Skydiving"];
        [(AXHearingAidMode *)v11 setCategory:4];
        [(AXHearingAidMode *)v11 setIndex:10];
        [(AXHearingAidMode *)v11 setEar:6];
        [(NSMutableArray *)self->_leftFakePrograms addObject:v11];
      }
    }
  }
  if (!self->_rightFakePrograms)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rightFakePrograms = self->_rightFakePrograms;
    self->_rightFakePrograms = v14;

    if ([(AXFakeHearingAidDevice *)self rightAvailable])
    {
      objc_super v16 = objc_alloc_init(AXHearingAidMode);
      [(AXHearingAidMode *)v16 setName:@"Default"];
      [(AXHearingAidMode *)v16 setCategory:1];
      [(AXHearingAidMode *)v16 setIndex:1];
      [(AXHearingAidMode *)v16 setEar:6];
      [(NSMutableArray *)self->_rightFakePrograms addObject:v16];
      v17 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v17 setName:@"Theater"];
      [(AXHearingAidMode *)v17 setCategory:3];
      [(AXHearingAidMode *)v17 setIndex:4];
      [(AXHearingAidMode *)v17 setEar:6];
      [(NSMutableArray *)self->_rightFakePrograms addObject:v17];
      v18 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v18 setName:@"Restaurant"];
      [(AXHearingAidMode *)v18 setCategory:3];
      [(AXHearingAidMode *)v18 setIndex:12];
      [(AXHearingAidMode *)v18 setEar:6];
      [(NSMutableArray *)self->_rightFakePrograms addObject:v18];
      v19 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v19 setName:@"Television streamer"];
      [(AXHearingAidMode *)v19 setCategory:201];
      [(AXHearingAidMode *)v19 setIndex:14];
      [(AXHearingAidMode *)v19 setEar:6];
      [(NSMutableArray *)self->_rightFakePrograms addObject:v19];
      v20 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v20 setName:@"Mixing streamer"];
      [(AXHearingAidMode *)v20 setCategory:100];
      [(AXHearingAidMode *)v20 setIndex:15];
      [(AXHearingAidMode *)v20 setEar:6];
      [(NSMutableArray *)self->_rightFakePrograms addObject:v20];
      v21 = objc_alloc_init(AXHearingAidMode);

      [(AXHearingAidMode *)v21 setName:@"Mixing streamer 2"];
      [(AXHearingAidMode *)v21 setCategory:100];
      [(AXHearingAidMode *)v21 setIndex:16];
      [(AXHearingAidMode *)v21 setEar:6];
      [(NSMutableArray *)self->_rightFakePrograms addObject:v21];
      if ([(AXFakeHearingAidDevice *)self type] != 64)
      {
        v22 = objc_alloc_init(AXHearingAidMode);

        [(AXHearingAidMode *)v22 setName:@"Parking lot"];
        [(AXHearingAidMode *)v22 setCategory:3];
        [(AXHearingAidMode *)v22 setIndex:25];
        [(AXHearingAidMode *)v22 setEar:6];
        [(NSMutableArray *)self->_rightFakePrograms addObject:v22];
        v23 = objc_alloc_init(AXHearingAidMode);

        [(AXHearingAidMode *)v23 setName:@"Baseball game"];
        [(AXHearingAidMode *)v23 setCategory:3];
        [(AXHearingAidMode *)v23 setIndex:26];
        [(AXHearingAidMode *)v23 setEar:4];
        [(NSMutableArray *)self->_rightFakePrograms addObject:v23];
        v21 = objc_alloc_init(AXHearingAidMode);

        [(AXHearingAidMode *)v21 setName:@"Space Station Ring Toss Jacuzzi"];
        [(AXHearingAidMode *)v21 setCategory:200];
        [(AXHearingAidMode *)v21 setIndex:27];
        [(AXHearingAidMode *)v21 setEar:4];
        [(NSMutableArray *)self->_rightFakePrograms addObject:v21];
      }
    }
  }
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  int v35 = 0;
  v24 = self->_leftFakePrograms;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __40__AXFakeHearingAidDevice_createPrograms__block_invoke;
  v31[3] = &unk_2640FF108;
  v31[4] = &v32;
  [(NSMutableArray *)v24 enumerateObjectsUsingBlock:v31];
  [(AXHearingAidDevice *)self setLeftPresetBitmask:*((unsigned int *)v33 + 6)];
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  v25 = self->_rightFakePrograms;
  int v30 = 0;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __40__AXFakeHearingAidDevice_createPrograms__block_invoke_2;
  v26[3] = &unk_2640FF108;
  v26[4] = &v27;
  [(NSMutableArray *)v25 enumerateObjectsUsingBlock:v26];
  [(AXHearingAidDevice *)self setRightPresetBitmask:*((unsigned int *)v28 + 6)];
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
}

uint64_t __40__AXFakeHearingAidDevice_createPrograms__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 index];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += 1 << result;
  return result;
}

uint64_t __40__AXFakeHearingAidDevice_createPrograms__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 index];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += 1 << result;
  return result;
}

- (id)leftPrograms
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->_leftFakePrograms];
}

- (id)rightPrograms
{
  return (id)[MEMORY[0x263EFF8C0] arrayWithArray:self->_rightFakePrograms];
}

- (unint64_t)availablePropertiesForPeripheral:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 2;
  v5 = +[AXHearingAidDevice characteristicsUUIDs];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__AXFakeHearingAidDevice_availablePropertiesForPeripheral___block_invoke;
  v9[3] = &unk_2640FF130;
  v9[4] = &v10;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  unint64_t v6 = [(AXFakeHearingAidDevice *)self excludedProperties];
  unint64_t v7 = v11[3] & ~v6;
  v11[3] = v7;
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __59__AXFakeHearingAidDevice_availablePropertiesForPeripheral___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 unsignedLongLongValue];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= result;
  return result;
}

- (BOOL)deviceSupportsProperty:(unint64_t)a3
{
  return (a3 & ~[(AXFakeHearingAidDevice *)self availablePropertiesForPeripheral:0]) == 0;
}

- (BOOL)propertyIsAvailable:(unint64_t)a3 forEar:(int)a4
{
  return (a3 & ~-[AXFakeHearingAidDevice availablePropertiesForPeripheral:](self, "availablePropertiesForPeripheral:", 0, *(void *)&a4)) == 0;
}

- (BOOL)supportsCombinedVolumesForProperty:(unint64_t)a3
{
  BOOL v5 = [(AXFakeHearingAidDevice *)self leftAvailable];
  if (v5 != [(AXFakeHearingAidDevice *)self rightAvailable]) {
    return 1;
  }
  BOOL result = 0;
  if ((uint64_t)a3 > 0x7FFFFFFF)
  {
    if (a3 == 0x80000000)
    {
      int v15 = [(AXHearingAidDevice *)self leftSensitivitySteps];
      if (v15 == [(AXHearingAidDevice *)self rightSensitivitySteps])
      {
        [(AXHearingAidDevice *)self leftSensitivity];
        double v9 = v16;
        [(AXHearingAidDevice *)self rightSensitivity];
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
    else
    {
      if (a3 != 0x4000000000) {
        return result;
      }
      int v11 = [(AXHearingAidDevice *)self leftMixedVolumeSteps];
      if (v11 == [(AXHearingAidDevice *)self rightMixedVolumeSteps])
      {
        [(AXHearingAidDevice *)self leftMixedVolume];
        double v9 = v12;
        [(AXHearingAidDevice *)self rightMixedVolume];
        return vabdd_f64(v9, v10) < 0.01;
      }
    }
  }
  else if (a3 == 64)
  {
    int v13 = [(AXFakeHearingAidDevice *)self leftMicrophoneVolumeSteps];
    if (v13 == [(AXFakeHearingAidDevice *)self rightMicrophoneVolumeSteps])
    {
      [(AXHearingAidDevice *)self leftMicrophoneVolume];
      double v9 = v14;
      [(AXHearingAidDevice *)self rightMicrophoneVolume];
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  else
  {
    if (a3 != 128) {
      return result;
    }
    int v7 = [(AXHearingAidDevice *)self leftStreamVolumeSteps];
    if (v7 == [(AXHearingAidDevice *)self rightStreamVolumeSteps])
    {
      [(AXHearingAidDevice *)self leftStreamVolume];
      double v9 = v8;
      [(AXHearingAidDevice *)self rightStreamVolume];
      return vabdd_f64(v9, v10) < 0.01;
    }
  }
  return 0;
}

- (BOOL)showCombinedPrograms
{
  if (![(AXHearingAidDevice *)self supportsCombinedPresets]) {
    return 0;
  }
  BOOL v3 = +[HUHearingAidSettings sharedInstance];
  BOOL v4 = (![v3 independentHearingAidSettings]
     || [(AXHearingAidDevice *)self requiresCombinedPresets])
    && [(AXFakeHearingAidDevice *)self programsListsAreEqual];

  return v4;
}

- (BOOL)programsListsAreEqual
{
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  BOOL v3 = [(AXFakeHearingAidDevice *)self leftPrograms];
  uint64_t v4 = [v3 count];
  BOOL v5 = [(AXFakeHearingAidDevice *)self rightPrograms];
  LOBYTE(v4) = v4 == [v5 count];

  char v18 = v4;
  if (!*((unsigned char *)v16 + 24)) {
    goto LABEL_5;
  }
  unint64_t v6 = [(AXFakeHearingAidDevice *)self leftPrograms];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__AXFakeHearingAidDevice_programsListsAreEqual__block_invoke;
  v14[3] = &unk_2640FE9C8;
  v14[4] = self;
  v14[5] = &v15;
  [v6 enumerateObjectsUsingBlock:v14];

  if (*((unsigned char *)v16 + 24))
  {
    int v7 = [(AXHearingAidDevice *)self leftSelectedProgram];
    double v8 = [(AXHearingAidDevice *)self rightSelectedProgram];
    if ([v7 isEqual:v8])
    {
      double v9 = [(AXHearingAidDevice *)self leftSelectedStreamingProgram];
      double v10 = [(AXHearingAidDevice *)self rightSelectedStreamingProgram];
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

void __47__AXFakeHearingAidDevice_programsListsAreEqual__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
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

- (void)writeInt:(unsigned __int8)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = a3;
  uint64_t v20 = *MEMORY[0x263EF8340];
  HAInitializeLogging();
  double v9 = NSString;
  int v10 = hearingPropertyDescription(a5);
  char v11 = [v9 stringWithFormat:@"WRITING %d for %@", v7, v10];

  BOOL v12 = [NSString stringWithFormat:@"%s:%d %@", "-[AXFakeHearingAidDevice writeInt:toEar:forProperty:]", 525, v11];
  int v13 = (void *)*MEMORY[0x263F47290];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F47290], OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v12;
    uint64_t v15 = v13;
    *(_DWORD *)buf = 136446210;
    uint64_t v19 = [v14 UTF8String];
    _os_log_impl(&dword_20CC86000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  writeBlock = (void (**)(id, unint64_t, void *, void))self->_writeBlock;
  if (writeBlock)
  {
    uint64_t v17 = [NSNumber numberWithUnsignedChar:v7];
    writeBlock[2](writeBlock, a5, v17, v6);
  }
}

- (void)writeSignedInt:(char)a3 toEar:(int)a4 forProperty:(unint64_t)a5
{
  writeBlock = (void (**)(id, unint64_t, id, void))self->_writeBlock;
  if (writeBlock)
  {
    uint64_t v7 = *(void *)&a4;
    id v8 = [NSNumber numberWithChar:a3];
    writeBlock[2](writeBlock, a5, v8, v7);
  }
}

- (id)persistentRepresentation
{
  BOOL v3 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = self;
  v8.super_class = (Class)AXFakeHearingAidDevice;
  uint64_t v4 = [(AXHearingAidDevice *)&v8 persistentRepresentation];
  BOOL v5 = [v3 dictionaryWithDictionary:v4];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[AXFakeHearingAidDevice type](self, "type"));
  [v5 setObject:v6 forKey:@"ax_hearing_device_fake_type_key"];

  return v5;
}

- (id)valueForProperty:(unint64_t)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)AXFakeHearingAidDevice;
  BOOL v5 = -[AXHearingAidDevice valueForProperty:](&v12, sel_valueForProperty_);
  if (a3 == 512)
  {
    v13[0] = &unk_26C1E5990;
    v13[1] = &unk_26C1E59A8;
    v14[0] = &unk_26C1E5E80;
    v14[1] = &unk_26C1E5E98;
    uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    if (a3 != 0x200000) {
      goto LABEL_9;
    }
    if ([(AXFakeHearingAidDevice *)self isConnected]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v8 = [NSNumber numberWithUnsignedInt:v6];
    double v9 = [NSNumber numberWithUnsignedInt:v6];
    uint64_t v10 = objc_msgSend(v7, "arrayWithObjects:", v8, v9, 0);

    BOOL v5 = (void *)v8;
  }

  BOOL v5 = (void *)v10;
LABEL_9:

  return v5;
}

- (void)setValue:(id)a3 forProperty:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXFakeHearingAidDevice;
  -[AXHearingAidDevice setValue:forProperty:](&v7, sel_setValue_forProperty_, a3);
  uint64_t v6 = +[AXHearingAidDeviceController sharedController];
  [v6 device:self didUpdateProperty:a4];
}

- (BOOL)didLoadBasicProperties
{
  return 1;
}

- (BOOL)didLoadRequiredProperties
{
  return 1;
}

- (void)persist
{
  id v4 = +[HUHearingAidSettings sharedInstance];
  BOOL v3 = [(AXFakeHearingAidDevice *)self persistentRepresentation];
  [v4 setPairedHearingAids:v3];
}

- (void)registerWriteBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id writeBlock = self->_writeBlock;
  self->_id writeBlock = v4;

  MEMORY[0x270F9A758](v4, writeBlock);
}

- (BOOL)isFakeDevice
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)manufacturer
{
  return self->_manufacturer;
}

- (void)setManufacturer:(id)a3
{
}

- (NSArray)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)leftUUID
{
  return self->_leftUUID;
}

- (void)setLeftUUID:(id)a3
{
}

- (NSString)rightUUID
{
  return self->_rightUUID;
}

- (void)setRightUUID:(id)a3
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

- (BOOL)isConnecting
{
  return self->_isConnecting;
}

- (void)setIsConnecting:(BOOL)a3
{
  self->_isConnecting = a3;
}

- (NSString)leftFirmwareVersion
{
  return self->_leftFirmwareVersion;
}

- (void)setLeftFirmwareVersion:(id)a3
{
}

- (NSString)rightFirmwareVersion
{
  return self->_rightFirmwareVersion;
}

- (void)setRightFirmwareVersion:(id)a3
{
}

- (NSString)leftHardwareVersion
{
  return self->_leftHardwareVersion;
}

- (void)setLeftHardwareVersion:(id)a3
{
}

- (NSString)rightHardwareVersion
{
  return self->_rightHardwareVersion;
}

- (void)setRightHardwareVersion:(id)a3
{
}

- (NSDate)leftBatteryLowDate
{
  return self->_leftBatteryLowDate;
}

- (void)setLeftBatteryLowDate:(id)a3
{
}

- (NSDate)rightBatteryLowDate
{
  return self->_rightBatteryLowDate;
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

- (CBPeripheral)leftPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 648, 1);
}

- (void)setLeftPeripheral:(id)a3
{
}

- (CBPeripheral)rightPeripheral
{
  return (CBPeripheral *)objc_getProperty(self, a2, 656, 1);
}

- (void)setRightPeripheral:(id)a3
{
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unint64_t)excludedProperties
{
  return self->_excludedProperties;
}

- (void)setExcludedProperties:(unint64_t)a3
{
  self->_excludedProperties = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->rightPeripheral, 0);
  objc_storeStrong((id *)&self->leftPeripheral, 0);
  objc_storeStrong((id *)&self->_rightBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_leftBatteryLowDate, 0);
  objc_storeStrong((id *)&self->_rightHardwareVersion, 0);
  objc_storeStrong((id *)&self->_leftHardwareVersion, 0);
  objc_storeStrong((id *)&self->_rightFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_leftFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_rightUUID, 0);
  objc_storeStrong((id *)&self->_leftUUID, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong(&self->_writeBlock, 0);
  objc_storeStrong((id *)&self->_rightFakePrograms, 0);

  objc_storeStrong((id *)&self->_leftFakePrograms, 0);
}

@end