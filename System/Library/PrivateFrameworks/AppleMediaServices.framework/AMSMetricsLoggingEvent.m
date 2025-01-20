@interface AMSMetricsLoggingEvent
+ (id)_propertyValueClassesForKnownProperties;
+ (id)shouldSampleErrorsWithBag:(id)a3;
- (AMSMetricsLoggingEvent)initWithSubsystem:(id)a3 category:(id)a4 error:(id)a5;
- (BOOL)errorUserInfoEngagementPresented;
- (BOOL)eventInlineInterruption;
- (BOOL)underlyingErrorUserInfoEngagementPresented;
- (NSArray)eventDestinations;
- (NSArray)jsVersionMap;
- (NSDictionary)breadcrumbs;
- (NSDictionary)jsVersions;
- (NSError)error;
- (NSMutableDictionary)underlyingDictionaryForSentry;
- (NSString)category;
- (NSString)clientApp;
- (NSString)clientBuildType;
- (NSString)currentProcess;
- (NSString)engagementEventType;
- (NSString)errorDomain;
- (NSString)errorMessage;
- (NSString)errorTitle;
- (NSString)eventParamEventType;
- (NSString)eventParamItemId;
- (NSString)eventParamProductType;
- (NSString)eventParamSource;
- (NSString)eventParamSuccess;
- (NSString)eventPlacement;
- (NSString)eventServiceType;
- (NSString)lastBreadcrumb;
- (NSString)originatingURL;
- (NSString)originatingURLParamBagProfile;
- (NSString)originatingURLParamBagProfileVersion;
- (NSString)releaseVersion;
- (NSString)subsystem;
- (NSString)underlyingErrorDomain;
- (NSString)underlyingErrorMessage;
- (NSString)underlyingErrorTitle;
- (NSString)url;
- (NSString)urlParamBagProfile;
- (NSString)urlParamBagProfileVersion;
- (double)eventEndTime;
- (double)eventStartTime;
- (double)lastBreadcrumbDuration;
- (id)cleanURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getBuildType;
- (id)stringForLogLevel:(int64_t)a3;
- (id)underlyingDictionaryOverride;
- (int64_t)errorCode;
- (int64_t)errorUserInfoCryptoCode;
- (int64_t)errorUserInfoServerErrorCode;
- (int64_t)errorUserInfoStatusCode;
- (int64_t)logLevel;
- (int64_t)underlyingErrorCode;
- (int64_t)underlyingErrorUserInfoCryptoCode;
- (int64_t)underlyingErrorUserInfoServerErrorCode;
- (int64_t)underlyingErrorUserInfoStatusCode;
- (void)prepareEvent;
- (void)setBreadcrumbs:(id)a3;
- (void)setCategory:(id)a3;
- (void)setClientApp:(id)a3;
- (void)setClientBuildType:(id)a3;
- (void)setCurrentProcess:(id)a3;
- (void)setEngagementEventType:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDomain:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setErrorTitle:(id)a3;
- (void)setErrorUserInfoCryptoCode:(int64_t)a3;
- (void)setErrorUserInfoEngagementPresented:(BOOL)a3;
- (void)setErrorUserInfoServerErrorCode:(int64_t)a3;
- (void)setErrorUserInfoStatusCode:(int64_t)a3;
- (void)setEventDestinations:(id)a3;
- (void)setEventEndTime:(double)a3;
- (void)setEventInlineInterruption:(BOOL)a3;
- (void)setEventParamEventType:(id)a3;
- (void)setEventParamItemId:(id)a3;
- (void)setEventParamProductType:(id)a3;
- (void)setEventParamSource:(id)a3;
- (void)setEventParamSuccess:(id)a3;
- (void)setEventPlacement:(id)a3;
- (void)setEventServiceType:(id)a3;
- (void)setEventStartTime:(double)a3;
- (void)setJsVersionMap:(id)a3;
- (void)setJsVersions:(id)a3;
- (void)setLogLevel:(int64_t)a3;
- (void)setOriginatingURL:(id)a3;
- (void)setOriginatingURLParamBagProfile:(id)a3;
- (void)setOriginatingURLParamBagProfileVersion:(id)a3;
- (void)setReleaseVersion:(id)a3;
- (void)setSubsystem:(id)a3;
- (void)setUnderlyingErrorCode:(int64_t)a3;
- (void)setUnderlyingErrorDomain:(id)a3;
- (void)setUnderlyingErrorMessage:(id)a3;
- (void)setUnderlyingErrorTitle:(id)a3;
- (void)setUnderlyingErrorUserInfoCryptoCode:(int64_t)a3;
- (void)setUnderlyingErrorUserInfoEngagementPresented:(BOOL)a3;
- (void)setUnderlyingErrorUserInfoServerErrorCode:(int64_t)a3;
- (void)setUnderlyingErrorUserInfoStatusCode:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUrlParamBagProfile:(id)a3;
- (void)setUrlParamBagProfileVersion:(id)a3;
@end

@implementation AMSMetricsLoggingEvent

- (AMSMetricsLoggingEvent)initWithSubsystem:(id)a3 category:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AMSMetricsLoggingEvent;
  v11 = [(AMSMetricsEvent *)&v14 initWithTopic:@"xp_amp_ams_log"];
  v12 = v11;
  if (v11)
  {
    [(AMSMetricsEvent *)v11 setSuppressEngagement:1];
    [(AMSMetricsLoggingEvent *)v12 setSubsystem:v8];
    [(AMSMetricsLoggingEvent *)v12 setCategory:v9];
    objc_storeStrong((id *)&v12->_error, a5);
    [(AMSMetricsLoggingEvent *)v12 prepareEvent];
  }

  return v12;
}

- (void)prepareEvent
{
  [(AMSMetricsEvent *)self setAnonymous:1];
  [(AMSMetricsEvent *)self setCheckDiagnosticsAndUsageSetting:1];
  v3 = +[AMSProcessInfo currentProcess];
  v4 = [v3 bundleIdentifier];
  [(AMSMetricsLoggingEvent *)self setClientApp:v4];

  v5 = [(AMSMetricsLoggingEvent *)self getBuildType];
  [(AMSMetricsLoggingEvent *)self setClientBuildType:v5];

  v6 = +[AMSProcessInfo currentProcess];
  v7 = [v6 bundleIdentifier];
  [(AMSMetricsLoggingEvent *)self setCurrentProcess:v7];

  [(AMSMetricsEvent *)self setEventType:@"log"];
  [(AMSMetricsLoggingEvent *)self setLogLevel:1];
  id v8 = [(AMSMetricsLoggingEvent *)self originatingURL];
  if (v8)
  {
    [(AMSMetricsLoggingEvent *)self setOriginatingURL:v8];
  }
  else
  {
    id v9 = [(AMSMetricsLoggingEvent *)self error];
    id v10 = [v9 userInfo];
    v11 = [v10 objectForKeyedSubscript:@"AMSURL"];
    [(AMSMetricsLoggingEvent *)self setOriginatingURL:v11];
  }
  v12 = +[AMSProcessInfo currentProcess];
  v13 = [v12 clientVersion];
  [(AMSMetricsLoggingEvent *)self setReleaseVersion:v13];

  objc_super v14 = [(AMSMetricsLoggingEvent *)self error];
  -[AMSMetricsLoggingEvent setErrorCode:](self, "setErrorCode:", [v14 code]);

  v15 = [(AMSMetricsLoggingEvent *)self error];
  v16 = [v15 domain];
  [(AMSMetricsLoggingEvent *)self setErrorDomain:v16];

  v17 = [(AMSMetricsLoggingEvent *)self error];
  v18 = objc_msgSend(v17, "ams_title");
  [(AMSMetricsLoggingEvent *)self setErrorTitle:v18];

  v19 = [(AMSMetricsLoggingEvent *)self error];
  v20 = objc_msgSend(v19, "ams_message");
  [(AMSMetricsLoggingEvent *)self setErrorMessage:v20];

  v21 = [(AMSMetricsLoggingEvent *)self error];
  v22 = [v21 userInfo];
  v23 = [v22 objectForKeyedSubscript:@"AMSCryptoErrorCode"];
  -[AMSMetricsLoggingEvent setErrorUserInfoCryptoCode:](self, "setErrorUserInfoCryptoCode:", [v23 integerValue]);

  v24 = [(AMSMetricsLoggingEvent *)self error];
  v25 = [v24 userInfo];
  v26 = [v25 objectForKeyedSubscript:@"AMSEngagementPresented"];
  -[AMSMetricsLoggingEvent setErrorUserInfoEngagementPresented:](self, "setErrorUserInfoEngagementPresented:", [v26 BOOLValue]);

  v27 = [(AMSMetricsLoggingEvent *)self error];
  v28 = [v27 userInfo];
  v29 = [v28 objectForKeyedSubscript:@"AMSServerErrorCode"];
  -[AMSMetricsLoggingEvent setErrorUserInfoServerErrorCode:](self, "setErrorUserInfoServerErrorCode:", [v29 integerValue]);

  v30 = [(AMSMetricsLoggingEvent *)self error];
  v31 = [v30 userInfo];
  v32 = [v31 objectForKeyedSubscript:@"AMSStatusCode"];
  -[AMSMetricsLoggingEvent setErrorUserInfoStatusCode:](self, "setErrorUserInfoStatusCode:", [v32 integerValue]);

  v33 = [(AMSMetricsLoggingEvent *)self clientApp];
  if (([v33 isEqual:@"com.apple.Fitness"] & 1) == 0)
  {
    v34 = [(AMSMetricsLoggingEvent *)self clientApp];
    char v35 = [v34 isEqual:@"com.apple.fitcored"];

    if (v35) {
      goto LABEL_8;
    }
    v36 = +[AMSDevice buildVersion];
    [(AMSMetricsEvent *)self setOsBuildVersion:v36];

    v33 = +[AMSDevice operatingSystem];
    [(AMSMetricsEvent *)self setOsName:v33];
  }

LABEL_8:
  v37 = [(AMSMetricsLoggingEvent *)self error];
  v38 = objc_msgSend(v37, "ams_underlyingError");
  -[AMSMetricsLoggingEvent setUnderlyingErrorCode:](self, "setUnderlyingErrorCode:", [v38 code]);

  v39 = [(AMSMetricsLoggingEvent *)self error];
  v40 = objc_msgSend(v39, "ams_underlyingError");
  v41 = [v40 domain];
  [(AMSMetricsLoggingEvent *)self setUnderlyingErrorDomain:v41];

  v42 = [(AMSMetricsLoggingEvent *)self error];
  v43 = objc_msgSend(v42, "ams_underlyingError");
  v44 = objc_msgSend(v43, "ams_message");
  [(AMSMetricsLoggingEvent *)self setUnderlyingErrorMessage:v44];

  v45 = [(AMSMetricsLoggingEvent *)self error];
  v46 = objc_msgSend(v45, "ams_underlyingError");
  v47 = objc_msgSend(v46, "ams_title");
  [(AMSMetricsLoggingEvent *)self setUnderlyingErrorTitle:v47];

  v48 = [(AMSMetricsLoggingEvent *)self error];
  v49 = objc_msgSend(v48, "ams_underlyingError");
  v50 = [v49 userInfo];
  v51 = [v50 objectForKeyedSubscript:@"AMSCryptoErrorCode"];
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoCryptoCode:](self, "setUnderlyingErrorUserInfoCryptoCode:", [v51 integerValue]);

  v52 = [(AMSMetricsLoggingEvent *)self error];
  v53 = objc_msgSend(v52, "ams_underlyingError");
  v54 = [v53 userInfo];
  v55 = [v54 objectForKeyedSubscript:@"AMSEngagementPresented"];
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoEngagementPresented:](self, "setUnderlyingErrorUserInfoEngagementPresented:", [v55 BOOLValue]);

  v56 = [(AMSMetricsLoggingEvent *)self error];
  v57 = objc_msgSend(v56, "ams_underlyingError");
  v58 = [v57 userInfo];
  v59 = [v58 objectForKeyedSubscript:@"AMSServerErrorCode"];
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoServerErrorCode:](self, "setUnderlyingErrorUserInfoServerErrorCode:", [v59 integerValue]);

  id v63 = [(AMSMetricsLoggingEvent *)self error];
  v60 = objc_msgSend(v63, "ams_underlyingError");
  v61 = [v60 userInfo];
  v62 = [v61 objectForKeyedSubscript:@"AMSStatusCode"];
  -[AMSMetricsLoggingEvent setUnderlyingErrorUserInfoStatusCode:](self, "setUnderlyingErrorUserInfoStatusCode:", [v62 integerValue]);
}

- (id)getBuildType
{
  if (os_variant_has_internal_content()) {
    return @"internal";
  }
  else {
    return @"customer";
  }
}

+ (id)shouldSampleErrorsWithBag:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 doubleForKey:@"amsmetrics-logging-sampling"];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__48;
    v17 = __Block_byref_object_dispose__48;
    id v18 = [v4 doubleForKey:@"amsmetrics-logging-sampling-session"];
    v6 = objc_alloc_init(AMSMutableBinaryPromise);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke;
    v11[3] = &unk_1E55A4B38;
    p_long long buf = &buf;
    v7 = v6;
    v12 = v7;
    [v5 valueWithCompletion:v11];

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v8 = +[AMSLogConfig sharedMetricsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"amsmetrics-logging-sampling";
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "Bag not provided for %@", (uint8_t *)&buf, 0xCu);
    }

    v7 = +[AMSBinaryPromise promiseWithSuccess];
  }

  return v7;
}

void __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a4)
  {
    v7 = +[AMSLogConfig sharedMetricsConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = @"amsmetrics-logging-sampling";
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "Unable to pull bag value for %@", buf, 0xCu);
    }

    id v6 = &unk_1EDD015A0;
  }
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke_318;
  v11[3] = &unk_1E55A4B10;
  id v12 = v6;
  id v13 = *(id *)(a1 + 32);
  id v10 = v6;
  [v9 valueWithCompletion:v11];
}

void __52__AMSMetricsLoggingEvent_shouldSampleErrorsWithBag___block_invoke_318(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    id v8 = +[AMSLogConfig sharedMetricsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    id v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      uint64_t v16 = @"amsmetrics-logging-sampling-session";
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "Unable to pull bag value for %@", (uint8_t *)&v15, 0xCu);
    }

    id v6 = &unk_1EDD015A0;
  }
  [*(id *)(a1 + 32) doubleValue];
  double v11 = v10;
  [v6 doubleValue];
  BOOL v13 = +[AMSDefaults shouldSampleWithPercentage:0x1EDCB0888 sessionDuration:v11 identifier:v12];
  if (v13)
  {
    objc_super v14 = 0;
  }
  else
  {
    objc_super v14 = AMSError(11, @"Metrics Logging Event Failure", @"Not sampling", 0);
  }
  [*(id *)(a1 + 40) finishWithSuccess:v13 error:v14];
}

- (NSMutableDictionary)underlyingDictionaryForSentry
{
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v154 = [NSString stringWithFormat:@"%@.%@", @"contexts", @"app"];
  v151 = [NSString stringWithFormat:@"%@.%@", @"breadcrumbs", @"values"];
  v157 = [NSString stringWithFormat:@"%@.%@", @"mechanism", @"data"];
  v153 = [NSString stringWithFormat:@"%@.%@", @"exception", @"values"];
  v156 = [NSString stringWithFormat:@"%@.%@", @"mechanism", @"meta"];
  v152 = [NSString stringWithFormat:@"%@.%@", @"contexts", @"os"];
  [v3 setValue:@"production" forKey:@"environment"];
  v4 = [MEMORY[0x1E4F29128] UUID];
  v5 = [v4 UUIDString];
  [v3 setValue:v5 forKey:@"event_id"];

  id v6 = [(AMSMetricsLoggingEvent *)self stringForLogLevel:[(AMSMetricsLoggingEvent *)self logLevel]];
  [v3 setValue:v6 forKey:@"level"];

  [v3 setValue:@"ams" forKey:@"project"];
  id v7 = NSString;
  id v8 = [(AMSMetricsEvent *)self osName];
  id v9 = [(AMSMetricsEvent *)self osVersion];
  double v10 = [v7 stringWithFormat:@"%@@%@", v8, v9];
  [v3 setValue:v10 forKey:@"release"];

  double v11 = (void *)MEMORY[0x1E4F28ED0];
  double v12 = [MEMORY[0x1E4F1C9C8] date];
  [v12 timeIntervalSince1970];
  objc_super v14 = [v11 numberWithInteger:(uint64_t)v13];
  [v3 setValue:v14 forKey:@"timestamp"];

  [v3 setValue:@"xp_amp_ams_error_log" forKey:@"topic"];
  int v15 = [(AMSMetricsLoggingEvent *)self currentProcess];
  uint64_t v16 = [NSString stringWithFormat:@"extra.%@", @"current_process"];
  objc_msgSend(v3, "ams_setValue:forKeyPath:", v15, v16);

  uint64_t v17 = [(AMSMetricsLoggingEvent *)self url];
  id v18 = [NSString stringWithFormat:@"%@.%@", @"request", @"url"];
  id v160 = v3;
  objc_msgSend(v3, "ams_setValue:forKeyPath:", v17, v18);

  long long v172 = 0u;
  long long v173 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  uint64_t v19 = [(AMSMetricsLoggingEvent *)self jsVersions];
  v20 = [v19 keyEnumerator];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v170 objects:v176 count:16];
  v161 = self;
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v171;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v171 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v170 + 1) + 8 * i);
        v26 = [(AMSMetricsLoggingEvent *)self eventDestinations];
        if ([v26 containsObject:v25])
        {
        }
        else
        {
          v27 = [(AMSMetricsLoggingEvent *)self eventDestinations];
          uint64_t v28 = [v27 count];

          self = v161;
          if (v28) {
            continue;
          }
        }
        v29 = [(AMSMetricsLoggingEvent *)self jsVersions];
        v30 = [v29 objectForKeyedSubscript:v25];
        v31 = [NSString stringWithFormat:@"%@.%@", @"modules", v25];
        objc_msgSend(v160, "ams_setValue:forKeyPath:", v30, v31);

        self = v161;
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v170 objects:v176 count:16];
    }
    while (v22);
  }

  long long v168 = 0u;
  long long v169 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  v32 = [(AMSMetricsLoggingEvent *)self eventDestinations];
  uint64_t v33 = [v32 countByEnumeratingWithState:&v166 objects:v175 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v167;
    v36 = &stru_1EDCA7308;
    do
    {
      uint64_t v37 = 0;
      v38 = v36;
      do
      {
        if (*(void *)v167 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v39 = *(void *)(*((void *)&v166 + 1) + 8 * v37);
        v40 = NSString;
        if ([(__CFString *)v38 length]) {
          v41 = @", ";
        }
        else {
          v41 = &stru_1EDCA7308;
        }
        v36 = [v40 stringWithFormat:@"%@%@%@", v38, v41, v39];

        ++v37;
        v38 = v36;
      }
      while (v34 != v37);
      uint64_t v34 = [v32 countByEnumeratingWithState:&v166 objects:v175 count:16];
    }
    while (v34);

    self = v161;
    if (!v36) {
      goto LABEL_26;
    }
  }
  else
  {

    v36 = &stru_1EDCA7308;
  }
  if (([(__CFString *)v36 isEqualToString:&stru_1EDCA7308] & 1) == 0)
  {
LABEL_26:
    v42 = [NSString stringWithFormat:@"%@.%@", @"tags", @"destination"];
    objc_msgSend(v160, "ams_setValue:forKeyPath:", v36, v42);
  }
  v150 = v36;
  v43 = [(AMSMetricsLoggingEvent *)self jsVersions];
  v44 = [v43 allValues];
  v45 = [v44 componentsJoinedByString:@", "];

  if (!v45 || ([v45 isEqualToString:&stru_1EDCA7308] & 1) == 0)
  {
    v46 = [NSString stringWithFormat:@"%@.%@", @"tags", @"js_version"];
    objc_msgSend(v160, "ams_setValue:forKeyPath:", v45, v46);
  }
  v149 = v45;
  v47 = [(AMSMetricsLoggingEvent *)self clientBuildType];
  v48 = [NSString stringWithFormat:@"%@.%@", @"tags", @"build_type"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v47, v48);

  v49 = [(AMSMetricsLoggingEvent *)self clientApp];
  v50 = [NSString stringWithFormat:@"%@.%@", @"tags", @"app_version"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v49, v50);

  v51 = [(AMSMetricsLoggingEvent *)self engagementEventType];
  v52 = [NSString stringWithFormat:@"%@.%@", @"tags", @"engagement_event_type"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v51, v52);

  v53 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSMetricsLoggingEvent eventInlineInterruption](self, "eventInlineInterruption"));
  v54 = [NSString stringWithFormat:@"%@.%@", @"tags", @"event_inline_interruption"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v53, v54);

  v55 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorCode](self, "errorCode"));
  v56 = [NSString stringWithFormat:@"%@.%@", @"tags", @"code"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v55, v56);

  v57 = [(AMSMetricsLoggingEvent *)self errorDomain];
  v58 = [NSString stringWithFormat:@"%@.%@", @"tags", @"domain"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v57, v58);

  v59 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoCryptoCode](self, "errorUserInfoCryptoCode"));
  v60 = [NSString stringWithFormat:@"%@.%@", @"tags", @"error_crypto_code"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v59, v60);

  v61 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoStatusCode](self, "errorUserInfoStatusCode"));
  v62 = [NSString stringWithFormat:@"%@.%@", @"tags", @"status_code"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v61, v62);

  id v63 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoServerErrorCode](self, "errorUserInfoServerErrorCode"));
  v64 = [NSString stringWithFormat:@"%@.%@", @"tags", @"error_server_code"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v63, v64);

  v65 = [(AMSMetricsLoggingEvent *)self eventPlacement];
  v66 = [NSString stringWithFormat:@"%@.%@", @"tags", @"event_placement"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v65, v66);

  v67 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSMetricsLoggingEvent errorUserInfoEngagementPresented](self, "errorUserInfoEngagementPresented"));
  v68 = [NSString stringWithFormat:@"%@.%@", @"tags", @"presented"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v67, v68);

  v69 = [(AMSMetricsLoggingEvent *)self eventServiceType];
  v70 = [NSString stringWithFormat:@"%@.%@", @"tags", @"event_service_type"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v69, v70);

  v71 = [(AMSMetricsLoggingEvent *)self lastBreadcrumb];
  v72 = [NSString stringWithFormat:@"%@.%@", @"tags", @"last_breadcrumb"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v71, v72);

  v73 = (void *)MEMORY[0x1E4F28ED0];
  [(AMSMetricsLoggingEvent *)self lastBreadcrumbDuration];
  v74 = objc_msgSend(v73, "numberWithDouble:");
  v75 = [NSString stringWithFormat:@"%@.%@", @"tags", @"last_breadcrumb_duration"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v74, v75);

  v76 = [(AMSMetricsEvent *)self osVersion];
  v77 = [NSString stringWithFormat:@"%@.%@", @"tags", @"osVersion"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v76, v77);

  v78 = [(AMSMetricsLoggingEvent *)v161 releaseVersion];
  v79 = [NSString stringWithFormat:@"%@.%@", @"tags", @"app_version"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v78, v79);

  v80 = [(AMSMetricsLoggingEvent *)v161 subsystem];
  v81 = [NSString stringWithFormat:@"%@.%@", @"tags", @"subsystem"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v80, v81);

  v82 = [(AMSMetricsLoggingEvent *)v161 releaseVersion];
  v83 = [NSString stringWithFormat:@"%@.%@", v154, @"app_version"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v82, v83);

  v84 = [(AMSMetricsLoggingEvent *)v161 clientApp];
  v85 = [NSString stringWithFormat:@"%@.%@", v154, @"app_identifier"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v84, v85);

  v86 = [(AMSMetricsLoggingEvent *)v161 clientBuildType];
  v87 = [NSString stringWithFormat:@"%@.%@", v154, @"build_type"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v86, v87);

  v88 = [(AMSMetricsEvent *)v161 osVersion];
  v89 = v161;
  v90 = [NSString stringWithFormat:@"%@.%@", v152, @"osVersion"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v88, v90);

  v91 = [(AMSMetricsEvent *)v161 osBuildVersion];
  v92 = [NSString stringWithFormat:@"%@.%@", v152, @"build"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v91, v92);

  v93 = [(AMSMetricsEvent *)v161 osName];
  v94 = [NSString stringWithFormat:@"%@.%@", v152, @"name"];
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v93, v94);

  v155 = [MEMORY[0x1E4F1CA48] array];
  v95 = [MEMORY[0x1E4F1CA60] dictionary];
  v96 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorCode](v161, "errorCode"));
  v97 = [NSString stringWithFormat:@"%@.%@.%@", v156, @"ns_error", @"code"];
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v96, v97);

  v98 = [(AMSMetricsLoggingEvent *)v161 errorDomain];
  v99 = [NSString stringWithFormat:@"%@.%@.%@", v156, @"ns_error", @"domain"];
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v98, v99);

  v100 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoCryptoCode](v161, "errorUserInfoCryptoCode"));
  v101 = [NSString stringWithFormat:@"%@.%@", v157, @"error_crypto_code"];
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v100, v101);

  v102 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoServerErrorCode](v161, "errorUserInfoServerErrorCode"));
  v103 = [NSString stringWithFormat:@"%@.%@", v157, @"error_server_code"];
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v102, v103);

  v104 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent errorUserInfoStatusCode](v161, "errorUserInfoStatusCode"));
  v105 = [NSString stringWithFormat:@"%@.%@", v157, @"status_code"];
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v104, v105);

  [v95 setValue:MEMORY[0x1E4F1CC38] forKey:@"handled"];
  v106 = [(AMSMetricsLoggingEvent *)v161 category];
  v107 = [NSString stringWithFormat:@"%@.%@", @"mechanism", @"type"];
  objc_msgSend(v95, "ams_setValue:forKeyPath:", v106, v107);

  v108 = [(AMSMetricsLoggingEvent *)v161 errorTitle];
  [v95 setValue:v108 forKey:@"type"];

  v109 = [(AMSMetricsLoggingEvent *)v161 errorMessage];
  if ([v109 length])
  {
    v110 = [(AMSMetricsLoggingEvent *)v161 errorMessage];
    [v95 setValue:v110 forKey:@"value"];
    v111 = v155;
  }
  else
  {
    v110 = [(AMSMetricsLoggingEvent *)v161 errorTitle];
    if ([v110 length]) {
      [(AMSMetricsLoggingEvent *)v161 errorTitle];
    }
    else {
    v112 = [(AMSMetricsLoggingEvent *)v161 errorDomain];
    }
    v111 = v155;
    [v95 setValue:v112 forKey:@"value"];
  }
  v148 = v95;
  [v111 addObject:v95];
  v113 = [(AMSMetricsLoggingEvent *)v161 underlyingErrorTitle];
  uint64_t v114 = [v113 length];

  if (v114)
  {
    v115 = [MEMORY[0x1E4F1CA60] dictionary];
    v116 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorCode](v161, "underlyingErrorCode"));
    v117 = [NSString stringWithFormat:@"%@.%@.%@", v156, @"ns_error", @"code"];
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v116, v117);

    v118 = [(AMSMetricsLoggingEvent *)v161 errorDomain];
    v119 = [NSString stringWithFormat:@"%@.%@.%@", v156, @"ns_error", @"domain"];
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v118, v119);

    v120 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoCryptoCode](v161, "underlyingErrorUserInfoCryptoCode"));
    v121 = [NSString stringWithFormat:@"%@.%@", v157, @"error_crypto_code"];
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v120, v121);

    v122 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoServerErrorCode](v161, "underlyingErrorUserInfoServerErrorCode"));
    v123 = [NSString stringWithFormat:@"%@.%@", v157, @"error_server_code"];
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v122, v123);

    [v115 setValue:MEMORY[0x1E4F1CC38] forKey:@"handled"];
    v124 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoStatusCode](v161, "underlyingErrorUserInfoStatusCode"));
    v125 = [NSString stringWithFormat:@"%@.%@", v157, @"status_code"];
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v124, v125);

    v126 = [(AMSMetricsLoggingEvent *)v161 underlyingErrorTitle];
    [v115 setValue:v126 forKey:@"type"];

    v127 = [(AMSMetricsLoggingEvent *)v161 underlyingErrorMessage];
    [v115 setValue:v127 forKey:@"value"];

    v128 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AMSMetricsLoggingEvent underlyingErrorUserInfoEngagementPresented](v161, "underlyingErrorUserInfoEngagementPresented"));
    v89 = v161;
    v111 = v155;
    v129 = [NSString stringWithFormat:@"%@.%@", v157, @"presented"];
    objc_msgSend(v115, "ams_setValue:forKeyPath:", v128, v129);

    [v155 addObject:v115];
  }
  objc_msgSend(v160, "ams_setValue:forKeyPath:", v111, v153);
  v158 = [MEMORY[0x1E4F1CA48] array];
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  obuint64_t j = [(AMSMetricsLoggingEvent *)v89 breadcrumbs];
  uint64_t v130 = [obj countByEnumeratingWithState:&v162 objects:v174 count:16];
  if (v130)
  {
    uint64_t v131 = v130;
    uint64_t v132 = *(void *)v163;
    do
    {
      for (uint64_t j = 0; j != v131; ++j)
      {
        if (*(void *)v163 != v132) {
          objc_enumerationMutation(obj);
        }
        v134 = *(void **)(*((void *)&v162 + 1) + 8 * j);
        v135 = [MEMORY[0x1E4F1CA60] dictionary];
        v136 = objc_msgSend(MEMORY[0x1E4F28C10], "ams_serverFriendlyFormatter");
        v137 = (void *)MEMORY[0x1E4F1C9C8];
        [v134 doubleValue];
        v138 = objc_msgSend(v137, "dateWithTimeIntervalSince1970:");
        v139 = [v136 stringFromDate:v138];
        [v135 setValue:v139 forKey:@"timestamp"];

        v140 = [(AMSMetricsLoggingEvent *)v161 breadcrumbs];
        v141 = [v140 objectForKeyedSubscript:v134];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v143 = [(AMSMetricsLoggingEvent *)v161 breadcrumbs];
          v144 = [v143 objectForKeyedSubscript:v134];

          v145 = [v144 objectForKeyedSubscript:@"message"];
          [v135 setValue:v145 forKey:@"message"];

          v146 = [v144 objectForKeyedSubscript:@"category"];
          [v135 setValue:v146 forKey:@"category"];

          [v158 addObject:v135];
        }
      }
      uint64_t v131 = [obj countByEnumeratingWithState:&v162 objects:v174 count:16];
    }
    while (v131);
  }

  if ([v158 count]) {
    objc_msgSend(v160, "ams_setValue:forKeyPath:", v158, @"breadcrumbs");
  }

  return (NSMutableDictionary *)v160;
}

- (NSDictionary)breadcrumbs
{
  return self->_breadcrumbs;
}

- (NSString)category
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"category"];
}

- (NSString)clientApp
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"clientApp"];
}

- (NSString)clientBuildType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"clientBuildType"];
}

- (NSString)currentProcess
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"currentProcess"];
}

- (NSString)engagementEventType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"engagementEventType"];
}

- (int64_t)errorCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"errorCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)errorDomain
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"errorDomain"];
}

- (NSString)errorTitle
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"errorTitle"];
}

- (NSString)errorMessage
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"errorMessage"];
}

- (int64_t)errorUserInfoCryptoCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"errorUserInfoCryptoCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)errorUserInfoEngagementPresented
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"errorUserInfoEngagementPresented"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)errorUserInfoServerErrorCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"errorUserInfoServerErrorCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)errorUserInfoStatusCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"errorUserInfoStatusCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSArray)eventDestinations
{
  return (NSArray *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventDestinations"];
}

- (double)eventEndTime
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"eventEndTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (BOOL)eventInlineInterruption
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"eventInlineInterruption"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)eventParamEventType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventParamEventType"];
}

- (NSString)eventParamItemId
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventParamItemId"];
}

- (NSString)eventParamProductType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventParamProductType"];
}

- (NSString)eventParamSource
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventParamSource"];
}

- (NSString)eventParamSuccess
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventParamSuccess"];
}

- (NSString)eventPlacement
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventPlacement"];
}

- (NSString)eventServiceType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventServiceType"];
}

- (double)eventStartTime
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"eventStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (NSArray)jsVersionMap
{
  return (NSArray *)[(AMSMetricsEvent *)self propertyForBodyKey:@"jsVersionMap"];
}

- (NSString)lastBreadcrumb
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"lastBreadcrumb"];
}

- (double)lastBreadcrumbDuration
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"lastBreadcrumbDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (int64_t)logLevel
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"logLevel"];
  int64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (id)stringForLogLevel:(int64_t)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"debug", @"error", @"info", 0);
  v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (NSString)originatingURL
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"originatingURL"];
}

- (NSString)originatingURLParamBagProfile
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"originatingURLParamBagProfile"];
}

- (NSString)originatingURLParamBagProfileVersion
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"originatingURLParamBagProfileVersion"];
}

- (NSString)releaseVersion
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"releaseVersion"];
}

- (NSString)subsystem
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"subsystem"];
}

- (id)underlyingDictionaryOverride
{
  int64_t v3 = [(AMSMetricsEvent *)self topic];

  if (v3 == @"xp_amp_ams_error_log")
  {
    double v4 = [(AMSMetricsLoggingEvent *)self underlyingDictionaryForSentry];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (int64_t)underlyingErrorCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)underlyingErrorDomain
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorDomain"];
}

- (NSString)underlyingErrorMessage
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorMessage"];
}

- (NSString)underlyingErrorTitle
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorTitle"];
}

- (int64_t)underlyingErrorUserInfoCryptoCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorUserInfoCryptoCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)underlyingErrorUserInfoEngagementPresented
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorUserInfoEngagementPresented"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)underlyingErrorUserInfoServerErrorCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorUserInfoServerErrorCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)underlyingErrorUserInfoStatusCode
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"underlyingErrorUserInfoStatusCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSString)url
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"url"];
}

- (NSString)urlParamBagProfile
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"urlParamBagProfile"];
}

- (NSString)urlParamBagProfileVersion
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"urlParamBagProfileVersion"];
}

- (void)setBreadcrumbs:(id)a3
{
  id v18 = a3;
  double v4 = [v18 allKeys];
  v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_95];

  if (v5 && [v5 count])
  {
    id v6 = [v5 lastObject];
    id v7 = [v18 objectForKeyedSubscript:v6];
    id v8 = [v7 objectForKeyedSubscript:@"message"];
    [(AMSMetricsEvent *)self setProperty:v8 forBodyKey:@"lastBreadcrumb"];
  }
  else
  {
    [(AMSMetricsEvent *)self setProperty:0 forBodyKey:@"lastBreadcrumb"];
  }
  [(AMSMetricsEvent *)self setProperty:&unk_1EDD015A0 forBodyKey:@"lastBreadcrumbDuration"];
  if ((unint64_t)[v5 count] >= 2)
  {
    id v9 = [v5 lastObject];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v18, "count") - 2);
    [v12 doubleValue];
    double v14 = v13;

    int v15 = [MEMORY[0x1E4F28ED0] numberWithDouble:v11 - v14];
    [(AMSMetricsEvent *)self setProperty:v15 forBodyKey:@"lastBreadcrumbDuration"];
  }
  uint64_t v16 = (NSDictionary *)[v18 copy];
  breadcrumbs = self->_breadcrumbs;
  self->_breadcrumbs = v16;
}

BOOL __41__AMSMetricsLoggingEvent_setBreadcrumbs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 doubleValue];
  double v6 = v5;
  [v4 doubleValue];
  double v8 = v7;

  return v6 > v8;
}

- (void)setCategory:(id)a3
{
}

- (void)setClientApp:(id)a3
{
}

- (void)setClientBuildType:(id)a3
{
}

- (void)setCurrentProcess:(id)a3
{
}

- (void)setEngagementEventType:(id)a3
{
}

- (void)setErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"errorCode"];
}

- (void)setErrorDomain:(id)a3
{
}

- (void)setErrorMessage:(id)a3
{
}

- (void)setErrorTitle:(id)a3
{
}

- (void)setErrorUserInfoCryptoCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"errorUserInfoCryptoCode"];
}

- (void)setErrorUserInfoEngagementPresented:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"errorUserInfoEngagementPresented"];
}

- (void)setErrorUserInfoServerErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"errorUserInfoServerErrorCode"];
}

- (void)setErrorUserInfoStatusCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"errorUserInfoStatusCode"];
}

- (void)setEventDestinations:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__AMSMetricsLoggingEvent_setEventDestinations___block_invoke;
  v8[3] = &unk_1E55A2FC8;
  id v9 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  [(AMSMetricsEvent *)self setProperty:v7 forBodyKey:@"eventDestinations"];
}

void __47__AMSMetricsLoggingEvent_setEventDestinations___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v6;

    id v4 = *(void **)(a1 + 32);
    if (v3)
    {
      id v5 = [v3 identifier];
      [v4 addObject:v5];

      goto LABEL_6;
    }
  }
  else
  {

    id v4 = *(void **)(a1 + 32);
  }
  [v4 addObject:v6];
  id v3 = 0;
LABEL_6:
}

- (void)setEventEndTime:(double)a3
{
  id v4 = +[AMSMetrics serverTimeFromTimeInterval:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"eventEndTime"];
}

- (void)setEventInlineInterruption:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"eventInlineInterruption"];
}

- (void)setEventParamEventType:(id)a3
{
}

- (void)setEventParamItemId:(id)a3
{
}

- (void)setEventParamProductType:(id)a3
{
}

- (void)setEventParamSource:(id)a3
{
}

- (void)setEventParamSuccess:(id)a3
{
}

- (void)setEventPlacement:(id)a3
{
}

- (void)setEventServiceType:(id)a3
{
}

- (void)setEventStartTime:(double)a3
{
  id v4 = +[AMSMetrics serverTimeFromTimeInterval:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"eventStartTime"];
}

- (void)setJsVersionMap:(id)a3
{
}

- (void)setJsVersions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        double v11 = NSString;
        double v12 = [v5 objectForKeyedSubscript:v10];
        double v13 = [v11 stringWithFormat:@"%@: %@", v10, v12];
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [(AMSMetricsLoggingEvent *)self setJsVersionMap:v4];
  double v14 = (NSDictionary *)[v5 copy];
  jsVersions = self->_jsVersions;
  self->_jsVersions = v14;
}

- (void)setLogLevel:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"logLevel"];
}

- (void)setOriginatingURL:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v22 = v4;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v4];
    uint64_t v6 = [v5 queryItems];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v13 = [v12 name];
          int v14 = [v13 isEqual:@"profile"];

          if (v14)
          {
            int v15 = [v12 value];
            [(AMSMetricsLoggingEvent *)self setOriginatingURLParamBagProfile:v15];
          }
          uint64_t v16 = [v12 name];
          int v17 = [v16 isEqual:@"profileVersion"];

          if (v17)
          {
            long long v18 = [v12 value];
            [(AMSMetricsLoggingEvent *)self setOriginatingURLParamBagProfileVersion:v18];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    id v4 = v22;
  }
  long long v19 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  long long v20 = [(AMSMetricsLoggingEvent *)self cleanURL:v19];
  uint64_t v21 = [v20 absoluteString];
  [(AMSMetricsEvent *)self setProperty:v21 forBodyKey:@"originatingURL"];
}

- (void)setOriginatingURLParamBagProfile:(id)a3
{
}

- (void)setOriginatingURLParamBagProfileVersion:(id)a3
{
}

- (void)setReleaseVersion:(id)a3
{
}

- (void)setSubsystem:(id)a3
{
}

- (void)setUnderlyingErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"underlyingErrorCode"];
}

- (void)setUnderlyingErrorDomain:(id)a3
{
}

- (void)setUnderlyingErrorMessage:(id)a3
{
}

- (void)setUnderlyingErrorTitle:(id)a3
{
}

- (void)setUnderlyingErrorUserInfoCryptoCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"underlyingErrorUserInfoCryptoCode"];
}

- (void)setUnderlyingErrorUserInfoEngagementPresented:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"underlyingErrorUserInfoEngagementPresented"];
}

- (void)setUnderlyingErrorUserInfoServerErrorCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"underlyingErrorUserInfoServerErrorCode"];
}

- (void)setUnderlyingErrorUserInfoStatusCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"underlyingErrorUserInfoStatusCode"];
}

- (void)setUrl:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v4];
    uint64_t v6 = [v5 queryItems];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          double v12 = [v11 name];
          int v13 = [v12 isEqual:@"profile"];

          if (v13)
          {
            int v14 = [v11 value];
            [(AMSMetricsLoggingEvent *)self setUrlParamBagProfile:v14];
          }
          int v15 = [v11 name];
          int v16 = [v15 isEqual:@"profileVersion"];

          if (v16)
          {
            int v17 = [v11 value];
            [(AMSMetricsLoggingEvent *)self setUrlParamBagProfileVersion:v17];
          }
          long long v18 = [v11 name];
          int v19 = [v18 isEqual:@"placement"];

          if (v19)
          {
            long long v20 = [v11 value];
            [(AMSMetricsLoggingEvent *)self setEventPlacement:v20];
          }
          uint64_t v21 = [v11 name];
          int v22 = [v21 isEqual:@"serviceType"];

          if (v22)
          {
            long long v23 = [v11 value];
            [(AMSMetricsLoggingEvent *)self setEventServiceType:v23];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }
  }
  long long v24 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  long long v25 = [(AMSMetricsLoggingEvent *)self cleanURL:v24];
  long long v26 = [v25 absoluteString];
  [(AMSMetricsEvent *)self setProperty:v26 forBodyKey:@"url"];
}

- (void)setUrlParamBagProfile:(id)a3
{
}

- (void)setUrlParamBagProfileVersion:(id)a3
{
}

+ (id)_propertyValueClassesForKnownProperties
{
  v9[44] = *MEMORY[0x1E4F143B8];
  v8[0] = @"category";
  v9[0] = objc_opt_class();
  v8[1] = @"clientApp";
  v9[1] = objc_opt_class();
  v8[2] = @"clientBuildType";
  v9[2] = objc_opt_class();
  v8[3] = @"currentProcess";
  v9[3] = objc_opt_class();
  void v8[4] = @"engagementEventType";
  v9[4] = objc_opt_class();
  v8[5] = @"errorCode";
  v9[5] = objc_opt_class();
  v8[6] = @"errorDomain";
  v9[6] = objc_opt_class();
  v8[7] = @"errorMessage";
  v9[7] = objc_opt_class();
  v8[8] = @"errorTitle";
  v9[8] = objc_opt_class();
  v8[9] = @"errorUserInfoCryptoCode";
  v9[9] = objc_opt_class();
  v8[10] = @"errorUserInfoEngagementPresented";
  v9[10] = objc_opt_class();
  v8[11] = @"errorUserInfoServerErrorCode";
  v9[11] = objc_opt_class();
  v8[12] = @"errorUserInfoStatusCode";
  v9[12] = objc_opt_class();
  v8[13] = @"eventDestinations";
  v9[13] = objc_opt_class();
  v8[14] = @"eventEndTime";
  v9[14] = objc_opt_class();
  v8[15] = @"eventInlineInterruption";
  v9[15] = objc_opt_class();
  v8[16] = @"eventParamEventType";
  v9[16] = objc_opt_class();
  v8[17] = @"eventParamItemId";
  v9[17] = objc_opt_class();
  v8[18] = @"eventParamProductType";
  v9[18] = objc_opt_class();
  v8[19] = @"eventParamSource";
  v9[19] = objc_opt_class();
  v8[20] = @"eventParamSuccess";
  v9[20] = objc_opt_class();
  v8[21] = @"eventPlacement";
  v9[21] = objc_opt_class();
  v8[22] = @"eventServiceType";
  v9[22] = objc_opt_class();
  v8[23] = @"eventStartTime";
  v9[23] = objc_opt_class();
  v8[24] = @"jsVersionMap";
  v9[24] = objc_opt_class();
  v8[25] = @"lastBreadcrumb";
  v9[25] = objc_opt_class();
  v8[26] = @"lastBreadcrumbDuration";
  v9[26] = objc_opt_class();
  v8[27] = @"logLevel";
  v9[27] = objc_opt_class();
  v8[28] = @"originatingURL";
  v9[28] = objc_opt_class();
  v8[29] = @"originatingURLParamBagProfile";
  v9[29] = objc_opt_class();
  v8[30] = @"originatingURLParamBagProfileVersion";
  v9[30] = objc_opt_class();
  v8[31] = @"releaseVersion";
  v9[31] = objc_opt_class();
  v8[32] = @"subsystem";
  v9[32] = objc_opt_class();
  v8[33] = @"underlyingErrorCode";
  v9[33] = objc_opt_class();
  v8[34] = @"underlyingErrorDomain";
  v9[34] = objc_opt_class();
  v8[35] = @"underlyingErrorMessage";
  v9[35] = objc_opt_class();
  v8[36] = @"underlyingErrorTitle";
  v9[36] = objc_opt_class();
  v8[37] = @"underlyingErrorUserInfoCryptoCode";
  v9[37] = objc_opt_class();
  v8[38] = @"underlyingErrorUserInfoEngagementPresented";
  v9[38] = objc_opt_class();
  v8[39] = @"underlyingErrorUserInfoServerErrorCode";
  v9[39] = objc_opt_class();
  v8[40] = @"underlyingErrorUserInfoStatusCode";
  v9[40] = objc_opt_class();
  v8[41] = @"url";
  v9[41] = objc_opt_class();
  v8[42] = @"urlParamBagProfile";
  v9[42] = objc_opt_class();
  v8[43] = @"urlParamBagProfileVersion";
  v9[43] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:44];
  id v4 = (void *)[v3 mutableCopy];

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSMetricsLoggingEvent;
  id v5 = objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

- (id)cleanURL:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F29088];
    id v4 = a3;
    id v5 = (void *)[[v3 alloc] initWithURL:v4 resolvingAgainstBaseURL:1];

    uint64_t v6 = [v5 queryItems];
    objc_super v7 = objc_msgSend(v6, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_398);

    if ([v7 count]) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    [v5 setQueryItems:v8];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v10 = [v5 URL];
    double v11 = AMSLogableURL(v10);
    double v12 = [v9 URLWithString:v11];
  }
  else
  {
    double v12 = 0;
  }
  return v12;
}

id __35__AMSMetricsLoggingEvent_cleanURL___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 name];
  id v4 = [v3 lowercaseString];
  if ([v4 isEqual:@"iadid"]) {
    id v5 = 0;
  }
  else {
    id v5 = v2;
  }
  id v6 = v5;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AMSMetricsLoggingEvent;
  id v4 = [(AMSMetricsEvent *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 8, self->_jsVersions);
  objc_storeStrong(v4 + 6, self->_breadcrumbs);
  objc_storeStrong(v4 + 7, self->_error);
  return v4;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)jsVersions
{
  return self->_jsVersions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsVersions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_breadcrumbs, 0);
}

@end