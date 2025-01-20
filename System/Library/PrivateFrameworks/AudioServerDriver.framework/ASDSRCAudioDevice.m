@interface ASDSRCAudioDevice
- (ASDAudioDevice)underlyingDevice;
- (ASDSRCAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 plugin:(id)a5;
- (BOOL)canBeDefaultDevice;
- (BOOL)canBeDefaultInputDevice;
- (BOOL)canBeDefaultOutputDevice;
- (BOOL)canBeDefaultSystemDevice;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)clockIsStable;
- (BOOL)isHidden;
- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4;
- (double)sampleRateRatio;
- (double)samplingRate;
- (id)deviceName;
- (id)getZeroTimestampBlock;
- (id)manufacturerName;
- (id)modelName;
- (id)modelUID;
- (id)samplingRates;
- (id)willDoReadInputBlock;
- (id)willDoWriteMixBlock;
- (int)performStopIO;
- (int)startIOForClient:(unsigned int)a3;
- (int)stopIOForClient:(unsigned int)a3;
- (unsigned)clockAlgorithm;
- (unsigned)clockDomain;
- (unsigned)inputSafetyOffset;
- (unsigned)outputSafetyOffset;
- (unsigned)timestampPeriod;
- (unsigned)transportType;
- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4;
- (void)setDeviceName:(id)a3;
- (void)setSamplingRate:(double)a3;
- (void)setSamplingRates:(id)a3;
@end

@implementation ASDSRCAudioDevice

- (ASDSRCAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 plugin:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v48.receiver = self;
  v48.super_class = (Class)ASDSRCAudioDevice;
  v10 = [(ASDAudioDevice *)&v48 initWithDeviceUID:v8 withPlugin:a5];
  if (v10)
  {
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 bundleIdentifier];
    v13 = (id *)(v10 + 520);
    objc_storeStrong((id *)v10 + 65, a4);
    id v14 = [NSString stringWithFormat:@"%@.%@.sampleRate", v12, v8];
    dispatch_queue_t v15 = dispatch_queue_create((const char *)[v14 UTF8String], 0);
    v16 = (void *)*((void *)v10 + 60);
    *((void *)v10 + 60) = v15;

    *(_OWORD *)(v10 + 488) = 0u;
    *(_OWORD *)(v10 + 504) = 0u;
    if (v9)
    {
      v17 = (void *)MEMORY[0x263EFF980];
      v18 = [*v13 samplingRates];
      v19 = [v17 arrayWithArray:v18];
      [v10 setSamplingRates:v19];

      [*v13 samplingRate];
      objc_msgSend(v10, "setSamplingRate:");
      [v9 setConfigurationChangeDelegate:v10];
      [v9 setPropertyChangedDelegate:v10];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v20 = [v9 inputStreams];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v44 objects:v51 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v45 != v23) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v44 + 1) + 8 * i) setPropertyChangedDelegate:v10];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v44 objects:v51 count:16];
        }
        while (v22);
      }

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      v25 = [v9 outputStreams];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v41 != v28) {
              objc_enumerationMutation(v25);
            }
            [*(id *)(*((void *)&v40 + 1) + 8 * j) setPropertyChangedDelegate:v10];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v27);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v30 = [v9 controls];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v49 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v37;
        do
        {
          for (uint64_t k = 0; k != v32; ++k)
          {
            if (*(void *)v37 != v33) {
              objc_enumerationMutation(v30);
            }
            [*(id *)(*((void *)&v36 + 1) + 8 * k) setPropertyChangedDelegate:v10];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v36 objects:v49 count:16];
        }
        while (v32);
      }
    }
    else
    {
      v30 = v10;
      v10 = 0;
    }
  }
  return (ASDSRCAudioDevice *)v10;
}

- (int)startIOForClient:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v6 = -[ASDAudioDevice startIOForClient:](self->_underlyingDevice, "startIOForClient:");
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6 >> 24;
      if ((v6 - 0x20000000) >> 24 >= 0x5F) {
        int v7 = 32;
      }
      int v8 = v6 << 8 >> 24;
      if (((v6 << 8) - 0x20000000) >> 24 >= 0x5F) {
        int v8 = 32;
      }
      if (((v6 << 16) - 0x20000000) >> 24 >= 0x5F) {
        int v9 = 32;
      }
      else {
        int v9 = (__int16)v6 >> 8;
      }
      *(_DWORD *)buf = 67109888;
      int v16 = v7;
      __int16 v17 = 1024;
      int v18 = v8;
      BOOL v10 = v6 << 24 == 2130706432 || v6 << 24 < 520093697;
      __int16 v19 = 1024;
      int v20 = v9;
      if (v10) {
        int v11 = 32;
      }
      else {
        int v11 = (char)v6;
      }
      __int16 v21 = 1024;
      int v22 = v11;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Underlying device failed to start with error: %c%c%c%c", buf, 0x1Au);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASDSRCAudioDevice;
    if ([(ASDAudioDevice *)&v14 startIOForClient:v3])
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"ASDSRCAudioDevice.m" lineNumber:93 description:@"ASDAudioDevice startIOForClient must succeed"];
    }
  }
  return v6;
}

- (int)stopIOForClient:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)ASDSRCAudioDevice;
  int v6 = -[ASDAudioDevice stopIOForClient:](&v14, sel_stopIOForClient_);
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v6 >> 24;
      if ((v6 - 0x20000000) >> 24 >= 0x5F) {
        int v7 = 32;
      }
      int v8 = v6 << 8 >> 24;
      if (((v6 << 8) - 0x20000000) >> 24 >= 0x5F) {
        int v8 = 32;
      }
      if (((v6 << 16) - 0x20000000) >> 24 >= 0x5F) {
        int v9 = 32;
      }
      else {
        int v9 = (__int16)v6 >> 8;
      }
      *(_DWORD *)buf = 67109888;
      int v16 = v7;
      __int16 v17 = 1024;
      int v18 = v8;
      BOOL v10 = v6 << 24 == 2130706432 || v6 << 24 < 520093697;
      __int16 v19 = 1024;
      int v20 = v9;
      if (v10) {
        int v11 = 32;
      }
      else {
        int v11 = (char)v6;
      }
      __int16 v21 = 1024;
      int v22 = v11;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASDAudioDevice failed to stop with error: %c%c%c%c", buf, 0x1Au);
    }
  }
  else if ([(ASDAudioDevice *)self->_underlyingDevice stopIOForClient:v3])
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"ASDSRCAudioDevice.m" lineNumber:111 description:@"Underlying stopIOForClient must succeed"];
  }
  return v6;
}

- (id)deviceName
{
  return [(ASDAudioDevice *)self->_underlyingDevice deviceName];
}

- (void)setDeviceName:(id)a3
{
}

- (id)manufacturerName
{
  return [(ASDAudioDevice *)self->_underlyingDevice manufacturerName];
}

- (id)modelName
{
  return [(ASDAudioDevice *)self->_underlyingDevice modelName];
}

- (id)modelUID
{
  return [(ASDAudioDevice *)self->_underlyingDevice modelUID];
}

- (void)setSamplingRate:(double)a3
{
  sampleRateQueue = self->_sampleRateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__ASDSRCAudioDevice_setSamplingRate___block_invoke;
  block[3] = &unk_2647732E8;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_sync(sampleRateQueue, block);
  LODWORD(v7) = 0;
  v5 = [(ASDObject *)self propertyChangedDelegate];
  [v5 changedProperty:&v6 forObject:self];
}

void __37__ASDSRCAudioDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x22A63EEF0]();
  [*(id *)(*(void *)(a1 + 32) + 520) samplingRate];
  if (v3 != *(double *)(a1 + 40))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v4 = [*(id *)(*(void *)(a1 + 32) + 520) samplingRates];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v41 != v7) {
            objc_enumerationMutation(v4);
          }
          double v9 = *(double *)(a1 + 40);
          [*(id *)(*((void *)&v40 + 1) + 8 * i) doubleValue];
          if (vabdd_f64(v9, v10) < 0.001)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              int v11 = [*(id *)(a1 + 32) underlyingDevice];
              v12 = [v11 deviceUID];
              uint64_t v13 = *(void *)(a1 + 40);
              *(_DWORD *)buf = 138412546;
              long long v47 = v12;
              __int16 v48 = 2048;
              uint64_t v49 = v13;
              _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Setting %@ sample rate to %f", buf, 0x16u);
            }
            double v14 = *(double *)(a1 + 40);
            dispatch_queue_t v15 = [*(id *)(a1 + 32) underlyingDevice];
            [v15 setSamplingRate:v14];

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  *(void *)(*(void *)(a1 + 32) + 464) = *(void *)(a1 + 40);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v16 = [*(id *)(a1 + 32) inputStreams];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * j) deviceChangedToSamplingRate:*(double *)(a1 + 40)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v18);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  __int16 v21 = objc_msgSend(*(id *)(a1 + 32), "outputStreams", 0);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v32 + 1) + 8 * k) deviceChangedToSamplingRate:*(double *)(a1 + 40)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v23);
  }

  double v26 = (double)[*(id *)(*(void *)(a1 + 32) + 520) inputLatency];
  [*(id *)(a1 + 32) sampleRateRatio];
  LODWORD(v28) = vcvtpd_u64_f64(v27 * v26);
  [*(id *)(a1 + 32) setInputLatency:v28];
  double v29 = (double)[*(id *)(*(void *)(a1 + 32) + 520) outputLatency];
  [*(id *)(a1 + 32) sampleRateRatio];
  LODWORD(v31) = vcvtpd_u64_f64(v30 * v29);
  [*(id *)(a1 + 32) setOutputLatency:v31];
}

- (double)samplingRate
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__ASDSRCAudioDevice_samplingRate__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __33__ASDSRCAudioDevice_samplingRate__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 464);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)changeSamplingRate:(double)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    id v7 = objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 UTF8String];
    NSStringFromSelector(a2);
    id v9 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    __int16 v21 = self;
    __int16 v22 = 2080;
    uint64_t v23 = [v9 UTF8String];
    __int16 v24 = 2048;
    double v25 = a3;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "+ %s(%p)::%s(%f)\n", buf, 0x2Au);
  }
  [(ASDSRCAudioDevice *)self samplingRate];
  if (v10 != a3)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __40__ASDSRCAudioDevice_changeSamplingRate___block_invoke;
    v17[3] = &unk_264773428;
    v17[4] = self;
    *(double *)&v17[5] = a3;
    v17[6] = a2;
    [(ASDAudioDevice *)self requestConfigurationChange:v17];
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    id v12 = objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 UTF8String];
    NSStringFromSelector(a2);
    id v14 = objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 UTF8String];
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    __int16 v21 = self;
    __int16 v22 = 2080;
    uint64_t v23 = v15;
    __int16 v24 = 1024;
    LODWORD(v25) = 1;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "- %s(%p)::%s(%d)\n", buf, 0x26u);
  }
  return 1;
}

void __40__ASDSRCAudioDevice_changeSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setSamplingRate:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 520) samplingRate];
  double v3 = v2;
  [*(id *)(a1 + 32) samplingRate];
  if (v3 != v4)
  {
    double v5 = *(double *)(a1 + 40)
       * (double)[*(id *)(*(void *)(a1 + 32) + 520) timestampPeriod];
    [*(id *)(*(void *)(a1 + 32) + 520) samplingRate];
    double v7 = v5 / v6;
    *(float *)&double v6 = v5 / v6;
    if (v7 != ceilf(*(float *)&v6))
    {
      __int16 v20 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v21 = *(void *)(a1 + 48);
      __int16 v22 = *(void **)(a1 + 32);
      [v22 samplingRate];
      uint64_t v24 = v23;
      [*(id *)(*(void *)(a1 + 32) + 520) samplingRate];
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v21, v22, @"ASDSRCAudioDevice.m", 218, @"Timestamp period is not an integer (%f) for sample rate combination %f (SRC) %f (Underlying)", *(void *)&v7, v24, v25);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [*(id *)(a1 + 32) inputStreams];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v13 updateLatency];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = [*(id *)(a1 + 32) outputStreams];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v19 updateLatency];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }
}

- (void)setSamplingRates:(id)a3
{
  id v4 = a3;
  sampleRateQueue = self->_sampleRateQueue;
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __38__ASDSRCAudioDevice_setSamplingRates___block_invoke;
  uint64_t v13 = &unk_2647731F8;
  id v14 = self;
  id v15 = v4;
  id v6 = v4;
  dispatch_sync(sampleRateQueue, &block);
  LODWORD(v9) = 0;
  double v7 = [(ASDObject *)self propertyChangedDelegate];
  [v7 changedProperty:&v8 forObject:self];
}

void __38__ASDSRCAudioDevice_setSamplingRates___block_invoke(uint64_t a1)
{
  double v2 = (void *)MEMORY[0x22A63EEF0]();
  uint64_t v3 = [*(id *)(a1 + 40) copy];
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(void **)(v4 + 472);
  *(void *)(v4 + 472) = v3;
}

- (id)samplingRates
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  sampleRateQueue = self->_sampleRateQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__ASDSRCAudioDevice_samplingRates__block_invoke;
  v5[3] = &unk_264773158;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleRateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __34__ASDSRCAudioDevice_samplingRates__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 472) copy];
  return MEMORY[0x270F9A758]();
}

- (BOOL)canBeDefaultDevice
{
  return [(ASDAudioDevice *)self->_underlyingDevice canBeDefaultDevice];
}

- (BOOL)canBeDefaultInputDevice
{
  return [(ASDAudioDevice *)self->_underlyingDevice canBeDefaultInputDevice];
}

- (BOOL)canBeDefaultOutputDevice
{
  return [(ASDAudioDevice *)self->_underlyingDevice canBeDefaultOutputDevice];
}

- (BOOL)canBeDefaultSystemDevice
{
  return [(ASDAudioDevice *)self->_underlyingDevice canBeDefaultSystemDevice];
}

- (BOOL)isHidden
{
  return [(ASDAudioDevice *)self->_underlyingDevice isHidden];
}

- (unsigned)timestampPeriod
{
  [(ASDAudioDevice *)self->_underlyingDevice samplingRate];
  if (v3 == 0.0) {
    return 0;
  }
  unsigned int v4 = [(ASDAudioDevice *)self->_underlyingDevice timestampPeriod];
  [(ASDSRCAudioDevice *)self samplingRate];
  unsigned int v6 = v4 * v5;
  [(ASDAudioDevice *)self->_underlyingDevice samplingRate];
  return v6 / v7;
}

- (double)sampleRateRatio
{
  [(ASDAudioDevice *)self->_underlyingDevice samplingRate];
  if (v3 == 0.0) {
    return 1.0;
  }
  double samplingRate = self->_samplingRate;
  [(ASDAudioDevice *)self->_underlyingDevice samplingRate];
  return samplingRate / v5;
}

- (unsigned)inputSafetyOffset
{
  unsigned int v3 = [(ASDAudioDevice *)self->_underlyingDevice inputSafetyOffset];
  [(ASDSRCAudioDevice *)self sampleRateRatio];
  return v3 * vcvtpd_s64_f64(v4);
}

- (unsigned)outputSafetyOffset
{
  unsigned int v3 = [(ASDAudioDevice *)self->_underlyingDevice outputSafetyOffset];
  [(ASDSRCAudioDevice *)self sampleRateRatio];
  return v3 * vcvtpd_s64_f64(v4);
}

- (unsigned)transportType
{
  return [(ASDAudioDevice *)self->_underlyingDevice transportType];
}

- (unsigned)clockDomain
{
  return [(ASDAudioDevice *)self->_underlyingDevice clockDomain];
}

- (unsigned)clockAlgorithm
{
  return [(ASDAudioDevice *)self->_underlyingDevice clockAlgorithm];
}

- (BOOL)clockIsStable
{
  return [(ASDAudioDevice *)self->_underlyingDevice clockIsStable];
}

- (int)performStopIO
{
  v4.receiver = self;
  v4.super_class = (Class)ASDSRCAudioDevice;
  int result = [(ASDAudioDevice *)&v4 performStopIO];
  *(_OWORD *)&self->_lastTimestamp.valid = 0u;
  *(_OWORD *)&self->_lastTimestamp.hostTime = 0u;
  return result;
}

- (id)getZeroTimestampBlock
{
  [(ASDSRCAudioDevice *)self samplingRate];
  double v4 = v3;
  [(ASDAudioDevice *)self->_underlyingDevice samplingRate];
  double v6 = v4 / v5;
  double v7 = [(ASDAudioDevice *)self->_underlyingDevice getZeroTimestampBlock];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __42__ASDSRCAudioDevice_getZeroTimestampBlock__block_invoke;
  v10[3] = &unk_264773450;
  v10[4] = v7;
  *(double *)&v10[5] = v6;
  uint64_t v8 = (void *)MEMORY[0x22A63F100](v10);

  return v8;
}

double __42__ASDSRCAudioDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, void *a3, void *a4)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  double result = round(0.0 * *(double *)(a1 + 40));
  *a2 = result;
  *a3 = 0;
  *a4 = 0;
  return result;
}

- (id)willDoReadInputBlock
{
  BOOL v2 = [(ASDAudioDevice *)self hasInput];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__ASDSRCAudioDevice_willDoReadInputBlock__block_invoke;
  v5[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  BOOL v6 = v2;
  double v3 = (void *)MEMORY[0x22A63F100](v5);
  return v3;
}

uint64_t __41__ASDSRCAudioDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  *a3 = *(unsigned char *)(a1 + 32);
  *a4 = 1;
  return 0;
}

- (id)willDoWriteMixBlock
{
  BOOL v2 = [(ASDAudioDevice *)self hasOutput];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ASDSRCAudioDevice_willDoWriteMixBlock__block_invoke;
  v5[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  BOOL v6 = v2;
  double v3 = (void *)MEMORY[0x22A63F100](v5);
  return v3;
}

uint64_t __40__ASDSRCAudioDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
{
  *a3 = *(unsigned char *)(a1 + 32);
  *a4 = 1;
  return 0;
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(ASDObject *)self plugin];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__ASDSRCAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke;
  v9[3] = &unk_264773498;
  id v10 = v5;
  id v7 = v5;
  LOBYTE(self) = [v6 requestConfigurationChangeForDevice:self withBlock:v9];

  return (char)self;
}

uint64_t __67__ASDSRCAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v6 = [(ASDObject *)self plugin];
  [v6 changedProperty:a3 forObject:self];
}

- (ASDAudioDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDevice, 0);
  objc_storeStrong((id *)&self->_sampleRateQueue, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);
}

@end