@interface _CDEventStreamProperties
+ (id)eventStreamPropertiesFromDictionary:(id)a3;
+ (id)eventStreamPropertiesFromDictionary:(id)a3 defaultProperties:(id)a4;
- (BOOL)dataCollectionEnabled;
- (BOOL)isAvailable;
- (BOOL)isHistorical;
- (BOOL)isInstant;
- (BOOL)setupOnDemand;
- (BOOL)shouldSaveCurrentEventOnShutdown;
- (NSNumber)dataCollectionEnabledNum;
- (NSNumber)domainAvailabilityNum;
- (NSNumber)isAvailableNum;
- (NSObject)dataCollectionObject;
- (NSObject)platformObject;
- (NSString)descriptionString;
- (NSString)formattedName;
- (NSString)knowledgeBaseMetadataClass;
- (NSString)knowledgeBaseName;
- (NSString)monitorClass;
- (NSString)name;
- (_DKObjectType)valueType;
- (double)period;
- (double)temporalPrecision;
- (double)timeToLive;
- (id)description;
- (id)initFromDictionary:(id)a3 defaultProperties:(id)a4;
- (int64_t)eventCountLimit;
- (int64_t)eventsPerPeriod;
- (int64_t)pollingPeriod;
- (unint64_t)domainAvailability;
@end

@implementation _CDEventStreamProperties

- (NSString)name
{
  return self->name;
}

- (_DKObjectType)valueType
{
  return self->valueType;
}

- (double)timeToLive
{
  return self->timeToLive;
}

- (double)temporalPrecision
{
  return self->temporalPrecision;
}

- (double)period
{
  return self->period;
}

- (BOOL)isHistorical
{
  return self->isHistorical;
}

- (int64_t)eventsPerPeriod
{
  return self->eventsPerPeriod;
}

- (int64_t)eventCountLimit
{
  return self->eventCountLimit;
}

- (id)description
{
  v29 = NSString;
  v33 = [(_CDEventStreamProperties *)self formattedName];
  v32 = [(_CDEventStreamProperties *)self name];
  v31 = [(_CDEventStreamProperties *)self knowledgeBaseName];
  v30 = [(_CDEventStreamProperties *)self descriptionString];
  v28 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDEventStreamProperties isAvailable](self, "isAvailable"));
  v27 = _CDDomainAvailabilityDescription([(_CDEventStreamProperties *)self domainAvailability]);
  v26 = objc_msgSend(NSNumber, "numberWithBool:", -[_CDEventStreamProperties dataCollectionEnabled](self, "dataCollectionEnabled"));
  v3 = [(_CDEventStreamProperties *)self monitorClass];
  v25 = [(_CDEventStreamProperties *)self valueType];
  v4 = [v25 description];
  BOOL v5 = [(_CDEventStreamProperties *)self setupOnDemand];
  int64_t v6 = [(_CDEventStreamProperties *)self eventCountLimit];
  [(_CDEventStreamProperties *)self timeToLive];
  uint64_t v8 = v7;
  [(_CDEventStreamProperties *)self temporalPrecision];
  uint64_t v10 = v9;
  int64_t v11 = [(_CDEventStreamProperties *)self eventsPerPeriod];
  [(_CDEventStreamProperties *)self period];
  uint64_t v13 = v12;
  BOOL v14 = [(_CDEventStreamProperties *)self isInstant];
  BOOL v15 = [(_CDEventStreamProperties *)self isHistorical];
  BOOL v16 = [(_CDEventStreamProperties *)self shouldSaveCurrentEventOnShutdown];
  int64_t v17 = [(_CDEventStreamProperties *)self pollingPeriod];
  if ((unint64_t)(v17 - 1) > 5) {
    v18 = @"Max";
  }
  else {
    v18 = off_1E560E3F0[v17 - 1];
  }
  uint64_t v19 = MEMORY[0x1E4F1CC28];
  if (v16) {
    uint64_t v20 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v20 = MEMORY[0x1E4F1CC28];
  }
  if (v15) {
    uint64_t v21 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v21 = MEMORY[0x1E4F1CC28];
  }
  if (v14) {
    uint64_t v22 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v22 = MEMORY[0x1E4F1CC28];
  }
  if (v5) {
    uint64_t v19 = MEMORY[0x1E4F1CC38];
  }
  objc_msgSend(v29, "stringWithFormat:", @"Event Stream Formatted Name: %@ ; \n\tEvent Stream Name: %@ ; \n\tKnowledgeBase Event Stream Name: %@ ; \n\tEvent Stream Description: %@ ; \n\tisAvailable: %@ ; domains: %@\n\tData Collection Enabled: %@ ;\n\tMonitorClass: %@ ; \n\tValue Type: %@ ; SetupOnDemand: %@ ; \n\tEvent Count Limit: %ld ; Life Time seconds: %f ; \n\tTemporal Precision: %f ; \n\tRate Limiting: (%ld) events in (%f) seconds ; \n\tInstant: %@ ; Historical: %@ ; Persist at shutdown: %@ ; Polling Period: %@ ; \n",
    v33,
    v32,
    v31,
    v30,
    v28,
    v27,
    v26,
    v3,
    v4,
    v19,
    v6,
    v8,
    v10,
    v11,
    v13,
    v22,
    v21,
    v20,
  v23 = v18);

  return v23;
}

- (BOOL)isAvailable
{
  v27[1] = *MEMORY[0x1E4F143B8];
  isAvailableNum = self->_isAvailableNum;
  if (!isAvailableNum)
  {
    v4 = NSNumber;
    BOOL v5 = self->_platformObject;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 copy];
      v27[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

      BOOL v5 = v7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [@"iOS" caseInsensitiveCompare:@"tvOS"];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v20 = v5;
        uint64_t v21 = v4;
        uint64_t v11 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "componentsSeparatedByString:", @".", v20, v21, (void)v22);
            BOOL v14 = [v13 firstObject];
            uint64_t v15 = [v14 caseInsensitiveCompare:@"iOS"];

            if (!v15)
            {
              uint64_t v16 = 1;
              goto LABEL_16;
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v10) {
            continue;
          }
          break;
        }
        uint64_t v16 = 0;
LABEL_16:
        BOOL v5 = v20;
        v4 = v21;
      }
      else
      {
        uint64_t v16 = 0;
      }
    }
    else
    {
      uint64_t v16 = 0;
    }

    int64_t v17 = [v4 numberWithBool:v16];
    v18 = self->_isAvailableNum;
    self->_isAvailableNum = v17;

    isAvailableNum = self->_isAvailableNum;
  }
  return [(NSNumber *)isAvailableNum BOOLValue];
}

- (unint64_t)domainAvailability
{
  v2 = self;
  v28[1] = *MEMORY[0x1E4F143B8];
  domainAvailabilityNum = self->_domainAvailabilityNum;
  if (!domainAvailabilityNum)
  {
    v4 = NSNumber;
    BOOL v5 = v2->_platformObject;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 copy];
      v28[0] = v6;
      uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];

      BOOL v5 = v7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v22 = v2;
      uint64_t v21 = v5;
      uint64_t v8 = v5;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(v8);
            }
            BOOL v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) componentsSeparatedByString:@"."];
            uint64_t v15 = [v14 firstObject];
            uint64_t v16 = v15;
            if (v15 && ![v15 caseInsensitiveCompare:@"iOS"])
            {
              if ([v14 count] == 1)
              {
                uint64_t v11 = 3;
              }
              else if ([v14 count] == 2)
              {
                int64_t v17 = [v14 objectAtIndexedSubscript:1];
                if ([v17 caseInsensitiveCompare:@"system"])
                {
                  if (![v17 caseInsensitiveCompare:@"user"]) {
                    v11 |= 2uLL;
                  }
                }
                else
                {
                  v11 |= 1uLL;
                }
              }
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v10);
      }
      else
      {
        uint64_t v11 = 0;
      }

      v2 = v22;
      BOOL v5 = v21;
    }
    else
    {
      uint64_t v11 = 0;
    }

    uint64_t v18 = [v4 numberWithUnsignedLong:v11];
    uint64_t v19 = v2->_domainAvailabilityNum;
    v2->_domainAvailabilityNum = (NSNumber *)v18;

    domainAvailabilityNum = v2->_domainAvailabilityNum;
  }
  return [(NSNumber *)domainAvailabilityNum unsignedLongValue];
}

- (BOOL)dataCollectionEnabled
{
  v25[1] = *MEMORY[0x1E4F143B8];
  dataCollectionEnabledNum = self->_dataCollectionEnabledNum;
  if (!dataCollectionEnabledNum)
  {
    v4 = NSNumber;
    BOOL v5 = self->_dataCollectionObject;
    if (+[_CDDeviceInfo isRunningOnInternalBuild])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = [v5 BOOLValue];
LABEL_12:

        uint64_t v11 = [v4 numberWithBool:v6];
        uint64_t v12 = self->_dataCollectionEnabledNum;
        self->_dataCollectionEnabledNum = v11;

        dataCollectionEnabledNum = self->_dataCollectionEnabledNum;
        return [(NSNumber *)dataCollectionEnabledNum BOOLValue];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v5;
        uint64_t v8 = [v7 objectForKeyedSubscript:@"Enabled"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 BOOLValue])
        {
          uint64_t v9 = [v7 objectForKeyedSubscript:@"DisabledCountries"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v9;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v14 = 0;
              goto LABEL_31;
            }
            v25[0] = v9;
            id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
          }
          id v14 = v10;
          if (v10 && [v10 count])
          {
            if (dataCollectionIsEnabled_onceToken != -1) {
              dispatch_once(&dataCollectionIsEnabled_onceToken, &__block_literal_global_16);
            }
            if (dataCollectionIsEnabled_countryCode)
            {
              long long v22 = 0u;
              long long v23 = 0u;
              long long v20 = 0u;
              long long v21 = 0u;
              id v14 = v14;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v19 = v9;
                uint64_t v17 = *(void *)v21;
                while (2)
                {
                  for (uint64_t i = 0; i != v16; ++i)
                  {
                    if (*(void *)v21 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    if (![(id)dataCollectionIsEnabled_countryCode caseInsensitiveCompare:*(void *)(*((void *)&v20 + 1) + 8 * i)])
                    {
                      uint64_t v6 = 0;
                      goto LABEL_33;
                    }
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
                uint64_t v6 = 1;
LABEL_33:
                uint64_t v9 = v19;
              }
              else
              {
                uint64_t v6 = 1;
              }
            }
            else
            {
              uint64_t v6 = 0;
            }
            goto LABEL_37;
          }
LABEL_31:
          uint64_t v6 = 1;
LABEL_37:

          goto LABEL_12;
        }
      }
    }
    uint64_t v6 = 0;
    goto LABEL_12;
  }
  return [(NSNumber *)dataCollectionEnabledNum BOOLValue];
}

+ (id)eventStreamPropertiesFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() eventStreamPropertiesFromDictionary:v3 defaultProperties:0];

  return v4;
}

+ (id)eventStreamPropertiesFromDictionary:(id)a3 defaultProperties:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_CDEventStreamProperties alloc] initFromDictionary:v6 defaultProperties:v5];

  return v7;
}

- (id)initFromDictionary:(id)a3 defaultProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)_CDEventStreamProperties;
  uint64_t v8 = [(_CDEventStreamProperties *)&v56 init];
  if (v8)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:kCDESPEventNameKey];
    name = v8->name;
    v8->name = (NSString *)v9;

    uint64_t v11 = [v6 objectForKeyedSubscript:kCDESPEventFormattedNameKey];
    formattedName = v8->formattedName;
    v8->formattedName = (NSString *)v11;

    uint64_t v13 = [v6 objectForKeyedSubscript:kCDESPKnowledgeBaseEventNameKey];
    knowledgeBaseName = v8->knowledgeBaseName;
    v8->knowledgeBaseName = (NSString *)v13;

    uint64_t v15 = [v6 objectForKeyedSubscript:kCDESPEventDescriptionKey];
    descriptionString = v8->descriptionString;
    v8->descriptionString = (NSString *)v15;

    uint64_t v17 = [v6 objectForKeyedSubscript:kCDESPPlatformsKey];
    platformObject = v8->_platformObject;
    v8->_platformObject = v17;

    uint64_t v19 = [v6 objectForKeyedSubscript:kCDESPDataCollectionKey];
    dataCollectionObject = v8->_dataCollectionObject;
    v8->_dataCollectionObject = v19;

    uint64_t v21 = [v6 objectForKeyedSubscript:kCDESPMonitorClassKey];
    monitorClass = v8->monitorClass;
    v8->monitorClass = (NSString *)v21;

    long long v23 = [v6 objectForKeyedSubscript:kCDESPEventTypeKey];
    long long v24 = v23;
    if (v23)
    {
      id v25 = v23;
      long long v26 = [@"_DK" stringByAppendingString:v25];
      Class v27 = NSClassFromString(v26);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        [NSString stringWithFormat:@"Unable to find matching class for '%@'. Check plist entry for '%@'.", v26, v25];
        id v55 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
        objc_exception_throw(v55);
      }
      uint64_t v28 = [(objc_class *)v27 performSelector:sel_type];

      valueType = v8->valueType;
      v8->valueType = (_DKObjectType *)v28;
    }
    else
    {
      uint64_t v30 = [v7 valueType];
      valueType = v8->valueType;
      v8->valueType = (_DKObjectType *)v30;
    }

    v31 = [v6 objectForKeyedSubscript:kCDESPSetupOnDemandKey];
    v32 = v31;
    if (v31) {
      char v33 = [v31 BOOLValue];
    }
    else {
      char v33 = [v7 setupOnDemand];
    }
    v8->setupOnDemand = v33;
    v34 = [v6 objectForKeyedSubscript:kCDESPTotalNumberOfEventsLimitKey];

    if (v34) {
      uint64_t v35 = [v34 integerValue];
    }
    else {
      uint64_t v35 = [v7 eventCountLimit];
    }
    v8->eventCountLimit = v35;
    v36 = [v6 objectForKeyedSubscript:kCDESPEphemeralityInSecondsKey];

    if (v36) {
      [v36 doubleValue];
    }
    else {
      [v7 timeToLive];
    }
    v8->timeToLive = v37;
    v38 = [v6 objectForKeyedSubscript:kCDESPTimestampPrecisionInSecondsKey];

    if (v38) {
      [v38 doubleValue];
    }
    else {
      [v7 temporalPrecision];
    }
    v8->temporalPrecision = v39;
    v40 = [v6 objectForKeyedSubscript:kCDESPRateLimitPeriodInSecondsKey];

    if (v40) {
      [v40 doubleValue];
    }
    else {
      [v7 period];
    }
    v8->period = v41;
    v42 = [v6 objectForKeyedSubscript:kCDESPRateLimitCountKey];

    if (v42) {
      [v42 doubleValue];
    }
    else {
      double v43 = (double)[v7 eventsPerPeriod];
    }
    v8->eventsPerPeriod = (uint64_t)v43;
    v44 = [v6 objectForKeyedSubscript:kCDESPIsInstant];

    if (v44) {
      char v45 = [v44 BOOLValue];
    }
    else {
      char v45 = [v7 isInstant];
    }
    v8->isInstant = v45;
    v46 = [v6 objectForKeyedSubscript:kCDESPIsHistorical];

    if (v46) {
      char v47 = [v46 BOOLValue];
    }
    else {
      char v47 = [v7 isHistorical];
    }
    v8->isHistorical = v47;
    v48 = [v6 objectForKey:kCDESPShouldSaveCurrentEventOnShutdown];

    if (v48) {
      char v49 = [v48 BOOLValue];
    }
    else {
      char v49 = [v7 shouldSaveCurrentEventOnShutdown];
    }
    v8->shouldSaveCurrentEventOnShutdown = v49;
    v50 = [v6 objectForKeyedSubscript:kCDESPPollingPeriod];
    v51 = v50;
    if (v50)
    {
      id v52 = v50;
      if ([v52 isEqualToString:@"Min"])
      {
        uint64_t v53 = 1;
      }
      else if ([v52 isEqualToString:@"4Hour"])
      {
        uint64_t v53 = 2;
      }
      else if ([v52 isEqualToString:@"6Hour"])
      {
        uint64_t v53 = 3;
      }
      else if ([v52 isEqualToString:@"12Hour"])
      {
        uint64_t v53 = 4;
      }
      else if ([v52 isEqualToString:@"18Hour"])
      {
        uint64_t v53 = 5;
      }
      else if ([v52 isEqualToString:@"24Hour"])
      {
        uint64_t v53 = 6;
      }
      else
      {
        uint64_t v53 = 7;
      }
    }
    else
    {
      uint64_t v53 = [v7 pollingPeriod];
    }
    v8->pollingPeriod = v53;
  }
  return v8;
}

- (NSString)formattedName
{
  return self->formattedName;
}

- (NSString)knowledgeBaseName
{
  return self->knowledgeBaseName;
}

- (NSString)knowledgeBaseMetadataClass
{
  return self->knowledgeBaseMetadataClass;
}

- (NSString)descriptionString
{
  return self->descriptionString;
}

- (NSString)monitorClass
{
  return self->monitorClass;
}

- (BOOL)setupOnDemand
{
  return self->setupOnDemand;
}

- (BOOL)isInstant
{
  return self->isInstant;
}

- (BOOL)shouldSaveCurrentEventOnShutdown
{
  return self->shouldSaveCurrentEventOnShutdown;
}

- (int64_t)pollingPeriod
{
  return self->pollingPeriod;
}

- (NSObject)dataCollectionObject
{
  return self->_dataCollectionObject;
}

- (NSNumber)dataCollectionEnabledNum
{
  return self->_dataCollectionEnabledNum;
}

- (NSObject)platformObject
{
  return self->_platformObject;
}

- (NSNumber)isAvailableNum
{
  return self->_isAvailableNum;
}

- (NSNumber)domainAvailabilityNum
{
  return self->_domainAvailabilityNum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAvailabilityNum, 0);
  objc_storeStrong((id *)&self->_isAvailableNum, 0);
  objc_storeStrong((id *)&self->_platformObject, 0);
  objc_storeStrong((id *)&self->_dataCollectionEnabledNum, 0);
  objc_storeStrong((id *)&self->_dataCollectionObject, 0);
  objc_storeStrong((id *)&self->valueType, 0);
  objc_storeStrong((id *)&self->monitorClass, 0);
  objc_storeStrong((id *)&self->descriptionString, 0);
  objc_storeStrong((id *)&self->knowledgeBaseMetadataClass, 0);
  objc_storeStrong((id *)&self->knowledgeBaseName, 0);
  objc_storeStrong((id *)&self->formattedName, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end