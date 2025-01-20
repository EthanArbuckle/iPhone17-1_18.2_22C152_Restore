@interface ASDDSPAudioDevice
+ (id)dspItemsInConfiguration:(id)a3 notInConfiguration:(id)a4;
- (ASDAudioDevice)underlyingDevice;
- (ASDAudioDeviceDSPConfiguration)currentDSPConfiguration;
- (ASDAudioDeviceDSPDatabase)dspDatabase;
- (ASDDSPAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 deviceDSPDatabase:(id)a5 plugin:(id)a6;
- (BOOL)applyDeviceDSPConfiguration:(id)a3;
- (BOOL)applyStreamDSPConfiguration:(id)a3 toStream:(id)a4;
- (BOOL)canBeDefaultDevice;
- (BOOL)canBeDefaultInputDevice;
- (BOOL)canBeDefaultOutputDevice;
- (BOOL)canBeDefaultSystemDevice;
- (BOOL)changeSamplingRate:(double)a3;
- (BOOL)clockIsStable;
- (BOOL)isHidden;
- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4;
- (BOOL)underlyingDeviceHasAllProperties:(id)a3;
- (BOOL)updateDeviceDSPConfiguration;
- (double)samplingRate;
- (id)deviceName;
- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4;
- (id)driverClassName;
- (id)findDSPConfigurationForCurrentState;
- (id)getZeroTimestampBlock;
- (id)manufacturerName;
- (id)modelName;
- (id)modelUID;
- (id)samplingRates;
- (id)willDoReadInputBlock;
- (id)willDoWriteMixBlock;
- (int)startIOForClient:(unsigned int)a3;
- (int)stopIOForClient:(unsigned int)a3;
- (unsigned)clockAlgorithm;
- (unsigned)clockDomain;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)outputLatency;
- (unsigned)outputSafetyOffset;
- (unsigned)timestampPeriod;
- (unsigned)transportType;
- (void)addInputStream:(id)a3;
- (void)addOutputStream:(id)a3;
- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4;
- (void)removeInputStream:(id)a3;
- (void)removeOutputStream:(id)a3;
- (void)setCurrentDSPConfiguration:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setSamplingRate:(double)a3;
- (void)updateDeviceDSPConfiguration;
@end

@implementation ASDDSPAudioDevice

- (ASDDSPAudioDevice)initWithDeviceUID:(id)a3 underlyingDevice:(id)a4 deviceDSPDatabase:(id)a5 plugin:(id)a6
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  v45.receiver = self;
  v45.super_class = (Class)ASDDSPAudioDevice;
  v13 = [(ASDAudioDevice *)&v45 initWithDeviceUID:a3 withPlugin:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_underlyingDevice, a4);
    objc_storeStrong((id *)&v14->_dspDatabase, a5);
    v15 = [(ASDAudioDeviceDSPDatabase *)v14->_dspDatabase referencedUnderlyingDeviceProperties];
    BOOL v16 = [(ASDDSPAudioDevice *)v14 underlyingDeviceHasAllProperties:v15];

    if (v16)
    {
      [v11 setConfigurationChangeDelegate:v14];
      [v11 setPropertyChangedDelegate:v14];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v17 = [v11 inputStreams];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v41 objects:v48 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v42 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * i) setPropertyChangedDelegate:v14];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v41 objects:v48 count:16];
        }
        while (v19);
      }

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v22 = [v11 outputStreams];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v38 != v25) {
              objc_enumerationMutation(v22);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * j) setPropertyChangedDelegate:v14];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v37 objects:v47 count:16];
        }
        while (v24);
      }

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v27 = objc_msgSend(v11, "controls", 0);
      uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v46 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v34;
        do
        {
          for (uint64_t k = 0; k != v29; ++k)
          {
            if (*(void *)v34 != v30) {
              objc_enumerationMutation(v27);
            }
            [*(id *)(*((void *)&v33 + 1) + 8 * k) setPropertyChangedDelegate:v14];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v46 count:16];
        }
        while (v29);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[ASDDSPAudioDevice initWithDeviceUID:underlyingDevice:deviceDSPDatabase:plugin:](v14);
      }
      v27 = v14;
      v14 = 0;
    }
  }
  return v14;
}

- (BOOL)underlyingDeviceHasAllProperties:(id)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v43 objects:v73 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v44;
    char v9 = 1;
    v10 = &_os_log_internal;
    *(void *)&long long v6 = 138415362;
    long long v29 = v6;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v4);
        }
        id v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
        int v42 = 0;
        uint64_t v41 = 0;
        uint64_t v41 = objc_msgSend(v12, "audioObjectPropertyAddress", v29);
        int v42 = v13;
        if (![(ASDAudioDevice *)self->_underlyingDevice hasProperty:&v41])
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            long long v40 = [(ASDAudioDevice *)self deviceUID];
            if ((int)[v12 selector] < 0x20000000 || (int)objc_msgSend(v12, "selector") > 2130706431) {
              int v14 = 32;
            }
            else {
              int v14 = (int)[v12 selector] >> 24;
            }
            int v39 = v14;
            if ((int)([v12 selector] << 8) < 0x20000000
              || (int)([v12 selector] << 8) > 2130706431)
            {
              int v15 = 32;
            }
            else
            {
              int v15 = (int)([v12 selector] << 8) >> 24;
            }
            int v38 = v15;
            if ((int)([v12 selector] << 16) < 0x20000000
              || (int)([v12 selector] << 16) > 2130706431)
            {
              int v16 = 32;
            }
            else
            {
              int v16 = (__int16)[v12 selector] >> 8;
            }
            int v37 = v16;
            if ((int)([v12 selector] << 24) < 520093697
              || [v12 selector] == 127)
            {
              int v17 = 32;
            }
            else
            {
              int v17 = (char)[v12 selector];
            }
            int v36 = v17;
            if ((int)[v12 scope] < 0x20000000 || (int)objc_msgSend(v12, "scope") > 2130706431) {
              int v18 = 32;
            }
            else {
              int v18 = (int)[v12 scope] >> 24;
            }
            int v35 = v18;
            if ((int)([v12 scope] << 8) < 0x20000000
              || (int)([v12 scope] << 8) > 2130706431)
            {
              int v19 = 32;
            }
            else
            {
              int v19 = (int)([v12 scope] << 8) >> 24;
            }
            int v34 = v19;
            if ((int)([v12 scope] << 16) < 0x20000000
              || (int)([v12 scope] << 16) > 2130706431)
            {
              int v20 = 32;
            }
            else
            {
              int v20 = (__int16)[v12 scope] >> 8;
            }
            int v33 = v20;
            if ((int)([v12 scope] << 24) < 520093697
              || [v12 scope] == 127)
            {
              int v21 = 32;
            }
            else
            {
              int v21 = (char)[v12 scope];
            }
            int v32 = v21;
            if ((int)[v12 element] < 0x20000000 || (int)objc_msgSend(v12, "element") > 2130706431) {
              int v22 = 32;
            }
            else {
              int v22 = (int)[v12 element] >> 24;
            }
            int v31 = v22;
            if ((int)([v12 element] << 8) < 0x20000000
              || (int)([v12 element] << 8) > 2130706431)
            {
              int v23 = 32;
            }
            else
            {
              int v23 = (int)([v12 element] << 8) >> 24;
            }
            int v30 = v23;
            v10 = &_os_log_internal;
            if ((int)([v12 element] << 16) < 0x20000000)
            {
              int v25 = 32;
              int v24 = v37;
            }
            else
            {
              int v24 = v37;
              if ((int)([v12 element] << 16) > 2130706431) {
                int v25 = 32;
              }
              else {
                int v25 = (__int16)[v12 element] >> 8;
              }
            }
            if ((int)([v12 element] << 24) < 520093697
              || [v12 element] == 127)
            {
              int v26 = 32;
            }
            else
            {
              int v26 = (char)[v12 element];
            }
            *(_DWORD *)buf = v29;
            v48 = v40;
            __int16 v49 = 1024;
            int v50 = v39;
            __int16 v51 = 1024;
            int v52 = v38;
            __int16 v53 = 1024;
            int v54 = v24;
            __int16 v55 = 1024;
            int v56 = v36;
            __int16 v57 = 1024;
            int v58 = v35;
            __int16 v59 = 1024;
            int v60 = v34;
            __int16 v61 = 1024;
            int v62 = v33;
            __int16 v63 = 1024;
            int v64 = v32;
            __int16 v65 = 1024;
            int v66 = v31;
            __int16 v67 = 1024;
            int v68 = v30;
            __int16 v69 = 1024;
            int v70 = v25;
            __int16 v71 = 1024;
            int v72 = v26;
            _os_log_error_impl(&dword_225CD5000, v10, OS_LOG_TYPE_ERROR, "Underlying device '%@' is missing property %c%c%c%c %c%c%c%c %c%c%c%c", buf, 0x54u);

            char v9 = 0;
          }
          else
          {
            char v9 = 0;
          }
        }
        ++v11;
      }
      while (v7 != v11);
      uint64_t v27 = [v4 countByEnumeratingWithState:&v43 objects:v73 count:16];
      uint64_t v7 = v27;
    }
    while (v27);
  }
  else
  {
    char v9 = 1;
  }

  return v9 & 1;
}

- (BOOL)updateDeviceDSPConfiguration
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v3 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];
  id v4 = [(ASDDSPAudioDevice *)self findDSPConfigurationForCurrentState];
  if ([v4 isEqual:v3])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)buf = 138412290;
      int v34 = v5;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSP configuration remains unchanged on device '%@'", buf, 0xCu);
    }
LABEL_8:
    BOOL v9 = 1;
    goto LABEL_32;
  }
  if ([(ASDDSPAudioDevice *)self applyDeviceDSPConfiguration:v4])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      long long v6 = [v3 name];
      uint64_t v7 = [v4 name];
      uint64_t v8 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)buf = 138412802;
      int v34 = v6;
      __int16 v35 = 2112;
      int v36 = v7;
      __int16 v37 = 2112;
      int v38 = v8;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "DSP configuration changed from '%@' to '%@' on device '%@'", buf, 0x20u);
    }
    [(ASDDSPAudioDevice *)self setCurrentDSPConfiguration:v4];
    goto LABEL_8;
  }
  if (![(ASDAudioDevice *)self isRunning])
  {
    [(ASDDSPAudioDevice *)self setCurrentDSPConfiguration:0];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v10 = [(ASDAudioDevice *)self inputStreams];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          int v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v15 removeHardwareDSP];
            [v15 setCurrentDSPConfiguration:0];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v16 = [(ASDAudioDevice *)self outputStreams];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          int v21 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v21 removeHardwareDSP];
            [v21 setCurrentDSPConfiguration:0];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v18);
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    [(ASDDSPAudioDevice *)v4 updateDeviceDSPConfiguration];
  }
  BOOL v9 = 0;
LABEL_32:

  return v9;
}

- (id)findDSPConfigurationForCurrentState
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v3 = [(ASDDSPAudioDevice *)self dspDatabase];
  id v4 = [v3 dspConfigurations];

  uint64_t v29 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v40;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v40 != v28) {
        objc_enumerationMutation(v4);
      }
      uint64_t v30 = v5;
      id v6 = *(id *)(*((void *)&v39 + 1) + 8 * v5);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v7 = [v6 underlyingDeviceProperties];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v44 count:16];
      BOOL v9 = v6;
      if (v8)
      {
        uint64_t v10 = v8;
        uint64_t v11 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v7);
            }
            uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            underlyingDevice = self->_underlyingDevice;
            uint64_t v15 = [v13 address];
            int v16 = [(ASDAudioDevice *)underlyingDevice getProperty:v15];

            uint64_t v17 = [v13 value];
            LOBYTE(v15) = [v16 isEqual:v17];

            if ((v15 & 1) == 0)
            {

              BOOL v9 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v7 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        BOOL v9 = v6;
      }
LABEL_16:

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      uint64_t v18 = [v6 dspDeviceProperties];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        while (2)
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            long long v23 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            uint64_t v24 = [v23 address];
            long long v25 = [(ASDAudioDevice *)self getProperty:v24];

            long long v26 = [v23 value];
            LOBYTE(v24) = [v25 isEqual:v26];

            if ((v24 & 1) == 0)
            {

              goto LABEL_27;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v43 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      if (v9) {
        break;
      }
LABEL_27:
      uint64_t v5 = v30 + 1;
      if (v30 + 1 == v29)
      {
        uint64_t v29 = [v4 countByEnumeratingWithState:&v39 objects:v45 count:16];
        if (v29) {
          goto LABEL_3;
        }
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_29:
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)applyDeviceDSPConfiguration:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  obuint64_t j = [(ASDAudioDevice *)self inputStreams];
  uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
  id v6 = &unk_225D3B000;
  if (!v5)
  {
    BOOL v18 = 1;
    goto LABEL_20;
  }
  uint64_t v7 = v5;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v41;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v41 != v9) {
      objc_enumerationMutation(obj);
    }
    uint64_t v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [(ASDAudioDevice *)self deviceUID];
        uint64_t v17 = [v11 streamName];
        *(_DWORD *)buf = 138412546;
        uint64_t v46 = v16;
        __int16 v47 = 2112;
        v48 = v17;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Stream '%@' isn't an ASDDSPStream, skipping.", buf, 0x16u);
      }
      goto LABEL_12;
    }
    uint64_t v12 = [v4 inputDSP];
    unint64_t v13 = [v12 count];

    if (v8 + v10 >= v13) {
      break;
    }
    uint64_t v14 = [v4 inputDSP];
    uint64_t v15 = [(id)v14 objectAtIndexedSubscript:v8 + v10];

    LOBYTE(v14) = [(ASDDSPAudioDevice *)self applyStreamDSPConfiguration:v15 toStream:v11];
    if ((v14 & 1) == 0)
    {
      BOOL v18 = 0;
LABEL_19:
      id v6 = &unk_225D3B000;
      goto LABEL_20;
    }
LABEL_12:
    if (v7 == ++v10)
    {
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v49 count:16];
      v8 += v10;
      if (v7) {
        goto LABEL_3;
      }
      BOOL v18 = 1;
      goto LABEL_19;
    }
  }
  id v6 = (void *)&unk_225D3B000;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[ASDDSPAudioDevice applyDeviceDSPConfiguration:](self);
  }
  BOOL v18 = 0;
LABEL_20:

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obja = [(ASDAudioDevice *)self outputStreams];
  uint64_t v19 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    BOOL v32 = v18;
    uint64_t v21 = 0;
    uint64_t v22 = *(void *)v37;
    int v33 = v6[3];
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(obja);
        }
        uint64_t v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v25 = [v4 outputDSP];
          unint64_t v26 = [v25 count];

          if (v21 + i >= v26)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[ASDDSPAudioDevice applyDeviceDSPConfiguration:](self);
            }
LABEL_36:
            BOOL v18 = 0;
            goto LABEL_37;
          }
          uint64_t v27 = [v4 outputDSP];
          uint64_t v28 = [(id)v27 objectAtIndexedSubscript:v21 + i];

          LOBYTE(v27) = [(ASDDSPAudioDevice *)self applyStreamDSPConfiguration:v28 toStream:v24];
          if ((v27 & 1) == 0) {
            goto LABEL_36;
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = [(ASDAudioDevice *)self deviceUID];
          uint64_t v30 = [v24 streamName];
          *(_DWORD *)buf = v33;
          uint64_t v46 = v29;
          __int16 v47 = 2112;
          v48 = v30;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Stream '%@' isn't an ASDDSPStream, skipping.", buf, 0x16u);
        }
      }
      uint64_t v20 = [obja countByEnumeratingWithState:&v36 objects:v44 count:16];
      v21 += i;
      if (v20) {
        continue;
      }
      break;
    }
    BOOL v18 = v32;
  }
LABEL_37:

  return v18;
}

- (BOOL)applyStreamDSPConfiguration:(id)a3 toStream:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    uint64_t v9 = [v6 hardwareDSP];
    uint64_t v10 = [v8 currentDSPConfiguration];
    uint64_t v11 = [v10 hardwareDSP];
    uint64_t v12 = +[ASDDSPAudioDevice dspItemsInConfiguration:v9 notInConfiguration:v11];

    if (+[ASDAUStripInfo containsOnlyAUStrips:v12])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v27 = self;
        id v28 = v6;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v19 = [v8 hardwareDSP];
            int v20 = +[ASDDSPGraphLoader applyAUStrip:v18 toGraph:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v15);
        self = v27;
        id v6 = v28;
      }
      else
      {
        int v20 = 0;
      }

      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      long long v23 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)buf = 138412290;
      long long v34 = v23;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: New StreamDSPConfiguration contained only AUStrip differences", buf, 0xCu);
    }
    else
    {
      uint64_t v22 = [v6 hardwareDSP];
      long long v23 = +[ASDDSPGraphLoader graphWithConfiguration:v22];

      if (v23)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [v23 name];
          long long v25 = [(ASDAudioDevice *)self deviceUID];
          *(_DWORD *)buf = 138412546;
          long long v34 = v24;
          __int16 v35 = 2112;
          long long v36 = v25;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "New DSPGraph '%@' created on device '%@'", buf, 0x16u);
        }
        int v20 = [v8 addHardwareDSP:v23];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[ASDDSPAudioDevice applyStreamDSPConfiguration:toStream:](self);
        }
        int v20 = 0;
      }
    }

LABEL_24:
    if (v20)
    {
      [v8 setCurrentDSPConfiguration:v6];
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[ASDDSPAudioDevice applyStreamDSPConfiguration:toStream:](self);
    }

    BOOL v21 = v20 != 0;
    goto LABEL_29;
  }
  BOOL v21 = 0;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASDDSPAudioDevice currently only supports ASDDSPStreams.", buf, 2u);
    BOOL v21 = 0;
  }
LABEL_29:

  return v21;
}

+ (id)dspItemsInConfiguration:(id)a3 notInConfiguration:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v21 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v19 = v5;
  obuint64_t j = [v5 dspItems];
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v12 = [v6 dspItems];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (!v13)
        {

LABEL_16:
          [v21 addObject:v11];
          continue;
        }
        uint64_t v14 = v13;
        int v15 = 0;
        uint64_t v16 = *(void *)v23;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v23 != v16) {
              objc_enumerationMutation(v12);
            }
            v15 |= [v11 isEqual:*(void *)(*((void *)&v22 + 1) + 8 * j)];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        }
        while (v14);

        if ((v15 & 1) == 0) {
          goto LABEL_16;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  return v21;
}

- (int)startIOForClient:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];

  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ASDDSPAudioDevice.m" lineNumber:358 description:@"Starting IO without a DSP configuration"];
  }
  int v7 = [(ASDAudioDevice *)self->_underlyingDevice startIOForClient:v3];
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(ASDAudioDevice *)self->_underlyingDevice deviceUID];
      uint64_t v9 = (void *)v8;
      int v10 = v7 >> 24;
      if ((v7 - 0x20000000) >> 24 >= 0x5F) {
        int v10 = 32;
      }
      int v11 = v7 << 8 >> 24;
      if (((v7 << 8) - 0x20000000) >> 24 >= 0x5F) {
        int v11 = 32;
      }
      if (((v7 << 16) - 0x20000000) >> 24 >= 0x5F) {
        int v12 = 32;
      }
      else {
        int v12 = (__int16)v7 >> 8;
      }
      *(_DWORD *)buf = 138413314;
      uint64_t v22 = v8;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 1024;
      int v26 = v11;
      BOOL v13 = v7 << 24 == 2130706432 || v7 << 24 < 520093697;
      __int16 v27 = 1024;
      int v28 = v12;
      if (v13) {
        int v14 = 32;
      }
      else {
        int v14 = (char)v7;
      }
      __int16 v29 = 1024;
      int v30 = v14;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Underlying device '%@' failed to start with error: %c%c%c%c", buf, 0x24u);
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ASDDSPAudioDevice;
    if ([(ASDAudioDevice *)&v20 startIOForClient:v3])
    {
      uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
      v19.receiver = self;
      v19.super_class = (Class)ASDDSPAudioDevice;
      uint64_t v18 = [(ASDAudioDevice *)&v19 deviceUID];
      [v17 handleFailureInMethod:a2, self, @"ASDDSPAudioDevice.m", 365, @"%@: ASDAudioDevice startIOForClient must succeed", v18 object file lineNumber description];
    }
  }
  return v7;
}

- (int)stopIOForClient:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];

  if (!v6)
  {
    uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"ASDDSPAudioDevice.m" lineNumber:378 description:@"Stopping IO without a DSP configuration"];
  }
  v20.receiver = self;
  v20.super_class = (Class)ASDDSPAudioDevice;
  int v7 = [(ASDAudioDevice *)&v20 stopIOForClient:v3];
  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v19.receiver = self;
      v19.super_class = (Class)ASDDSPAudioDevice;
      uint64_t v8 = [(ASDAudioDevice *)&v19 deviceUID];
      uint64_t v9 = (void *)v8;
      int v10 = v7 >> 24;
      if ((v7 - 0x20000000) >> 24 >= 0x5F) {
        int v10 = 32;
      }
      int v11 = v7 << 8 >> 24;
      if (((v7 << 8) - 0x20000000) >> 24 >= 0x5F) {
        int v11 = 32;
      }
      if (((v7 << 16) - 0x20000000) >> 24 >= 0x5F) {
        int v12 = 32;
      }
      else {
        int v12 = (__int16)v7 >> 8;
      }
      *(_DWORD *)buf = 138413314;
      uint64_t v22 = v8;
      __int16 v23 = 1024;
      int v24 = v10;
      __int16 v25 = 1024;
      int v26 = v11;
      BOOL v13 = v7 << 24 == 2130706432 || v7 << 24 < 520093697;
      __int16 v27 = 1024;
      int v28 = v12;
      if (v13) {
        int v14 = 32;
      }
      else {
        int v14 = (char)v7;
      }
      __int16 v29 = 1024;
      int v30 = v14;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASDAudioDevice '%@' failed to stop with error: %c%c%c%c", buf, 0x24u);
    }
  }
  else if ([(ASDAudioDevice *)self->_underlyingDevice stopIOForClient:v3])
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v18 = [(ASDAudioDevice *)self->_underlyingDevice deviceUID];
    [v17 handleFailureInMethod:a2, self, @"ASDDSPAudioDevice.m", 385, @"%@: Underlying stopIOForClient must succeed", v18 object file lineNumber description];
  }
  return v7;
}

- (void)addInputStream:(id)a3
{
  id v4 = a3;
  [(ASDDSPAudioDevice *)self setCurrentDSPConfiguration:0];
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  [(ASDAudioDevice *)&v5 addInputStream:v4];
}

- (void)removeInputStream:(id)a3
{
  id v4 = a3;
  [(ASDDSPAudioDevice *)self setCurrentDSPConfiguration:0];
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  [(ASDAudioDevice *)&v5 removeInputStream:v4];
}

- (void)addOutputStream:(id)a3
{
  id v4 = a3;
  [(ASDDSPAudioDevice *)self setCurrentDSPConfiguration:0];
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  [(ASDAudioDevice *)&v5 addOutputStream:v4];
}

- (void)removeOutputStream:(id)a3
{
  id v4 = a3;
  [(ASDDSPAudioDevice *)self setCurrentDSPConfiguration:0];
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPAudioDevice;
  [(ASDAudioDevice *)&v5 removeOutputStream:v4];
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

- (double)samplingRate
{
  [(ASDAudioDevice *)self->_underlyingDevice samplingRate];
  return result;
}

- (id)samplingRates
{
  return [(ASDAudioDevice *)self->_underlyingDevice samplingRates];
}

- (void)setSamplingRate:(double)a3
{
}

- (BOOL)changeSamplingRate:(double)a3
{
  return [(ASDAudioDevice *)self->_underlyingDevice changeSamplingRate:a3];
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
  return [(ASDAudioDevice *)self->_underlyingDevice timestampPeriod];
}

- (unsigned)inputSafetyOffset
{
  return [(ASDAudioDevice *)self->_underlyingDevice inputSafetyOffset];
}

- (unsigned)outputSafetyOffset
{
  return [(ASDAudioDevice *)self->_underlyingDevice outputSafetyOffset];
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

- (unsigned)inputLatency
{
  return [(ASDAudioDevice *)self->_underlyingDevice inputLatency];
}

- (unsigned)outputLatency
{
  return [(ASDAudioDevice *)self->_underlyingDevice outputLatency];
}

- (id)getZeroTimestampBlock
{
  return [(ASDAudioDevice *)self->_underlyingDevice getZeroTimestampBlock];
}

- (id)willDoReadInputBlock
{
  BOOL v2 = [(ASDAudioDevice *)self hasInput];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__ASDDSPAudioDevice_willDoReadInputBlock__block_invoke;
  v5[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  BOOL v6 = v2;
  uint64_t v3 = (void *)MEMORY[0x22A63F100](v5);
  return v3;
}

uint64_t __41__ASDDSPAudioDevice_willDoReadInputBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
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
  v5[2] = __40__ASDDSPAudioDevice_willDoWriteMixBlock__block_invoke;
  v5[3] = &__block_descriptor_33_e14_i28__0I8_12_20l;
  BOOL v6 = v2;
  uint64_t v3 = (void *)MEMORY[0x22A63F100](v5);
  return v3;
}

uint64_t __40__ASDDSPAudioDevice_willDoWriteMixBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3, unsigned char *a4)
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
  v9[2] = __67__ASDDSPAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke;
  v9[3] = &unk_264773600;
  v9[4] = self;
  id v10 = v5;
  id v7 = v5;
  LOBYTE(self) = [v6 requestConfigurationChangeForDevice:self withBlock:v9];

  return (char)self;
}

uint64_t __67__ASDDSPAudioDevice_requestConfigurationChangeForDevice_withBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 updateDeviceDSPConfiguration];
}

- (void)changedProperty:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v6 = [(ASDObject *)self plugin];
  [v6 changedProperty:a3 forObject:self];
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v195 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v192.receiver = self;
  v192.super_class = (Class)ASDDSPAudioDevice;
  id v7 = [(ASDAudioDevice *)&v192 diagnosticDescriptionWithIndent:v6 walkTree:v4];
  uint64_t v8 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];
  id v9 = [v8 name];
  [v7 appendFormat:@"%@|    Current DSP Configuration: %s\n", v6, objc_msgSend(v9, "UTF8String")];

  [v7 appendFormat:@"%@|    DSP Device Properties:\n", v6];
  id v10 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];
  int v11 = [v10 dspDeviceProperties];
  uint64_t v12 = [v11 count];

  id v183 = v6;
  v182 = v7;
  v73 = self;
  if (v12)
  {
    long long v190 = 0u;
    long long v191 = 0u;
    long long v188 = 0u;
    long long v189 = 0u;
    BOOL v13 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];
    int v14 = [v13 dspDeviceProperties];

    obuint64_t j = v14;
    uint64_t v102 = [v14 countByEnumeratingWithState:&v188 objects:v194 count:16];
    if (v102)
    {
      uint64_t v100 = *(void *)v189;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v189 != v100) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v188 + 1) + 8 * v15);
          uint64_t v17 = NSString;
          uint64_t v18 = [v16 value];
          objc_super v19 = [v17 stringWithFormat:@"%@", v18];

          uint64_t v178 = [v19 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26D970628];

          objc_super v20 = [v16 address];
          int v21 = [v20 selector];
          if (v21 < 0x20000000
            || ([v16 address],
                v99 = objc_claimAutoreleasedReturnValue(),
                (int)[v99 selector] > 2130706431))
          {
            int v172 = 0;
            uint64_t v154 = 32;
          }
          else
          {
            v88 = [v16 address];
            uint64_t v154 = ((int)[v88 selector] >> 24);
            int v172 = 1;
          }
          uint64_t v22 = [v16 address];
          signed int v23 = [v22 selector] << 8;
          if (v23 < 0x20000000
            || ([v16 address],
                v98 = objc_claimAutoreleasedReturnValue(),
                (int)([v98 selector] << 8) > 2130706431))
          {
            int v166 = 0;
            uint64_t v146 = 32;
          }
          else
          {
            v87 = [v16 address];
            uint64_t v146 = ((int)([v87 selector] << 8) >> 24);
            int v166 = 1;
          }
          v164 = [v16 address];
          signed int v162 = [v164 selector] << 16;
          if (v162 < 0x20000000
            || ([v16 address],
                v97 = objc_claimAutoreleasedReturnValue(),
                (int)([v97 selector] << 16) > 2130706431))
          {
            int v160 = 0;
            uint64_t v140 = 32;
          }
          else
          {
            v86 = [v16 address];
            uint64_t v140 = ((__int16)[v86 selector] >> 8);
            int v160 = 1;
          }
          v158 = [v16 address];
          signed int v156 = [v158 selector] << 24;
          if (v156 < 520093697
            || ([v16 address],
                v96 = objc_claimAutoreleasedReturnValue(),
                [v96 selector] == 127))
          {
            int v152 = 0;
            uint64_t v134 = 32;
          }
          else
          {
            v85 = [v16 address];
            uint64_t v134 = (char)[v85 selector];
            int v152 = 1;
          }
          v150 = [v16 address];
          int v148 = [v150 scope];
          if (v148 < 0x20000000
            || ([v16 address],
                v95 = objc_claimAutoreleasedReturnValue(),
                (int)[v95 scope] > 2130706431))
          {
            int v144 = 0;
            uint64_t v126 = 32;
          }
          else
          {
            v84 = [v16 address];
            uint64_t v126 = ((int)[v84 scope] >> 24);
            int v144 = 1;
          }
          v142 = [v16 address];
          signed int v138 = [v142 scope] << 8;
          if (v138 < 0x20000000
            || ([v16 address],
                v94 = objc_claimAutoreleasedReturnValue(),
                (int)([v94 scope] << 8) > 2130706431))
          {
            int v136 = 0;
            uint64_t v120 = 32;
          }
          else
          {
            v83 = [v16 address];
            uint64_t v120 = ((int)([v83 scope] << 8) >> 24);
            int v136 = 1;
          }
          v132 = [v16 address];
          signed int v130 = [v132 scope] << 16;
          if (v130 < 0x20000000
            || ([v16 address],
                v93 = objc_claimAutoreleasedReturnValue(),
                (int)([v93 scope] << 16) > 2130706431))
          {
            int v128 = 0;
            uint64_t v112 = 32;
          }
          else
          {
            v82 = [v16 address];
            uint64_t v112 = ((__int16)[v82 scope] >> 8);
            int v128 = 1;
          }
          v124 = [v16 address];
          signed int v122 = [v124 scope] << 24;
          if (v122 < 520093697
            || ([v16 address],
                v92 = objc_claimAutoreleasedReturnValue(),
                [v92 scope] == 127))
          {
            int v118 = 0;
            uint64_t v108 = 32;
          }
          else
          {
            v81 = [v16 address];
            uint64_t v108 = (char)[v81 scope];
            int v118 = 1;
          }
          int v24 = [v16 address];
          int v114 = [v24 element];
          uint64_t v180 = v15;
          v170 = v22;
          if (v114 < 0x20000000
            || ([v16 address],
                v91 = objc_claimAutoreleasedReturnValue(),
                (int)[v91 element] > 2130706431))
          {
            int v25 = 0;
            uint64_t v104 = 32;
          }
          else
          {
            v80 = [v16 address];
            uint64_t v104 = ((int)[v80 element] >> 24);
            int v25 = 1;
          }
          v110 = [v16 address];
          signed int v26 = [v110 element] << 8;
          v176 = v20;
          int v174 = v21;
          v116 = v24;
          if (v26 < 0x20000000
            || ([v16 address],
                v90 = objc_claimAutoreleasedReturnValue(),
                (int)([v90 element] << 8) > 2130706431))
          {
            int v106 = 0;
            uint64_t v27 = 32;
          }
          else
          {
            v79 = [v16 address];
            uint64_t v27 = ((int)([v79 element] << 8) >> 24);
            int v106 = 1;
          }
          int v28 = [v16 address];
          signed int v29 = [v28 element] << 16;
          int v168 = v23;
          if (v29 < 0x20000000
            || ([v16 address],
                v89 = objc_claimAutoreleasedReturnValue(),
                (int)([v89 element] << 16) > 2130706431))
          {
            int v31 = 0;
            uint64_t v30 = 32;
          }
          else
          {
            v78 = [v16 address];
            uint64_t v30 = ((__int16)[v78 element] >> 8);
            int v31 = 1;
          }
          uint64_t v32 = [v16 address];
          if ((int)([v32 element] << 24) < 520093697)
          {
            long long v34 = (void *)v178;
            uint64_t v68 = v30;
            id v6 = v183;
            id v7 = v182;
            [v182 appendFormat:@"%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n", v183, v154, v146, v140, v134, v126, v120, v112, v108, v104, v27, v68, 32, v178];
          }
          else
          {
            int v33 = [v16 address];
            if ([v33 element] == 127)
            {
              long long v34 = (void *)v178;
              uint64_t v67 = v30;
              id v7 = v182;
              [v182 appendFormat:@"%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n", v183, v154, v146, v140, v134, v126, v120, v112, v108, v104, v27, v67, 32, v178];
            }
            else
            {
              [v16 address];
              __int16 v35 = v74 = v25;
              long long v34 = (void *)v178;
              uint64_t v69 = v30;
              id v7 = v182;
              [v182 appendFormat:@"%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n", v183, v154, v146, v140, v134, v126, v120, v112, v108, v104, v27, v69, (char)objc_msgSend(v35, "element"), v178];

              int v25 = v74;
            }

            id v6 = v183;
          }

          if (v31) {
          if (v29 >= 0x20000000)
          }

          if (v106) {
          if (v26 >= 0x20000000)
          }

          if (v25) {
          if (v114 >= 0x20000000)
          }

          if (v118) {
          if (v122 >= 520093697)
          }

          if (v128) {
          if (v130 >= 0x20000000)
          }

          if (v136) {
          if (v138 >= 0x20000000)
          }

          if (v144) {
          if (v148 >= 0x20000000)
          }

          if (v152) {
          if (v156 >= 520093697)
          }

          if (v160) {
          if (v162 >= 0x20000000)
          }

          if (v166) {
          if (v168 >= 0x20000000)
          }

          if (v172) {
          if (v174 >= 0x20000000)
          }

          uint64_t v15 = v180 + 1;
        }
        while (v102 != v180 + 1);
        uint64_t v102 = [obj countByEnumeratingWithState:&v188 objects:v194 count:16];
      }
      while (v102);
    }

    self = v73;
  }
  [v7 appendFormat:@"%@|    Underlying Device Properties:\n", v6];
  long long v36 = [(ASDDSPAudioDevice *)self currentDSPConfiguration];
  long long v37 = [v36 underlyingDeviceProperties];
  uint64_t v38 = [v37 count];

  long long v39 = v73;
  if (v38)
  {
    long long v186 = 0u;
    long long v187 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v40 = [(ASDDSPAudioDevice *)v73 currentDSPConfiguration];
    long long v41 = [v40 underlyingDeviceProperties];

    id obja = v41;
    uint64_t v103 = [v41 countByEnumeratingWithState:&v184 objects:v193 count:16];
    if (v103)
    {
      uint64_t v101 = *(void *)v185;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v185 != v101) {
            objc_enumerationMutation(obja);
          }
          long long v43 = *(void **)(*((void *)&v184 + 1) + 8 * v42);
          long long v44 = NSString;
          long long v45 = [v43 value];
          uint64_t v46 = [v44 stringWithFormat:@"%@", v45];

          uint64_t v179 = [v46 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26D970628];

          __int16 v47 = [v43 address];
          int v48 = [v47 selector];
          if (v48 < 0x20000000
            || ([v43 address],
                v99 = objc_claimAutoreleasedReturnValue(),
                (int)[v99 selector] > 2130706431))
          {
            int v173 = 0;
            uint64_t v155 = 32;
          }
          else
          {
            v88 = [v43 address];
            uint64_t v155 = ((int)[v88 selector] >> 24);
            int v173 = 1;
          }
          __int16 v49 = [v43 address];
          signed int v50 = [v49 selector] << 8;
          if (v50 < 0x20000000
            || ([v43 address],
                v98 = objc_claimAutoreleasedReturnValue(),
                (int)([v98 selector] << 8) > 2130706431))
          {
            int v167 = 0;
            uint64_t v147 = 32;
          }
          else
          {
            v87 = [v43 address];
            uint64_t v147 = ((int)([v87 selector] << 8) >> 24);
            int v167 = 1;
          }
          v165 = [v43 address];
          signed int v163 = [v165 selector] << 16;
          if (v163 < 0x20000000
            || ([v43 address],
                v97 = objc_claimAutoreleasedReturnValue(),
                (int)([v97 selector] << 16) > 2130706431))
          {
            int v161 = 0;
            uint64_t v141 = 32;
          }
          else
          {
            v86 = [v43 address];
            uint64_t v141 = ((__int16)[v86 selector] >> 8);
            int v161 = 1;
          }
          v159 = [v43 address];
          signed int v157 = [v159 selector] << 24;
          if (v157 < 520093697
            || ([v43 address],
                v96 = objc_claimAutoreleasedReturnValue(),
                [v96 selector] == 127))
          {
            int v153 = 0;
            uint64_t v135 = 32;
          }
          else
          {
            v85 = [v43 address];
            uint64_t v135 = (char)[v85 selector];
            int v153 = 1;
          }
          v151 = [v43 address];
          int v149 = [v151 scope];
          if (v149 < 0x20000000
            || ([v43 address],
                v95 = objc_claimAutoreleasedReturnValue(),
                (int)[v95 scope] > 2130706431))
          {
            int v145 = 0;
            uint64_t v127 = 32;
          }
          else
          {
            v84 = [v43 address];
            uint64_t v127 = ((int)[v84 scope] >> 24);
            int v145 = 1;
          }
          v143 = [v43 address];
          signed int v139 = [v143 scope] << 8;
          if (v139 < 0x20000000
            || ([v43 address],
                v94 = objc_claimAutoreleasedReturnValue(),
                (int)([v94 scope] << 8) > 2130706431))
          {
            int v137 = 0;
            uint64_t v121 = 32;
          }
          else
          {
            v83 = [v43 address];
            uint64_t v121 = ((int)([v83 scope] << 8) >> 24);
            int v137 = 1;
          }
          v133 = [v43 address];
          signed int v131 = [v133 scope] << 16;
          if (v131 < 0x20000000
            || ([v43 address],
                v93 = objc_claimAutoreleasedReturnValue(),
                (int)([v93 scope] << 16) > 2130706431))
          {
            int v129 = 0;
            uint64_t v113 = 32;
          }
          else
          {
            v82 = [v43 address];
            uint64_t v113 = ((__int16)[v82 scope] >> 8);
            int v129 = 1;
          }
          v125 = [v43 address];
          signed int v123 = [v125 scope] << 24;
          if (v123 < 520093697
            || ([v43 address],
                v92 = objc_claimAutoreleasedReturnValue(),
                [v92 scope] == 127))
          {
            int v119 = 0;
            uint64_t v109 = 32;
          }
          else
          {
            v81 = [v43 address];
            uint64_t v109 = (char)[v81 scope];
            int v119 = 1;
          }
          __int16 v51 = [v43 address];
          int v115 = [v51 element];
          uint64_t v181 = v42;
          v171 = v49;
          if (v115 < 0x20000000
            || ([v43 address],
                v91 = objc_claimAutoreleasedReturnValue(),
                (int)[v91 element] > 2130706431))
          {
            int v52 = 0;
            uint64_t v105 = 32;
          }
          else
          {
            v80 = [v43 address];
            uint64_t v105 = ((int)[v80 element] >> 24);
            int v52 = 1;
          }
          v111 = [v43 address];
          signed int v53 = [v111 element] << 8;
          v177 = v47;
          int v175 = v48;
          v117 = v51;
          if (v53 < 0x20000000
            || ([v43 address],
                v90 = objc_claimAutoreleasedReturnValue(),
                (int)([v90 element] << 8) > 2130706431))
          {
            int v107 = 0;
            uint64_t v54 = 32;
          }
          else
          {
            v79 = [v43 address];
            uint64_t v54 = ((int)([v79 element] << 8) >> 24);
            int v107 = 1;
          }
          __int16 v55 = [v43 address];
          signed int v56 = [v55 element] << 16;
          int v169 = v50;
          if (v56 < 0x20000000
            || ([v43 address],
                v89 = objc_claimAutoreleasedReturnValue(),
                (int)([v89 element] << 16) > 2130706431))
          {
            int v58 = 0;
            uint64_t v57 = 32;
          }
          else
          {
            v78 = [v43 address];
            uint64_t v57 = ((__int16)[v78 element] >> 8);
            int v58 = 1;
          }
          __int16 v59 = [v43 address];
          if ((int)([v59 element] << 24) < 520093697)
          {
            __int16 v61 = (void *)v179;
            uint64_t v71 = v57;
            id v6 = v183;
            id v7 = v182;
            [v182 appendFormat:@"%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n", v183, v155, v147, v141, v135, v127, v121, v113, v109, v105, v54, v71, 32, v179];
          }
          else
          {
            int v60 = [v43 address];
            if ([v60 element] == 127)
            {
              __int16 v61 = (void *)v179;
              uint64_t v70 = v57;
              id v7 = v182;
              [v182 appendFormat:@"%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n", v183, v155, v147, v141, v135, v127, v121, v113, v109, v105, v54, v70, 32, v179];
            }
            else
            {
              [v43 address];
              int v62 = v75 = v52;
              __int16 v61 = (void *)v179;
              uint64_t v72 = v57;
              id v7 = v182;
              [v182 appendFormat:@"%@|     - %c%c%c%c %c%c%c%c %c%c%c%c : %@\n", v183, v155, v147, v141, v135, v127, v121, v113, v109, v105, v54, v72, (char)objc_msgSend(v62, "element"), v179];

              int v52 = v75;
            }

            id v6 = v183;
          }

          if (v58) {
          if (v56 >= 0x20000000)
          }

          if (v107) {
          if (v53 >= 0x20000000)
          }

          if (v52) {
          if (v115 >= 0x20000000)
          }

          if (v119) {
          if (v123 >= 520093697)
          }

          if (v129) {
          if (v131 >= 0x20000000)
          }

          if (v137) {
          if (v139 >= 0x20000000)
          }

          if (v145) {
          if (v149 >= 0x20000000)
          }

          if (v153) {
          if (v157 >= 520093697)
          }

          if (v161) {
          if (v163 >= 0x20000000)
          }

          if (v167) {
          if (v169 >= 0x20000000)
          }

          if (v173) {
          if (v175 >= 0x20000000)
          }

          uint64_t v42 = v181 + 1;
        }
        while (v103 != v181 + 1);
        uint64_t v103 = [obja countByEnumeratingWithState:&v184 objects:v193 count:16];
      }
      while (v103);
    }

    long long v39 = v73;
  }
  [v7 appendFormat:@"%@|    Underlying device:\n", v6];
  __int16 v63 = [(ASDDSPAudioDevice *)v39 underlyingDevice];

  if (v63)
  {
    int v64 = [(ASDDSPAudioDevice *)v39 underlyingDevice];
    [v7 appendFormat:@"%@|        Object ID: %u\n", v6, objc_msgSend(v64, "objectID")];
  }
  id v65 = v7;

  return v65;
}

- (id)driverClassName
{
  return @"DSPAudioDevice";
}

- (ASDAudioDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (ASDAudioDeviceDSPConfiguration)currentDSPConfiguration
{
  return self->_currentDSPConfiguration;
}

- (void)setCurrentDSPConfiguration:(id)a3
{
}

- (ASDAudioDeviceDSPDatabase)dspDatabase
{
  return self->_dspDatabase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dspDatabase, 0);
  objc_storeStrong((id *)&self->_currentDSPConfiguration, 0);
  objc_storeStrong((id *)&self->_underlyingDevice, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
}

- (void)initWithDeviceUID:(void *)a1 underlyingDevice:deviceDSPDatabase:plugin:.cold.1(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v2, "Underlying device '%@' doesn't have all properties specified in database.", v3, v4, v5, v6, v7);
}

- (void)updateDeviceDSPConfiguration
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 name];
  uint64_t v4 = [a2 deviceUID];
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "DSP configuration '%@' couldn't be applied on device '%@'", (uint8_t *)&v5, 0x16u);
}

- (void)applyDeviceDSPConfiguration:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v2, "Can't find an output stream configuration in database. The DSP device '%@' is now in an inconsistent state.", v3, v4, v5, v6, v7);
}

- (void)applyDeviceDSPConfiguration:(void *)a1 .cold.2(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v2, "Can't find an input stream configuration in database. The DSP device '%@' is now in an inconsistent state.", v3, v4, v5, v6, v7);
}

- (void)applyStreamDSPConfiguration:(void *)a1 toStream:.cold.1(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v2, "Error adding hardware DSP. The DSP device '%@' is now in an inconsistent state.", v3, v4, v5, v6, v7);
}

- (void)applyStreamDSPConfiguration:(void *)a1 toStream:.cold.2(void *a1)
{
  v1 = [a1 deviceUID];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v2, "%@: Graph is nil", v3, v4, v5, v6, v7);
}

@end