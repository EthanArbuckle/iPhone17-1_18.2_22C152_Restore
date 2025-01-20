@interface CKDMarkAssetBrokenURLRequestWrapperOperation
- (BOOL)shouldCheckAppVersion;
- (CKDMarkAssetBrokenURLRequest)urlRequest;
- (id)activityCreate;
- (int)operationType;
- (void)main;
- (void)setUrlRequest:(id)a3;
@end

@implementation CKDMarkAssetBrokenURLRequestWrapperOperation

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/break-assets-url-request-wrapper", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (int)operationType
{
  return 901;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (void)main
{
  objc_initWeak(&location, self);
  v5 = objc_msgSend_urlRequest(self, v3, v4);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = sub_1C4F7ABA8;
  v21 = &unk_1E64F09E0;
  objc_copyWeak(&v22, &location);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)&v18);

  v9 = objc_msgSend_urlRequest(self, v7, v8, v18, v19, v20, v21);
  objc_msgSend_setRequest_(self, v10, (uint64_t)v9);

  v13 = objc_msgSend_container(self, v11, v12);
  v16 = objc_msgSend_urlRequest(self, v14, v15);
  objc_msgSend_performRequest_(v13, v17, (uint64_t)v16);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (CKDMarkAssetBrokenURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end