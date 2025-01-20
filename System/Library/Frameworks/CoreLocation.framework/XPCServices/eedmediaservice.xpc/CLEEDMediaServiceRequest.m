@interface CLEEDMediaServiceRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)anyItemsToProcess;
- (BOOL)didUserCancelUpload;
- (BOOL)hasPendingPhotos;
- (BOOL)hasPendingVideos;
- (BOOL)metricProcessed;
- (CLEEDMediaServiceRequest)initWithCoder:(id)a3;
- (CLEEDMediaServiceRequest)initWithRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8;
- (NSData)combinedSecret;
- (NSData)deviceKeyConfirmation;
- (NSData)sharedInfoPrefix;
- (NSDate)requestTimestamp;
- (NSMutableSet)completedQueue;
- (NSMutableSet)delayQueue;
- (NSMutableSet)filteredQueue;
- (NSMutableSet)pendingQueue;
- (NSString)callUUID;
- (NSString)token;
- (NSString)uploadURL;
- (NSUUID)requestID;
- (id)description;
- (id)generateDeviceKeyConfirmationFromSharedInfoPrefix:(id)a3 combinedSecret:(id)a4;
- (unint64_t)durationRequestHandlingMs;
- (unint64_t)filterAndAddMediaList:(id)a3;
- (unint64_t)numAdditionalMediaItemsSelected;
- (unint64_t)updateQueueForDelayedMediaItem:(id)a3;
- (unint64_t)updateQueueForProcessedMediaItem:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedQueue:(id)a3;
- (void)setDelayQueue:(id)a3;
- (void)setDidUserCancelUpload:(BOOL)a3;
- (void)setDurationRequestHandlingMs:(unint64_t)a3;
- (void)setFilteredQueue:(id)a3;
- (void)setHasPendingPhotos:(BOOL)a3;
- (void)setHasPendingVideos:(BOOL)a3;
- (void)setMetricProcessed:(BOOL)a3;
- (void)setNumAdditionalMediaItemsSelected:(unint64_t)a3;
- (void)setPendingQueue:(id)a3;
- (void)setRequestTimestamp:(id)a3;
@end

@implementation CLEEDMediaServiceRequest

- (CLEEDMediaServiceRequest)initWithRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8
{
  id v49 = a3;
  id v15 = a4;
  id v51 = a5;
  id v50 = a6;
  id v16 = a7;
  id v47 = a8;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v17 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v54 = "-[CLEEDMediaServiceRequest initWithRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s", buf, 0xCu);
  }
  v52.receiver = self;
  v52.super_class = (Class)CLEEDMediaServiceRequest;
  v18 = [(CLEEDMediaServiceRequest *)&v52 init];
  v19 = v18;
  v20 = v16;
  if (!v18) {
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v18->_requestID, a3);
  objc_storeStrong((id *)&v19->_callUUID, a4);
  objc_storeStrong((id *)&v19->_uploadURL, a5);
  objc_storeStrong((id *)&v19->_sharedInfoPrefix, a6);
  objc_storeStrong((id *)&v19->_combinedSecret, a7);
  objc_storeStrong((id *)&v19->_token, a8);
  uint64_t v21 = +[NSDate date];
  requestTimestamp = v19->_requestTimestamp;
  v19->_requestTimestamp = (NSDate *)v21;

  uint64_t v23 = [(CLEEDMediaServiceRequest *)v19 generateDeviceKeyConfirmationFromSharedInfoPrefix:v19->_sharedInfoPrefix combinedSecret:v19->_combinedSecret];
  deviceKeyConfirmation = v19->_deviceKeyConfirmation;
  v19->_deviceKeyConfirmation = (NSData *)v23;

  if (v19->_deviceKeyConfirmation)
  {
    v25 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    filteredQueue = v19->_filteredQueue;
    v19->_filteredQueue = v25;

    v27 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pendingQueue = v19->_pendingQueue;
    v19->_pendingQueue = v27;

    v29 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    delayQueue = v19->_delayQueue;
    v19->_delayQueue = v29;

    v31 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completedQueue = v19->_completedQueue;
    v19->_completedQueue = v31;

    *(_DWORD *)&v19->_didUserCancelUpload = 0;
    v19->_numAdditionalMediaItemsSelected = 0;
    v19->_durationRequestHandlingMs = 0;
LABEL_8:
    v33 = v19;
    v35 = v49;
    v34 = v50;
    v36 = v51;
    v37 = v48;
    goto LABEL_14;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v35 = v49;
  v34 = v50;
  v36 = v51;
  v37 = v48;
  v38 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100014C88(v38, v39, v40, v41, v42, v43, v44, v45);
  }
  v33 = 0;
LABEL_14:

  return v33;
}

- (id)description
{
  id v15 = [(CLEEDMediaServiceRequest *)self requestID];
  v3 = [(CLEEDMediaServiceRequest *)self uploadURL];
  v4 = [(CLEEDMediaServiceRequest *)self callUUID];
  v5 = [(CLEEDMediaServiceRequest *)self requestTimestamp];
  v6 = [(CLEEDMediaServiceRequest *)self filteredQueue];
  id v7 = [v6 count];
  v8 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v9 = [v8 count];
  v10 = [(CLEEDMediaServiceRequest *)self delayQueue];
  id v11 = [v10 count];
  v12 = [(CLEEDMediaServiceRequest *)self completedQueue];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" <CLEEDMediaServiceRequest: ID:%@, uploadURL:%@, callUUID:%@, requestTimestamp:%@, numFiltered:%lu, numPending:%lu, numDelay:%lu, numComplete:%lu>", v15, v3, v4, v5, v7, v9, v11, [v12 count]);

  return v13;
}

- (id)generateDeviceKeyConfirmationFromSharedInfoPrefix:(id)a3 combinedSecret:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    v8 = [@"device key confirmation" dataUsingEncoding:4];
    id v9 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[v5 length] + (void)objc_msgSend(@"device key confirmation", "length"));
    [v9 appendData:v5];
    [v9 appendData:v8];
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v10 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
      sub_100014F14(v10);
    }
    id v11 = +[CLEEDCryptoUtilities getDerivedKeyWithLength:48 secretData:v7 additionalInfo:v9];
    v12 = v11;
    if (!v11)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      v27 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100014D00(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      id v16 = 0;
      goto LABEL_41;
    }
    v13 = objc_msgSend(v11, "subdataWithRange:", 0, 32);
    v14 = objc_msgSend(v12, "subdataWithRange:", 32, 16);
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v15 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v43 = v15;
      id v57 = [v12 base64EncodedStringWithOptions:0];
      id v55 = [v57 UTF8String];
      id v56 = [v13 base64EncodedStringWithOptions:0];
      id v53 = [v56 UTF8String];
      id v54 = [v14 base64EncodedStringWithOptions:0];
      *(_DWORD *)buf = 136446979;
      v59 = "-[CLEEDMediaServiceRequest generateDeviceKeyConfirmationFromSharedInfoPrefix:combinedSecret:]";
      __int16 v60 = 2081;
      id v61 = v55;
      __int16 v62 = 2081;
      id v63 = v53;
      __int16 v64 = 2081;
      id v65 = [v54 UTF8String];
      _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Derived key blob:%{private}s, derived key:%{private}s, derived IV blob:%{private}s", buf, 0x2Au);

      if (!v13) {
        goto LABEL_35;
      }
    }
    else if (!v13)
    {
      goto LABEL_35;
    }
    if (v14)
    {
      id v16 = +[CLEEDCryptoUtilities getGMACWithAuthData:v8 key:v13 iv:v14];
      if (v16)
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        v17 = (void *)qword_10002A1D8;
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
          sub_100014DF0(v17);
        }
        id v18 = v16;
      }
      else
      {
        if (qword_10002A1E0 != -1) {
          dispatch_once(&qword_10002A1E0, &stru_100024738);
        }
        v35 = qword_10002A1D8;
        if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
          sub_100014D78(v35, v36, v37, v38, v39, v40, v41, v42);
        }
      }

LABEL_40:
LABEL_41:

      goto LABEL_42;
    }
LABEL_35:
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    uint64_t v44 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100014E9C(v44, v45, v46, v47, v48, v49, v50, v51);
    }
    id v16 = 0;
    goto LABEL_40;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v19 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100014FC0(v19, v20, v21, v22, v23, v24, v25, v26);
  }
  id v16 = 0;
LABEL_42:

  return v16;
}

- (unint64_t)updateQueueForProcessedMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v6 = [v5 member:v4];

  if (v6)
  {
    id v7 = [(CLEEDMediaServiceRequest *)self completedQueue];
    [v7 addObject:v4];

    v8 = [(CLEEDMediaServiceRequest *)self pendingQueue];
    [v8 removeObject:v4];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100015038();
    }
  }
  id v9 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v10 = [v9 count];

  if (!v10)
  {
    double v11 = (double)[(CLEEDMediaServiceRequest *)self durationRequestHandlingMs];
    v12 = [(CLEEDMediaServiceRequest *)self requestTimestamp];
    [v12 timeIntervalSinceNow];
    [(CLEEDMediaServiceRequest *)self setDurationRequestHandlingMs:(unint64_t)(v11 + fabs(v13) * 1000.0)];
  }
  v14 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v15 = [v14 count];

  return (unint64_t)v15;
}

- (unint64_t)updateQueueForDelayedMediaItem:(id)a3
{
  id v4 = a3;
  id v5 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v6 = [v5 member:v4];

  if (v6)
  {
    id v7 = [(CLEEDMediaServiceRequest *)self delayQueue];
    [v7 addObject:v4];

    v8 = [(CLEEDMediaServiceRequest *)self pendingQueue];
    [v8 removeObject:v4];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000150B0();
    }
  }
  id v9 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v10 = [v9 count];

  if (!v10)
  {
    double v11 = (double)[(CLEEDMediaServiceRequest *)self durationRequestHandlingMs];
    v12 = [(CLEEDMediaServiceRequest *)self requestTimestamp];
    [v12 timeIntervalSinceNow];
    [(CLEEDMediaServiceRequest *)self setDurationRequestHandlingMs:(unint64_t)(v11 + fabs(v13) * 1000.0)];
  }
  v14 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  id v15 = [v14 count];

  return (unint64_t)v15;
}

- (unint64_t)filterAndAddMediaList:(id)a3
{
  id v4 = a3;
  if (![(CLEEDMediaServiceRequest *)self anyItemsToProcess])
  {
    [(CLEEDMediaServiceRequest *)self setHasPendingPhotos:0];
    [(CLEEDMediaServiceRequest *)self setHasPendingVideos:0];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v9);
        double v11 = [(CLEEDMediaServiceRequest *)self filteredQueue];
        v12 = [v11 member:v10];

        if (!v12)
        {
          double v13 = [(CLEEDMediaServiceRequest *)self pendingQueue];
          v14 = [v13 member:v10];

          if (!v14)
          {
            id v15 = [(CLEEDMediaServiceRequest *)self delayQueue];
            id v16 = [v15 member:v10];

            if (!v16)
            {
              v17 = [(CLEEDMediaServiceRequest *)self completedQueue];
              id v18 = [v17 member:v10];

              if (!v18)
              {
                if ([v10 type] == (id)1) {
                  [(CLEEDMediaServiceRequest *)self setHasPendingPhotos:1];
                }
                else {
                  [(CLEEDMediaServiceRequest *)self setHasPendingVideos:1];
                }
                v19 = [(CLEEDMediaServiceRequest *)self filteredQueue];
                [v19 addObject:v10];
              }
            }
          }
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  uint64_t v20 = [(CLEEDMediaServiceRequest *)self filteredQueue];
  id v21 = [v20 count];

  return (unint64_t)v21;
}

- (BOOL)anyItemsToProcess
{
  v3 = [(CLEEDMediaServiceRequest *)self pendingQueue];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(CLEEDMediaServiceRequest *)self delayQueue];
    if ([v5 count])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(CLEEDMediaServiceRequest *)self filteredQueue];
      BOOL v4 = [v6 count] != 0;
    }
  }

  return v4;
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
    sub_100015128((uint64_t)self, v5);
  }
  [v4 encodeObject:self->_requestID forKey:@"requestID"];
  [v4 encodeObject:self->_callUUID forKey:@"callUUID"];
  [v4 encodeObject:self->_requestTimestamp forKey:@"requestTimestamp"];
  [v4 encodeObject:self->_uploadURL forKey:@"uploadURL"];
  [v4 encodeObject:self->_sharedInfoPrefix forKey:@"sharedInfoPrefix"];
  [v4 encodeObject:self->_combinedSecret forKey:@"combinedSecret"];
  [v4 encodeObject:self->_token forKey:@"token"];
  [v4 encodeObject:self->_deviceKeyConfirmation forKey:@"deviceKeyConfirmation"];
  [v4 encodeObject:self->_filteredQueue forKey:@"filteredQueue"];
  [v4 encodeObject:self->_pendingQueue forKey:@"pendingQueue"];
  [v4 encodeObject:self->_delayQueue forKey:@"delayQueue"];
  [v4 encodeObject:self->_completedQueue forKey:@"completedQueue"];
  [v4 encodeInteger:self->_numAdditionalMediaItemsSelected forKey:@"numAdditionalMediaItemsSelected"];
  [v4 encodeInteger:self->_durationRequestHandlingMs forKey:@"durationRequestHandlingMs"];
  [v4 encodeBool:self->_didUserCancelUpload forKey:@"didUserCancelUpload"];
  [v4 encodeBool:self->_metricProcessed forKey:@"metricProcessed"];
  [v4 encodeBool:self->_hasPendingVideos forKey:@"hasPendingVideos"];
  [v4 encodeBool:self->_hasPendingPhotos forKey:@"hasPendingPhotos"];
}

- (CLEEDMediaServiceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestID"];
  requestID = self->_requestID;
  self->_requestID = v5;

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"callUUID"];
  callUUID = self->_callUUID;
  self->_callUUID = v7;

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestTimestamp"];
  requestTimestamp = self->_requestTimestamp;
  self->_requestTimestamp = v9;

  double v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uploadURL"];
  uploadURL = self->_uploadURL;
  self->_uploadURL = v11;

  double v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedInfoPrefix"];
  sharedInfoPrefix = self->_sharedInfoPrefix;
  self->_sharedInfoPrefix = v13;

  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"combinedSecret"];
  combinedSecret = self->_combinedSecret;
  self->_combinedSecret = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceKeyConfirmation"];
  deviceKeyConfirmation = self->_deviceKeyConfirmation;
  self->_deviceKeyConfirmation = v17;

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"token"];
  token = self->_token;
  self->_token = v19;

  uint64_t v21 = objc_opt_class();
  uint64_t v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(), 0);
  long long v23 = [v4 decodeObjectOfClasses:v22 forKey:@"filteredQueue"];
  filteredQueue = self->_filteredQueue;
  self->_filteredQueue = v23;

  uint64_t v25 = objc_opt_class();
  long long v26 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v25, objc_opt_class(), 0);
  v27 = [v4 decodeObjectOfClasses:v26 forKey:@"pendingQueue"];
  pendingQueue = self->_pendingQueue;
  self->_pendingQueue = v27;

  uint64_t v29 = objc_opt_class();
  uint64_t v30 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v29, objc_opt_class(), 0);
  uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"delayQueue"];
  delayQueue = self->_delayQueue;
  self->_delayQueue = v31;

  uint64_t v33 = objc_opt_class();
  uint64_t v34 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, objc_opt_class(), 0);
  v35 = [v4 decodeObjectOfClasses:v34 forKey:@"completedQueue"];
  completedQueue = self->_completedQueue;
  self->_completedQueue = v35;

  self->_numAdditionalMediaItemsSelected = (unint64_t)[v4 decodeIntegerForKey:@"numAdditionalMediaItemsSelected"];
  self->_durationRequestHandlingMs = (unint64_t)[v4 decodeIntegerForKey:@"durationRequestHandlingMs"];
  self->_didUserCancelUpload = [v4 decodeBoolForKey:@"didUserCancelUpload"];
  self->_metricProcessed = [v4 decodeBoolForKey:@"metricProcessed"];
  self->_hasPendingVideos = [v4 decodeBoolForKey:@"hasPendingVideos"];
  LOBYTE(v34) = [v4 decodeBoolForKey:@"hasPendingPhotos"];

  self->_hasPendingPhotos = (char)v34;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  uint64_t v37 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v39 = self->_requestID;
    uint64_t v40 = self->_callUUID;
    uint64_t v42 = self->_requestTimestamp;
    uint64_t v41 = self->_uploadURL;
    uint64_t v43 = self->_sharedInfoPrefix;
    uint64_t v50 = self->_combinedSecret;
    uint64_t v51 = self->_deviceKeyConfirmation;
    uint64_t v44 = self->_filteredQueue;
    objc_super v52 = self->_token;
    uint64_t v45 = v37;
    id v46 = [(NSMutableSet *)v44 count];
    id v47 = [(NSMutableSet *)self->_pendingQueue count];
    id v48 = [(NSMutableSet *)self->_delayQueue count];
    id v49 = [(NSMutableSet *)self->_completedQueue count];
    *(_DWORD *)buf = 136449283;
    id v54 = "-[CLEEDMediaServiceRequest initWithCoder:]";
    __int16 v55 = 2114;
    id v56 = v39;
    __int16 v57 = 2114;
    v58 = v41;
    __int16 v59 = 2114;
    __int16 v60 = v40;
    __int16 v61 = 2114;
    __int16 v62 = v42;
    __int16 v63 = 2113;
    __int16 v64 = v43;
    __int16 v65 = 2113;
    v66 = v50;
    __int16 v67 = 2113;
    v68 = v51;
    __int16 v69 = 2113;
    v70 = v52;
    __int16 v71 = 2050;
    id v72 = v46;
    __int16 v73 = 2050;
    id v74 = v47;
    __int16 v75 = 2050;
    id v76 = v48;
    __int16 v77 = 2050;
    id v78 = v49;
    _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s[requestID:%{public}@,uploadURL:%{public}@,callUUID:%{public}@,requestTimestamp:%{public}@,sharedInfoPrefix:%{private}@,combinedSecret:%{private}@,deviceKeyConfirmation:%{private}@,Token:%{private}@,numFiltered:%{public}lu,numPending:%{public}lu,numDelayed:%{public}lu,numCompleted:%{public}lu]", buf, 0x84u);
  }
  return self;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (NSDate)requestTimestamp
{
  return self->_requestTimestamp;
}

- (void)setRequestTimestamp:(id)a3
{
}

- (NSString)uploadURL
{
  return self->_uploadURL;
}

- (NSData)sharedInfoPrefix
{
  return self->_sharedInfoPrefix;
}

- (NSData)combinedSecret
{
  return self->_combinedSecret;
}

- (NSData)deviceKeyConfirmation
{
  return self->_deviceKeyConfirmation;
}

- (NSString)token
{
  return self->_token;
}

- (NSMutableSet)filteredQueue
{
  return self->_filteredQueue;
}

- (void)setFilteredQueue:(id)a3
{
}

- (NSMutableSet)pendingQueue
{
  return self->_pendingQueue;
}

- (void)setPendingQueue:(id)a3
{
}

- (NSMutableSet)delayQueue
{
  return self->_delayQueue;
}

- (void)setDelayQueue:(id)a3
{
}

- (NSMutableSet)completedQueue
{
  return self->_completedQueue;
}

- (void)setCompletedQueue:(id)a3
{
}

- (BOOL)didUserCancelUpload
{
  return self->_didUserCancelUpload;
}

- (void)setDidUserCancelUpload:(BOOL)a3
{
  self->_didUserCancelUpload = a3;
}

- (unint64_t)numAdditionalMediaItemsSelected
{
  return self->_numAdditionalMediaItemsSelected;
}

- (void)setNumAdditionalMediaItemsSelected:(unint64_t)a3
{
  self->_numAdditionalMediaItemsSelected = a3;
}

- (unint64_t)durationRequestHandlingMs
{
  return self->_durationRequestHandlingMs;
}

- (void)setDurationRequestHandlingMs:(unint64_t)a3
{
  self->_durationRequestHandlingMs = a3;
}

- (BOOL)metricProcessed
{
  return self->_metricProcessed;
}

- (void)setMetricProcessed:(BOOL)a3
{
  self->_metricProcessed = a3;
}

- (BOOL)hasPendingVideos
{
  return self->_hasPendingVideos;
}

- (void)setHasPendingVideos:(BOOL)a3
{
  self->_hasPendingVideos = a3;
}

- (BOOL)hasPendingPhotos
{
  return self->_hasPendingPhotos;
}

- (void)setHasPendingPhotos:(BOOL)a3
{
  self->_hasPendingPhotos = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedQueue, 0);
  objc_storeStrong((id *)&self->_delayQueue, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_filteredQueue, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_deviceKeyConfirmation, 0);
  objc_storeStrong((id *)&self->_combinedSecret, 0);
  objc_storeStrong((id *)&self->_sharedInfoPrefix, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_requestTimestamp, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);

  objc_storeStrong((id *)&self->_requestID, 0);
}

@end