@interface NSDictionary(ASDTConfig)
+ (BOOL)asdtGetFourCC:()ASDTConfig forObject:withDefault:;
- (BOOL)asdtControlClassID:()ASDTConfig;
- (double)asdtManagerRunningLogPeriod;
- (id)asdtArrayForKey:()ASDTConfig;
- (id)asdtArrayOfDictionariesForKey:()ASDTConfig;
- (id)asdtArrayOfNumbersForKey:()ASDTConfig;
- (id)asdtArrayOfStringsForKey:()ASDTConfig;
- (id)asdtBundleClass;
- (id)asdtBundleExtension;
- (id)asdtDeviceModel;
- (id)asdtFactorySubclass;
- (id)asdtFormats;
- (id)asdtFormatsWithSamplingRates:()ASDTConfig;
- (id)asdtInputLatenciesForSamplingRates:()ASDTConfig;
- (id)asdtLatenciesForSamplingRates:()ASDTConfig;
- (id)asdtLatenciesForSamplingRates:()ASDTConfig latencyUsKey:latencyDictKey:;
- (id)asdtNumberForKey:()ASDTConfig;
- (id)asdtOutputLatenciesForSamplingRates:()ASDTConfig;
- (id)asdtPropertyAddress;
- (id)asdtRelatedDeviceUIDs;
- (id)asdtServiceID;
- (id)asdtStringForKey:()ASDTConfig;
- (id)asdtSubclass;
- (objc_class)asdtDeviceManager;
- (uint64_t)asdtBoolForKey:()ASDTConfig;
- (uint64_t)asdtBundlePath;
- (uint64_t)asdtBundleResource;
- (uint64_t)asdtBundleSubdir;
- (uint64_t)asdtCanBeDefaultInputDevice;
- (uint64_t)asdtCanBeDefaultOutputDevice;
- (uint64_t)asdtCanBeDefaultSystemDevice;
- (uint64_t)asdtClockDomain;
- (uint64_t)asdtControls;
- (uint64_t)asdtCustomProperties;
- (uint64_t)asdtDeviceUID;
- (uint64_t)asdtDevices;
- (uint64_t)asdtDirection:()ASDTConfig;
- (uint64_t)asdtElement;
- (uint64_t)asdtExclavesBufferName;
- (uint64_t)asdtFilePath;
- (uint64_t)asdtFourCCForKey:()ASDTConfig withDefault:;
- (uint64_t)asdtGetSelector:()ASDTConfig;
- (uint64_t)asdtIsSettable;
- (uint64_t)asdtIsolatedUseCaseID;
- (uint64_t)asdtManagerAudioObjectMaxCount;
- (uint64_t)asdtManagerInitializationWaitUs;
- (uint64_t)asdtManagerVerboseLogging;
- (uint64_t)asdtName;
- (uint64_t)asdtNumericCount;
- (uint64_t)asdtNumericIsVectorWithCount:()ASDTConfig;
- (uint64_t)asdtNumericType;
- (uint64_t)asdtPMActionAnalyticsEventField;
- (uint64_t)asdtPMActionAnalyticsEventName;
- (uint64_t)asdtPMActionBackgroundTransition;
- (uint64_t)asdtPMActionExecuteTransition;
- (uint64_t)asdtPMActionOnce;
- (uint64_t)asdtPMActionWaiterActionName;
- (uint64_t)asdtPMActionWaiterTimeoutUs;
- (uint64_t)asdtPMDevices;
- (uint64_t)asdtPMEnablerDisableTransition;
- (uint64_t)asdtPMEnablerEnableTransition;
- (uint64_t)asdtPMNoStateChangeOnFailure;
- (uint64_t)asdtPMOrder:()ASDTConfig forPowerUp:;
- (uint64_t)asdtPMOrder:()ASDTConfig forPowerUp:allowDefault:;
- (uint64_t)asdtPMOrderWithDefaultForPowerUp:()ASDTConfig;
- (uint64_t)asdtPropertyCacheMode;
- (uint64_t)asdtPropertyDataSizeBytes;
- (uint64_t)asdtPropertyIsPList;
- (uint64_t)asdtPropertyValue;
- (uint64_t)asdtSamplingRate:()ASDTConfig andSamplingRates:withDefault:;
- (uint64_t)asdtScope;
- (uint64_t)asdtSelectorControlItemKind;
- (uint64_t)asdtSelectorControlItemSelected;
- (uint64_t)asdtSelectorControlItemValue:()ASDTConfig;
- (uint64_t)asdtSelectorControlItems;
- (uint64_t)asdtStartingChannel;
- (uint64_t)asdtStreams;
- (uint64_t)asdtTerminalType;
- (uint64_t)asdtTransportType;
- (uint64_t)asdtUnderlyingDeviceUID;
- (void)asdtDeviceManager;
- (void)asdtFormats;
- (void)asdtNumericType;
- (void)asdtPropertyCacheMode;
@end

@implementation NSDictionary(ASDTConfig)

- (id)asdtArrayForKey:()ASDTConfig
{
  id v4 = a3;
  v5 = [a1 objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtArrayForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (id)asdtArrayOfDictionariesForKey:()ASDTConfig
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 asdtArrayForKey:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = ASDTBaseLogType();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[NSDictionary(ASDTConfig) asdtArrayOfDictionariesForKey:]();
          }

          id v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v5;
LABEL_13:

  return v9;
}

- (id)asdtArrayOfNumbersForKey:()ASDTConfig
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 asdtArrayForKey:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = ASDTBaseLogType();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[NSDictionary(ASDTConfig) asdtArrayOfNumbersForKey:]();
          }

          id v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v5;
LABEL_13:

  return v9;
}

- (id)asdtArrayOfStringsForKey:()ASDTConfig
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [a1 asdtArrayForKey:v4];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = ASDTBaseLogType();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[NSDictionary(ASDTConfig) asdtArrayOfStringsForKey:]();
          }

          id v9 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v9 = v5;
LABEL_13:

  return v9;
}

- (id)asdtNumberForKey:()ASDTConfig
{
  id v4 = a3;
  id v5 = [a1 objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    uint64_t v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtNumberForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

- (uint64_t)asdtBoolForKey:()ASDTConfig
{
  v1 = objc_msgSend(a1, "asdtNumberForKey:");
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (id)asdtStringForKey:()ASDTConfig
{
  id v4 = a3;
  id v5 = [a1 objectForKeyedSubscript:v4];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      goto LABEL_8;
    }
    uint64_t v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtStringForKey:]();
    }
  }
  id v6 = 0;
LABEL_8:

  return v6;
}

+ (BOOL)asdtGetFourCC:()ASDTConfig forObject:withDefault:
{
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    unint64_t v9 = [v8 length];
    BOOL v10 = v9 < 5;
    if (v9 < 5)
    {
      uint64_t v11 = [v8 UTF8String];
      if (v11)
      {
        uint64_t v12 = 0;
        a5 = 0;
        do
        {
          if (!*(unsigned char *)(v11 + v12)) {
            break;
          }
          a5 = *(unsigned __int8 *)(v11 + v12++) | (a5 << 8);
        }
        while (v12 != 4);
      }
      else
      {
        a5 = 0;
      }
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      a5 = [v7 unsignedIntValue];
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  if (a3) {
    *a3 = a5;
  }

  return v10;
}

- (uint64_t)asdtFourCCForKey:()ASDTConfig withDefault:
{
  id v6 = a3;
  unsigned int v11 = a4;
  id v7 = objc_opt_class();
  id v8 = [a1 objectForKey:v6];
  [v7 asdtGetFourCC:&v11 forObject:v8 withDefault:a4];

  uint64_t v9 = v11;
  return v9;
}

- (uint64_t)asdtDevices
{
  return [a1 asdtArrayOfDictionariesForKey:@"Devices"];
}

- (uint64_t)asdtName
{
  return [a1 asdtStringForKey:@"Name"];
}

- (id)asdtSubclass
{
  v1 = [a1 asdtStringForKey:@"Subclass"];
  uint64_t v2 = v1;
  if (v1)
  {
    v3 = NSClassFromString(v1);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)asdtFactorySubclass
{
  uint64_t v2 = [a1 asdtStringForKey:@"FactorySubclass"];
  if (!v2)
  {
    v3 = NSString;
    id v4 = [a1 asdtStringForKey:@"Subclass"];
    uint64_t v2 = [v3 stringWithFormat:@"%@Factory", v4];
  }
  id v5 = NSClassFromString(v2);

  return v5;
}

- (id)asdtServiceID
{
  uint64_t v2 = [a1 asdtStringForKey:@"Identifier"];
  if (v2)
  {
    v3 = [a1 asdtNumberForKey:@"ClientType"];
    uint64_t v4 = [v3 unsignedIntValue];

    id v5 = +[ASDTIOServiceID forIdentifier:v2 andClientType:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)asdtFilePath
{
  return [a1 asdtStringForKey:@"FilePath"];
}

- (uint64_t)asdtBundleResource
{
  return [a1 asdtStringForKey:@"BundleRes"];
}

- (id)asdtBundleExtension
{
  v1 = [a1 asdtStringForKey:@"BundleExt"];
  uint64_t v2 = objc_msgSend(v1, "substringWithRange:", 0, 1);
  int v3 = [v2 isEqualToString:@"."];

  if (v3)
  {
    uint64_t v4 = [v1 substringFromIndex:1];

    v1 = (void *)v4;
  }
  return v1;
}

- (uint64_t)asdtBundleSubdir
{
  return [a1 asdtStringForKey:@"BundleSubdir"];
}

- (uint64_t)asdtBundlePath
{
  return [a1 asdtStringForKey:@"BundlePath"];
}

- (id)asdtBundleClass
{
  v1 = [a1 asdtStringForKey:@"BundleClass"];
  uint64_t v2 = v1;
  if (v1)
  {
    int v3 = NSClassFromString(v1);
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (uint64_t)asdtClockDomain
{
  v1 = [a1 asdtStringForKey:@"ClockDomain"];
  id v5 = v1;
  if (v1)
  {
    uint64_t v6 = [v1 UTF8String];
    uint64_t DomainForFourCC = ASDT::Clock::GetDomainForFourCC(v6, v7, v8, v9);
  }
  else
  {
    uint64_t DomainForFourCC = ASDT::Clock::GetSynchronousClockDomain(0, v2, v3, v4);
  }
  uint64_t v11 = DomainForFourCC;

  return v11;
}

- (uint64_t)asdtControls
{
  return [a1 asdtArrayOfDictionariesForKey:@"Controls"];
}

- (uint64_t)asdtCustomProperties
{
  return [a1 asdtArrayOfDictionariesForKey:@"CustomProperties"];
}

- (uint64_t)asdtCanBeDefaultInputDevice
{
  return [a1 asdtBoolForKey:@"CanBeDefaultInput"];
}

- (uint64_t)asdtCanBeDefaultOutputDevice
{
  return [a1 asdtBoolForKey:@"CanBeDefaultOutput"];
}

- (uint64_t)asdtCanBeDefaultSystemDevice
{
  return [a1 asdtBoolForKey:@"CanBeDefaultSystem"];
}

- (id)asdtLatenciesForSamplingRates:()ASDTConfig latencyUsKey:latencyDictKey:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v28 = a4;
  id v29 = a5;
  v30 = v8;
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  BOOL v10 = [a1 objectForKey:v29];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 count])
  {
    uint64_t v11 = [v10 allKeys];
    uint64_t v12 = [v11 asdtNumericSortAscending:1];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obuint64_t j = v8;
    uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v10, "objectForKey:", v16, v28);
          if (!v17)
          {
            v18 = [v12 asdtNearestNumberToNumber:v16];
            uint64_t v17 = [v10 objectForKey:v18];

            if (!v17) {
              continue;
            }
          }
          v19 = +[ASDTUtils latencyFramesForSamplingRate:v16 andMicroseconds:v17];
          [v9 setObject:v19 forKey:v16];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v13);
    }
  }
  else
  {
    uint64_t v12 = objc_msgSend(a1, "asdtNumberForKey:", v28, v28);
    if (!v12) {
      goto LABEL_23;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          v25 = +[ASDTUtils latencyFramesForSamplingRate:v24 andMicroseconds:v12];
          [v9 setObject:v25 forKey:v24];
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v21);
    }
  }

LABEL_23:
  if ([v9 count]) {
    v26 = (void *)[v9 copy];
  }
  else {
    v26 = 0;
  }

  return v26;
}

- (id)asdtInputLatenciesForSamplingRates:()ASDTConfig
{
  uint64_t v3 = [a1 asdtLatenciesForSamplingRates:a3 latencyUsKey:@"InputLatencyUs" latencyDictKey:@"InputLatencies"];
  return v3;
}

- (id)asdtOutputLatenciesForSamplingRates:()ASDTConfig
{
  uint64_t v3 = [a1 asdtLatenciesForSamplingRates:a3 latencyUsKey:@"OutputLatencyUs" latencyDictKey:@"OutputLatencies"];
  return v3;
}

- (id)asdtDeviceModel
{
  uint64_t v2 = [a1 asdtStringForKey:@"DeviceModel"];
  if (!v2)
  {
    uint64_t v2 = [a1 asdtStringForKey:@"DeviceUID"];
  }
  return v2;
}

- (uint64_t)asdtDeviceUID
{
  return [a1 asdtStringForKey:@"DeviceUID"];
}

- (uint64_t)asdtPMDevices
{
  return [a1 asdtArrayOfDictionariesForKey:@"PMDevices"];
}

- (uint64_t)asdtPMOrderWithDefaultForPowerUp:()ASDTConfig
{
  unsigned int v4 = 1000;
  [a1 asdtPMOrder:&v4 forPowerUp:a3 allowDefault:1];
  return v4;
}

- (uint64_t)asdtSamplingRate:()ASDTConfig andSamplingRates:withDefault:
{
  v31[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = [a1 asdtNumberForKey:@"SamplingRate"];
  BOOL v10 = [a1 asdtArrayOfNumbersForKey:@"SamplingRates"];
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_8;
    }
  }
  else
  {
    if (v10)
    {
      uint64_t v9 = [v10 objectAtIndexedSubscript:0];
      goto LABEL_8;
    }
    uint64_t v9 = [NSNumber numberWithDouble:a2];
  }
  v31[0] = v9;
  uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
LABEL_8:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "isEqualToNumber:", v9, (void)v20))
        {

          if (a4)
          {
            [v9 doubleValue];
            *a4 = v18;
          }
          if (a5) {
            *a5 = v12;
          }
          uint64_t v17 = 1;
          goto LABEL_24;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  uint64_t v16 = ASDTBaseLogType();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v25 = @"SamplingRates";
    __int16 v26 = 2112;
    v27 = @"SamplingRate";
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_error_impl(&dword_2489BC000, v16, OS_LOG_TYPE_ERROR, "%@ array must contain %@ value '%@'", buf, 0x20u);
  }

  uint64_t v17 = 0;
LABEL_24:

  return v17;
}

- (uint64_t)asdtStreams
{
  return [a1 asdtArrayOfDictionariesForKey:@"Streams"];
}

- (uint64_t)asdtTransportType
{
  return [a1 asdtFourCCForKey:@"TransportType" withDefault:0];
}

- (uint64_t)asdtUnderlyingDeviceUID
{
  return [a1 asdtStringForKey:@"UnderlyingDeviceUID"];
}

- (id)asdtRelatedDeviceUIDs
{
  v1 = [a1 asdtArrayOfStringsForKey:@"RelatedDeviceUIDs"];
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x263EFFA08] setWithArray:v1];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)asdtElement
{
  return [a1 asdtFourCCForKey:@"Element" withDefault:0];
}

- (uint64_t)asdtIsSettable
{
  v1 = [a1 asdtNumberForKey:@"IsSettable"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)asdtScope
{
  return [a1 asdtFourCCForKey:@"Scope" withDefault:1735159650];
}

- (uint64_t)asdtGetSelector:()ASDTConfig
{
  id v5 = objc_opt_class();
  uint64_t v6 = [a1 objectForKey:@"Selector"];
  uint64_t v7 = [v5 asdtGetFourCC:a3 forObject:v6 withDefault:0];

  if ((v7 & 1) == 0)
  {
    id v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtGetSelector:]();
    }
  }
  return v7;
}

- (id)asdtPropertyAddress
{
  unsigned int v5 = 0;
  if ([a1 asdtGetSelector:&v5])
  {
    id v2 = objc_alloc(MEMORY[0x263F28C60]);
    uint64_t v3 = objc_msgSend(v2, "initWithSelector:scope:element:", v5, objc_msgSend(a1, "asdtScope"), objc_msgSend(a1, "asdtElement"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (BOOL)asdtControlClassID:()ASDTConfig
{
  int v4 = [a1 asdtFourCCForKey:@"ClassID" withDefault:0];
  int v5 = v4;
  if (v4)
  {
    *a3 = v4;
  }
  else
  {
    uint64_t v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtControlClassID:]();
    }
  }
  return v5 != 0;
}

- (uint64_t)asdtSelectorControlItems
{
  return [a1 asdtArrayOfDictionariesForKey:@"Items"];
}

- (uint64_t)asdtSelectorControlItemValue:()ASDTConfig
{
  int v5 = objc_opt_class();
  uint64_t v6 = [a1 objectForKey:@"Value"];
  uint64_t v7 = [v5 asdtGetFourCC:a3 forObject:v6 withDefault:0];

  if ((v7 & 1) == 0)
  {
    id v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtSelectorControlItemValue:]();
    }
  }
  return v7;
}

- (uint64_t)asdtSelectorControlItemSelected
{
  v1 = [a1 asdtNumberForKey:@"Selected"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)asdtSelectorControlItemKind
{
  return [a1 asdtFourCCForKey:@"Kind" withDefault:0];
}

- (uint64_t)asdtPropertyValue
{
  return [a1 objectForKey:@"Value"];
}

- (uint64_t)asdtPropertyCacheMode
{
  v1 = [a1 asdtStringForKey:@"CacheMode"];
  uint64_t v2 = v1;
  if (v1)
  {
    if (![v1 caseInsensitiveCompare:@"Never"])
    {
      uint64_t v4 = 0;
      goto LABEL_11;
    }
    if (![v2 caseInsensitiveCompare:@"Always"])
    {
      uint64_t v4 = 2;
      goto LABEL_11;
    }
    if ([v2 caseInsensitiveCompare:@"Explicit"])
    {
      uint64_t v3 = ASDTBaseLogType();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(ASDTConfig) asdtPropertyCacheMode]();
      }
    }
  }
  uint64_t v4 = 1;
LABEL_11:

  return v4;
}

- (uint64_t)asdtPropertyDataSizeBytes
{
  v1 = [a1 asdtNumberForKey:@"DataSize"];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)asdtPropertyIsPList
{
  if ([a1 asdtBoolForKey:@"IsPList"]) {
    return 1886155636;
  }
  else {
    return 1918990199;
  }
}

- (uint64_t)asdtNumericType
{
  v1 = [a1 asdtStringForKey:@"NumericType"];
  uint64_t v2 = v1;
  if (!v1) {
    goto LABEL_24;
  }
  if (([v1 isEqualToString:@"float"] & 1) == 0)
  {
    if ([v2 isEqualToString:@"double"])
    {
      uint64_t v3 = 2;
      goto LABEL_25;
    }
    if ([v2 isEqualToString:@"int8_t"])
    {
      uint64_t v3 = 3;
      goto LABEL_25;
    }
    if ([v2 isEqualToString:@"int16_t"])
    {
      uint64_t v3 = 4;
      goto LABEL_25;
    }
    if ([v2 isEqualToString:@"int32_t"])
    {
      uint64_t v3 = 5;
      goto LABEL_25;
    }
    if ([v2 isEqualToString:@"int64_t"])
    {
      uint64_t v3 = 6;
      goto LABEL_25;
    }
    if ([v2 isEqualToString:@"uint8_t"])
    {
      uint64_t v3 = 7;
      goto LABEL_25;
    }
    if ([v2 isEqualToString:@"uint16_t"])
    {
      uint64_t v3 = 8;
      goto LABEL_25;
    }
    if (([v2 isEqualToString:@"uint32_t"] & 1) == 0)
    {
      if ([v2 isEqualToString:@"uint64_t"])
      {
        uint64_t v3 = 10;
        goto LABEL_25;
      }
      uint64_t v4 = ASDTBaseLogType();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(ASDTConfig) asdtNumericType]();
      }
    }
LABEL_24:
    uint64_t v3 = 9;
    goto LABEL_25;
  }
  uint64_t v3 = 1;
LABEL_25:

  return v3;
}

- (uint64_t)asdtNumericCount
{
  v1 = [a1 asdtNumberForKey:@"NumericCount"];
  unsigned int v2 = [v1 unsignedIntValue];
  if (v2 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }

  return v3;
}

- (uint64_t)asdtNumericIsVectorWithCount:()ASDTConfig
{
  uint64_t v4 = [a1 asdtNumberForKey:@"NumericIsVector"];
  int v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 BOOLValue];
  }
  else {
    uint64_t v6 = a3 > 1;
  }

  return v6;
}

- (uint64_t)asdtDirection:()ASDTConfig
{
  if (a3)
  {
    uint64_t v4 = [a1 asdtStringForKey:@"Direction"];
    int v5 = v4;
    if (v4)
    {
      if ([v4 caseInsensitiveCompare:@"input"])
      {
        if ([v5 caseInsensitiveCompare:@"output"])
        {
          uint64_t v6 = ASDTBaseLogType();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            -[NSDictionary(ASDTConfig) asdtDirection:]();
          }
LABEL_10:

          uint64_t v7 = 0;
LABEL_14:

          return v7;
        }
        int v8 = 1869968496;
      }
      else
      {
        int v8 = 1768845428;
      }
      *a3 = v8;
      uint64_t v7 = 1;
      goto LABEL_14;
    }
    uint64_t v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtDirection:]();
    }
    goto LABEL_10;
  }
  return 0;
}

- (id)asdtFormats
{
  v1 = [a1 asdtArrayOfDictionariesForKey:@"Formats"];
  if (!v1)
  {
    unsigned int v2 = ASDTBaseLogType();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      [(NSDictionary(ASDTConfig) *)v2 asdtFormats];
    }
  }
  return v1;
}

- (id)asdtLatenciesForSamplingRates:()ASDTConfig
{
  uint64_t v3 = [a1 asdtLatenciesForSamplingRates:a3 latencyUsKey:@"LatencyUs" latencyDictKey:@"Latencies"];
  return v3;
}

- (uint64_t)asdtStartingChannel
{
  v1 = [a1 asdtNumberForKey:@"StartingChannel"];
  unsigned int v2 = [v1 unsignedIntValue];
  if (v2 <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = v2;
  }

  return v3;
}

- (uint64_t)asdtTerminalType
{
  return [a1 asdtFourCCForKey:@"TerminalType" withDefault:0];
}

- (uint64_t)asdtIsolatedUseCaseID
{
  v1 = [a1 asdtNumberForKey:@"IsolatedUseCaseID"];
  uint64_t v2 = [v1 unsignedLongLongValue];

  return v2;
}

- (uint64_t)asdtExclavesBufferName
{
  return [a1 asdtStringForKey:@"ExclavesBufferName"];
}

- (id)asdtFormatsWithSamplingRates:()ASDTConfig
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v54;
    double v7 = 0.0;
    double v8 = INFINITY;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v54 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * i) doubleValue];
        if (v10 < v8) {
          double v8 = v10;
        }
        if (v10 > v7) {
          double v7 = v10;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = INFINITY;
  }

  uint64_t v47 = 0;
  long long v48 = xmmword_248A06AB0;
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  double v51 = v8;
  double v52 = v7;
  uint64_t v42 = [a1 asdtNumberForKey:@"AlignedHigh"];
  if (v42 && ![v42 BOOLValue]) {
    int v11 = 0;
  }
  else {
    int v11 = 16;
  }
  DWORD1(v48) |= v11;
  id v12 = [a1 asdtNumberForKey:@"Channels"];
  uint64_t v13 = v12;
  if (!v12) {
    goto LABEL_23;
  }
  int v14 = [v12 unsignedIntValue];
  if ((v14 - 33) <= 0xFFFFFFDF)
  {
    long long v15 = ASDTBaseLogType();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[NSDictionary(ASDTConfig) asdtFormatsWithSamplingRates:](v14, v15);
    }

LABEL_23:
    int v14 = 2;
  }
  uint64_t v16 = [a1 asdtStringForKey:@"DataFormat"];
  uint64_t v17 = v16;
  if (!v16 || ![v16 caseInsensitiveCompare:@"lf32"])
  {
LABEL_32:
    unsigned int v19 = 32;
    int v20 = 1;
    goto LABEL_37;
  }
  if ([v17 caseInsensitiveCompare:@"li16"])
  {
    if ([v17 caseInsensitiveCompare:@"li24"])
    {
      if ([v17 caseInsensitiveCompare:@"li32"])
      {
        uint64_t v18 = ASDTBaseLogType();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[NSDictionary(ASDTConfig) asdtFormatsWithSamplingRates:]();
        }

        goto LABEL_32;
      }
      unsigned int v19 = 32;
    }
    else
    {
      unsigned int v19 = 24;
    }
  }
  else
  {
    unsigned int v19 = 16;
  }
  int v20 = 4;
LABEL_37:
  DWORD1(v48) |= v20;
  long long v21 = [a1 asdtNumberForKey:@"BitsPerSample"];
  unsigned int v22 = [v21 unsignedIntValue];

  if (v22 <= 0x20 && v22 >= v19) {
    unsigned int v24 = v22;
  }
  else {
    unsigned int v24 = v19;
  }
  if (v19 == v24) {
    DWORD1(v48) |= 8u;
  }
  HIDWORD(v49) = v14;
  LODWORD(v50) = v19;
  LODWORD(v49) = (v24 >> 3) * v14;
  DWORD2(v48) = v49;
  v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v26 = v4;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v44;
    while (2)
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v26);
        }
        [*(id *)(*((void *)&v43 + 1) + 8 * j) doubleValue];
        uint64_t v47 = v30;
        v31 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamRangedDescription:&v47];
        if (!v31)
        {
          long long v33 = ASDTBaseLogType();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            -[NSDictionary(ASDTConfig) asdtFormatsWithSamplingRates:](v33, v34, v35, v36, v37, v38, v39, v40);
          }

          long long v32 = 0;
          goto LABEL_57;
        }
        [v25 addObject:v31];
      }
      uint64_t v27 = [v26 countByEnumeratingWithState:&v43 objects:v57 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  long long v32 = (void *)[v25 copy];
LABEL_57:

  return v32;
}

- (uint64_t)asdtPMOrder:()ASDTConfig forPowerUp:allowDefault:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  LODWORD(v5) = a5;
  double v8 = kASDTConfigKeyDevicePMOrderPowerUp;
  if (!a4) {
    double v8 = kASDTConfigKeyDevicePMOrderPowerDown;
  }
  uint64_t v9 = *v8;
  double v10 = [a1 asdtNumberForKey:v9];
  if (v10)
  {
    int v11 = v9;
  }
  else
  {
    int v11 = @"PMOrder";

    double v10 = [a1 asdtNumberForKey:v11];
  }
  unsigned int v12 = [v10 unsignedIntValue];
  if (v10) {
    BOOL v13 = v12 >= 0x7D1;
  }
  else {
    BOOL v13 = 1;
  }
  int v14 = !v13;
  if (v13) {
    uint64_t v5 = v5;
  }
  else {
    uint64_t v5 = 1;
  }
  if (v5)
  {
    if (v14) {
      int v15 = v12;
    }
    else {
      int v15 = 1000;
    }
    *a3 = v15;
  }
  else
  {
    uint64_t v16 = ASDTBaseLogType();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [a1 objectForKey:v11];
      -[NSDictionary(ASDTConfig) asdtPMOrder:forPowerUp:allowDefault:]((uint64_t)v11, v17, v19, v16);
    }
  }
  return v5;
}

- (uint64_t)asdtPMOrder:()ASDTConfig forPowerUp:
{
  return [a1 asdtPMOrder:a3 forPowerUp:a4 allowDefault:0];
}

- (uint64_t)asdtPMNoStateChangeOnFailure
{
  return [a1 asdtBoolForKey:@"PMNoStateChangeOnFailure"];
}

- (uint64_t)asdtPMActionExecuteTransition
{
  return [a1 asdtFourCCForKey:@"ExecuteTransition" withDefault:0];
}

- (uint64_t)asdtPMActionBackgroundTransition
{
  return [a1 asdtFourCCForKey:@"BackgroundTransition" withDefault:0];
}

- (uint64_t)asdtPMActionOnce
{
  return [a1 asdtBoolForKey:@"Once"];
}

- (uint64_t)asdtPMActionWaiterActionName
{
  return [a1 asdtStringForKey:@"WaiterActionName"];
}

- (uint64_t)asdtPMActionWaiterTimeoutUs
{
  v1 = [a1 asdtNumberForKey:@"WaiterTimeoutUs"];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (uint64_t)asdtPMActionAnalyticsEventName
{
  return [a1 asdtStringForKey:@"EventName"];
}

- (uint64_t)asdtPMActionAnalyticsEventField
{
  return [a1 asdtStringForKey:@"EventField"];
}

- (uint64_t)asdtPMEnablerEnableTransition
{
  return [a1 asdtFourCCForKey:@"EnableTransition" withDefault:1970435438];
}

- (uint64_t)asdtPMEnablerDisableTransition
{
  return [a1 asdtFourCCForKey:@"DisableTransition" withDefault:1685092205];
}

- (objc_class)asdtDeviceManager
{
  v1 = [a1 asdtStringForKey:@"DeviceManager"];
  uint64_t v2 = v1;
  if (v1)
  {
    Class v3 = NSClassFromString(v1);
    if (v3)
    {
      if ([(objc_class *)v3 isSubclassOfClass:objc_opt_class()])
      {
        id v4 = v3;
        goto LABEL_12;
      }
      uint64_t v5 = ASDTBaseLogType();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(ASDTConfig) asdtDeviceManager]();
      }
    }
    else
    {
      uint64_t v5 = ASDTBaseLogType();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        -[NSDictionary(ASDTConfig) asdtDeviceManager]();
      }
    }
  }
  else
  {
    uint64_t v5 = ASDTBaseLogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(NSDictionary(ASDTConfig) *)v5 asdtDeviceManager];
    }
  }

  id v4 = 0;
LABEL_12:

  return v4;
}

- (uint64_t)asdtManagerVerboseLogging
{
  v1 = [a1 asdtNumberForKey:@"VerboseLogging"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (uint64_t)asdtManagerInitializationWaitUs
{
  v1 = [a1 asdtNumberForKey:@"InitializationWaitUs"];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntValue];
  }
  else {
    uint64_t v3 = 100000;
  }

  return v3;
}

- (double)asdtManagerRunningLogPeriod
{
  v1 = [a1 asdtNumberForKey:@"RunningLogPeriodSec"];
  uint64_t v2 = v1;
  if (v1)
  {
    [v1 doubleValue];
    double v4 = v3;
  }
  else
  {
    double v4 = 60.0;
  }

  return v4;
}

- (uint64_t)asdtManagerAudioObjectMaxCount
{
  v1 = [a1 asdtNumberForKey:@"AudioObjectMaxCount"];
  uint64_t v2 = [v1 unsignedIntValue];

  return v2;
}

- (void)asdtArrayForKey:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%@ configuration value is not an array.", v2, v3, v4, v5, v6);
}

- (void)asdtArrayOfDictionariesForKey:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_2489BC000, v0, v1, "Array %@ must contain dictionaries; found: %@");
}

- (void)asdtArrayOfNumbersForKey:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_2489BC000, v0, v1, "Array '%@' must contain numbers; found: %@");
}

- (void)asdtArrayOfStringsForKey:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_2489BC000, v0, v1, "Array '%@' must contain strings; found: %@");
}

- (void)asdtNumberForKey:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%@ configuration value is not a number.", v2, v3, v4, v5, v6);
}

- (void)asdtStringForKey:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%@ configuration value is not a string.", v2, v3, v4, v5, v6);
}

- (void)asdtGetSelector:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "Property selector is required in object: %@", v2, v3, v4, v5, v6);
}

- (void)asdtControlClassID:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "Control key %@ is required.", v2, v3, v4, v5, v6);
}

- (void)asdtSelectorControlItemValue:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "Selector control key %@ is required.", v2, v3, v4, v5, v6);
}

- (void)asdtPropertyCacheMode
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_2489BC000, v0, v1, "Bad %@ value: %@");
}

- (void)asdtNumericType
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "Bad numeric type '%@'.", v2, v3, v4, v5, v6);
}

- (void)asdtDirection:()ASDTConfig .cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "%@ property is missing.", v2, v3, v4, v5, v6);
}

- (void)asdtDirection:()ASDTConfig .cold.2()
{
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_2(&dword_2489BC000, v0, v1, "%@ property invalid value: %@.");
}

- (void)asdtFormats
{
}

- (void)asdtFormatsWithSamplingRates:()ASDTConfig .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)asdtFormatsWithSamplingRates:()ASDTConfig .cold.2()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "Invalid data format: %@", v2, v3, v4, v5, v6);
}

- (void)asdtFormatsWithSamplingRates:()ASDTConfig .cold.3(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2489BC000, a2, OS_LOG_TYPE_ERROR, "Invalid number of channels: %u", (uint8_t *)v2, 8u);
}

- (void)asdtPMOrder:()ASDTConfig forPowerUp:allowDefault:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412802;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 2000;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Invalid %@ value: %@. Valid range: [0 - %u]", buf, 0x1Cu);
}

- (void)asdtDeviceManager
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_2489BC000, v0, v1, "Class '%@' is not a subclass of ASDTDeviceManager.", v2, v3, v4, v5, v6);
}

@end