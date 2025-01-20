@interface ASDStream
- (ASDStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4;
- (ASDStream)initWithPlugin:(id)a3;
- (ASDStreamFormat)physicalFormat;
- (BOOL)changePhysicalFormat:(id)a3;
- (BOOL)deviceChangedToSamplingRate:(double)a3;
- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8;
- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isActive;
- (BOOL)isPhysicalFormatSettable;
- (BOOL)isPropertySettable:(const AudioObjectPropertyAddress *)a3;
- (BOOL)isTapStream;
- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8;
- (NSArray)physicalFormats;
- (NSString)streamName;
- (id)channelNumberForChannelIndex:(unsigned int)a3;
- (id)controls;
- (id)convertInputBlock;
- (id)convertInputBlockUnretainedPtr;
- (id)convertMixBlock;
- (id)convertMixBlockUnretainedPtr;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (id)mixOutputBlock;
- (id)mixOutputBlockUnretainedPtr;
- (id)processInputBlock;
- (id)processInputBlockUnretainedPtr;
- (id)processMixBlock;
- (id)processMixBlockUnretainedPtr;
- (id)processOutputBlock;
- (id)processOutputBlockUnretainedPtr;
- (id)readInputBlock;
- (id)readInputBlockUnretainedPtr;
- (id)readIsolatedInputBlock;
- (id)readIsolatedInputBlockUnretainedPtr;
- (id)writeMixBlock;
- (id)writeMixBlockUnretainedPtr;
- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5;
- (unsigned)direction;
- (unsigned)latency;
- (unsigned)startingChannel;
- (unsigned)terminalType;
- (void)addControl:(id)a3;
- (void)addPhysicalFormat:(id)a3;
- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4;
- (void)removeControl:(id)a3;
- (void)removePhysicalFormat:(id)a3;
- (void)setConvertInputBlock:(id)a3;
- (void)setConvertMixBlock:(id)a3;
- (void)setDirection:(unsigned int)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setIsTapStream:(BOOL)a3;
- (void)setLatency:(unsigned int)a3;
- (void)setMixOutputBlock:(id)a3;
- (void)setPhysicalFormat:(id)a3;
- (void)setPhysicalFormatSettable:(BOOL)a3;
- (void)setPhysicalFormats:(id)a3;
- (void)setProcessInputBlock:(id)a3;
- (void)setProcessMixBlock:(id)a3;
- (void)setProcessOutputBlock:(id)a3;
- (void)setReadInputBlock:(id)a3;
- (void)setReadIsolatedInputBlock:(id)a3;
- (void)setStartingChannel:(unsigned int)a3;
- (void)setStreamName:(id)a3;
- (void)setTerminalType:(unsigned int)a3;
- (void)setWriteMixBlock:(id)a3;
- (void)startStream;
- (void)stopStream;
@end

@implementation ASDStream

- (ASDStream)initWithPlugin:(id)a3
{
  return [(ASDStream *)self initWithDirection:1869968496 withPlugin:a3];
}

- (ASDStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  v26.receiver = self;
  v26.super_class = (Class)ASDStream;
  v5 = [(ASDObject *)&v26 initWithPlugin:a4];
  v6 = v5;
  if (v5)
  {
    v5->_direction = a3;
    v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = [v7 bundleIdentifier];
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    physicalFormats = v6->_physicalFormats;
    v6->_physicalFormats = v9;

    v11 = NSString;
    v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    id v14 = [v11 stringWithFormat:@"%@.device.%@.%p.physicalFormats", v8, v13, v6];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    physicalFormatQueue = v6->_physicalFormatQueue;
    v6->_physicalFormatQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    controls = v6->_controls;
    v6->_controls = v17;

    v19 = NSString;
    v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    id v22 = [v19 stringWithFormat:@"%@.device.%@.%p.controls", v8, v21, v6];
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    controlQueue = v6->_controlQueue;
    v6->_controlQueue = (OS_dispatch_queue *)v23;

    v6->_physicalFormatSettable = 1;
    v6->_isTapStream = 0;
  }
  return v6;
}

- (BOOL)hasProperty:(const AudioObjectPropertyAddress *)a3
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  if ((int)a3->mSelector <= 1935762291)
  {
    if (mSelector <= 1819569762)
    {
      if (mSelector == 1668575852 || mSelector == 1819173229) {
        return 1;
      }
      goto LABEL_32;
    }
    BOOL v4 = mSelector == 1819569763 || mSelector == 1885762592;
    int v5 = 1885762657;
  }
  else if (mSelector > 1936092512)
  {
    BOOL v4 = mSelector == 1936092513 || mSelector == 1952805485;
    int v5 = 1952542835;
  }
  else
  {
    BOOL v4 = mSelector == 1935762292 || mSelector == 1935894638;
    int v5 = 1935960434;
  }
  if (!v4 && mSelector != v5)
  {
LABEL_32:
    v9.receiver = self;
    v9.super_class = (Class)ASDStream;
    return -[ASDObject hasProperty:](&v9, sel_hasProperty_);
  }
  return a3->mScope == 1735159650 && a3->mElement == 0;
}

- (unsigned)dataSizeForProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 andQualifierData:(const void *)a5
{
  if (!a3) {
    return 0;
  }
  signed int mSelector = a3->mSelector;
  unsigned int v6 = 4;
  if ((int)a3->mSelector > 1935762291)
  {
    if (mSelector <= 1936092512)
    {
      if (mSelector != 1935762292 && mSelector != 1935894638 && mSelector != 1935960434) {
        goto LABEL_24;
      }
      return v6;
    }
    if (mSelector != 1936092513)
    {
      if (mSelector == 1952542835) {
        return v6;
      }
      int v7 = 1952805485;
      goto LABEL_23;
    }
    goto LABEL_28;
  }
  if (mSelector > 1870098019)
  {
    if (mSelector == 1870098020) {
      goto LABEL_25;
    }
    if (mSelector == 1885762592) {
      return 40;
    }
    if (mSelector != 1885762657) {
      goto LABEL_24;
    }
LABEL_28:
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    physicalFormatQueue = self->_physicalFormatQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke;
    block[3] = &unk_264773158;
    block[4] = self;
    block[5] = &v19;
    dispatch_sync(physicalFormatQueue, block);
    unsigned int v6 = 56 * *((_DWORD *)v20 + 6);
    goto LABEL_34;
  }
  if (mSelector == 1668575852)
  {
LABEL_25:
    if (a4)
    {
      if ((a4 & 3) != 0) {
        return 0;
      }
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = 0;
      controlQueue = self->_controlQueue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2;
      v16[3] = &unk_264773538;
      unsigned int v17 = a4 >> 2;
      v16[5] = &v19;
      v16[6] = a5;
      v16[4] = self;
      v12 = v16;
    }
    else
    {
      uint64_t v19 = 0;
      v20 = &v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = 0;
      controlQueue = self->_controlQueue;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3;
      v15[3] = &unk_264773158;
      v15[4] = self;
      v15[5] = &v19;
      v12 = v15;
    }
    dispatch_sync(controlQueue, v12);
    unsigned int v6 = 4 * *((_DWORD *)v20 + 6);
LABEL_34:
    _Block_object_dispose(&v19, 8);
    return v6;
  }
  if (mSelector == 1819173229) {
    return 8;
  }
  int v7 = 1819569763;
LABEL_23:
  if (mSelector != v7)
  {
LABEL_24:
    v14.receiver = self;
    v14.super_class = (Class)ASDStream;
    return -[ASDObject dataSizeForProperty:withQualifierSize:andQualifierData:](&v14, sel_dataSizeForProperty_withQualifierSize_andQualifierData_);
  }
  return v6;
}

uint64_t __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 72) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v8;
    while (1)
    {
      if (*(void *)v8 != v6) {
        objc_enumerationMutation(v3);
      }
      if (!--v5)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

void __68__ASDStream_dataSizeForProperty_withQualifierSize_andQualifierData___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x22A63EEF0]();
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += [*(id *)(*(void *)(a1 + 32) + 88) count];
}

- (BOOL)getProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int *)a6 andData:(void *)a7 forClient:(int)a8
{
  BOOL result = 0;
  if (a3 && a6 && a7)
  {
    uint64_t v13 = *(void *)&a4;
    signed int mSelector = a3->mSelector;
    if ((int)a3->mSelector > 1935762291)
    {
      if (mSelector <= 1936092512)
      {
        switch(mSelector)
        {
          case 1935762292:
            if (*a6 >= 4)
            {
              unsigned int v16 = [(ASDStream *)self isActive];
              goto LABEL_45;
            }
            break;
          case 1935894638:
            if (*a6 >= 4)
            {
              unsigned int v16 = [(ASDStream *)self startingChannel];
              goto LABEL_45;
            }
            break;
          case 1935960434:
            if (*a6 >= 4)
            {
              *(_DWORD *)a7 = [(ASDStream *)self direction] == 1768845428;
LABEL_46:
              unsigned int v22 = 4;
LABEL_47:
              *a6 = v22;
              return 1;
            }
            break;
          default:
            goto LABEL_51;
        }
        return 0;
      }
      if (mSelector != 1936092513)
      {
        if (mSelector != 1952542835)
        {
          if (mSelector == 1952805485)
          {
            if (*a6 >= 4)
            {
              unsigned int v16 = [(ASDStream *)self terminalType];
              goto LABEL_45;
            }
            return 0;
          }
          goto LABEL_51;
        }
        if (*a6 >= 4)
        {
          unsigned int v16 = [(ASDStream *)self isTapStream];
          goto LABEL_45;
        }
        return 0;
      }
    }
    else
    {
      if (mSelector <= 1870098019)
      {
        if (mSelector != 1668575852)
        {
          if (mSelector != 1819173229)
          {
            if (mSelector == 1819569763)
            {
              if (*a6 >= 4)
              {
                unsigned int v16 = [(ASDStream *)self latency];
LABEL_45:
                *(_DWORD *)a7 = v16;
                goto LABEL_46;
              }
              return 0;
            }
LABEL_51:
            v29.receiver = self;
            v29.super_class = (Class)ASDStream;
            return [(ASDObject *)&v29 getProperty:a3 withQualifierSize:*(void *)&a4 qualifierData:a5 dataSize:a6 andData:a7 forClient:*(void *)&a8];
          }
          if (*a6 >= 8)
          {
            uint64_t v21 = [(ASDStream *)self streamName];
            *(void *)a7 = v21;

            if (*(void *)a7) {
              CFRetain(*(CFTypeRef *)a7);
            }
            unsigned int v22 = 8;
            goto LABEL_47;
          }
          return 0;
        }
        goto LABEL_26;
      }
      if (mSelector == 1870098020)
      {
LABEL_26:
        if (a4)
        {
          if ((a4 & 3) != 0) {
            return 0;
          }
          *(void *)&long long v34 = 0;
          *((void *)&v34 + 1) = &v34;
          long long v35 = 0x2020000000uLL;
          unsigned int v17 = *a6;
          if (v17 >= [(ASDStream *)self dataSizeForProperty:a3 withQualifierSize:*(void *)&a4 andQualifierData:a5])unsigned int v18 = [(ASDStream *)self dataSizeForProperty:a3 withQualifierSize:v13 andQualifierData:a5]; {
          else
          }
            unsigned int v18 = *a6;
          uint64_t v26 = v18 >> 2;
          if (*(void *)(*((void *)&v34 + 1) + 24) != v26)
          {
            controlQueue = self->_controlQueue;
            v31[0] = MEMORY[0x263EF8330];
            v31[1] = 3221225472;
            v31[2] = __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2;
            v31[3] = &unk_264773660;
            unsigned int v32 = v13 >> 2;
            v31[4] = self;
            v31[5] = &v34;
            v31[6] = a5;
            v31[7] = v26;
            v31[8] = a7;
            dispatch_sync(controlQueue, v31);
            LODWORD(v26) = *(_DWORD *)(*((void *)&v34 + 1) + 24);
          }
          unsigned int v20 = 4 * v26;
        }
        else
        {
          *(void *)&long long v34 = 0;
          *((void *)&v34 + 1) = &v34;
          long long v35 = 0x2020000000uLL;
          if (*a6 < 4)
          {
            unsigned int v20 = 0;
          }
          else
          {
            v25 = self->_controlQueue;
            v30[0] = MEMORY[0x263EF8330];
            v30[1] = 3221225472;
            v30[2] = __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3;
            v30[3] = &unk_264773180;
            v30[4] = self;
            v30[5] = &v34;
            v30[6] = a6;
            v30[7] = a7;
            dispatch_sync(v25, v30);
            unsigned int v20 = 4 * *(_DWORD *)(*((void *)&v34 + 1) + 24);
          }
        }
LABEL_31:
        *a6 = v20;
        _Block_object_dispose(&v34, 8);
        return 1;
      }
      if (mSelector == 1885762592)
      {
        if (*a6 >= 0x28)
        {
          dispatch_queue_t v23 = [(ASDStream *)self physicalFormat];
          v24 = v23;
          if (v23)
          {
            [v23 audioStreamBasicDescription];
          }
          else
          {
            uint64_t v36 = 0;
            long long v34 = 0u;
            long long v35 = 0u;
          }
          long long v28 = v35;
          *(_OWORD *)a7 = v34;
          *((_OWORD *)a7 + 1) = v28;
          *((void *)a7 + 4) = v36;

          unsigned int v22 = 40;
          goto LABEL_47;
        }
        return 0;
      }
      if (mSelector != 1885762657) {
        goto LABEL_51;
      }
    }
    *(void *)&long long v34 = 0;
    *((void *)&v34 + 1) = &v34;
    long long v35 = 0x2020000000uLL;
    physicalFormatQueue = self->_physicalFormatQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
    block[3] = &unk_264773180;
    void block[6] = a6;
    block[7] = a7;
    block[4] = self;
    block[5] = &v34;
    dispatch_sync(physicalFormatQueue, block);
    unsigned int v20 = 56 * *(_DWORD *)(*((void *)&v34 + 1) + 24);
    goto LABEL_31;
  }
  return result;
}

void __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unsigned int v2 = **(_DWORD **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 72) count] <= v2 / 0x38uLL) {
    unint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 72) count];
  }
  else {
    unint64_t v3 = **(unsigned int **)(a1 + 48) / 0x38uLL;
  }
  uint64_t v4 = *(void *)(a1 + 56);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v10 == v3) {
        break;
      }
      v11 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      if (v11)
      {
        [v11 audioStreamRangedDescription];
      }
      else
      {
        uint64_t v16 = 0;
        long long v14 = 0u;
        long long v15 = 0u;
        long long v13 = 0u;
      }
      uint64_t v12 = v4 + 56 * v10;
      *(void *)(v12 + 48) = v16;
      *(_OWORD *)(v12 + 16) = v14;
      *(_OWORD *)(v12 + 32) = v15;
      *(_OWORD *)uint64_t v12 = v13;
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

void __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v8;
    while (1)
    {
      if (*(void *)v8 != v6) {
        objc_enumerationMutation(v3);
      }
      if (!--v5)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
        if (!v5) {
          break;
        }
      }
    }
  }
}

void __84__ASDStream_getProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unsigned int v2 = (void *)MEMORY[0x22A63EEF0]();
  unint64_t v3 = **(unsigned int **)(a1 + 48);
  if ([*(id *)(*(void *)(a1 + 32) + 88) count] <= v3 >> 2) {
    unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 88) count];
  }
  else {
    unint64_t v4 = (unint64_t)**(unsigned int **)(a1 + 48) >> 2;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(*(void *)(a1 + 32) + 88);
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
  if (!a3) {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if (a3->mSelector == 1952542835 || mSelector == 1935762292) {
    return 1;
  }
  if (mSelector == 1885762592)
  {
    return [(ASDStream *)self isPhysicalFormatSettable];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ASDStream;
    return -[ASDObject isPropertySettable:](&v6, sel_isPropertySettable_);
  }
}

- (BOOL)setProperty:(const AudioObjectPropertyAddress *)a3 withQualifierSize:(unsigned int)a4 qualifierData:(const void *)a5 dataSize:(unsigned int)a6 andData:(const void *)a7 forClient:(int)a8
{
  if (!a3) {
    return 0;
  }
  uint64_t v8 = *(void *)&a8;
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a4;
  if (!-[ASDStream hasProperty:](self, "hasProperty:")
    || ![(ASDStream *)self isPropertySettable:a3])
  {
    return 0;
  }
  AudioObjectPropertySelector mSelector = a3->mSelector;
  if (a3->mSelector != 1885762592)
  {
    if (mSelector == 1952542835)
    {
      if (v10 == 4)
      {
        [(ASDStream *)self setIsTapStream:*(_DWORD *)a7 != 0];
        return 1;
      }
    }
    else
    {
      if (mSelector != 1935762292)
      {
        v23.receiver = self;
        v23.super_class = (Class)ASDStream;
        return [(ASDObject *)&v23 setProperty:a3 withQualifierSize:v12 qualifierData:a5 dataSize:v10 andData:a7 forClient:v8];
      }
      if (v10 == 4)
      {
        [(ASDStream *)self setIsActive:*(_DWORD *)a7 != 0];
        return 1;
      }
    }
    return 0;
  }
  if (v10 != 40 || ![(ASDStream *)self isPhysicalFormatSettable]) {
    return 0;
  }
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v16 = [[ASDStreamFormat alloc] initWithAudioStreamBasicDescription:a7];
  long long v17 = [(ASDStream *)self physicalFormat];
  BOOL v18 = [(ASDStreamFormat *)v16 isEqual:v17];

  *((unsigned char *)v28 + 24) = v18;
  if (v18)
  {
    BOOL v19 = 1;
  }
  else
  {
    physicalFormatQueue = self->_physicalFormatQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__ASDStream_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke;
    block[3] = &unk_264773688;
    block[4] = self;
    uint64_t v26 = &v27;
    uint64_t v22 = v16;
    v25 = v22;
    dispatch_sync(physicalFormatQueue, block);

    if (*((unsigned char *)v28 + 24)) {
      BOOL v19 = [(ASDStream *)self changePhysicalFormat:v22];
    }
    else {
      BOOL v19 = 0;
    }
  }

  _Block_object_dispose(&v27, 8);
  return v19;
}

void __84__ASDStream_setProperty_withQualifierSize_qualifierData_dataSize_andData_forClient___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unsigned int v2 = (void *)MEMORY[0x22A63EEF0]();
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v9 != v6) {
        objc_enumerationMutation(v3);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "isCompatible:", *(void *)(*((void *)&v8 + 1) + 8 * v7), (void)v8);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)addPhysicalFormat:(id)a3
{
  id v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __31__ASDStream_addPhysicalFormat___block_invoke;
  long long v14 = &unk_2647731F8;
  uint64_t v15 = self;
  id v16 = v4;
  id v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  uint64_t v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v9 forObject:self];

  LODWORD(v10) = 0;
  long long v8 = [(ASDObject *)self propertyChangedDelegate];
  [v8 changedProperty:&v9 forObject:self];
}

void __31__ASDStream_addPhysicalFormat___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:*(void *)(*(void *)(a1 + 32) + 72)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;
  }
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 72);
  id v7 = (id)[v5 copy];
  [v6 addObject:v7];
}

- (void)removePhysicalFormat:(id)a3
{
  id v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __34__ASDStream_removePhysicalFormat___block_invoke;
  long long v14 = &unk_2647731F8;
  uint64_t v15 = self;
  id v16 = v4;
  id v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  id v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v9 forObject:self];

  LODWORD(v10) = 0;
  long long v8 = [(ASDObject *)self propertyChangedDelegate];
  [v8 changedProperty:&v9 forObject:self];
}

uint64_t __34__ASDStream_removePhysicalFormat___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:*(void *)(*(void *)(a1 + 32) + 72)];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 72);
    *(void *)(v3 + 72) = v2;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(*(void *)(a1 + 32) + 72);
  return [v6 removeObject:v5];
}

- (void)setPhysicalFormats:(id)a3
{
  id v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __32__ASDStream_setPhysicalFormats___block_invoke;
  long long v14 = &unk_2647731F8;
  uint64_t v15 = self;
  id v16 = v4;
  id v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  id v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v9 forObject:self];

  LODWORD(v10) = 0;
  long long v8 = [(ASDObject *)self propertyChangedDelegate];
  [v8 changedProperty:&v9 forObject:self];
}

uint64_t __32__ASDStream_setPhysicalFormats___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (NSArray)physicalFormats
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  uint64_t v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  physicalFormatQueue = self->_physicalFormatQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__ASDStream_physicalFormats__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(physicalFormatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __28__ASDStream_physicalFormats__block_invoke(uint64_t a1)
{
}

- (ASDStreamFormat)physicalFormat
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  uint64_t v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  physicalFormatQueue = self->_physicalFormatQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__ASDStream_physicalFormat__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(physicalFormatQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDStreamFormat *)v3;
}

void __27__ASDStream_physicalFormat__block_invoke(uint64_t a1)
{
}

- (void)setPhysicalFormat:(id)a3
{
  id v4 = a3;
  physicalFormatQueue = self->_physicalFormatQueue;
  uint64_t block = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __31__ASDStream_setPhysicalFormat___block_invoke;
  long long v14 = &unk_2647731F8;
  uint64_t v15 = self;
  id v16 = v4;
  id v6 = v4;
  dispatch_sync(physicalFormatQueue, &block);
  LODWORD(v10) = 0;
  id v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v9 forObject:self];

  LODWORD(v10) = 0;
  uint64_t v8 = [(ASDObject *)self propertyChangedDelegate];
  [v8 changedProperty:&v9 forObject:self];
}

uint64_t __31__ASDStream_setPhysicalFormat___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = [*(id *)(a1 + 40) copy];
  return MEMORY[0x270F9A758]();
}

- (void)addControl:(id)a3
{
  id v4 = a3;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__ASDStream_addControl___block_invoke;
  block[3] = &unk_2647731F8;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(controlQueue, block);
  [v6 setOwner:self];
  char v10 = 0;
  __int16 v11 = 0;
  strcpy(v9, "lrtcbolg");
  id v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:v9 forObject:self];

  *(_DWORD *)uint64_t v9 = 1870098020;
  uint64_t v8 = [(ASDObject *)self propertyChangedDelegate];
  [v8 changedProperty:v9 forObject:self];
}

uint64_t __24__ASDStream_addControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) addObject:*(void *)(a1 + 40)];
}

- (void)removeControl:(id)a3
{
  id v4 = a3;
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__ASDStream_removeControl___block_invoke;
  block[3] = &unk_2647731F8;
  block[4] = self;
  id v13 = v4;
  id v6 = v4;
  dispatch_sync(controlQueue, block);
  char v10 = 0;
  __int16 v11 = 0;
  strcpy(v9, "lrtcbolg");
  id v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:v9 forObject:self];

  *(_DWORD *)uint64_t v9 = 1870098020;
  uint64_t v8 = [(ASDObject *)self propertyChangedDelegate];
  [v8 changedProperty:v9 forObject:self];
}

uint64_t __27__ASDStream_removeControl___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) removeObject:*(void *)(a1 + 40)];
}

- (id)controls
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  char v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  controlQueue = self->_controlQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__ASDStream_controls__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(controlQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __21__ASDStream_controls__block_invoke(uint64_t a1)
{
}

- (void)setIsActive:(BOOL)a3
{
  self->_isActive = a3;
  LODWORD(v6) = 0;
  id v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  streamName = self->_streamName;
  self->_streamName = v4;

  LODWORD(v8) = 0;
  uint64_t v6 = [(ASDObject *)self propertyChangedDelegate];
  [v6 changedProperty:&v7 forObject:self];
}

- (void)setLatency:(unsigned int)a3
{
  self->_latency = a3;
  LODWORD(v6) = 0;
  id v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (void)setIsTapStream:(BOOL)a3
{
  self->_isTapStream = a3;
  LODWORD(v6) = 0;
  id v4 = [(ASDObject *)self propertyChangedDelegate];
  [v4 changedProperty:&v5 forObject:self];
}

- (BOOL)isTapStream
{
  return self->_isTapStream;
}

- (unsigned)latency
{
  return self->_latency;
}

- (void)startStream
{
  id v3 = [(ASDStream *)self readInputBlock];
  id v4 = (void *)[v3 copy];
  id readInputBlock = self->_readInputBlock;
  self->_id readInputBlock = v4;

  self->_readInputBlockUnretained = self->_readInputBlock;
  uint64_t v6 = [(ASDStream *)self convertInputBlock];
  uint64_t v7 = (void *)[v6 copy];
  id convertInputBlock = self->_convertInputBlock;
  self->_id convertInputBlock = v7;

  self->_convertInputBlockUnretained = self->_convertInputBlock;
  uint64_t v9 = [(ASDStream *)self processInputBlock];
  char v10 = (void *)[v9 copy];
  id processInputBlock = self->_processInputBlock;
  self->_id processInputBlock = v10;

  self->_processInputBlockUnretained = self->_processInputBlock;
  uint64_t v12 = [(ASDStream *)self processOutputBlock];
  id v13 = (void *)[v12 copy];
  id processOutputBlock = self->_processOutputBlock;
  self->_id processOutputBlock = v13;

  self->_processOutputBlockUnretained = self->_processOutputBlock;
  uint64_t v15 = [(ASDStream *)self mixOutputBlock];
  id v16 = (void *)[v15 copy];
  id mixOutputBlock = self->_mixOutputBlock;
  self->_id mixOutputBlock = v16;

  self->_mixOutputBlockUnretained = self->_mixOutputBlock;
  BOOL v18 = [(ASDStream *)self processMixBlock];
  BOOL v19 = (void *)[v18 copy];
  id processMixBlock = self->_processMixBlock;
  self->_id processMixBlock = v19;

  self->_processMixBlockUnretained = self->_processMixBlock;
  uint64_t v21 = [(ASDStream *)self convertMixBlock];
  uint64_t v22 = (void *)[v21 copy];
  id convertMixBlock = self->_convertMixBlock;
  self->_id convertMixBlock = v22;

  self->_convertMixBlockUnretained = self->_convertMixBlock;
  v24 = [(ASDStream *)self writeMixBlock];
  v25 = (void *)[v24 copy];
  id writeMixBlock = self->_writeMixBlock;
  self->_id writeMixBlock = v25;

  self->_writeMixBlockUnretained = self->_writeMixBlock;
  uint64_t v27 = [(ASDStream *)self readIsolatedInputBlock];
  long long v28 = (void *)[v27 copy];
  id readIsolatedInputBlock = self->_readIsolatedInputBlock;
  self->_id readIsolatedInputBlock = v28;

  self->_readIsolatedInputBlockUnretained = self->_readIsolatedInputBlock;
}

- (void)stopStream
{
  id readInputBlock = self->_readInputBlock;
  self->_id readInputBlock = 0;

  self->_readInputBlockUnretained = 0;
  id convertInputBlock = self->_convertInputBlock;
  self->_id convertInputBlock = 0;

  self->_convertInputBlockUnretained = 0;
  id processInputBlock = self->_processInputBlock;
  self->_id processInputBlock = 0;

  self->_processInputBlockUnretained = 0;
  id processOutputBlock = self->_processOutputBlock;
  self->_id processOutputBlock = 0;

  self->_processOutputBlockUnretained = 0;
  id mixOutputBlock = self->_mixOutputBlock;
  self->_id mixOutputBlock = 0;

  self->_mixOutputBlockUnretained = 0;
  id processMixBlock = self->_processMixBlock;
  self->_id processMixBlock = 0;

  self->_processMixBlockUnretained = 0;
  id convertMixBlock = self->_convertMixBlock;
  self->_id convertMixBlock = 0;

  self->_convertMixBlockUnretained = 0;
  id writeMixBlock = self->_writeMixBlock;
  self->_id writeMixBlock = 0;

  self->_writeMixBlockUnretained = 0;
  id readIsolatedInputBlock = self->_readIsolatedInputBlock;
  self->_id readIsolatedInputBlock = 0;

  self->_readIsolatedInputBlockUnretained = 0;
}

- (BOOL)deviceChangedToSamplingRate:(double)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__8;
  physicalFormatQueue = self->_physicalFormatQueue;
  uint64_t v12 = __Block_byref_object_dispose__8;
  id v13 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__ASDStream_deviceChangedToSamplingRate___block_invoke;
  block[3] = &unk_264773338;
  *(double *)&void block[6] = a3;
  block[4] = self;
  void block[5] = &v8;
  dispatch_sync(physicalFormatQueue, block);
  if (v9[5])
  {
    -[ASDStream setPhysicalFormat:](self, "setPhysicalFormat:");
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Device changed to a sample rate that the stream does not have a physical format supporting it", v6, 2u);
  }
  _Block_object_dispose(&v8, 8);

  return 1;
}

void __41__ASDStream_deviceChangedToSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A63EEF0]();
  id v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 64) copy];
  [v3 setSampleRate:*(double *)(a1 + 48)];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isCompatible:*(void *)(*((void *)&v30 + 1) + 8 * i)])
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v3);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = *(id *)(*(void *)(a1 + 32) + 72);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v27;
      while (2)
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v26 + 1) + 8 * j);
          double v15 = *(double *)(a1 + 48);
          objc_msgSend(v14, "minimumSampleRate", (void)v26);
          if (vabdd_f64(v15, v16) >= 0.001)
          {
            double v17 = *(double *)(a1 + 48);
            [v14 maximumSampleRate];
            if (vabdd_f64(v17, v18) >= 0.001)
            {
              double v19 = *(double *)(a1 + 48);
              [v14 minimumSampleRate];
              if (v19 <= v20) {
                continue;
              }
              double v21 = *(double *)(a1 + 48);
              [v14 maximumSampleRate];
              if (v21 >= v22) {
                continue;
              }
            }
          }
          uint64_t v23 = [v14 copy];
          uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
          v25 = *(void **)(v24 + 40);
          *(void *)(v24 + 40) = v23;

          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMaximumSampleRate:*(double *)(a1 + 48)];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setMinimumSampleRate:*(double *)(a1 + 48)];
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSampleRate:*(double *)(a1 + 48)];
          goto LABEL_25;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_25:
  }
}

- (BOOL)changePhysicalFormat:(id)a3
{
  return 0;
}

- (id)channelNumberForChannelIndex:(unsigned int)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%u", -[ASDStream startingChannel](self, "startingChannel") + a3);
}

- (void)preferredChannelDescription:(AudioChannelDescription *)a3 forChannelIndex:(unsigned int)a4
{
  a3->mChannelLabel = -1;
  *(void *)&a3->mCoordinates[1] = 0;
  *(void *)&a3->mChannelFlags = 0;
}

- (void)setReadInputBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id readInputBlock = self->_readInputBlock;
  self->_id readInputBlock = v4;

  self->_readInputBlockUnretained = self->_readInputBlock;
}

- (void)setConvertInputBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id convertInputBlock = self->_convertInputBlock;
  self->_id convertInputBlock = v4;

  self->_convertInputBlockUnretained = self->_convertInputBlock;
}

- (void)setProcessInputBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id processInputBlock = self->_processInputBlock;
  self->_id processInputBlock = v4;

  self->_processInputBlockUnretained = self->_processInputBlock;
}

- (void)setProcessOutputBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id processOutputBlock = self->_processOutputBlock;
  self->_id processOutputBlock = v4;

  self->_processOutputBlockUnretained = self->_processOutputBlock;
}

- (void)setMixOutputBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id mixOutputBlock = self->_mixOutputBlock;
  self->_id mixOutputBlock = v4;

  self->_mixOutputBlockUnretained = self->_mixOutputBlock;
}

- (void)setProcessMixBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id processMixBlock = self->_processMixBlock;
  self->_id processMixBlock = v4;

  self->_processMixBlockUnretained = self->_processMixBlock;
}

- (void)setConvertMixBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id convertMixBlock = self->_convertMixBlock;
  self->_id convertMixBlock = v4;

  self->_convertMixBlockUnretained = self->_convertMixBlock;
}

- (void)setWriteMixBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id writeMixBlock = self->_writeMixBlock;
  self->_id writeMixBlock = v4;

  self->_writeMixBlockUnretained = self->_writeMixBlock;
}

- (void)setReadIsolatedInputBlock:(id)a3
{
  id v4 = (void *)[a3 copy];
  id readIsolatedInputBlock = self->_readIsolatedInputBlock;
  self->_id readIsolatedInputBlock = v4;

  self->_readIsolatedInputBlockUnretained = self->_readIsolatedInputBlock;
}

- (id)readInputBlockUnretainedPtr
{
  return &self->_readInputBlockUnretained;
}

- (id)convertInputBlockUnretainedPtr
{
  return &self->_convertInputBlockUnretained;
}

- (id)processInputBlockUnretainedPtr
{
  return &self->_processInputBlockUnretained;
}

- (id)processOutputBlockUnretainedPtr
{
  return &self->_processOutputBlockUnretained;
}

- (id)mixOutputBlockUnretainedPtr
{
  return &self->_mixOutputBlockUnretained;
}

- (id)processMixBlockUnretainedPtr
{
  return &self->_processMixBlockUnretained;
}

- (id)convertMixBlockUnretainedPtr
{
  return &self->_convertMixBlockUnretained;
}

- (id)writeMixBlockUnretainedPtr
{
  return &self->_writeMixBlockUnretained;
}

- (id)readIsolatedInputBlockUnretainedPtr
{
  return &self->_readIsolatedInputBlockUnretained;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)ASDStream;
  BOOL v53 = v4;
  uint64_t v7 = [(ASDObject *)&v63 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  uint64_t v8 = [v6 stringByAppendingString:@"|        "];
  id v9 = [(ASDStream *)self streamName];
  [v7 appendFormat:@"%@|    Name: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  if ([(ASDStream *)self isActive]) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Active: %@\n", v6, v10];
  unsigned int v11 = [(ASDStream *)self direction];
  uint64_t v12 = @"Output";
  if (v11 == 1768845428) {
    uint64_t v12 = @"Input";
  }
  [v7 appendFormat:@"%@|    Direction: %@\n", v6, v12];
  if ([(ASDStream *)self isTapStream]) {
    id v13 = @"YES";
  }
  else {
    id v13 = @"NO";
  }
  [v7 appendFormat:@"%@|    Is Tap Stream: %@\n", v6, v13];
  uint64_t v14 = [(ASDStream *)self terminalType];
  LODWORD(v15) = BYTE3(v14);
  uint64_t v16 = 32;
  if ((v14 - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v15 = 32;
  }
  else {
    uint64_t v15 = v15;
  }
  if (((v14 << 8) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v17 = 32;
  }
  else {
    uint64_t v17 = BYTE2(v14);
  }
  if (((v14 << 16) - 0x20000000) >> 24 >= 0x5F) {
    uint64_t v18 = 32;
  }
  else {
    uint64_t v18 = BYTE1(v14);
  }
  if (v14 << 24 == 2130706432 || v14 << 24 < 520093697) {
    uint64_t v20 = 32;
  }
  else {
    uint64_t v20 = v14;
  }
  [v7 appendFormat:@"%@|    Terminal Type: %c%c%c%c (0x%08x)\n", v6, v15, v17, v18, v20, v14];
  [v7 appendFormat:@"%@|    Starting Channel: %u\n", v6, -[ASDStream startingChannel](self, "startingChannel")];
  [v7 appendFormat:@"%@|    Latency: %u\n", v6, -[ASDStream latency](self, "latency")];
  double v21 = [(ASDStream *)self physicalFormat];
  [v7 appendFormat:@"%@|    Physical Format\n", v6];
  [v21 sampleRate];
  [v7 appendFormat:@"%@|        Sample Rate: %f\n", v6, v22];
  if ((int)[v21 formatID] >= 0x20000000)
  {
    if ((int)[v21 formatID] > 2130706431) {
      uint64_t v16 = 32;
    }
    else {
      uint64_t v16 = ((int)[v21 formatID] >> 24);
    }
  }
  if ((int)([v21 formatID] << 8) < 0x20000000
    || (int)([v21 formatID] << 8) > 2130706431)
  {
    uint64_t v23 = 32;
  }
  else
  {
    uint64_t v23 = ((int)([v21 formatID] << 8) >> 24);
  }
  if ((int)([v21 formatID] << 16) < 0x20000000
    || (int)([v21 formatID] << 16) > 2130706431)
  {
    uint64_t v24 = 32;
  }
  else
  {
    uint64_t v24 = ((__int16)[v21 formatID] >> 8);
  }
  if ((int)([v21 formatID] << 24) < 520093697
    || [v21 formatID] == 127)
  {
    uint64_t v25 = 32;
  }
  else
  {
    uint64_t v25 = (char)[v21 formatID];
  }
  [v7 appendFormat:@"%@|        Format ID: %c%c%c%c\n", v6, v16, v23, v24, v25];
  [v7 appendFormat:@"%@|        Format Flags: 0x%08x\n", v6, objc_msgSend(v21, "formatFlags")];
  [v7 appendFormat:@"%@|        Bytes Per Packet: %u\n", v6, objc_msgSend(v21, "bytesPerFrame")];
  [v7 appendFormat:@"%@|        Frames Per Packet: %u\n", v6, objc_msgSend(v21, "framesPerPacket")];
  [v7 appendFormat:@"%@|        Bytes Per Frame: %u\n", v6, objc_msgSend(v21, "bytesPerFrame")];
  [v7 appendFormat:@"%@|        Channels Per Frame: %u\n", v6, objc_msgSend(v21, "channelsPerFrame")];
  v49 = v21;
  [v7 appendFormat:@"%@|        Bits Per Channel: %u\n", v6, objc_msgSend(v21, "bitsPerChannel")];
  v51 = v6;
  [v7 appendFormat:@"%@|    Available Physical Format\n", v6];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v50 = self;
  obuint64_t j = [(ASDStream *)self physicalFormats];
  uint64_t v26 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = 0;
    uint64_t v54 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v60 != v54) {
          objc_enumerationMutation(obj);
        }
        long long v30 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        [v7 appendFormat:@"%@%u: Physical Format\n", v8, v28 + i];
        [v30 sampleRate];
        [v7 appendFormat:@"%@    Sample Rate: %f\n", v8, v31];
        if ((int)[v30 formatID] < 0x20000000 || (int)objc_msgSend(v30, "formatID") > 2130706431) {
          uint64_t v32 = 32;
        }
        else {
          uint64_t v32 = ((int)[v30 formatID] >> 24);
        }
        if ((int)([v30 formatID] << 8) < 0x20000000
          || (int)([v30 formatID] << 8) > 2130706431)
        {
          uint64_t v33 = 32;
        }
        else
        {
          uint64_t v33 = ((int)([v30 formatID] << 8) >> 24);
        }
        if ((int)([v30 formatID] << 16) < 0x20000000
          || (int)([v30 formatID] << 16) > 2130706431)
        {
          uint64_t v34 = 32;
        }
        else
        {
          uint64_t v34 = ((__int16)[v30 formatID] >> 8);
        }
        if ((int)([v30 formatID] << 24) < 520093697
          || [v30 formatID] == 127)
        {
          uint64_t v35 = 32;
        }
        else
        {
          uint64_t v35 = (char)[v30 formatID];
        }
        [v7 appendFormat:@"%@    Format ID: %c%c%c%c\n", v8, v32, v33, v34, v35];
        [v7 appendFormat:@"%@    Format Flags: 0x%08x\n", v8, objc_msgSend(v30, "formatFlags")];
        [v7 appendFormat:@"%@    Bytes Per Packet: %u\n", v8, objc_msgSend(v30, "bytesPerFrame")];
        [v7 appendFormat:@"%@    Frames Per Packet: %u\n", v8, objc_msgSend(v30, "framesPerPacket")];
        [v7 appendFormat:@"%@    Bytes Per Frame: %u\n", v8, objc_msgSend(v30, "bytesPerFrame")];
        [v7 appendFormat:@"%@    Channels Per Frame: %u\n", v8, objc_msgSend(v30, "channelsPerFrame")];
        [v7 appendFormat:@"%@    Bits Per Channel: %u\n", v8, objc_msgSend(v30, "bitsPerChannel")];
        [v30 minimumSampleRate];
        [v7 appendFormat:@"%@    Minimum Sample Rate: %f\n", v8, v36];
        [v30 maximumSampleRate];
        [v7 appendFormat:@"%@    Maximum Sample Rate: %f\n", v8, v37];
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v59 objects:v65 count:16];
      uint64_t v28 = (v28 + i);
    }
    while (v27);
  }

  [v7 appendFormat:@"%@|    Controls:\n", v51];
  v38 = [(ASDStream *)v50 controls];
  uint64_t v39 = [v38 count];

  if (v39)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v40 = [(ASDStream *)v50 controls];
    uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v64 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = 0;
      uint64_t v44 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v42; ++j)
        {
          if (*(void *)v56 != v44) {
            objc_enumerationMutation(v40);
          }
          v46 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          if (v53)
          {
            v47 = [v46 diagnosticDescriptionWithIndent:v8 walkTree:1];
            [v7 appendString:v47];
          }
          else
          {
            [v7 appendFormat:@"%@|        %u: %u\n", v51, v43 + j, objc_msgSend(v46, "objectID")];
          }
        }
        uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v64 count:16];
        uint64_t v43 = (v43 + j);
      }
      while (v42);
    }
  }
  return v7;
}

- (id)driverClassName
{
  return @"AudioStream";
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (unsigned)direction
{
  return self->_direction;
}

- (void)setDirection:(unsigned int)a3
{
  self->_direction = a3;
}

- (unsigned)startingChannel
{
  return self->_startingChannel;
}

- (void)setStartingChannel:(unsigned int)a3
{
  self->_startingChannel = a3;
}

- (BOOL)isPhysicalFormatSettable
{
  return self->_physicalFormatSettable;
}

- (void)setPhysicalFormatSettable:(BOOL)a3
{
  self->_physicalFormatSettable = a3;
}

- (unsigned)terminalType
{
  return self->_terminalType;
}

- (void)setTerminalType:(unsigned int)a3
{
  self->_terminalType = a3;
}

- (id)readInputBlock
{
  return self->_readInputBlock;
}

- (id)convertInputBlock
{
  return self->_convertInputBlock;
}

- (id)processInputBlock
{
  return self->_processInputBlock;
}

- (id)processOutputBlock
{
  return self->_processOutputBlock;
}

- (id)mixOutputBlock
{
  return self->_mixOutputBlock;
}

- (id)processMixBlock
{
  return self->_processMixBlock;
}

- (id)convertMixBlock
{
  return self->_convertMixBlock;
}

- (id)writeMixBlock
{
  return self->_writeMixBlock;
}

- (id)readIsolatedInputBlock
{
  return self->_readIsolatedInputBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_readIsolatedInputBlock, 0);
  objc_storeStrong(&self->_writeMixBlock, 0);
  objc_storeStrong(&self->_convertMixBlock, 0);
  objc_storeStrong(&self->_processMixBlock, 0);
  objc_storeStrong(&self->_mixOutputBlock, 0);
  objc_storeStrong(&self->_processOutputBlock, 0);
  objc_storeStrong(&self->_processInputBlock, 0);
  objc_storeStrong(&self->_convertInputBlock, 0);
  objc_storeStrong(&self->_readInputBlock, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_physicalFormatQueue, 0);
  objc_storeStrong((id *)&self->_physicalFormats, 0);
  objc_storeStrong((id *)&self->_physicalFormat, 0);
}

@end