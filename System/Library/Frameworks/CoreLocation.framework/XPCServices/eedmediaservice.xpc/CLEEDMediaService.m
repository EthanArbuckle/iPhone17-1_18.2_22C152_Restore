@interface CLEEDMediaService
+ (BOOL)supportsSecureCoding;
+ (void)deleteFileAtPath:(id)a3;
- (BOOL)abortRequested;
- (BOOL)checkIfUploadQuotaReached:(id)a3;
- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)delayRequired;
- (BOOL)extendedSessionEnded;
- (BOOL)isExecutableAllowed:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)sessionInvalidated;
- (CLEEDMediaService)init;
- (CLEEDMediaService)initWithCoder:(id)a3;
- (NSMutableArray)mediaServiceRequestList;
- (double)getAvgSizeInRequest:(id)a3 withType:(int64_t)a4;
- (double)getMaxSizeInRequest:(id)a3 withType:(int64_t)a4;
- (double)getMinSizeInRequest:(id)a3 withType:(int64_t)a4;
- (double)getTotalSizeOfFailedUploadsInRequest:(id)a3;
- (double)getTotalSizeOfSuccessfulUploadsInRequest:(id)a3;
- (double)getUploadDataRateForMediaItem:(id)a3;
- (id)executablePathOfConnection:(id)a3;
- (id)getLocalizedStringByMediaTypeWithCount:(unint64_t)a3 forTitle:(BOOL)a4;
- (id)getMediaServiceRequestWithID:(id)a3;
- (id)getQueue;
- (id)getURLSession;
- (id)loadFromCache;
- (int64_t)totalBytesUploadedDuringCall;
- (unint64_t)countOfCompletedItemsInState:(int64_t)a3;
- (unint64_t)countOfDelayedItemsInRequest:(id)a3;
- (unint64_t)countOfItemsInRequest:(id)a3 withState:(int64_t)a4;
- (void)abortMediaUpload;
- (void)cancelBGTaskStartGuardTimer;
- (void)cancelDebounceTimerForReleasingOSTransaction;
- (void)checkAndScheduleProcessing;
- (void)checkAndStartBGTaskStartGuardTimer;
- (void)cleanup;
- (void)cleanupOnInvalidation;
- (void)clearCache;
- (void)clearStagingArea;
- (void)connectToMediaService:(id)a3 uploadConfig:(id)a4;
- (void)copyAndCreateServiceItemsForRequest:(id)a3;
- (void)copyMediaItemToStaging:(id)a3;
- (void)dealloc;
- (void)delayMediaUpload;
- (void)encodeWithCoder:(id)a3;
- (void)handleAbortForMediaServiceItem:(id)a3;
- (void)handleDelayForMediaServiceItem:(id)a3;
- (void)handleEncryptionCompletionForServiceItem:(id)a3 encryptedFileURL:(id)a4 authTag:(id)a5;
- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4;
- (void)insertMediaServiceItemInUploadList:(id)a3;
- (void)notifyProgressUITaskCompletion;
- (void)prepareForServiceTeardown;
- (void)processCompletedQueueForCachedRequest:(id)a3;
- (void)processDelayQueueForCachedRequest:(id)a3;
- (void)processMediaServicesEndOfExtendedSessionNotification;
- (void)processMediaServicesForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11;
- (void)processMediaServicesFromCache;
- (void)processMediaServicesMitigations:(id)a3;
- (void)processNextInFlightServiceItem;
- (void)processPendingQueueForCachedRequest:(id)a3;
- (void)releaseOSTransaction;
- (void)removeCompletedRequestsOtherThan:(id)a3;
- (void)restoreDelayedMediaServiceItems;
- (void)scheduleContinuousProcessingTask;
- (void)sendCompletionIndication;
- (void)setDebounceTimerForReleasingOSTransaction;
- (void)setExtendedSessionEnded:(BOOL)a3;
- (void)setMediaServiceRequestList:(id)a3;
- (void)setProgressUITaskCompletion;
- (void)setTotalBytesUploadedDuringCall:(int64_t)a3;
- (void)startContinuousProcessingTask:(id)a3;
- (void)storeDataToCache;
- (void)submitCAMetricForRequest:(id)a3;
- (void)submitCAMetricForUploadItem:(id)a3;
- (void)takeOSTransaction;
- (void)transcodeMediaItem:(id)a3;
- (void)triggerAllProcessing;
- (void)triggerUploadForServiceItem:(id)a3;
- (void)updateCallRecordForMediaServiceItem:(id)a3;
- (void)updateProgress;
@end

@implementation CLEEDMediaService

- (CLEEDMediaService)init
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v3 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v81 = "-[CLEEDMediaService init]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", buf, 0xCu);
  }
  v79.receiver = self;
  v79.super_class = (Class)CLEEDMediaService;
  v4 = [(CLEEDMediaService *)&v79 init];
  if (!v4) {
    goto LABEL_14;
  }
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mediaServiceRequestList = v4->_mediaServiceRequestList;
  v4->_mediaServiceRequestList = v5;

  v4->_extendedSessionEnded = 0;
  v4->_totalBytesUploadedDuringCall = 0;
  id v7 = +[NSString stringWithFormat:@"_CLEEDMediaService, %p", v4];
  v8 = (const char *)[v7 UTF8String];
  v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
  fQueue = v4->fQueue;
  v4->fQueue = (OS_dispatch_queue *)v10;

  id v12 = +[NSString stringWithFormat:@"_CLEEDMediaServiceEncryption, %p", v4];
  v13 = (const char *)[v12 UTF8String];
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v15 = dispatch_queue_create(v13, v14);
  fEncryptionQueue = v4->fEncryptionQueue;
  v4->fEncryptionQueue = (OS_dispatch_queue *)v15;

  id v17 = +[NSString stringWithFormat:@"_CLEEDMediaServiceSandboxCopy, %p", v4];
  v18 = (const char *)[v17 UTF8String];
  v19 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
  fCopyQueue = v4->fCopyQueue;
  v4->fCopyQueue = (OS_dispatch_queue *)v20;

  fDebounceTimer = v4->fDebounceTimer;
  v4->fDebounceTimer = 0;

  fOSTransaction = v4->fOSTransaction;
  v4->fOSTransaction = 0;

  fConnection = v4->fConnection;
  v4->fConnection = 0;

  fProgress = v4->fProgress;
  v4->fProgress = 0;

  *(_WORD *)&v4->fBGTaskSetupFailure = 0;
  fUploadServiceConfig = v4->fUploadServiceConfig;
  v4->fUploadServiceConfig = 0;

  fInFlightServiceItemsList = v4->fInFlightServiceItemsList;
  v4->fInFlightServiceItemsList = 0;

  v28 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fFilteredMediaServiceItemList = v4->fFilteredMediaServiceItemList;
  v4->fFilteredMediaServiceItemList = v28;

  v30 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fPendingServiceItemsForEncryptionList = v4->fPendingServiceItemsForEncryptionList;
  v4->fPendingServiceItemsForEncryptionList = v30;

  v32 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fPendingServiceItemsForUploadList = v4->fPendingServiceItemsForUploadList;
  v4->fPendingServiceItemsForUploadList = v32;

  v34 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fCompletedServiceItemsList = v4->fCompletedServiceItemsList;
  v4->fCompletedServiceItemsList = v34;

  v36 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fDelayedServiceItemsList = v4->fDelayedServiceItemsList;
  v4->fDelayedServiceItemsList = v36;

  fCurrentMitigation = v4->fCurrentMitigation;
  v4->fCurrentMitigation = 0;

  *(_WORD *)&v4->fLatestMitigationWasNil = 1;
  v39 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  [v39 setAllowsCellularAccess:1];
  uint64_t v40 = +[NSURLSession sessionWithConfiguration:v39];
  fURLSession = v4->fURLSession;
  v4->fURLSession = (NSURLSession *)v40;

  if (v4->fURLSession)
  {
    *(_WORD *)&v4->fFinalProgressUITitleUpdated = 0;
    v4->fProgressUICompletionStatus = 0;
    fBGTaskStartGuardTimer = v4->fBGTaskStartGuardTimer;
    v4->fBGTaskStartGuardTimer = 0;

    fProgressUITask = v4->fProgressUITask;
    v4->fProgressUITask = 0;

    v4->fBGTaskSubmitted = 0;
    double v45 = sub_100018174(v44);
    v47 = objc_msgSend(*(id *)(v46 + 824), "sharedScheduler", v45);
    v48 = v4->fQueue;
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_10000717C;
    v77[3] = &unk_100024538;
    v49 = v4;
    v78 = v49;
    LOBYTE(v48) = [v47 registerForTaskWithIdentifier:@"com.corelocation.eedmediaservice.progress" usingQueue:v48 launchHandler:v77];

    if ((v48 & 1) == 0)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      v50 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100015C3C(v50, v51, v52, v53, v54, v55, v56, v57);
      }
      v4->fBGTaskSetupFailure = 1;
    }

    double v59 = sub_100018198(v58);
    uint64_t v61 = objc_msgSend(*(id *)(v60 + 1104), "sharedInstance", v59);
    fCallCenter = v49->fCallCenter;
    v49->fCallCenter = (TUCallCenter *)v61;

    sub_1000181BC(v63);
    v65 = (CHManager *)objc_alloc_init(*(Class *)(v64 + 840));
    fCallHistoryManager = v49->fCallHistoryManager;
    v49->fCallHistoryManager = v65;

LABEL_14:
    v67 = v4;
    goto LABEL_20;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v68 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100015BC4(v68, v69, v70, v71, v72, v73, v74, v75);
  }

  v67 = 0;
LABEL_20:

  return v67;
}

- (void)dealloc
{
  [(CLEEDMediaService *)self releaseOSTransaction];
  v3.receiver = self;
  v3.super_class = (Class)CLEEDMediaService;
  [(CLEEDMediaService *)&v3 dealloc];
}

- (id)getURLSession
{
  return self->fURLSession;
}

- (id)getQueue
{
  return self->fQueue;
}

- (id)getMediaServiceRequestWithID:(id)a3
{
  id v4 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v5 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
    sub_100015CB4(v5);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_18;
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v19;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v19 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      v13 = [v12 requestID];
      if ([v13 isEqual:v4])
      {
        v14 = [v12 requestTimestamp];
        [v14 timeIntervalSinceNow];
        double v16 = fabs(v15);

        if (v16 > 14400.0) {
          continue;
        }
        v13 = v9;
        id v9 = v12;
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  }
  while (v8);
LABEL_18:

  return v9;
}

- (void)removeCompletedRequestsOtherThan:(id)a3
{
  id v3 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v4 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = [v3 requestID];
    id v7 = [v6 UUIDString];
    *(_DWORD *)buf = 136446466;
    v33 = "-[CLEEDMediaService removeCompletedRequestsOtherThan:]";
    __int16 v34 = 2082;
    id v35 = [v7 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, activeRequest:%{public}s", buf, 0x16u);
  }
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v28;
    *(void *)&long long v11 = 136446466;
    long long v25 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v14);
        double v16 = objc_msgSend(v15, "requestID", v25);
        id v17 = [v3 requestID];
        unsigned __int8 v18 = [v16 isEqual:v17];

        if ((v18 & 1) == 0 && ([v15 anyItemsToProcess] & 1) == 0)
        {
          if (([v15 metricProcessed] & 1) == 0) {
            [(CLEEDMediaService *)self submitCAMetricForRequest:v15];
          }
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          long long v19 = (void *)qword_10002A1D8;
          if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
          {
            long long v20 = v19;
            long long v21 = [v15 requestID];
            id v22 = [v21 UUIDString];
            id v23 = [v22 UTF8String];
            *(_DWORD *)buf = v25;
            v33 = "-[CLEEDMediaService removeCompletedRequestsOtherThan:]";
            __int16 v34 = 2082;
            id v35 = v23;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, removingRequest:%{public}s", buf, 0x16u);
          }
          [v8 addObject:v15];
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  v24 = [(CLEEDMediaService *)self mediaServiceRequestList];
  [v24 removeObjectsInArray:v8];
}

- (BOOL)clientConnection:(id)a3 hasEntitlement:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v7 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136446723;
    id v12 = "-[CLEEDMediaService clientConnection:hasEntitlement:]";
    __int16 v13 = 2114;
    id v14 = v5;
    __int16 v15 = 2113;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#EED2EMS,%{public}s[connection:%{public}@, entitlementString:%{private}@]", (uint8_t *)&v11, 0x20u);
  }
  id v8 = [v5 valueForEntitlement:v6];
  BOOL v9 = 0;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue]) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (id)executablePathOfConnection:(id)a3
{
  bzero(buffer, 0x1000uLL);
  if (proc_pidpath((int)[a3 processIdentifier], buffer, 0x1000u) < 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = +[NSString stringWithUTF8String:buffer];
  }
  id v5 = [v4 lastPathComponent];

  return v5;
}

- (BOOL)isExecutableAllowed:(id)a3
{
  id v4 = a3;
  id v5 = +[NSSet setWithObjects:@"locationd", 0];
  id v6 = [(CLEEDMediaService *)self executablePathOfConnection:v4];
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v7 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446979;
    int v11 = "-[CLEEDMediaService isExecutableAllowed:]";
    __int16 v12 = 2114;
    id v13 = v4;
    __int16 v14 = 2113;
    __int16 v15 = v5;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#EED2EMS,%{public}s, [connection:%{public}@, allowedExecutables:%{private}@, executable:%{public}@]", buf, 0x2Au);
  }
  unsigned __int8 v8 = [v5 containsObject:v6];

  return v8;
}

- (BOOL)sessionInvalidated
{
  return self->fSessionInvalidated;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  unsigned __int8 v8 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    fConnection = self->fConnection;
    *(_DWORD *)buf = 136446722;
    id v23 = "-[CLEEDMediaService listener:shouldAcceptNewConnection:]";
    __int16 v24 = 2114;
    id v25 = v7;
    __int16 v26 = 2114;
    long long v27 = fConnection;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, newConnection:%{public}@, currentConnection:%{public}@", buf, 0x20u);
  }
  if (qword_10002A1D0 != -1) {
    dispatch_once(&qword_10002A1D0, &stru_100024578);
  }
  if (![(CLEEDMediaService *)self clientConnection:v7 hasEntitlement:@"com.apple.private.corelocation.eedmediaservice"])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v13 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100015DF4(v13, v7);
    }
    goto LABEL_25;
  }
  if (![(CLEEDMediaService *)self isExecutableAllowed:v7])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    __int16 v14 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100015D38(v14, self, (uint64_t)v7);
    }
LABEL_25:
    [v7 invalidate];
    BOOL v12 = 0;
    goto LABEL_26;
  }
  [v7 setRemoteObjectInterface:qword_10002A1C8];
  [v7 setExportedInterface:qword_10002A1C0];
  [v7 setExportedObject:self];
  [v7 _setQueue:self->fQueue];
  objc_initWeak(&location, self);
  __int16 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  unsigned __int8 v18 = sub_100007F7C;
  long long v19 = &unk_1000245A0;
  objc_copyWeak(&v20, &location);
  [v7 setInvalidationHandler:&v16];
  objc_msgSend(v7, "setInterruptionHandler:", &stru_1000245C0, v16, v17, v18, v19);
  id v10 = self->fConnection;
  if (v10) {
    [(NSXPCConnection *)v10 invalidate];
  }
  objc_storeStrong((id *)&self->fConnection, a4);
  self->fSessionInvalidated = 0;
  [(NSXPCConnection *)self->fConnection activate];
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  int v11 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v23 = "-[CLEEDMediaService listener:shouldAcceptNewConnection:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Finished setting-up connection parameters to locationd", buf, 0xCu);
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  BOOL v12 = 1;
LABEL_26:

  return v12;
}

- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4
{
  id v6 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v7 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100015F14(v7, v6, a4);
  }
  fConnection = self->fConnection;
  if (fConnection) {
    [(NSXPCConnection *)fConnection invalidate];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v5 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
    sub_100016004((uint64_t)self, v5);
  }
  [v4 encodeObject:self->_mediaServiceRequestList forKey:@"mediaServiceRequestList"];
  [v4 encodeBool:self->_extendedSessionEnded forKey:@"extendedSessionEnded"];
  [v4 encodeInteger:self->_totalBytesUploadedDuringCall forKey:@"totalBytesUploadedDuringCall"];
}

- (CLEEDMediaService)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"mediaServiceRequestList"];
  mediaServiceRequestList = self->_mediaServiceRequestList;
  self->_mediaServiceRequestList = v7;

  self->_extendedSessionEnded = [v4 decodeBoolForKey:@"extendedSessionEnded"];
  id v9 = [v4 decodeIntegerForKey:@"totalBytesUploadedDuringCall"];

  self->_int64_t totalBytesUploadedDuringCall = (int64_t)v9;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v10 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
  {
    BOOL v12 = self->_mediaServiceRequestList;
    id v13 = v10;
    id v14 = [(NSMutableArray *)v12 count];
    __int16 v15 = "YES";
    BOOL v16 = !self->_extendedSessionEnded;
    int64_t totalBytesUploadedDuringCall = self->_totalBytesUploadedDuringCall;
    long long v19 = "-[CLEEDMediaService initWithCoder:]";
    *(_DWORD *)buf = 136446978;
    if (v16) {
      __int16 v15 = "NO";
    }
    __int16 v20 = 2050;
    id v21 = v14;
    __int16 v22 = 2082;
    id v23 = v15;
    __int16 v24 = 2050;
    int64_t v25 = totalBytesUploadedDuringCall;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s[numRequests:%{public}lu, extendedSessionEnded:%{public}s, totalBytesUploadedInCall:%{public}ld]", buf, 0x2Au);
  }
  return self;
}

- (void)takeOSTransaction
{
  [(CLEEDMediaService *)self cancelDebounceTimerForReleasingOSTransaction];
  if (!self->fOSTransaction)
  {
    id v3 = (OS_os_transaction *)os_transaction_create();
    fOSTransaction = self->fOSTransaction;
    self->fOSTransaction = v3;

    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v5 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = self->fOSTransaction;
      int v7 = 136446466;
      unsigned __int8 v8 = "-[CLEEDMediaService takeOSTransaction]";
      __int16 v9 = 2114;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Created OS transaction:%{public}@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)prepareForServiceTeardown
{
  fPendingServiceItemsForUploadList = self->fPendingServiceItemsForUploadList;
  if (fPendingServiceItemsForUploadList && [(NSMutableArray *)fPendingServiceItemsForUploadList count]
    || (fPendingServiceItemsForEncryptionList = self->fPendingServiceItemsForEncryptionList) != 0
    && [(NSMutableArray *)fPendingServiceItemsForEncryptionList count]
    || (fInFlightServiceItemsList = self->fInFlightServiceItemsList) != 0
    && [(NSMutableArray *)fInFlightServiceItemsList count]
    || (fDelayedServiceItemsList = self->fDelayedServiceItemsList) != 0
    && [(NSMutableArray *)fDelayedServiceItemsList count])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    int v7 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = self->fPendingServiceItemsForUploadList;
      __int16 v9 = v7;
      id v10 = [(NSMutableArray *)v8 count];
      id v11 = [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
      id v12 = [(NSMutableArray *)self->fInFlightServiceItemsList count];
      id v13 = [(NSMutableArray *)self->fDelayedServiceItemsList count];
      int v14 = 136447234;
      __int16 v15 = "-[CLEEDMediaService prepareForServiceTeardown]";
      __int16 v16 = 2050;
      id v17 = v10;
      __int16 v18 = 2050;
      id v19 = v11;
      __int16 v20 = 2050;
      id v21 = v12;
      __int16 v22 = 2050;
      id v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Tasks ongoing, pendingUpload:%{public}lu, pendingEncryption:%{public}lu, inFlight:%{public}lu, delayed:%{public}lu", (uint8_t *)&v14, 0x34u);
    }
  }
  else
  {
    [(CLEEDMediaService *)self notifyProgressUITaskCompletion];
    [(NSMutableArray *)self->fCompletedServiceItemsList removeAllObjects];
    self->fAbortRequestedByUser = 0;
    [(CLEEDMediaService *)self cancelBGTaskStartGuardTimer];
    [(CLEEDMediaService *)self setDebounceTimerForReleasingOSTransaction];
  }
}

- (void)setDebounceTimerForReleasingOSTransaction
{
  [(CLEEDMediaService *)self cancelDebounceTimerForReleasingOSTransaction];
  id v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->fQueue);
  fDebounceTimer = self->fDebounceTimer;
  self->fDebounceTimer = v3;

  if (self->fDebounceTimer)
  {
    dispatch_time_t v5 = dispatch_time(0, 20000000000);
    dispatch_source_set_timer((dispatch_source_t)self->fDebounceTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_initWeak(&location, self);
    id v6 = self->fDebounceTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100008968;
    handler[3] = &unk_1000245E8;
    objc_copyWeak(&v18, &location);
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    dispatch_resume((dispatch_object_t)self->fDebounceTimer);
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    int v7 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = self->fDebounceTimer;
      *(_DWORD *)buf = 136446466;
      id v21 = "-[CLEEDMediaService setDebounceTimerForReleasingOSTransaction]";
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Timer[%{public}@] activated", buf, 0x16u);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    __int16 v9 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000160F4(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    [(CLEEDMediaService *)self clearCache];
    [(CLEEDMediaService *)self sendCompletionIndication];
    [(CLEEDMediaService *)self releaseOSTransaction];
  }
}

- (void)cancelDebounceTimerForReleasingOSTransaction
{
  p_fDebounceTimer = &self->fDebounceTimer;
  if (self->fDebounceTimer)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
      sub_1000161EC();
    }
    dispatch_source_cancel((dispatch_source_t)*p_fDebounceTimer);
    dispatch_source_t v3 = (dispatch_source_t)*p_fDebounceTimer;
    *p_fDebounceTimer = 0;
  }
}

- (void)releaseOSTransaction
{
  if (self->fOSTransaction)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    dispatch_source_t v3 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      fOSTransaction = self->fOSTransaction;
      int v6 = 136446466;
      int v7 = "-[CLEEDMediaService releaseOSTransaction]";
      __int16 v8 = 2114;
      __int16 v9 = fOSTransaction;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Releasing OS transaction:%{public}@", (uint8_t *)&v6, 0x16u);
    }
    dispatch_time_t v5 = self->fOSTransaction;
    self->fOSTransaction = 0;
  }
}

- (void)sendCompletionIndication
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dispatch_source_t v3 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (([v8 metricProcessed] & 1) == 0) {
          [(CLEEDMediaService *)self submitCAMetricForRequest:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v5);
  }

  [(CLEEDMediaService *)self clearStagingArea];
  [(CLEEDMediaService *)self cleanup];
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  __int16 v9 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v18 = "-[CLEEDMediaService sendCompletionIndication]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", buf, 0xCu);
  }
  fConnection = self->fConnection;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008E4C;
  v12[3] = &unk_100024610;
  v12[4] = self;
  uint64_t v11 = [(NSXPCConnection *)fConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 notifyProcessingCompletion];
}

- (void)connectToMediaService:(id)a3 uploadConfig:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  __int16 v8 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v32 = "-[CLEEDMediaService connectToMediaService:uploadConfig:]";
    __int16 v33 = 2114;
    id v34 = v6;
    __int16 v35 = 2114;
    id v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Connection to EEDMediaService(EMS) successful, mitigation:%{public}@, uploadConfig:%{public}@", buf, 0x20u);
  }
  __int16 v9 = +[NSFileManager defaultManager];
  id v30 = 0;
  unsigned __int8 v10 = [v9 createDirectoryAtPath:@"/private/var/mobile/Library/CLEEDMediaService/" withIntermediateDirectories:1 attributes:0 error:&v30];
  id v11 = v30;
  uint64_t v12 = v11;
  if (v10)
  {
    id v29 = v11;
    long long v13 = [v9 contentsOfDirectoryAtPath:@"/private/var/mobile/Library/CLEEDMediaService/" error:&v29];
    id v14 = v29;

    if (v13)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
        sub_100016270();
      }
    }
    else
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      long long v16 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        id v18 = [@"/private/var/mobile/Library/CLEEDMediaService/" UTF8String];
        *(_DWORD *)buf = 136446723;
        v32 = "-[CLEEDMediaService connectToMediaService:uploadConfig:]";
        __int16 v33 = 2081;
        id v34 = v18;
        __int16 v35 = 2114;
        id v36 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, error retrieving contents of directory:%{private}s, Error:%{public}@", buf, 0x20u);
      }
    }
    if (v6)
    {
      id v19 = (CLEEDMitigation *)v6;
      BOOL v20 = 0;
      fCurrentMitigation = self->fCurrentMitigation;
      self->fCurrentMitigation = v19;
    }
    else
    {
      __int16 v22 = (CLEEDMitigation *)objc_alloc_init((Class)CLEEDMitigation);
      fCurrentMitigation = self->fCurrentMitigation;
      self->fCurrentMitigation = v22;
      BOOL v20 = 1;
    }

    self->fLatestMitigationWasNil = v20;
    if (v7) {
      id v23 = (CLEEDUploadServiceConfig *)v7;
    }
    else {
      id v23 = (CLEEDUploadServiceConfig *)[objc_alloc((Class)CLEEDUploadServiceConfig) initWithNumInflightUploads:2 maxUploadFileSizeMB:100 maxUploadQuotaMB:100];
    }
    fUploadServiceConfig = self->fUploadServiceConfig;
    self->fUploadServiceConfig = v23;

    int64_t v25 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[CLEEDUploadServiceConfig numInFlightUploads](self->fUploadServiceConfig, "numInFlightUploads"));
    fInFlightServiceItemsList = self->fInFlightServiceItemsList;
    self->fInFlightServiceItemsList = v25;

    long long v27 = +[NSFileManager defaultManager];
    unsigned int v28 = [v27 fileExistsAtPath:@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache"];

    if (v28)
    {
      [(CLEEDMediaService *)self takeOSTransaction];
      [(CLEEDMediaService *)self processMediaServicesFromCache];
    }
    else
    {
      [(CLEEDMediaService *)self prepareForServiceTeardown];
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    long long v15 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000162F8(v15);
    }
    id v14 = v12;
  }
}

- (void)processMediaServicesForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11
{
  id v65 = a3;
  id v64 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  os_log_t v22 = (os_log_t)a10;
  id v63 = a11;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v23 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    loga = v23;
    id v24 = [v18 base64EncodedStringWithOptions:0];
    int64_t v25 = self;
    __int16 v26 = v22;
    id v27 = v21;
    id v28 = v18;
    id v29 = [v24 UTF8String];
    id v30 = [v19 base64EncodedStringWithOptions:0];
    *(_DWORD *)buf = 136448259;
    uint64_t v75 = "-[CLEEDMediaService processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:"
          "mediaList:mitigation:completion:]";
    __int16 v76 = 2114;
    id v77 = v65;
    __int16 v78 = 2114;
    id v79 = v64;
    __int16 v80 = 2114;
    id v81 = v17;
    __int16 v82 = 2081;
    id v83 = v29;
    id v18 = v28;
    id v21 = v27;
    os_log_t v22 = v26;
    self = v25;
    __int16 v84 = 2081;
    id v85 = [v30 UTF8String];
    __int16 v86 = 2113;
    id v87 = v20;
    __int16 v88 = 2114;
    os_log_t v89 = v22;
    __int16 v90 = 2114;
    id v91 = v21;
    _os_log_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, requestID:%{public}@, callUUID:%{public}@, uploadURL:%{public}@, sharedInfoPrefix:%{private}s, combinedSecret:%{private}s, token:%{private}@, mitigation:%{public}@, mediaList:%{public}@", buf, 0x5Cu);
  }
  [(CLEEDMediaService *)self takeOSTransaction];
  if (v22)
  {
    v31 = v22;
    BOOL v32 = 0;
    fCurrentMitigation = self->fCurrentMitigation;
    self->fCurrentMitigation = v31;
  }
  else
  {
    id v34 = (CLEEDMitigation *)objc_alloc_init((Class)CLEEDMitigation);
    fCurrentMitigation = self->fCurrentMitigation;
    self->fCurrentMitigation = v34;
    BOOL v32 = 1;
  }

  self->fLatestMitigationWasNil = v32;
  if ([v21 count])
  {
    if (v18 && v19)
    {
      os_log_t log = v22;
      __int16 v35 = v21;
      uint64_t v36 = [(CLEEDMediaService *)self getMediaServiceRequestWithID:v65];
      v37 = (void *)v36;
      if (!v36)
      {
        v38 = [[CLEEDMediaServiceRequest alloc] initWithRequestID:v65 callUUID:v64 uploadURL:v17 sharedInfoPrefix:v18 combinedSecret:v19 token:v20];
        if (!v38)
        {
          id v59 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v68 = NSLocalizedDescriptionKey;
          CFStringRef v69 = @"media request object creation failure";
          uint64_t v60 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
          id v50 = [v59 initWithDomain:@"com.apple.locationd.CLEEDMediaService" code:1006 userInfo:v60];

          v49 = v63;
          (*((void (**)(id, id))v63 + 2))(v63, v50);
          [(CLEEDMediaService *)self prepareForServiceTeardown];
LABEL_32:
          id v21 = v35;
          os_log_t v22 = log;
          goto LABEL_33;
        }
        v37 = v38;
        v39 = [(CLEEDMediaService *)self mediaServiceRequestList];
        [v39 addObject:v37];
      }
      id v40 = v19;
      id v41 = v18;
      [(CLEEDMediaService *)self removeCompletedRequestsOtherThan:v37];
      v42 = (char *)[v37 filterAndAddMediaList:v35];
      if (v42)
      {
        if (v36)
        {
          objc_msgSend(v37, "setNumAdditionalMediaItemsSelected:", &v42[(void)objc_msgSend(v37, "numAdditionalMediaItemsSelected")]);
          if ([v37 metricProcessed])
          {
            [v37 setMetricProcessed:0];
            v43 = +[NSDate date];
            [v37 setRequestTimestamp:v43];
          }
        }
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        double v44 = (void *)qword_10002A1D8;
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
        {
          double v45 = v44;
          id v46 = [v35 count];
          v47 = [v37 filteredQueue];
          id v48 = [v47 count];
          *(_DWORD *)buf = 136446722;
          uint64_t v75 = "-[CLEEDMediaService processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:"
                "token:mediaList:mitigation:completion:]";
          __int16 v76 = 2050;
          id v77 = v46;
          __int16 v78 = 2050;
          id v79 = v48;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mediaListCount:%{public}lu, filteredListCount:%{public}lu", buf, 0x20u);

          id v18 = v41;
        }
        [(CLEEDMediaService *)self storeDataToCache];
        v49 = v63;
        (*((void (**)(id, void))v63 + 2))(v63, 0);
        [(CLEEDMediaService *)self checkAndScheduleProcessing];

        id v50 = 0;
      }
      else
      {
        id v56 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
        CFStringRef v67 = @"All duplicates in MediaItemList";
        uint64_t v57 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        id v50 = [v56 initWithDomain:@"com.apple.locationd.CLEEDMediaService" code:1010 userInfo:v57];

        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        double v58 = qword_10002A1D8;
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          uint64_t v75 = "-[CLEEDMediaService processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:"
                "token:mediaList:mitigation:completion:]";
          __int16 v76 = 2114;
          id v77 = v35;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, All duplicates in mediaList:%{public}@", buf, 0x16u);
        }
        v49 = v63;
        (*((void (**)(id, id))v63 + 2))(v63, v50);
        [(CLEEDMediaService *)self prepareForServiceTeardown];

        id v18 = v41;
      }
      id v19 = v40;
      goto LABEL_32;
    }
    id v55 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    CFStringRef v71 = @"missing sharedInfoPrefix/combinedSecret";
    uint64_t v52 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    uint64_t v53 = v55;
    uint64_t v54 = 1003;
  }
  else
  {
    id v51 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
    CFStringRef v73 = @"MediaList is empty, count 0";
    uint64_t v52 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    uint64_t v53 = v51;
    uint64_t v54 = 1001;
  }
  id v50 = [v53 initWithDomain:@"com.apple.locationd.CLEEDMediaService" code:v54 userInfo:v52];

  v49 = v63;
  (*((void (**)(id, id))v63 + 2))(v63, v50);
  [(CLEEDMediaService *)self prepareForServiceTeardown];
LABEL_33:
}

- (void)processMediaServicesMitigations:(id)a3
{
  id v4 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v5 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136446466;
    uint64_t v12 = "-[CLEEDMediaService processMediaServicesMitigations:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mitigation:%{public}@", (uint8_t *)&v11, 0x16u);
  }
  id v6 = self->fCurrentMitigation;
  if (v4)
  {
    id v7 = (CLEEDMitigation *)v4;
    BOOL v8 = 0;
  }
  else
  {
    id v7 = (CLEEDMitigation *)objc_alloc_init((Class)CLEEDMitigation);
    BOOL v8 = 1;
  }
  fCurrentMitigation = self->fCurrentMitigation;
  self->fCurrentMitigation = v7;

  self->fLatestMitigationWasNil = v8;
  id v10 = [(CLEEDMitigation *)self->fCurrentMitigation uploadMigitation];
  if (v10)
  {
    if (v10 == (id)1)
    {
      if (!v6 || ![(CLEEDMitigation *)v6 uploadMigitation]) {
        [(CLEEDMediaService *)self delayMediaUpload];
      }
    }
    else if (v10 == (id)2 && (!v6 || [(CLEEDMitigation *)v6 uploadMigitation] != (id)2))
    {
      [(CLEEDMediaService *)self abortMediaUpload];
    }
  }
  else if (v6 && [(CLEEDMitigation *)v6 uploadMigitation] == (id)1)
  {
    [(CLEEDMediaService *)self restoreDelayedMediaServiceItems];
    [(CLEEDMediaService *)self checkAndScheduleProcessing];
  }
}

- (void)processMediaServicesEndOfExtendedSessionNotification
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  dispatch_source_t v3 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446210;
    id v6 = "-[CLEEDMediaService processMediaServicesEndOfExtendedSessionNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", (uint8_t *)&v5, 0xCu);
  }
  fCurrentMitigation = self->fCurrentMitigation;
  self->fCurrentMitigation = 0;

  self->fLatestMitigationWasNil = 1;
  [(CLEEDMediaService *)self setTotalBytesUploadedDuringCall:0];
  [(CLEEDMediaService *)self restoreDelayedMediaServiceItems];
  [(CLEEDMediaService *)self checkAndScheduleProcessing];
}

- (void)updateCallRecordForMediaServiceItem:(id)a3
{
  id v4 = a3;
  int v5 = [v4 mediaItem];
  id v6 = [v5 uploadStatus];

  if (v6 == (id)5)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009D70;
    block[3] = &unk_1000245E8;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v7 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100016398(v7, v4);
    }
  }
}

- (void)checkAndScheduleProcessing
{
  if (self->fCleanupProgressUITask) {
    [(CLEEDMediaService *)self setProgressUITaskCompletion];
  }
  if (self->fBGTaskSetupFailure) {
    goto LABEL_4;
  }
  if (self->fBGTaskSubmitted)
  {
    if (self->fProgressUITask)
    {
LABEL_4:
      [(CLEEDMediaService *)self triggerAllProcessing];
      return;
    }
    [(CLEEDMediaService *)self checkAndStartBGTaskStartGuardTimer];
  }
  else
  {
    [(CLEEDMediaService *)self scheduleContinuousProcessingTask];
  }
}

- (void)triggerAllProcessing
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  dispatch_source_t v3 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    int v5 = [(CLEEDMediaService *)self mediaServiceRequestList];
    *(_DWORD *)buf = 136446466;
    v39 = "-[CLEEDMediaService triggerAllProcessing]";
    __int16 v40 = 2050;
    id v41 = [v5 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, numRequests:%{public}lu", buf, 0x16u);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v6 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v12 = [v11 filteredQueue];
        id v13 = [v12 count];

        if (v13)
        {
          [(CLEEDMediaService *)self copyAndCreateServiceItemsForRequest:v11];
          [(CLEEDMediaService *)self storeDataToCache];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v14 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    fFilteredMediaServiceItemList = self->fFilteredMediaServiceItemList;
    long long v16 = v14;
    id v17 = [(NSMutableArray *)fFilteredMediaServiceItemList count];
    *(_DWORD *)buf = 136446466;
    v39 = "-[CLEEDMediaService triggerAllProcessing]";
    __int16 v40 = 2050;
    id v41 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, numMediaServiceItems:%{public}lu", buf, 0x16u);
  }
  if ([(NSMutableArray *)self->fFilteredMediaServiceItemList count])
  {
    [(NSMutableArray *)self->fFilteredMediaServiceItemList sortUsingSelector:"compareMediaSize:"];
    [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList addObjectsFromArray:self->fFilteredMediaServiceItemList];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obj = self->fFilteredMediaServiceItemList;
    id v18 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(obj);
          }
          os_log_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
          id v23 = +[NSDate date];
          [v22 setTimestampEncryptionStart:v23];

          objc_initWeak((id *)buf, self);
          fEncryptionQueue = self->fEncryptionQueue;
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10000A604;
          block[3] = &unk_1000245E8;
          objc_copyWeak(&v27, (id *)buf);
          void block[4] = v22;
          dispatch_async(fEncryptionQueue, block);
          objc_destroyWeak(&v27);
          objc_destroyWeak((id *)buf);
        }
        id v19 = [(NSMutableArray *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v19);
    }

    [(NSMutableArray *)self->fFilteredMediaServiceItemList removeAllObjects];
  }
  [(CLEEDMediaService *)self processNextInFlightServiceItem];
}

- (void)copyAndCreateServiceItemsForRequest:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!v4) {
    goto LABEL_42;
  }
  uint64_t v6 = [v4 filteredQueue];
  if (!v6) {
    goto LABEL_42;
  }
  id v7 = (void *)v6;
  id v8 = [v5 filteredQueue];
  id v9 = [v8 count];

  if (v9)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v10 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      uint64_t v12 = [v5 filteredQueue];
      id v13 = [v12 count];
      id v14 = [v5 filteredQueue];
      *(_DWORD *)buf = 136446979;
      NSErrorUserInfoKey v68 = "-[CLEEDMediaService copyAndCreateServiceItemsForRequest:]";
      __int16 v69 = 2050;
      id v70 = v13;
      __int16 v71 = 2113;
      id v72 = v14;
      __int16 v73 = 2113;
      uint64_t v74 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mediaListCount:%{public}lu, mediaList:%{private}@, mediaRequest:%{private}@", buf, 0x2Au);
    }
    id v16 = objc_alloc((Class)NSArray);
    id v17 = [v5 filteredQueue];
    id v18 = [v17 allObjects];
    id v19 = [v16 initWithArray:v18];

    id v20 = [v19 count];
    fCopyQueue = self->fCopyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AE2C;
    block[3] = &unk_100024638;
    id v64 = v19;
    id v65 = self;
    id v22 = v19;
    dispatch_apply((size_t)v20, fCopyQueue, block);

    id v58 = objc_alloc_init((Class)NSMutableArray);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v23 = [v5 filteredQueue];
    id v24 = [v23 countByEnumeratingWithState:&v59 objects:v66 count:16];
    p_class_meths = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
    if (v24)
    {
      id v27 = v24;
      uint64_t v28 = *(void *)v60;
      *(void *)&long long v25 = 136446467;
      long long v55 = v25;
      do
      {
        long long v29 = 0;
        do
        {
          if (*(void *)v60 != v28) {
            objc_enumerationMutation(v23);
          }
          long long v30 = *(void **)(*((void *)&v59 + 1) + 8 * (void)v29);
          if (objc_msgSend(v30, "uploadStatus", v55) == (id)1) {
            [(CLEEDMediaService *)self transcodeMediaItem:v30];
          }
          long long v31 = [[CLEEDMediaServiceItem alloc] initWithMediaItem:v30 mediaRequest:v5 mediaService:self];
          if (!v31)
          {
            if (qword_10002A1E0 != -1) {
              dispatch_once(&qword_10002A1E0, &stru_100024738);
            }
            long long v33 = p_class_meths[59];
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              uint64_t v36 = v33;
              id v56 = [v30 URL];
              v37 = [v56 path];
              *(_DWORD *)buf = v55;
              NSErrorUserInfoKey v68 = "-[CLEEDMediaService copyAndCreateServiceItemsForRequest:]";
              __int16 v69 = 2113;
              id v70 = v37;
              _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, mediaServiceItem creation failed for file:%{private}@", buf, 0x16u);

              p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
            }
            [v30 setUploadStatus:8];
            goto LABEL_30;
          }
          if ([v30 uploadStatus] != (id)1)
          {
            if (qword_10002A1E0 != -1) {
              dispatch_once(&qword_10002A1E0, &stru_100024738);
            }
            long long v34 = p_class_meths[59];
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              v38 = v34;
              uint64_t v57 = [v30 URL];
              v39 = [v57 path];
              *(_DWORD *)buf = v55;
              NSErrorUserInfoKey v68 = "-[CLEEDMediaService copyAndCreateServiceItemsForRequest:]";
              __int16 v69 = 2113;
              id v70 = v39;
              _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Could not copy file to staging area:%{private}@", buf, 0x16u);

              p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
            }
            [(NSMutableArray *)self->fCompletedServiceItemsList addObject:v31];
LABEL_30:
            [(CLEEDMediaService *)self submitCAMetricForUploadItem:v30];
            long long v32 = [v5 completedQueue];
            goto LABEL_31;
          }
          if ([(CLEEDMediaService *)self delayRequired])
          {
            [(NSMutableArray *)self->fDelayedServiceItemsList addObject:v31];
            [v5 delayQueue];
          }
          else
          {
            [v58 addObject:v31];
            [v5 pendingQueue];
          long long v32 = };
LABEL_31:
          long long v35 = v32;
          [v32 addObject:v30];

          long long v29 = (char *)v29 + 1;
        }
        while (v27 != v29);
        id v40 = [v23 countByEnumeratingWithState:&v59 objects:v66 count:16];
        id v27 = v40;
      }
      while (v40);
    }

    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v41 = p_class_meths[59];
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = v41;
      id v43 = [v58 count];
      double v44 = [v5 filteredQueue];
      id v45 = [v44 count];
      *(_DWORD *)buf = 136446722;
      NSErrorUserInfoKey v68 = "-[CLEEDMediaService copyAndCreateServiceItemsForRequest:]";
      __int16 v69 = 2050;
      id v70 = v43;
      __int16 v71 = 2050;
      id v72 = v45;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, FilteredServiceItemsCount:%{public}lu, mediaListCount:%{public}lu", buf, 0x20u);
    }
    id v46 = [v5 filteredQueue];
    [v46 removeAllObjects];

    if ([v58 count]) {
      [(NSMutableArray *)self->fFilteredMediaServiceItemList addObjectsFromArray:v58];
    }
  }
  else
  {
LABEL_42:
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v47 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_10001648C(v47, v48, v49, v50, v51, v52, v53, v54);
    }
  }
}

- (void)copyMediaItemToStaging:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 URL];

    if (v6)
    {
      if ([(CLEEDMediaService *)self abortRequested])
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
          sub_1000165F4();
        }
        [v5 setUploadStatus:7];
        goto LABEL_39;
      }
      id v15 = [v5 sandboxExtension];
      [v15 UTF8String];
      uint64_t v16 = sandbox_extension_consume();

      if ((v16 & 0x8000000000000000) == 0)
      {
        uint64_t v36 = 0;
        v37 = &v36;
        uint64_t v38 = 0x2020000000;
        char v39 = 0;
        objc_initWeak(&location, self);
        id v17 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
        id v18 = [v5 URL];
        id v34 = 0;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000B540;
        v29[3] = &unk_100024660;
        objc_copyWeak(v33, &location);
        id v19 = v5;
        id v30 = v19;
        long long v31 = self;
        long long v32 = &v36;
        v33[1] = (id)v16;
        [v17 coordinateReadingItemAtURL:v18 options:1 error:&v34 byAccessor:v29];
        id v20 = v34;

        if (v20 || !*((unsigned char *)v37 + 24))
        {
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          id v21 = (id)qword_10002A1D8;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = [v19 URL];
            id v26 = [v28 path];
            id v27 = [v26 UTF8String];
            *(_DWORD *)buf = 136446723;
            id v41 = "-[CLEEDMediaService copyMediaItemToStaging:]";
            __int16 v42 = 2114;
            id v43 = v20;
            __int16 v44 = 2081;
            id v45 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, coordinateReadingItemAtURL failed with error:%{public}@, url:%{private}s", buf, 0x20u);
          }
          if ([v19 uploadStatus] != (id)7) {
            [v19 setUploadStatus:2];
          }
          if (sandbox_extension_release())
          {
            if (qword_10002A1E0 != -1) {
              dispatch_once(&qword_10002A1E0, &stru_100024738);
            }
            id v22 = (id)qword_10002A1D8;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              id v23 = __error();
              id v24 = strerror(*v23);
              sub_100016714((uint64_t)v24, (uint64_t)buf, v22);
            }
          }
        }

        objc_destroyWeak(v33);
        objc_destroyWeak(&location);
        _Block_object_dispose(&v36, 8);

        goto LABEL_39;
      }
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      long long v25 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_10001666C(v25);
      }
    }
    else
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_10001657C();
      }
    }
    [v5 setUploadStatus:2];
    goto LABEL_39;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v7 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100016504(v7, v8, v9, v10, v11, v12, v13, v14);
  }
LABEL_39:
}

- (void)transcodeMediaItem:(id)a3
{
  id v3 = a3;
  if ([v3 type] != (id)2)
  {
    uint64_t v74 = +[NSDate date];
    id v4 = [v3 stagingURL];
    int v5 = [v4 path];
    uint64_t v6 = +[NSURL fileURLWithPath:v5];

    id v7 = [v6 URLByDeletingPathExtension];
    id v8 = [v7 path];
    uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s.jpeg", [v8 UTF8String]);
    CFURLRef v76 = +[NSURL fileURLWithPath:v9];

    __int16 v73 = v6;
    uint64_t v11 = sub_100017C3C((const __CFURL *)v6, 0, v10);
    double v13 = sub_100018228(v12);
    uint64_t v16 = objc_msgSend(*(id *)(v14 + 1120), "typeWithIdentifier:", sub_100017C68(v15, v13));
    size_t v18 = sub_100017C94(v11, v17);
    CFDictionaryRef v20 = sub_100017CC0(v11, v18, 0, v19);
    double v22 = sub_10001824C(v21);
    long long v25 = objc_msgSend(v24, "objectForKeyedSubscript:", **(void **)(v23 + 1200), v22);
    uint64_t v26 = (uint64_t)[v25 integerValue];

    double v28 = sub_100018270(v27);
    id v30 = -[__CFDictionary objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", **(void **)(v29 + 1192), v28);
    uint64_t v31 = (uint64_t)[v30 integerValue];

    uint64_t v32 = v31 * v26;
    double v34 = sub_100018294(v33);
    uint64_t v36 = **(void ***)(v35 + 1136);
    if (objc_msgSend(v16, "conformsToType:", v36, v34) && v32 <= 8294400)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v38 = v75;
      CFURLRef v37 = v76;
      char v39 = v73;
      id v40 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v41 = v40;
        __int16 v42 = [v3 stagingURL];
        [v42 lastPathComponent];
        id v43 = v16;
        id v44 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136446467;
        __int16 v80 = "-[CLEEDMediaService transcodeMediaItem:]";
        __int16 v81 = 2081;
        id v82 = [v44 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Jpeg image within threshold, skipping transcoding for %{private}s", buf, 0x16u);

        uint64_t v16 = v43;
      }
      id v45 = v74;
      if (v11) {
        CFRelease(v11);
      }
LABEL_36:

      goto LABEL_37;
    }
    id v72 = v16;
    if (v32 > 8294400)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      v47 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v48 = v47;
        __int16 v71 = [v3 stagingURL];
        id v49 = [v71 lastPathComponent];
        *(_DWORD *)buf = 136446467;
        __int16 v80 = "-[CLEEDMediaService transcodeMediaItem:]";
        __int16 v81 = 2081;
        id v82 = [v49 UTF8String];
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Resizing %{private}s", buf, 0x16u);
      }
      double v50 = 2880.0 / sqrt((double)v32);
      if (v26 <= v31) {
        uint64_t v51 = v31;
      }
      else {
        uint64_t v51 = v26;
      }
      double v52 = sub_1000182B8(v50 * (double)v51);
      uint64_t v77 = **(void **)(v53 + 1184);
      uint64_t v54 = +[NSNumber numberWithInteger:v52];
      __int16 v78 = v54;
      CFDictionaryRef v46 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];

      uint64_t v16 = v72;
    }
    else
    {
      CFDictionaryRef v46 = 0;
    }
    long long v55 = [v36 identifier];
    CFURLRef v37 = v76;
    uint64_t v57 = sub_100017CEC(v76, v55, 1uLL, 0, v56);

    sub_100017D18(v57, v11, v18, v46, v58);
    if (sub_100017D44(v57, v59))
    {
      char v39 = v73;
      long long v60 = [v73 path];
      long long v61 = [(__CFURL *)v76 path];
      unsigned __int8 v62 = [v60 isEqualToString:v61];

      if ((v62 & 1) == 0)
      {
        [v3 setStagingURL:v76];
        id v63 = [v73 path];
        +[CLEEDMediaService deleteFileAtPath:v63];
      }
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v16 = v72;
      id v64 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v65 = v64;
        NSErrorUserInfoKey v66 = [v3 stagingURL];
        id v67 = [v66 lastPathComponent];
        id v68 = [v67 UTF8String];
        *(_DWORD *)buf = 136446467;
        __int16 v80 = "-[CLEEDMediaService transcodeMediaItem:]";
        __int16 v81 = 2081;
        id v82 = v68;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Transcoding successful for %{private}s", buf, 0x16u);

        uint64_t v16 = v72;
        if (!v11) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }
    else
    {
      char v39 = v73;
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      CFURLRef v37 = v76;
      __int16 v69 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR))
      {
        sub_100016B94(v69);
        if (!v11) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
    }
    if (!v11)
    {
LABEL_33:
      if (v57) {
        CFRelease(v57);
      }
      id v45 = v74;
      [v74 timeIntervalSinceNow];
      [v3 setDurationTranscodeMs:(uint64_t)(fabs(v70) * 1000.0)];

      uint64_t v38 = v75;
      goto LABEL_36;
    }
LABEL_32:
    CFRelease(v11);
    goto LABEL_33;
  }
LABEL_37:
}

- (void)insertMediaServiceItemInUploadList:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->fPendingServiceItemsForUploadList, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, [(NSMutableArray *)self->fPendingServiceItemsForUploadList count], 1024, &stru_1000246A0);
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  uint64_t v6 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
  {
    id v7 = v6;
    id v8 = [v4 mediaItem];
    uint64_t v9 = [v8 mediaItemID];
    id v10 = [v9 UUIDString];
    id v11 = [v10 UTF8String];
    double v12 = [v4 mediaItem];
    id v13 = [v12 mediaItemSizeBytes];
    id v14 = [(NSMutableArray *)self->fPendingServiceItemsForUploadList count];
    int v15 = 136447235;
    uint64_t v16 = "-[CLEEDMediaService insertMediaServiceItemInUploadList:]";
    __int16 v17 = 2081;
    id v18 = v11;
    __int16 v19 = 2050;
    id v20 = v13;
    __int16 v21 = 2050;
    id v22 = v5;
    __int16 v23 = 2050;
    id v24 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, mediaID:%{private}s, size:%{public}lu, indexToInsert:%{public}lu, count:%{public}lu", (uint8_t *)&v15, 0x34u);
  }
  [(NSMutableArray *)self->fPendingServiceItemsForUploadList insertObject:v4 atIndex:v5];
}

- (void)handleEncryptionCompletionForServiceItem:(id)a3 encryptedFileURL:(id)a4 authTag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  fQueue = self->fQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C5C4;
  v15[3] = &unk_1000244C0;
  objc_copyWeak(&v20, &location);
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  __int16 v19 = self;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(fQueue, v15);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (void)processNextInFlightServiceItem
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v3 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    if ([(CLEEDMediaService *)self abortRequested]) {
      id v5 = "YES";
    }
    else {
      id v5 = "NO";
    }
    id v6 = [(NSMutableArray *)self->fInFlightServiceItemsList count];
    id v7 = [(NSMutableArray *)self->fPendingServiceItemsForUploadList count];
    id v8 = [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
    id v9 = [(NSMutableArray *)self->fDelayedServiceItemsList count];
    id v10 = [(NSMutableArray *)self->fCompletedServiceItemsList count];
    uint64_t v11 = [(CLEEDMediaService *)self totalBytesUploadedDuringCall];
    *(_DWORD *)buf = 136448002;
    char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
    __int16 v40 = 2082;
    id v41 = (void *)v5;
    __int16 v42 = 2050;
    id v43 = v6;
    __int16 v44 = 2050;
    id v45 = v7;
    __int16 v46 = 2050;
    id v47 = v8;
    __int16 v48 = 2050;
    id v49 = v9;
    __int16 v50 = 2050;
    id v51 = v10;
    __int16 v52 = 2050;
    double v53 = (double)v11 * 0.000000953674316;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Abort?:%{public}s, numInFlight:%{public}lu, numPendingUpload:%{public}lu, numPendingEncrypt:%{public}lu, numDelayed:%{public}lu, numCompleted:%{public}lu, totalBytesUploadedInCall:%{public}.2lf MB", buf, 0x52u);
  }
  if (self->fAbortRequestedByUser)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v12 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Abort Requested by user, returning", buf, 0xCu);
    }
    return;
  }
  fCurrentMitigation = self->fCurrentMitigation;
  if (fCurrentMitigation && [(CLEEDMitigation *)fCurrentMitigation uploadMigitation] == (id)2)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v14 = qword_10002A1D8;
    if (!os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    int v15 = self->fCurrentMitigation;
    *(_DWORD *)buf = 136446466;
    char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
    __int16 v40 = 2114;
    id v41 = v15;
    id v16 = "#EED2EMS,%{public}s, Abort due to upload Mitigations:%{public}@, returning";
LABEL_24:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);
LABEL_25:
    [(CLEEDMediaService *)self notifyProgressUITaskCompletion];
    return;
  }
  if ([(CLEEDMediaService *)self delayRequired])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v14 = qword_10002A1D8;
    if (!os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    id v17 = self->fCurrentMitigation;
    *(_DWORD *)buf = 136446466;
    char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
    __int16 v40 = 2114;
    id v41 = v17;
    id v16 = "#EED2EMS,%{public}s, Delay due to upload Mitigations:%{public}@, returning";
    goto LABEL_24;
  }
  id v18 = [(NSMutableArray *)self->fInFlightServiceItemsList count];
  if (v18 >= [(CLEEDUploadServiceConfig *)self->fUploadServiceConfig numInFlightUploads]) {
    return;
  }
  if ([(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count]
    || [(NSMutableArray *)self->fPendingServiceItemsForUploadList count])
  {
    __int16 v19 = [(NSMutableArray *)self->fPendingServiceItemsForUploadList firstObject];
    if (v19)
    {
      if ([(CLEEDMediaService *)self checkIfUploadQuotaReached:v19])
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v20 = self->fPendingServiceItemsForUploadList;
        id v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v34;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(void *)v34 != v23) {
                objc_enumerationMutation(v20);
              }
              [(CLEEDMediaService *)self handleDelayForMediaServiceItem:*(void *)(*((void *)&v33 + 1) + 8 * i)];
            }
            id v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v33 objects:v37 count:16];
          }
          while (v22);
        }

        [(NSMutableArray *)self->fPendingServiceItemsForUploadList removeAllObjects];
        long long v25 = sub_100002090();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, uploadQuotaExceeded, All Uploads delayed", buf, 0xCu);
        }

        fQueue = self->fQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D0EC;
        block[3] = &unk_1000246C8;
        void block[4] = self;
        dispatch_async(fQueue, block);
      }
      else
      {
        [(NSMutableArray *)self->fInFlightServiceItemsList addObject:v19];
        [(NSMutableArray *)self->fPendingServiceItemsForUploadList removeObject:v19];
        [(CLEEDMediaService *)self triggerUploadForServiceItem:v19];
      }
      goto LABEL_50;
    }
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v27 = qword_10002A1D8;
    if (!os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    *(_DWORD *)buf = 136446210;
    char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
    double v28 = "#EED2EMS,%{public}s, waiting for items to complete encryption.";
    uint64_t v29 = v27;
    goto LABEL_49;
  }
  id v30 = [(NSMutableArray *)self->fInFlightServiceItemsList count];
  __int16 v19 = sub_100002090();
  BOOL v31 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (!v31)
    {
LABEL_50:

      return;
    }
    *(_DWORD *)buf = 136446210;
    char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
    double v28 = "#EED2EMS,%{public}s, waiting for in-flight items to complete upload.";
    uint64_t v29 = v19;
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
    goto LABEL_50;
  }
  if (v31)
  {
    *(_DWORD *)buf = 136446210;
    char v39 = "-[CLEEDMediaService processNextInFlightServiceItem]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Input list is empty, preparing for service teardown.", buf, 0xCu);
  }

  [(CLEEDMediaService *)self notifyProgressUITaskCompletion];
  [(CLEEDMediaService *)self prepareForServiceTeardown];
}

- (BOOL)checkIfUploadQuotaReached:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->fLatestMitigationWasNil)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v5 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
        sub_100016D34(v5);
      }
      goto LABEL_21;
    }
    int64_t v8 = [(CLEEDMediaService *)self totalBytesUploadedDuringCall];
    id v9 = [v4 mediaItem];
    double v10 = (double)((unint64_t)[v9 mediaItemSizeBytes] + v8);
    double v11 = (double)(uint64_t)[(CLEEDUploadServiceConfig *)self->fUploadServiceConfig maxUploadQuotaMB]
        * 1048576.0;

    if (v11 < v10)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v12 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        double v14 = (double)[(CLEEDMediaService *)self totalBytesUploadedDuringCall]
            * 0.000000953674316;
        int v15 = [v4 mediaItem];
        int v22 = 136446722;
        uint64_t v23 = "-[CLEEDMediaService checkIfUploadQuotaReached:]";
        __int16 v24 = 2050;
        double v25 = v14;
        __int16 v26 = 2050;
        double v27 = (double)(unint64_t)[v15 mediaItemSizeBytes] * 0.000000953674316;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, totalBytesUploadedInCall:%{public}.2lf MB, mediaServiceItemSize:%{public}.2lf MB", (uint8_t *)&v22, 0x20u);
      }
      BOOL v7 = 1;
      goto LABEL_22;
    }
    id v16 = [v4 mediaItem];
    -[CLEEDMediaService setTotalBytesUploadedDuringCall:](self, "setTotalBytesUploadedDuringCall:", (char *)[v16 mediaItemSizeBytes]+ -[CLEEDMediaService totalBytesUploadedDuringCall](self, "totalBytesUploadedDuringCall"));

    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v17 = (void *)qword_10002A1D8;
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v17;
      double v19 = (double)[(CLEEDMediaService *)self totalBytesUploadedDuringCall]
          * 0.000000953674316;
      id v20 = [v4 mediaItem];
      int v22 = 136446722;
      uint64_t v23 = "-[CLEEDMediaService checkIfUploadQuotaReached:]";
      __int16 v24 = 2050;
      double v25 = v19;
      __int16 v26 = 2050;
      double v27 = (double)(unint64_t)[v20 mediaItemSizeBytes] * 0.000000953674316;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, totalBytesUploadedInCall:%{public}.2lf MB, mediaServiceItemSize:%{public}.2lf MB", (uint8_t *)&v22, 0x20u);

      goto LABEL_21;
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v6 = qword_10002A1D8;
    BOOL v7 = 0;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 136446210;
      uint64_t v23 = "-[CLEEDMediaService checkIfUploadQuotaReached:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mediaServiceItem is nil", (uint8_t *)&v22, 0xCu);
LABEL_21:
      BOOL v7 = 0;
    }
  }
LABEL_22:

  return v7;
}

- (void)triggerUploadForServiceItem:(id)a3
{
  id v4 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v5 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    BOOL v7 = [v4 mediaItem];
    int64_t v8 = [v7 mediaItemID];
    id v9 = [v8 UUIDString];
    *(_DWORD *)buf = 136446467;
    int v15 = "-[CLEEDMediaService triggerUploadForServiceItem:]";
    __int16 v16 = 2081;
    id v17 = [v9 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mediaID:%{private}s", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v4);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D694;
  v10[3] = &unk_1000246F0;
  objc_copyWeak(&v11, (id *)buf);
  objc_copyWeak(&v12, &location);
  [v4 processMediaItemWithCompletion:v10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (unint64_t)countOfCompletedItemsInState:(int64_t)a3
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->fCompletedServiceItemsList;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        double v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "mediaItem", (void)v14);
        id v11 = [v10 uploadStatus];

        if (v11 == (id)a3) {
          ++v7;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v12 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    double v19 = "-[CLEEDMediaService countOfCompletedItemsInState:]";
    __int16 v20 = 2050;
    int64_t v21 = a3;
    __int16 v22 = 2050;
    unint64_t v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, state:%{public}ld, count:%{public}lu", buf, 0x20u);
  }
  return v7;
}

- (id)getLocalizedStringByMediaTypeWithCount:(unint64_t)a3 forTitle:(BOOL)a4
{
  BOOL v4 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    int v9 = 0;
    int v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v9 |= [v13 hasPendingVideos];
        v10 |= [v13 hasPendingPhotos];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);

    if (v10 & v9)
    {
      long long v14 = +[NSBundle mainBundle];
      if (v4) {
        CFStringRef v15 = @"%lu Items";
      }
      else {
        CFStringRef v15 = @"%lu items";
      }
      goto LABEL_20;
    }
    if (v10)
    {
      long long v14 = +[NSBundle mainBundle];
      if (v4) {
        CFStringRef v15 = @"%lu Photos";
      }
      else {
        CFStringRef v15 = @"%lu photos";
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  long long v14 = +[NSBundle mainBundle];
  if (v4) {
    CFStringRef v15 = @"%lu Videos";
  }
  else {
    CFStringRef v15 = @"%lu videos";
  }
LABEL_20:
  long long v16 = [v14 localizedStringForKey:v15 value:&stru_100024E98 table:0];
  long long v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, a3);

  return v17;
}

- (void)updateProgress
{
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v3 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v4 = [v3 countByEnumeratingWithState:&v43 objects:v58 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v44;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v44 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = [*(id *)(*((void *)&v43 + 1) + 8 * i) filteredQueue];
        v6 += (uint64_t)[v9 count];
      }
      id v5 = [v3 countByEnumeratingWithState:&v43 objects:v58 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v10 = self->fInFlightServiceItemsList;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v39 objects:v57 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v40;
    double v14 = 0.0;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v40 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v39 + 1) + 8 * (void)j) uploadProgressFraction];
        double v14 = v14 + v16;
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v39 objects:v57 count:16];
    }
    while (v12);
  }
  else
  {
    double v14 = 0.0;
  }

  long long v17 = (char *)[(NSMutableArray *)self->fPendingServiceItemsForUploadList count];
  id v18 = [(NSMutableArray *)self->fCompletedServiceItemsList count];
  unint64_t v19 = (unint64_t)[(NSMutableArray *)self->fDelayedServiceItemsList count];
  id v20 = [(NSMutableArray *)self->fInFlightServiceItemsList count];
  long long v21 = &v17[v6
           + (void)v18
           + v19
           + (unint64_t)[(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count]
           + (void)v20];
  double v22 = v14 + (double)[(CLEEDMediaService *)self countOfCompletedItemsInState:5];
  uint64_t v23 = 100 * (void)v21;
  fProgress = self->fProgress;
  if (fProgress)
  {
    [(NSProgress *)fProgress setTotalUnitCount:100 * (void)v21];
  }
  else
  {
    double v25 = +[NSProgress progressWithTotalUnitCount:100 * (void)v21];
    __int16 v26 = self->fProgress;
    self->fProgress = v25;
  }
  [(NSProgress *)self->fProgress setCompletedUnitCount:(uint64_t)(v22 * 100.0)];
  double v27 = +[NSString stringWithFormat:@"%0.2lf of %lu Files", *(void *)&v22, v21, (void)v39];
  [(NSProgress *)self->fProgress setLocalizedAdditionalDescription:v27];
  double v28 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v21 forTitle:1];
  uint64_t v29 = +[NSBundle mainBundle];
  id v30 = [v29 localizedStringForKey:@"To Emergency Services." value:&stru_100024E98 table:0];
  BOOL v31 = +[NSString localizedStringWithFormat:v30];

  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  uint64_t v32 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = v28;
    long long v34 = v32;
    id v35 = [v33 UTF8String];
    id v36 = [v31 UTF8String];
    CFURLRef v37 = self->fProgress;
    *(_DWORD *)buf = 136447234;
    __int16 v48 = "-[CLEEDMediaService updateProgress]";
    __int16 v49 = 2082;
    id v50 = v35;
    __int16 v51 = 2082;
    id v52 = v36;
    __int16 v53 = 2114;
    uint64_t v54 = v27;
    __int16 v55 = 2114;
    double v56 = v37;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Title:%{public}s, Reason:%{public}s, Description:%{public}@, progress:%{public}@", buf, 0x34u);
  }
  fProgressUITask = self->fProgressUITask;
  if (fProgressUITask && !self->fAbortRequestedByUser && !self->fFinalProgressUITitleUpdated)
  {
    if (self->fProgress && v23 != (uint64_t)(v22 * 100.0))
    {
      [(NSProgress *)self->fProgress setUserInfoObject:0 forKey:@"HideProgressCircleInUI"];
      [(_BGContinuedProcessingTask *)self->fProgressUITask updateProgress:self->fProgress];
      fProgressUITask = self->fProgressUITask;
    }
    [(_BGContinuedProcessingTask *)fProgressUITask updateTitle:v28 withReason:v31];
  }
}

- (void)scheduleContinuousProcessingTask
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v4 = [v3 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v37;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = [*(id *)(*((void *)&v36 + 1) + 8 * i) filteredQueue];
        v6 += (uint64_t)[v9 count];
      }
      id v5 = [v3 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  int v10 = (char *)[(NSMutableArray *)self->fFilteredMediaServiceItemList count] + v6;
  id v11 = [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
  id v12 = &v10[(unint64_t)[(NSMutableArray *)self->fPendingServiceItemsForUploadList count] + (void)v11];
  id v13 = [(NSMutableArray *)self->fDelayedServiceItemsList count];
  double v14 = (char *)[(NSMutableArray *)self->fInFlightServiceItemsList count] + (void)v13;
  CFStringRef v15 = &v12[(unint64_t)[(NSMutableArray *)self->fCompletedServiceItemsList count] + (void)v14];
  if (v15)
  {
    sub_1000182DC(v16);
    id v18 = [objc_alloc(*(Class *)(v17 + 1128)) initWithIdentifier:@"com.corelocation.eedmediaservice.progress" iconBundleIdentifier:@"com.apple.graphic-icon.emergency-sos"];
    unint64_t v19 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v15 forTitle:1];
    [v18 setTitle:v19];

    id v20 = +[NSBundle mainBundle];
    long long v21 = [v20 localizedStringForKey:@"Preparing to send..." value:&stru_100024E98 table:0];
    double v22 = +[NSString localizedStringWithFormat:v21];
    [v18 setReason:v22];

    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v23 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      double v25 = v23;
      __int16 v26 = [v18 title];
      double v27 = [v18 reason];
      *(_DWORD *)buf = 136446978;
      long long v41 = "-[CLEEDMediaService scheduleContinuousProcessingTask]";
      __int16 v42 = 2114;
      id v43 = v18;
      __int16 v44 = 2114;
      long long v45 = v26;
      __int16 v46 = 2114;
      id v47 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, ContinuedProcessingTaskRequest:%{public}@, Title:%{public}@, Reason:%{public}@", buf, 0x2Au);
    }
    double v28 = sub_100018174(v24);
    id v30 = objc_msgSend(*(id *)(v29 + 824), "sharedScheduler", v28);
    id v35 = 0;
    unsigned __int8 v31 = [v30 submitTaskRequest:v18 error:&v35];
    id v32 = v35;

    if (v31)
    {
      self->fBGTaskSubmitted = 1;
      [(CLEEDMediaService *)self checkAndStartBGTaskStartGuardTimer];
    }
    else
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      long long v34 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100016DB8(v34);
      }
      self->fBGTaskSetupFailure = 1;
      [(CLEEDMediaService *)self triggerAllProcessing];
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v33 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      long long v41 = "-[CLEEDMediaService scheduleContinuousProcessingTask]";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Total Count is 0. Nothing to process, early return.", buf, 0xCu);
    }
    [(CLEEDMediaService *)self triggerAllProcessing];
  }
}

- (void)startContinuousProcessingTask:(id)a3
{
  id v5 = a3;
  if (self->fBGTaskSetupFailure)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v6 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100016E5C(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    [v5 setTaskCompletedWithSuccess:0];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    double v14 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v20 = "-[CLEEDMediaService startContinuousProcessingTask:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", buf, 0xCu);
    }
    [(CLEEDMediaService *)self cancelBGTaskStartGuardTimer];
    objc_initWeak((id *)buf, v5);
    objc_initWeak(&location, self);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E8DC;
    v15[3] = &unk_1000246F0;
    objc_copyWeak(&v16, &location);
    objc_copyWeak(&v17, (id *)buf);
    [v5 setExpirationHandler:v15];
    objc_storeStrong((id *)&self->fProgressUITask, a3);
    [(CLEEDMediaService *)self triggerAllProcessing];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
}

- (void)checkAndStartBGTaskStartGuardTimer
{
  if (self->fBGTaskStartGuardTimer)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v3 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      fBGTaskStartGuardTimer = self->fBGTaskStartGuardTimer;
      *(_DWORD *)buf = 136446466;
      uint64_t v23 = "-[CLEEDMediaService checkAndStartBGTaskStartGuardTimer]";
      __int16 v24 = 2114;
      double v25 = fBGTaskStartGuardTimer;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Timer[%{public}@] already active.", buf, 0x16u);
    }
  }
  else
  {
    id v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->fQueue);
    uint64_t v6 = self->fBGTaskStartGuardTimer;
    self->fBGTaskStartGuardTimer = v5;

    if (self->fBGTaskStartGuardTimer)
    {
      dispatch_time_t v7 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer((dispatch_source_t)self->fBGTaskStartGuardTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      objc_initWeak(&location, self);
      uint64_t v8 = self->fBGTaskStartGuardTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000ECEC;
      handler[3] = &unk_1000245E8;
      objc_copyWeak(&v20, &location);
      handler[4] = self;
      dispatch_source_set_event_handler(v8, handler);
      dispatch_resume((dispatch_object_t)self->fBGTaskStartGuardTimer);
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v9 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = self->fBGTaskStartGuardTimer;
        *(_DWORD *)buf = 136446466;
        uint64_t v23 = "-[CLEEDMediaService checkAndStartBGTaskStartGuardTimer]";
        __int16 v24 = 2114;
        double v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Timer[%{public}@] activated", buf, 0x16u);
      }
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v11 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100016ED4(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

- (void)cancelBGTaskStartGuardTimer
{
  if (self->fBGTaskStartGuardTimer)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v3 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      fBGTaskStartGuardTimer = self->fBGTaskStartGuardTimer;
      int v6 = 136446466;
      dispatch_time_t v7 = "-[CLEEDMediaService cancelBGTaskStartGuardTimer]";
      __int16 v8 = 2114;
      uint64_t v9 = fBGTaskStartGuardTimer;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, cancelling timer[%{public}@]", (uint8_t *)&v6, 0x16u);
    }
    dispatch_source_cancel((dispatch_source_t)self->fBGTaskStartGuardTimer);
    id v5 = self->fBGTaskStartGuardTimer;
    self->fBGTaskStartGuardTimer = 0;
  }
}

- (void)notifyProgressUITaskCompletion
{
  if (self->fProgressUITask && !self->fCleanupProgressUITask)
  {
    unint64_t v3 = [(CLEEDMediaService *)self countOfCompletedItemsInState:5];
    uint64_t v4 = (uint64_t)[(NSMutableArray *)self->fDelayedServiceItemsList count];
    uint64_t v5 = (uint64_t)[(NSMutableArray *)self->fCompletedServiceItemsList count] + v4;
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    int v6 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v7 = "YES";
      fProgressUITask = self->fProgressUITask;
      fProgress = self->fProgress;
      if (!self->fAbortRequestedByUser) {
        dispatch_time_t v7 = "NO";
      }
      *(_DWORD *)buf = 136447746;
      long long v45 = "-[CLEEDMediaService notifyProgressUITaskCompletion]";
      __int16 v46 = 2050;
      unint64_t v47 = v3;
      __int16 v48 = 2050;
      uint64_t v49 = v4;
      __int16 v50 = 2050;
      uint64_t v51 = v5;
      __int16 v52 = 2082;
      __int16 v53 = v7;
      __int16 v54 = 2114;
      __int16 v55 = fProgressUITask;
      __int16 v56 = 2114;
      uint64_t v57 = fProgress;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, completedCount:%{public}ld, delayCount:%{public}ld, totalCount:%{public}ld, userAbort:%{public}s, ProgressUITask:%{public}@, Progress:%{public}@", buf, 0x48u);
    }
    if (self->fAbortRequestedByUser)
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
LABEL_24:
      objc_initWeak((id *)buf, self);
      dispatch_time_t v30 = dispatch_time(0, 3000000000);
      fQueue = self->fQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F684;
      block[3] = &unk_1000245A0;
      objc_copyWeak(&v43, (id *)buf);
      dispatch_after(v30, fQueue, block);
      self->fCleanupProgressUITask = 1;
      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);

      return;
    }
    if (v4 < 1)
    {
      if (v5 < 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = 0;
        self->fProgressUICompletionStatus = 1;
        goto LABEL_24;
      }
      unint64_t v24 = v5 - v3;
      if (v5 == v3)
      {
        double v25 = +[NSBundle mainBundle];
        __int16 v26 = [v25 localizedStringForKey:@"%s Sent" value:&stru_100024E98 table:0];
        id v27 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v3 forTitle:1];
        uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, [v27 UTF8String]);

        double v28 = +[NSBundle mainBundle];
        uint64_t v29 = [v28 localizedStringForKey:@"Upload Completed." value:&stru_100024E98 table:0];
        uint64_t v11 = +[NSString localizedStringWithFormat:v29];

        self->fProgressUICompletionStatus = 1;
      }
      else
      {
        id v32 = +[NSBundle mainBundle];
        id v33 = v32;
        if (v3)
        {
          long long v34 = [v32 localizedStringForKey:@"Only %s Sent" value:&stru_100024E98 table:0];
          id v35 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v3 forTitle:1];
          uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v34, [v35 UTF8String]);

          long long v36 = +[NSBundle mainBundle];
          long long v37 = [v36 localizedStringForKey:@"Could not send %s." value:&stru_100024E98 table:0];
          id v38 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v24 forTitle:0];
          uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v37, [v38 UTF8String]);
        }
        else
        {
          long long v39 = [v32 localizedStringForKey:@"No Items Sent" value:&stru_100024E98 table:0];
          uint64_t v10 = +[NSString localizedStringWithFormat:v39];

          long long v36 = +[NSBundle mainBundle];
          long long v40 = [v36 localizedStringForKey:@"Could not send %s." value:&stru_100024E98 table:0];
          id v41 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v5 forTitle:0];
          uint64_t v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v40, [v41 UTF8String]);
        }
      }
    }
    else
    {
      uint64_t v12 = +[NSBundle mainBundle];
      uint64_t v13 = [v12 localizedStringForKey:@"%s Paused" value:&stru_100024E98 table:0];
      id v14 = [(CLEEDMediaService *)self getLocalizedStringByMediaTypeWithCount:v4 forTitle:1];
      uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, [v14 UTF8String]);

      uint64_t v15 = +[NSBundle mainBundle];
      uint64_t v16 = [v15 localizedStringForKey:@"iPhone will try to send after the call." value:&stru_100024E98 table:0];
      uint64_t v11 = +[NSString localizedStringWithFormat:v16];
    }
    if (v10 && v11)
    {
      self->fFinalProgressUITitleUpdated = 1;
      id v17 = [objc_alloc((Class)NSNumber) initWithBool:1];
      [(NSProgress *)self->fProgress setUserInfoObject:v17 forKey:@"HideProgressCircleInUI"];
      [(_BGContinuedProcessingTask *)self->fProgressUITask updateProgress:self->fProgress];
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v18 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v10;
        id v20 = v18;
        id v21 = [v19 UTF8String];
        id v22 = [v11 UTF8String];
        uint64_t v23 = self->fProgress;
        *(_DWORD *)buf = 136446978;
        long long v45 = "-[CLEEDMediaService notifyProgressUITaskCompletion]";
        __int16 v46 = 2082;
        unint64_t v47 = (unint64_t)v21;
        __int16 v48 = 2082;
        uint64_t v49 = (uint64_t)v22;
        __int16 v50 = 2114;
        uint64_t v51 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Title:%{public}s, Reason:%{public}s, Progress:%{public}@", buf, 0x2Au);
      }
      [(_BGContinuedProcessingTask *)self->fProgressUITask updateTitle:v10 withReason:v11];
    }
    goto LABEL_24;
  }
}

- (void)setProgressUITaskCompletion
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  unint64_t v3 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    fProgressUITask = self->fProgressUITask;
    uint64_t v5 = "YES";
    if (self->fProgressUICompletionStatus) {
      int v6 = "YES";
    }
    else {
      int v6 = "NO";
    }
    if (!self->fCleanupProgressUITask) {
      uint64_t v5 = "NO";
    }
    int v9 = 136446978;
    uint64_t v10 = "-[CLEEDMediaService setProgressUITaskCompletion]";
    __int16 v11 = 2114;
    uint64_t v12 = fProgressUITask;
    __int16 v13 = 2082;
    id v14 = v6;
    __int16 v15 = 2082;
    uint64_t v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Task:%{public}@, TaskStatus:%{public}s, CleanupProgressUITask:%{public}s", (uint8_t *)&v9, 0x2Au);
  }
  if (self->fCleanupProgressUITask)
  {
    [(_BGContinuedProcessingTask *)self->fProgressUITask setTaskCompletedWithSuccess:self->fProgressUICompletionStatus];
    dispatch_time_t v7 = self->fProgressUITask;
    self->fProgressUITask = 0;

    self->fBGTaskSubmitted = 0;
    fProgress = self->fProgress;
    self->fProgress = 0;

    *(_WORD *)&self->fFinalProgressUITitleUpdated = 0;
    self->fProgressUICompletionStatus = 0;
  }
}

- (BOOL)abortRequested
{
  BOOL result = 1;
  if (!self->fAbortRequestedByUser)
  {
    fCurrentMitigation = self->fCurrentMitigation;
    if (!fCurrentMitigation || [(CLEEDMitigation *)fCurrentMitigation uploadMigitation] != (id)2) {
      return 0;
    }
  }
  return result;
}

- (BOOL)delayRequired
{
  fCurrentMitigation = self->fCurrentMitigation;
  if (!fCurrentMitigation
    || (id v3 = [(CLEEDMitigation *)fCurrentMitigation uploadMigitation], v3 != (id)1))
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)abortMediaUpload
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v3 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    fPendingServiceItemsForUploadList = self->fPendingServiceItemsForUploadList;
    uint64_t v5 = v3;
    int v6 = (char *)[(NSMutableArray *)fPendingServiceItemsForUploadList count];
    dispatch_time_t v7 = &v6[(void)[(NSMutableArray *)self->fFilteredMediaServiceItemList count]];
    id v8 = [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
    int v9 = &v7[(unint64_t)[(NSMutableArray *)self->fInFlightServiceItemsList count] + (void)v8];
    uint64_t v10 = (char *)[(NSMutableArray *)self->fDelayedServiceItemsList count];
    *(_DWORD *)buf = 136446466;
    __int16 v71 = "-[CLEEDMediaService abortMediaUpload]";
    __int16 v72 = 2050;
    __int16 v73 = &v10[(void)v9];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Aborting pending media uploads:%{public}lu", buf, 0x16u);
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  __int16 v11 = self->fInFlightServiceItemsList;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v62;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v62 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v17 = [v16 urlUploadTask];

        if (v17)
        {
          uint64_t v18 = [v16 urlUploadTask];
          [v18 cancel];
        }
        [v16 cancelDelayTimer];
        [(CLEEDMediaService *)self handleAbortForMediaServiceItem:v16];
      }
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }
    while (v13);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v19 = self->fPendingServiceItemsForUploadList;
  id v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v58;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v58 != v22) {
          objc_enumerationMutation(v19);
        }
        [(CLEEDMediaService *)self handleAbortForMediaServiceItem:*(void *)(*((void *)&v57 + 1) + 8 * (void)j)];
      }
      id v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v21);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  unint64_t v24 = self->fPendingServiceItemsForEncryptionList;
  id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v53 objects:v67 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v54;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(void *)v54 != v27) {
          objc_enumerationMutation(v24);
        }
        [(CLEEDMediaService *)self handleAbortForMediaServiceItem:*(void *)(*((void *)&v53 + 1) + 8 * (void)k)];
      }
      id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v53 objects:v67 count:16];
    }
    while (v26);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v29 = self->fDelayedServiceItemsList;
  id v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v49 objects:v66 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v50;
    do
    {
      for (m = 0; m != v31; m = (char *)m + 1)
      {
        if (*(void *)v50 != v32) {
          objc_enumerationMutation(v29);
        }
        [(CLEEDMediaService *)self handleAbortForMediaServiceItem:*(void *)(*((void *)&v49 + 1) + 8 * (void)m)];
      }
      id v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v49 objects:v66 count:16];
    }
    while (v31);
  }

  [(NSMutableArray *)self->fInFlightServiceItemsList removeAllObjects];
  [(NSMutableArray *)self->fPendingServiceItemsForUploadList removeAllObjects];
  [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList removeAllObjects];
  [(NSMutableArray *)self->fDelayedServiceItemsList removeAllObjects];
  [(NSMutableArray *)self->fFilteredMediaServiceItemList removeAllObjects];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v34 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v35 = [v34 countByEnumeratingWithState:&v45 objects:v65 count:16];
  if (v35)
  {
    id v36 = v35;
    uint64_t v37 = *(void *)v46;
    do
    {
      for (n = 0; n != v36; n = (char *)n + 1)
      {
        if (*(void *)v46 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = *(void **)(*((void *)&v45 + 1) + 8 * (void)n);
        if (([v39 metricProcessed] & 1) == 0) {
          [(CLEEDMediaService *)self submitCAMetricForRequest:v39];
        }
        long long v40 = [v39 filteredQueue];
        [v40 removeAllObjects];

        id v41 = [v39 pendingQueue];
        [v41 removeAllObjects];

        __int16 v42 = [v39 delayQueue];
        [v42 removeAllObjects];

        id v43 = [v39 completedQueue];
        [v43 removeAllObjects];
      }
      id v36 = [v34 countByEnumeratingWithState:&v45 objects:v65 count:16];
    }
    while (v36);
  }

  __int16 v44 = [(CLEEDMediaService *)self mediaServiceRequestList];
  [v44 removeAllObjects];

  [(CLEEDMediaService *)self clearCache];
  [(CLEEDMediaService *)self prepareForServiceTeardown];
}

- (void)delayMediaUpload
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v3 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    fPendingServiceItemsForUploadList = self->fPendingServiceItemsForUploadList;
    uint64_t v5 = v3;
    int v6 = (char *)[(NSMutableArray *)fPendingServiceItemsForUploadList count];
    dispatch_time_t v7 = &v6[(void)[(NSMutableArray *)self->fFilteredMediaServiceItemList count]];
    id v8 = (char *)[(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
    unint64_t v9 = (unint64_t)[(NSMutableArray *)self->fInFlightServiceItemsList count];
    *(_DWORD *)buf = 136446466;
    long long v54 = "-[CLEEDMediaService delayMediaUpload]";
    __int16 v55 = 2050;
    long long v56 = &v8[v9 + (void)v7];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Delaying pending media uploads:%{public}lu", buf, 0x16u);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v10 = self->fInFlightServiceItemsList;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v46;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v46 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v16 = [v15 urlUploadTask];

        if (v16)
        {
          id v17 = [v15 urlUploadTask];
          [v17 cancel];
        }
        [v15 cancelDelayTimer];
        [(CLEEDMediaService *)self handleDelayForMediaServiceItem:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v12);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v18 = self->fFilteredMediaServiceItemList;
  id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v42;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v42 != v21) {
          objc_enumerationMutation(v18);
        }
        [(CLEEDMediaService *)self handleDelayForMediaServiceItem:*(void *)(*((void *)&v41 + 1) + 8 * (void)j)];
      }
      id v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v20);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v23 = self->fPendingServiceItemsForUploadList;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (k = 0; k != v25; k = (char *)k + 1)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v23);
        }
        [(CLEEDMediaService *)self handleDelayForMediaServiceItem:*(void *)(*((void *)&v37 + 1) + 8 * (void)k)];
      }
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v25);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  double v28 = self->fPendingServiceItemsForEncryptionList;
  id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v33 objects:v49 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (m = 0; m != v30; m = (char *)m + 1)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(v28);
        }
        -[CLEEDMediaService handleDelayForMediaServiceItem:](self, "handleDelayForMediaServiceItem:", *(void *)(*((void *)&v33 + 1) + 8 * (void)m), (void)v33);
      }
      id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v33 objects:v49 count:16];
    }
    while (v30);
  }

  [(CLEEDMediaService *)self storeDataToCache];
  [(NSMutableArray *)self->fInFlightServiceItemsList removeAllObjects];
  [(NSMutableArray *)self->fFilteredMediaServiceItemList removeAllObjects];
  [(NSMutableArray *)self->fPendingServiceItemsForUploadList removeAllObjects];
  [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList removeAllObjects];
  [(CLEEDMediaService *)self notifyProgressUITaskCompletion];
}

- (void)restoreDelayedMediaServiceItems
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v2 = self->fDelayedServiceItemsList;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v28;
    *(void *)&long long v4 = 136446466;
    long long v25 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v8, "mediaRequest", v25);
        uint64_t v10 = [v9 delayQueue];
        id v11 = [v8 mediaItem];
        id v12 = [v10 member:v11];

        if (v12)
        {
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          uint64_t v13 = (void *)qword_10002A1D8;
          if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = v13;
            __int16 v15 = [v8 mediaItem];
            *(_DWORD *)buf = v25;
            uint64_t v32 = "-[CLEEDMediaService restoreDelayedMediaServiceItems]";
            __int16 v33 = 2114;
            long long v34 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, MediaServiceItem:%{public}@", buf, 0x16u);
          }
          uint64_t v16 = [v8 mediaItem];
          id v17 = [v16 uploadStatus];

          if (v17 == (id)1)
          {
            [(NSMutableArray *)self->fFilteredMediaServiceItemList addObject:v8];
          }
          else
          {
            if (v17 != (id)3) {
              continue;
            }
            [(CLEEDMediaService *)self insertMediaServiceItemInUploadList:v8];
          }
          uint64_t v21 = [v8 mediaRequest];
          uint64_t v22 = [v21 pendingQueue];
          uint64_t v23 = [v8 mediaItem];
          [v22 addObject:v23];

          id v19 = [v8 mediaRequest];
          id v20 = [v19 delayQueue];
          id v24 = [v8 mediaItem];
          [v20 removeObject:v24];

          goto LABEL_20;
        }
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        uint64_t v18 = (void *)qword_10002A1D8;
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR))
        {
          id v19 = v18;
          id v20 = [v8 mediaItem];
          *(_DWORD *)buf = v25;
          uint64_t v32 = "-[CLEEDMediaService restoreDelayedMediaServiceItems]";
          __int16 v33 = 2114;
          long long v34 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, media item not part of delay queue:%{public}@", buf, 0x16u);
LABEL_20:

          continue;
        }
      }
      id v5 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->fDelayedServiceItemsList removeAllObjects];
  [(CLEEDMediaService *)self storeDataToCache];
}

- (void)cleanupOnInvalidation
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = self->fInFlightServiceItemsList;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        unint64_t v9 = objc_msgSend(v8, "urlUploadTask", (void)v19);

        if (v9)
        {
          uint64_t v10 = [v8 urlUploadTask];
          [v10 cancel];
        }
        [v8 cancelDelayTimer];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v5);
  }

  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v11 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    fInFlightServiceItemsList = self->fInFlightServiceItemsList;
    uint64_t v13 = v11;
    if ([(NSMutableArray *)fInFlightServiceItemsList count]) {
      uint64_t v14 = "YES";
    }
    else {
      uint64_t v14 = "NO";
    }
    __int16 v15 = (char *)[(NSMutableArray *)self->fPendingServiceItemsForUploadList count];
    uint64_t v16 = &v15[(void)[(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count]];
    id v17 = (char *)[(NSMutableArray *)self->fFilteredMediaServiceItemList count];
    unint64_t v18 = (unint64_t)[(NSMutableArray *)self->fInFlightServiceItemsList count];
    *(_DWORD *)buf = 136446722;
    id v24 = "-[CLEEDMediaService cleanupOnInvalidation]";
    __int16 v25 = 2082;
    uint64_t v26 = v14;
    __int16 v27 = 2050;
    long long v28 = &v17[v18 + (void)v16];
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, AnyInFlightMediaServiceItem?:%{public}s, pendingCount(incl. in-flight item):%{public}lu", buf, 0x20u);
  }
  [(CLEEDMediaService *)self notifyProgressUITaskCompletion];
  [(CLEEDMediaService *)self cleanup];
  [(CLEEDMediaService *)self releaseOSTransaction];
}

- (void)handleAbortForMediaServiceItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mediaItem];
  [v5 setUploadStatus:7];

  uint64_t v6 = [v4 mediaRequest];

  if (v6)
  {
    dispatch_time_t v7 = [v4 mediaRequest];
    [v7 setDidUserCancelUpload:1];
  }
  id v8 = [v4 mediaItem];
  [(CLEEDMediaService *)self submitCAMetricForUploadItem:v8];

  unint64_t v9 = [v4 mediaRequest];
  uint64_t v10 = [v9 pendingQueue];
  id v11 = [v4 mediaItem];
  id v12 = [v10 member:v11];

  if (v12)
  {
    [(NSMutableArray *)self->fCompletedServiceItemsList addObject:v4];
    uint64_t v13 = [v4 mediaItem];
    uint64_t v14 = [v13 stagingURL];
    __int16 v15 = [v14 path];
    +[CLEEDMediaService deleteFileAtPath:v15];

    uint64_t v16 = [v4 mediaItem];
    id v17 = [v16 encryptedFileURL];
    unint64_t v18 = [v17 path];
    +[CLEEDMediaService deleteFileAtPath:v18];
  }
  long long v19 = [v4 mediaRequest];
  long long v20 = [v4 mediaItem];
  id v21 = [v19 updateQueueForProcessedMediaItem:v20];

  if (!v21)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    long long v22 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
      sub_100016FCC(v22);
    }
  }
}

- (void)handleDelayForMediaServiceItem:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mediaRequest];
  uint64_t v6 = [v5 delayQueue];
  dispatch_time_t v7 = [v4 mediaItem];
  id v8 = [v6 member:v7];

  if (!v8)
  {
    unint64_t v9 = [v4 mediaRequest];
    uint64_t v10 = [v9 pendingQueue];
    id v11 = [v4 mediaItem];
    id v12 = [v10 member:v11];

    if (v12)
    {
      [(NSMutableArray *)self->fDelayedServiceItemsList addObject:v4];
      if ([(CLEEDMediaService *)self delayRequired])
      {
        uint64_t v13 = [v4 mediaItem];
        [v13 setDidApplyDelayMitigation:1];
      }
    }
    uint64_t v14 = [v4 mediaRequest];
    __int16 v15 = [v4 mediaItem];
    id v16 = [v14 updateQueueForDelayedMediaItem:v15];

    if (!v16)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v17 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
        sub_100017080(v17);
      }
    }
  }
}

- (void)clearStagingArea
{
  v2 = +[NSFileManager defaultManager];
  id v19 = 0;
  id v3 = [v2 contentsOfDirectoryAtPath:@"/private/var/mobile/Library/CLEEDMediaService/" error:&v19];
  id v4 = v19;

  if (v4)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v5 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100017134(v5);
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v6 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v7 = v6;
      id v8 = [v3 count];
      *(_DWORD *)buf = 136446466;
      long long v22 = "-[CLEEDMediaService clearStagingArea]";
      __int16 v23 = 2050;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Num files in staging area:%{public}lu", buf, 0x16u);
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v3;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(@"/private/var/mobile/Library/CLEEDMediaService/", "stringByAppendingString:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v13), (void)v15);
          +[CLEEDMediaService deleteFileAtPath:v14];

          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)cleanup
{
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v3 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    long long v22 = "-[CLEEDMediaService cleanup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", buf, 0xCu);
  }
  fCurrentMitigation = self->fCurrentMitigation;
  self->fCurrentMitigation = 0;

  self->fLatestMitigationWasNil = 1;
  [(CLEEDMediaService *)self setTotalBytesUploadedDuringCall:0];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(CLEEDMediaService *)self mediaServiceRequestList];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v10 filteredQueue];
        [v11 removeAllObjects];

        uint64_t v12 = [v10 delayQueue];
        [v12 removeAllObjects];

        uint64_t v13 = [v10 pendingQueue];
        [v13 removeAllObjects];

        uint64_t v14 = [v10 completedQueue];
        [v14 removeAllObjects];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  long long v15 = [(CLEEDMediaService *)self mediaServiceRequestList];
  [v15 removeAllObjects];

  [(NSMutableArray *)self->fDelayedServiceItemsList removeAllObjects];
  [(NSMutableArray *)self->fFilteredMediaServiceItemList removeAllObjects];
  [(NSMutableArray *)self->fPendingServiceItemsForUploadList removeAllObjects];
  [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList removeAllObjects];
  [(NSMutableArray *)self->fCompletedServiceItemsList removeAllObjects];
  [(NSMutableArray *)self->fInFlightServiceItemsList removeAllObjects];
}

+ (void)deleteFileAtPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [v4 fileExistsAtPath:v3];

    if (v5)
    {
      id v6 = +[NSFileManager defaultManager];
      id v9 = 0;
      [v6 removeItemAtPath:v3 error:&v9];
      id v7 = v9;

      if (v7)
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
          sub_1000172F8();
        }
      }
      else
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
          sub_100017274();
        }
      }
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v8 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000171D4(v8);
    }
  }
}

- (void)processMediaServicesFromCache
{
  p_class_meths = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v4 = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
  unsigned int v5 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v67 = "-[CLEEDMediaService processMediaServicesFromCache]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", buf, 0xCu);
  }
  id v6 = [(CLEEDMediaService *)self loadFromCache];
  id v7 = v6;
  if (!v6 || ![v6 count])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    long long v50 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      id v67 = "-[CLEEDMediaService processMediaServicesFromCache]";
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s,No data available to restore from cache", buf, 0xCu);
    }
    goto LABEL_65;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v8 = v7;
  id v61 = [v8 countByEnumeratingWithState:&v62 objects:v78 count:16];
  if (!v61)
  {

    goto LABEL_64;
  }
  long long v52 = v7;
  long long v56 = self;
  char v53 = 0;
  uint64_t v9 = *(void *)v63;
  id v10 = v8;
  id v60 = v8;
  do
  {
    id v11 = 0;
    do
    {
      if (*(void *)v63 != v9) {
        objc_enumerationMutation(v10);
      }
      uint64_t v12 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v11);
      uint64_t v13 = [v12 requestID];
      if (!v13) {
        goto LABEL_36;
      }
      uint64_t v14 = (void *)v13;
      uint64_t v15 = [v12 uploadURL];
      if (!v15) {
        goto LABEL_35;
      }
      long long v16 = (void *)v15;
      uint64_t v17 = v9;
      uint64_t v18 = [v12 sharedInfoPrefix];
      if (!v18) {
        goto LABEL_34;
      }
      long long v19 = (void *)v18;
      long long v20 = [v12 combinedSecret];
      if (!v20) {
        goto LABEL_33;
      }
      id v21 = [v12 deviceKeyConfirmation];
      if (!v21) {
        goto LABEL_32;
      }
      long long v22 = [v12 token];
      if (!v22) {
        goto LABEL_31;
      }
      __int16 v23 = [v12 requestTimestamp];
      if (!v23) {
        goto LABEL_30;
      }
      uint64_t v24 = [v12 callUUID];
      if (!v24)
      {

LABEL_30:
LABEL_31:

        p_class_meths = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
LABEL_32:

        id v4 = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
LABEL_33:

        id v10 = v60;
LABEL_34:

        uint64_t v9 = v17;
LABEL_35:

LABEL_36:
        if (p_class_meths[60] != (__objc2_meth_list *)-1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        uint64_t v31 = v4[59];
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446467;
          id v67 = "-[CLEEDMediaService processMediaServicesFromCache]";
          __int16 v68 = 2113;
          id v69 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Invalid request data in request:%{private}@, skipping request.", buf, 0x16u);
        }
        goto LABEL_40;
      }
      long long v58 = (void *)v24;
      __int16 v25 = [v12 pendingQueue];
      if (v25) {
        goto LABEL_23;
      }
      uint64_t v26 = [v12 completedQueue];
      if (v26)
      {

        __int16 v25 = 0;
LABEL_23:

        p_class_meths = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
        id v4 = &OBJC_PROTOCOL___NSURLSessionDelegate.class_meths;
        id v10 = v60;
        uint64_t v9 = v17;
        goto LABEL_24;
      }
      os_log_t loga = [v12 filteredQueue];

      p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
      id v4 = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
      id v10 = v60;
      uint64_t v9 = v17;
      if (!loga) {
        goto LABEL_36;
      }
LABEL_24:
      __int16 v27 = [v12 requestTimestamp];
      [v27 timeIntervalSinceNow];
      double v29 = fabs(v28);

      if (v29 > 14400.0)
      {
        if (p_class_meths[60] != (__objc2_meth_list *)-1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        long long v30 = v4[59];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446723;
          id v67 = "-[CLEEDMediaService processMediaServicesFromCache]";
          __int16 v68 = 2113;
          id v69 = v12;
          __int16 v70 = 2049;
          uint64_t v71 = 14400;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Validity expired for request:%{private}@, allowedValiditySecs:%{private}lu, skipping request.", buf, 0x20u);
        }
        goto LABEL_40;
      }
      if ([v12 anyItemsToProcess])
      {
        uint64_t v32 = [v12 delayQueue];
        if (![v32 count]) {
          goto LABEL_46;
        }
        unsigned __int8 v33 = [(CLEEDMediaService *)v56 delayRequired];

        if ((v33 & 1) == 0)
        {
          long long v34 = [v12 pendingQueue];
          long long v35 = [v12 delayQueue];
          [v34 unionSet:v35];

          uint64_t v32 = [v12 delayQueue];
          [v32 removeAllObjects];
LABEL_46:
        }
        [(CLEEDMediaService *)v56 processCompletedQueueForCachedRequest:v12];
        [(CLEEDMediaService *)v56 processPendingQueueForCachedRequest:v12];
        [(CLEEDMediaService *)v56 processDelayQueueForCachedRequest:v12];
        long long v36 = [v12 requestID];
        long long v37 = [(CLEEDMediaService *)v56 getMediaServiceRequestWithID:v36];

        if (!v37)
        {
          long long v38 = [(CLEEDMediaService *)v56 mediaServiceRequestList];
          [v38 addObject:v12];
        }
        char v53 = 1;
        p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
        id v10 = v60;
        goto LABEL_40;
      }
      if (p_class_meths[60] != (__objc2_meth_list *)-1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      long long v39 = v4[59];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        os_log_t log = v39;
        long long v59 = [v12 requestID];
        id v57 = [v59 UUIDString];
        id v40 = [v57 UTF8String];
        long long v41 = [v12 filteredQueue];
        id v42 = [v41 count];
        long long v43 = [v12 pendingQueue];
        id v44 = [v43 count];
        long long v45 = [v12 delayQueue];
        id v46 = [v45 count];
        long long v47 = [v12 completedQueue];
        id v48 = [v47 count];
        *(_DWORD *)buf = 136447491;
        id v67 = "-[CLEEDMediaService processMediaServicesFromCache]";
        __int16 v68 = 2081;
        id v69 = v40;
        id v4 = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
        __int16 v70 = 2050;
        uint64_t v71 = (uint64_t)v42;
        uint64_t v9 = v17;
        __int16 v72 = 2050;
        id v73 = v44;
        __int16 v74 = 2050;
        id v75 = v46;
        p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 32);
        __int16 v76 = 2050;
        id v77 = v48;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Nothing to process for cachedRequestID:%{private}s, filteredCount:%{public}lu, pendingCount:%{public}lu, delayCount:%{public}lu, completedCount:%{public}lu", buf, 0x3Eu);

        id v10 = v60;
      }
LABEL_40:
      id v11 = (char *)v11 + 1;
    }
    while (v61 != v11);
    id v49 = [v10 countByEnumeratingWithState:&v62 objects:v78 count:16];
    id v61 = v49;
  }
  while (v49);

  self = v56;
  id v7 = v52;
  if ((v53 & 1) == 0)
  {
LABEL_64:
    fCurrentMitigation = self->fCurrentMitigation;
    self->fCurrentMitigation = 0;

    self->fLatestMitigationWasNil = 1;
LABEL_65:
    [(CLEEDMediaService *)self prepareForServiceTeardown];
    goto LABEL_66;
  }
  [(CLEEDMediaService *)v56 checkAndScheduleProcessing];
LABEL_66:
}

- (void)processCompletedQueueForCachedRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 completedQueue];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 completedQueue];
    id v8 = [v7 count];

    if (v8)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v9 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = [v4 completedQueue];
        id v12 = [v11 count];
        uint64_t v13 = [v4 completedQueue];
        *(_DWORD *)buf = 136446723;
        long long v35 = "-[CLEEDMediaService processCompletedQueueForCachedRequest:]";
        __int16 v36 = 2049;
        id v37 = v12;
        __int16 v38 = 2113;
        long long v39 = v13;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, completedQueueCount:%{private}lu, completedQueue:%{private}@", buf, 0x20u);
      }
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = [v4 completedQueue];
      id v14 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v28 = *(void *)v30;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v30 != v28) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v18 = [[CLEEDMediaServiceItem alloc] initWithMediaItem:v17 mediaRequest:v4 mediaService:self];
            if (v18) {
              [(NSMutableArray *)self->fCompletedServiceItemsList addObject:v18];
            }
            long long v19 = [v17 stagingURL];
            long long v20 = [v19 path];
            +[CLEEDMediaService deleteFileAtPath:v20];

            id v21 = [v17 encryptedFileURL];
            long long v22 = [v21 path];
            +[CLEEDMediaService deleteFileAtPath:v22];
          }
          id v15 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v15);
      }

      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      __int16 v23 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        fCompletedServiceItemsList = self->fCompletedServiceItemsList;
        __int16 v25 = v23;
        id v26 = [(NSMutableArray *)fCompletedServiceItemsList count];
        *(_DWORD *)buf = 136446467;
        long long v35 = "-[CLEEDMediaService processCompletedQueueForCachedRequest:]";
        __int16 v36 = 2049;
        id v37 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, CompletedMediaServiceItemsListCount:%{private}lu", buf, 0x16u);
      }
    }
  }
}

- (void)processDelayQueueForCachedRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 delayQueue];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [v4 delayQueue];
    id v8 = [v7 count];

    if (v8)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v9 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v9;
        id v11 = [v4 delayQueue];
        *(_DWORD *)buf = 136446467;
        id v44 = "-[CLEEDMediaService processDelayQueueForCachedRequest:]";
        __int16 v45 = 2049;
        id v46 = [v11 count];
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, delayQueueCount:%{private}lu", buf, 0x16u);
      }
      id v12 = objc_alloc_init((Class)NSMutableSet);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v13 = [v4 delayQueue];
      id v14 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v14)
      {
        id v16 = v14;
        uint64_t v17 = *(void *)v39;
        *(void *)&long long v15 = 136446467;
        long long v35 = v15;
        id v37 = self;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v39 != v17) {
              objc_enumerationMutation(v13);
            }
            long long v19 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v18);
            long long v20 = objc_msgSend(v4, "completedQueue", v35);
            id v21 = [v20 member:v19];

            if (v21
              || ([v4 pendingQueue],
                  long long v22 = objc_claimAutoreleasedReturnValue(),
                  [v22 member:v19],
                  __int16 v23 = objc_claimAutoreleasedReturnValue(),
                  v23,
                  v22,
                  v23))
            {
              [v12 addObject:v19];
            }
            else
            {
              uint64_t v24 = [[CLEEDMediaServiceItem alloc] initWithMediaItem:v19 mediaRequest:v4 mediaService:self];
              if (v24)
              {
                [(NSMutableArray *)self->fDelayedServiceItemsList addObject:v24];
              }
              else
              {
                [v19 setUploadStatus:8];
                if (qword_10002A1E0 != -1) {
                  dispatch_once(&qword_10002A1E0, &stru_100024738);
                }
                __int16 v25 = (void *)qword_10002A1D8;
                if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR))
                {
                  __int16 v27 = v25;
                  __int16 v36 = [v19 encryptedFileURL];
                  uint64_t v28 = [v36 path];
                  *(_DWORD *)buf = v35;
                  id v44 = "-[CLEEDMediaService processDelayQueueForCachedRequest:]";
                  __int16 v45 = 2113;
                  id v46 = v28;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Could not create mediaServiceItem, path:%{private}@", buf, 0x16u);
                }
                id v26 = [v4 completedQueue];
                [v26 addObject:v19];

                [v12 addObject:v19];
                self = v37;
              }
            }
            uint64_t v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v29 = [v13 countByEnumeratingWithState:&v38 objects:v42 count:16];
          id v16 = v29;
        }
        while (v29);
      }

      long long v30 = [v4 delayQueue];
      [v30 minusSet:v12];

      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      long long v31 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        fDelayedServiceItemsList = self->fDelayedServiceItemsList;
        unsigned __int8 v33 = v31;
        id v34 = [(NSMutableArray *)fDelayedServiceItemsList count];
        *(_DWORD *)buf = 136446467;
        id v44 = "-[CLEEDMediaService processDelayQueueForCachedRequest:]";
        __int16 v45 = 2049;
        id v46 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, DelayedMediaServiceItemsListCount:%{private}lu", buf, 0x16u);
      }
    }
  }
}

- (void)processPendingQueueForCachedRequest:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 pendingQueue];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = [v3 pendingQueue];
    id v7 = [v6 count];

    if (v7)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v8 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        id v10 = [v3 filteredQueue];
        id v11 = [v10 count];
        id v12 = [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
        id v13 = [(NSMutableArray *)self->fPendingServiceItemsForUploadList count];
        id v14 = [(NSMutableArray *)self->fCompletedServiceItemsList count];
        *(_DWORD *)buf = 136447491;
        v96 = "-[CLEEDMediaService processPendingQueueForCachedRequest:]";
        __int16 v97 = 2113;
        id v98 = v3;
        __int16 v99 = 2049;
        id v100 = v11;
        __int16 v101 = 2049;
        id v102 = v12;
        __int16 v103 = 2049;
        id v104 = v13;
        __int16 v105 = 2049;
        id v106 = v14;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Enter, cachedRequest:%{private}@, filteredQueue:%{private}lu, pendingEcryptionCount:%{private}lu, pendingUploadCount:%{private}lu, completedListCount:%{private}lu", buf, 0x3Eu);
      }
      id v76 = objc_alloc_init((Class)NSMutableSet);
      id v85 = objc_alloc_init((Class)NSMutableSet);
      id v87 = objc_alloc_init((Class)NSMutableSet);
      id v15 = objc_alloc_init((Class)NSMutableSet);
      id v86 = objc_alloc_init((Class)NSMutableSet);
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v16 = [v3 pendingQueue];
      id v17 = [v16 countByEnumeratingWithState:&v90 objects:v94 count:16];
      if (v17)
      {
        id v19 = v17;
        uint64_t v20 = *(void *)v91;
        *(void *)&long long v18 = 136446979;
        long long v73 = v18;
        __int16 v88 = v16;
        do
        {
          id v21 = 0;
          do
          {
            if (*(void *)v91 != v20) {
              objc_enumerationMutation(v16);
            }
            long long v22 = *(CLEEDMediaServiceItem **)(*((void *)&v90 + 1) + 8 * (void)v21);
            __int16 v23 = objc_msgSend(v3, "completedQueue", v73);
            uint64_t v24 = [v23 member:v22];

            if (v24)
            {
              [v15 addObject:v22];
            }
            else
            {
              __int16 v25 = [[CLEEDMediaServiceItem alloc] initWithMediaItem:v22 mediaRequest:v3 mediaService:self];
              if (v25)
              {
                switch((unint64_t)[(CLEEDMediaServiceItem *)v22 uploadStatus])
                {
                  case 0uLL:
                    id v29 = v86;
                    goto LABEL_23;
                  case 1uLL:
                    long long v31 = [(CLEEDMediaServiceItem *)v22 stagingURL];
                    long long v32 = [v31 path];
                    id v16 = v88;
                    +[CLEEDMediaService deleteFileAtPath:v32];

                    id v29 = v85;
                    long long v30 = v25;
                    goto LABEL_24;
                  case 2uLL:
                  case 4uLL:
                  case 5uLL:
                  case 6uLL:
                  case 7uLL:
                  case 8uLL:
                  case 9uLL:
                    [v87 addObject:v25];
                    id v26 = [v3 completedQueue];
                    [v26 addObject:v22];

                    id v16 = v88;
                    goto LABEL_22;
                  case 3uLL:
                    uint64_t v33 = [(CLEEDMediaServiceItem *)v22 encryptedFileURL];
                    if (!v33) {
                      goto LABEL_37;
                    }
                    id v34 = (void *)v33;
                    uint64_t v35 = [(CLEEDMediaServiceItem *)v22 authTag];
                    if (!v35) {
                      goto LABEL_36;
                    }
                    __int16 v36 = (void *)v35;
                    uint64_t v37 = [(CLEEDMediaServiceItem *)v22 mediaItemID];
                    if (v37)
                    {
                      __int16 v81 = (void *)v37;
                      id v83 = +[NSFileManager defaultManager];
                      id v77 = [(CLEEDMediaServiceItem *)v22 encryptedFileURL];
                      long long v38 = [v77 path];
                      unsigned int log = [v83 fileExistsAtPath:v38];

                      if (log)
                      {
                        [v76 addObject:v25];
                        long long v39 = [(CLEEDMediaServiceItem *)v22 stagingURL];
                        long long v40 = [v39 path];
                        id v16 = v88;
                        +[CLEEDMediaService deleteFileAtPath:v40];

                        break;
                      }
                    }
                    else
                    {

LABEL_36:
                    }
LABEL_37:
                    if (qword_10002A1E0 != -1) {
                      dispatch_once(&qword_10002A1E0, &stru_100024738);
                    }
                    id v44 = (void *)qword_10002A1D8;
                    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR))
                    {
                      os_log_t loga = v44;
                      __int16 v84 = [(CLEEDMediaServiceItem *)v22 encryptedFileURL];
                      id v82 = [v84 path];
                      id v74 = [v82 UTF8String];
                      __int16 v78 = [(CLEEDMediaServiceItem *)v22 mediaItemID];
                      id v75 = [v78 UUIDString];
                      id v50 = [v75 UTF8String];
                      long long v51 = [(CLEEDMediaServiceItem *)v22 authTag];
                      id v52 = [v51 base64EncodedStringWithOptions:0];
                      id v53 = [v52 UTF8String];
                      *(_DWORD *)buf = v73;
                      v96 = "-[CLEEDMediaService processPendingQueueForCachedRequest:]";
                      __int16 v97 = 2081;
                      id v98 = v74;
                      __int16 v99 = 2081;
                      id v100 = v50;
                      __int16 v101 = 2081;
                      id v102 = v53;
                      _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Item missing encryption information, path:%{private}s, mediaID:%{private}s, authTag:%{private}s", buf, 0x2Au);
                    }
                    __int16 v45 = [(CLEEDMediaServiceItem *)v22 stagingURL];
                    id v46 = [v45 path];
                    +[CLEEDMediaService deleteFileAtPath:v46];

                    long long v47 = [(CLEEDMediaServiceItem *)v22 encryptedFileURL];
                    id v48 = [v47 path];
                    +[CLEEDMediaService deleteFileAtPath:v48];

                    [(CLEEDMediaServiceItem *)v22 setUploadStatus:8];
                    [v87 addObject:v25];
                    id v49 = [v3 completedQueue];
                    [v49 addObject:v22];

                    [v15 addObject:v22];
                    id v16 = v88;
                    break;
                  default:
                    break;
                }
              }
              else
              {
                [(CLEEDMediaServiceItem *)v22 setUploadStatus:8];
                if (qword_10002A1E0 != -1) {
                  dispatch_once(&qword_10002A1E0, &stru_100024738);
                }
                __int16 v27 = (void *)qword_10002A1D8;
                if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR))
                {
                  long long v41 = v27;
                  id v42 = [(CLEEDMediaServiceItem *)v22 encryptedFileURL];
                  long long v43 = [v42 path];
                  *(_DWORD *)buf = 136446467;
                  v96 = "-[CLEEDMediaService processPendingQueueForCachedRequest:]";
                  __int16 v97 = 2113;
                  id v98 = v43;
                  _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Could not create mediaServiceItem, path:%{private}@", buf, 0x16u);

                  id v16 = v88;
                }
                uint64_t v28 = [v3 completedQueue];
                [v28 addObject:v22];

LABEL_22:
                id v29 = v15;
LABEL_23:
                long long v30 = v22;
LABEL_24:
                [v29 addObject:v30];
              }
            }
            id v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          id v54 = [v16 countByEnumeratingWithState:&v90 objects:v94 count:16];
          id v19 = v54;
        }
        while (v54);
      }

      __int16 v55 = v85;
      long long v56 = v87;
      if ([v76 count] || objc_msgSend(v85, "count") || objc_msgSend(v86, "count"))
      {
        if ([v87 count])
        {
          fCompletedServiceItemsList = self->fCompletedServiceItemsList;
          long long v58 = [v87 allObjects];
          [(NSMutableArray *)fCompletedServiceItemsList addObjectsFromArray:v58];
        }
        if ([v76 count])
        {
          fPendingServiceItemsForUploadList = self->fPendingServiceItemsForUploadList;
          id v60 = [v76 allObjects];
          [(NSMutableArray *)fPendingServiceItemsForUploadList addObjectsFromArray:v60];

          [(NSMutableArray *)self->fPendingServiceItemsForUploadList sortUsingSelector:"compareMediaSize:"];
        }
        if ([v85 count])
        {
          fFilteredMediaServiceItemList = self->fFilteredMediaServiceItemList;
          long long v62 = [v85 allObjects];
          [(NSMutableArray *)fFilteredMediaServiceItemList addObjectsFromArray:v62];
        }
        if ([v86 count])
        {
          long long v63 = [v3 filteredQueue];
          long long v64 = [v86 allObjects];
          [v63 addObjectsFromArray:v64];
        }
      }
      long long v65 = [v3 pendingQueue];
      [v65 minusSet:v15];

      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      NSErrorUserInfoKey v66 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v67 = v66;
        __int16 v68 = [v3 filteredQueue];
        id v69 = [v68 count];
        id v70 = [(NSMutableArray *)self->fPendingServiceItemsForEncryptionList count];
        id v71 = [(NSMutableArray *)self->fPendingServiceItemsForUploadList count];
        id v72 = [(NSMutableArray *)self->fCompletedServiceItemsList count];
        *(_DWORD *)buf = 136447491;
        v96 = "-[CLEEDMediaService processPendingQueueForCachedRequest:]";
        __int16 v97 = 2113;
        id v98 = v3;
        __int16 v99 = 2049;
        id v100 = v69;
        __int16 v101 = 2049;
        id v102 = v70;
        __int16 v103 = 2049;
        id v104 = v71;
        long long v56 = v87;
        __int16 v55 = v85;
        __int16 v105 = 2049;
        id v106 = v72;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Exit, cachedRequest:%{private}@, filteredQueue:%{private}lu, pendingEcryption:%{private}lu, pendingUpload:%{private}lu, completed:%{private}lu", buf, 0x3Eu);
      }
    }
  }
}

- (void)storeDataToCache
{
  id v20 = 0;
  v2 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:&v20];
  id v3 = v20;
  if (v3 || ![v2 length])
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v4 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100017378((uint64_t)v3, v4, v2);
    }
  }
  else
  {
    uint64_t v5 = +[NSFileManager defaultManager];
    NSFileAttributeKey v27 = NSFileProtectionKey;
    NSFileProtectionType v28 = NSFileProtectionNone;
    id v6 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    unsigned __int8 v7 = [v5 createFileAtPath:@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache" contents:v2 attributes:v6];

    if (v7)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v8 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = v8;
        id v10 = [@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache" UTF8String];
        id v11 = [v2 length];
        *(_DWORD *)buf = 136446723;
        long long v22 = "-[CLEEDMediaService storeDataToCache]";
        __int16 v23 = 2081;
        id v24 = v10;
        __int16 v25 = 2050;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Successfully written CLEEDMediaService to cache file:%{private}s, cacheSize:%{public}lu", buf, 0x20u);
      }
    }
    else
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v12 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100017438(v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
  }
}

- (id)loadFromCache
{
  id v3 = +[NSFileManager defaultManager];
  uint64_t v4 = [v3 contentsAtPath:@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache"];

  if (v4)
  {
    id v15 = 0;
    uint64_t v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v15];
    id v6 = v15;
    if (v6 || !v5)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100017554();
      }
      id v12 = 0;
    }
    else
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      unsigned __int8 v7 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        id v9 = [@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache" UTF8String];
        id v10 = [v4 length];
        id v11 = [v5 mediaServiceRequestList];
        *(_DWORD *)buf = 136446979;
        uint64_t v17 = "-[CLEEDMediaService loadFromCache]";
        __int16 v18 = 2081;
        id v19 = v9;
        __int16 v20 = 2050;
        id v21 = v10;
        __int16 v22 = 2114;
        __int16 v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Successfully read CLEEDMediaService data from cache file:%{private}s, cacheSize:%{public}lu, requests:%{public}@", buf, 0x2Au);
      }
      -[CLEEDMediaService setTotalBytesUploadedDuringCall:](self, "setTotalBytesUploadedDuringCall:", [v5 totalBytesUploadedDuringCall]);
      id v12 = [v5 mediaServiceRequestList];
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v13 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000174B0(v13);
    }
    id v12 = 0;
  }

  return v12;
}

- (void)clearCache
{
  v2 = +[NSFileManager defaultManager];
  unsigned int v3 = [v2 fileExistsAtPath:@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache"];

  if (v3)
  {
    +[CLEEDMediaService deleteFileAtPath:@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache"];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v4 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v4;
      int v6 = 136446467;
      unsigned __int8 v7 = "-[CLEEDMediaService clearCache]";
      __int16 v8 = 2081;
      id v9 = [@"/private/var/mobile/Library/CLEEDMediaService/CLEEDMSCache" UTF8String];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, CLEEDMediaService cache file:%{private}s does not exist", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (double)getUploadDataRateForMediaItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  double v5 = 0.0;
  if (v3
    && [v3 uploadStatus] == (id)5
    && [v4 mediaItemSizeBytes]
    && (uint64_t)[v4 durationUploadMs] >= 1)
  {
    double v6 = (double)(unint64_t)[v4 mediaItemSizeBytes] * 8.0;
    double v5 = v6 / (double)(uint64_t)[v4 durationUploadMs];
  }

  return v5;
}

- (void)submitCAMetricForUploadItem:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    if ([v4 metricProcessed])
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      double v6 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446467;
        *(void *)&uint8_t buf[4] = "-[CLEEDMediaService submitCAMetricForUploadItem:]";
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, CA Metric already processed for item:%{private}@", buf, 0x16u);
      }
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v53 = sub_100013878;
      id v54 = sub_100013888;
      id v55 = objc_alloc_init((Class)NSMutableDictionary);
      id v15 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getUploadDataRateForMediaItem:v5];
      uint64_t v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v15 setValue:v16 forKey:@"avgUploadRateKbps"];

      uint64_t v17 = *(void **)(*(void *)&buf[8] + 40);
      __int16 v18 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 durationCopyMs]);
      [v17 setValue:v18 forKey:@"durationCopyMs"];

      id v19 = *(void **)(*(void *)&buf[8] + 40);
      __int16 v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 durationEncryptionMs]);
      [v19 setValue:v20 forKey:@"durationEncryptionMs"];

      id v21 = *(void **)(*(void *)&buf[8] + 40);
      __int16 v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 durationTranscodeMs]);
      [v21 setValue:v22 forKey:@"durationTranscodeMs"];

      __int16 v23 = *(void **)(*(void *)&buf[8] + 40);
      id v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 durationUploadMs]);
      [v23 setValue:v24 forKey:@"durationUploadMs"];

      __int16 v25 = *(void **)(*(void *)&buf[8] + 40);
      id v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 uploadStatus]);
      [v25 setValue:v26 forKey:@"finalUploadStatus"];

      NSFileAttributeKey v27 = *(void **)(*(void *)&buf[8] + 40);
      NSFileProtectionType v28 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 serverUploadStatus]);
      [v27 setValue:v28 forKey:@"lastServerStatus"];

      id v29 = *(void **)(*(void *)&buf[8] + 40);
      long long v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 type]);
      [v29 setValue:v30 forKey:@"mediaItemCategory"];

      long long v31 = *(void **)(*(void *)&buf[8] + 40);
      id v32 = [v5 mediaItemFormat];
      uint64_t v33 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v32 UTF8String]);
      [v31 setValue:v33 forKey:@"mediaItemFormat"];

      id v34 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[v5 mediaItemSizeBytes] * 0.000000953674316);
      [v34 setValue:v35 forKey:@"mediaItemSizeMBytes"];

      __int16 v36 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v37 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[v5 originalSizeBytes] * 0.000000953674316);
      [v36 setValue:v37 forKey:@"originalSizeMBytes"];

      long long v38 = *(void **)(*(void *)&buf[8] + 40);
      long long v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 uploadAttempts]);
      [v38 setValue:v39 forKey:@"numOfUploadAttempts"];

      long long v40 = *(void **)(*(void *)&buf[8] + 40);
      long long v41 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 didApplyDelayMitigation]);
      [v40 setValue:v41 forKey:@"didApplyDelayMitigation"];

      int v42 = sub_100017D70(COERCE_DOUBLE(3221225472));
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      long long v43 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        id v44 = "NO";
        uint64_t v45 = *(void *)(*(void *)&buf[8] + 40);
        if (v42) {
          id v44 = "YES";
        }
        *(_DWORD *)id v46 = 136446723;
        long long v47 = "-[CLEEDMediaService submitCAMetricForUploadItem:]";
        __int16 v48 = 2082;
        id v49 = v44;
        __int16 v50 = 2113;
        uint64_t v51 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, eventSent:%{public}s, eventDict:%{private}@", v46, 0x20u);
      }
      [v5 setMetricProcessed:1];
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    unsigned __int8 v7 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000175CC(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (unint64_t)countOfItemsInRequest:(id)a3 withState:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = objc_msgSend(a3, "completedQueue", 0);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) uploadStatus] == (id)a4) {
          ++v8;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)countOfDelayedItemsInRequest:(id)a3
{
  if (!a3) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "completedQueue", 0);
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) didApplyDelayMitigation];
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (double)getMaxSizeInRequest:(id)a3 withType:(int64_t)a4
{
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(a3, "completedQueue", 0);
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      double v9 = 0.0;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 type] == (id)a4
            && v9 < (double)(unint64_t)[v11 mediaItemSizeBytes])
          {
            double v9 = (double)(unint64_t)[v11 mediaItemSizeBytes];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }
  return v9 * 0.000000953674316;
}

- (double)getAvgSizeInRequest:(id)a3 withType:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  double v7 = 0.0;
  if (v5)
  {
    uint64_t v8 = [v5 completedQueue];
    id v9 = [v8 count];

    if (v9)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v10 = objc_msgSend(v6, "completedQueue", 0);
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        id v12 = v11;
        unint64_t v13 = 0;
        uint64_t v14 = *(void *)v19;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v19 != v14) {
              objc_enumerationMutation(v10);
            }
            long long v16 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if ([v16 type] == (id)a4)
            {
              double v7 = v7 + (double)(unint64_t)[v16 mediaItemSizeBytes];
              ++v13;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);

        if (v13) {
          double v7 = v7 * 0.000000953674316 / (double)v13;
        }
        else {
          double v7 = 0.0;
        }
      }
      else
      {
      }
    }
  }

  return v7;
}

- (double)getMinSizeInRequest:(id)a3 withType:(int64_t)a4
{
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = objc_msgSend(a3, "completedQueue", 0);
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      double v9 = 0.0;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 type] == (id)a4
            && (v9 == 0.0 || v9 > (double)(unint64_t)[v11 mediaItemSizeBytes]))
          {
            double v9 = (double)(unint64_t)[v11 mediaItemSizeBytes];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
    else
    {
      double v9 = 0.0;
    }
  }
  else
  {
    double v9 = 0.0;
  }
  return v9 * 0.000000953674316;
}

- (double)getTotalSizeOfSuccessfulUploadsInRequest:(id)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = objc_msgSend(a3, "completedQueue", 0);
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      double v7 = 0.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 uploadStatus] == (id)5) {
            double v7 = v7 + (double)(unint64_t)[v9 mediaItemSizeBytes];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  return v7 * 0.000000953674316;
}

- (double)getTotalSizeOfFailedUploadsInRequest:(id)a3
{
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = objc_msgSend(a3, "completedQueue", 0);
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      double v7 = 0.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 uploadStatus] != (id)5) {
            double v7 = v7 + (double)(unint64_t)[v9 mediaItemSizeBytes];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
    else
    {
      double v7 = 0.0;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  return v7 * 0.000000953674316;
}

- (void)submitCAMetricForRequest:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if ([v4 metricProcessed])
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      uint64_t v6 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446467;
        *(void *)&uint8_t buf[4] = "-[CLEEDMediaService submitCAMetricForRequest:]";
        *(_WORD *)&buf[12] = 2113;
        *(void *)&buf[14] = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, CA Metric already processed for Request:%{private}@", buf, 0x16u);
      }
    }
    else
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      long long v65 = sub_100013878;
      NSErrorUserInfoKey v66 = sub_100013888;
      id v67 = objc_alloc_init((Class)NSMutableDictionary);
      long long v15 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getAvgSizeInRequest:v5 withType:1];
      long long v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v15 setValue:v16 forKey:@"averageImageSize"];

      uint64_t v17 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getAvgSizeInRequest:v5 withType:2];
      long long v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v17 setValue:v18 forKey:@"averageVideoSize"];

      long long v19 = *(void **)(*(void *)&buf[8] + 40);
      long long v20 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 didUserCancelUpload]);
      [v19 setValue:v20 forKey:@"didUserCancelUpload"];

      long long v21 = *(void **)(*(void *)&buf[8] + 40);
      __int16 v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 durationRequestHandlingMs]);
      [v21 setValue:v22 forKey:@"durationOfRequestHandlingMs"];

      __int16 v23 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getMaxSizeInRequest:v5 withType:1];
      id v24 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v23 setValue:v24 forKey:@"maxImageSize"];

      __int16 v25 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getMaxSizeInRequest:v5 withType:2];
      id v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v25 setValue:v26 forKey:@"maxVideoSize"];

      NSFileAttributeKey v27 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getMinSizeInRequest:v5 withType:1];
      NSFileProtectionType v28 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v27 setValue:v28 forKey:@"minImageSize"];

      id v29 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getMinSizeInRequest:v5 withType:2];
      long long v30 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v29 setValue:v30 forKey:@"minVideoSize"];

      long long v31 = *(void **)(*(void *)&buf[8] + 40);
      id v32 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 numAdditionalMediaItemsSelected]);
      [v31 setValue:v32 forKey:@"numAdditionalMediaItemsSelected"];

      uint64_t v33 = *(void **)(*(void *)&buf[8] + 40);
      id v34 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfItemsInRequest:v5 withState:2]];
      [v33 setValue:v34 forKey:@"numCopyFailures"];

      uint64_t v35 = *(void **)(*(void *)&buf[8] + 40);
      __int16 v36 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfItemsInRequest:v5 withState:4]];
      [v35 setValue:v36 forKey:@"numEncryptionFailures"];

      uint64_t v37 = *(void **)(*(void *)&buf[8] + 40);
      long long v38 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfItemsInRequest:v5 withState:7]];
      [v37 setValue:v38 forKey:@"numItemsCancelled"];

      long long v39 = *(void **)(*(void *)&buf[8] + 40);
      long long v40 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfItemsInRequest:v5 withState:6]];
      [v39 setValue:v40 forKey:@"numUploadFailures"];

      long long v41 = *(void **)(*(void *)&buf[8] + 40);
      int v42 = [v5 completedQueue];
      long long v43 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v42 count]);
      [v41 setValue:v43 forKey:@"numUploadItems"];

      id v44 = *(void **)(*(void *)&buf[8] + 40);
      uint64_t v45 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfItemsInRequest:v5 withState:5]];
      [v44 setValue:v45 forKey:@"numUploadSuccess"];

      id v46 = *(void **)(*(void *)&buf[8] + 40);
      long long v47 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfItemsInRequest:v5 withState:9]];
      [v46 setValue:v47 forKey:@"numFileSizeExceeded"];

      __int16 v48 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getTotalSizeOfFailedUploadsInRequest:v5];
      id v49 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v48 setValue:v49 forKey:@"totalSizeInMBytesFailedUpload"];

      __int16 v50 = *(void **)(*(void *)&buf[8] + 40);
      [(CLEEDMediaService *)self getTotalSizeOfSuccessfulUploadsInRequest:v5];
      uint64_t v51 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v50 setValue:v51 forKey:@"totalSizeInMBytesUploaded"];

      id v52 = *(void **)(*(void *)&buf[8] + 40);
      id v53 = +[NSNumber numberWithUnsignedInteger:[(CLEEDMediaService *)self countOfDelayedItemsInRequest:v5]];
      [v52 setValue:v53 forKey:@"numDelayMitigatedItems"];

      int v54 = sub_100017D70(COERCE_DOUBLE(3221225472));
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v55 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
      {
        long long v56 = "NO";
        uint64_t v57 = *(void *)(*(void *)&buf[8] + 40);
        if (v54) {
          long long v56 = "YES";
        }
        *(_DWORD *)long long v58 = 136446723;
        long long v59 = "-[CLEEDMediaService submitCAMetricForRequest:]";
        __int16 v60 = 2082;
        id v61 = v56;
        __int16 v62 = 2113;
        uint64_t v63 = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, eventSent:%{public}s, eventDict:%{private}@", v58, 0x20u);
      }
      [v5 setMetricProcessed:1];
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    double v7 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100017644(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (NSMutableArray)mediaServiceRequestList
{
  return self->_mediaServiceRequestList;
}

- (void)setMediaServiceRequestList:(id)a3
{
}

- (BOOL)extendedSessionEnded
{
  return self->_extendedSessionEnded;
}

- (void)setExtendedSessionEnded:(BOOL)a3
{
  self->_extendedSessionEnded = a3;
}

- (int64_t)totalBytesUploadedDuringCall
{
  return self->_totalBytesUploadedDuringCall;
}

- (void)setTotalBytesUploadedDuringCall:(int64_t)a3
{
  self->_int64_t totalBytesUploadedDuringCall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceRequestList, 0);
  objc_storeStrong((id *)&self->fCallHistoryManager, 0);
  objc_storeStrong((id *)&self->fCallCenter, 0);
  objc_storeStrong((id *)&self->fProgress, 0);
  objc_storeStrong((id *)&self->fProgressUITask, 0);
  objc_storeStrong((id *)&self->fBGTaskStartGuardTimer, 0);
  objc_storeStrong((id *)&self->fUploadServiceConfig, 0);
  objc_storeStrong((id *)&self->fCurrentMitigation, 0);
  objc_storeStrong((id *)&self->fURLSession, 0);
  objc_storeStrong((id *)&self->fConnection, 0);
  objc_storeStrong((id *)&self->fInFlightServiceItemsList, 0);
  objc_storeStrong((id *)&self->fCompletedServiceItemsList, 0);
  objc_storeStrong((id *)&self->fDelayedServiceItemsList, 0);
  objc_storeStrong((id *)&self->fPendingServiceItemsForUploadList, 0);
  objc_storeStrong((id *)&self->fPendingServiceItemsForEncryptionList, 0);
  objc_storeStrong((id *)&self->fFilteredMediaServiceItemList, 0);
  objc_storeStrong((id *)&self->fDebounceTimer, 0);
  objc_storeStrong((id *)&self->fCopyQueue, 0);
  objc_storeStrong((id *)&self->fEncryptionQueue, 0);
  objc_storeStrong((id *)&self->fQueue, 0);

  objc_storeStrong((id *)&self->fOSTransaction, 0);
}

@end