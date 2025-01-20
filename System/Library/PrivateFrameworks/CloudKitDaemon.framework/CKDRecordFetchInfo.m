@interface CKDRecordFetchInfo
- (BOOL)ignoreErrors;
- (CKDRecordFetchInfo)initWithAggregator:(id)a3;
- (CKRecord)record;
- (CKRecordID)recordID;
- (NSError)error;
- (NSString)etag;
- (OS_dispatch_source)recordReadySource;
- (double)startDate;
- (id)CKPropertiesDescription;
- (id)completionBlock;
- (id)description;
- (unint64_t)fetchOrder;
- (unint64_t)state;
- (void)performCallback;
- (void)setCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setEtag:(id)a3;
- (void)setFetchOrder:(unint64_t)a3;
- (void)setIgnoreErrors:(BOOL)a3;
- (void)setRecord:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordReadySource:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CKDRecordFetchInfo

- (CKDRecordFetchInfo)initWithAggregator:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKDRecordFetchInfo;
  v7 = [(CKDRecordFetchInfo *)&v14 init];
  if (v7)
  {
    uint64_t v8 = objc_msgSend_recordReadySource(v4, v5, v6);
    recordReadySource = v7->_recordReadySource;
    v7->_recordReadySource = (OS_dispatch_source *)v8;

    objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v10, v11);
    v7->_startDate = v12;
  }

  return v7;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  if (a3 == 3)
  {
    v3 = objc_msgSend_recordReadySource(self, a2, 3);
    dispatch_source_merge_data(v3, 1uLL);
  }
}

- (void)performCallback
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_state(self, a2, v2) != 3)
  {
    v39 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v5, v6);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, @"CKDRecordFetchAggregator.m", 129, @"Fetch info isn't in the needs callback state: %@", self);
  }
  v9 = objc_msgSend_record(self, v5, v6);
  if (v9) {
    goto LABEL_4;
  }
  double v12 = objc_msgSend_error(self, v7, v8);

  if (!v12)
  {
    v9 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v10, v11);
    v37 = objc_msgSend_recordID(self, v35, v36);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v38, (uint64_t)a2, self, @"CKDRecordFetchAggregator.m", 130, @"Calling back for record %@ without a fetched record or an error: %@", v37, self);

LABEL_4:
  }
  v13 = objc_msgSend_completionBlock(self, v10, v11);

  if (v13)
  {
    objc_msgSend_completionBlock(self, v14, v15);
    v16 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_recordID(self, v17, v18);
    v24 = objc_msgSend_error(self, v20, v21);
    if (v24 && !objc_msgSend_ignoreErrors(self, v22, v23))
    {
      int v26 = 0;
      v25 = 0;
    }
    else
    {
      v25 = objc_msgSend_record(self, v22, v23);
      int v26 = 1;
    }
    v33 = objc_msgSend_error(self, v22, v23);
    ((void (**)(void, void *, void *, void *))v16)[2](v16, v19, v25, v33);

    if (v26) {
    objc_msgSend_setCompletionBlock_(self, v34, 0);
    }
  }
  else
  {
    if (*MEMORY[0x1E4F1A550] != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v27 = (void *)*MEMORY[0x1E4F1A500];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_INFO))
    {
      v29 = v27;
      v32 = objc_msgSend_recordID(self, v30, v31);
      *(_DWORD *)buf = 138412290;
      v42 = v32;
      _os_log_impl(&dword_1C4CFF000, v29, OS_LOG_TYPE_INFO, "Warn: No completion block was set for the fetch of record %@", buf, 0xCu);
    }
  }
  objc_msgSend_setState_(self, v28, 4);
}

- (id)CKPropertiesDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = NSString;
  uint64_t Order = objc_msgSend_fetchOrder(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v4, v8, @"fetchOrder=%lu", Order);
  objc_msgSend_addObject_(v3, v10, (uint64_t)v9);

  v13 = objc_msgSend_recordID(self, v11, v12);

  if (v13)
  {
    v16 = NSString;
    v17 = objc_msgSend_recordID(self, v14, v15);
    v20 = objc_msgSend_ckShortDescription(v17, v18, v19);
    v22 = objc_msgSend_stringWithFormat_(v16, v21, @"recordID=%@", v20);
    objc_msgSend_addObject_(v3, v23, (uint64_t)v22);
  }
  v24 = NSString;
  uint64_t v25 = objc_msgSend_state(self, v14, v15);
  if ((unint64_t)(v25 - 1) > 3) {
    objc_msgSend_stringWithFormat_(v24, v26, @"state=%@", @"Not Started");
  }
  else {
  v27 = objc_msgSend_stringWithFormat_(v24, v26, @"state=%@", off_1E64F6360[v25 - 1]);
  }
  objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

  v29 = NSString;
  v33 = objc_msgSend_record(self, v30, v31);
  v34 = @"YES";
  if (!v33) {
    v34 = @"NO";
  }
  v35 = objc_msgSend_stringWithFormat_(v29, v32, @"hasRecord=%@", v34);
  objc_msgSend_addObject_(v3, v36, (uint64_t)v35);

  v37 = NSString;
  v40 = objc_msgSend_etag(self, v38, v39);
  v42 = objc_msgSend_stringWithFormat_(v37, v41, @"etag=%@", v40);
  objc_msgSend_addObject_(v3, v43, (uint64_t)v42);

  v46 = objc_msgSend_error(self, v44, v45);

  if (v46)
  {
    v49 = NSString;
    v50 = objc_msgSend_error(self, v47, v48);
    v52 = objc_msgSend_stringWithFormat_(v49, v51, @"error=%@", v50);
    objc_msgSend_addObject_(v3, v53, (uint64_t)v52);
  }
  v54 = objc_msgSend_componentsJoinedByString_(v3, v47, @", ");

  return v54;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDRecordFetchInfo *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (double)startDate
{
  return self->_startDate;
}

- (unint64_t)fetchOrder
{
  return self->_fetchOrder;
}

- (void)setFetchOrder:(unint64_t)a3
{
  self->_fetchuint64_t Order = a3;
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (OS_dispatch_source)recordReadySource
{
  return self->_recordReadySource;
}

- (void)setRecordReadySource:(id)a3
{
}

- (BOOL)ignoreErrors
{
  return self->_ignoreErrors;
}

- (void)setIgnoreErrors:(BOOL)a3
{
  self->_ignoreErrors = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordReadySource, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
}

@end