@interface ASDMediaClipTask
+ (AMSBagKeySet)bagKeySet;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSProcessInfo)clientInfo;
- (ASDMediaClipTask)initWithClientID:(id)a3 bag:(id)a4;
- (NSNumber)externalVersionID;
- (NSString)bundleID;
- (id)perform;
- (void)setBundleID:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setExternalVersionID:(id)a3;
@end

@implementation ASDMediaClipTask

- (ASDMediaClipTask)initWithClientID:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ASDMediaClipTask;
  v9 = [(AMSTask *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bag, a4);
    objc_storeStrong((id *)&v10->_clientID, a3);
    v11 = NSString;
    v12 = +[NSUUID asd_generateLogKey]();
    uint64_t v13 = [v11 stringWithFormat:@"MCT/%@", v12];
    logKey = v10->_logKey;
    v10->_logKey = (NSString *)v13;

    v15 = ASDLogHandleForCategory(31);
    v10->_signpostID = os_signpost_id_make_with_pointer(v15, v10);
  }
  return v10;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__ASDMediaClipTask_perform__block_invoke;
  v4[3] = &unk_1E58B4168;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithBlock:v4];
  return v2;
}

id __27__ASDMediaClipTask_perform__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  v4 = ASDLogHandleForCategory(31);
  v5 = v4;
  os_signpost_id_t v6 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19BF6A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Clip::MediaAPI/Prepare", (const char *)&unk_19BFFD5A6, buf, 2u);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    id v8 = -[ASDMediaClipTaskURLBuilder initWithBundleID:bag:]((id *)[ASDMediaClipTaskURLBuilder alloc], *(void **)(v7 + 80), *(void **)(v7 + 48));
    if (*(void *)(v7 + 96))
    {
      v9 = ASDLogHandleForCategory(13);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(v7 + 64);
        v37 = *(void **)(v7 + 96);
        *(_DWORD *)buf = 138543618;
        uint64_t v49 = v36;
        __int16 v50 = 2114;
        id v51 = v37;
        _os_log_error_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Requesting specific version (unsupported in production) %{public}@", buf, 0x16u);
      }

      -[ASDMediaClipTaskURLBuilder setExternalVersionID:]((uint64_t)v8, *(void **)(v7 + 96));
    }
    v10 = -[ASDMediaClipTaskURLBuilder build](v8);
  }
  else
  {
    v10 = 0;
  }
  id v47 = 0;
  v11 = [v10 resultWithTimeout:&v47 error:30.0];
  id v12 = v47;
  if (!v11)
  {
    v29 = 0;
    if (!a2) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }
  v43 = v10;
  v44 = a2;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F4DD48]) initWithClientIdentifier:*(void *)(*(void *)(a1 + 32) + 56) bag:*(void *)(*(void *)(a1 + 32) + 48)];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F4DD30]) initWithTokenService:v13 bag:*(void *)(*(void *)(a1 + 32) + 48)];
  [v14 setClientInfo:*(void *)(*(void *)(a1 + 32) + 88)];
  [v14 setLogKey:*(void *)(*(void *)(a1 + 32) + 64)];
  v15 = objc_alloc_init(ASDMediaClipTaskResponseDecoder);
  uint64_t v16 = [objc_alloc(MEMORY[0x1E4F4DD28]) initWithTokenService:v13];
  id v17 = objc_alloc(MEMORY[0x1E4F4DE88]);
  v18 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
  v19 = (void *)[v17 initWithConfiguration:v18];

  v40 = (void *)v16;
  [v19 setProtocolHandler:v16];
  v41 = v15;
  [v19 setResponseDecoder:v15];
  v42 = v13;
  [v13 setSession:v19];
  [v14 requestWithComponents:v11];
  v39 = id v46 = v12;
  v20 = [v39 resultWithTimeout:&v46 error:60.0];
  id v21 = v46;

  v22 = ASDLogHandleForCategory(31);
  v23 = v22;
  os_signpost_id_t v24 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19BF6A000, v23, OS_SIGNPOST_INTERVAL_END, v24, "Clip::MediaAPI/Prepare", (const char *)&unk_19BFFD5A6, buf, 2u);
  }

  a2 = v44;
  if (!v20) {
    goto LABEL_22;
  }
  v25 = ASDLogHandleForCategory(31);
  v26 = v25;
  os_signpost_id_t v27 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19BF6A000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Clip::MediaAPI/Request", (const char *)&unk_19BFFD5A6, buf, 2u);
  }

  v28 = [v19 dataTaskPromiseWithRequest:v20];
  id v45 = v21;
  v29 = [v28 resultWithTimeout:&v45 error:60.0];
  id v30 = v45;

  v31 = ASDLogHandleForCategory(31);
  v32 = v31;
  os_signpost_id_t v33 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19BF6A000, v32, OS_SIGNPOST_INTERVAL_END, v33, "Clip::MediaAPI/Request", (const char *)&unk_19BFFD5A6, buf, 2u);
  }

  id v21 = v30;
  a2 = v44;
  if (!v29)
  {
LABEL_22:
    v34 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v38 = *(void *)(*(void *)(a1 + 32) + 64);
      *(_DWORD *)buf = 138543618;
      uint64_t v49 = v38;
      __int16 v50 = 2114;
      id v51 = v21;
      _os_log_error_impl(&dword_19BF6A000, v34, OS_LOG_TYPE_ERROR, "[%{public}@] Media API request failed: %{public}@", buf, 0x16u);
    }

    v29 = 0;
  }

  id v12 = v21;
  v10 = v43;
  if (a2)
  {
LABEL_28:
    if (!v29) {
      *a2 = v12;
    }
  }
LABEL_30:

  return v29;
}

+ (AMSBagKeySet)bagKeySet
{
  return (AMSBagKeySet *)[MEMORY[0x1E4F4DD40] bagKeySet];
}

+ (NSString)bagSubProfile
{
  return (NSString *)[MEMORY[0x1E4F4DD40] bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return (NSString *)[MEMORY[0x1E4F4DD40] bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  v3 = (void *)MEMORY[0x1E4F4DBD8];
  v4 = [a1 bagSubProfile];
  v5 = [a1 bagSubProfileVersion];
  os_signpost_id_t v6 = [v3 bagForProfile:v4 profileVersion:v5];

  return v6;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSNumber)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end