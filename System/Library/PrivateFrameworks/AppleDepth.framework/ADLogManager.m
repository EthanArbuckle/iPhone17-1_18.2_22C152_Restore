@interface ADLogManager
+ (id)defaultLoggerWithName:(id)a3;
- (ADLogManager)init;
- (ADLogManager)initWithHandlers:(id)a3;
- (BOOL)enabled;
- (BOOL)getHumanReadableFormat;
- (BOOL)humanReadableFormat;
- (id)visualLoggerPrefices;
- (int64_t)addHandler:(id)a3;
- (int64_t)setHostName:(id)a3;
- (int64_t)setLogFolder:(id)a3;
- (uint64_t)logMatrix4x3:(__n128)a3 name:(__n128)a4 priority:(__n128)a5;
- (uint64_t)logMatrix4x3:(void *)a1 name:(const char *)a2 timestamp:(uint64_t)a3;
- (uint64_t)logMatrix4x4:(__n128)a3 name:(__n128)a4 priority:(__n128)a5;
- (uint64_t)logMatrix4x4:(void *)a1 name:(const char *)a2 timestamp:(uint64_t)a3;
- (unint64_t)loggingPriority;
- (void)applyConfigurationToNewHandler:(id)a3;
- (void)dealloc;
- (void)disable:(id)a3;
- (void)disableAll;
- (void)disableFileLogging;
- (void)disableVisualLogging;
- (void)enable:(id)a3;
- (void)enableAll;
- (void)enableFileLogging;
- (void)enableVisualLogging;
- (void)logCalibration:(id)a3 name:(const char *)a4 priority:(unint64_t)a5;
- (void)logCalibration:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6;
- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logDictionary:(id)a3 name:(const char *)a4 priority:(unint64_t)a5;
- (void)logDictionary:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6;
- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logMatrix4x3:(double)a3 name:(double)a4 priority:(double)a5 timestamp:(double)a6;
- (void)logMatrix4x4:(__n128)a3 name:(__n128)a4 priority:(__n128)a5 timestamp:(double)a6;
- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 priority:(unint64_t)a5;
- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6;
- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logPointCloud:(id)a3 name:(const char *)a4 priority:(unint64_t)a5;
- (void)logPointCloud:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6;
- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 priority:(unint64_t)a6;
- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 priority:(unint64_t)a6 timestamp:(double)a7;
- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6;
- (void)logString:(id)a3 name:(const char *)a4 priority:(unint64_t)a5;
- (void)logString:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6;
- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setHumanReadableFormat:(BOOL)a3;
- (void)setLoggingPriority:(unint64_t)a3;
- (void)toggleByClass:(Class)a3 enable:(BOOL)a4;
- (void)toggleHandler:(id)a3 enable:(BOOL)a4;
@end

@implementation ADLogManager

+ (id)defaultLoggerWithName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [[ADVisualLoggerHandler alloc] initWithName:v3];
  [v4 addHandler:v5];

  v6 = [[ADFileLoggerHandler alloc] initWithName:v3];
  [v4 addHandler:v6];

  return v4;
}

- (int64_t)addHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    [v4 setHumanReadableFormat:v5->_humanReadableFormat];
    [(NSMutableArray *)v5->_handlers addObject:v4];
    [(ADLogManager *)v5 applyConfigurationToNewHandler:v4];
    if ([v4 active]) {
      ++v5->_activeHandlersCounter;
    }
    objc_sync_exit(v5);

    int64_t v6 = 0;
  }
  else
  {
    int64_t v6 = -22953;
  }

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v8 = self;
  objc_sync_enter(v8);
  if ([v7 isEqualToString:kADDeviceConfigurationKeyLoggingHostName])
  {
    v9 = +[ADDeviceConfiguration stringForKey:v7];
    [(ADLogManager *)v8 setHostName:v9];
  }
  if ([v7 isEqualToString:kADDeviceConfigurationKeyLogFolder])
  {
    v10 = +[ADDeviceConfiguration stringForKey:v7];
    [(ADLogManager *)v8 setLogFolder:v10];
  }
  if ([v7 isEqualToString:kADDeviceConfigurationKeyLoggingPriorityForceAll]) {
    v8->_forceAllPriorities = +[ADDeviceConfiguration BOOLForKey:kADDeviceConfigurationKeyLoggingPriorityForceAll];
  }
  if ([v7 isEqualToString:kADDeviceConfigurationKeyEnabledLoggers])
  {
    v11 = +[ADDeviceConfiguration listForKey:v7];
    if (v11) {
      [MEMORY[0x263EFFA08] setWithArray:v11];
    }
    else {
    v12 = [MEMORY[0x263EFFA08] set];
    }
    v13 = (void *)[(NSSet *)v8->_enabledLoggerOverrideSet mutableCopy];
    [v13 minusSet:v12];
    if ([v13 containsObject:@"vz"]) {
      [(ADLogManager *)v8 disableVisualLogging];
    }
    if ([v13 containsObject:@"fl"])
    {
      [(ADLogManager *)v8 disableFileLogging];
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v14 = v13;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v14);
            }
            [(ADLogManager *)v8 disable:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v15);
      }
    }
    v18 = (void *)[(NSSet *)v12 mutableCopy];
    [v18 minusSet:v8->_enabledLoggerOverrideSet];
    if ([v18 containsObject:@"vz"]) {
      [(ADLogManager *)v8 enableVisualLogging];
    }
    if ([v18 containsObject:@"fl"])
    {
      [(ADLogManager *)v8 enableFileLogging];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v19 = v18;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v25;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v19);
            }
            -[ADLogManager enable:](v8, "enable:", *(void *)(*((void *)&v24 + 1) + 8 * j), (void)v24);
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v20);
      }
    }
    enabledLoggerOverrideSet = v8->_enabledLoggerOverrideSet;
    v8->_enabledLoggerOverrideSet = v12;
  }
  objc_sync_exit(v8);
}

- (void)applyConfigurationToNewHandler:(id)a3
{
  id v6 = a3;
  if ([(NSSet *)self->_enabledLoggerOverrideSet containsObject:@"vz"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || [(NSSet *)self->_enabledLoggerOverrideSet containsObject:@"fl"]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (enabledLoggerOverrideSet = self->_enabledLoggerOverrideSet,
        [v6 name],
        v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(enabledLoggerOverrideSet) = [(NSSet *)enabledLoggerOverrideSet containsObject:v5],
        v5,
        enabledLoggerOverrideSet))
  {
    [(ADLogManager *)self toggleHandler:v6 enable:1];
  }
}

- (ADLogManager)initWithHandlers:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ADLogManager;
  v5 = [(ADLogManager *)&v12 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = [MEMORY[0x263EFF980] arrayWithArray:v4];
    }
    else
    {
      uint64_t v6 = objc_opt_new();
    }
    handlers = v5->_handlers;
    v5->_handlers = (NSMutableArray *)v6;

    v5->_activeHandlersCounter = 0;
    v5->_loggingPriority = 0;
    v5->_forceAllPriorities = 0;
    v8 = +[ADDeviceConfiguration sharedConfiguration];
    uint64_t v9 = [MEMORY[0x263EFFA08] set];
    enabledLoggerOverrideSet = v5->_enabledLoggerOverrideSet;
    v5->_enabledLoggerOverrideSet = (NSSet *)v9;

    [v8 addObserver:v5 forKeyPath:kADDeviceConfigurationKeyEnabledLoggers options:7 context:0];
    [v8 addObserver:v5 forKeyPath:kADDeviceConfigurationKeyLoggingHostName options:7 context:0];
    [v8 addObserver:v5 forKeyPath:kADDeviceConfigurationKeyLogFolder options:7 context:0];
    [v8 addObserver:v5 forKeyPath:kADDeviceConfigurationKeyLoggingPriorityForceAll options:7 context:0];
  }
  return v5;
}

- (int64_t)setLogFolder:(id)a3
{
  return 0;
}

- (int64_t)setHostName:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledLoggerOverrideSet, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_logFolder, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
}

- (BOOL)humanReadableFormat
{
  return self->_humanReadableFormat;
}

- (void)setLoggingPriority:(unint64_t)a3
{
  self->_loggingPriority = a3;
}

- (unint64_t)loggingPriority
{
  return self->_loggingPriority;
}

- (void)logMatrix4x4:(__n128)a3 name:(__n128)a4 priority:(__n128)a5 timestamp:(double)a6
{
  __n128 v18 = a4;
  __n128 v19 = a5;
  __n128 v16 = a2;
  __n128 v17 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (*(int *)(a1 + 8) >= 1 && (*(void *)(a1 + 56) >= a9 || *(unsigned char *)(a1 + 48)))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *(id *)(a1 + 16);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", *(_OWORD *)&v16, *(_OWORD *)&v17, *(_OWORD *)&v18, *(_OWORD *)&v19, (void)v20))objc_msgSend(v15, "logMatrix4x4:name:timestamp:", a8, v16.n128_f64[0], v17.n128_f64[0], v18.n128_f64[0], v19.n128_f64[0], a6); {
        }
          }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

- (uint64_t)logMatrix4x4:(void *)a1 name:(const char *)a2 timestamp:(uint64_t)a3
{
  return objc_msgSend(a1, "logMatrix4x4:name:priority:timestamp:", a3, 0);
}

- (void)logMatrix4x3:(double)a3 name:(double)a4 priority:(double)a5 timestamp:(double)a6
{
  if (*((int *)a1 + 2) >= 1 && (*((void *)a1 + 7) >= a8 || *((unsigned char *)a1 + 48))) {
    return (void *)[a1 logMatrix4x4:a3 name:a4 priority:a5 timestamp:a6];
  }
  return a1;
}

- (uint64_t)logMatrix4x3:(void *)a1 name:(const char *)a2 timestamp:(uint64_t)a3
{
  return objc_msgSend(a1, "logMatrix4x3:name:priority:timestamp:", a3, 0);
}

- (uint64_t)logMatrix4x3:(__n128)a3 name:(__n128)a4 priority:(__n128)a5
{
  if (*(int *)(result + 8) >= 1)
  {
    v10 = (void *)result;
    if (*(void *)(result + 56) >= a8 || *(unsigned char *)(result + 48))
    {
      id v11 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
      [v11 systemUptime];
      double v13 = v12;

      return objc_msgSend(v10, "logMatrix4x3:name:priority:timestamp:", a7, a8, v14, v15, v16, v17, v13);
    }
  }
  return result;
}

- (uint64_t)logMatrix4x4:(__n128)a3 name:(__n128)a4 priority:(__n128)a5
{
  if (*(int *)(result + 8) >= 1)
  {
    v10 = (void *)result;
    if (*(void *)(result + 56) >= a8 || *(unsigned char *)(result + 48))
    {
      id v11 = objc_msgSend(MEMORY[0x263F08AB0], "processInfo", *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, *(_OWORD *)&a5);
      [v11 systemUptime];
      double v13 = v12;

      return objc_msgSend(v10, "logMatrix4x4:name:priority:timestamp:", a7, a8, v14, v15, v16, v17, v13);
    }
  }
  return result;
}

- (void)logDictionary:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = self->_handlers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (void)v16)) {
            [v15 logDictionary:v10 name:a4 timestamp:a6];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)logDictionary:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
}

- (void)logDictionary:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  id v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 systemUptime];
    double v10 = v9;

    [(ADLogManager *)self logDictionary:v11 name:a4 priority:a5 timestamp:v10];
  }
}

- (void)logCalibration:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = self->_handlers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (void)v16)) {
            [v15 logCalibration:v10 name:a4 timestamp:a6];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)logCalibration:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
}

- (void)logCalibration:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  id v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 systemUptime];
    double v10 = v9;

    [(ADLogManager *)self logCalibration:v11 name:a4 priority:a5 timestamp:v10];
  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 priority:(unint64_t)a6 timestamp:(double)a7
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a6 || self->_forceAllPriorities))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = self->_handlers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (void)v16)) {
            [v15 logRawBuffer:a3 size:a4 name:a5 timestamp:a7];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 timestamp:(double)a6
{
}

- (void)logRawBuffer:(void *)a3 size:(unint64_t)a4 name:(const char *)a5 priority:(unint64_t)a6
{
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a6 || self->_forceAllPriorities))
  {
    id v11 = [MEMORY[0x263F08AB0] processInfo];
    [v11 systemUptime];
    double v13 = v12;

    [(ADLogManager *)self logRawBuffer:a3 size:a4 name:a5 priority:a6 timestamp:v13];
  }
}

- (void)logString:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = self->_handlers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (void)v16)) {
            [v15 logString:v10 name:a4 timestamp:a6];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)logString:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
}

- (void)logString:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  id v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 systemUptime];
    double v10 = v9;

    [(ADLogManager *)self logString:v11 name:a4 priority:a5 timestamp:v10];
  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = self->_handlers;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          double v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "active", (void)v16)) {
            [v15 logPointCloud:v10 name:a4 timestamp:a6];
          }
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 timestamp:(double)a5
{
}

- (void)logPointCloud:(id)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  id v11 = a3;
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    v8 = [MEMORY[0x263F08AB0] processInfo];
    [v8 systemUptime];
    double v10 = v9;

    [(ADLogManager *)self logPointCloud:v11 name:a4 priority:a5 timestamp:v10];
  }
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 priority:(unint64_t)a5 timestamp:(double)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v9 = self->_handlers;
    uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v13, "active", (void)v14)) {
            [v13 logPixelBuffer:a3 name:a4 timestamp:a6];
          }
        }
        uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 timestamp:(double)a5
{
}

- (void)logPixelBuffer:(__CVBuffer *)a3 name:(const char *)a4 priority:(unint64_t)a5
{
  if (self->_activeHandlersCounter >= 1 && (self->_loggingPriority >= a5 || self->_forceAllPriorities))
  {
    double v9 = [MEMORY[0x263F08AB0] processInfo];
    [v9 systemUptime];
    double v11 = v10;

    [(ADLogManager *)self logPixelBuffer:a3 name:a4 priority:a5 timestamp:v11];
  }
}

- (BOOL)enabled
{
  return self->_activeHandlersCounter > 0;
}

- (void)disableVisualLogging
{
  uint64_t v3 = objc_opt_class();
  [(ADLogManager *)self toggleByClass:v3 enable:0];
}

- (void)enableVisualLogging
{
  uint64_t v3 = objc_opt_class();
  [(ADLogManager *)self toggleByClass:v3 enable:1];
}

- (void)disableFileLogging
{
  uint64_t v3 = objc_opt_class();
  [(ADLogManager *)self toggleByClass:v3 enable:0];
}

- (void)enableFileLogging
{
  uint64_t v3 = objc_opt_class();
  [(ADLogManager *)self toggleByClass:v3 enable:1];
}

- (void)disable:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = v5->_handlers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "name", (void)v13);
        int v12 = [v4 isEqualToString:v11];

        if (v12) {
          [(ADLogManager *)v5 toggleHandler:v10 enable:0];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)enable:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = v5->_handlers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        double v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v11 = objc_msgSend(v10, "name", (void)v14);
        int v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          [(ADLogManager *)v5 toggleHandler:v10 enable:1];
        }
        else
        {
          long long v13 = [v10 name];
          [v4 hasPrefix:v13];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)disableAll
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = v2->_handlers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[ADLogManager toggleHandler:enable:](v2, "toggleHandler:enable:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 0, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)enableAll
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  uint64_t v3 = v2->_handlers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        -[ADLogManager toggleHandler:enable:](v2, "toggleHandler:enable:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)toggleByClass:(Class)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_handlers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_isKindOfClass()) {
          -[ADLogManager toggleHandler:enable:](self, "toggleHandler:enable:", v10, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)toggleHandler:(id)a3 enable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    if (([v6 active] & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v7 name];
        int v16 = 138412290;
        long long v17 = v8;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "enabling logger handler %@", (uint8_t *)&v16, 0xCu);
      }
      ++self->_activeHandlersCounter;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        logFolder = self->_logFolder;
        uint64_t v10 = [v7 name];
        int v16 = 138412546;
        long long v17 = logFolder;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "setting log folder %@ for logger handler %@", (uint8_t *)&v16, 0x16u);
      }
      if ([v7 setLogFolder:self->_logFolder])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          long long v11 = &_os_log_internal;
          long long v12 = "logger handler failed assigning log folder. aborting rest of handlers";
LABEL_20:
          _os_log_error_impl(&dword_215F16000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 2u);
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          hostName = self->_hostName;
          long long v15 = [v7 name];
          int v16 = 138412546;
          long long v17 = hostName;
          __int16 v18 = 2112;
          uint64_t v19 = v15;
          _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "setting host name %@ for logger handler %@", (uint8_t *)&v16, 0x16u);
        }
        if (![v7 setHostName:self->_hostName])
        {
          [v7 preEnable];
          [v7 setActive:1];
          goto LABEL_14;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v16) = 0;
          long long v11 = &_os_log_internal;
          long long v12 = "logger handler failed assigning host name. aborting rest of handlers";
          goto LABEL_20;
        }
      }
    }
  }
  else if ([v6 active])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = [v7 name];
      int v16 = 138412290;
      long long v17 = v13;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "disabling logger handler %@", (uint8_t *)&v16, 0xCu);
    }
    --self->_activeHandlersCounter;
    [v7 setActive:0];
    [v7 postDisable];
  }
LABEL_14:
}

- (id)visualLoggerPrefices
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v4 = self->_handlers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = objc_msgSend(v8, "name", (void)v11);
          [v3 addObject:v9];
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v3 = +[ADDeviceConfiguration sharedConfiguration];
  [v3 removeObserver:self forKeyPath:kADDeviceConfigurationKeyEnabledLoggers context:0];
  [v3 removeObserver:self forKeyPath:kADDeviceConfigurationKeyLoggingHostName context:0];
  [v3 removeObserver:self forKeyPath:kADDeviceConfigurationKeyLogFolder context:0];
  [v3 removeObserver:self forKeyPath:kADDeviceConfigurationKeyLoggingPriorityForceAll context:0];

  v4.receiver = self;
  v4.super_class = (Class)ADLogManager;
  [(ADLogManager *)&v4 dealloc];
}

- (BOOL)getHumanReadableFormat
{
  return self->_humanReadableFormat;
}

- (void)setHumanReadableFormat:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_humanReadableFormat = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v4 = self->_handlers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setHumanReadableFormat:", self->_humanReadableFormat, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (ADLogManager)init
{
  return [(ADLogManager *)self initWithHandlers:0];
}

@end