@interface CKDFetchTranscodeServerPublicKeyOperation
+ (__SecPolicy)createTranscodeServerTrustPolicy;
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (CKDFetchTranscodeServerPublicKeyOperation)initWithOperationInfo:(id)a3 container:(id)a4;
- (CKPublicKey)transcodeServerPublicKey;
- (NSString)transcodeServerHostname;
- (NSURL)transcodeServerPublicKeyURL;
- (id)activityCreate;
- (int64_t)type;
- (void)determineTranscodeServerPublicKeyURL;
- (void)fetchCachedTranscodePublicKey;
- (void)fetchRemoteTranscodePublicKey;
- (void)main;
- (void)setTranscodeServerPublicKey:(id)a3;
- (void)setTranscodeServerPublicKeyURL:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation CKDFetchTranscodeServerPublicKeyOperation

- (CKDFetchTranscodeServerPublicKeyOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKDFetchTranscodeServerPublicKeyOperation;
  v9 = [(CKDOperation *)&v15 initWithOperationInfo:v6 container:a4];
  if (v9)
  {
    uint64_t v10 = objc_msgSend_transcodeServerHostname(v6, v7, v8);
    transcodeServerHostname = v9->_transcodeServerHostname;
    v9->_transcodeServerHostname = (NSString *)v10;

    v9->_type = objc_msgSend_type(v6, v12, v13);
  }

  return v9;
}

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/fetch-public-key", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (void)main
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v11 = v3;
    v12 = (objc_class *)objc_opt_class();
    uint64_t v13 = NSStringFromClass(v12);
    objc_super v15 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v14, 1, 0, 0);
    v18 = objc_msgSend_CKPropertiesStyleString(v15, v16, v17);
    v20 = objc_msgSend_CKDescriptionPropertiesWithPublic_private_shouldExpand_(self, v19, 0, 1, 0);
    v23 = objc_msgSend_CKPropertiesStyleString(v20, v21, v22);
    *(_DWORD *)buf = 138544130;
    v25 = v13;
    __int16 v26 = 2048;
    v27 = self;
    __int16 v28 = 2114;
    v29 = v18;
    __int16 v30 = 2112;
    v31 = v23;
    _os_log_debug_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_DEBUG, "Starting  <%{public}@: %p; %{public}@, %@>",
      buf,
      0x2Au);
  }
  if (!objc_msgSend_type(self, v4, v5))
  {
    uint64_t v8 = objc_msgSend_transcodeServerHostname(self, v6, v7);

    if (!v8)
    {
      v9 = objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E4F1A280], v6, *MEMORY[0x1E4F19DD8], 1017, @"Operation %@ was not provided a transcode server hostname", self);
      objc_msgSend_setError_(self, v10, (uint64_t)v9);
    }
  }
  objc_msgSend_makeStateTransition_(self, v6, 0);
}

- (void)determineTranscodeServerPublicKeyURL
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v4 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v19 = v5;
    uint64_t v22 = objc_msgSend_transcodeServerHostname(self, v20, v21);
    *(_DWORD *)buf = 138543362;
    v25 = v22;
    _os_log_debug_impl(&dword_1C4CFF000, v19, OS_LOG_TYPE_DEBUG, "Determining transcode server public key URL for hostname: %{public}@", buf, 0xCu);
  }
  if (*MEMORY[0x1E4F1A4E0]
    && (objc_msgSend_unitTestOverrides(self, v6, v7),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKeyedSubscript_(v8, v9, @"TranscodeServerPublicKeyURL"),
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v8,
        v10))
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl(&dword_1C4CFF000, v11, OS_LOG_TYPE_INFO, "Overriding transcode server public key URL to %@", buf, 0xCu);
    }
    uint64_t v13 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v12, (uint64_t)v10);
    objc_msgSend_setTranscodeServerPublicKeyURL_(self, v14, (uint64_t)v13);
  }
  else
  {
    objc_super v15 = objc_msgSend_stateTransitionGroup(self, v6, v7);
    dispatch_group_enter(v15);

    uint64_t v10 = objc_msgSend_sharedManager(CKDServerConfigurationManager, v16, v17);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1C4F03B3C;
    v23[3] = &unk_1E64F1CC8;
    v23[4] = self;
    objc_msgSend_configurationForOperation_completionHandler_(v10, v18, (uint64_t)self, v23);
  }
}

- (void)fetchCachedTranscodePublicKey
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1A550];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v4 = (os_log_t *)MEMORY[0x1E4F1A500];
  uint64_t v5 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v35 = v5;
    v38 = objc_msgSend_transcodeServerPublicKeyURL(self, v36, v37);
    int v43 = 138543362;
    v44 = v38;
    _os_log_debug_impl(&dword_1C4CFF000, v35, OS_LOG_TYPE_DEBUG, "Checking for cached transcode server public key for public key URL %{public}@", (uint8_t *)&v43, 0xCu);
  }
  uint64_t v8 = objc_msgSend_transcodeServerPublicKeyURL(self, v6, v7);
  v11 = objc_msgSend_absoluteString(v8, v9, v10);

  v14 = objc_msgSend_deviceContext(self, v12, v13);
  uint64_t v17 = objc_msgSend_metadataCache(v14, v15, v16);
  v19 = objc_msgSend_publicKeyOfType_withIdentifier_(v17, v18, @"transcodeServerPublicKey", v11);

  if (v19)
  {
    int hasExpired = objc_msgSend_hasExpired(v19, v20, v21);
    v23 = (void *)*MEMORY[0x1E4F1A548];
    if (hasExpired)
    {
      if (*v3 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      os_log_t v24 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
      {
        v39 = v24;
        v42 = objc_msgSend_expiration(v19, v40, v41);
        int v43 = 138543362;
        v44 = v42;
        _os_log_debug_impl(&dword_1C4CFF000, v39, OS_LOG_TYPE_DEBUG, "Found a cached transcode key, but it has expired on %{public}@. Clearing cached value and continuing with server fetch.", (uint8_t *)&v43, 0xCu);
      }
      v27 = objc_msgSend_deviceContext(self, v25, v26);
      __int16 v30 = objc_msgSend_metadataCache(v27, v28, v29);
      objc_msgSend_setPublicKey_ofType_withIdentifier_(v30, v31, 0, @"transcodeServerPublicKey", v11);
    }
    else
    {
      if (*v3 != -1) {
        dispatch_once(MEMORY[0x1E4F1A550], v23);
      }
      v33 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
      {
        int v43 = 138412290;
        v44 = v19;
        _os_log_debug_impl(&dword_1C4CFF000, v33, OS_LOG_TYPE_DEBUG, "Found a transcode public key %@", (uint8_t *)&v43, 0xCu);
      }
      objc_msgSend_setTranscodeServerPublicKey_(self, v34, (uint64_t)v19);
    }
  }
  else
  {
    if (*v3 != -1) {
      dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
    }
    uint64_t v32 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v43) = 0;
      _os_log_debug_impl(&dword_1C4CFF000, v32, OS_LOG_TYPE_DEBUG, "Couldn't find cached transcode public key", (uint8_t *)&v43, 2u);
    }
  }
}

- (void)fetchRemoteTranscodePublicKey
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1A550] != -1) {
    dispatch_once(MEMORY[0x1E4F1A550], (dispatch_block_t)*MEMORY[0x1E4F1A548]);
  }
  v3 = (void *)*MEMORY[0x1E4F1A500];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F1A500], OS_LOG_TYPE_DEBUG))
  {
    v31 = v3;
    v34 = objc_msgSend_transcodeServerPublicKeyURL(self, v32, v33);
    LODWORD(location[0]) = 138543362;
    *(id *)((char *)location + 4) = v34;
    _os_log_debug_impl(&dword_1C4CFF000, v31, OS_LOG_TYPE_DEBUG, "Fetching transcode server public key from URL %{public}@", (uint8_t *)location, 0xCu);
  }
  id v6 = objc_msgSend_stateTransitionGroup(self, v4, v5);
  dispatch_group_enter(v6);

  uint64_t v7 = objc_opt_class();
  TranscodeServerTrustPolicy = (const void *)objc_msgSend_createTranscodeServerTrustPolicy(v7, v8, v9);
  v11 = [CKDSignedServerPublicKeyURLRequest alloc];
  v14 = objc_msgSend_transcodeServerPublicKeyURL(self, v12, v13);
  uint64_t v16 = objc_msgSend_initWithOperation_plistURL_verifyWithPolicy_(v11, v15, (uint64_t)self, v14, TranscodeServerTrustPolicy);

  if (objc_msgSend_type(self, v17, v18) == 1)
  {
    objc_msgSend_setRequiresProtectionSource_(v16, v19, 1);
    objc_msgSend_setVerifyFullIntegers_(v16, v20, 1);
    v23 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v21, v22, 3600.0);
    objc_msgSend_setExpirationDateOverride_(v16, v24, (uint64_t)v23);
  }
  if (TranscodeServerTrustPolicy) {
    CFRelease(TranscodeServerTrustPolicy);
  }
  objc_initWeak(location, v16);
  uint64_t v35 = MEMORY[0x1E4F143A8];
  uint64_t v36 = 3221225472;
  uint64_t v37 = sub_1C4F04504;
  v38 = &unk_1E64F01E8;
  objc_copyWeak(&v40, location);
  v39 = self;
  objc_msgSend_setCompletionBlock_(v16, v25, (uint64_t)&v35);
  objc_msgSend_setRequest_(self, v26, (uint64_t)v16, v35, v36, v37, v38);
  uint64_t v29 = objc_msgSend_container(self, v27, v28);
  objc_msgSend_performRequest_(v29, v30, (uint64_t)v16);

  objc_destroyWeak(&v40);
  objc_destroyWeak(location);
}

- (BOOL)makeStateTransition
{
  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend_determineTranscodeServerPublicKeyURL(self, v6, v7);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_fetchCachedTranscodePublicKey(self, v8, v9);
      break;
    case 3:
      uint64_t v10 = objc_msgSend_transcodeServerPublicKey(self, v4, v5);

      if (v10) {
        goto LABEL_5;
      }
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_fetchRemoteTranscodePublicKey(self, v15, v16);
      break;
    case 4:
LABEL_5:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      uint64_t v13 = objc_msgSend_error(self, v11, v12);
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 - 2 >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___CKDFetchTranscodeServerPublicKeyOperation;
    objc_msgSendSuper2(&v5, sel_nameForState_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F5BF0[a3 - 2];
  }
  return v3;
}

+ (__SecPolicy)createTranscodeServerTrustPolicy
{
  return (__SecPolicy *)SecPolicyCreateApplePinned();
}

- (CKPublicKey)transcodeServerPublicKey
{
  return (CKPublicKey *)objc_getProperty(self, a2, 448, 1);
}

- (void)setTranscodeServerPublicKey:(id)a3
{
}

- (NSString)transcodeServerHostname
{
  return self->_transcodeServerHostname;
}

- (NSURL)transcodeServerPublicKeyURL
{
  return self->_transcodeServerPublicKeyURL;
}

- (void)setTranscodeServerPublicKeyURL:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcodeServerPublicKeyURL, 0);
  objc_storeStrong((id *)&self->_transcodeServerHostname, 0);
  objc_storeStrong((id *)&self->_transcodeServerPublicKey, 0);
}

@end