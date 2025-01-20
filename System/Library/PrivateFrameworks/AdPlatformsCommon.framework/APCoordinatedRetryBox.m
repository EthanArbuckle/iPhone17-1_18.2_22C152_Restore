@interface APCoordinatedRetryBox
- (APCoordinatedRetryBox)initWithType:(int64_t)a3 delegate:(id)a4;
- (APRequestCoordinatorDelegate)requestDelegate;
- (BOOL)canRetry;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)diagnosticReportPayload;
- (NSUUID)requestID;
- (NSUUID)requesterID;
- (int64_t)requestType;
- (void)setCanRetry:(BOOL)a3;
@end

@implementation APCoordinatedRetryBox

- (APCoordinatedRetryBox)initWithType:(int64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)APCoordinatedRetryBox;
  v7 = [(APCoordinatedRetryBox *)&v26 init];
  v8 = v7;
  if (v7)
  {
    v7->_requestType = a3;
    objc_storeWeak((id *)&v7->_requestDelegate, v6);
    v8->_canRetry = 1;
    uint64_t v15 = objc_msgSend_UUID(MEMORY[0x263F08C38], v9, v10, v11, v12, v13, v14);
    requestID = v8->_requestID;
    v8->_requestID = (NSUUID *)v15;

    uint64_t v23 = objc_msgSend_requesterID(v6, v17, v18, v19, v20, v21, v22);
    requesterID = v8->_requesterID;
    v8->_requesterID = (NSUUID *)v23;
  }
  return v8;
}

- (NSDictionary)diagnosticReportPayload
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v4 = NSNumber;
  uint64_t v11 = objc_msgSend_requestType(self, v5, v6, v7, v8, v9, v10);
  v17 = objc_msgSend_numberWithInteger_(v4, v12, v11, v13, v14, v15, v16);
  objc_msgSend_setObject_forKey_(v3, v18, (uint64_t)v17, @"kAPCoordinatedRetryBoxRequestType", v19, v20, v21);

  double v22 = NSNumber;
  uint64_t canRetry = objc_msgSend_canRetry(self, v23, v24, v25, v26, v27, v28);
  v35 = objc_msgSend_numberWithBool_(v22, v30, canRetry, v31, v32, v33, v34);
  objc_msgSend_setObject_forKey_(v3, v36, (uint64_t)v35, @"kAPCoordinatedRetryBoxCanRetry", v37, v38, v39);

  v46 = objc_msgSend_requestID(self, v40, v41, v42, v43, v44, v45);

  if (v46)
  {
    v53 = objc_msgSend_requestID(self, v47, v48, v49, v50, v51, v52);
    objc_msgSend_setObject_forKey_(v3, v54, (uint64_t)v53, @"kAPCoordinatedRetryBoxRequestID", v55, v56, v57);
  }
  v58 = objc_msgSend_requesterID(self, v47, v48, v49, v50, v51, v52);

  if (v58)
  {
    v65 = objc_msgSend_requesterID(self, v59, v60, v61, v62, v63, v64);
    objc_msgSend_setObject_forKey_(v3, v66, (uint64_t)v65, @"kAPCoordinatedRetryBoxRequesterID", v67, v68, v69);
  }
  v70 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v59, (uint64_t)v3, v61, v62, v63, v64);

  return (NSDictionary *)v70;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v11 = objc_msgSend_requestID(self, v5, v6, v7, v8, v9, v10);
    uint64_t v18 = objc_msgSend_requestID(v4, v12, v13, v14, v15, v16, v17);
    char isEqual = objc_msgSend_isEqual_(v11, v19, (uint64_t)v18, v20, v21, v22, v23);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (APRequestCoordinatorDelegate)requestDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_requestDelegate);
  return (APRequestCoordinatorDelegate *)WeakRetained;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (BOOL)canRetry
{
  return self->_canRetry;
}

- (void)setCanRetry:(BOOL)a3
{
  self->_uint64_t canRetry = a3;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (NSUUID)requesterID
{
  return self->_requesterID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_destroyWeak((id *)&self->_requestDelegate);
}

@end