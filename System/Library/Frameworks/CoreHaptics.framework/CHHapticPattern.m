@interface CHHapticPattern
+ (id)addHapticsForWheelsOfTime:(id)a3;
+ (id)eventListFromEvents:(id)a3 parameters:(id)a4 parameterCurves:(id)a5 engine:(id)a6 privileged:(BOOL)a7;
+ (id)patternForKey:(id)a3 error:(id *)a4;
- (BOOL)doInitWithDictionary:(id)a3 error:(id *)a4;
- (CHHapticPattern)init;
- (CHHapticPattern)initWithContentsOfURL:(NSURL *)ahapURL error:(NSError *)outError;
- (CHHapticPattern)initWithDictionary:(NSDictionary *)patternDict error:(NSError *)outError;
- (CHHapticPattern)initWithEvents:(NSArray *)events parameterCurves:(NSArray *)parameterCurves error:(NSError *)outError;
- (CHHapticPattern)initWithEvents:(NSArray *)events parameters:(NSArray *)parameters error:(NSError *)outError;
- (NSArray)events;
- (NSArray)parameterCurves;
- (NSArray)parameters;
- (NSDictionary)configurationDictionary;
- (NSDictionary)exportDictionaryAndReturnError:(NSError *)outError;
- (NSString)audioPowerUsage;
- (NSString)hapticPowerUsage;
- (NSString)locality;
- (NSString)patternID;
- (NSString)priority;
- (NSString)usageCategory;
- (NSTimeInterval)duration;
- (float)version;
- (id)eventListFromDictionary:(id)a3 error:(id *)a4;
- (id)exportDictionaryWithConfigurationAndReturnError:(id *)a3;
- (id)resolveExternalResources:(id)a3 error:(id *)a4;
@end

@implementation CHHapticPattern

- (NSTimeInterval)duration
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  v3 = self->_events;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v47 objects:v54 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v48;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v48 != v5) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        [v8 fullDuration];
        double v10 = v9;
        [v8 relativeTime];
        if (v10 + v11 > v6)
        {
          [v8 relativeTime];
          double v6 = v10 + v12;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v13 = self->_parameters;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v44 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        [v17 relativeTime];
        if (v18 > v6)
        {
          [v17 relativeTime];
          double v6 = v19;
        }
      }
      uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
    }
    while (v14);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v20 = self->_parameterCurves;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v39 + 1) + 8 * k);
        [v24 relativeTime];
        double v26 = v25;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        v27 = objc_msgSend(v24, "controlPoints", 0);
        uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v51 count:16];
        if (v28)
        {
          uint64_t v29 = *(void *)v36;
          do
          {
            for (uint64_t m = 0; m != v28; ++m)
            {
              if (*(void *)v36 != v29) {
                objc_enumerationMutation(v27);
              }
              v31 = *(void **)(*((void *)&v35 + 1) + 8 * m);
              [v31 relativeTime];
              if (v26 + v32 > v6)
              {
                [v31 relativeTime];
                double v6 = v26 + v33;
              }
            }
            uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v51 count:16];
          }
          while (v28);
        }
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v21);
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterCurves, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_embeddedResourceInfo, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_patternID, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_ahapBaseURL, 0);
}

+ (id)eventListFromEvents:(id)a3 parameters:(id)a4 parameterCurves:(id)a5 engine:(id)a6 privileged:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v35 = a4;
  id v34 = a5;
  id v12 = a6;
  double v32 = v11;
  if (v7)
  {
    id v33 = +[CHHapticPattern addHapticsForWheelsOfTime:v11];
  }
  else
  {
    id v33 = v11;
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v35, "count") + objc_msgSend(v33, "count") + objc_msgSend(v34, "count"));
  uint64_t v14 = [HapticCommandConverter alloc];
  uint64_t v15 = [v12 serverConfig];
  v16 = [(HapticCommandConverter *)v14 initWithServerConfig:v15];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = v35;
  uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = [(HapticCommandConverter *)v16 eventForDynamicParameterEntry:*(void *)(*((void *)&v45 + 1) + 8 * i)];
        if (v20) {
          [v13 addObject:v20];
        }
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v17);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v21 = v34;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v21);
        }
        double v25 = [(HapticCommandConverter *)v16 eventForParameterCurveEntry:*(void *)(*((void *)&v41 + 1) + 8 * j)];
        if (v25) {
          [v13 addObject:v25];
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v22);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v26 = v33;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v27; ++k)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v26);
        }
        v30 = [(HapticCommandConverter *)v16 eventForEventEntry:*(void *)(*((void *)&v37 + 1) + 8 * k) engine:v12 privileged:v7];
        if (v30) {
          [v13 addObject:v30];
        }
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v27);
  }

  return v13;
}

- (NSArray)parameterCurves
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_parameterCurves];
}

- (id)resolveExternalResources:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v6 = [v36 serverConfig];
  int v34 = [v6 supportsAudioPlayback];

  unint64_t v7 = 0;
  *(void *)&long long v8 = 136315650;
  long long v33 = v8;
  while (1)
  {
    double v9 = [(CHHapticPattern *)self events];
    BOOL v10 = v7 < [v9 count];

    if (!v10)
    {
      v31 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
      goto LABEL_27;
    }
    id v11 = [(CHHapticPattern *)self events];
    id v12 = [v11 objectAtIndexedSubscript:v7];

    v13 = [v12 type];
    if ([v13 isEqualToString:CHHapticEventTypeAudioResourceIndex]) {
      break;
    }
    if ([v13 isEqualToString:CHHapticEventTypeAudioCustom])
    {
      char v25 = objc_msgSend(v36, "doReferenceAudioResourceByID:", objc_msgSend(v12, "audioResID"));
      char v26 = a4 ? v25 : 1;
      if ((v26 & 1) == 0)
      {
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4824 userInfo:0];
        goto LABEL_26;
      }
    }
    [v5 addObject:v12];
LABEL_22:

    ++v7;
  }
  if (!v34)
  {
    if (kHAPIScope)
    {
      uint64_t v27 = *(id *)kHAPIScope;
      if (!v27)
      {
LABEL_20:
        uint64_t v29 = [CHHapticEvent alloc];
        CHHapticEventType v30 = CHHapticEventTypeAudioContinuous;
        uint64_t v17 = [v12 eventParameters];
        [v12 relativeTime];
        double v19 = -[CHHapticEvent initWithEventType:parameters:relativeTime:duration:](v29, "initWithEventType:parameters:relativeTime:duration:", v30, v17);
        [v5 addObject:v19];
        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v27 = MEMORY[0x1E4F14500];
      id v28 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v33;
      long long v38 = "CHHapticPattern.mm";
      __int16 v39 = 1024;
      int v40 = 365;
      __int16 v41 = 2080;
      long long v42 = "-[CHHapticPattern resolveExternalResources:error:]";
      _os_log_impl(&dword_1BA902000, v27, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: WARNING: Skipping Custom Audio event - server does not support audio", buf, 0x1Cu);
    }

    goto LABEL_20;
  }
  uint64_t v14 = [v12 audioResID];
  uint64_t v15 = [(NSMutableArray *)self->_embeddedResourceInfo objectAtIndexedSubscript:v14];
  v16 = [v15 url];
  uint64_t v17 = FullURLPathFromURL(v16, self->_ahapBaseURL);

  uint64_t v18 = [(NSMutableArray *)self->_embeddedResourceInfo objectAtIndexedSubscript:v14];
  double v19 = [v18 options];

  v20 = [v36 player];
  unint64_t v21 = +[CHHapticEngine doRegisterAudioResource:v17 options:v19 fromPattern:1 player:v20 error:a4];

  if (v21)
  {
    uint64_t v22 = [CHHapticEvent alloc];
    uint64_t v23 = [v12 eventParameters];
    [v12 relativeTime];
    v24 = -[CHHapticEvent initWithAudioResourceID:parameters:relativeTime:](v22, "initWithAudioResourceID:parameters:relativeTime:", v21, v23);
    [v5 addObject:v24];

LABEL_21:
    goto LABEL_22;
  }

LABEL_26:
  v31 = 0;
LABEL_27:

  return v31;
}

- (NSArray)events
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_events];
}

- (CHHapticPattern)initWithEvents:(NSArray *)events parameters:(NSArray *)parameters error:(NSError *)outError
{
  unint64_t v7 = events;
  long long v8 = parameters;
  setupHapticLogScopes();
  v15.receiver = self;
  v15.super_class = (Class)CHHapticPattern;
  double v9 = [(CHHapticPattern *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
    id v11 = v9->_events;
    v9->_events = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8];
    v13 = v9->_parameters;
    v9->_parameters = (NSMutableArray *)v12;
  }
  return v9;
}

- (NSString)patternID
{
  return self->_patternID;
}

- (NSArray)parameters
{
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithArray:self->_parameters];
}

+ (id)addHapticsForWheelsOfTime:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  uint64_t v55 = 0;
  id v37 = a3;
  +[CHHapticEvent parameterValuesFromLegacyEventType:26453 sharpness:(char *)&v55 + 4 fullness:&v55 error:0];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  obuint64_t j = (id)[v37 mutableCopy];
  uint64_t v4 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v4)
  {
    uint64_t v44 = *(void *)v52;
    do
    {
      uint64_t v45 = v4;
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v52 != v44) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        unint64_t v7 = [v6 type];
        int v8 = [v7 isEqualToString:CHHapticEventTypeWheelsOfTime];

        if (v8)
        {
          [v6 relativeTime];
          double v10 = v9;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v11 = [v6 eventParameters];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v58 count:16];
          float v13 = -1.0;
          if (v12)
          {
            uint64_t v14 = *(void *)v48;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v48 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                uint64_t v17 = [v16 parameterID];
                int v18 = [v17 isEqualToString:CHHapticEventParameterIDHapticIntensity];

                if (v18)
                {
                  [v16 value];
                  float v13 = v19;
                  goto LABEL_17;
                }
              }
              uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v58 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
LABEL_17:

          v20 = [CHHapticEvent alloc];
          CHHapticEventType v21 = CHHapticEventTypeHapticTransient;
          uint64_t v22 = [CHHapticEventParameter alloc];
          if (v13 < 0.0)
          {
            LODWORD(v23) = HIDWORD(v55);
            uint64_t v42 = [(CHHapticEventParameter *)v22 initWithParameterID:CHHapticEventParameterIDHapticSharpnessSelect value:v23];
            v56[0] = v42;
            uint64_t v29 = [CHHapticEventParameter alloc];
            LODWORD(v30) = v55;
            uint64_t v41 = [(CHHapticEventParameter *)v29 initWithParameterID:CHHapticEventParameterIDHapticFullnessSelect value:v30];
            v56[1] = v41;
            uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
            v3 = (void *)v28;
          }
          else
          {
            *(float *)&double v23 = v13;
            uint64_t v43 = [(CHHapticEventParameter *)v22 initWithParameterID:CHHapticEventParameterIDHapticIntensity value:v23];
            v57[0] = v43;
            v24 = [CHHapticEventParameter alloc];
            LODWORD(v25) = HIDWORD(v55);
            uint64_t v40 = [(CHHapticEventParameter *)v24 initWithParameterID:CHHapticEventParameterIDHapticSharpnessSelect value:v25];
            v57[1] = v40;
            char v26 = [CHHapticEventParameter alloc];
            LODWORD(v27) = v55;
            uint64_t v39 = [(CHHapticEventParameter *)v26 initWithParameterID:CHHapticEventParameterIDHapticFullnessSelect value:v27];
            v57[2] = v39;
            uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
            long long v38 = (void *)v28;
          }
          float v31 = v10;
          double v32 = [(CHHapticEvent *)v20 initWithEventType:v21 parameters:v28 relativeTime:v31];
          long long v33 = v3;
          id v35 = (void *)v41;
          int v34 = (void *)v42;
          if (v13 >= 0.0)
          {

            long long v33 = (void *)v39;
            id v35 = (void *)v40;
            int v34 = (void *)v43;
          }

          [obj addObject:v32];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v4);
  }

  return obj;
}

- (float)version
{
  [(NSNumber *)self->_version floatValue];
  return result;
}

- (NSString)locality
{
  return (NSString *)[(NSDictionary *)self->_configurationDictionary objectForKey:@"Locality"];
}

- (NSString)priority
{
  return (NSString *)[(NSDictionary *)self->_configurationDictionary objectForKey:@"Priority"];
}

- (NSString)hapticPowerUsage
{
  return (NSString *)[(NSDictionary *)self->_configurationDictionary objectForKey:@"HapticPowerUsage"];
}

- (NSString)audioPowerUsage
{
  return (NSString *)[(NSDictionary *)self->_configurationDictionary objectForKey:@"AudioPowerUsage"];
}

- (NSString)usageCategory
{
  return (NSString *)[(NSDictionary *)self->_configurationDictionary objectForKey:@"UsageCategory"];
}

- (CHHapticPattern)init
{
  return 0;
}

- (CHHapticPattern)initWithEvents:(NSArray *)events parameterCurves:(NSArray *)parameterCurves error:(NSError *)outError
{
  unint64_t v7 = events;
  int v8 = parameterCurves;
  setupHapticLogScopes();
  v15.receiver = self;
  v15.super_class = (Class)CHHapticPattern;
  double v9 = [(CHHapticPattern *)&v15 init];
  if (v9)
  {
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v7];
    id v11 = v9->_events;
    v9->_events = (NSMutableArray *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v8];
    float v13 = v9->_parameterCurves;
    v9->_parameterCurves = (NSMutableArray *)v12;
  }
  return v9;
}

- (CHHapticPattern)initWithDictionary:(NSDictionary *)patternDict error:(NSError *)outError
{
  double v6 = patternDict;
  setupHapticLogScopes();
  v10.receiver = self;
  v10.super_class = (Class)CHHapticPattern;
  unint64_t v7 = [(CHHapticPattern *)&v10 init];
  int v8 = v7;
  if (v7 && ![(CHHapticPattern *)v7 doInitWithDictionary:v6 error:outError])
  {

    int v8 = 0;
  }

  return v8;
}

- (BOOL)doInitWithDictionary:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = objc_alloc_init(HapticDictionaryReader);
  int v8 = [(HapticDictionaryReader *)v7 readAndVerifyVersion:v6 error:a4];
  version = self->_version;
  self->_version = v8;

  if (!self->_version)
  {
    BOOL v12 = 0;
    goto LABEL_16;
  }
  [(CHHapticPattern *)self version];
  if (v10 > 1.0)
  {
    if (kHAPIScope)
    {
      id v11 = *(id *)kHAPIScope;
      if (!v11)
      {
LABEL_11:
        uint64_t v14 = [(HapticDictionaryReader *)v7 parseConfiguration:v6 error:a4];
        configurationDictionary = self->_configurationDictionary;
        self->_configurationDictionary = v14;

        goto LABEL_12;
      }
    }
    else
    {
      id v11 = MEMORY[0x1E4F14500];
      id v13 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(void *)&uint8_t buf[4] = "CHHapticPattern.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 151;
      *(_WORD *)&buf[18] = 2080;
      *(_DWORD *)buf = 136315906;
      *(void *)&buf[20] = "-[CHHapticPattern doInitWithDictionary:error:]";
      *(_WORD *)&buf[28] = 2048;
      *(void *)&buf[30] = 0x3FF0000000000000;
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Pattern version > %.1f - looking for config dictionary", buf, 0x26u);
    }

    goto LABEL_11;
  }
LABEL_12:
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = __Block_byref_object_copy__2;
  *(void *)&buf[32] = __Block_byref_object_dispose__2;
  id v23 = 0;
  v16 = [(HapticDictionaryReader *)v7 scanForEmbeddedResources:v6];
  embeddedResourceInfo = self->_embeddedResourceInfo;
  self->_embeddedResourceInfo = v16;

  ahapBaseURL = self->_ahapBaseURL;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__CHHapticPattern_doInitWithDictionary_error___block_invoke;
  v21[3] = &unk_1E622E468;
  v21[4] = self;
  v21[5] = buf;
  [(HapticDictionaryReader *)v7 parseEventsAndParameters:v6 withBaseURL:ahapBaseURL reply:v21];
  float v19 = *(void **)(*(void *)&buf[8] + 40);
  BOOL v12 = v19 == 0;
  if (a4 && v19) {
    *a4 = v19;
  }
  _Block_object_dispose(buf, 8);

LABEL_16:
  return v12;
}

void __46__CHHapticPattern_doInitWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 48);
  *(void *)(v13 + 48) = v9;
  id v23 = v9;

  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = v10;
  id v17 = v10;

  uint64_t v18 = *(void *)(a1 + 32);
  float v19 = *(void **)(v18 + 64);
  *(void *)(v18 + 64) = v11;
  id v20 = v11;

  uint64_t v21 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v12;
}

- (CHHapticPattern)initWithContentsOfURL:(NSURL *)ahapURL error:(NSError *)outError
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = ahapURL;
  setupHapticLogScopes();
  v31.receiver = self;
  v31.super_class = (Class)CHHapticPattern;
  unint64_t v7 = [(CHHapticPattern *)&v31 init];
  if (v7)
  {
    uint64_t v8 = [(NSURL *)v6 URLByDeletingLastPathComponent];
    ahapBaseURL = v7->_ahapBaseURL;
    v7->_ahapBaseURL = (NSURL *)v8;

    if ([(NSURL *)v6 isFileURL])
    {
      id v10 = [(NSURL *)v6 path];
      id v11 = [v10 pathExtension];
      if ([v11 isEqualToString:@"json"])
      {

        goto LABEL_9;
      }
      uint64_t v14 = [(NSURL *)v6 path];
      uint64_t v15 = [v14 pathExtension];
      int v16 = [v15 isEqualToString:@"ahap"];

      if (v16)
      {
LABEL_9:
        id v17 = (void *)MEMORY[0x1E4F1C9B8];
        uint64_t v18 = [(NSURL *)v6 path];
        float v19 = [v17 dataWithContentsOfFile:v18];

        id v30 = 0;
        id v20 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v19 options:0 error:&v30];
        id v21 = v30;

        if (v20)
        {
          id v29 = v21;
          BOOL v22 = [(CHHapticPattern *)v7 doInitWithDictionary:v20 error:&v29];
          id v23 = v29;

          id v21 = v23;
          if (v22)
          {
            if (!outError) {
              goto LABEL_29;
            }
            goto LABEL_28;
          }
LABEL_27:

          unint64_t v7 = 0;
          if (!outError)
          {
LABEL_29:

            goto LABEL_30;
          }
LABEL_28:
          *outError = (NSError *)v21;
          goto LABEL_29;
        }
LABEL_19:
        if (kHAPIScope)
        {
          double v25 = *(id *)kHAPIScope;
          if (!v25)
          {
LABEL_26:
            id v20 = 0;
            goto LABEL_27;
          }
        }
        else
        {
          double v25 = MEMORY[0x1E4F14500];
          id v26 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          long long v33 = "CHHapticPattern.mm";
          __int16 v34 = 1024;
          int v35 = 212;
          __int16 v36 = 2080;
          id v37 = "-[CHHapticPattern initWithContentsOfURL:error:]";
          __int16 v38 = 2112;
          id v39 = v21;
          _os_log_impl(&dword_1BA902000, v25, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: AHAP dictionary is corrupt: %@", buf, 0x26u);
        }

        goto LABEL_26;
      }
      if (kHAPIScope)
      {
        id v12 = *(id *)kHAPIScope;
        if (!v12)
        {
          uint64_t v13 = -4809;
          goto LABEL_18;
        }
      }
      else
      {
        id v12 = MEMORY[0x1E4F14500];
        id v28 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v33 = "CHHapticPattern.mm";
        __int16 v34 = 1024;
        int v35 = 197;
        __int16 v36 = 2080;
        id v37 = "-[CHHapticPattern initWithContentsOfURL:error:]";
        _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: File type is not supported", buf, 0x1Cu);
      }
      uint64_t v13 = -4809;
    }
    else
    {
      if (kHAPIScope)
      {
        id v12 = *(id *)kHAPIScope;
        if (!v12)
        {
          uint64_t v13 = -4851;
LABEL_18:
          id v21 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:v13 userInfo:0];

          unint64_t v7 = 0;
          goto LABEL_19;
        }
      }
      else
      {
        id v12 = MEMORY[0x1E4F14500];
        id v24 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        long long v33 = "CHHapticPattern.mm";
        __int16 v34 = 1024;
        int v35 = 202;
        __int16 v36 = 2080;
        id v37 = "-[CHHapticPattern initWithContentsOfURL:error:]";
        _os_log_impl(&dword_1BA902000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Incoming URL not a valid file path", buf, 0x1Cu);
      }
      uint64_t v13 = -4851;
    }

    goto LABEL_18;
  }
LABEL_30:

  return v7;
}

- (NSDictionary)exportDictionaryAndReturnError:(NSError *)outError
{
  uint64_t v4 = objc_alloc_init(HapticDictionaryWriter);
  id v5 = [(HapticDictionaryWriter *)v4 patternToDictionary:self->_version events:self->_events parameters:self->_parameters parameterCurves:self->_parameterCurves embeddedResourceInfo:self->_embeddedResourceInfo configuration:0];

  return (NSDictionary *)v5;
}

- (id)exportDictionaryWithConfigurationAndReturnError:(id *)a3
{
  uint64_t v4 = objc_alloc_init(HapticDictionaryWriter);
  id v5 = [(HapticDictionaryWriter *)v4 patternToDictionary:self->_version events:self->_events parameters:self->_parameters parameterCurves:self->_parameterCurves embeddedResourceInfo:self->_embeddedResourceInfo configuration:self->_configurationDictionary];

  return v5;
}

- (id)eventListFromDictionary:(id)a3 error:(id *)a4
{
  return 0;
}

+ (id)patternForKey:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  if (kHAPIScope)
  {
    unint64_t v7 = *(id *)kHAPIScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    unint64_t v7 = MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    long long v49 = "CHHapticPattern.mm";
    __int16 v50 = 1024;
    int v51 = 482;
    __int16 v52 = 2080;
    long long v53 = "+[CHHapticPattern patternForKey:error:]";
    __int16 v54 = 2112;
    uint64_t v55 = v6;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_INFO, "%25s:%-5d %s: Creating pattern for key '%@'", buf, 0x26u);
  }

LABEL_8:
  if (kHAPIScope)
  {
    id v9 = *(id *)kHAPIScope;
    if (!v9) {
      goto LABEL_15;
    }
  }
  else
  {
    id v9 = MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    long long v49 = "CHHapticPattern.mm";
    __int16 v50 = 1024;
    int v51 = 484;
    __int16 v52 = 2080;
    long long v53 = "+[CHHapticPattern patternForKey:error:]";
    __int16 v54 = 2112;
    uint64_t v55 = @"/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist";
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Pattern library path: %@", buf, 0x26u);
  }

LABEL_15:
  id v47 = 0;
  id v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:@"/Library/Audio/Tunings/Generic/Haptics/Library/hapticpatternlibrary.plist" options:0 error:&v47];
  id v12 = (__CFString *)v47;
  if (v12)
  {
    uint64_t v13 = v12;
    if (kHAPIScope)
    {
      uint64_t v14 = *(id *)kHAPIScope;
      if (!v14)
      {
LABEL_26:
        id v17 = v13;
        uint64_t v18 = 0;
        *a4 = v17;
        goto LABEL_102;
      }
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F14500];
      id v16 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v49 = "CHHapticPattern.mm";
      __int16 v50 = 1024;
      int v51 = 487;
      __int16 v52 = 2080;
      long long v53 = "+[CHHapticPattern patternForKey:error:]";
      __int16 v54 = 2112;
      uint64_t v55 = v13;
      _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to read pattern library data: %@", buf, 0x26u);
    }

    goto LABEL_26;
  }
  if (kHAPIScope)
  {
    uint64_t v15 = *(id *)kHAPIScope;
    if (!v15) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v15 = MEMORY[0x1E4F14500];
    id v19 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    long long v49 = "CHHapticPattern.mm";
    __int16 v50 = 1024;
    int v51 = 491;
    __int16 v52 = 2080;
    long long v53 = "+[CHHapticPattern patternForKey:error:]";
    _os_log_impl(&dword_1BA902000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Read pattern library data", buf, 0x1Cu);
  }

LABEL_31:
  id v46 = 0;
  id v20 = [MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:&v46];
  id v21 = (__CFString *)v46;
  if (!v21)
  {
    if (kHAPIScope)
    {
      id v24 = *(id *)kHAPIScope;
      if (!v24) {
        goto LABEL_47;
      }
    }
    else
    {
      id v24 = MEMORY[0x1E4F14500];
      id v26 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      long long v49 = "CHHapticPattern.mm";
      __int16 v50 = 1024;
      int v51 = 499;
      __int16 v52 = 2080;
      long long v53 = "+[CHHapticPattern patternForKey:error:]";
      __int16 v54 = 2112;
      uint64_t v55 = v20;
      _os_log_impl(&dword_1BA902000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Loaded pattern library dict:\n%@", buf, 0x26u);
    }

LABEL_47:
    double v27 = [(__CFString *)v20 objectForKeyedSubscript:v6];
    if (v27)
    {
      if (kHAPIScope)
      {
        id v28 = *(id *)kHAPIScope;
        if (!v28) {
          goto LABEL_58;
        }
      }
      else
      {
        id v28 = MEMORY[0x1E4F14500];
        id v30 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136316162;
        long long v49 = "CHHapticPattern.mm";
        __int16 v50 = 1024;
        int v51 = 507;
        __int16 v52 = 2080;
        long long v53 = "+[CHHapticPattern patternForKey:error:]";
        __int16 v54 = 2112;
        uint64_t v55 = v6;
        __int16 v56 = 2112;
        v57 = v27;
        _os_log_impl(&dword_1BA902000, v28, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: '%@' path: %@", buf, 0x30u);
      }

LABEL_58:
      id v45 = 0;
      objc_super v31 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v27 options:0 error:&v45];
      double v32 = (__CFString *)v45;
      if (!v32 && v31)
      {
        if (kHAPIScope)
        {
          long long v33 = *(id *)kHAPIScope;
          if (!v33) {
            goto LABEL_75;
          }
        }
        else
        {
          long long v33 = MEMORY[0x1E4F14500];
          id v36 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          long long v49 = "CHHapticPattern.mm";
          __int16 v50 = 1024;
          int v51 = 515;
          __int16 v52 = 2080;
          long long v53 = "+[CHHapticPattern patternForKey:error:]";
          __int16 v54 = 2112;
          uint64_t v55 = v6;
          _os_log_impl(&dword_1BA902000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Read '%@' pattern data", buf, 0x26u);
        }

LABEL_75:
        id v44 = 0;
        id v37 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v31 options:0 error:&v44];
        id v17 = (__CFString *)v44;
        if (!v17 && v37)
        {
          if (kHAPIScope)
          {
            __int16 v38 = *(id *)kHAPIScope;
            if (!v38)
            {
LABEL_92:
              uint64_t v18 = [[CHHapticPattern alloc] initWithDictionary:v37 error:a4];
              objc_storeStrong((id *)&v18->_patternID, a3);
LABEL_98:

              goto LABEL_99;
            }
          }
          else
          {
            __int16 v38 = MEMORY[0x1E4F14500];
            id v41 = MEMORY[0x1E4F14500];
          }
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            long long v49 = "CHHapticPattern.mm";
            __int16 v50 = 1024;
            int v51 = 523;
            __int16 v52 = 2080;
            long long v53 = "+[CHHapticPattern patternForKey:error:]";
            __int16 v54 = 2112;
            uint64_t v55 = v6;
            _os_log_impl(&dword_1BA902000, v38, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Serialized '%@' pattern dict", buf, 0x26u);
          }

          goto LABEL_92;
        }
        if (kHAPIScope)
        {
          id v39 = *(id *)kHAPIScope;
          if (!v39)
          {
LABEL_97:
            uint64_t v18 = 0;
            *a4 = v17;
            goto LABEL_98;
          }
        }
        else
        {
          id v39 = MEMORY[0x1E4F14500];
          id v42 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          long long v49 = "CHHapticPattern.mm";
          __int16 v50 = 1024;
          int v51 = 519;
          __int16 v52 = 2080;
          long long v53 = "+[CHHapticPattern patternForKey:error:]";
          __int16 v54 = 2112;
          uint64_t v55 = v17;
          _os_log_impl(&dword_1BA902000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to serialize pattern data: %@", buf, 0x26u);
        }

        goto LABEL_97;
      }
      if (kHAPIScope)
      {
        __int16 v34 = *(id *)kHAPIScope;
        if (!v34)
        {
LABEL_87:
          id v17 = v32;
          uint64_t v18 = 0;
          *a4 = v17;
LABEL_99:

          goto LABEL_100;
        }
      }
      else
      {
        __int16 v34 = MEMORY[0x1E4F14500];
        id v40 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        long long v49 = "CHHapticPattern.mm";
        __int16 v50 = 1024;
        int v51 = 511;
        __int16 v52 = 2080;
        long long v53 = "+[CHHapticPattern patternForKey:error:]";
        __int16 v54 = 2112;
        uint64_t v55 = v32;
        _os_log_impl(&dword_1BA902000, v34, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to read pattern data: %@", buf, 0x26u);
      }

      goto LABEL_87;
    }
    if (kHAPIScope)
    {
      id v29 = *(id *)kHAPIScope;
      if (!v29)
      {
LABEL_70:
        [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreHaptics" code:-4851 userInfo:0];
        id v17 = 0;
        uint64_t v18 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_100:

        goto LABEL_101;
      }
    }
    else
    {
      id v29 = MEMORY[0x1E4F14500];
      id v35 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v49 = "CHHapticPattern.mm";
      __int16 v50 = 1024;
      int v51 = 503;
      __int16 v52 = 2080;
      long long v53 = "+[CHHapticPattern patternForKey:error:]";
      __int16 v54 = 2112;
      uint64_t v55 = v6;
      _os_log_impl(&dword_1BA902000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Haptic pattern with key '%@' not found", buf, 0x26u);
    }

    goto LABEL_70;
  }
  BOOL v22 = v21;
  if (!kHAPIScope)
  {
    id v23 = MEMORY[0x1E4F14500];
    id v25 = MEMORY[0x1E4F14500];
    goto LABEL_39;
  }
  id v23 = *(id *)kHAPIScope;
  if (v23)
  {
LABEL_39:
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      long long v49 = "CHHapticPattern.mm";
      __int16 v50 = 1024;
      int v51 = 495;
      __int16 v52 = 2080;
      long long v53 = "+[CHHapticPattern patternForKey:error:]";
      __int16 v54 = 2112;
      uint64_t v55 = v22;
      _os_log_impl(&dword_1BA902000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Failed to load pattern library: %@", buf, 0x26u);
    }
  }
  id v17 = v22;
  uint64_t v18 = 0;
  *a4 = v17;
LABEL_101:

LABEL_102:

  return v18;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

@end