@interface CHQuery
- (BOOL)needsForegroundRecognition;
- (BOOL)q_doesQueryResultDependOnDeclaredVariables;
- (BOOL)q_resultWantedForCompleteness:(int64_t)a3;
- (BOOL)wantsAutoRefineUpdates;
- (CHQuery)init;
- (CHQuery)initWithRecognitionSession:(id)a3;
- (CHQueryDelegate)delegate;
- (CHRecognitionSession)recognitionSession;
- (CHStrokeProviderVersion)lastProcessedStrokeProviderVersion;
- (NSString)debugName;
- (OS_dispatch_queue)processingQueue;
- (double)preferredUpdatesInterval;
- (id)q_sessionResult;
- (void)dealloc;
- (void)pause;
- (void)q_queryResultDidChange;
- (void)q_setNeedsQueryResultUpdating;
- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredUpdatesInterval:(double)a3;
- (void)start;
- (void)waitForPendingUpdates;
@end

@implementation CHQuery

- (CHQuery)init
{
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9F90[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHQuery)initWithRecognitionSession:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CHQuery;
  v6 = [(CHQuery *)&v38 init];
  if (v6)
  {
    v7 = NSString;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v14 = objc_msgSend_stringWithFormat_(v7, v10, @"com.apple.CoreHandwriting.%@.Processing", v11, v12, v13, v9);

    id v15 = v14;
    v21 = (const char *)objc_msgSend_UTF8String(v15, v16, v17, v18, v19, v20);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create(v21, v22);
    processingQueue = v6->_processingQueue;
    v6->_processingQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v6->_recognitionSession, a3);
    v6->_preferredUpdatesInterval = 1.0;
    v30 = objc_msgSend_distantPast(MEMORY[0x1E4F1C9C8], v25, v26, v27, v28, v29);
    objc_msgSend_timeIntervalSinceReferenceDate(v30, v31, v32, v33, v34, v35);
    v6->_lastProcessedTime = v36;

    v6->_isTearingDown = 0;
  }

  return v6;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  v3 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[CHQuery dealloc]";
    __int16 v15 = 2080;
    label = dispatch_queue_get_label(0);
    _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "%s is running on queue %s", buf, 0x16u);
  }

  self->_isTearingDown = 1;
  if (qword_1EA3CA000 != -1)
  {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    v4 = (id)qword_1EA3C9FA0;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v4 = (id)qword_1EA3C9FA0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
LABEL_7:
    objc_msgSend_debugName(self, v5, v6, v7, v8, v9);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    recognitionSession = self->_recognitionSession;
    *(_DWORD *)buf = 134218498;
    v14 = v10;
    __int16 v15 = 2112;
    label = (const char *)recognitionSession;
    __int16 v17 = 2048;
    uint64_t v18 = self;
    _os_log_impl(&dword_1C492D000, v4, OS_LOG_TYPE_DEBUG, "Query %p {class %@} attached to session %p: dealloc", buf, 0x20u);
  }
LABEL_8:

  v12.receiver = self;
  v12.super_class = (Class)CHQuery;
  [(CHQuery *)&v12 dealloc];
}

- (void)start
{
  if (!self->_isTearingDown)
  {
    uint64_t v7 = objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4B42AFC;
    block[3] = &unk_1E64E16D8;
    block[4] = self;
    dispatch_sync(v7, block);
  }
}

- (void)pause
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (qword_1EA3CA000 != -1) {
    dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
  }
  uint64_t v3 = (id)qword_1EA3C9FA0;
  if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {

    if (self->_isTearingDown) {
      return;
    }
LABEL_7:
    uint64_t v9 = objc_msgSend_processingQueue(self, v4, v5, v6, v7, v8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1C4B43298;
    block[3] = &unk_1E64E16D8;
    block[4] = self;
    dispatch_sync(v9, block);

    return;
  }
  *(_DWORD *)buf = 136315394;
  objc_super v12 = "-[CHQuery pause]";
  __int16 v13 = 2080;
  label = dispatch_queue_get_label(0);
  _os_log_impl(&dword_1C492D000, v3, OS_LOG_TYPE_DEFAULT, "%s is running on queue %s", buf, 0x16u);

  if (!self->_isTearingDown) {
    goto LABEL_7;
  }
}

- (void)waitForPendingUpdates
{
  if (!self->_isTearingDown)
  {
    uint64_t v7 = objc_msgSend_recognitionSession(self, a2, v2, v3, v4, v5);
    objc_msgSend_waitForPendingRecognitionTasks(v7, v8, v9, v10, v11, v12);

    double lastProcessedTime = self->_lastProcessedTime;
    uint64_t v19 = objc_msgSend_processingQueue(self, v14, v15, v16, v17, v18);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1C4B43474;
    v20[3] = &unk_1E64E4248;
    v20[4] = self;
    *(double *)&v20[5] = lastProcessedTime;
    dispatch_sync(v19, v20);
  }
}

- (CHQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CHQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CHRecognitionSession)recognitionSession
{
  return self->_recognitionSession;
}

- (CHStrokeProviderVersion)lastProcessedStrokeProviderVersion
{
  return (CHStrokeProviderVersion *)objc_getProperty(self, a2, 56, 1);
}

- (double)preferredUpdatesInterval
{
  return self->_preferredUpdatesInterval;
}

- (void)setPreferredUpdatesInterval:(double)a3
{
  self->_preferredUpdatesInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedStrokeProviderVersion, 0);
  objc_storeStrong((id *)&self->_recognitionSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentProcessingSessionResult, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

- (void)recognitionSessionDidUpdateRecognitionResult:(id)a3
{
  if (!self->_isTearingDown)
  {
    double lastProcessedTime = self->_lastProcessedTime;
    uint64_t v8 = objc_msgSend_processingQueue(self, a2, (uint64_t)a3, v3, v4, v5);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1C4B4360C;
    v9[3] = &unk_1E64E4248;
    v9[4] = self;
    *(double *)&v9[5] = lastProcessedTime;
    dispatch_async(v8, v9);
  }
}

- (BOOL)wantsAutoRefineUpdates
{
  return 0;
}

- (BOOL)needsForegroundRecognition
{
  return 1;
}

- (void)q_setNeedsQueryResultUpdating
{
  if (!self->_isTearingDown && self->__queryActive)
  {
    uint64_t v7 = objc_msgSend_strokeProviderVersion(self->_currentProcessingSessionResult, a2, v2, v3, v4, v5);
    objc_setProperty_atomic_copy(self, v8, v7, 56);

    MEMORY[0x1F4181798](self, sel_q_updateQueryResult, v9, v10, v11, v12);
  }
}

- (void)q_queryResultDidChange
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_isTearingDown)
  {
    if (self->__queryActive && (id v3 = objc_loadWeakRetained((id *)&self->_delegate), v3, v3))
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v4 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = objc_msgSend_debugName(self, v5, v6, v7, v8, v9);
        *(_DWORD *)buf = 138412290;
        v22 = v10;
        _os_log_impl(&dword_1C492D000, v4, OS_LOG_TYPE_DEBUG, "%@: result changed, will dispatch to main queue to notify the delegate.", buf, 0xCu);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1C4B438E4;
      block[3] = &unk_1E64E16D8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      if (qword_1EA3CA000 != -1) {
        dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
      }
      uint64_t v11 = (id)qword_1EA3C9FA0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = objc_msgSend_debugName(self, v12, v13, v14, v15, v16);
        if (self->__queryActive) {
          uint64_t v18 = @"Y";
        }
        else {
          uint64_t v18 = @"N";
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        *(_DWORD *)buf = 138412802;
        v22 = v17;
        __int16 v23 = 2112;
        v24 = v18;
        __int16 v25 = 2048;
        id v26 = WeakRetained;
        _os_log_impl(&dword_1C492D000, v11, OS_LOG_TYPE_DEBUG, "%@: result changed, but cannot notify delegate. queryActive: %@, delegate %p.", buf, 0x20u);
      }
    }
  }
}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 1;
}

- (id)q_sessionResult
{
  return self->_currentProcessingSessionResult;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (NSString)debugName
{
  return (NSString *)objc_msgSend_stringWithFormat_(NSString, a2, @"Query %p", v2, v3, v4, self);
}

@end