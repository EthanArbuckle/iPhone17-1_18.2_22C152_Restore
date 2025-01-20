@interface CKContextXPCProtocolImpl
+ (BOOL)_isDeviceLocked;
+ (id)dumpEnvironment;
+ (void)_shutdownServiceWithReply:(id)a3;
+ (void)initialize;
- (CKContextXPCProtocolImpl)initWithAssets:(id)a3;
- (id)_contextEngineInstance;
- (unint64_t)_totalDonationsToWaitForWithDonationState:(id)a3;
- (void)_findResultsForRequest:(id)a3 withReply:(id)a4 isServiceInternal:(BOOL)a5 transaction:(id)a6;
- (void)ancestorsForTopics:(id)a3 withReply:(id)a4;
- (void)capabilitiesForRequestType:(unint64_t)a3 withReply:(id)a4;
- (void)dealloc;
- (void)donate:(id)a3;
- (void)findCategorizationsForRequest:(id)a3 withReply:(id)a4;
- (void)findResultsForRequest:(id)a3 isServiceInternal:(BOOL)a4 reply:(id)a5;
- (void)findResultsForRequest:(id)a3 withReply:(id)a4;
- (void)groupResponses:(id)a3 withReply:(id)a4;
- (void)logEngagementForResponseId:(id)a3 result:(id)a4 rank:(unint64_t)a5 inputLength:(unint64_t)a6 completionLength:(unint64_t)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9;
- (void)logResultsShownForResponseId:(id)a3 shown:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 inputLength:(unint64_t)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10;
- (void)logTransactionSuccessfulForResponseId:(id)a3 inputLength:(unint64_t)a4 completionLength:(unint64_t)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7;
- (void)pingServiceWithReply:(id)a3;
- (void)semaphoreWithReply:(id)a3;
- (void)shutdownServiceWithReply:(id)a3;
- (void)statusWithReply:(id)a3;
- (void)warmUpForRequestType:(unint64_t)a3 withReply:(id)a4;
@end

@implementation CKContextXPCProtocolImpl

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    pthread_mutex_init(&stru_100563028, 0);
    atomic_store(0, (unint64_t *)&qword_100563018);
    id v2 = [objc_alloc((Class)CKContextSemaphore) initSemaphoreForXPCService];
    v3 = (void *)qword_100563020;
    qword_100563020 = (uint64_t)v2;

    [(id)qword_100563020 resetPending];
    if (notify_register_plain() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002B1BB0();
    }
    if (notify_set_state(dword_100563068, 0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1002B1B40();
      }
    }
  }
}

- (CKContextXPCProtocolImpl)initWithAssets:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKContextXPCProtocolImpl;
  v6 = [(CKContextXPCProtocolImpl *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assets, a3);
    uint64_t v8 = +[NSMapTable mapTableWithKeyOptions:0 valueOptions:5];
    donationExecutorsMap = v7->_donationExecutorsMap;
    v7->_donationExecutorsMap = (NSMapTable *)v8;

    v10 = [[CKContextUniversalRecentsManager alloc] initWithProtocolImpl:v7];
    recentsManager = v7->_recentsManager;
    v7->_recentsManager = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    processNameToScreenTimeRequestInfo = v7->_processNameToScreenTimeRequestInfo;
    v7->_processNameToScreenTimeRequestInfo = v12;

    v14 = +[FBSDisplayLayoutMonitorConfiguration configurationForDefaultMainDisplayMonitor];
    uint64_t v15 = +[FBSDisplayLayoutMonitor monitorWithConfiguration:v14];
    layoutMonitor = v7->_layoutMonitor;
    v7->_layoutMonitor = (FBSDisplayLayoutMonitor *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.siri.context.service.ScreenTimeSupport", 0);
    screenTimeRequestQueue = v7->_screenTimeRequestQueue;
    v7->_screenTimeRequestQueue = (OS_dispatch_queue *)v17;
  }
  return v7;
}

- (void)dealloc
{
  assets = self->_assets;
  self->_assets = 0;

  donationExecutorsMap = self->_donationExecutorsMap;
  self->_donationExecutorsMap = 0;

  processNameToScreenTimeRequestInfo = self->_processNameToScreenTimeRequestInfo;
  self->_processNameToScreenTimeRequestInfo = 0;

  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  layoutMonitor = self->_layoutMonitor;
  self->_layoutMonitor = 0;

  recentsManager = self->_recentsManager;
  self->_recentsManager = 0;

  v8.receiver = self;
  v8.super_class = (Class)CKContextXPCProtocolImpl;
  [(CKContextXPCProtocolImpl *)&v8 dealloc];
}

- (void)pingServiceWithReply:(id)a3
{
}

- (void)shutdownServiceWithReply:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received shutdown request", v4, 2u);
  }
  [(id)objc_opt_class() _shutdownServiceWithReply:v3];
}

+ (void)_shutdownServiceWithReply:(id)a3
{
  id v3 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  id v4 = objc_retainBlock(v3);

  [v5 postNotificationName:@"shutdownService" object:v4];
}

- (id)_contextEngineInstance
{
  pthread_mutex_lock(&stru_100563028);
  if (!self->_contextEngine)
  {
    id v3 = [[LuceneContextEngine alloc] initWithAssets:self->_assets];
    contextEngine = self->_contextEngine;
    self->_contextEngine = &v3->super;
  }
  pthread_mutex_unlock(&stru_100563028);
  id v5 = self->_contextEngine;
  return v5;
}

- (void)warmUpForRequestType:(unint64_t)a3 withReply:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  v7 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  if ([v7 disabled])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Engine is disabled", buf, 2u);
    }
    objc_super v8 = +[CKContextResponse serviceDisabledError];
    v5[2](v5, v8);
    goto LABEL_16;
  }
  if ([v7 stillWarmingUp])
  {
    objc_super v8 = [v7 warmUpDatPath];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_1002B1C98();
      if (v8)
      {
LABEL_8:
        char v38 = 0;
        v9 = +[NSFileManager defaultManager];
        unsigned __int8 v10 = [v9 fileExistsAtPath:v8 isDirectory:&v38];

        if ((v10 & 1) == 0)
        {
          BOOL v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
          if (v19) {
            sub_1002B1C5C(v19, v20, v21, v22, v23, v24, v25, v26);
          }
          goto LABEL_15;
        }
        if (v38)
        {
          BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v11) {
            sub_1002B1C20(v11, v12, v13, v14, v15, v16, v17, v18);
          }
          goto LABEL_15;
        }
        id v37 = 0;
        v27 = +[NSData dataWithContentsOfFile:v8 options:1 error:&v37];
        id v28 = v37;
        if (v28)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v40 = v28;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read from warm-up file: %@", buf, 0xCu);
          }
          v5[2](v5, v28);
          goto LABEL_32;
        }
        if ([v27 length])
        {
          if ((unint64_t)[v27 length] <= 0x10000)
          {
            v32 = +[_PASCompression decompress:v27 maxLength:0x10000];

            if (v32)
            {
              id v33 = [objc_alloc((Class)NSString) initWithData:v32 encoding:4];
              if ([v33 length])
              {
                v34 = +[CKContextRequest requestWithText:v33];
                [v34 setType:5];
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_1002AE224;
                v35[3] = &unk_10048BB38;
                v36 = v5;
                [(CKContextXPCProtocolImpl *)self findResultsForRequest:v34 isServiceInternal:1 reply:v35];
              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not read text from warm-up file", buf, 2u);
                }
                v5[2](v5, 0);
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warm-up file is not in the expected format", buf, 2u);
              }
              v5[2](v5, 0);
            }
            goto LABEL_33;
          }
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_31;
          }
          id v29 = [v27 length];
          *(_DWORD *)buf = 134217984;
          id v40 = v29;
          v30 = "Warm-up file is too large: %lu";
          uint32_t v31 = 12;
        }
        else
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_31:
            v5[2](v5, 0);
LABEL_32:

LABEL_33:
            goto LABEL_16;
          }
          *(_WORD *)buf = 0;
          v30 = "Could not read from warm-up file, probably empty";
          uint32_t v31 = 2;
        }
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v30, buf, v31);
        goto LABEL_31;
      }
    }
    else if (v8)
    {
      goto LABEL_8;
    }
LABEL_15:
    v5[2](v5, 0);
LABEL_16:

    goto LABEL_17;
  }
  v5[2](v5, 0);
LABEL_17:
}

- (void)findCategorizationsForRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  screenTimeRequestQueue = self->_screenTimeRequestQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002AE374;
  v11[3] = &unk_10048BB60;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(screenTimeRequestQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)findResultsForRequest:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (([v6 type] == (id)10 || objc_msgSend(v6, "type") == (id)20)
    && [(id)objc_opt_class() _isDeviceLocked])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Immediately returning empty results because the device is locked.", buf, 2u);
    }
    objc_super v8 = (RequestTransaction *)objc_msgSend(objc_alloc((Class)CKContextResponse), "initWithResults:requestType:", &__NSArray0__struct, objc_msgSend(v6, "type"));
    v7[2](v7, v8);
    goto LABEL_29;
  }
  if ([v6 type] != (id)6) {
    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Processing a rate limited request", buf, 2u);
  }
  id v33 = +[NSXPCConnection currentConnection];
  int v9 = [v33 processIdentifier];
  *__error() = 0;
  unsigned int v10 = proc_name(v9, buf, 0x400u);
  __error();
  if ((v10 & 0x80000000) != 0) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = (__CFString *)[objc_alloc((Class)NSString) initWithBytes:buf length:v10 encoding:4];
  }
  if (![(__CFString *)v11 length])
  {

    BOOL v11 = @"default-process";
  }
  id v12 = self->_processNameToScreenTimeRequestInfo;
  objc_sync_enter(v12);
  id v13 = +[NSDate date];
  id v14 = [(NSMutableDictionary *)self->_processNameToScreenTimeRequestInfo objectForKeyedSubscript:v11];
  if (!v14)
  {
    id v14 = objc_alloc_init(ScreenTimeRequestInfo);
    [(ScreenTimeRequestInfo *)v14 setLatestRequest:v13];
    [(ScreenTimeRequestInfo *)v14 setAllowance:500];
  }
  uint64_t v15 = [(ScreenTimeRequestInfo *)v14 latestRequest];
  uint64_t v16 = (void *)v15;
  if (v15) {
    uint64_t v17 = (void *)v15;
  }
  else {
    uint64_t v17 = v13;
  }
  [v13 timeIntervalSinceDate:v17];
  double v19 = v18;

  [(ScreenTimeRequestInfo *)v14 setLatestRequest:v13];
  [(ScreenTimeRequestInfo *)v14 setAllowance:(unint64_t)((double)[(ScreenTimeRequestInfo *)v14 allowance] + fabs(v19) * 50.0)];
  if ([(ScreenTimeRequestInfo *)v14 allowance] >= 0x1F5) {
    [(ScreenTimeRequestInfo *)v14 setAllowance:500];
  }
  unint64_t v20 = [(ScreenTimeRequestInfo *)v14 allowance];
  if (v20)
  {
    [(ScreenTimeRequestInfo *)v14 setAllowance:(unint64_t)((double)[(ScreenTimeRequestInfo *)v14 allowance] + -1.0)];
    [(NSMutableDictionary *)self->_processNameToScreenTimeRequestInfo setObject:v14 forKeyedSubscript:v11];
  }
  else
  {
    BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v21) {
      sub_1002B1D44(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    id v29 = +[NSDictionary dictionaryWithObject:@"Too many concurrent requests at this time" forKey:NSLocalizedFailureReasonErrorKey];
    v30 = +[NSError errorWithDomain:ContextKitErrorDomain code:6 userInfo:v29];

    id v31 = objc_msgSend(objc_alloc((Class)CKContextResponse), "initWithError:requestType:", v30, objc_msgSend(v6, "type"));
    v7[2](v7, v31);
  }
  objc_sync_exit(v12);

  if (v20)
  {
LABEL_28:
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1002AEBCC;
    v34[3] = &unk_10048BB88;
    v34[4] = self;
    v35 = -[RequestTransaction initWithTransactionId:decPending:]([RequestTransaction alloc], "initWithTransactionId:decPending:", @"ContextService.findResults", [v6 incPending]);
    v36 = v7;
    objc_super v8 = v35;
    [(CKContextXPCProtocolImpl *)self _findResultsForRequest:v6 withReply:v34 isServiceInternal:0 transaction:v8];
    id v32 = self;

LABEL_29:
  }
}

- (void)findResultsForRequest:(id)a3 isServiceInternal:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002AED7C;
  v13[3] = &unk_10048BBB0;
  id v14 = -[RequestTransaction initWithTransactionId:decPending:]([RequestTransaction alloc], "initWithTransactionId:decPending:", @"ContextService.findResults", [v9 incPending]);
  id v15 = v8;
  id v10 = v8;
  BOOL v11 = v14;
  [(CKContextXPCProtocolImpl *)self _findResultsForRequest:v9 withReply:v13 isServiceInternal:v5 transaction:v11];

  id v12 = self;
}

- (void)_findResultsForRequest:(id)a3 withReply:(id)a4 isServiceInternal:(BOOL)a5 transaction:(id)a6
{
  id v186 = a3;
  v187 = (void (**)(id, id))a4;
  id v181 = a6;
  v182 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  v185 = +[ContextConfiguration sharedInstance];
  if (!v187)
  {
    id v13 = +[MetricsLogging instance];
    goto LABEL_5;
  }
  if (([v182 disabled] & 1) != 0
    || ([v185 portraitEnabled] & 1) == 0 && objc_msgSend(v186, "type") == (id)2)
  {
    id v10 = objc_alloc((Class)CKContextResponse);
    BOOL v11 = +[CKContextResponse serviceDisabledError];
    id v12 = objc_msgSend(v10, "initWithError:requestType:", v11, objc_msgSend(v186, "type"));
    v187[2](v187, v12);

    id v13 = +[MetricsLogging instance];
LABEL_5:
    id v14 = v13;
    [v13 recordAssetInfo:self->_assets];

    goto LABEL_6;
  }
  id v15 = [v185 debugFakeResults];

  if (!v15)
  {
    uint64_t v23 = mach_absolute_time();
    v168 = +[NSXPCConnection currentConnection];
    if (a5
      || ([v168 valueForEntitlement:@"com.apple.private.contextkit.include-original-request"],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          v24,
          v24))
    {
      char v25 = 1;
      uint64_t v26 = v186;
    }
    else
    {
      uint64_t v26 = v186;
      if ([v186 includeRequestInResponse]) {
        goto LABEL_36;
      }
      char v25 = 0;
    }
    unsigned int v27 = [v26 isRequestingContentFromActiveApplications];
    if (!v27
      || a5
      || !v168
      || ([v168 valueForEntitlement:@"com.apple.private.contextkit.request-external-content"],
          uint64_t v28 = objc_claimAutoreleasedReturnValue(),
          v28,
          v28))
    {
      unsigned int v163 = [v182 stillWarmingUp];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v220 = 0x3032000000;
      v221 = sub_1002B04B4;
      v222 = sub_1002B04C4;
      id v223 = [v182 indexId];
      v166 = [v186 text];
      id v29 = [v186 type];
      if (v29 != (id)15 && v29 != (id)1)
      {
        LOBYTE(v33) = 0;
LABEL_41:
        v201[0] = _NSConcreteStackBlock;
        v201[1] = 3221225472;
        v201[2] = sub_1002B04CC;
        v201[3] = &unk_10048BBD8;
        char v208 = v25;
        id v167 = v186;
        id v202 = v167;
        uint64_t v207 = v23;
        p_long long buf = &buf;
        v205 = v187;
        v203 = self;
        id v204 = v181;
        v164 = objc_retainBlock(v201);
        v51 = v167;
        if (v166 && (unint64_t)[v166 length] <= 3)
        {
          v52 = [v167 url];
          if (v52)
          {

            v51 = v167;
            goto LABEL_45;
          }
          v74 = [v167 itemIds];
          if (![v74 count])
          {

LABEL_70:
            id v77 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_1002B2054((uint8_t *)&v211, (uint64_t)[v166 length]);
            }

            dsema = objc_msgSend(objc_alloc((Class)CKContextResponse), "initWithResults:requestType:", &__NSArray0__struct, objc_msgSend(v167, "type"));
            ((void (*)(void *, NSObject *))v164[2])(v164, dsema);
            goto LABEL_171;
          }
          BOOL v75 = [v167 maxConstellationTopics] == 0;

          v51 = v167;
          if (v75) {
            goto LABEL_70;
          }
        }
LABEL_45:
        dsema = [v185 maxConcurrencySemaphore];
        if (dispatch_semaphore_wait(dsema, (dispatch_time_t)[v185 maxConcurrencySemaphoreTimeout]))
        {
          BOOL v53 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
          if (v53)
          {
            sub_1002B2018(v53, v54, v55, v56, v57, v58, v59, v60);
            v51 = v167;
          }
          id v61 = objc_alloc((Class)CKContextResponse);
          v62 = +[CKContextResponse serviceBusyError];
          id v63 = objc_msgSend(v61, "initWithError:requestType:", v62, objc_msgSend(v51, "type"));
          ((void (*)(void *, id))v164[2])(v164, v63);

          goto LABEL_171;
        }
        if (v27)
        {
          id v64 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            LOWORD(v211) = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Soliciting donations from other apps", (uint8_t *)&v211, 2u);
          }

          uint64_t v65 = mach_absolute_time();
          [v167 donationTimeout];
          if (v66 <= 0.0) {
            double v67 = 0.75;
          }
          else {
            double v67 = v66;
          }
          dispatch_time_t v68 = dispatch_time(0, (uint64_t)(v67 * 1000000000.0));
          v69 = [[DonationState alloc] initWithLayoutMonitor:self->_layoutMonitor];
          id v70 = objc_alloc_init((Class)NSMutableArray);
          [(DonationState *)v69 setDonations:v70];

          if (([v167 type] == (id)10 || objc_msgSend(v167, "type") == (id)20)
            && ![(CKContextXPCProtocolImpl *)self _totalDonationsToWaitForWithDonationState:v69])
          {
            dispatch_semaphore_signal(dsema);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              LOWORD(v211) = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Immediately returning empty results because no valid applications to extract from.", (uint8_t *)&v211, 2u);
            }
            id v76 = objc_msgSend(objc_alloc((Class)CKContextResponse), "initWithResults:requestType:", &__NSArray0__struct, objc_msgSend(v167, "type"));
            ((void (*)(void *, id))v164[2])(v164, v76);

            goto LABEL_171;
          }
          uint64_t v71 = dispatch_get_global_queue(25, 0);
          v200[0] = _NSConcreteStackBlock;
          v200[1] = 3221225472;
          v200[2] = sub_1002B07F8;
          v200[3] = &unk_10048BC00;
          *(double *)&v200[5] = v67;
          v200[4] = self;
          id v72 = [objc_alloc((Class)CKContextExecutor) initWithContext:v69 workItemQueue:v71 completionQueue:v71 timeoutAfter:v68 completionHandler:v200];
          [v72 markIncomplete];
          if (v33)
          {
            uint64_t v73 = 0x10000000000;
          }
          else if ([v167 type] == (id)20)
          {
            uint64_t v73 = 0x60000000000;
          }
          else if ([v167 type] == (id)16)
          {
            if ([v167 includeLeadImage]) {
              uint64_t v73 = 0x50000000000;
            }
            else {
              uint64_t v73 = 0x30000000000;
            }
          }
          else if ([v167 includeRequestInResponse])
          {
            uint64_t v73 = 0x20000000000;
          }
          else if ([v167 includeStructuredExtractionResults])
          {
            uint64_t v73 = 0x40000000000;
          }
          else
          {
            uint64_t v73 = 0;
          }
          v162 = v72;
          uint64_t v78 = arc4random();
          v160 = (void *)v71;
          uint64_t v79 = time(0) & 0xFFFFFFFFFFLL | v73 | (v78 << 48);
          v80 = self->_donationExecutorsMap;
          objc_sync_enter(v80);
          donationExecutorsMap = self->_donationExecutorsMap;
          v82 = +[NSNumber numberWithUnsignedLongLong:v79];
          [(NSMapTable *)donationExecutorsMap setObject:v162 forKey:v82];

          objc_sync_exit(v80);
          if (notify_set_state(dword_100563068, v79))
          {
            id v83 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1002B1B40();
            }
          }
          if (notify_post("com.apple.contextkit.content-request"))
          {
            id v84 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              sub_1002B1FA8();
            }
          }
          [v162 markReadyAndAwaitCompletion];
          v85 = v69;
          objc_sync_enter(v85);
          unsigned __int8 v86 = [(DonationState *)v85 balancedMarkIncomplete];
          [(DonationState *)v85 setBalancedMarkIncomplete:1];
          objc_sync_exit(v85);
          v161 = v85;

          if ((v86 & 1) == 0) {
            [v162 markReady];
          }
          v87 = [(DonationState *)v85 donations];
          v88 = self->_donationExecutorsMap;
          objc_sync_enter(v88);
          v89 = self->_donationExecutorsMap;
          v90 = +[NSNumber numberWithUnsignedLongLong:v79];
          [(NSMapTable *)v89 removeObjectForKey:v90];

          objc_sync_exit(v88);
          +[Util elapsedMillisSinceMachAbsolute:v65];
          double v92 = v91;
          id v93 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
            sub_1002B1F48(v218, (uint64_t)[v87 count], -[DonationState numberOfApplicationsToWaitFor](v161, "numberOfApplicationsToWaitFor"), v92);
          }

          v170 = +[NSMutableArray array];
          id v94 = objc_alloc_init((Class)NSMutableArray);
          id v95 = objc_alloc_init((Class)NSMutableArray);
          long long v198 = 0u;
          long long v199 = 0u;
          long long v196 = 0u;
          long long v197 = 0u;
          id obj = v87;
          id v96 = [obj countByEnumeratingWithState:&v196 objects:v217 count:16];
          if (v96)
          {
            v171 = 0;
            v172 = 0;
            uint64_t v173 = *(void *)v197;
            v177 = &stru_10048C1F8;
            v178 = &stru_10048C1F8;
            v175 = &stru_10048C1F8;
            v176 = &stru_10048C1F8;
            v179 = &stru_10048C1F8;
            do
            {
              id v174 = v96;
              for (i = 0; i != v174; i = (char *)i + 1)
              {
                if (*(void *)v197 != v173) {
                  objc_enumerationMutation(obj);
                }
                v98 = *(void **)(*((void *)&v196 + 1) + 8 * i);
                v188 = [v98 items];
                v99 = [v98 donorBundleIdentifier];
                if ([v99 length]) {
                  [v170 addObject:v99];
                }
                if ([v188 count])
                {
                  v184 = [v98 concatenatedRequestsText];
                  if ([v184 length])
                  {
                    v100 = [(__CFString *)v179 stringByAppendingString:v184];

                    v179 = [v100 stringByAppendingString:@"\n\n"];
                  }
                  v183 = [v98 concatenatedRequestsDebugText];
                  if ([v183 length])
                  {
                    v101 = [(__CFString *)v178 stringByAppendingString:v183];

                    v178 = [v101 stringByAppendingString:@"\n\n"];
                  }
                  if (![(__CFString *)v177 length])
                  {
                    uint64_t v102 = objc_msgSend(v98, "internal_bestDebugUrlString");

                    v177 = (__CFString *)v102;
                  }
                  if (![(__CFString *)v176 length])
                  {
                    uint64_t v103 = objc_msgSend(v98, "internal_bestTitle");

                    v176 = (__CFString *)v103;
                  }
                  if (![(__CFString *)v175 length])
                  {
                    uint64_t v104 = objc_msgSend(v98, "internal_bestRawHTML");

                    v175 = (__CFString *)v104;
                  }
                  if (!v172)
                  {
                    v172 = objc_msgSend(v98, "internal_bestLeadImage");
                  }
                  if (!v171)
                  {
                    v171 = objc_msgSend(v98, "internal_bestSnapshot");
                  }
                  long long v194 = 0u;
                  long long v195 = 0u;
                  long long v192 = 0u;
                  long long v193 = 0u;
                  id v105 = v188;
                  id v106 = [v105 countByEnumeratingWithState:&v192 objects:v216 count:16];
                  if (v106)
                  {
                    uint64_t v107 = *(void *)v193;
                    do
                    {
                      for (j = 0; j != v106; j = (char *)j + 1)
                      {
                        if (*(void *)v193 != v107) {
                          objc_enumerationMutation(v105);
                        }
                        v109 = *(void **)(*((void *)&v192 + 1) + 8 * (void)j);
                        v110 = [v109 uiElements];
                        if ([v110 count]) {
                          [v94 addObjectsFromArray:v110];
                        }
                        v111 = [v109 extractionItems];
                        if ([v111 count]) {
                          [v95 addObjectsFromArray:v111];
                        }
                      }
                      id v106 = [v105 countByEnumeratingWithState:&v192 objects:v216 count:16];
                    }
                    while (v106);
                  }
                }
              }
              id v96 = [obj countByEnumeratingWithState:&v196 objects:v217 count:16];
            }
            while (v96);
          }
          else
          {
            v171 = 0;
            v172 = 0;
            v177 = &stru_10048C1F8;
            v178 = &stru_10048C1F8;
            v175 = &stru_10048C1F8;
            v176 = &stru_10048C1F8;
            v179 = &stru_10048C1F8;
          }

          v112 = v161;
          objc_sync_enter(v112);
          [(DonationState *)v112 setDonations:0];

          objc_sync_exit(v112);
          if ([v167 debug]) {
            unsigned int v113 = 1;
          }
          else {
            unsigned int v113 = [v167 includeRequestInResponse];
          }
          [v167 setText:v179];
          if (v113) {
            v114 = v178;
          }
          else {
            v114 = 0;
          }
          [v167 setDebugText:v114];
          if (v113) {
            v115 = v177;
          }
          else {
            v115 = 0;
          }
          [v167 setDebugUrlString:v115];
          if (v113) {
            v116 = v175;
          }
          else {
            v116 = 0;
          }
          [v167 setRawHTML:v116];
          [v167 setTitle:v176];
          id v117 = [v170 copy];
          [v167 setDonorBundleIdentifiers:v117];

          [v94 count];
          if (v94)
          {
            id v118 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_1002B1ED8();
            }

            [v167 setUiElements:v94];
          }
          if ([v95 count])
          {
            id v119 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
              sub_1002B1E68();
            }

            [v167 setExtractionItems:v95];
          }
          if (v172)
          {
            id v120 = &_os_log_default;
            BOOL v121 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            if (v121) {
              sub_1002B1E2C(v121, v122, v123, v124, v125, v126, v127, v128);
            }

            [v167 setLeadImage:v172];
          }
          if (v171)
          {
            id v129 = &_os_log_default;
            BOOL v130 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            if (v130) {
              sub_1002B1DF0(v130, v131, v132, v133, v134, v135, v136, v137);
            }

            [v167 setSnapshot:v171];
          }
        }
        *(void *)&long long v211 = 0;
        *((void *)&v211 + 1) = &v211;
        uint64_t v212 = 0x3032000000;
        v213 = sub_1002B04B4;
        v214 = sub_1002B04C4;
        id v215 = 0;
        dispatch_semaphore_t v138 = dispatch_semaphore_create(0);
        [v185 debugDelaySecs];
        float v140 = v139;
        if (v139 > 0.0)
        {
          id v141 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v209 = 134217984;
            double v210 = v140;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "debugDelaySecs: Adding artificial delay of %f seconds...", v209, 0xCu);
          }

          v142 = dispatch_semaphore_create(0);
          dispatch_time_t v143 = dispatch_time(0, (uint64_t)(float)(v140 * 1000000000.0));
          dispatch_semaphore_wait(v142, v143);
        }
        v189[0] = _NSConcreteStackBlock;
        v189[1] = 3221225472;
        v189[2] = sub_1002B08FC;
        v189[3] = &unk_10048BC28;
        v191 = &v211;
        v144 = v138;
        v190 = v144;
        v145 = objc_retainBlock(v189);
        uint64_t v146 = mach_absolute_time();
        id v147 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v148 = [v182 description];
          sub_1002B1D80(v148, (uint64_t)&buf + 8, v209);
        }

        [v182 findResultsForRequest:v167 withReply:v145];
        +[Util elapsedNanosSinceMachAbsolute:v146];
        *(float *)&double v149 = v149;
        BOOL v150 = dispatch_semaphore_wait(v144, (dispatch_time_t)[v185 findResultsTimeoutWithNanosAlreadySpent:v149]) == 0;

        dispatch_semaphore_signal(dsema);
        if (v150 && *(void *)(*((void *)&v211 + 1) + 40))
        {
          +[Util elapsedMillisSinceMachAbsolute:v146];
          double v157 = v156;
          ((void (*)(void *, void))v164[2])(v164, *(void *)(*((void *)&v211 + 1) + 40));
          [v185 findResultsSlowSecs];
          if (v157 <= v158 * 1000.0) {
            goto LABEL_170;
          }
          v154 = +[MetricsLogging instance];
          id v159 = [v167 type];
          [v154 recordSlowFindResults:0 requestType:v159 indexId:*(void *)(*((void *)&buf + 1) + 40) coldEngine:v163];
        }
        else
        {
          id v151 = objc_alloc((Class)CKContextResponse);
          v152 = +[CKContextResponse timeoutError];
          id v153 = objc_msgSend(v151, "initWithError:requestType:", v152, objc_msgSend(v167, "type"));
          ((void (*)(void *, id))v164[2])(v164, v153);

          v154 = +[MetricsLogging instance];
          id v155 = [v167 type];
          [v154 recordSlowFindResults:1 requestType:v155 indexId:*(void *)(*((void *)&buf + 1) + 40) coldEngine:v163];
        }

LABEL_170:
        _Block_object_dispose(&v211, 8);

LABEL_171:
        _Block_object_dispose(&buf, 8);

        goto LABEL_172;
      }
      id v30 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        id v31 = [v186 languageTag];
        LODWORD(v211) = 138412290;
        *(void *)((char *)&v211 + 4) = v31;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Safari request with language tag: %@", (uint8_t *)&v211, 0xCu);
      }
      id v32 = [v186 text];
      BOOL v33 = [v32 length] == 0;

      if (v33)
      {
        id v39 = &_os_log_default;
        BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v40) {
          sub_1002B20A0(v40, v41, v42, v43, v44, v45, v46, v47);
        }
        unsigned int v27 = 1;
        goto LABEL_40;
      }
      v34 = [v186 text];
      BOOL v35 = (unint64_t)[v34 length] < 0x40;

      id v36 = &_os_log_default;
      BOOL v37 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v35)
      {
        if (v37)
        {
          LOWORD(v211) = 0;
          char v38 = "Safari request with little text";
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v38, (uint8_t *)&v211, 2u);
        }
      }
      else if (v37)
      {
        LOWORD(v211) = 0;
        char v38 = "Safari request with some text";
        goto LABEL_39;
      }
LABEL_40:

      goto LABEL_41;
    }
LABEL_36:
    id v48 = objc_alloc((Class)CKContextResponse);
    v49 = +[CKContextResponse missingEntitlementError];
    id v50 = objc_msgSend(v48, "initWithError:requestType:", v49, objc_msgSend(v186, "type"));
    v187[2](v187, v50);

LABEL_172:
    goto LABEL_6;
  }
  [v185 debugDelaySecs];
  if (v16 > 0.0)
  {
    float v17 = v16;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "debugDelaySecs: Adding artificial delay of %f seconds...", (uint8_t *)&buf, 0xCu);
    }
    double v18 = dispatch_semaphore_create(0);
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(float)(v17 * 1000000000.0));
    dispatch_semaphore_wait(v18, v19);
  }
  id v20 = objc_alloc((Class)CKContextResponse);
  BOOL v21 = [v185 debugFakeResults];
  id v22 = objc_msgSend(v20, "initWithResults:requestType:", v21, objc_msgSend(v186, "type"));
  v187[2](v187, v22);

LABEL_6:
}

- (void)capabilitiesForRequestType:(unint64_t)a3 withReply:(id)a4
{
  BOOL v5 = (void (**)(id, id, void *, void))a4;
  id v12 = +[NSMutableSet set];
  id v6 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  if (([v6 disabled] & 1) == 0)
  {
    [v12 addObject:&off_1004B1D90];
    id v7 = +[ContextConfiguration sharedInstance];
    if ([v7 portraitEnabled]) {
      [v12 addObject:&off_1004B1DA8];
    }
    if ([v7 highLevelTopicsEnabled]) {
      [v12 addObject:&off_1004B1DC0];
    }
    if ([v7 digitalHealthEnabled]) {
      [v12 addObject:&off_1004B1DD8];
    }
    if ([v7 internalGradingEnabled]
      && +[_PASDeviceInfo isInternalBuild])
    {
      [v12 addObject:&off_1004B1DF0];
    }
  }
  id v8 = +[ContextConfiguration sharedInstance];
  id v9 = [v8 indexVersionId];
  id v10 = [v6 indexId];
  BOOL v11 = +[NSString stringWithFormat:@"%@-%@", v9, v10];

  v5[2](v5, v12, v11, 0);
}

- (void)ancestorsForTopics:(id)a3 withReply:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  if ([v7 disabled] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = +[CKContextResponse serviceDisabledError];
    v6[2](v6, 0, v8);
  }
  else
  {
    id v8 = [v7 ancestorsForTopics:v10];
    if (v8)
    {
      ((void (**)(id, void *, void *))v6)[2](v6, v8, 0);
    }
    else
    {
      id v9 = +[CKContextResponse timeoutError];
      v6[2](v6, 0, v9);
    }
  }
}

- (void)groupResponses:(id)a3 withReply:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  if ([v7 disabled] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v8 = +[CKContextResponse serviceDisabledError];
    v6[2](v6, 0, v8);
  }
  else
  {
    id v8 = [v7 groupResponses:v9];
    ((void (**)(id, void *, void *))v6)[2](v6, v8, 0);
  }
}

- (void)statusWithReply:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  BOOL v5 = +[MetricsLogging instance];
  [v5 recordAssetInfo:self->_assets];

  id v33 = (id)objc_opt_new();
  id v6 = [(CTKAssets *)self->_assets common];
  if (v6)
  {
    id v7 = objc_opt_new();
    id v8 = [v6 assetVersion];
    id v9 = [v6 compatibilityVersion];
    if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v10 = +[NSNumber numberWithUnsignedInteger:v8];
      [v7 setObject:v10 forKeyedSubscript:@"contentVersion"];
    }
    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v11 = +[NSNumber numberWithUnsignedInteger:v9];
      [v7 setObject:v11 forKeyedSubscript:@"compatVersion"];
    }
    [v33 setObject:v7 forKeyedSubscript:@"common"];
  }
  id v12 = [(CTKAssets *)self->_assets index];
  if (v12)
  {
    id v13 = objc_opt_new();
    id v14 = [v12 first];
    id v15 = [v14 assetVersion];

    float v16 = [v12 first];
    id v17 = [v16 compatibilityVersion];

    if (v15 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      double v18 = +[NSNumber numberWithUnsignedInteger:v15];
      [v13 setObject:v18 forKeyedSubscript:@"contentVersion"];
    }
    if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      dispatch_time_t v19 = +[NSNumber numberWithUnsignedInteger:v17];
      [v13 setObject:v19 forKeyedSubscript:@"compatVersion"];
    }
    id v20 = [v12 second];
    [v13 setObject:v20 forKeyedSubscript:@"indexIdentifier"];

    [v33 setObject:v13 forKeyedSubscript:@"index"];
  }
  BOOL v21 = +[ContextConfiguration sharedInstance];
  id v22 = [v21 debugStatus];
  [v33 setObject:v22 forKeyedSubscript:@"currentConfiguration"];

  uint64_t v23 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  uint64_t v24 = [v23 debugStatus];
  [v33 setObject:v24 forKeyedSubscript:@"engineStatus"];

  char v25 = +[CTKABHelper refId];
  uint64_t v26 = [v25 description];
  [v33 setObject:v26 forKeyedSubscript:@"refId"];

  unsigned int v27 = [(CKContextXPCProtocolImpl *)self _contextEngineInstance];
  uint64_t v28 = [v27 indexId];
  [v33 setObject:v28 forKeyedSubscript:@"indexId"];

  id v29 = +[MetricsLogging instance];
  id v30 = [v29 debugStatus];
  [v33 setObject:v30 forKeyedSubscript:@"loggingStatus"];

  id v31 = +[_PASDeviceState currentOsBuild];
  [v33 setObject:v31 forKeyedSubscript:@"osBuildNumber"];

  id v32 = [(id)objc_opt_class() dumpEnvironment];
  [v33 setObject:v32 forKeyedSubscript:@"environment"];

  v4[2](v4, v33, 0);
}

+ (BOOL)_isDeviceLocked
{
  return +[_PASDeviceState isUnlocked] ^ 1;
}

+ (id)dumpEnvironment
{
  id v2 = objc_alloc_init((Class)NSMutableString);
  uint64_t v3 = *environ;
  NSStringEncoding v4 = +[NSString defaultCStringEncoding];
  if (v3)
  {
    NSStringEncoding v5 = v4;
    uint64_t v6 = 8;
    do
    {
      id v7 = +[NSString stringWithCString:v3 encoding:v5];
      [v2 appendString:v7];

      [v2 appendString:@"\n"];
      uint64_t v3 = *(void *)(environ + v6);
      v6 += 8;
    }
    while (v3);
  }
  return v2;
}

- (void)donate:(id)a3
{
  id v4 = a3;
  NSStringEncoding v5 = +[NSXPCConnection currentConnection];
  uint64_t v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
  id v7 = [v4 nonce];
  if (v7
    || ([v4 associatedUserActivity],
        uint64_t v23 = objc_claimAutoreleasedReturnValue(),
        v23,
        !v23))
  {
    id v8 = [v4 items];
    unint64_t v9 = (unint64_t)[v8 count];

    unint64_t v10 = (unint64_t)[v4 remoteProcesses];
    BOOL v11 = self->_donationExecutorsMap;
    objc_sync_enter(v11);
    donationExecutorsMap = self->_donationExecutorsMap;
    id v13 = +[NSNumber numberWithUnsignedLongLong:v7];
    id v14 = [(NSMapTable *)donationExecutorsMap objectForKey:v13];

    objc_sync_exit(v11);
    if (!v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = [v4 donorBundleIdentifier];
        int v28 = 134218498;
        unint64_t v29 = v9;
        __int16 v30 = 2112;
        unint64_t v31 = (unint64_t)v6;
        __int16 v32 = 2112;
        id v33 = v26;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Refusing donation of %lu items from PID %@ for %@: unexpected/too late", (uint8_t *)&v28, 0x20u);
      }
      goto LABEL_18;
    }
    id v15 = [v14 context];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      float v16 = [v4 donorBundleIdentifier];
      id v17 = [v15 dateCreated];
      [v17 timeIntervalSinceNow];
      int v28 = 134219010;
      unint64_t v29 = v9;
      __int16 v30 = 2048;
      unint64_t v31 = v10;
      __int16 v32 = 2112;
      id v33 = v6;
      __int16 v34 = 2112;
      BOOL v35 = v16;
      __int16 v36 = 1024;
      int v37 = (int)(v18 * -1000.0);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Donation of %lu items / rc:%lu from PID %@ for %@ received after %i ms", (uint8_t *)&v28, 0x30u);
    }
    if (v9 | v10)
    {
      id v19 = v15;
      objc_sync_enter(v19);
      objc_msgSend(v19, "setAdditionalDonationsToWaitFor:", (char *)objc_msgSend(v19, "additionalDonationsToWaitFor") + v10);
      id v20 = [v19 donations];
      [v20 addObject:v4];

      BOOL v21 = [v19 donations];
      id v22 = [v21 count];
      if (v22 >= (id)[(CKContextXPCProtocolImpl *)self _totalDonationsToWaitForWithDonationState:v19])
      {
        unsigned __int8 v27 = [v19 balancedMarkIncomplete];

        if ((v27 & 1) == 0)
        {
          [v19 setBalancedMarkIncomplete:1];
          objc_sync_exit(v19);

          [v14 markReady];
          goto LABEL_17;
        }
      }
      else
      {
      }
      objc_sync_exit(v19);
    }
LABEL_17:

LABEL_18:
    [v5 invalidate];
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Handling a user activity donation", (uint8_t *)&v28, 2u);
  }
  id v14 = (void *)os_transaction_create();
  recentsManager = self->_recentsManager;
  char v25 = +[NSUserDefaults standardUserDefaults];
  -[CKContextUniversalRecentsManager processDonation:retrievingTopics:](recentsManager, "processDonation:retrievingTopics:", v4, [v25 BOOLForKey:@"CKContextUniversalRecentsTopicExtraction"]);

LABEL_19:
}

- (unint64_t)_totalDonationsToWaitForWithDonationState:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v4 = (char *)[v3 additionalDonationsToWaitFor];
      int v8 = 134217984;
      unint64_t v9 = &v4[(void)[v3 numberOfApplicationsToWaitFor]];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Total donations to wait for is %lu", (uint8_t *)&v8, 0xCu);
    }
    NSStringEncoding v5 = (char *)[v3 additionalDonationsToWaitFor];
    uint64_t v6 = &v5[(void)[v3 numberOfApplicationsToWaitFor]];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (unint64_t)v6;
}

- (void)logResultsShownForResponseId:(id)a3 shown:(unint64_t)a4 couldHaveShown:(unint64_t)a5 topicIds:(id)a6 serverOverride:(BOOL)a7 inputLength:(unint64_t)a8 requestType:(unint64_t)a9 logType:(unint64_t)a10
{
  BOOL v11 = a7;
  contextEngine = self->_contextEngine;
  id v15 = a6;
  id v17 = [(ContextEngine *)contextEngine indexId];
  float v16 = +[MetricsLogging instance];
  [v16 recordResultsShownWithUserInputLength:a8 count:a4 couldHaveShown:a5 topicIds:v15 serverOverride:v11 indexId:v17 requestType:a9 logType:a10];
}

- (void)logEngagementForResponseId:(id)a3 result:(id)a4 rank:(unint64_t)a5 inputLength:(unint64_t)a6 completionLength:(unint64_t)a7 requestType:(unint64_t)a8 logType:(unint64_t)a9
{
  contextEngine = self->_contextEngine;
  id v14 = a4;
  id v16 = [(ContextEngine *)contextEngine indexId];
  id v15 = +[MetricsLogging instance];
  [v15 recordQueryEngagementWithUserInputLength:a6 completionLength:a7 result:v14 rank:a5 indexId:v16 requestType:a8 logType:a9];
}

- (void)logTransactionSuccessfulForResponseId:(id)a3 inputLength:(unint64_t)a4 completionLength:(unint64_t)a5 requestType:(unint64_t)a6 logType:(unint64_t)a7
{
  id v12 = [(ContextEngine *)self->_contextEngine indexId];
  BOOL v11 = +[MetricsLogging instance];
  [v11 recordTransactionSuccessfulWithUserInputLength:a4 completionLength:a5 indexId:v12 requestType:a6 logType:a7];
}

- (void)semaphoreWithReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_processNameToScreenTimeRequestInfo, 0);
  objc_storeStrong((id *)&self->_screenTimeRequestQueue, 0);
  objc_storeStrong((id *)&self->_lastScreenTimeRequest, 0);
  objc_storeStrong((id *)&self->_recentsManager, 0);
  objc_storeStrong((id *)&self->_donationExecutorsMap, 0);
  objc_storeStrong((id *)&self->_contextEngine, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end