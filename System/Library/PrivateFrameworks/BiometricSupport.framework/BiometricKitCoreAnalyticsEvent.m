@interface BiometricKitCoreAnalyticsEvent
- (BOOL)postEvent;
- (BiometricKitCoreAnalyticsEvent)initWithName:(id)a3;
- (BiometricKitCoreAnalyticsEvent)initWithName:(id)a3 dictionary:(id)a4;
- (BiometricKitCoreAnalyticsEvent)initWithPersistedDataWithName:(id)a3;
- (NSDate)previousEventDate;
- (NSNumber)deviceEnclosureColor;
- (NSNumber)displayOn;
- (NSNumber)eventCanceled;
- (NSNumber)passcodeSet;
- (NSNumber)timeSinceLastEnrollment;
- (NSNumber)timeSinceLastEnrollmentBinned;
- (NSNumber)timeSinceLastEvent;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationArchiving:(BOOL)a3;
- (id)dictionaryRepresentationForClass:(Class)a3;
- (id)isPasscodeSet;
- (id)valueForUndefinedKey:(id)a3;
- (void)incrementCountField:(id)a3;
- (void)logAnalyticsDictionary:(id)a3;
- (void)persistData;
- (void)reset;
- (void)resetClass:(Class)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDisplayOn:(id)a3;
- (void)setEventCanceled:(id)a3;
- (void)setNilValueForKey:(id)a3;
- (void)setPasscodeSet:(id)a3;
- (void)setPreviousEventDate:(id)a3;
- (void)setTimeSinceLastEnrollment:(id)a3;
- (void)setTimeSinceLastEnrollmentBinned:(id)a3;
- (void)setTimeSinceLastEvent:(id)a3;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
- (void)updateBoundedFieldValue;
- (void)updateStatus;
@end

@implementation BiometricKitCoreAnalyticsEvent

- (BiometricKitCoreAnalyticsEvent)initWithName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BiometricKitCoreAnalyticsEvent;
  v6 = [(BiometricKitCoreAnalyticsEvent *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    [(BiometricKitCoreAnalyticsEvent *)v7 reset];
    v8 = NSNumber;
    v9 = (void *)MGCopyAnswer();
    uint64_t v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "integerValue"));
    deviceEnclosureColor = v7->_deviceEnclosureColor;
    v7->_deviceEnclosureColor = (NSNumber *)v10;
  }
  return v7;
}

- (BiometricKitCoreAnalyticsEvent)initWithName:(id)a3 dictionary:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(BiometricKitCoreAnalyticsEvent *)self initWithName:v6];
  if (v8)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v7;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      objc_super v13 = &_os_log_internal;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(NSString **)(*((void *)&v20 + 1) + 8 * i);
          v16 = [v9 objectForKey:v15];
          NSSelectorFromString(v15);
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
             || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
             && [(NSString *)v15 isEqualToString:@"previousEventDate"]))
          {
            [(BiometricKitCoreAnalyticsEvent *)v8 setValue:v16 forKey:v15];
          }
          else
          {
            if (__osLog) {
              v17 = __osLog;
            }
            else {
              v17 = v13;
            }
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              id v25 = v6;
              __int16 v26 = 2112;
              id v27 = v9;
              __int16 v28 = 2112;
              v29 = v15;
              _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent initWithName: %@ dictionary:%@ - throwing away unsupported key: %@\n", buf, 0x20u);
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v11);
    }

    id v7 = v19;
  }

  return v8;
}

- (BiometricKitCoreAnalyticsEvent)initWithPersistedDataWithName:(id)a3
{
  v4 = (void *)MEMORY[0x263F2AA60];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = [v6 objectOfClass:objc_opt_class() forKey:v5];
  v8 = [(BiometricKitCoreAnalyticsEvent *)self initWithName:v5 dictionary:v7];

  return v8;
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__osLog) {
    id v5 = __osLog;
  }
  else {
    id v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    eventName = self->_eventName;
    int v8 = 138412546;
    id v9 = eventName;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent(%@) valueForUndefinedKey: %@\n", (uint8_t *)&v8, 0x16u);
  }

  return 0;
}

- (void)setNilValueForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (__osLog) {
    id v5 = __osLog;
  }
  else {
    id v5 = &_os_log_internal;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    eventName = self->_eventName;
    int v7 = 138412546;
    int v8 = eventName;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_21FFF3000, v5, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent(%@) setNilValueForKey: %@\n", (uint8_t *)&v7, 0x16u);
  }
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (__osLog) {
    int v8 = __osLog;
  }
  else {
    int v8 = &_os_log_internal;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    eventName = self->_eventName;
    int v10 = 138412802;
    uint64_t v11 = eventName;
    __int16 v12 = 2112;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_ERROR, "BiometricKitCoreAnalyticsEvent(%@) setValue: %@ forUndefinedKey: %@\n", (uint8_t *)&v10, 0x20u);
  }
}

- (BOOL)postEvent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = &_os_log_internal;
  if (__osLog) {
    id v4 = __osLog;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    *(_DWORD *)buf = 138412290;
    long long v22 = eventName;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) postEvent\n", buf, 0xCu);
  }
  previousEventDate = self->_previousEventDate;
  if (previousEventDate)
  {
    id v7 = NSNumber;
    [(NSDate *)previousEventDate timeIntervalSinceNow];
    __int16 v9 = [v7 numberWithUnsignedInteger:(unint64_t)(v8 * -1000.0)];
    timeSinceLastEvent = self->_timeSinceLastEvent;
    self->_timeSinceLastEvent = v9;

    uint64_t v11 = self->_previousEventDate;
    self->_previousEventDate = 0;
  }
  [(BiometricKitCoreAnalyticsEvent *)self updateBoundedFieldValue];
  __int16 v12 = [(BiometricKitCoreAnalyticsEvent *)self getEventDictionary];
  uint64_t v20 = MEMORY[0x263EF8330];
  id v13 = v12;
  int v14 = AnalyticsSendEventLazy();
  if (__osLog) {
    id v15 = __osLog;
  }
  else {
    id v15 = v3;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = self->_eventName;
    *(_DWORD *)buf = 138412546;
    long long v22 = v16;
    __int16 v23 = 1024;
    int v24 = v14;
    _os_log_impl(&dword_21FFF3000, v15, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) postEvent - AnalyticsSendEventLazy result: %d\n", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x263EFF910], "now", v20, 3221225472, __43__BiometricKitCoreAnalyticsEvent_postEvent__block_invoke, &unk_26454E4F0, self);
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v18 = self->_previousEventDate;
  self->_previousEventDate = v17;

  [(BiometricKitCoreAnalyticsEvent *)self reset];
  return v14;
}

id __43__BiometricKitCoreAnalyticsEvent_postEvent__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logAnalyticsDictionary:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  return v2;
}

- (id)dictionaryRepresentationForClass:(Class)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int outCount = 0;
  id v6 = class_copyPropertyList(a3, &outCount);
  if (v6)
  {
    id v7 = v6;
    if (outCount)
    {
      for (unint64_t i = 0; i < outCount; ++i)
      {
        __int16 v9 = [NSString stringWithUTF8String:property_getName(v7[i])];
        int v10 = [(BiometricKitCoreAnalyticsEvent *)self valueForKey:v9];
        if (v10) {
          [v5 setObject:v10 forKey:v9];
        }
      }
    }
    else
    {
      if (__osLog) {
        __int16 v12 = __osLog;
      }
      else {
        __int16 v12 = &_os_log_internal;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        id v15 = "propertyCount";
        __int16 v16 = 2048;
        uint64_t v17 = 0;
        __int16 v18 = 2080;
        id v19 = &unk_22004A573;
        __int16 v20 = 2080;
        long long v21 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
        __int16 v22 = 1024;
        int v23 = 145;
        _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
      }
    }
    free(v7);
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return [(BiometricKitCoreAnalyticsEvent *)self dictionaryRepresentationArchiving:0];
}

- (id)dictionaryRepresentationArchiving:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = &_os_log_internal;
  if (__osLog) {
    id v6 = __osLog;
  }
  else {
    id v6 = &_os_log_internal;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    int v15 = 138412546;
    __int16 v16 = eventName;
    __int16 v17 = 1024;
    BOOL v18 = v3;
    _os_log_impl(&dword_21FFF3000, v6, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) dictionaryRepresentation: %d\n", (uint8_t *)&v15, 0x12u);
  }
  double v8 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 v9 = objc_opt_class();
  [(BiometricKitCoreAnalyticsEvent *)self updateStatus];
  if ([v9 isSubclassOfClass:objc_opt_class()])
  {
    do
    {
      int v10 = [(BiometricKitCoreAnalyticsEvent *)self dictionaryRepresentationForClass:v9];
      [v8 addEntriesFromDictionary:v10];

      __int16 v9 = (void *)[v9 superclass];
    }
    while (([v9 isSubclassOfClass:objc_opt_class()] & 1) != 0);
  }
  if (!v3)
  {
    if (__osLog) {
      uint64_t v11 = __osLog;
    }
    else {
      uint64_t v11 = v5;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = self->_eventName;
      privateProperties = self->_privateProperties;
      int v15 = 138412802;
      __int16 v16 = v12;
      __int16 v17 = 1024;
      BOOL v18 = 0;
      __int16 v19 = 2112;
      __int16 v20 = privateProperties;
      _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) dictionaryRepresentation: %d _privateProperties: %@\n", (uint8_t *)&v15, 0x1Cu);
    }
    [v8 removeObjectsForKeys:self->_privateProperties];
  }
  return v8;
}

- (void)resetClass:(Class)a3
{
  unsigned int outCount = 0;
  id v4 = class_copyPropertyList(a3, &outCount);
  id v5 = v4;
  if (v4 && outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      id v7 = [NSString stringWithUTF8String:property_getName(v5[i])];
      [(BiometricKitCoreAnalyticsEvent *)self setValue:0 forKey:v7];
    }
    goto LABEL_5;
  }
  if (v4) {
LABEL_5:
  }
    free(v5);
}

- (void)reset
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (__osLog) {
    BOOL v3 = __osLog;
  }
  else {
    BOOL v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    int v14 = 138412290;
    int v15 = eventName;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) reset event\n", (uint8_t *)&v14, 0xCu);
  }
  id v5 = objc_opt_class();
  id v6 = self->_previousEventDate;
  id v7 = self->_deviceEnclosureColor;
  if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    do
    {
      [(BiometricKitCoreAnalyticsEvent *)self resetClass:v5];
      id v5 = (void *)[v5 superclass];
    }
    while (([v5 isSubclassOfClass:objc_opt_class()] & 1) != 0);
  }
  eventCanceled = self->_eventCanceled;
  __int16 v9 = (NSNumber *)MEMORY[0x263EFFA80];
  self->_eventCanceled = (NSNumber *)MEMORY[0x263EFFA80];

  displayOn = self->_displayOn;
  self->_displayOn = v9;

  previousEventDate = self->_previousEventDate;
  self->_previousEventDate = v6;
  __int16 v12 = v6;

  deviceEnclosureColor = self->_deviceEnclosureColor;
  self->_deviceEnclosureColor = v7;
}

- (void)incrementCountField:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BiometricKitCoreAnalyticsEvent *)self valueForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
    [(BiometricKitCoreAnalyticsEvent *)self setValue:v6 forKey:v4];
  }
  else
  {
    if (__osLog) {
      id v7 = __osLog;
    }
    else {
      id v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136316162;
      __int16 v9 = "[fieldValue isKindOfClass:[NSNumber class]]";
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      id v13 = &unk_22004A573;
      __int16 v14 = 2080;
      int v15 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
      __int16 v16 = 1024;
      int v17 = 248;
      _os_log_impl(&dword_21FFF3000, v7, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v8, 0x30u);
    }
  }
}

- (void)setTimeSinceLastEnrollment:(id)a3
{
  id v11 = a3;
  objc_storeStrong((id *)&self->_timeSinceLastEnrollment, a3);
  NSUInteger v5 = [(NSNumber *)self->_timeSinceLastEnrollment unsignedIntegerValue];
  timeSinceLastEnrollment = self->_timeSinceLastEnrollment;
  if (v5 < 0x80)
  {
    __int16 v9 = timeSinceLastEnrollment;
  }
  else
  {
    uint64_t v7 = [(NSNumber *)timeSinceLastEnrollment unsignedIntegerValue];
    uint64_t v8 = ((unint64_t)(v7 - 128) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    __int16 v9 = [NSNumber numberWithUnsignedInteger:((v8 + ((unint64_t)(v7 - 128 - v8) >> 1)) >> 2) + 128];
  }
  timeSinceLastEnrollmentBinned = self->_timeSinceLastEnrollmentBinned;
  self->_timeSinceLastEnrollmentBinned = v9;
}

- (void)updateBoundedFieldValue
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v3 = self->_boundedFieldLimits;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v16;
    *(void *)&long long v5 = 138413058;
    long long v14 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        __int16 v10 = -[NSDictionary objectForKeyedSubscript:](self->_boundedFieldLimits, "objectForKeyedSubscript:", v9, v14, (void)v15);
        id v11 = [(BiometricKitCoreAnalyticsEvent *)self valueForKey:v9];
        if ([v11 compare:v10] == 1)
        {
          if (__osLog) {
            __int16 v12 = __osLog;
          }
          else {
            __int16 v12 = &_os_log_internal;
          }
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            eventName = self->_eventName;
            *(_DWORD *)buf = v14;
            __int16 v20 = eventName;
            __int16 v21 = 2112;
            uint64_t v22 = v9;
            __int16 v23 = 2112;
            uint64_t v24 = v11;
            __int16 v25 = 2112;
            __int16 v26 = v10;
            _os_log_impl(&dword_21FFF3000, v12, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) updateBoundedFieldValue bound field:%@ value:%@ to:%@\n", buf, 0x2Au);
          }
          [(BiometricKitCoreAnalyticsEvent *)self setValue:v10 forKey:v9];
        }
      }
      uint64_t v6 = [(NSDictionary *)v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v6);
  }
}

- (void)logAnalyticsDictionary:(id)a3
{
}

- (void)persistData
{
  id v4 = [MEMORY[0x263F2AA60] sharedInstance];
  BOOL v3 = [(BiometricKitCoreAnalyticsEvent *)self dictionaryRepresentationArchiving:1];
  [v4 setObject:v3 forKey:self->_eventName];
}

- (id)isPasscodeSet
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  BOOL v3 = &_os_log_internal;
  if (__osLog) {
    id v4 = __osLog;
  }
  else {
    id v4 = &_os_log_internal;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    eventName = self->_eventName;
    int v15 = 138412290;
    long long v16 = (const char *)eventName;
    _os_log_impl(&dword_21FFF3000, v4, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) isPasscodeSet\n", (uint8_t *)&v15, 0xCu);
  }
  uint64_t v6 = (void *)MKBGetDeviceLockStateInfo();
  uint64_t v7 = v6;
  if (!v6)
  {
    if (__osLog) {
      long long v14 = __osLog;
    }
    else {
      long long v14 = v3;
    }
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_28;
    }
    int v15 = 136316162;
    long long v16 = "deviceStateInfo";
    __int16 v17 = 2048;
    long long v18 = 0;
    __int16 v19 = 2080;
    __int16 v20 = &unk_22004A573;
    __int16 v21 = 2080;
    uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
    __int16 v23 = 1024;
    int v24 = 307;
    goto LABEL_27;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F55A48]];
  if (v8)
  {
    uint64_t v9 = v8;
    if (([v8 unsignedIntValue] & 2) != 0) {
      __int16 v10 = (void *)MEMORY[0x263EFFA80];
    }
    else {
      __int16 v10 = (void *)MEMORY[0x263EFFA88];
    }
    goto LABEL_11;
  }
  if (__osLog) {
    long long v14 = __osLog;
  }
  else {
    long long v14 = v3;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136316162;
    long long v16 = "keybagStateRaw";
    __int16 v17 = 2048;
    long long v18 = 0;
    __int16 v19 = 2080;
    __int16 v20 = &unk_22004A573;
    __int16 v21 = 2080;
    uint64_t v22 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/Analytics/BiometricKitCoreAnalyticsEvent.m";
    __int16 v23 = 1024;
    int v24 = 309;
LABEL_27:
    _os_log_impl(&dword_21FFF3000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v15, 0x30u);
  }
LABEL_28:
  uint64_t v9 = 0;
  __int16 v10 = 0;
LABEL_11:
  if (__osLog) {
    id v11 = __osLog;
  }
  else {
    id v11 = v3;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    __int16 v12 = self->_eventName;
    int v15 = 138412546;
    long long v16 = (const char *)v12;
    __int16 v17 = 2112;
    long long v18 = v10;
    _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEBUG, "BiometricKitCoreAnalyticsEvent(%@) isPasscodeSet: %@\n", (uint8_t *)&v15, 0x16u);
  }

  return v10;
}

- (void)updateStatus
{
  self->_passcodeSet = [(BiometricKitCoreAnalyticsEvent *)self isPasscodeSet];
  MEMORY[0x270F9A758]();
}

- (NSNumber)eventCanceled
{
  return self->_eventCanceled;
}

- (void)setEventCanceled:(id)a3
{
}

- (NSNumber)displayOn
{
  return self->_displayOn;
}

- (void)setDisplayOn:(id)a3
{
}

- (NSNumber)passcodeSet
{
  return self->_passcodeSet;
}

- (void)setPasscodeSet:(id)a3
{
}

- (NSNumber)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

- (NSNumber)timeSinceLastEnrollment
{
  return self->_timeSinceLastEnrollment;
}

- (NSNumber)timeSinceLastEnrollmentBinned
{
  return self->_timeSinceLastEnrollmentBinned;
}

- (void)setTimeSinceLastEnrollmentBinned:(id)a3
{
}

- (NSNumber)timeSinceLastEvent
{
  return self->_timeSinceLastEvent;
}

- (void)setTimeSinceLastEvent:(id)a3
{
}

- (NSDate)previousEventDate
{
  return self->_previousEventDate;
}

- (void)setPreviousEventDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousEventDate, 0);
  objc_storeStrong((id *)&self->_timeSinceLastEvent, 0);
  objc_storeStrong((id *)&self->_timeSinceLastEnrollmentBinned, 0);
  objc_storeStrong((id *)&self->_timeSinceLastEnrollment, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_passcodeSet, 0);
  objc_storeStrong((id *)&self->_displayOn, 0);
  objc_storeStrong((id *)&self->_eventCanceled, 0);
  objc_storeStrong((id *)&self->_boundedFieldLimits, 0);
  objc_storeStrong((id *)&self->_privateProperties, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end