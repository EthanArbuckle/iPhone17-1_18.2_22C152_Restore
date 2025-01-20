@interface VCRateControlServerBag
+ (id)groupKeysWithMode:(int)a3 primaryKey:(id)a4;
+ (id)keysWithMode:(int)a3;
+ (id)prefixForMode:(int)a3;
+ (id)profileNumberKeyWithMode:(int)a3;
- (BOOL)containsAllSecondaryKeysWithPrimaryKey:(id)a3;
- (NSDictionary)serverBagDictionary;
- (NSNumber)experimentGroupIndex;
- (VCRateControlServerBag)initWithMode:(int)a3 serverBagDict:(id)a4;
- (id)getExperimentConfig:(unsigned __int8)a3 defaultValue:(id)a4;
- (id)getExperimentValueForKey:(id)a3;
- (id)valueForSecondaryKeyWithPrimaryKey:(id)a3 secondaryKey:(id)a4 type:(int)a5;
- (id)valueForType:(int)a3 value:(id)a4;
- (int)experimentVersion;
- (void)dealloc;
@end

@implementation VCRateControlServerBag

+ (id)keysWithMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3 == 6 || v3 == 1)
  {
    v6 = (void *)[&unk_1F3DC8DE0 allKeys];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(a1, "groupKeysWithMode:primaryKey:", v3, *(void *)(*((void *)&v15 + 1) + 8 * v10++)));
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }
      while (v8);
    }
    return v5;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v20 = v12;
        __int16 v21 = 2080;
        v22 = "+[VCRateControlServerBag keysWithMode:]";
        __int16 v23 = 1024;
        int v24 = 81;
        __int16 v25 = 1024;
        int v26 = v3;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Unsupported operating mode %d", buf, 0x22u);
      }
    }

    return (id)MEMORY[0x1E4F1CBF0];
  }
}

+ (id)profileNumberKeyWithMode:(int)a3
{
  return (id)[NSString stringWithFormat:@"%@-%@-%@", objc_msgSend(a1, "prefixForMode:", *(void *)&a3), @"profile", @"profileNumber"];
}

+ (id)groupKeysWithMode:(int)a3 primaryKey:(id)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  switch(v5)
  {
    case 1:
      uint64_t v8 = &unk_1F3DC8E08;
      goto LABEL_7;
    case 8:
      uint64_t v8 = &unk_1F3DC8E58;
      goto LABEL_7;
    case 6:
      uint64_t v8 = &unk_1F3DC8E30;
LABEL_7:
      int v23 = v5;
      uint64_t v9 = [a1 prefixForMode:v5];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = (id)[v8 objectForKey:a4];
      uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v35 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v37;
        do
        {
          uint64_t v13 = 0;
          do
          {
            if (*(void *)v37 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = (void *)[NSString stringWithFormat:@"%@-%@-%@", v9, a4, *(void *)(*((void *)&v36 + 1) + 8 * v13)];
            [v7 addObject:v14];
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v15 = VRTraceErrorLogLevelToCSTR();
              long long v16 = *MEMORY[0x1E4F47A50];
              long long v17 = *MEMORY[0x1E4F47A50];
              if (*MEMORY[0x1E4F47A40])
              {
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v18 = [v14 UTF8String];
                  *(_DWORD *)buf = 136316162;
                  uint64_t v26 = v15;
                  __int16 v27 = 2080;
                  v28 = "+[VCRateControlServerBag groupKeysWithMode:primaryKey:]";
                  __int16 v29 = 1024;
                  int v30 = 124;
                  __int16 v31 = 2080;
                  uint64_t v32 = v18;
                  __int16 v33 = 1024;
                  int v34 = v23;
                  _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Adding key:%s for mode %d", buf, 0x2Cu);
                }
              }
              else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v19 = [v14 UTF8String];
                *(_DWORD *)buf = 136316162;
                uint64_t v26 = v15;
                __int16 v27 = 2080;
                v28 = "+[VCRateControlServerBag groupKeysWithMode:primaryKey:]";
                __int16 v29 = 1024;
                int v30 = 124;
                __int16 v31 = 2080;
                uint64_t v32 = v19;
                __int16 v33 = 1024;
                int v34 = v23;
                _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, "AVCRC [%s] %s:%d Adding key:%s for mode %d", buf, 0x2Cu);
              }
            }
            ++v13;
          }
          while (v11 != v13);
          uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v35 count:16];
        }
        while (v11);
      }
      return v7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = v21;
      __int16 v27 = 2080;
      v28 = "+[VCRateControlServerBag groupKeysWithMode:primaryKey:]";
      __int16 v29 = 1024;
      int v30 = 116;
      __int16 v31 = 1024;
      LODWORD(v32) = v5;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Unsupported operating mode %d", buf, 0x22u);
    }
  }

  return 0;
}

+ (id)prefixForMode:(int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 8:
      v4 = NSString;
      uint64_t v5 = @"sidecar";
      return (id)[v4 stringWithFormat:@"%@-%@-%@", @"vc", @"vcrc", v5];
    case 6:
      v4 = NSString;
      uint64_t v5 = @"groupFaceTime";
      return (id)[v4 stringWithFormat:@"%@-%@-%@", @"vc", @"vcrc", v5];
    case 1:
      v4 = NSString;
      uint64_t v5 = @"faceTime";
      return (id)[v4 stringWithFormat:@"%@-%@-%@", @"vc", @"vcrc", v5];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v10 = v7;
      __int16 v11 = 2080;
      uint64_t v12 = "+[VCRateControlServerBag prefixForMode:]";
      __int16 v13 = 1024;
      int v14 = 142;
      __int16 v15 = 1024;
      int v16 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Unsupported operating mode %d", buf, 0x22u);
    }
  }
  return &stru_1F3D3E450;
}

- (VCRateControlServerBag)initWithMode:(int)a3 serverBagDict:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)VCRateControlServerBag;
  v6 = [(VCRateControlServerBag *)&v19 init];
  if (!v6) {
    return v6;
  }
  if (a3 > 8 || ((1 << a3) & 0x142) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_15;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315906;
    uint64_t v21 = v16;
    __int16 v22 = 2080;
    int v23 = "-[VCRateControlServerBag initWithMode:serverBagDict:]";
    __int16 v24 = 1024;
    int v25 = 155;
    __int16 v26 = 1024;
    int v27 = a3;
    __int16 v13 = "AVCRC [%s] %s:%d Unsupported operating mode %d";
    int v14 = v17;
    uint32_t v15 = 34;
    goto LABEL_14;
  }
  if (![a4 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_15;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v21 = v11;
    __int16 v22 = 2080;
    int v23 = "-[VCRateControlServerBag initWithMode:serverBagDict:]";
    __int16 v24 = 1024;
    int v25 = 161;
    __int16 v13 = "AVCRC [%s] %s:%d Server bag dictionary is empty.";
    int v14 = v12;
    uint32_t v15 = 28;
LABEL_14:
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_15:

    return 0;
  }
  v6->_operatingMode = a3;
  v6->_serverBagDict = (NSDictionary *)a4;
  v6->_experimentGroupIndex = (NSNumber *)&unk_1F3DC5D00;
  v6->_BOOL experimentEnabled = VCDefaults_GetBoolValueForKey(@"enableVCRateControlExperiment", 1);
  v6->_defaultExperimentConfigString = (NSString *)VCDefaults_CopyStringValueForKey(@"vcrcExperimentConfig");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    uint64_t v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL experimentEnabled = v6->_experimentEnabled;
      uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "allKeys"), "description"), "UTF8String");
      *(_DWORD *)buf = 136316418;
      uint64_t v21 = v7;
      __int16 v22 = 2080;
      int v23 = "-[VCRateControlServerBag initWithMode:serverBagDict:]";
      __int16 v24 = 1024;
      int v25 = 171;
      __int16 v26 = 1024;
      int v27 = a3;
      __int16 v28 = 1024;
      BOOL v29 = experimentEnabled;
      __int16 v30 = 2080;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d operatingMode=%d, experimentEnabled=%d, keys=%s", buf, 0x32u);
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCRateControlServerBag;
  [(VCRateControlServerBag *)&v3 dealloc];
}

- (BOOL)containsAllSecondaryKeysWithPrimaryKey:(id)a3
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", -[NSDictionary allKeys](self->_serverBagDict, "allKeys"));
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 1, &stru_1F3D3E450), "componentsSeparatedByString:", @","));
  id v6 = +[VCRateControlServerBag groupKeysWithMode:self->_operatingMode primaryKey:a3];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v6];
  uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  return [v7 isSubsetOfSet:v8];
}

- (id)valueForType:(int)a3 value:(id)a4
{
  if (a3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateControlServerBag valueForType:value:](v8, v9);
      }
    }
    return &unk_1F3DC5D00;
  }
  else
  {
    id result = a4;
    if (a3 == 2)
    {
      id v5 = NSNumber;
      [a4 doubleValue];
      double v7 = 100.0;
    }
    else
    {
      if (a3 != 1) {
        return result;
      }
      id v5 = NSNumber;
      [a4 doubleValue];
      double v7 = 1000.0;
    }
    double v10 = v6 / v7;
    return (id)[v5 numberWithDouble:v10];
  }
}

- (id)valueForSecondaryKeyWithPrimaryKey:(id)a3 secondaryKey:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v8 = (void *)[NSString stringWithFormat:@"%@-%@-%@", +[VCRateControlServerBag prefixForMode:](VCRateControlServerBag, "prefixForMode:", self->_operatingMode), a3, a4];
  if ([a3 isEqualToString:@"experiment"])
  {
    if (![(NSDictionary *)self->_serverBagDict objectForKeyedSubscript:v8]) {
      return &stru_1F3D3E450;
    }
    goto LABEL_6;
  }
  id v10 = [(VCRateControlServerBag *)self getExperimentValueForKey:v8];
  if (v10)
  {
LABEL_7:
    return [(VCRateControlServerBag *)self valueForType:v5 value:v10];
  }
  if ([(NSDictionary *)self->_serverBagDict objectForKeyedSubscript:v8])
  {
LABEL_6:
    id v10 = [(NSDictionary *)self->_serverBagDict objectForKeyedSubscript:v8];
    goto LABEL_7;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:](v11, v8, v12);
    }
  }
  return &unk_1F3DC5D00;
}

- (id)getExperimentConfig:(unsigned __int8)a3 defaultValue:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_experimentEnabled)
  {
    unsigned int v5 = a3;
    double v7 = [(VCRateControlServerBag *)self valueForSecondaryKeyWithPrimaryKey:@"experiment" secondaryKey:@"experimentConfig" type:0];
    defaultExperimentConfigString = self->_defaultExperimentConfigString;
    if (defaultExperimentConfigString)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        id v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 136315906;
          uint64_t v13 = v9;
          __int16 v14 = 2080;
          uint32_t v15 = "-[VCRateControlServerBag getExperimentConfig:defaultValue:]";
          __int16 v16 = 1024;
          int v17 = 232;
          __int16 v18 = 2112;
          objc_super v19 = defaultExperimentConfigString;
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d Use default experiment string:%@", (uint8_t *)&v12, 0x26u);
        }
      }
    }
    else
    {
      defaultExperimentConfigString = v7;
    }
    if (![(NSString *)defaultExperimentConfigString isEqualToString:&stru_1F3D3E450]) {
      return -[NSArray objectAtIndexedSubscript:]([(NSString *)defaultExperimentConfigString componentsSeparatedByString:@";"],
    }
               "objectAtIndexedSubscript:",
               v5);
  }
  return a4;
}

- (int)experimentVersion
{
  int result = [(VCRateControlServerBag *)self containsAllSecondaryKeysWithPrimaryKey:@"experiment"];
  if (result)
  {
    id v4 = [(VCRateControlServerBag *)self getExperimentConfig:0 defaultValue:@"0"];
    return [v4 intValue];
  }
  return result;
}

- (NSNumber)experimentGroupIndex
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSNumber *)self->_experimentGroupIndex isEqualToNumber:&unk_1F3DC5D00];
  experimentGroupIndex = self->_experimentGroupIndex;
  if (!v3)
  {
    double v6 = experimentGroupIndex;
    goto LABEL_8;
  }
  self->_experimentGroupIndex = (NSNumber *)&unk_1F3DC5D18;
  CFRetain(&unk_1F3DC5D18);
  if (experimentGroupIndex) {
    CFRelease(experimentGroupIndex);
  }
  if (![(VCRateControlServerBag *)self containsAllSecondaryKeysWithPrimaryKey:@"experiment"])return self->_experimentGroupIndex; {
  id v5 = [(VCRateControlServerBag *)self getExperimentConfig:2 defaultValue:&stru_1F3D3E450];
  }
  if (![v5 isEqualToString:&stru_1F3D3E450])
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithArray:", objc_msgSend(v5, "componentsSeparatedByString:", @","));
    objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", 0), "doubleValue");
    if (v9 < 0.05) {
      [v8 setObject:&unk_1F3DC8B60 atIndexedSubscript:0];
    }
    uint32_t v10 = arc4random();
    if ([v8 count])
    {
      uint64_t v11 = 0;
      unsigned __int8 v12 = 0;
      double v13 = (double)v10 / 4294967300.0;
      double v14 = 0.0;
      while (1)
      {
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v11), "doubleValue");
        double v14 = v14 + v15;
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v11), "doubleValue");
        if (v16 >= 0.05 && v13 <= v14) {
          break;
        }
        uint64_t v11 = ++v12;
        if ([v8 count] <= (unint64_t)v12) {
          goto LABEL_29;
        }
      }
      __int16 v18 = self->_experimentGroupIndex;
      objc_super v19 = (NSNumber *)[NSNumber numberWithUnsignedChar:v12];
      self->_experimentGroupIndex = v19;
      if (v19) {
        CFRetain(v19);
      }
      if (v18) {
        CFRelease(v18);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        uint64_t v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v22 = 136316418;
          uint64_t v23 = v20;
          __int16 v24 = 2080;
          int v25 = "-[VCRateControlServerBag experimentGroupIndex]";
          __int16 v26 = 1024;
          int v27 = 274;
          __int16 v28 = 1024;
          int v29 = v12;
          __int16 v30 = 2112;
          id v31 = v5;
          __int16 v32 = 2048;
          double v33 = v13;
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d VCRC Experiment groupIndex=%d populationDistribution=%@ randomValue=%f", (uint8_t *)&v22, 0x36u);
        }
      }
    }
LABEL_29:

    return self->_experimentGroupIndex;
  }
  double v6 = self->_experimentGroupIndex;
LABEL_8:

  return v6;
}

- (id)getExperimentValueForKey:(id)a3
{
  id v5 = [(VCRateControlServerBag *)self experimentGroupIndex];
  if ([(NSNumber *)v5 isEqualToNumber:&unk_1F3DC5D00]) {
    return 0;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 1, &stru_1F3D3E450), "componentsSeparatedByString:", @","), "indexOfObject:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v8 = v6;
  double v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[VCRateControlServerBag getExperimentConfig:defaultValue:](self, "getExperimentConfig:defaultValue:", 3, &stru_1F3D3E450), "componentsSeparatedByString:", @","), "objectAtIndexedSubscript:", -[NSNumber unsignedIntValue](v5, "unsignedIntValue")), "componentsSeparatedByString:", @"_");

  return (id)[v9 objectAtIndexedSubscript:v8];
}

- (NSDictionary)serverBagDictionary
{
  return self->_serverBagDict;
}

- (void)valueForType:(uint64_t)a1 value:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = 136315906;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[VCRateControlServerBag valueForType:value:]";
  __int16 v6 = 1024;
  int v7 = 200;
  __int16 v8 = 1024;
  int v9 = -1;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, "AVCRC [%s] %s:%d Invalid type=%d", (uint8_t *)&v2, 0x22u);
}

- (void)valueForSecondaryKeyWithPrimaryKey:(uint64_t)a1 secondaryKey:(void *)a2 type:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[VCRateControlServerBag valueForSecondaryKeyWithPrimaryKey:secondaryKey:type:]";
  __int16 v8 = 1024;
  int v9 = 218;
  __int16 v10 = 2080;
  uint64_t v11 = [a2 UTF8String];
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, "AVCRC [%s] %s:%d Could not find key %s in VCRC Server Bag!", (uint8_t *)&v4, 0x26u);
}

@end