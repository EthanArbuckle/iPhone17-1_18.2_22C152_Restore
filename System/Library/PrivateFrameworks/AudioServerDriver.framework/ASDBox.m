@interface ASDBox
+ (id)keyPathsForValuesAffectingAcquireable;
- (ASDBox)initWithBoxUID:(id)a3 withPlugin:(id)a4;
- (ASDBox)initWithPlugin:(id)a3;
- (BOOL)acquireBox:(BOOL)a3 fromHAL:(BOOL)a4;
- (BOOL)acquired;
- (BOOL)canChangeBoxName;
- (BOOL)canSetIdentify;
- (BOOL)changeBoxName:(id)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasAudio;
- (BOOL)hasMIDI;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)hasVideo;
- (BOOL)identify;
- (BOOL)isAcquirable;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)requiresAuthentication;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (BOOL)supportsIdentify;
- (NSArray)audioDevices;
- (NSArray)clockDevices;
- (NSString)boxName;
- (NSString)boxUID;
- (NSString)firmwareVersion;
- (NSString)manufacturerName;
- (NSString)modelName;
- (NSString)modelUID;
- (NSString)serialNumber;
- (OS_dispatch_queue)acquireQueue;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (int)acquisitionFailure;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)objectClass;
- (unsigned)transportType;
- (void)addAudioDevice:(id)a3;
- (void)addClockDevice:(id)a3;
- (void)addDevicesToPlugin;
- (void)removeAllAudioDevices;
- (void)removeAllClockDevices;
- (void)removeAudioDevice:(id)a3;
- (void)removeClockDevice:(id)a3;
- (void)removeDevicesFromPlugin;
- (void)setAcquirable:(BOOL)a3;
- (void)setAcquired:(BOOL)a3;
- (void)setAcquisitionFailure:(int)a3;
- (void)setBoxName:(id)a3;
- (void)setCanChangeBoxName:(BOOL)a3;
- (void)setCanSetIdentify:(BOOL)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHasAudio:(BOOL)a3;
- (void)setHasMIDI:(BOOL)a3;
- (void)setHasVideo:(BOOL)a3;
- (void)setIdentify:(BOOL)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setModelUID:(id)a3;
- (void)setRequiresAuthentication:(BOOL)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSupportsIdentify:(BOOL)a3;
- (void)systemHasPoweredOn;
- (void)systemWillSleep;
@end

@implementation ASDBox

- (ASDBox)initWithPlugin:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF4A0];
  v6 = [NSString stringWithUTF8String:"-[ASDBox initWithPlugin:]"];
  [v4 raise:v5, @"Do not call %@", v6 format];

  return 0;
}

- (ASDBox)initWithBoxUID:(id)a3 withPlugin:(id)a4
{
  id v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDBox;
  v8 = [(ASDObject *)&v24 initWithPlugin:a4];
  v9 = v8;
  if (v8)
  {
    p_boxUID = &v8->_boxUID;
    objc_storeStrong((id *)&v8->_boxUID, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    audioDevices = v9->_audioDevices;
    v9->_audioDevices = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    clockDevices = v9->_clockDevices;
    v9->_clockDevices = v13;

    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v16 = [v15 bundleIdentifier];
    id v17 = [NSString stringWithFormat:@"%@.box.%@.devices", v16, *p_boxUID];
    dispatch_queue_t v18 = dispatch_queue_create((const char *)[v17 UTF8String], 0);
    deviceQueue = v9->_deviceQueue;
    v9->_deviceQueue = (OS_dispatch_queue *)v18;

    id v20 = [NSString stringWithFormat:@"%@.box.%@.acquire", v16, *p_boxUID];
    dispatch_queue_t v21 = dispatch_queue_create((const char *)[v20 UTF8String], 0);
    acquireQueue = v9->_acquireQueue;
    v9->_acquireQueue = (OS_dispatch_queue *)v21;

    [(ASDObject *)v9 setupDiagnosticStateDumpHandlerWithTreeWalk:0];
  }

  return v9;
}

- (unsigned)objectClass
{
  return 1633841016;
}

- (unsigned)transportType
{
  return 0;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  BOOL result = 1;
  if ((int)a3->mSelector <= 1652060013)
  {
    if (mSelector > 1651013224)
    {
      if (mSelector > 1651861859)
      {
        if (mSelector == 1651861860) {
          return result;
        }
        int v6 = 1652060006;
      }
      else
      {
        if (mSelector == 1651013225) {
          return result;
        }
        int v6 = 1651536495;
      }
    }
    else if (mSelector > 1651007860)
    {
      if (mSelector == 1651007861) {
        return result;
      }
      int v6 = 1651010921;
    }
    else
    {
      if (mSelector == 1650682915) {
        return result;
      }
      int v6 = 1650751011;
    }
    goto LABEL_27;
  }
  if (mSelector <= 1819111267)
  {
    if (mSelector <= 1768187245)
    {
      if (mSelector == 1652060014) {
        return result;
      }
      int v6 = 1719105134;
      goto LABEL_27;
    }
    if (mSelector != 1768187246)
    {
      int v6 = 1819107691;
LABEL_27:
      if (mSelector != v6)
      {
        v7.receiver = self;
        v7.super_class = (Class)ASDBox;
        return -[ASDObject hasProperty:](&v7, sel_hasProperty_);
      }
      return result;
    }
    return [(ASDBox *)self supportsIdentify];
  }
  else
  {
    if (mSelector <= 1836411235)
    {
      if (mSelector == 1819111268) {
        return result;
      }
      int v6 = 1819173229;
      goto LABEL_27;
    }
    if (mSelector != 1836411236 && mSelector != 1936618861)
    {
      int v6 = 1953653102;
      goto LABEL_27;
    }
  }
  return result;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  unsigned int v6 = 8;
  if ((int)a3->mSelector <= 1652060013)
  {
    if (mSelector > 1651013224)
    {
      if (mSelector > 1651861859)
      {
        if (mSelector == 1651861860) {
          return v6;
        }
        int v7 = 1652060006;
      }
      else
      {
        if (mSelector == 1651013225) {
          return 4;
        }
        int v7 = 1651536495;
      }
    }
    else
    {
      if (mSelector <= 1651007860)
      {
        if (mSelector == 1650682915)
        {
          uint64_t v15 = 0;
          v16 = &v15;
          uint64_t v17 = 0x2020000000;
          uint64_t v18 = 0;
          deviceQueue = self->_deviceQueue;
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
          block[3] = &unk_264773158;
          block[4] = self;
          block[5] = &v15;
          v9 = block;
        }
        else
        {
          if (mSelector != 1650751011) {
            goto LABEL_35;
          }
          uint64_t v15 = 0;
          v16 = &v15;
          uint64_t v17 = 0x2020000000;
          uint64_t v18 = 0;
          deviceQueue = self->_deviceQueue;
          v14[0] = MEMORY[0x263EF8330];
          v14[1] = 3221225472;
          v14[2] = __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
          v14[3] = &unk_264773158;
          v14[4] = self;
          v14[5] = &v15;
          v9 = v14;
        }
        dispatch_sync(deviceQueue, v9);
        unsigned int v6 = 4 * *((_DWORD *)v16 + 6);
        _Block_object_dispose(&v15, 8);
        return v6;
      }
      if (mSelector == 1651007861) {
        return 4;
      }
      int v7 = 1651010921;
    }
LABEL_30:
    if (mSelector == v7) {
      return 4;
    }
LABEL_35:
    v12.receiver = self;
    v12.super_class = (Class)ASDBox;
    return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v12, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  if (mSelector <= 1819111267)
  {
    if (mSelector > 1768187245)
    {
      if (mSelector != 1768187246)
      {
        int v10 = 1819107691;
LABEL_26:
        if (mSelector != v10) {
          goto LABEL_35;
        }
        return v6;
      }
    }
    else if (mSelector != 1652060014)
    {
      int v10 = 1719105134;
      goto LABEL_26;
    }
    return 4;
  }
  if (mSelector <= 1836411235)
  {
    if (mSelector == 1819111268) {
      return v6;
    }
    int v10 = 1819173229;
    goto LABEL_26;
  }
  if (mSelector != 1836411236 && mSelector != 1936618861)
  {
    int v7 = 1953653102;
    goto LABEL_30;
  }
  return v6;
}

uint64_t __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 64) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __65__ASDBox_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  v8 = self;
  LOBYTE(self) = 0;
  if (a3 && a6 && a7)
  {
    signed int mSelector = a3->mSelector;
    if ((int)a3->mSelector > 1652060013)
    {
      if (mSelector > 1819111267)
      {
        if (mSelector <= 1836411235)
        {
          if (mSelector == 1819111268)
          {
            if (*a6 < 8) {
              goto LABEL_70;
            }
            uint64_t v15 = [(ASDBox *)v8 modelName];
          }
          else
          {
            if (mSelector != 1819173229) {
              goto LABEL_72;
            }
            if (*a6 < 8) {
              goto LABEL_70;
            }
            uint64_t v15 = [(ASDBox *)v8 boxName];
          }
        }
        else
        {
          switch(mSelector)
          {
            case 1836411236:
              if (*a6 < 8) {
                goto LABEL_70;
              }
              uint64_t v15 = [(ASDBox *)v8 modelUID];
              break;
            case 1936618861:
              if (*a6 < 8) {
                goto LABEL_70;
              }
              uint64_t v15 = [(ASDBox *)v8 serialNumber];
              break;
            case 1953653102:
              if (*a6 >= 4)
              {
                unsigned int v12 = [(ASDBox *)v8 transportType];
LABEL_61:
                *(_DWORD *)a7 = v12;
                goto LABEL_62;
              }
              goto LABEL_70;
            default:
              goto LABEL_72;
          }
        }
LABEL_65:
        *(void *)a7 = v15;

        if (*(void *)a7) {
          CFRetain(*(CFTypeRef *)a7);
        }
        unsigned int v19 = 8;
        goto LABEL_68;
      }
      if (mSelector > 1768187245)
      {
        if (mSelector == 1768187246)
        {
          if (*a6 >= 4)
          {
            LODWORD(self) = [(ASDBox *)v8 supportsIdentify];
            if (!self) {
              return (char)self;
            }
            unsigned int v12 = [(ASDBox *)v8 identify];
            goto LABEL_61;
          }
          goto LABEL_70;
        }
        if (mSelector != 1819107691) {
          goto LABEL_72;
        }
        if (*a6 < 8) {
          goto LABEL_70;
        }
        uint64_t v15 = [(ASDBox *)v8 manufacturerName];
        goto LABEL_65;
      }
      if (mSelector != 1652060014)
      {
        if (mSelector != 1719105134) {
          goto LABEL_72;
        }
        if (*a6 < 8) {
          goto LABEL_70;
        }
        uint64_t v15 = [(ASDBox *)v8 firmwareVersion];
        goto LABEL_65;
      }
      if (*a6 < 4) {
        goto LABEL_70;
      }
      v16 = [(ASDBox *)v8 acquireQueue];
      uint64_t v17 = v16;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
      block[3] = &unk_2647732E8;
      block[4] = v8;
      block[5] = a7;
      uint64_t v18 = block;
LABEL_45:
      dispatch_sync(v16, v18);

LABEL_62:
      unsigned int v19 = 4;
LABEL_68:
      *a6 = v19;
      goto LABEL_69;
    }
    if (mSelector > 1651013224)
    {
      if (mSelector > 1651861859)
      {
        if (mSelector == 1651861860)
        {
          if (*a6 < 8) {
            goto LABEL_70;
          }
          uint64_t v15 = [(ASDBox *)v8 boxUID];
          goto LABEL_65;
        }
        if (mSelector != 1652060006) {
          goto LABEL_72;
        }
        if (*a6 < 4) {
          goto LABEL_70;
        }
        v16 = [(ASDBox *)v8 acquireQueue];
        uint64_t v17 = v16;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
        v28[3] = &unk_2647732E8;
        v28[4] = v8;
        v28[5] = a7;
        uint64_t v18 = v28;
        goto LABEL_45;
      }
      if (mSelector == 1651013225)
      {
        if (*a6 >= 4)
        {
          unsigned int v12 = [(ASDBox *)v8 hasVideo];
          goto LABEL_61;
        }
        goto LABEL_70;
      }
      if (mSelector == 1651536495)
      {
        if (*a6 >= 4)
        {
          unsigned int v12 = [(ASDBox *)v8 requiresAuthentication];
          goto LABEL_61;
        }
LABEL_70:
        LOBYTE(self) = 0;
        return (char)self;
      }
    }
    else
    {
      if (mSelector <= 1651007860)
      {
        if (mSelector == 1650682915)
        {
          uint64_t v24 = 0;
          v25 = &v24;
          uint64_t v26 = 0x2020000000;
          uint64_t v27 = 0;
          deviceQueue = v8->_deviceQueue;
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4;
          v22[3] = &unk_264773180;
          v22[4] = v8;
          v22[5] = &v24;
          v22[6] = a6;
          v22[7] = a7;
          v14 = v22;
        }
        else
        {
          if (mSelector != 1650751011) {
            goto LABEL_72;
          }
          uint64_t v24 = 0;
          v25 = &v24;
          uint64_t v26 = 0x2020000000;
          uint64_t v27 = 0;
          deviceQueue = v8->_deviceQueue;
          v23[0] = MEMORY[0x263EF8330];
          v23[1] = 3221225472;
          v23[2] = __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
          v23[3] = &unk_264773180;
          v23[4] = v8;
          v23[5] = &v24;
          v23[6] = a6;
          v23[7] = a7;
          v14 = v23;
        }
        dispatch_sync(deviceQueue, v14);
        *a6 = 4 * *((_DWORD *)v25 + 6);
        _Block_object_dispose(&v24, 8);
LABEL_69:
        LOBYTE(self) = 1;
        return (char)self;
      }
      if (mSelector == 1651007861)
      {
        if (*a6 >= 4)
        {
          unsigned int v12 = [(ASDBox *)v8 hasAudio];
          goto LABEL_61;
        }
        goto LABEL_70;
      }
      if (mSelector == 1651010921)
      {
        if (*a6 >= 4)
        {
          unsigned int v12 = [(ASDBox *)v8 hasMIDI];
          goto LABEL_61;
        }
        goto LABEL_70;
      }
    }
LABEL_72:
    v21.receiver = v8;
    v21.super_class = (Class)ASDBox;
    LOBYTE(self) = -[ASDObject getProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v21, sel_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  return (char)self;
}

uint64_t __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) acquired];
  **(_DWORD **)(a1 + 40) = result;
  return result;
}

uint64_t __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) acquisitionFailure];
  **(_DWORD **)(a1 + 40) = result;
  return result;
}

void __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = **(unsigned int **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 64) count] <= v3 >> 2) {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 64) count];
  }
  else {
    unint64_t v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == v4) {
        break;
      }
      *(_DWORD *)(*(void *)(a1 + 56) + 4 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "objectID", (void)v10);
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

void __81__ASDBox_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_4(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = **(unsigned int **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 72) count] <= v3 >> 2) {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) count];
  }
  else {
    unint64_t v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == v4) {
        break;
      }
      *(_DWORD *)(*(void *)(a1 + 56) + 4 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9), "objectID", (void)v10);
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3
{
  if (a3)
  {
    AudioObjectPropertySelector mSelector = a3->mSelector;
    if (a3->mSelector == 1652060014)
    {
      LOBYTE(v5) = [(ASDBox *)self isAcquirable];
    }
    else if (mSelector == 1768187246)
    {
      LOBYTE(v5) = [(ASDBox *)self canSetIdentify];
    }
    else if (mSelector == 1819173229)
    {
      BOOL v5 = [(ASDBox *)self canChangeBoxName];
      if (v5)
      {
        LOBYTE(v5) = [(ASDBox *)self acquired];
      }
    }
    else
    {
      v7.receiver = self;
      v7.super_class = (Class)ASDBox;
      LOBYTE(v5) = -[ASDObject isPropertySettable:](&v7, sel_isPropertySettable_);
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if (a3->mSelector == 1652060014)
  {
    if (a6 == 4)
    {
      BOOL v13 = 1;
      -[ASDBox acquireBox:fromHAL:](self, "acquireBox:fromHAL:", *(_DWORD *)a7 != 0, 1, a5);
      return v13;
    }
    return 0;
  }
  if (mSelector == 1768187246)
  {
    if (a6 == 4
      && [(ASDBox *)self supportsIdentify]
      && [(ASDBox *)self canSetIdentify])
    {
      [(ASDBox *)self identifyBox:*(_DWORD *)a7 != 0];
      return 1;
    }
    return 0;
  }
  if (mSelector != 1819173229)
  {
    v14.receiver = self;
    v14.super_class = (Class)ASDBox;
    return -[ASDObject setProperty:withQualifierSize:qualifierData:dataSize:andData:forClient:](&v14, sel_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient_);
  }
  if (a6 != 8) {
    return 0;
  }
  uint64_t v11 = *(void *)a7;
  return -[ASDBox changeBoxName:](self, "changeBoxName:", v11, *(void *)&a4, a5);
}

- (void)addAudioDevice:(id)a3
{
  id v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__ASDBox_addAudioDevice___block_invoke;
  block[3] = &unk_2647731F8;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(deviceQueue, block);
  [v6 setOwner:self];
  char v10 = 0;
  __int16 v11 = 0;
  strcpy(v9, "#vdbbolg");
  objc_super v7 = [(ASDObject *)self plugin];
  [v7 changedProperty:v9 forObject:self];

  *(_DWORD *)uint64_t v9 = 1870098020;
  uint64_t v8 = [(ASDObject *)self plugin];
  [v8 changedProperty:v9 forObject:self];
}

uint64_t __25__ASDBox_addAudioDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObject:*(void *)(a1 + 40)];
}

- (void)addClockDevice:(id)a3
{
  id v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__ASDBox_addClockDevice___block_invoke;
  block[3] = &unk_2647731F8;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(deviceQueue, block);
  [v6 setOwner:self];
  char v10 = 0;
  __int16 v11 = 0;
  strcpy(v9, "#lcbbolg");
  objc_super v7 = [(ASDObject *)self plugin];
  [v7 changedProperty:v9 forObject:self];

  *(_DWORD *)uint64_t v9 = 1870098020;
  uint64_t v8 = [(ASDObject *)self plugin];
  [v8 changedProperty:v9 forObject:self];
}

uint64_t __25__ASDBox_addClockDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) addObject:*(void *)(a1 + 40)];
}

- (void)removeAudioDevice:(id)a3
{
  id v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_removeAudioDevice___block_invoke;
  block[3] = &unk_2647731F8;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(deviceQueue, block);
  char v10 = 0;
  __int16 v11 = 0;
  strcpy(v9, "#vdbbolg");
  objc_super v7 = [(ASDObject *)self plugin];
  [v7 changedProperty:v9 forObject:self];

  *(_DWORD *)uint64_t v9 = 1870098020;
  uint64_t v8 = [(ASDObject *)self plugin];
  [v8 changedProperty:v9 forObject:self];
}

uint64_t __28__ASDBox_removeAudioDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeObject:*(void *)(a1 + 40)];
}

- (void)removeClockDevice:(id)a3
{
  id v4 = a3;
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_removeClockDevice___block_invoke;
  block[3] = &unk_2647731F8;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(deviceQueue, block);
  char v10 = 0;
  __int16 v11 = 0;
  strcpy(v9, "#lcbbolg");
  objc_super v7 = [(ASDObject *)self plugin];
  [v7 changedProperty:v9 forObject:self];

  *(_DWORD *)uint64_t v9 = 1870098020;
  uint64_t v8 = [(ASDObject *)self plugin];
  [v8 changedProperty:v9 forObject:self];
}

uint64_t __28__ASDBox_removeClockDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeObject:*(void *)(a1 + 40)];
}

- (void)removeAllAudioDevices
{
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDBox_removeAllAudioDevices__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
  char v7 = 0;
  __int16 v8 = 0;
  strcpy(v6, "#vdbbolg");
  id v4 = [(ASDObject *)self plugin];
  [v4 changedProperty:v6 forObject:self];

  *(_DWORD *)id v6 = 1870098020;
  BOOL v5 = [(ASDObject *)self plugin];
  [v5 changedProperty:v6 forObject:self];
}

uint64_t __31__ASDBox_removeAllAudioDevices__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
}

- (void)removeAllClockDevices
{
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__ASDBox_removeAllClockDevices__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
  char v7 = 0;
  __int16 v8 = 0;
  strcpy(v6, "#lcbbolg");
  id v4 = [(ASDObject *)self plugin];
  [v4 changedProperty:v6 forObject:self];

  *(_DWORD *)id v6 = 1870098020;
  BOOL v5 = [(ASDObject *)self plugin];
  [v5 changedProperty:v6 forObject:self];
}

uint64_t __31__ASDBox_removeAllClockDevices__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

- (void)addDevicesToPlugin
{
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_addDevicesToPlugin__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __28__ASDBox_addDevicesToPlugin__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) plugin];
  [v2 addAudioDevices:*(void *)(*(void *)(a1 + 32) + 64)];

  id v3 = [*(id *)(a1 + 32) plugin];
  [v3 addClockDevices:*(void *)(*(void *)(a1 + 32) + 72)];
}

- (void)removeDevicesFromPlugin
{
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__ASDBox_removeDevicesFromPlugin__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __33__ASDBox_removeDevicesFromPlugin__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) plugin];
  [v2 removeAudioDevices:*(void *)(*(void *)(a1 + 32) + 64)];

  id v3 = [*(id *)(a1 + 32) plugin];
  [v3 removeClockDevices:*(void *)(*(void *)(a1 + 32) + 72)];
}

- (NSString)boxName
{
  return self->_boxName;
}

- (void)setBoxName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  boxName = self->_boxName;
  self->_boxName = v4;

  LODWORD(v8) = 0;
  id v6 = [(ASDObject *)self plugin];
  [v6 changedProperty:&v7 forObject:self];
}

- (BOOL)changeBoxName:(id)a3
{
  return 0;
}

- (void)setAcquired:(BOOL)a3
{
  if (self->_acquired != a3)
  {
    self->_acquired = a3;
    LODWORD(v6) = 0;
    id v4 = [(ASDObject *)self plugin];
    [v4 changedProperty:&v5 forObject:self];
  }
}

- (BOOL)acquired
{
  return self->_acquired;
}

- (void)setAcquisitionFailure:(int)a3
{
  if (self->_acquisitionFailure != a3)
  {
    self->_acquisitionFailure = a3;
    if (a3)
    {
      LODWORD(v6) = 0;
      id v4 = [(ASDObject *)self plugin];
      [v4 changedProperty:&v5 forObject:self];
    }
  }
}

- (int)acquisitionFailure
{
  return self->_acquisitionFailure;
}

- (void)setIdentify:(BOOL)a3
{
  if (self->_identify != a3)
  {
    self->_identify = a3;
    LODWORD(v6) = 0;
    id v4 = [(ASDObject *)self plugin];
    [v4 changedProperty:&v5 forObject:self];
  }
}

- (BOOL)identify
{
  return self->_identify;
}

- (BOOL)acquireBox:(BOOL)a3 fromHAL:(BOOL)a4
{
  return 0;
}

- (OS_dispatch_queue)acquireQueue
{
  return self->_acquireQueue;
}

- (NSArray)audioDevices
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  char v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  deviceQueue = self->_deviceQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __22__ASDBox_audioDevices__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(deviceQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

uint64_t __22__ASDBox_audioDevices__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x263EFF8C0] arrayWithArray:*(void *)(*(void *)(a1 + 32) + 64)];
  return MEMORY[0x270F9A758]();
}

- (void)systemWillSleep
{
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__ASDBox_systemWillSleep__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __25__ASDBox_systemWillSleep__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) systemWillSleep];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "systemWillSleep", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (void)systemHasPoweredOn
{
  deviceQueue = self->_deviceQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ASDBox_systemHasPoweredOn__block_invoke;
  block[3] = &unk_264773220;
  block[4] = self;
  dispatch_sync(deviceQueue, block);
}

void __28__ASDBox_systemHasPoweredOn__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 64);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7++) systemHasPoweredOn];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "systemHasPoweredOn", (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

+ (id)keyPathsForValuesAffectingAcquireable
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"acquirable", 0);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v78 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v75.receiver = self;
  v75.super_class = (Class)ASDBox;
  BOOL v66 = v4;
  uint64_t v7 = [(ASDObject *)&v75 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  v65 = [v6 stringByAppendingString:@"|        "];
  id v8 = [(ASDBox *)self boxName];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v8, "UTF8String")];

  id v9 = [(ASDBox *)self manufacturerName];
  [v7 appendFormat:@"%@|    Manufacturer: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  id v10 = [(ASDBox *)self modelName];
  [v7 appendFormat:@"%@|    Model Name: %s\n", v6, objc_msgSend(v10, "UTF8String")];

  id v11 = [(ASDBox *)self serialNumber];
  [v7 appendFormat:@"%@|    Serial Number: %s\n", v6, objc_msgSend(v11, "UTF8String")];

  id v12 = [(ASDBox *)self firmwareVersion];
  [v7 appendFormat:@"%@|    Firmware Version: %s\n", v6, objc_msgSend(v12, "UTF8String")];

  id v13 = [(ASDBox *)self boxUID];
  [v7 appendFormat:@"%@|    Box UID: %s\n", v6, objc_msgSend(v13, "UTF8String")];

  id v14 = [(ASDBox *)self modelUID];
  [v7 appendFormat:@"%@|    Model UID: %s\n", v6, objc_msgSend(v14, "UTF8String")];

  int v15 = [(ASDBox *)self transportType];
  LODWORD(v16) = v15 >> 24;
  if ((v15 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v16 = 32;
  }
  else {
    uint64_t v16 = v16;
  }
  LODWORD(v17) = v15 << 8 >> 24;
  if (((v15 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = v17;
  }
  LODWORD(v18) = (__int16)v15 >> 8;
  if (((v15 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = v18;
  }
  if (v15 << 24 == 2130706432 || v15 << 24 < 520093697) {
    uint64_t v20 = 32;
  }
  else {
    uint64_t v20 = (char)v15;
  }
  [v7 appendFormat:@"%@|    Transport Type: %c%c%c%c\n", v6, v16, v17, v18, v20];
  if ([(ASDBox *)self hasAudio]) {
    objc_super v21 = @"YES";
  }
  else {
    objc_super v21 = @"NO";
  }
  [v7 appendFormat:@"%@|    Has Audio: %@\n", v6, v21];
  if ([(ASDBox *)self hasVideo]) {
    v22 = @"YES";
  }
  else {
    v22 = @"NO";
  }
  [v7 appendFormat:@"%@|    Has Video: %@\n", v6, v22];
  if ([(ASDBox *)self hasMIDI]) {
    uint64_t v23 = @"YES";
  }
  else {
    uint64_t v23 = @"NO";
  }
  [v7 appendFormat:@"%@|    Has MIDI: %@\n", v6, v23];
  if ([(ASDBox *)self requiresAuthentication]) {
    uint64_t v24 = @"YES";
  }
  else {
    uint64_t v24 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Protected: %@\n", v6, v24];
  if ([(ASDBox *)self acquired]) {
    v25 = @"YES";
  }
  else {
    v25 = @"NO";
  }
  [v7 appendFormat:@"%@|    Acquired: %@\n", v6, v25];
  if ([(ASDBox *)self isAcquirable]) {
    uint64_t v26 = @"YES";
  }
  else {
    uint64_t v26 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Acquirable: %@\n", v6, v26];
  if ([(ASDBox *)self supportsIdentify]) {
    uint64_t v27 = @"YES";
  }
  else {
    uint64_t v27 = @"NO";
  }
  [v7 appendFormat:@"%@|    Supports Identify: %@\n", v6, v27];
  if ([(ASDBox *)self canSetIdentify]) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Identify Settable: %@\n", v6, v28];
  if ([(ASDBox *)self canChangeBoxName]) {
    v29 = @"YES";
  }
  else {
    v29 = @"NO";
  }
  [v7 appendFormat:@"%@|    Can Change Box Name: %@\n", v6, v29];
  int v30 = [(ASDBox *)self acquisitionFailure];
  LODWORD(v31) = v30 >> 24;
  if ((v30 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v31 = 32;
  }
  else {
    uint64_t v31 = v31;
  }
  LODWORD(v32) = v30 << 8 >> 24;
  if (((v30 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v32 = 32;
  }
  else {
    uint64_t v32 = v32;
  }
  LODWORD(v33) = (__int16)v30 >> 8;
  if (((v30 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v33 = 32;
  }
  else {
    uint64_t v33 = v33;
  }
  if (v30 << 24 == 2130706432 || v30 << 24 < 520093697) {
    uint64_t v35 = 32;
  }
  else {
    uint64_t v35 = (char)v30;
  }
  v36 = v7;
  v37 = v6;
  [v36 appendFormat:@"%@|    Acquisition Failure: %c%c%c%c\n", v6, v31, v32, v33, v35];
  v38 = [(ASDBox *)self audioDevices];
  v39 = v36;
  v64 = v38;
  if ([v38 count])
  {
    v62 = self;
    [v36 appendFormat:@"%@|    Device Objects:\n", v37];
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v40 = v38;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v71 objects:v77 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v72 != v44) {
            objc_enumerationMutation(v40);
          }
          v46 = *(void **)(*((void *)&v71 + 1) + 8 * i);
          if (v66)
          {
            id v47 = [*(id *)(*((void *)&v71 + 1) + 8 * i) diagnosticDescriptionWithIndent:v65 walkTree:1];
            [v36 appendString:v47];
          }
          else
          {
            uint64_t v48 = [v46 objectID];
            id v47 = [v46 deviceUID];
            uint64_t v60 = v48;
            v36 = v39;
            [v39 appendFormat:@"%@|        %u: %u (%s)\n", v37, v43 + i, v60, objc_msgSend(v47, "UTF8String")];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v71 objects:v77 count:16];
        uint64_t v43 = (v43 + i);
      }
      while (v42);
    }

    self = v62;
    v38 = v64;
  }
  v49 = [(ASDBox *)self clockDevices];
  if ([v49 count])
  {
    v63 = v49;
    [v36 appendFormat:@"%@|    Clock Device Objects:\n", v37];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v50 = v38;
    uint64_t v51 = [v50 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = 0;
      uint64_t v54 = *(void *)v68;
      do
      {
        for (uint64_t j = 0; j != v52; ++j)
        {
          if (*(void *)v68 != v54) {
            objc_enumerationMutation(v50);
          }
          v56 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          if (v66)
          {
            id v57 = [*(id *)(*((void *)&v67 + 1) + 8 * j) diagnosticDescriptionWithIndent:v65 walkTree:1];
            [v36 appendString:v57];
          }
          else
          {
            uint64_t v58 = [v56 objectID];
            id v57 = [v56 deviceUID];
            uint64_t v61 = v58;
            v36 = v39;
            [v39 appendFormat:@"%@|        %u: %u (%s)\n", v37, v53 + j, v61, objc_msgSend(v57, "UTF8String")];
          }
        }
        uint64_t v52 = [v50 countByEnumeratingWithState:&v67 objects:v76 count:16];
        uint64_t v53 = (v53 + j);
      }
      while (v52);
    }

    v49 = v63;
    v38 = v64;
  }

  return v36;
}

- (id)driverClassName
{
  return @"AudioBox";
}

- (NSString)boxUID
{
  return self->_boxUID;
}

- (NSString)modelUID
{
  return self->_modelUID;
}

- (void)setModelUID:(id)a3
{
}

- (NSString)manufacturerName
{
  return self->_manufacturerName;
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)firmwareVersion
{
  return self->_firmwareVersion;
}

- (void)setFirmwareVersion:(id)a3
{
}

- (BOOL)hasVideo
{
  return self->_hasVideo;
}

- (void)setHasVideo:(BOOL)a3
{
  self->_hasVideo = a3;
}

- (BOOL)hasAudio
{
  return self->_hasAudio;
}

- (void)setHasAudio:(BOOL)a3
{
  self->_hasAudio = a3;
}

- (BOOL)hasMIDI
{
  return self->_hasMIDI;
}

- (void)setHasMIDI:(BOOL)a3
{
  self->_hasMIDI = a3;
}

- (BOOL)requiresAuthentication
{
  return self->_requiresAuthentication;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  self->_requiresAuthentication = a3;
}

- (BOOL)supportsIdentify
{
  return self->_supportsIdentify;
}

- (void)setSupportsIdentify:(BOOL)a3
{
  self->_supportsIdentify = a3;
}

- (BOOL)canSetIdentify
{
  return self->_canSetIdentify;
}

- (void)setCanSetIdentify:(BOOL)a3
{
  self->_canSetIdentify = a3;
}

- (BOOL)isAcquirable
{
  return self->_acquirable;
}

- (void)setAcquirable:(BOOL)a3
{
  self->_acquirable = a3;
}

- (BOOL)canChangeBoxName
{
  return self->_canChangeBoxName;
}

- (void)setCanChangeBoxName:(BOOL)a3
{
  self->_canChangeBoxName = a3;
}

- (NSArray)clockDevices
{
  return &self->_clockDevices->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_modelUID, 0);
  objc_storeStrong((id *)&self->_boxUID, 0);
  objc_storeStrong((id *)&self->_acquireQueue, 0);
  objc_storeStrong((id *)&self->_boxName, 0);
  objc_storeStrong((id *)&self->_deviceQueue, 0);
  objc_storeStrong((id *)&self->_clockDevices, 0);
  objc_storeStrong((id *)&self->_audioDevices, 0);
}

@end