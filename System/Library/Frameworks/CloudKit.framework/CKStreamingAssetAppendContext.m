@interface CKStreamingAssetAppendContext
+ (id)requestToAppendSegmentData:(id)a3 uploadURL:(id)a4 requestUUID:(id)a5 offset:(unint64_t)a6;
- (BOOL)appendSegmentWithData:(id)a3 error:(id *)a4;
- (BOOL)appendSegmentWithData:(id)a3 newStreamingAsset:(id *)a4 error:(id *)a5;
- (BOOL)fakeMissingUploadReceipt;
- (BOOL)isAppending;
- (BOOL)isCurrentAppendCancelled;
- (CKStreamingAsset)streamingAsset;
- (CKStreamingAssetAppendContext)init;
- (CKStreamingAssetAppendContext)initWithStreamingAsset:(id)a3;
- (NSString)description;
- (NSString)requestUUID;
- (NSURLSessionDataTask)dataTask;
- (OS_dispatch_queue)appendQueue;
- (OS_dispatch_queue)callbackQueue;
- (OS_os_activity)osActivity;
- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5;
- (id)completionHandler;
- (unint64_t)currentSegmentLength;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)abort;
- (void)appendSegmentWithData:(id)a3 completionHandler:(id)a4;
- (void)setAppending:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentAppendCancelled:(BOOL)a3;
- (void)setCurrentSegmentLength:(unint64_t)a3;
- (void)setDataTask:(id)a3;
- (void)setFakeMissingUploadReceipt:(BOOL)a3;
- (void)setOsActivity:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation CKStreamingAssetAppendContext

- (CKStreamingAssetAppendContext)init
{
  v2 = [CKException alloc];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v7 = (id)objc_msgSend_initWithName_format_(v2, v6, v3, @"-[%@ init] is unavailable", v5);

  objc_exception_throw(v7);
}

- (CKStreamingAssetAppendContext)initWithStreamingAsset:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKStreamingAssetAppendContext;
  v6 = [(CKStreamingAssetAppendContext *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_streamingAsset, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cloudkit.streaming-asset.append-context.append", v8);
    appendQueue = v7->_appendQueue;
    v7->_appendQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.cloudkit.streaming-asset.append-context.callback", v11);
    callbackQueue = v7->_callbackQueue;
    v7->_callbackQueue = (OS_dispatch_queue *)v12;
  }
  return v7;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKStreamingAssetAppendContext *, char *))MEMORY[0x1F4181798])(self, sel_CKDescription);
}

- (id)CKDescriptionPropertiesWithPublic:(BOOL)a3 private:(BOOL)a4 shouldExpand:(BOOL)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v13 = objc_msgSend_streamingAsset(self, v7, v8, v9);
  if (v13) {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v6, v10, @"streamingAsset", (uint64_t)v13);
  }
  objc_super v15 = objc_msgSend_dataTask(self, v10, v11, v12);
  if (v15) {
    objc_msgSend_CKAddPropertySafelyForKey_value_(v6, v14, @"dataTask", (uint64_t)v15);
  }

  return v6;
}

- (BOOL)appendSegmentWithData:(id)a3 error:(id *)a4
{
  return MEMORY[0x1F4181798](self, sel_appendSegmentWithData_newStreamingAsset_error_, a3, 0);
}

- (BOOL)appendSegmentWithData:(id)a3 newStreamingAsset:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_18AF13F78;
  v28 = sub_18AF13948;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_18AF13F78;
  v22 = sub_18AF13948;
  id v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B10049C;
  v14[3] = &unk_1E54649E0;
  v16 = &v18;
  v17 = &v24;
  v10 = v9;
  objc_super v15 = v10;
  objc_msgSend_appendSegmentWithData_completionHandler_(self, v11, (uint64_t)v8, (uint64_t)v14);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5) {
    *a5 = (id) v25[5];
  }
  if (a4) {
    *a4 = (id) v19[5];
  }
  BOOL v12 = v25[5] == 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (void)appendSegmentWithData:(id)a3 completionHandler:(id)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v69 = 0;
  char v8 = _CKCheckArgument((uint64_t)"data", v6, 0, 0, 0, &v69);
  id v9 = v69;
  v10 = v9;
  if ((v8 & 1) == 0)
  {
    v38 = [CKException alloc];
    uint64_t v42 = objc_msgSend_code(v10, v39, v40, v41);
    v46 = objc_msgSend_localizedDescription(v10, v43, v44, v45);
    id v48 = (id)objc_msgSend_initWithCode_format_(v38, v47, v42, @"%@", v46);

    objc_exception_throw(v48);
  }

  uint64_t v11 = _Block_copy(v7);
  id v68 = 0;
  char v12 = _CKCheckArgument((uint64_t)"completionHandler", v11, 0, 0, 0, &v68);
  id v13 = v68;

  if ((v12 & 1) == 0)
  {
    v49 = [CKException alloc];
    uint64_t v53 = objc_msgSend_code(v13, v50, v51, v52);
    v57 = objc_msgSend_localizedDescription(v13, v54, v55, v56);
    id v59 = (id)objc_msgSend_initWithCode_format_(v49, v58, v53, @"%@", v57);

    objc_exception_throw(v59);
  }

  v14 = _os_activity_create(&dword_18AF10000, "client/streaming-asset-append", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  uint64_t v18 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v15, v16, v17);
  v22 = objc_msgSend_UUIDString(v18, v19, v20, v21);

  if (ck_log_initialization_predicate != -1) {
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v23 = (id)ck_log_facility_ck;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v37 = objc_msgSend_length(v6, v24, v25, v26);
    *(_DWORD *)buf = 134218498;
    uint64_t v71 = v37;
    __int16 v72 = 2112;
    v73 = self;
    __int16 v74 = 2114;
    v75 = v22;
    _os_log_debug_impl(&dword_18AF10000, v23, OS_LOG_TYPE_DEBUG, "Appending segment of length %ld to %@ with requestUUID %{public}@", buf, 0x20u);
  }

  if (objc_msgSend_length(v6, v27, v28, v29))
  {
    v33 = objc_msgSend_appendQueue(self, v30, v31, v32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_18B1009F8;
    block[3] = &unk_1E5464A08;
    block[4] = self;
    id v64 = v7;
    id v61 = v6;
    id v62 = v22;
    v63 = v14;
    id v34 = v7;
    dispatch_async(v33, block);
  }
  else
  {
    v35 = objc_msgSend_callbackQueue(self, v30, v31, v32);
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = sub_18B100974;
    v65[3] = &unk_1E5462200;
    id v66 = v7;
    id v36 = v7;
    dispatch_async(v35, v65);
  }
  os_activity_scope_leave(&state);
}

+ (id)requestToAppendSegmentData:(id)a3 uploadURL:(id)a4 requestUUID:(id)a5 offset:(unint64_t)a6
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v9 = (objc_class *)MEMORY[0x1E4F28E88];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 alloc];
  uint64_t v16 = objc_msgSend_initWithURL_(v13, v14, (uint64_t)v11, v15);

  objc_msgSend_setHTTPMethod_(v16, v17, @"PUT", v18);
  objc_msgSend_setValue_forHTTPHeaderField_(v16, v19, (uint64_t)v10, @"X-Apple-Request-UUID");

  objc_msgSend_setValue_forHTTPHeaderField_(v16, v20, @"1", @"x-apple-sa-version");
  id v23 = objc_msgSend_stringWithFormat_(NSString, v21, @"%lu", v22, a6);
  objc_msgSend_setValue_forHTTPHeaderField_(v16, v24, (uint64_t)v23, @"x-apple-sa-offset");
  uint64_t v25 = objc_alloc_init(CKDPStreamingAssetFooter);
  objc_msgSend_setStatus_(v25, v26, 0, v27);
  id v28 = v12;
  uint64_t v32 = (const void *)objc_msgSend_bytes(v28, v29, v30, v31);
  CC_LONG v36 = objc_msgSend_length(v28, v33, v34, v35);
  CC_MD5(v32, v36, md);
  v38 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v37, (uint64_t)md, 16);
  objc_msgSend_setMd5_(v25, v39, (uint64_t)v38, v40);

  uint64_t v44 = objc_msgSend_data(v25, v41, v42, v43);
  uint64_t v48 = objc_msgSend_length(v44, v45, v46, v47);
  unsigned int v84 = bswap32(v48);
  v50 = objc_msgSend_dataWithBytes_length_(MEMORY[0x1E4F1C9B8], v49, (uint64_t)&v84, 4);
  id v51 = objc_alloc(MEMORY[0x1E4F1CA58]);
  uint64_t v55 = objc_msgSend_length(v28, v52, v53, v54);
  uint64_t v59 = objc_msgSend_length(v44, v56, v57, v58);
  uint64_t v63 = objc_msgSend_length(v50, v60, v61, v62);
  id v66 = objc_msgSend_initWithCapacity_(v51, v64, v59 + v55 + v63, v65);
  objc_msgSend_appendData_(v66, v67, (uint64_t)v28, v68);

  objc_msgSend_appendData_(v66, v69, (uint64_t)v44, v70);
  objc_msgSend_appendData_(v66, v71, (uint64_t)v50, v72);
  v75 = objc_msgSend_inputStreamWithData_(MEMORY[0x1E4F1CA10], v73, (uint64_t)v66, v74);
  objc_msgSend_setHTTPBodyStream_(v16, v76, (uint64_t)v75, v77);
  if (v48 >= 0x801)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    v78 = ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v86 = v48;
      _os_log_debug_impl(&dword_18AF10000, v78, OS_LOG_TYPE_DEBUG, "Overriding max footer length with %u", buf, 8u);
    }
    v81 = objc_msgSend_stringWithFormat_(NSString, v79, @"%u", v80, v48);
    objc_msgSend_setValue_forHTTPHeaderField_(v16, v82, (uint64_t)v81, @"x-apple-sa-footer-max-size");
  }

  return v16;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v12 = objc_msgSend_appendQueue(self, v9, v10, v11);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B101450;
  block[3] = &unk_1E54614E0;
  block[4] = self;
  id v16 = v8;
  id v17 = v7;
  id v13 = v7;
  id v14 = v8;
  dispatch_async(v12, block);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  id v9 = (void (**)(id, void))a5;
  objc_msgSend_cancel(a4, v6, v7, v8);
  v9[2](v9, 0);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)abort
{
  id v5 = objc_msgSend_appendQueue(self, a2, v2, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_18B102810;
  block[3] = &unk_1E5460350;
  block[4] = self;
  dispatch_sync(v5, block);
}

- (CKStreamingAsset)streamingAsset
{
  return self->_streamingAsset;
}

- (OS_dispatch_queue)appendQueue
{
  return self->_appendQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (BOOL)isAppending
{
  return self->_appending;
}

- (void)setAppending:(BOOL)a3
{
  self->_appending = a3;
}

- (BOOL)isCurrentAppendCancelled
{
  return self->_currentAppendCancelled;
}

- (void)setCurrentAppendCancelled:(BOOL)a3
{
  self->_currentAppendCancelled = a3;
}

- (unint64_t)currentSegmentLength
{
  return self->_currentSegmentLength;
}

- (void)setCurrentSegmentLength:(unint64_t)a3
{
  self->_currentSegmentLength = a3;
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (void)setDataTask:(id)a3
{
}

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (OS_os_activity)osActivity
{
  return self->_osActivity;
}

- (void)setOsActivity:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)fakeMissingUploadReceipt
{
  return self->_fakeMissingUploadReceipt;
}

- (void)setFakeMissingUploadReceipt:(BOOL)a3
{
  self->_fakeMissingUploadReceipt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_osActivity, 0);
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_appendQueue, 0);

  objc_storeStrong((id *)&self->_streamingAsset, 0);
}

@end