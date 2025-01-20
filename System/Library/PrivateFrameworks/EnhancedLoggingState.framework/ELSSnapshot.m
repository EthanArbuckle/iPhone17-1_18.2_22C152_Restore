@interface ELSSnapshot
+ (id)consentToString:(unint64_t)a3;
+ (id)statusToString:(unint64_t)a3;
- (BOOL)needsFollowup;
- (ELSSnapshot)init;
- (NSArray)consentHandles;
- (NSArray)encodedQueue;
- (NSArray)identifiersToRetry;
- (NSArray)queue;
- (NSArray)targetDevices;
- (NSData)consentData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)followUpOptions;
- (NSDictionary)metadata;
- (NSNumber)uploadCompletedPercentage;
- (NSUserDefaults)defaults;
- (double)durationRemaining;
- (double)totalDuration;
- (id)JSONObject;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodeQueue:(id)a3;
- (id)dedSessionIdentifier;
- (id)description;
- (id)dictionaryRepresentationPretty:(BOOL)a3;
- (id)sessionDevice;
- (int64_t)retriesRemaining;
- (unint64_t)consent;
- (unint64_t)status;
- (void)JSONObject;
- (void)refreshConsent;
- (void)refreshConsentData;
- (void)refreshConsentHandles;
- (void)refreshDates;
- (void)refreshFollowUpOptions;
- (void)refreshIdentifiersToRetry;
- (void)refreshKeyPaths:(id)a3;
- (void)refreshMetadata;
- (void)refreshQueue;
- (void)refreshRetriesRemaining;
- (void)refreshSessionDevice;
- (void)refreshStatus;
- (void)refreshUploadCompletedPercentage;
- (void)setConsent:(unint64_t)a3;
- (void)setConsentData:(id)a3;
- (void)setConsentHandles:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setFollowUpOptions:(id)a3;
- (void)setIdentifiersToRetry:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRetriesRemaining:(int64_t)a3;
- (void)setStartDate:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)setTargetDevices:(id)a3;
- (void)setUploadCompletedPercentage:(id)a3;
@end

@implementation ELSSnapshot

- (ELSSnapshot)init
{
  if (init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global_2);
  }
  v10.receiver = self;
  v10.super_class = (Class)ELSSnapshot;
  v3 = [(ELSSnapshot *)&v10 init];
  if (v3)
  {
    if (CheckerBoardServicesLibraryCore())
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x2050000000;
      v4 = (void *)getCBSUtilitiesClass_softClass;
      uint64_t v15 = getCBSUtilitiesClass_softClass;
      if (!getCBSUtilitiesClass_softClass)
      {
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __getCBSUtilitiesClass_block_invoke;
        v11[3] = &unk_264522F28;
        v11[4] = &v12;
        __getCBSUtilitiesClass_block_invoke((uint64_t)v11);
        v4 = (void *)v13[3];
      }
      id v5 = v4;
      _Block_object_dispose(&v12, 8);
      if (([v5 isCheckerBoardActive] & 1) == 0)
      {
        uint64_t v6 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.enhanced-logging-state"];
        defaults = v3->_defaults;
        v3->_defaults = (NSUserDefaults *)v6;
      }
    }
    v8 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"status", @"consent", @"dates", @"queue", @"consentHandles", @"retriesRemaining", @"identifiersToRetry", @"metadata", @"uploadCompletedPercentage", @"followUpOptions", @"targetDevices", @"consentData", 0);
    [(ELSSnapshot *)v3 refreshKeyPaths:v8];
  }
  return v3;
}

uint64_t __19__ELSSnapshot_init__block_invoke()
{
  return +[ELSEntitlementUtilities assertCurrentProcessHasEntitlement];
}

- (void)refreshKeyPaths:(id)a3
{
  id v4 = a3;
  if ([v4 containsObject:@"status"]) {
    [(ELSSnapshot *)self refreshStatus];
  }
  if ([v4 containsObject:@"consent"]) {
    [(ELSSnapshot *)self refreshConsent];
  }
  if ([v4 containsObject:@"dates"]) {
    [(ELSSnapshot *)self refreshDates];
  }
  if ([v4 containsObject:@"queue"]) {
    [(ELSSnapshot *)self refreshQueue];
  }
  if ([v4 containsObject:@"consentHandles"]) {
    [(ELSSnapshot *)self refreshConsentHandles];
  }
  if ([v4 containsObject:@"retriesRemaining"]) {
    [(ELSSnapshot *)self refreshRetriesRemaining];
  }
  if ([v4 containsObject:@"identifiersToRetry"]) {
    [(ELSSnapshot *)self refreshIdentifiersToRetry];
  }
  if ([v4 containsObject:@"metadata"]) {
    [(ELSSnapshot *)self refreshMetadata];
  }
  if ([v4 containsObject:@"uploadCompletedPercentage"]) {
    [(ELSSnapshot *)self refreshUploadCompletedPercentage];
  }
  if ([v4 containsObject:@"followUpOptions"]) {
    [(ELSSnapshot *)self refreshFollowUpOptions];
  }
  if ([v4 containsObject:@"targetDevices"]) {
    [(ELSSnapshot *)self refreshSessionDevice];
  }
  if ([v4 containsObject:@"consentData"]) {
    [(ELSSnapshot *)self refreshConsentData];
  }
}

- (void)refreshStatus
{
  v3 = [(ELSSnapshot *)self defaults];
  id v5 = [v3 objectForKey:@"status"];

  if (v5) {
    uint64_t v4 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }
  [(ELSSnapshot *)self setStatus:v4];
}

- (void)refreshConsent
{
  v3 = [(ELSSnapshot *)self defaults];
  id v5 = [v3 objectForKey:@"consent"];

  if (v5) {
    uint64_t v4 = [v5 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = 0;
  }
  [(ELSSnapshot *)self setConsent:v4];
}

- (void)refreshDates
{
  v3 = [(ELSSnapshot *)self defaults];
  id v6 = [v3 objectForKey:@"dates"];

  if (v6)
  {
    uint64_t v4 = [v6 objectForKeyedSubscript:@"startDate"];
    [(ELSSnapshot *)self setStartDate:v4];

    id v5 = [v6 objectForKeyedSubscript:@"endDate"];
    [(ELSSnapshot *)self setEndDate:v5];
  }
  else
  {
    [(ELSSnapshot *)self setStartDate:0];
    [(ELSSnapshot *)self setEndDate:0];
  }
}

- (void)refreshQueue
{
  v3 = [(ELSSnapshot *)self defaults];
  id v5 = [v3 objectForKey:@"queue"];

  if (v5)
  {
    uint64_t v4 = [(ELSSnapshot *)self decodeQueue:v5];
    [(ELSSnapshot *)self setQueue:v4];
  }
  else
  {
    [(ELSSnapshot *)self setQueue:0];
  }
}

- (void)refreshConsentHandles
{
  id v4 = [(ELSSnapshot *)self defaults];
  v3 = [v4 objectForKey:@"consentHandles"];
  [(ELSSnapshot *)self setConsentHandles:v3];
}

- (void)refreshSessionDevice
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F731000, a2, OS_LOG_TYPE_ERROR, "Could not decode enhanced logging state session device: %@", (uint8_t *)&v2, 0xCu);
}

- (void)refreshConsentData
{
  id v4 = [(ELSSnapshot *)self defaults];
  uint64_t v3 = [v4 objectForKey:@"consentData"];
  [(ELSSnapshot *)self setConsentData:v3];
}

- (void)refreshRetriesRemaining
{
  uint64_t v3 = [(ELSSnapshot *)self defaults];
  id v5 = [v3 objectForKey:@"retriesRemaining"];

  if (v5) {
    uint64_t v4 = [v5 integerValue];
  }
  else {
    uint64_t v4 = 0;
  }
  [(ELSSnapshot *)self setRetriesRemaining:v4];
}

- (void)refreshIdentifiersToRetry
{
  id v4 = [(ELSSnapshot *)self defaults];
  uint64_t v3 = [v4 objectForKey:@"identifiersToRetry"];
  [(ELSSnapshot *)self setIdentifiersToRetry:v3];
}

- (void)refreshMetadata
{
  id v4 = [(ELSSnapshot *)self defaults];
  uint64_t v3 = [v4 objectForKey:@"metadata"];
  [(ELSSnapshot *)self setMetadata:v3];
}

- (void)refreshUploadCompletedPercentage
{
  id v4 = [(ELSSnapshot *)self defaults];
  uint64_t v3 = [v4 objectForKey:@"uploadCompletedPercentage"];
  [(ELSSnapshot *)self setUploadCompletedPercentage:v3];
}

- (void)refreshFollowUpOptions
{
  id v4 = [(ELSSnapshot *)self defaults];
  uint64_t v3 = [v4 objectForKey:@"followUpOptions"];
  [(ELSSnapshot *)self setFollowUpOptions:v3];
}

- (double)durationRemaining
{
  uint64_t v3 = [(ELSSnapshot *)self endDate];

  if (!v3) {
    return 0.0;
  }
  id v4 = [(ELSSnapshot *)self endDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  return v6;
}

- (double)totalDuration
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v2 = [(ELSSnapshot *)self queue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 executeAfterDuration];
        if (v9 > v6)
        {
          [v8 executeAfterDuration];
          double v6 = v10;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (BOOL)needsFollowup
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(ELSSnapshot *)self queue];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        double v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) type];
        v7 = +[ELSWhitelist findEntryForBundleIdentifier:v6];

        if (v7 && [v7 requiresFollowup])
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (NSArray)encodedQueue
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [(ELSSnapshot *)self queue];

  if (v4)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v5 = [(ELSSnapshot *)self queue];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      id v9 = 0;
      uint64_t v10 = *(void *)v21;
      *(void *)&long long v7 = 138412290;
      long long v18 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          long long v12 = v9;
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          id v19 = v9;
          uint64_t v14 = objc_msgSend(MEMORY[0x263F08910], "archivedDataWithRootObject:requiringSecureCoding:error:", v13, 1, &v19, v18);
          id v9 = v19;

          if (v14)
          {
            [v3 addObject:v14];
          }
          else if (v9)
          {
            long long v15 = ELSLogHandleForCategory(11);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v18;
              id v25 = v9;
              _os_log_error_impl(&dword_21F731000, v15, OS_LOG_TYPE_ERROR, "Could not encode enhanced logging state queue entry: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }
  }
  v16 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return (NSArray *)v16;
}

- (id)decodeQueue:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v21 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v23)
  {
    id v4 = 0;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        uint64_t v6 = v4;
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x263F08928];
        id v9 = (void *)MEMORY[0x263EFFA08];
        uint64_t v10 = objc_opt_class();
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = objc_opt_class();
        uint64_t v13 = objc_opt_class();
        uint64_t v14 = objc_opt_class();
        long long v15 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
        id v24 = v6;
        v16 = [v8 unarchivedObjectOfClasses:v15 fromData:v7 error:&v24];
        id v4 = v24;

        if (v16)
        {
          [v21 addObject:v16];
        }
        else if (v4)
        {
          uint64_t v17 = ELSLogHandleForCategory(11);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v30 = v4;
            _os_log_error_impl(&dword_21F731000, v17, OS_LOG_TYPE_ERROR, "Could not decode enhanced logging state queue entry: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v23);
  }
  long long v18 = [MEMORY[0x263EFF8C0] arrayWithArray:v21];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_status;
  v5[2] = self->_consent;
  uint64_t v6 = [(NSDate *)self->_startDate copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSDate *)self->_endDate copyWithZone:a3];
  id v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSArray *)self->_queue copyWithZone:a3];
  uint64_t v11 = (void *)v5[5];
  v5[5] = v10;

  v5[6] = self->_retriesRemaining;
  uint64_t v12 = [(NSArray *)self->_identifiersToRetry copyWithZone:a3];
  uint64_t v13 = (void *)v5[7];
  v5[7] = v12;

  uint64_t v14 = [(NSDictionary *)self->_metadata copyWithZone:a3];
  long long v15 = (void *)v5[8];
  v5[8] = v14;

  uint64_t v16 = [(NSNumber *)self->_uploadCompletedPercentage copyWithZone:a3];
  uint64_t v17 = (void *)v5[9];
  v5[9] = v16;

  uint64_t v18 = [(NSData *)self->_consentData copyWithZone:a3];
  id v19 = (void *)v5[13];
  v5[13] = v18;

  return v5;
}

+ (id)statusToString:(unint64_t)a3
{
  if (a3 > 8) {
    id v3 = @"Unknown";
  }
  else {
    id v3 = off_264522F60[a3];
  }
  return (id)[NSString stringWithFormat:@"%lu (%@)", a3, v3];
}

+ (id)consentToString:(unint64_t)a3
{
  if (a3 > 3) {
    id v3 = @"Unknown";
  }
  else {
    id v3 = off_264522FA8[a3];
  }
  return (id)[NSString stringWithFormat:@"%lu (%@)", a3, v3];
}

- (id)dictionaryRepresentationPretty:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v5 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [v5 setLocale:v6];

  [v5 setFormatterBehavior:1040];
  [v5 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
  uint64_t v7 = [(ELSSnapshot *)self queue];

  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v9 = [(ELSSnapshot *)self queue];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v68 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v51 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v50 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v50 objects:v68 count:16];
      }
      while (v11);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  long long v15 = [(ELSSnapshot *)self consentData];

  if (v15)
  {
    uint64_t v16 = [(ELSSnapshot *)self consentData];
    uint64_t v17 = [v16 base64EncodedStringWithOptions:0];
  }
  else
  {
    uint64_t v17 = 0;
  }
  v54 = @"status";
  if (v3)
  {
    v49 = +[ELSSnapshot statusToString:[(ELSSnapshot *)self status]];
    v67[0] = v49;
    v55 = @"consent";
    +[ELSSnapshot consentToString:[(ELSSnapshot *)self consent]];
  }
  else
  {
    v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ELSSnapshot status](self, "status"));
    v67[0] = v49;
    v55 = @"consent";
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ELSSnapshot consent](self, "consent"));
  v48 = };
  v67[1] = v48;
  v56 = @"startDate";
  v47 = [(ELSSnapshot *)self startDate];
  uint64_t v18 = objc_msgSend(v5, "stringFromDate:");
  v46 = (void *)v18;
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x263EFF9D0] null];
  }
  v39 = (void *)v18;
  v67[2] = v18;
  v57 = @"endDate";
  v45 = [(ELSSnapshot *)self endDate];
  uint64_t v19 = objc_msgSend(v5, "stringFromDate:");
  v44 = (void *)v19;
  if (!v19)
  {
    uint64_t v19 = [MEMORY[0x263EFF9D0] null];
  }
  v38 = (void *)v19;
  v67[3] = v19;
  v58 = @"queue";
  uint64_t v20 = (uint64_t)v8;
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x263EFF9D0] null];
  }
  v37 = (void *)v20;
  v67[4] = v20;
  v59 = @"consentHandles";
  uint64_t v21 = [(ELSSnapshot *)self consentHandles];
  v43 = (void *)v21;
  if (!v21)
  {
    uint64_t v21 = [MEMORY[0x263EFF9D0] null];
  }
  v36 = (void *)v21;
  v67[5] = v21;
  v60 = @"retriesRemaining";
  v42 = objc_msgSend(NSNumber, "numberWithInteger:", -[ELSSnapshot retriesRemaining](self, "retriesRemaining"));
  v67[6] = v42;
  v61 = @"identifiersToRetry";
  uint64_t v22 = [(ELSSnapshot *)self identifiersToRetry];
  v41 = (void *)v22;
  if (!v22)
  {
    uint64_t v22 = [MEMORY[0x263EFF9D0] null];
  }
  v35 = (void *)v22;
  v67[7] = v22;
  v62 = @"metadata";
  uint64_t v23 = [(ELSSnapshot *)self metadata];
  id v24 = (void *)v23;
  if (!v23)
  {
    uint64_t v23 = [MEMORY[0x263EFF9D0] null];
  }
  v34 = (void *)v23;
  v67[8] = v23;
  v63 = @"uploadCompletedPercentage";
  uint64_t v25 = [(ELSSnapshot *)self uploadCompletedPercentage];
  long long v26 = (void *)v25;
  if (!v25)
  {
    uint64_t v25 = [MEMORY[0x263EFF9D0] null];
  }
  v67[9] = v25;
  v64 = @"followUpOptions";
  long long v27 = [(ELSSnapshot *)self followUpOptions];
  long long v28 = v27;
  if (!v27)
  {
    long long v28 = [MEMORY[0x263EFF9D0] null];
  }
  v67[10] = v28;
  v65 = @"targetDevices";
  v29 = [(ELSSnapshot *)self targetDevices];
  id v30 = v29;
  if (!v29)
  {
    id v30 = [MEMORY[0x263EFF9D0] null];
  }
  v67[11] = v30;
  v66 = @"consentData";
  v31 = v17;
  if (!v17)
  {
    v31 = [MEMORY[0x263EFF9D0] null];
  }
  v67[12] = v31;
  id v40 = [NSDictionary dictionaryWithObjects:v67 forKeys:&v54 count:13];
  if (v17)
  {
    if (v29) {
      goto LABEL_39;
    }
  }
  else
  {

    if (v29) {
      goto LABEL_39;
    }
  }

LABEL_39:
  if (!v27) {

  }
  if (!v26) {
  if (!v24)
  }

  if (!v41) {
  if (!v43)
  }

  if (v8)
  {
    if (v44) {
      goto LABEL_51;
    }
  }
  else
  {

    if (v44) {
      goto LABEL_51;
    }
  }

LABEL_51:
  if (!v46) {

  }
  return v40;
}

- (id)dedSessionIdentifier
{
  int v2 = [(ELSSnapshot *)self metadata];
  BOOL v3 = [v2 objectForKey:@"enrollmentTicketNumber"];

  if ([v3 length])
  {
    id v4 = [@"com.apple.enhanced-logging-state" stringByAppendingFormat:@"-%@", v3];
  }
  else
  {
    id v4 = @"com.apple.enhanced-logging-state";
  }
  id v5 = v4;

  return v5;
}

- (id)JSONObject
{
  int v2 = [(ELSSnapshot *)self dictionaryRepresentationPretty:1];
  id v7 = 0;
  BOOL v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:1 error:&v7];
  id v4 = v7;
  if (v4)
  {
    id v5 = ELSLogHandleForCategory(11);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      [(ELSSnapshot *)(uint64_t)v4 JSONObject];
    }
  }
  return v3;
}

- (id)sessionDevice
{
  int v2 = [(ELSSnapshot *)self targetDevices];
  BOOL v3 = [v2 firstObject];

  return v3;
}

- (id)description
{
  BOOL v3 = [(ELSSnapshot *)self JSONObject];
  if (v3)
  {
    id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else
  {
    id v5 = [(ELSSnapshot *)self dictionaryRepresentationPretty:1];
    id v4 = [v5 description];
  }
  return v4;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)consent
{
  return self->_consent;
}

- (void)setConsent:(unint64_t)a3
{
  self->_consent = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSArray)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (int64_t)retriesRemaining
{
  return self->_retriesRemaining;
}

- (void)setRetriesRemaining:(int64_t)a3
{
  self->_retriesRemaining = a3;
}

- (NSArray)identifiersToRetry
{
  return self->_identifiersToRetry;
}

- (void)setIdentifiersToRetry:(id)a3
{
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSNumber)uploadCompletedPercentage
{
  return self->_uploadCompletedPercentage;
}

- (void)setUploadCompletedPercentage:(id)a3
{
}

- (NSDictionary)followUpOptions
{
  return self->_followUpOptions;
}

- (void)setFollowUpOptions:(id)a3
{
}

- (NSArray)consentHandles
{
  return self->_consentHandles;
}

- (void)setConsentHandles:(id)a3
{
}

- (NSArray)targetDevices
{
  return self->_targetDevices;
}

- (void)setTargetDevices:(id)a3
{
}

- (NSData)consentData
{
  return self->_consentData;
}

- (void)setConsentData:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_consentData, 0);
  objc_storeStrong((id *)&self->_targetDevices, 0);
  objc_storeStrong((id *)&self->_consentHandles, 0);
  objc_storeStrong((id *)&self->_followUpOptions, 0);
  objc_storeStrong((id *)&self->_uploadCompletedPercentage, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_identifiersToRetry, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)JSONObject
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F731000, a2, OS_LOG_TYPE_ERROR, "Error JSON serializing ELS Snapshot = %@", (uint8_t *)&v2, 0xCu);
}

@end