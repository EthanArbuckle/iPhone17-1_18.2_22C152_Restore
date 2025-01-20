@interface CKLLog
+ (id)preparedLiveStreamFromLiveStore:(id)a3;
+ (id)preparedStreamFromStore:(id)a3;
- (BOOL)colorOutput;
- (BOOL)onlyTestLogs;
- (BOOL)wantsSimulatorLogs;
- (CKLLog)initWithArchiveAtURL:(id)a3;
- (NSDate)absoluteStartDate;
- (NSMutableArray)streamObservers;
- (NSString)processName;
- (OSLogEventLiveStream)liveStream;
- (OSLogEventStream)logEventStream;
- (double)startTimeOffset;
- (id)completionHandler;
- (id)initForHostStream;
- (id)initInternal;
- (unint64_t)source;
- (void)addStreamObserver:(id)a3;
- (void)setAbsoluteStartDate:(id)a3;
- (void)setColorOutput:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setLiveStream:(id)a3;
- (void)setLogEventStream:(id)a3;
- (void)setOnlyTestLogs:(BOOL)a3;
- (void)setProcessName:(id)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStartTimeOffset:(double)a3;
- (void)setStreamObservers:(id)a3;
- (void)setWantsSimulatorLogs:(BOOL)a3;
- (void)streamLogsWithCompletion:(id)a3;
@end

@implementation CKLLog

+ (id)preparedStreamFromStore:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_1C4EB4780;
  v17 = sub_1C4EB4790;
  id v18 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  objc_msgSend_setUpgradeConfirmationHandler_(v3, v5, (uint64_t)&unk_1F20439F0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1C4EB47A0;
  v10[3] = &unk_1E64F4D58;
  v12 = &v13;
  v6 = v4;
  v11 = v6;
  objc_msgSend_prepareWithCompletionHandler_(v3, v7, (uint64_t)v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

+ (id)preparedLiveStreamFromLiveStore:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1C4EB4780;
  v16 = sub_1C4EB4790;
  id v17 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1C4EB4988;
  v9[3] = &unk_1E64F4D80;
  v11 = &v12;
  v5 = v4;
  v10 = v5;
  objc_msgSend_prepareWithCompletionHandler_(v3, v6, (uint64_t)v9);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)initInternal
{
  v6.receiver = self;
  v6.super_class = (Class)CKLLog;
  v2 = [(CKLLog *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    streamObservers = v2->_streamObservers;
    v2->_streamObservers = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)initForHostStream
{
  uint64_t inited = objc_msgSend_initInternal(self, a2, v2);
  objc_super v6 = (void *)inited;
  if (inited)
  {
    *(void *)(inited + 40) = 0;
    id v7 = objc_msgSend_localStore(MEMORY[0x1E4F730C0], v4, v5);
    uint64_t v9 = objc_msgSend_preparedStreamFromStore_(CKLLog, v8, (uint64_t)v7);
    v10 = (void *)v6[6];
    v6[6] = v9;

    uint64_t v13 = objc_msgSend_liveLocalStore(MEMORY[0x1E4F73098], v11, v12);
    uint64_t v15 = objc_msgSend_preparedLiveStreamFromLiveStore_(CKLLog, v14, (uint64_t)v13);
    v16 = (void *)v6[7];
    v6[7] = v15;
  }
  return v6;
}

- (CKLLog)initWithArchiveAtURL:(id)a3
{
  id v4 = a3;
  uint64_t inited = objc_msgSend_initInternal(self, v5, v6);
  uint64_t v9 = (CKLLog *)inited;
  if (inited)
  {
    *(void *)(inited + 40) = 1;
    v10 = objc_msgSend_storeWithArchiveURL_(MEMORY[0x1E4F730C0], v8, (uint64_t)v4);
    uint64_t v12 = objc_msgSend_preparedStreamFromStore_(CKLLog, v11, (uint64_t)v10);
    logEventStream = v9->_logEventStream;
    v9->_logEventStream = (OSLogEventStream *)v12;
  }
  return v9;
}

- (void)addStreamObserver:(id)a3
{
  id v4 = a3;
  objc_msgSend_streamObservers(self, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v7, (uint64_t)v4);
}

- (void)streamLogsWithCompletion:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v78 = a3;
  context = (void *)MEMORY[0x1C8789E70]();
  uint64_t v6 = objc_msgSend_copy(v78, v4, v5);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  uint64_t v10 = objc_msgSend_wantsSimulatorLogs(self, v8, v9);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v13 = objc_msgSend_streamObservers(self, v11, v12);
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v92, v96, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v93;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v93 != v17) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v92 + 1) + 8 * i);
        objc_msgSend_setSimulatorOnly_(v19, v15, v10);
        uint64_t v22 = objc_msgSend_onlyTestLogs(self, v20, v21);
        objc_msgSend_setOnlyTestLogs_(v19, v23, v22);
        uint64_t v26 = objc_msgSend_colorOutput(self, v24, v25);
        objc_msgSend_setColorOutput_(v19, v27, v26);
        v30 = objc_msgSend_processName(self, v28, v29);
        objc_msgSend_setProcessName_(v19, v31, (uint64_t)v30);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v92, v96, 16);
    }
    while (v16);
  }

  objc_initWeak(&location, self);
  v34 = objc_msgSend_logEventStream(self, v32, v33);
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = sub_1C4EB519C;
  v89[3] = &unk_1E64F4DA8;
  objc_copyWeak(&v90, &location);
  objc_msgSend_setEventHandler_(v34, v35, (uint64_t)v89);

  v38 = objc_msgSend_liveStream(self, v36, v37);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = sub_1C4EB52C8;
  v87[3] = &unk_1E64F4DA8;
  objc_copyWeak(&v88, &location);
  objc_msgSend_setEventHandler_(v38, v39, (uint64_t)v87);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1C4EB53F4;
  aBlock[3] = &unk_1E64F4DD0;
  objc_copyWeak(&v86, &location);
  v40 = _Block_copy(aBlock);
  v43 = objc_msgSend_logEventStream(self, v41, v42);
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = sub_1C4EB5574;
  v82[3] = &unk_1E64F4DF8;
  objc_copyWeak(&v84, &location);
  id v44 = v40;
  id v83 = v44;
  objc_msgSend_setInvalidationHandler_(v43, v45, (uint64_t)v82);

  v48 = objc_msgSend_liveStream(self, v46, v47);
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = sub_1C4EB5618;
  v80[3] = &unk_1E64F4E20;
  id v49 = v44;
  id v81 = v49;
  objc_msgSend_setInvalidationHandler_(v48, v50, (uint64_t)v80);

  v55 = objc_msgSend_absoluteStartDate(self, v51, v52);
  if (v55) {
    goto LABEL_9;
  }
  objc_msgSend_startTimeOffset(self, v53, v54);
  if (v58 != 0.0)
  {
    v59 = objc_msgSend_logEventStream(self, v53, v54);
    v62 = objc_msgSend_source(v59, v60, v61);
    v65 = objc_msgSend_newestDate(v62, v63, v64);
    objc_msgSend_startTimeOffset(self, v66, v67);
    v55 = objc_msgSend_dateByAddingTimeInterval_(v65, v68, v69);

    if (v55) {
      goto LABEL_9;
    }
  }
  if (objc_msgSend_source(self, v53, v54) != 1) {
    goto LABEL_15;
  }
  v70 = objc_msgSend_logEventStream(self, v53, v54);
  v73 = objc_msgSend_source(v70, v71, v72);
  v55 = objc_msgSend_oldestDate(v73, v74, v75);

  if (v55)
  {
LABEL_9:
    v56 = objc_msgSend_logEventStream(self, v53, v54);
    objc_msgSend_activateStreamFromDate_(v56, v57, (uint64_t)v55);
  }
  else
  {
LABEL_15:
    v55 = objc_msgSend_liveStream(self, v53, v54);
    objc_msgSend_activate(v55, v76, v77);
  }

  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak(&v88);
  objc_destroyWeak(&v90);
  objc_destroyWeak(&location);
}

- (BOOL)wantsSimulatorLogs
{
  return self->_wantsSimulatorLogs;
}

- (void)setWantsSimulatorLogs:(BOOL)a3
{
  self->_wantsSimulatorLogs = a3;
}

- (BOOL)onlyTestLogs
{
  return self->_onlyTestLogs;
}

- (void)setOnlyTestLogs:(BOOL)a3
{
  self->_onlyTestLogs = a3;
}

- (double)startTimeOffset
{
  return self->_startTimeOffset;
}

- (void)setStartTimeOffset:(double)a3
{
  self->_startTimeOffset = a3;
}

- (NSDate)absoluteStartDate
{
  return self->_absoluteStartDate;
}

- (void)setAbsoluteStartDate:(id)a3
{
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (BOOL)colorOutput
{
  return self->_colorOutput;
}

- (void)setColorOutput:(BOOL)a3
{
  self->_colorOutput = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (OSLogEventStream)logEventStream
{
  return self->_logEventStream;
}

- (void)setLogEventStream:(id)a3
{
}

- (OSLogEventLiveStream)liveStream
{
  return self->_liveStream;
}

- (void)setLiveStream:(id)a3
{
}

- (NSMutableArray)streamObservers
{
  return self->_streamObservers;
}

- (void)setStreamObservers:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_streamObservers, 0);
  objc_storeStrong((id *)&self->_liveStream, 0);
  objc_storeStrong((id *)&self->_logEventStream, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_absoluteStartDate, 0);
}

@end