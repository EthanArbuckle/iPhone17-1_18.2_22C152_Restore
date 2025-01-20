@interface AAFAnalyticsEvent
+ (BOOL)supportsSecureCoding;
+ (id)analyticsEventWithName:(id)a3 eventCategory:(id)a4 initData:(id)a5;
- (AAFAnalyticsEvent)initWithCoder:(id)a3;
- (AAFAnalyticsEvent)initWithEventName:(id)a3 eventCategory:(id)a4 initData:(id)a5;
- (NSDictionary)reportData;
- (NSError)topLevelError;
- (NSNumber)clientType;
- (NSNumber)eventCategory;
- (NSString)clientBundleId;
- (NSString)clientName;
- (NSString)eventName;
- (double)eventCreationTime;
- (double)machAbsoluteTimeToMilliseconds:(unint64_t)a3;
- (double)machAbsoluteTimeToSeconds:(unint64_t)a3;
- (id)debugDescription;
- (id)objectForKeyedSubscript:(id)a3;
- (mach_timebase_info)clock_timebase;
- (unint64_t)initTime;
- (void)_populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4;
- (void)completeEvent;
- (void)encodeWithCoder:(id)a3;
- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3;
- (void)setClientBundleId:(id)a3;
- (void)setClientName:(id)a3;
- (void)setClientType:(id)a3;
- (void)setClock_timebase:(mach_timebase_info)a3;
- (void)setEventCreationTime:(double)a3;
- (void)setInitTime:(unint64_t)a3;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
- (void)setTopLevelError:(id)a3;
@end

@implementation AAFAnalyticsEvent

- (AAFAnalyticsEvent)initWithEventName:(id)a3 eventCategory:(id)a4 initData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)AAFAnalyticsEvent;
  v12 = [(AAFAnalyticsEvent *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_eventName, a3);
    objc_storeStrong((id *)&v13->_eventCategory, a4);
    if (v11) {
      v14 = (NSDictionary *)v11;
    }
    else {
      v14 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    reportData = v13->_reportData;
    v13->_reportData = v14;

    mach_timebase_info(&v13->_clock_timebase);
    v13->_initTime = mach_absolute_time();
    v16 = [MEMORY[0x1E4F1C9C8] now];
    [v16 timeIntervalSince1970];
    v13->_eventCreationTime = v17 * 1000.0;

    if (+[AFUtilities isInternalBuild])
    {
      v18 = (void *)CFPreferencesCopyAppValue(@"TelemetryInternalSignature", @"com.apple.AAAFoundation");
      [(AAFAnalyticsEvent *)v13 setObject:v18 forKeyedSubscript:@"internalTestSignature"];
    }
  }

  return v13;
}

+ (id)analyticsEventWithName:(id)a3 eventCategory:(id)a4 initData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = (void *)[objc_alloc((Class)a1) initWithEventName:v8 eventCategory:v9 initData:v10];
  }
  else
  {
    v12 = _AAFLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[AAFAnalyticsEvent analyticsEventWithName:eventCategory:initData:](v12);
    }

    id v11 = 0;
  }

  return v11;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_reportData objectForKeyedSubscript:a3];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = (void *)[(NSDictionary *)self->_reportData mutableCopy];
    [v8 setObject:v6 forKeyedSubscript:v7];
    id v9 = (NSDictionary *)[v8 copy];
    reportData = self->_reportData;
    self->_reportData = v9;
  }
  else
  {
    id v11 = _AAFLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[AAFAnalyticsEvent setObject:forKeyedSubscript:](v11);
    }
  }
}

- (void)completeEvent
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 eventName];
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD937000, a2, OS_LOG_TYPE_ERROR, "Already reported event %@", (uint8_t *)&v4, 0xCu);
}

- (id)debugDescription
{
  v3 = [(AAFAnalyticsEvent *)self topLevelError];

  int v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(AAFAnalyticsEvent *)self eventName];
  if (v3)
  {
    id v7 = [(AAFAnalyticsEvent *)self topLevelError];
    id v8 = [(AAFAnalyticsEvent *)self reportData];
    id v9 = [(AAFAnalyticsEvent *)self eventCategory];
    id v10 = [v4 stringWithFormat:@"<%@: %p> EventName: [%@], EventError: [%@], ReportData: %@, EventCategory: [%@]", v5, self, v6, v7, v8, v9];
  }
  else
  {
    id v7 = [(AAFAnalyticsEvent *)self reportData];
    id v8 = [(AAFAnalyticsEvent *)self eventCategory];
    id v10 = [v4 stringWithFormat:@"<%@: %p> EventName: [%@], ReportData: %@, EventCategory: [%@]", v5, self, v6, v7, v8];
  }

  return v10;
}

- (void)_populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v23 = a3;
  [(AAFAnalyticsEvent *)self setTopLevelError:v23];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v23, "code"));
  [(AAFAnalyticsEvent *)self setObject:v6 forKeyedSubscript:@"errorCode"];

  id v7 = [v23 domain];
  [(AAFAnalyticsEvent *)self setObject:v7 forKeyedSubscript:@"errorDomain"];

  id v8 = [v23 userInfo];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v10) {
    BOOL v11 = v4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v24 = v9;
    int v13 = 0;
    do
    {
      uint64_t v14 = v4;
      v15 = v10;
      uint64_t v12 = (v13 + 1);
      v16 = [NSString stringWithFormat:@"%@%u", @"underlyingErrorCode", v12];
      double v17 = [NSString stringWithFormat:@"%@%u", @"underlyingErrorDomain", v12];
      v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v10, "code"));
      [(AAFAnalyticsEvent *)self setObject:v18 forKeyedSubscript:v16];

      v19 = [v15 domain];
      [(AAFAnalyticsEvent *)self setObject:v19 forKeyedSubscript:v17];

      objc_super v20 = [v15 userInfo];
      id v10 = [v20 objectForKeyedSubscript:v24];

      if (!v10) {
        break;
      }
      unsigned int v21 = v13 + 2;
      ++v13;
      uint64_t v4 = v14;
    }
    while (v21 <= v14);
  }
  v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v12];
  [(AAFAnalyticsEvent *)self setObject:v22 forKeyedSubscript:@"numberOfUnderlyingErrors"];
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3
{
  if (a3) {
    [(AAFAnalyticsEvent *)self _populateUnderlyingErrorsStartingWithRootError:a3 maxDepth:AAFNumberofUnderlyingError];
  }
}

- (double)machAbsoluteTimeToSeconds:(unint64_t)a3
{
  unint64_t v4 = [(AAFAnalyticsEvent *)self clock_timebase] * a3;
  return (double)(v4 / ((unint64_t)[(AAFAnalyticsEvent *)self clock_timebase] >> 32))
       / 1000000000.0;
}

- (double)machAbsoluteTimeToMilliseconds:(unint64_t)a3
{
  unint64_t v4 = [(AAFAnalyticsEvent *)self clock_timebase] * a3;
  return (double)(v4 / ((unint64_t)[(AAFAnalyticsEvent *)self clock_timebase] >> 32))
       / 1000000.0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  eventName = self->_eventName;
  id v5 = a3;
  [v5 encodeObject:eventName forKey:@"_eventName"];
  [v5 encodeObject:self->_eventCategory forKey:@"_eventCategory"];
  [v5 encodeObject:self->_reportData forKey:@"_reportData"];
  [v5 encodeDouble:@"_eventCreationTime" forKey:self->_eventCreationTime];
  [v5 encodeObject:self->_clientName forKey:@"_clientName"];
  [v5 encodeObject:self->_clientBundleId forKey:@"_clientBundleId"];
  [v5 encodeObject:self->_clientType forKey:@"_clientType"];
}

- (AAFAnalyticsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AAFAnalyticsEvent *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventName"];
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_eventCategory"];
    eventCategory = v5->_eventCategory;
    v5->_eventCategory = (NSNumber *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_reportData"];
    reportData = v5->_reportData;
    v5->_reportData = (NSDictionary *)v17;

    [v4 decodeDoubleForKey:@"_eventCreationTime"];
    v5->_eventCreationTime = v19;
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientName"];
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientBundleId"];
    clientBundleId = v5->_clientBundleId;
    v5->_clientBundleId = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientType"];
    clientType = v5->_clientType;
    v5->_clientType = (NSNumber *)v24;
  }
  return v5;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSDictionary)reportData
{
  return self->_reportData;
}

- (NSNumber)eventCategory
{
  return self->_eventCategory;
}

- (NSNumber)clientType
{
  return self->_clientType;
}

- (void)setClientType:(id)a3
{
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (void)setClientBundleId:(id)a3
{
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (double)eventCreationTime
{
  return self->_eventCreationTime;
}

- (void)setEventCreationTime:(double)a3
{
  self->_eventCreationTime = a3;
}

- (unint64_t)initTime
{
  return self->_initTime;
}

- (void)setInitTime:(unint64_t)a3
{
  self->_initTime = a3;
}

- (mach_timebase_info)clock_timebase
{
  return self->_clock_timebase;
}

- (void)setClock_timebase:(mach_timebase_info)a3
{
  self->_clock_timebase = a3;
}

- (NSError)topLevelError
{
  return self->_topLevelError;
}

- (void)setTopLevelError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLevelError, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_clientType, 0);
  objc_storeStrong((id *)&self->_eventCategory, 0);
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (void)analyticsEventWithName:(os_log_t)log eventCategory:initData:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD937000, log, OS_LOG_TYPE_ERROR, "Failed to initialize AAFAnalyticsEvent. Please check if all required parameters are provided.", v1, 2u);
}

- (void)setObject:(os_log_t)log forKeyedSubscript:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DD937000, log, OS_LOG_TYPE_FAULT, "\"AAFAnalyticsEvent gets a nil key. Please check if the key is constructed properly.\"", v1, 2u);
}

@end