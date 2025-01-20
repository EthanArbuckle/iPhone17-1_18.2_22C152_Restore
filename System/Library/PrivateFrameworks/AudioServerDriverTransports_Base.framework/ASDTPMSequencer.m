@interface ASDTPMSequencer
+ (ASDTPMSequencer)pmSequencerWithPMDeviceConfig:(id)a3 withParent:(id)a4;
+ (int64_t)compare:(id)a3 with:(id)a4 forPowerUp:(BOOL)a5;
- (ASDTAudioDevice)parentDevice;
- (ASDTPMProtocol)parent;
- (ASDTPMSequencer)initWithPMDeviceConfig:(id)a3 withParent:(id)a4;
- (BOOL)addPMDevicesWithConfig:(id)a3;
- (BOOL)doAddPMDeviceWithConfig:(id)a3;
- (NSArray)pmDevicesPowerDown;
- (NSArray)pmDevicesPowerUp;
- (NSMutableArray)mutablePMDevicesPowerDown;
- (NSMutableArray)mutablePMDevicesPowerUp;
- (OS_dispatch_queue)pmConcurrentQueue;
- (OS_dispatch_queue)pmSerialQueue;
- (id)pmDeviceWithName:(id)a3;
- (int)doExecuteSequenceToState:(int)a3;
- (int)executeSequenceFromState:(int)a3 toState:(int)a4;
- (int)executeSequenceToState:(int)a3;
- (void)setMutablePMDevicesPowerDown:(id)a3;
- (void)setMutablePMDevicesPowerUp:(id)a3;
- (void)setParent:(id)a3;
- (void)setParentDevice:(id)a3;
- (void)setPmConcurrentQueue:(id)a3;
- (void)setPmDevicesPowerDown:(id)a3;
- (void)setPmDevicesPowerUp:(id)a3;
- (void)setPmSerialQueue:(id)a3;
- (void)sortPMDevices;
@end

@implementation ASDTPMSequencer

+ (ASDTPMSequencer)pmSequencerWithPMDeviceConfig:(id)a3 withParent:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [[ASDTPMSequencer alloc] initWithPMDeviceConfig:v5 withParent:v6];

  return v7;
}

- (ASDTPMSequencer)initWithPMDeviceConfig:(id)a3 withParent:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    goto LABEL_19;
  }
  v41.receiver = self;
  v41.super_class = (Class)ASDTPMSequencer;
  v8 = [(ASDTPMSequencer *)&v41 init];
  self = v8;
  if (v8)
  {
    [(ASDTPMSequencer *)v8 setParent:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ASDTPMSequencer *)self setParentDevice:v7];
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    attr = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    v10 = NSString;
    v11 = [(ASDTPMSequencer *)self parent];
    v12 = [v11 name];
    v13 = [v10 stringWithFormat:@"%s.%@.serial", "com.apple.AudioServerDriverTransports", v12];

    id v14 = v13;
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], attr);
    [(ASDTPMSequencer *)self setPmSerialQueue:v15];

    v16 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INTERACTIVE, 0);
    v17 = NSString;
    v18 = [(ASDTPMSequencer *)self parent];
    v19 = [v18 name];
    v20 = [v17 stringWithFormat:@"%s.%@.concurrent", "com.apple.AudioServerDriverTransports", v19];

    id v21 = v20;
    dispatch_queue_t v22 = dispatch_queue_create((const char *)[v21 UTF8String], v16);
    [(ASDTPMSequencer *)self setPmConcurrentQueue:v22];

    v23 = [(ASDTPMSequencer *)self pmSerialQueue];
    if (!v23
      || ([(ASDTPMSequencer *)self pmConcurrentQueue],
          v24 = objc_claimAutoreleasedReturnValue(),
          BOOL v25 = v24 == 0,
          v24,
          v23,
          v25))
    {
      v28 = ASDTBaseLogType();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v35 = [(ASDTPMSequencer *)self parent];
        v36 = [v35 name];
        [(ASDTPMSequencer *)v36 initWithPMDeviceConfig:v28 withParent:v35];
      }
    }
    else
    {
      v26 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
      [(ASDTPMSequencer *)self setMutablePMDevicesPowerUp:v26];

      v27 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
      [(ASDTPMSequencer *)self setMutablePMDevicesPowerDown:v27];

      v28 = +[ASDTPMDeviceProxy forPMDevice:v7];
      v29 = [(ASDTPMSequencer *)self mutablePMDevicesPowerUp];
      [v29 addObject:v28];

      v30 = [(ASDTPMSequencer *)self mutablePMDevicesPowerDown];
      [v30 addObject:v28];

      if ([(ASDTPMSequencer *)self addPMDevicesWithConfig:v6])
      {
        v31 = [(ASDTPMSequencer *)self pmDevicesPowerUp];
        if ([v31 count])
        {
          v32 = [(ASDTPMSequencer *)self pmDevicesPowerDown];
          BOOL v33 = [v32 count] == 0;

          if (!v33)
          {

            goto LABEL_11;
          }
        }
        else
        {
        }
        v37 = ASDTBaseLogType();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = [v7 name];
          -[ASDTPMSequencer initWithPMDeviceConfig:withParent:](v38, buf, v37);
        }
      }
    }

LABEL_19:
    v34 = 0;
    goto LABEL_20;
  }
LABEL_11:
  self = self;
  v34 = self;
LABEL_20:

  return v34;
}

- (BOOL)doAddPMDeviceWithConfig:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[ASDTPMDevice pmDeviceWithConfig:v4 forSequencer:self];
  if (v5)
  {
    id v6 = [(ASDTPMSequencer *)self mutablePMDevicesPowerUp];
    [v6 addObject:v5];

    id v7 = [(ASDTPMSequencer *)self mutablePMDevicesPowerDown];
    [v7 addObject:v5];
  }
  else
  {
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [(ASDTPMSequencer *)self parent];
      v11 = [v10 name];
      int v12 = 138412546;
      v13 = v11;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_2489BC000, v8, OS_LOG_TYPE_ERROR, "%@: Error creating PM device for dictionary: %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v5 != 0;
}

- (void)sortPMDevices
{
  id v5 = [(ASDTPMSequencer *)self mutablePMDevicesPowerUp];
  [v5 sortUsingComparator:&__block_literal_global_5];

  id v6 = [(ASDTPMSequencer *)self mutablePMDevicesPowerDown];
  [v6 sortUsingComparator:&__block_literal_global_12];

  id v7 = [(ASDTPMSequencer *)self mutablePMDevicesPowerUp];
  v3 = (void *)[v7 copy];
  [(ASDTPMSequencer *)self setPmDevicesPowerUp:v3];

  id v8 = [(ASDTPMSequencer *)self mutablePMDevicesPowerDown];
  id v4 = (void *)[v8 copy];
  [(ASDTPMSequencer *)self setPmDevicesPowerDown:v4];
}

int64_t __32__ASDTPMSequencer_sortPMDevices__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[ASDTPMSequencer compare:a2 with:a3 forPowerUp:1];
}

int64_t __32__ASDTPMSequencer_sortPMDevices__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[ASDTPMSequencer compare:a2 with:a3 forPowerUp:0];
}

- (BOOL)addPMDevicesWithConfig:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!-[ASDTPMSequencer doAddPMDeviceWithConfig:](self, "doAddPMDeviceWithConfig:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
        {

          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [(ASDTPMSequencer *)self sortPMDevices];
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

+ (int64_t)compare:(id)a3 with:(id)a4 forPowerUp:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v5)
  {
    unsigned int v9 = [v7 pmOrderPowerUp];
    unsigned int v10 = [v8 pmOrderPowerUp];
  }
  else
  {
    unsigned int v10 = [v7 pmOrderPowerDown];
    unsigned int v9 = [v8 pmOrderPowerDown];
  }
  if (v9 >= v10) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = -1;
  }
  if (v9 > v10) {
    int64_t v12 = 1;
  }
  else {
    int64_t v12 = v11;
  }

  return v12;
}

- (int)executeSequenceFromState:(int)a3 toState:(int)a4
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v6 = asdtPowerTransitionForStateChange(a3, a4);
  if (v6)
  {
    uint64_t v7 = v6;
    int v59 = asdtPowerTransitionUpwards(v6);
    if (v59) {
      [(ASDTPMSequencer *)self pmDevicesPowerUp];
    }
    else {
    id v8 = [(ASDTPMSequencer *)self pmDevicesPowerDown];
    }
    v61 = [v8 objectEnumerator];

    long long v66 = 0uLL;
    uint64_t v67 = 0x10000;
    ASDTTime::machAbsoluteTime(v10, (uint64_t)&v64);
    int v12 = 0;
    long long v13 = 0;
    if (v7 - 32 >= 0x5F) {
      int v14 = 32;
    }
    else {
      int v14 = v7;
    }
    int v15 = BYTE1(v7);
    if (BYTE1(v7) - 32 >= 0x5F) {
      int v15 = 32;
    }
    int v57 = v15;
    int v58 = v14;
    int v16 = BYTE2(v7);
    if (BYTE2(v7) - 32 >= 0x5F) {
      int v16 = 32;
    }
    int v56 = v16;
    if ((v7 - 0x20000000) >> 24 >= 0x5F) {
      unsigned int v17 = 32;
    }
    else {
      unsigned int v17 = BYTE3(v7);
    }
    unsigned int v55 = v17;
    int v18 = a4;
    if (a4 - 32 >= 0x5F) {
      int v18 = 32;
    }
    int v54 = v18;
    int v19 = BYTE1(a4);
    if (BYTE1(a4) - 32 >= 0x5F) {
      int v19 = 32;
    }
    int v53 = v19;
    int v20 = BYTE2(a4);
    if (BYTE2(a4) - 32 >= 0x5F) {
      int v20 = 32;
    }
    int v52 = v20;
    if ((a4 - 0x20000000) >> 24 >= 0x5F) {
      unsigned int v21 = 32;
    }
    else {
      unsigned int v21 = HIBYTE(a4);
    }
    unsigned int v51 = v21;
    int v22 = a3;
    if (a3 - 32 >= 0x5F) {
      int v22 = 32;
    }
    int v50 = v22;
    int v23 = BYTE1(a3);
    if (BYTE1(a3) - 32 >= 0x5F) {
      int v23 = 32;
    }
    int v49 = v23;
    int v24 = BYTE2(a3);
    if (BYTE2(a3) - 32 >= 0x5F) {
      int v24 = 32;
    }
    int v48 = v24;
    if ((a3 - 0x20000000) >> 24 >= 0x5F) {
      unsigned int v25 = 32;
    }
    else {
      unsigned int v25 = HIBYTE(a3);
    }
    unsigned int v47 = v25;
    *(void *)&long long v11 = 138414850;
    long long v45 = v11;
    do
    {
      int v46 = v12;
      v26 = v13;
      while (1)
      {
        long long v13 = objc_msgSend(v61, "nextObject", v45);

        if (!v13)
        {
          LODWORD(v9) = v46;
          goto LABEL_59;
        }
        long long v66 = v64;
        uint64_t v67 = v65;
        unsigned int v9 = (ASDTTime *)[v13 asdtPowerStateChange:v7];
        ASDTTime::machAbsoluteTime(v9, (uint64_t)buf);
        long long v64 = *(_OWORD *)buf;
        uint64_t v65 = *(void *)&buf[16];
        if (!v9)
        {
          v26 = v13;
          if (([v13 asdtHandlesPowerTransition:v7] & 1) == 0) {
            continue;
          }
        }
        v27 = ASDTBaseLogType();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = [(ASDTPMSequencer *)self parent];
          v29 = [v28 name];
          v30 = [v13 name];
          if (v59) {
            int v31 = [v13 pmOrderPowerUp];
          }
          else {
            int v31 = [v13 pmOrderPowerDown];
          }
          int v34 = v31;
          long long v62 = v64;
          uint64_t v63 = v65;
          ASDTTime::operator-=((_anonymous_namespace_ **)&v62, (uint64_t *)&v66, v32, v33);
          *(_DWORD *)buf = 138416898;
          *(void *)&buf[4] = v29;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v30;
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)v69 = v34;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)v70 = v47;
          *(_WORD *)&v70[4] = 1024;
          *(_DWORD *)v71 = v48;
          *(_WORD *)&v71[4] = 1024;
          *(_DWORD *)&v71[6] = v49;
          __int16 v72 = 1024;
          int v73 = v50;
          __int16 v74 = 1024;
          unsigned int v75 = v51;
          __int16 v76 = 1024;
          int v77 = v52;
          __int16 v78 = 1024;
          int v79 = v53;
          __int16 v80 = 1024;
          int v81 = v54;
          __int16 v82 = 1024;
          unsigned int v83 = v55;
          __int16 v84 = 1024;
          int v85 = v56;
          __int16 v86 = 1024;
          int v87 = v57;
          __int16 v88 = 1024;
          int v89 = v58;
          __int16 v90 = 2048;
          uint64_t v91 = v62;
          __int16 v92 = 2048;
          uint64_t v93 = v64;
          __int16 v94 = 2048;
          uint64_t v95 = *((void *)&v64 + 1);
          __int16 v96 = 1024;
          int v97 = (unsigned __int16)v65;
          _os_log_impl(&dword_2489BC000, v27, OS_LOG_TYPE_DEFAULT, "%@: %@: Order: %u, State change '%c%c%c%c' to '%c%c%c%c' (transition '%c%c%c%c'): took %lluns, finished at %llu (%llu.%hu)", buf, 0x88u);
        }
        v26 = v13;
        if (v9) {
          break;
        }
      }
      v35 = ASDTBaseLogType();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = [(ASDTPMSequencer *)self parent];
        v37 = [v36 name];
        uint64_t v38 = [v13 name];
        v39 = (void *)v38;
        *(_DWORD *)buf = v45;
        *(void *)&buf[4] = v37;
        if ((v9 - 0x20000000) >> 24 >= 0x5F) {
          unsigned int v40 = 32;
        }
        else {
          unsigned int v40 = v9 >> 24;
        }
        *(_WORD *)&buf[12] = 1024;
        int v41 = BYTE2(v9);
        *(_DWORD *)&buf[14] = v55;
        if (BYTE2(v9) - 32 >= 0x5F) {
          int v41 = 32;
        }
        *(_WORD *)&buf[18] = 1024;
        int v42 = BYTE1(v9);
        *(_DWORD *)&buf[20] = v56;
        if (BYTE1(v9) - 32 >= 0x5F) {
          int v42 = 32;
        }
        *(_WORD *)v69 = 1024;
        int v43 = v9;
        *(_DWORD *)&v69[2] = v57;
        if (v9 - 32 >= 0x5F) {
          int v43 = 32;
        }
        *(_WORD *)v70 = 1024;
        *(_DWORD *)&v70[2] = v58;
        *(_WORD *)v71 = 2112;
        *(void *)&v71[2] = v38;
        __int16 v72 = 1024;
        int v73 = (int)v9;
        __int16 v74 = 1024;
        unsigned int v75 = v40;
        __int16 v76 = 1024;
        int v77 = v41;
        __int16 v78 = 1024;
        int v79 = v42;
        __int16 v80 = 1024;
        int v81 = v43;
        _os_log_error_impl(&dword_2489BC000, v35, OS_LOG_TYPE_ERROR, "%@: PM state transition '%c%c%c%c' failed for %@: %x '%c%c%c%c'", buf, 0x4Cu);
      }
      int v12 = (int)v9;
    }
    while (!v59);
LABEL_59:
  }
  else
  {
    LODWORD(v9) = 0;
  }
  return (int)v9;
}

- (int)doExecuteSequenceToState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [(ASDTPMSequencer *)self parent];
  uint64_t v6 = [v5 powerState];

  uint64_t PowerState = asdtNextPowerState(v6, v3);
  id v8 = [(ASDTPMSequencer *)self parent];
  id v9 = [v8 name];
  v19[0] = 0;
  strlcpy((char *)v19, (const char *)[v9 UTF8String], 9uLL);
  v19[1] = 0;

  kdebug_trace();
  char v10 = 3;
  uint64_t v11 = v6;
  while (v10)
  {
    if (v11 == v3)
    {
      uint64_t v11 = PowerState;
      int v12 = 1920234105;
      uint64_t PowerState = v3;
      if (v6) {
        goto LABEL_5;
      }
    }
    else
    {
      while (1)
      {
        uint64_t v15 = v11;
        uint64_t v11 = PowerState;
        int v16 = [(ASDTPMSequencer *)self executeSequenceFromState:v15 toState:PowerState];
        if (v16) {
          break;
        }
        uint64_t PowerState = asdtNextPowerState(PowerState, v3);
        if (v11 == v3)
        {
          int v12 = 0;
          goto LABEL_14;
        }
      }
      int v12 = v16;
      if (v6)
      {
LABEL_5:
        uint64_t v13 = 1768189029;
        if (PowerState != 1768189029)
        {
          do
          {
            uint64_t v14 = asdtNextPowerState(PowerState, 1768189029);
            [(ASDTPMSequencer *)self executeSequenceFromState:PowerState toState:v14];
            uint64_t PowerState = v14;
          }
          while (v14 != 1768189029);
          uint64_t v13 = 1768189029;
          uint64_t v11 = 1768189029;
        }
        goto LABEL_13;
      }
    }
    uint64_t v13 = PowerState;
LABEL_13:
    --v10;
    uint64_t PowerState = v11;
    uint64_t v11 = v13;
    if (v12 != 1920234105) {
      goto LABEL_14;
    }
  }
  int v12 = 1920234105;
LABEL_14:
  unsigned int v17 = [(ASDTPMSequencer *)self parent];
  [v17 powerState];
  kdebug_trace();

  return v12;
}

- (int)executeSequenceToState:(int)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  BOOL v5 = [(ASDTPMSequencer *)self pmSerialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASDTPMSequencer_executeSequenceToState___block_invoke;
  block[3] = &unk_265244000;
  block[4] = self;
  block[5] = &v10;
  int v9 = a3;
  dispatch_sync(v5, block);

  int v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __42__ASDTPMSequencer_executeSequenceToState___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) doExecuteSequenceToState:*(unsigned int *)(a1 + 48)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)pmDeviceWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(ASDTPMSequencer *)self pmDevicesPowerUp];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (ASDTAudioDevice)parentDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentDevice);
  return (ASDTAudioDevice *)WeakRetained;
}

- (void)setParentDevice:(id)a3
{
}

- (NSArray)pmDevicesPowerUp
{
  return self->_pmDevicesPowerUp;
}

- (void)setPmDevicesPowerUp:(id)a3
{
}

- (NSArray)pmDevicesPowerDown
{
  return self->_pmDevicesPowerDown;
}

- (void)setPmDevicesPowerDown:(id)a3
{
}

- (OS_dispatch_queue)pmSerialQueue
{
  return self->_pmSerialQueue;
}

- (void)setPmSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)pmConcurrentQueue
{
  return self->_pmConcurrentQueue;
}

- (void)setPmConcurrentQueue:(id)a3
{
}

- (ASDTPMProtocol)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (ASDTPMProtocol *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)mutablePMDevicesPowerUp
{
  return self->_mutablePMDevicesPowerUp;
}

- (void)setMutablePMDevicesPowerUp:(id)a3
{
}

- (NSMutableArray)mutablePMDevicesPowerDown
{
  return self->_mutablePMDevicesPowerDown;
}

- (void)setMutablePMDevicesPowerDown:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePMDevicesPowerDown, 0);
  objc_storeStrong((id *)&self->_mutablePMDevicesPowerUp, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_pmConcurrentQueue, 0);
  objc_storeStrong((id *)&self->_pmSerialQueue, 0);
  objc_storeStrong((id *)&self->_pmDevicesPowerDown, 0);
  objc_storeStrong((id *)&self->_pmDevicesPowerUp, 0);
  objc_destroyWeak((id *)&self->_parentDevice);
}

- (void)initWithPMDeviceConfig:(os_log_t)log withParent:(void *)a4 .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: Failed creating dispatch queue.", buf, 0xCu);
}

- (void)initWithPMDeviceConfig:(os_log_t)log withParent:.cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "%@: PM sequencer memory allocation error.", buf, 0xCu);
}

@end