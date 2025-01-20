@interface C2SessionTask
+ (double)captureMetricDurationBetweenStart:(double)a3 andEnd:(double)a4;
+ (double)captureMetricsForTimingData:(id)a3 withKey:(id)a4;
+ (id)callbackHealthQueue;
+ (void)initialize;
- (BOOL)callbackHung;
- (BOOL)isComplete;
- (C2RequestDelegate)delegate;
- (C2RequestOptions)options;
- (C2SessionTask)initWithOptions:(id)a3 delegate:(id)a4 sessionTaskDelegate:(id)a5;
- (C2SessionTaskDelegate)sessionTaskDelegate;
- (NSMutableSet)outstandingCallbacks;
- (NSURLSessionDataTask)task;
- (NSURLSessionTaskMetrics)taskMetrics;
- (OS_os_activity)activity;
- (double)initTime;
- (double)resetTime;
- (id)taskDescription;
- (id)taskIdentifier;
- (unsigned)attemptCount;
- (void)C2Session:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)captureMetricsWithError:(id)a3 eventType:(int64_t)a4;
- (void)dealloc;
- (void)didFinishCollectingMetrics:(id)a3;
- (void)handleCallbackForTask:(id)a3 callback:(id)a4;
- (void)invalidate;
- (void)setAttemptCount:(unsigned int)a3;
- (void)setInitTime:(double)a3;
- (void)setIsComplete:(BOOL)a3;
- (void)setOutstandingCallbacks:(id)a3;
- (void)setResetTime:(double)a3;
- (void)setSessionTaskDelegate:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskMetrics:(id)a3;
- (void)testBehavior_triggerCallbackHang;
@end

@implementation C2SessionTask

- (id)taskDescription
{
  v3 = self;
  objc_sync_enter(v3);
  task = v3->_task;
  if (!task)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:v3 file:@"C2SessionTask.m" lineNumber:115 description:@"task must not be nil"];

    task = v3->_task;
  }
  v5 = [(NSURLSessionDataTask *)task taskDescription];
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v3 file:@"C2SessionTask.m" lineNumber:117 description:@"task description must not be nil"];
  }
  objc_sync_exit(v3);

  return v5;
}

- (void)handleCallbackForTask:(id)a3 callback:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, C2SessionTask *, id))a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &state);
  v9 = self;
  objc_sync_enter(v9);
  v10 = 0;
  if (!v9->_isComplete)
  {
    v10 = v9->_delegate;
    if (v10)
    {
      task = v9->_task;
      if (!task)
      {
        v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2 object:v9 file:@"C2SessionTask.m" lineNumber:84 description:@"task must not be nil"];

        task = v9->_task;
      }
      uint64_t v12 = [(NSURLSessionDataTask *)task taskIdentifier];
      if (v12 != [v7 taskIdentifier])
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, @"C2SessionTask.m", 85, @"taskIdentifier (%llu) found but expected (%llu).", -[NSURLSessionDataTask taskIdentifier](v9->_task, "taskIdentifier"), objc_msgSend(v7, "taskIdentifier"));
      }
    }
  }
  v13 = objc_alloc_init(C2SessionCallbackMetrics);
  [(C2SessionCallbackMetrics *)v13 setStartTime:mach_absolute_time()];
  [(NSMutableSet *)v9->_outstandingCallbacks addObject:v13];
  objc_sync_exit(v9);

  v8[2](v8, v9, v10);
  v14 = v9;
  objc_sync_enter(v14);
  [(NSMutableSet *)v9->_outstandingCallbacks removeObject:v13];
  objc_sync_exit(v14);

  mach_absolute_time();
  [(C2SessionCallbackMetrics *)v13 startTime];
  TMConvertTicksToSeconds();
  double v16 = v15;
  if (v15 > 1.0)
  {
    if (C2_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_30_0);
    }
    v17 = C2_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v22 = v16;
      _os_log_impl(&dword_1DD523000, v17, OS_LOG_TYPE_ERROR, "C2RequestDelegate took %.3f seconds.", buf, 0xCu);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)didFinishCollectingMetrics:(id)a3
{
}

- (void)dealloc
{
  if (!self->_isComplete)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"C2SessionTask.m" lineNumber:157 description:@"should be complete"];
  }
  v5.receiver = self;
  v5.super_class = (Class)C2SessionTask;
  [(C2SessionTask *)&v5 dealloc];
}

- (void)captureMetricsWithError:(id)a3 eventType:(int64_t)a4
{
  uint64_t v353 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSURLSessionDataTask *)self->_task _timingData];
  v8 = [(NSURLSessionTaskMetrics *)self->_taskMetrics transactionMetrics];
  v9 = [v8 lastObject];

  v10 = [v9 _dataTransferReport];
  v11 = [(NSURLSessionDataTask *)self->_task currentRequest];
  v270 = [v11 URL];
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataDomainLookupStart"];
  double v13 = v12;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataDomainLookupEnd"];
  double v15 = v14;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataConnectStart"];
  double v17 = v16;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataConnectEnd"];
  double v266 = v18;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataSecureConnectionStart"];
  double v20 = v19;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataRequestStart"];
  double v22 = v21;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataRequestEnd"];
  double v24 = v23;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataResponseStart"];
  double v26 = v25;
  +[C2SessionTask captureMetricsForTimingData:v7 withKey:@"_kCFNTimingDataResponseEnd"];
  double v28 = v27;
  p_info = C2RequestOptions.info;
  if (C2_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_80);
  }
  v30 = (id)C2_DEFAULT_LOG_INTERNAL_3;
  report = v10;
  v269 = self;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v257 = a4;
    uint64_t v31 = [(NSURLSessionDataTask *)self->_task taskDescription];
    v32 = &stru_1F38BC970;
    v248 = (void *)v31;
    if (v31) {
      v33 = (__CFString *)v31;
    }
    else {
      v33 = &stru_1F38BC970;
    }
    v244 = v33;
    uint64_t v34 = [v270 host];
    v247 = (void *)v34;
    if (v34) {
      v35 = (__CFString *)v34;
    }
    else {
      v35 = &stru_1F38BC970;
    }
    v243 = v35;
    log = v30;
    if (v7)
    {
      uint64_t v36 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataRemoteAddressAndPort"];
      v215 = (void *)v36;
      if (v36) {
        v37 = (__CFString *)v36;
      }
      else {
        v37 = &stru_1F38BC970;
      }
      v242 = v37;
      uint64_t v38 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataLocalAddressAndPort"];
      v214 = (void *)v38;
      if (v38) {
        v39 = (__CFString *)v38;
      }
      else {
        v39 = &stru_1F38BC970;
      }
      v241 = v39;
      uint64_t v40 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataConnectionUUID"];
      v213 = (void *)v40;
      if (v40) {
        v41 = (__CFString *)v40;
      }
      else {
        v41 = &stru_1F38BC970;
      }
      v240 = v41;
    }
    else
    {
      v241 = &stru_1F38BC970;
      v242 = &stru_1F38BC970;
      v240 = &stru_1F38BC970;
    }
    uint64_t v42 = +[C2RequestOptions stringForQualityOfService:[(C2RequestOptions *)self->_options qualityOfService]];
    v246 = (void *)v42;
    if (v42) {
      v43 = (__CFString *)v42;
    }
    else {
      v43 = &stru_1F38BC970;
    }
    v239 = v43;
    if (v7)
    {
      uint64_t v44 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataConnectionReused"];
      v212 = (void *)v44;
      if (v44) {
        v45 = (__CFString *)v44;
      }
      else {
        v45 = &stru_1F38BC970;
      }
      v238 = v45;
      uint64_t v46 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataConnectionInterfaceIdentifier"];
      v211 = (void *)v46;
      if (v46) {
        v47 = (__CFString *)v46;
      }
      else {
        v47 = &stru_1F38BC970;
      }
      v237 = v47;
    }
    else
    {
      v237 = &stru_1F38BC970;
      v238 = &stru_1F38BC970;
    }
    objc_msgSend(v9, "c2_NegotiatedTLSProtocolVersionString");
    id v245 = (id)objc_claimAutoreleasedReturnValue();
    v260 = v11;
    if (v7)
    {
      uint64_t v48 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataNetworkProtocolName"];
      v210 = (void *)v48;
      if (v48) {
        v49 = (__CFString *)v48;
      }
      else {
        v49 = &stru_1F38BC970;
      }
      v236 = v49;
      uint64_t v50 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataRequestHeaderSize"];
      v209 = (void *)v50;
      if (v50) {
        v51 = (__CFString *)v50;
      }
      else {
        v51 = &stru_1F38BC970;
      }
      v234 = v51;
      uint64_t v235 = [(NSURLSessionDataTask *)self->_task countOfBytesSent];
      uint64_t v52 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataResponseHeaderSize"];
      v208 = (void *)v52;
      if (v52) {
        v53 = (__CFString *)v52;
      }
      else {
        v53 = &stru_1F38BC970;
      }
      v233 = v53;
      uint64_t v54 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataResponseBodyBytesReceived"];
      v207 = (void *)v54;
      if (v54) {
        v55 = (__CFString *)v54;
      }
      else {
        v55 = &stru_1F38BC970;
      }
      v231 = v55;
    }
    else
    {
      uint64_t v235 = [(NSURLSessionDataTask *)self->_task countOfBytesSent];
      v236 = &stru_1F38BC970;
      v233 = &stru_1F38BC970;
      v234 = &stru_1F38BC970;
      v231 = &stru_1F38BC970;
    }
    id v263 = v6;
    if (v6) {
      v56 = @"T";
    }
    else {
      v56 = @"F";
    }
    v227 = v56;
    double v249 = v13;
    +[C2SessionTask captureMetricDurationBetweenStart:v13 andEnd:v15];
    uint64_t v230 = v57;
    double v250 = v15;
    +[C2SessionTask captureMetricDurationBetweenStart:v15 andEnd:v17];
    uint64_t v229 = v58;
    +[C2SessionTask captureMetricDurationBetweenStart:v17 andEnd:v266];
    uint64_t v226 = v59;
    double v251 = v17;
    +[C2SessionTask captureMetricDurationBetweenStart:v17 andEnd:v20];
    uint64_t v232 = v60;
    double v267 = v20;
    +[C2SessionTask captureMetricDurationBetweenStart:v20 andEnd:v22];
    uint64_t v62 = v61;
    +[C2SessionTask captureMetricDurationBetweenStart:v266 andEnd:v22];
    uint64_t v64 = v63;
    +[C2SessionTask captureMetricDurationBetweenStart:v22 andEnd:v24];
    double v65 = v24;
    uint64_t v67 = v66;
    double v252 = v65;
    +[C2SessionTask captureMetricDurationBetweenStart:v65 andEnd:v26];
    uint64_t v228 = v68;
    double v253 = v26;
    +[C2SessionTask captureMetricDurationBetweenStart:v26 andEnd:v28];
    uint64_t v70 = v69;
    double v254 = v28;
    +[C2SessionTask captureMetricDurationBetweenStart:v22 andEnd:v28];
    uint64_t v72 = v71;
    if ([(C2RequestOptions *)self->_options outOfProcess]) {
      v73 = @"T";
    }
    else {
      v73 = @"F";
    }
    v225 = v73;
    if ([(C2RequestOptions *)self->_options allowsCellularAccess]) {
      v74 = @"T";
    }
    else {
      v74 = @"F";
    }
    v224 = v74;
    if ([(C2RequestOptions *)self->_options _allowsExpensiveAccess]) {
      v75 = @"T";
    }
    else {
      v75 = @"F";
    }
    v223 = v75;
    if ([(C2RequestOptions *)self->_options _allowsPowerNapScheduling]) {
      v76 = @"T";
    }
    else {
      v76 = @"F";
    }
    v222 = v76;
    uint64_t v77 = [(C2RequestOptions *)self->_options _sourceApplicationBundleIdentifier];
    v78 = (void *)v77;
    if (v77) {
      v79 = (__CFString *)v77;
    }
    else {
      v79 = &stru_1F38BC970;
    }
    v221 = v79;
    uint64_t v80 = [(C2RequestOptions *)self->_options _sourceApplicationSecondaryIdentifier];
    v81 = (void *)v80;
    if (v80) {
      v82 = (__CFString *)v80;
    }
    else {
      v82 = &stru_1F38BC970;
    }
    v220 = v82;
    uint64_t v83 = [(C2RequestOptions *)self->_options outOfProcessPoolName];
    v84 = (void *)v83;
    if (v83) {
      v85 = (__CFString *)v83;
    }
    else {
      v85 = &stru_1F38BC970;
    }
    v219 = v85;
    if ([(C2RequestOptions *)self->_options tlsPinning]) {
      v86 = @"T";
    }
    else {
      v86 = @"F";
    }
    v217 = v86;
    if ([(C2RequestOptions *)self->_options _allowsRetryForBackgroundDataTasks]) {
      v87 = @"T";
    }
    else {
      v87 = @"F";
    }
    v216 = v87;
    id v218 = +[C2RequestOptions stringForDiscretionaryNetworkBehavior:[(C2RequestOptions *)self->_options discretionaryNetworkBehavior]];
    id v88 = +[C2RequestOptions stringForDuetPreClearedMode:[(C2RequestOptions *)self->_options duetPreClearedMode]];
    [(C2RequestOptions *)self->_options _timeoutIntervalForRequest];
    uint64_t v90 = v89;
    [(C2RequestOptions *)self->_options _timeoutIntervalForResource];
    uint64_t v92 = v91;
    uint64_t v93 = [(C2RequestOptions *)self->_options _appleIDContextSessionIdentifier];
    v94 = (void *)v93;
    if (v93) {
      v32 = (__CFString *)v93;
    }
    BOOL v95 = [(C2RequestOptions *)self->_options metricRequest];
    v274 = v244;
    if (v95) {
      v96 = @"T";
    }
    else {
      v96 = @"F";
    }
    v276 = v243;
    v278 = v242;
    __int16 v277 = 2113;
    __int16 v279 = 2113;
    v280 = v241;
    v282 = v240;
    v284 = v239;
    v286 = v238;
    v288 = v237;
    v292 = v236;
    v294 = v234;
    uint64_t v296 = v235;
    v298 = v233;
    v300 = v231;
    __int16 v301 = 2112;
    v302 = v227;
    v324 = v225;
    uint64_t v304 = v230;
    uint64_t v306 = v229;
    uint64_t v308 = v226;
    uint64_t v312 = v62;
    uint64_t v314 = v64;
    uint64_t v316 = v67;
    uint64_t v320 = v70;
    uint64_t v322 = v72;
    v326 = v224;
    v328 = v223;
    v330 = v222;
    v332 = v221;
    v334 = v220;
    v336 = v219;
    v338 = v217;
    v340 = v216;
    __int16 v295 = 2048;
    __int16 v303 = 2048;
    __int16 v305 = 2048;
    __int16 v307 = 2048;
    __int16 v309 = 2048;
    __int16 v311 = 2048;
    __int16 v313 = 2048;
    __int16 v315 = 2048;
    __int16 v317 = 2048;
    __int16 v319 = 2048;
    __int16 v321 = 2048;
    __int16 v345 = 2048;
    __int16 v347 = 2048;
    v352 = v96;
    id v344 = v88;
    uint64_t v346 = v90;
    uint64_t v348 = v92;
    v350 = v32;
    __int16 v275 = 2114;
    __int16 v281 = 2114;
    __int16 v283 = 2114;
    __int16 v285 = 2114;
    __int16 v287 = 2114;
    __int16 v289 = 2114;
    __int16 v291 = 2114;
    __int16 v293 = 2114;
    __int16 v297 = 2114;
    __int16 v299 = 2114;
    __int16 v323 = 2114;
    __int16 v325 = 2114;
    __int16 v327 = 2114;
    __int16 v329 = 2114;
    __int16 v331 = 2114;
    __int16 v333 = 2114;
    __int16 v335 = 2114;
    __int16 v337 = 2114;
    __int16 v339 = 2114;
    __int16 v341 = 2114;
    __int16 v343 = 2114;
    __int16 v349 = 2114;
    __int16 v351 = 2114;
    *(_DWORD *)buf = 138553347;
    id v290 = v245;
    uint64_t v310 = v232;
    uint64_t v318 = v228;
    id v342 = v218;
    _os_log_impl(&dword_1DD523000, log, OS_LOG_TYPE_DEFAULT, "captureMetricsForTask=%{public}@:host=%{public}@:remoteAddress=%{private}@:localAddress=%{private}@:connectionUUID=%{public}@:qualityOfService=%{public}@:reuse=%{public}@:i=%{public}@:tlsVersion=%{public}@:protocol=%{public}@:requestHeaderBytes=%{public}@:requestBodyBytes=%llu:responseHeaderBytes=%{public}@:responseBodyBytes=%{public}@:err=%@:dnsDuration=%.3f:tcpStartDelay=%.3f:tcpDuration=%.3f:sslStartDelay=%.3f:sslDuration=%.3f:requestStartDelay=%.3f:requestDuration=%.3f:responseStartDelay=%.3f:responseDuration=%.3f:transactionDuration=%.3f:outOfProcess=%{public}@:allowCellular=%{public}@:allowExpensive=%{public}@:powerNap=%{public}@:app=%{public}@:2app=%{public}@:pool=%{public}@:tlsPinning=%{public}@:retryNetworkFailures=%{public}@:disc=%{public}@:duet=%{public}@:reqTimeout=%.2f:resTimeout=%.2f:appleIdSessionId=%{public}@:metricRequest=%{public}@", buf, 0x192u);

    if (v7)
    {

      a4 = v257;
      p_info = (__objc2_class_ro **)(C2RequestOptions + 32);
      v97 = v214;
      v98 = v215;
    }
    else
    {
      v97 = v245;
      v98 = v246;
      a4 = v257;
      p_info = C2RequestOptions.info;
    }

    id v6 = v263;
    v11 = v260;
    double v26 = v253;
    double v28 = v254;
    double v24 = v252;
    double v20 = v267;
    double v15 = v250;
    double v17 = v251;
    double v13 = v249;
    v30 = log;
  }

  if (v6)
  {
    v99 = @"RetryableNetworkingError";
    if (a4 == 1) {
      v99 = @"NetworkingError";
    }
    v100 = v99;
    if (p_info[141] != (__objc2_class_ro *)-1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_127);
    }
    id v101 = (id)C2_DEFAULT_LOG_INTERNAL_3;
    +[C2Logging printToLog:v101 withDescription:v100 object:v6];
  }
  uint64_t v102 = [(C2RequestOptions *)self->_options metricOptions];
  if (v102)
  {
    v103 = (void *)v102;
    BOOL v104 = +[C2RequestOptions triesteMetricsEnabled];

    if (v104)
    {
      int64_t v258 = a4;
      v261 = v11;
      v105 = objc_opt_new();
      v106 = objc_opt_new();
      [v105 setObject:v106 forKeyedSubscript:@"client"];
      v107 = [(NSURLSessionDataTask *)self->_task taskDescription];
      [v106 setObject:v107 forKeyedSubscript:@"taskDescription"];

      if (v6) {
        v108 = @"T";
      }
      else {
        v108 = @"F";
      }
      [v106 setObject:v108 forKeyedSubscript:@"error"];
      v109 = objc_opt_new();
      [v105 setObject:v109 forKeyedSubscript:@"timing"];
      if (v13 != -1.0)
      {
        v110 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v13));
        [v109 setObject:v110 forKeyedSubscript:@"dnsStart"];
      }
      if (v15 != -1.0)
      {
        v111 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v15));
        [v109 setObject:v111 forKeyedSubscript:@"dnsEnd"];
      }
      if (v17 != -1.0)
      {
        v112 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v17));
        [v109 setObject:v112 forKeyedSubscript:@"tcpStart"];
      }
      if (v266 != -1.0)
      {
        v113 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v266));
        [v109 setObject:v113 forKeyedSubscript:@"tcpEnd"];
      }
      if (v20 != -1.0)
      {
        v114 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v20));
        [v109 setObject:v114 forKeyedSubscript:@"sslStart"];
      }
      if (v22 != -1.0)
      {
        v115 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v22));
        [v109 setObject:v115 forKeyedSubscript:@"reqStart"];
      }
      if (v24 != -1.0)
      {
        v116 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v24));
        [v109 setObject:v116 forKeyedSubscript:@"reqEnd"];
      }
      if (v26 != -1.0)
      {
        v117 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v26));
        [v109 setObject:v117 forKeyedSubscript:@"resStart"];
      }
      v262 = v9;
      id v264 = v6;
      if (v28 != -1.0)
      {
        v118 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:", v28));
        [v109 setObject:v118 forKeyedSubscript:@"resEnd"];
      }
      v119 = objc_opt_new();
      [v105 setObject:v119 forKeyedSubscript:@"request"];
      v120 = NSString;
      v121 = [v270 scheme];
      v122 = [v270 host];
      v123 = [v270 port];
      v124 = [v270 path];
      v125 = [v120 stringWithFormat:@"%@://%@:%@/%@", v121, v122, v123, v124];
      [v119 setObject:v125 forKeyedSubscript:@"urlWithoutQuery"];

      if (v7)
      {
        uint64_t v126 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataRequestHeaderSize"];
        v127 = (void *)v126;
        if (v126) {
          v128 = (__CFString *)v126;
        }
        else {
          v128 = &stru_1F38BC970;
        }
        [v119 setObject:v128 forKeyedSubscript:@"headerBytes"];
      }
      else
      {
        [v119 setObject:&stru_1F38BC970 forKeyedSubscript:@"headerBytes"];
      }
      v129 = [(NSURLSessionDataTask *)v269->_task currentRequest];
      v130 = [v129 valueForHTTPHeaderField:@"X-Apple-Request-UUID"];
      [v119 setObject:v130 forKeyedSubscript:@"uuid"];

      v131 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[NSURLSessionDataTask countOfBytesSent](v269->_task, "countOfBytesSent"));
      [v119 setObject:v131 forKeyedSubscript:@"bodyBytes"];

      v132 = objc_opt_new();
      [v105 setObject:v132 forKeyedSubscript:@"response"];
      if (v7)
      {
        uint64_t v133 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataResponseHeaderSize"];
        v134 = (void *)v133;
        if (v133) {
          v135 = (__CFString *)v133;
        }
        else {
          v135 = &stru_1F38BC970;
        }
        [v132 setObject:v135 forKeyedSubscript:@"headerBytes"];
      }
      else
      {
        [v132 setObject:&stru_1F38BC970 forKeyedSubscript:@"headerBytes"];
      }
      v136 = [(NSURLSessionDataTask *)v269->_task response];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v138 = NSNumber;
        v139 = [(NSURLSessionDataTask *)v269->_task response];
        v140 = objc_msgSend(v138, "numberWithUnsignedLongLong:", objc_msgSend(v139, "statusCode"));
        [v132 setObject:v140 forKeyedSubscript:@"statusCode"];

        v141 = [(NSURLSessionDataTask *)v269->_task response];
        v142 = [v141 allHeaderFields];
        v143 = [v142 objectForKeyedSubscript:@"X-Apple-Request-UUID"];
        [v132 setObject:v143 forKeyedSubscript:@"uuid"];
      }
      if (v7)
      {
        uint64_t v144 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataResponseBodyBytesReceived"];
        v145 = (void *)v144;
        if (v144) {
          v146 = (__CFString *)v144;
        }
        else {
          v146 = &stru_1F38BC970;
        }
        [v132 setObject:v146 forKeyedSubscript:@"bodyBytes"];
      }
      else
      {
        [v132 setObject:&stru_1F38BC970 forKeyedSubscript:@"bodyBytes"];
      }
      id v6 = v264;
      v147 = (void *)MEMORY[0x1E4F28D90];
      v271 = @"triesteSummary";
      v272 = v105;
      v148 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v272 forKeys:&v271 count:1];
      v149 = [v147 dataWithJSONObject:v148 options:1 error:0];

      v150 = (__CFString *)[[NSString alloc] initWithData:v149 encoding:4];
      if (C2_TRIESTE_LOG_BLOCK != -1) {
        dispatch_once(&C2_TRIESTE_LOG_BLOCK, &__block_literal_global_204);
      }
      v151 = (id)C2_TRIESTE_LOG_INTERNAL;
      if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v274 = v150;
        _os_log_impl(&dword_1DD523000, v151, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      v11 = v261;
      v9 = v262;
      v10 = report;
      self = v269;
      a4 = v258;
    }
  }
  v152 = [(C2RequestOptions *)self->_options metricOptions];
  if (!v152 || [(C2RequestOptions *)self->_options metricRequest])
  {

    if (a4 == 2) {
      goto LABEL_150;
    }
    goto LABEL_151;
  }

  if (a4 == 2)
  {
LABEL_150:
    ++self->_attemptCount;
    self->_resetTime = CFAbsoluteTimeGetCurrent();
    goto LABEL_151;
  }
  if (a4 == 1)
  {
    v153 = [(NSURLSessionDataTask *)self->_task response];
    objc_opt_class();
    char v154 = objc_opt_isKindOfClass();

    if (v154)
    {
      v155 = [(NSURLSessionDataTask *)self->_task response];
      v156 = [v155 allHeaderFields];
      v157 = [v156 objectForKey:@"x-apple-report-metrics"];
      BOOL v158 = v157 != 0;
    }
    else
    {
      BOOL v158 = 0;
    }
    v159 = [(C2RequestOptions *)self->_options metricOptions];
    uint64_t v160 = [v159 generateTriggerWithResponseHeader:v158];

    v161 = objc_alloc_init(C2MPNetworkEvent);
    v162 = self;
    v163 = v161;
    if (v161)
    {
      uint64_t v259 = v160;
      [(C2MPNetworkEvent *)v161 setTriggers:(int)v160];
      v164 = [(C2RequestOptions *)v162->_options metricOptions];
      -[C2MPNetworkEvent setReportFrequency:](v163, "setReportFrequency:", [v164 reportFrequency]);

      v165 = [(C2RequestOptions *)v162->_options metricOptions];
      -[C2MPNetworkEvent setReportFrequencyBase:](v163, "setReportFrequencyBase:", [v165 reportFrequencyBase]);

      v166 = [(NSURLSessionDataTask *)v162->_task taskDescription];
      [(C2MPNetworkEvent *)v163 setNetworkTaskDescription:v166];

      if (-[C2RequestOptions redactRemoteEndpointFromNetworkMetrics](v162->_options, "redactRemoteEndpointFromNetworkMetrics")|| [v9 isProxyConnection])
      {
        [(C2MPNetworkEvent *)v163 setNetworkHostname:@"redacted"];
        [(C2MPNetworkEvent *)v163 setNetworkRemoteAddresssAndPort:@"redacted"];
      }
      else
      {
        v167 = [v270 host];
        [(C2MPNetworkEvent *)v163 setNetworkHostname:v167];

        v168 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataRemoteAddressAndPort"];
        [(C2MPNetworkEvent *)v163 setNetworkRemoteAddresssAndPort:v168];
      }
      v169 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataConnectionUUID"];
      [(C2MPNetworkEvent *)v163 setNetworkConnectionUuid:v169];

      v170 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataConnectionReused"];
      -[C2MPNetworkEvent setNetworkConnectionReused:](v163, "setNetworkConnectionReused:", [v170 BOOLValue]);

      v171 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataConnectionInterfaceIdentifier"];
      [(C2MPNetworkEvent *)v163 setNetworkInterfaceIdentifier:v171];

      v172 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataNetworkProtocolName"];
      [(C2MPNetworkEvent *)v163 setNetworkProtocolName:v172];

      v173 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataRequestHeaderSize"];
      -[C2MPNetworkEvent setNetworkRequestHeaderSize:](v163, "setNetworkRequestHeaderSize:", [v173 intValue]);

      [(C2MPNetworkEvent *)v163 setNetworkRequestBodyBytesSent:[(NSURLSessionDataTask *)v269->_task countOfBytesSent]];
      v174 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataResponseHeaderSize"];
      -[C2MPNetworkEvent setNetworkResponseHeaderSize:](v163, "setNetworkResponseHeaderSize:", [v174 intValue]);

      v175 = [v7 objectForKeyedSubscript:@"_kCFNTimingDataResponseBodyBytesReceived"];
      -[C2MPNetworkEvent setNetworkResponseBodyBytesReceived:](v163, "setNetworkResponseBodyBytesReceived:", [v175 longLongValue]);

      v176 = [v7 objectForKeyedSubscript:@"_kCFNBackgroundMetricsIsDiscretionary"];
      v177 = v176;
      if (v176) {
        [(C2MPNetworkEvent *)v163 setNetworkIsDiscretionary:[v176 BOOLValue]];
      }
      os_log_t loga = v177;
      v178 = [(NSURLSessionTaskMetrics *)v269->_taskMetrics transactionMetrics];
      v179 = [v178 lastObject];
      v180 = objc_msgSend(v179, "c2_NegotiatedTLSProtocolVersionString");
      [(C2MPNetworkEvent *)v163 setNetworkNegotiatedTlsProtocolVersion:v180];

      [(C2MPNetworkEvent *)v163 setNetworkPreviousAttemptCount:v269->_attemptCount];
      if (v6)
      {
        v181 = +[C2Metric generateError:v6];
        [(C2MPNetworkEvent *)v163 setNetworkFatalError:v181];
      }
      v182 = [(NSURLSessionDataTask *)v269->_task response];
      objc_opt_class();
      char v183 = objc_opt_isKindOfClass();

      if (v183)
      {
        v184 = [(NSURLSessionDataTask *)v269->_task response];
        -[C2MPNetworkEvent setNetworkStatusCode:](v163, "setNetworkStatusCode:", [v184 statusCode]);
      }
      v185 = report;
      if ([(C2RequestOptions *)v269->_options redactUniformResourceIdentifierFromNetworkMetrics])
      {
        [(C2MPNetworkEvent *)v163 setNetworkRequestUri:@"redacted"];
      }
      else
      {
        v186 = [(NSURLSessionDataTask *)v269->_task currentRequest];
        v187 = [v186 URL];
        v188 = [v187 path];
        [(C2MPNetworkEvent *)v163 setNetworkRequestUri:v188];
      }
      [(C2MPNetworkEvent *)v163 setTimestampC2Init:+[C2Time convertTimeIntervalToServerTime:v269->_initTime]];
      [(C2MPNetworkEvent *)v163 setTimestampC2Start:+[C2Time convertTimeIntervalToServerTime:v269->_resetTime]];
      [(C2MPNetworkEvent *)v163 setTimestampC2Now:+[C2Time convertTimeIntervalToServerTime:CFAbsoluteTimeGetCurrent()]];
      if (v13 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampDnsStart:+[C2Time convertTimeIntervalToServerTime:v13]];
      }
      if (v15 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampDnsEnd:+[C2Time convertTimeIntervalToServerTime:v15]];
      }
      if (v17 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampTcpStart:+[C2Time convertTimeIntervalToServerTime:v17]];
      }
      if (v266 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampTcpEnd:+[C2Time convertTimeIntervalToServerTime:v266]];
      }
      if (v20 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampSslStart:+[C2Time convertTimeIntervalToServerTime:v20]];
      }
      if (v22 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampRequestStart:+[C2Time convertTimeIntervalToServerTime:v22]];
      }
      if (v24 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampRequestEnd:+[C2Time convertTimeIntervalToServerTime:v24]];
      }
      if (v26 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampResponseStart:+[C2Time convertTimeIntervalToServerTime:v26]];
      }
      id v265 = v6;
      if (v28 != -1.0) {
        [(C2MPNetworkEvent *)v163 setTimestampResponseEnd:+[C2Time convertTimeIntervalToServerTime:v28]];
      }
      v189 = +[C2RequestOptions stringForQualityOfService:[(C2RequestOptions *)v269->_options qualityOfService]];
      [(C2MPNetworkEvent *)v163 setOptionsQualityOfService:v189];

      [(C2MPNetworkEvent *)v163 setOptionsOutOfProcess:[(C2RequestOptions *)v269->_options outOfProcess]];
      [(C2MPNetworkEvent *)v163 setOptionsOutOfProcessForceDiscretionary:[(C2RequestOptions *)v269->_options discretionaryNetworkBehavior] == 2];
      [(C2MPNetworkEvent *)v163 setOptionsAllowCellularAccess:[(C2RequestOptions *)v269->_options allowsCellularAccess]];
      [(C2MPNetworkEvent *)v163 setOptionsAllowExpensiveAccess:[(C2RequestOptions *)v269->_options _allowsExpensiveAccess]];
      [(C2MPNetworkEvent *)v163 setOptionsAllowPowerNapScheduling:[(C2RequestOptions *)v269->_options _allowsPowerNapScheduling]];
      [(C2RequestOptions *)v269->_options _timeoutIntervalForRequest];
      [(C2MPNetworkEvent *)v163 setOptionsTimeoutIntervalForRequest:v190];
      [(C2RequestOptions *)v269->_options _timeoutIntervalForResource];
      [(C2MPNetworkEvent *)v163 setOptionsTimeoutIntervalForResource:v191];
      v192 = [(C2RequestOptions *)v269->_options _sourceApplicationBundleIdentifier];
      [(C2MPNetworkEvent *)v163 setOptionsSourceApplicationBundleIdentifier:v192];

      v193 = [(C2RequestOptions *)v269->_options _sourceApplicationSecondaryIdentifier];
      [(C2MPNetworkEvent *)v163 setOptionsSourceApplicationSecondaryIdentifier:v193];

      v194 = [(C2RequestOptions *)v269->_options _appleIDContextSessionIdentifier];
      [(C2MPNetworkEvent *)v163 setOptionsAppleIdContext:v194 != 0];

      [(C2MPNetworkEvent *)v163 setOptionsTlsPinningRequired:[(C2RequestOptions *)v269->_options tlsPinning]];
      v195 = +[C2RequestOptions stringForDiscretionaryNetworkBehavior:[(C2RequestOptions *)v269->_options discretionaryNetworkBehavior]];
      [(C2MPNetworkEvent *)v163 setOptionsDiscretionaryNetworkBehavior:v195];

      v196 = +[C2RequestOptions stringForDuetPreClearedMode:[(C2RequestOptions *)v269->_options duetPreClearedMode]];
      [(C2MPNetworkEvent *)v163 setOptionsDuetPreClearedMode:v196];

      if (report)
      {
        uint32_t path_count = nw_data_transfer_report_get_path_count(report);
        if (path_count)
        {
          uint32_t v198 = path_count;
          for (uint32_t i = 0; v198 != i; ++i)
          {
            v200 = nw_data_transfer_report_copy_path_interface(v185, i);
            v201 = objc_alloc_init(C2MPPathInfo);
            nw_interface_type_t type = nw_interface_get_type(v200);
            switch(type)
            {
              case nw_interface_type_wired:
                v203 = v201;
                v204 = @"wired";
                break;
              case nw_interface_type_cellular:
                [(C2MPPathInfo *)v201 setInterfaceType:@"cellular"];
                if (nw_interface_get_radio_type() - 128 > 5)
                {
                  [(C2MPPathInfo *)v201 setRadioType:@"unknown"];
                }
                else
                {
                  v205 = NSString;
                  nw_interface_get_radio_type();
                  v206 = [v205 stringWithCString:nw_interface_radio_type_to_string() encoding:4];
                  [(C2MPPathInfo *)v201 setRadioType:v206];

                  v185 = report;
                }
                goto LABEL_197;
              case nw_interface_type_wifi:
                v203 = v201;
                v204 = @"wifi";
                break;
              default:
                v203 = v201;
                v204 = @"unknown";
                break;
            }
            [(C2MPPathInfo *)v203 setInterfaceType:v204];
LABEL_197:
            [(C2MPPathInfo *)v201 setApplicationBytesSent:nw_data_transfer_report_get_sent_application_byte_count(v185, i)];
            [(C2MPPathInfo *)v201 setApplicationBytesReceived:nw_data_transfer_report_get_received_application_byte_count(v185, i)];
            [(C2MPNetworkEvent *)v163 addNetworkPathInfo:v201];
          }
        }
      }
      +[C2ReportMetrics reportNetworkEvent:v163 triggers:v259 originalSessionTask:v269];

      id v6 = v265;
    }

    v10 = report;
  }
LABEL_151:
}

+ (double)captureMetricDurationBetweenStart:(double)a3 andEnd:(double)a4
{
  BOOL v4 = a4 == -1.0 || a3 == -1.0;
  double result = a4 - a3;
  if (v4) {
    return -1.0;
  }
  return result;
}

+ (double)captureMetricsForTimingData:(id)a3 withKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = [v5 objectForKeyedSubscript:v6];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v7;
        [v7 doubleValue];
        double v9 = v8;

        goto LABEL_7;
      }
    }
  }
  else
  {
    id v7 = 0;
  }
  double v9 = -1.0;
LABEL_7:
  if (v9 == 0.0) {
    double v9 = -1.0;
  }

  return v9;
}

- (void)C2Session:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_activity, &v11);
  [(C2SessionTaskDelegate *)self->_sessionTaskDelegate C2Session:v8 task:v9 didCompleteWithError:v10];
  [(C2SessionTask *)self invalidate];
  os_activity_scope_leave(&v11);
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  if (obj->_isComplete)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:obj file:@"C2SessionTask.m" lineNumber:134 description:@"received duplicate callbacks"];

    v3 = obj;
  }
  v3->_isComplete = 1;
  task = v3->_task;
  v3->_task = 0;

  delegate = obj->_delegate;
  obj->_delegate = 0;

  objc_sync_exit(obj);
}

- (C2RequestOptions)options
{
  return self->_options;
}

- (C2SessionTask)initWithOptions:(id)a3 delegate:(id)a4 sessionTaskDelegate:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  double v12 = v11;
  if (v9 && v10 && v11)
  {
    v26.receiver = self;
    v26.super_class = (Class)C2SessionTask;
    double v13 = [(C2SessionTask *)&v26 init];
    double v14 = v13;
    if (v13)
    {
      task = v13->_task;
      v13->_task = 0;

      objc_storeStrong((id *)&v14->_options, a3);
      objc_storeStrong((id *)&v14->_delegate, a4);
      objc_storeStrong((id *)&v14->_sessionTaskDelegate, a5);
      os_activity_t v16 = _os_activity_create(&dword_1DD523000, "c2-request-task", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      activity = v14->_activity;
      v14->_activity = (OS_os_activity *)v16;

      if (v14->_activity)
      {
        v14->_isComplete = 0;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        v14->_initTime = Current;
        v14->_resetTime = Current;
        v14->_attemptCount = 0;
        double v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        outstandingCallbacks = v14->_outstandingCallbacks;
        v14->_outstandingCallbacks = v19;
LABEL_23:

        self = v14;
        double v22 = self;
        goto LABEL_24;
      }
      if (C2_DEFAULT_LOG_BLOCK_3 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_14);
      }
      double v23 = C2_DEFAULT_LOG_INTERNAL_3;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD523000, v23, OS_LOG_TYPE_ERROR, "failed to create os_activity for C2SessionTask", buf, 2u);
      }
    }
    if (C2_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_17);
    }
    double v24 = C2_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD523000, v24, OS_LOG_TYPE_ERROR, "failed to create C2SessionTask", buf, 2u);
    }
    if (v14)
    {
      v14->_isComplete = 1;
      outstandingCallbacks = v14;
      double v14 = 0;
    }
    else
    {
      outstandingCallbacks = 0;
    }
    goto LABEL_23;
  }
  if (C2_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_8);
  }
  double v21 = C2_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    id v28 = v9;
    __int16 v29 = 2114;
    id v30 = v10;
    __int16 v31 = 2114;
    v32 = v12;
    _os_log_impl(&dword_1DD523000, v21, OS_LOG_TYPE_ERROR, "missing required arguments - [C2SessionTask initWithOptions:%{public}@ delegate:%{public}@ sessionTaskDelegate:%{public}@]", buf, 0x20u);
  }
  double v22 = 0;
LABEL_24:

  return v22;
}

- (id)taskIdentifier
{
  v3 = self;
  objc_sync_enter(v3);
  task = v3->_task;
  if (!task)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:v3 file:@"C2SessionTask.m" lineNumber:125 description:@"task must not be nil"];

    task = v3->_task;
  }
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSURLSessionDataTask taskIdentifier](task, "taskIdentifier"));
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:v3 file:@"C2SessionTask.m" lineNumber:127 description:@"task identifier must not be nil"];
  }
  objc_sync_exit(v3);

  return v5;
}

- (void)setTask:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = (NSURLSessionDataTask *)a3;
  if (C2_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_3, &__block_literal_global_32_0);
  }
  id v6 = C2_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = self;
    __int16 v12 = 2114;
    double v13 = v5;
    _os_log_impl(&dword_1DD523000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@ setTask:%{public}@]", (uint8_t *)&v10, 0x16u);
  }
  id v7 = self;
  objc_sync_enter(v7);
  if (v7->_task)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:v7 file:@"C2SessionTask.m" lineNumber:107 description:@"task must be nil"];
  }
  task = v7->_task;
  v7->_task = v5;

  objc_sync_exit(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_outstandingCallbacks, 0);
  objc_storeStrong((id *)&self->_sessionTaskDelegate, 0);
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (void)initialize
{
  if (!callbackHealthQueue)
  {
    BOOL v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v2 = dispatch_queue_create("com.apple.c2.callback.health", v4);
    v3 = (void *)callbackHealthQueue;
    callbackHealthQueue = (uint64_t)v2;
  }
}

+ (id)callbackHealthQueue
{
  return (id)callbackHealthQueue;
}

uint64_t __62__C2SessionTask_initWithOptions_delegate_sessionTaskDelegate___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __62__C2SessionTask_initWithOptions_delegate_sessionTaskDelegate___block_invoke_12()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __62__C2SessionTask_initWithOptions_delegate_sessionTaskDelegate___block_invoke_15()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __48__C2SessionTask_handleCallbackForTask_callback___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __25__C2SessionTask_setTask___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (BOOL)callbackHung
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  if ([(NSMutableSet *)v2->_outstandingCallbacks count])
  {
    mach_absolute_time();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v3 = v2->_outstandingCallbacks;
    uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      char v5 = 0;
      uint64_t v6 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "startTime", (void)v13);
          TMConvertTicksToSeconds();
          double v9 = v8;
          [(C2RequestOptions *)v2->_options taskCallbackConsideredHangInSeconds];
          if (v9 > v10) {
            char v5 = 1;
          }
        }
        uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v4);
      BOOL v11 = v5 & 1;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_sync_exit(v2);

  return v11;
}

- (void)testBehavior_triggerCallbackHang
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = self;
  objc_sync_enter(v2);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = v2->_outstandingCallbacks;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
        uint64_t v8 = mach_absolute_time();
        TMConvertTicksToSeconds();
        double v10 = v9;
        [(C2RequestOptions *)v2->_options taskCallbackConsideredHangInSeconds];
        [v7 setStartTime:(unint64_t)((double)v8 - (double)(unint64_t)((double)v8 / v10) * (v11 + v11))];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

uint64_t __51__C2SessionTask_captureMetricsWithError_eventType___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __51__C2SessionTask_captureMetricsWithError_eventType___block_invoke_125()
{
  C2_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __51__C2SessionTask_captureMetricsWithError_eventType___block_invoke_2()
{
  C2_TRIESTE_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.c2", "trieste");
  return MEMORY[0x1F41817F8]();
}

- (C2RequestDelegate)delegate
{
  return self->_delegate;
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (NSURLSessionTaskMetrics)taskMetrics
{
  return self->_taskMetrics;
}

- (void)setTaskMetrics:(id)a3
{
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (void)setIsComplete:(BOOL)a3
{
  self->_isComplete = a3;
}

- (C2SessionTaskDelegate)sessionTaskDelegate
{
  return self->_sessionTaskDelegate;
}

- (void)setSessionTaskDelegate:(id)a3
{
}

- (double)initTime
{
  return self->_initTime;
}

- (void)setInitTime:(double)a3
{
  self->_initTime = a3;
}

- (double)resetTime
{
  return self->_resetTime;
}

- (void)setResetTime:(double)a3
{
  self->_resetTime = a3;
}

- (unsigned)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(unsigned int)a3
{
  self->_attemptCount = a3;
}

- (NSMutableSet)outstandingCallbacks
{
  return self->_outstandingCallbacks;
}

- (void)setOutstandingCallbacks:(id)a3
{
}

- (OS_os_activity)activity
{
  return self->_activity;
}

@end