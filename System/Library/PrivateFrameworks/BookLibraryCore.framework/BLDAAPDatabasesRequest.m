@interface BLDAAPDatabasesRequest
- (BLDAAPDatabasesRequest)initWithDSID:(id)a3 reason:(int64_t)a4 sessionID:(id)a5 revisionNumber:(id)a6 delta:(id)a7;
- (NSNumber)delta;
- (void)setDelta:(id)a3;
@end

@implementation BLDAAPDatabasesRequest

- (BLDAAPDatabasesRequest)initWithDSID:(id)a3 reason:(int64_t)a4 sessionID:(id)a5 revisionNumber:(id)a6 delta:(id)a7
{
  v61[3] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v49.receiver = self;
  v49.super_class = (Class)BLDAAPDatabasesRequest;
  v16 = [(BLDAAPURLRequest *)&v49 initWithDSID:v12 reason:a4];
  v19 = v16;
  if (!v16) {
    goto LABEL_8;
  }
  if (v12 && a4 && v13 && v14 && v15)
  {
    objc_msgSend_setDaapURL_(v16, v17, @"databases", v18);
    objc_msgSend_setContentType_(v19, v20, 1, v21);
    objc_msgSend_setDelta_(v19, v22, (uint64_t)v15, v23);
    v24 = NSURL;
    v60[0] = @"session-id";
    v48 = objc_msgSend_stringValue(v13, v25, v26, v27);
    v61[0] = v48;
    v60[1] = @"revision-number";
    v31 = objc_msgSend_stringValue(v14, v28, v29, v30);
    v61[1] = v31;
    v60[2] = @"delta";
    v35 = objc_msgSend_stringValue(v15, v32, v33, v34);
    v61[2] = v35;
    v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)v61, (uint64_t)v60, 3);
    v39 = objc_msgSend_bu_queryStringForDictionary_escapedValues_(v24, v38, (uint64_t)v37, 0);
    v42 = objc_msgSend_dataUsingEncoding_(v39, v40, 4, v41);
    objc_msgSend_setBody_(v19, v43, (uint64_t)v42, v44);

LABEL_8:
    v45 = v19;
    goto LABEL_12;
  }
  v46 = BLJaliscoLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138413314;
    id v51 = v12;
    __int16 v52 = 2048;
    int64_t v53 = a4;
    __int16 v54 = 2114;
    id v55 = v13;
    __int16 v56 = 2114;
    id v57 = v14;
    __int16 v58 = 2114;
    id v59 = v15;
    _os_log_impl(&dword_21DFE3000, v46, OS_LOG_TYPE_ERROR, "BLDAAPDatabasesRequest init failed: Missing a parameter type. dsid:(%@) reason:(%ld) sessionID: %{public}@ revisionNumber:%{public}@ delta:%{public}@", buf, 0x34u);
  }

  v45 = 0;
LABEL_12:

  return v45;
}

- (NSNumber)delta
{
  return self->_delta;
}

- (void)setDelta:(id)a3
{
}

- (void).cxx_destruct
{
}

@end