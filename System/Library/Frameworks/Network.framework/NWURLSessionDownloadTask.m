@interface NWURLSessionDownloadTask
- (BOOL)isKindOfClass:(Class)a3;
- (id)createResumeData;
- (id)errorWithResumeData:(id)a3;
- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:;
- (id)initWithResumeInfo:(uint64_t)a3 fromOffset:(int)a4 identifier:(void *)a5 session:;
- (void)cancelByProducingResumeData:(id)a3;
@end

@implementation NWURLSessionDownloadTask

- (id)initWithLoader:(int)a3 identifier:(void *)a4 session:
{
  id v8 = a2;
  if (a1)
  {
    v9 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, 0, a3, a4);
    v10 = v9;
    if (v9) {
      objc_storeStrong(v9 + 33, a2);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cancelByProducingResumeData:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->super._queue;
  }
  else {
    queue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke;
  v7[3] = &unk_1E524B950;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (*(void *)(v2 + 288) == 2)
    {
      v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v3();
      return;
    }
    id v4 = [NWURLError alloc];
    id v5 = *(id *)(v2 + 264);
    id v6 = (id)v2;
    if (v4)
    {
      uint64_t v7 = *MEMORY[0x1E4F289A0];
      v27.receiver = v4;
      v27.super_class = (Class)NWURLError;
      id v8 = (NWURLError *)objc_msgSendSuper2(&v27, sel_initWithDomain_code_userInfo_, v7, -999, 0);
      id v4 = v8;
      if (v8) {
        [(NWURLError *)v8 fillErrorForLoader:v5 andTask:v6];
      }
    }

    v9 = *(void **)(a1 + 32);
  }
  else
  {
    v9 = 0;
    id v4 = 0;
  }
  v10 = -[NWURLSessionDownloadTask createResumeData](v9);
  [(NWURLError *)v4 setDownloadTaskResumeData:v10];
  v12 = *(void **)(a1 + 32);
  if (v12 && (objc_setProperty_atomic_copy(v12, v11, v4, 136), (uint64_t v13 = *(void *)(a1 + 32)) != 0))
  {
    uint64_t v14 = 248;
    if (!*(void *)(v13 + 248)) {
      uint64_t v14 = 240;
    }
    v15 = (void **)*(id *)(v13 + v14);
  }
  else
  {
    v15 = 0;
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke_2;
  v24 = &unk_1E524B950;
  id v26 = *(id *)(a1 + 40);
  id v16 = v10;
  id v25 = v16;
  if (v15) {
    -[NWURLSessionDelegateQueue runDelegateBlock:](v15[6], &v21);
  }

  v17 = *(void **)(a1 + 32);
  if (v17) {
    v18 = (void *)v17[53];
  }
  else {
    v18 = 0;
  }
  id v19 = v18;
  v20 = objc_msgSend(v17, "error", v21, v22, v23, v24);
  [v19 task:v17 deliverData:0 complete:1 error:v20 completionHandler:&__block_literal_global_484];

  -[NWURLSessionTask complete](*(void *)(a1 + 32));
}

- (id)createResumeData
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = [a1 currentRequest];
    v3 = [v2 URL];
    id v4 = [v3 scheme];

    id v5 = v4;
    if ([v5 caseInsensitiveCompare:@"http"])
    {
      uint64_t v6 = [v5 caseInsensitiveCompare:@"https"];

      if (v6)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        uint64_t v7 = (id)gurlLogObj;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          __int16 v32 = 0;
          id v8 = "Cannot create download resume data for non-HTTP(S) request";
          v9 = (uint8_t *)&v32;
LABEL_14:
          _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, v8, v9, 2u);
          id v1 = 0;
LABEL_44:

          goto LABEL_45;
        }
        goto LABEL_15;
      }
    }
    else
    {
    }
    v10 = [v2 HTTPMethod];
    uint64_t v11 = [v10 caseInsensitiveCompare:@"GET"];

    if (v11)
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      uint64_t v7 = (id)gurlLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        id v8 = "Cannot create download resume data for non-GET request";
        v9 = buf;
        goto LABEL_14;
      }
LABEL_15:
      id v1 = 0;
      goto LABEL_44;
    }
    v12 = [v1 originalRequest];
    uint64_t v7 = [v12 valueForHTTPHeaderField:@"Range"];

    if (v7
      && ([v7 componentsSeparatedByString:@"-"],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          unint64_t v14 = [v13 count],
          v13,
          v14 >= 3))
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v15 = (id)gurlLogObj;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_40;
      }
      __int16 v30 = 0;
      id v16 = "Cannot create download resume data because original request has multiple ranges";
      v17 = (uint8_t *)&v30;
    }
    else
    {
      v18 = [v1 response];

      if (!v18)
      {
        if (__nwlog_url_log::onceToken != -1) {
          dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
        }
        v24 = (id)gurlLogObj;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_1830D4000, v24, OS_LOG_TYPE_DEBUG, "Creating download resume data with nil response", v29, 2u);
        }

        v15 = +[NWURLSessionDownloadResumeInfo infoWithTask:]((uint64_t)NWURLSessionDownloadResumeInfo, v1);
        -[NWURLSessionDownloadResumeInfo serialize]((uint64_t)v15);
        id v1 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_43;
      }
      id v19 = [v1 response];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v15 = [v1 response];
        uint64_t v21 = [v15 valueForHTTPHeaderField:@"ETag"];
        uint64_t v22 = [v15 valueForHTTPHeaderField:@"Last-Modified"];
        if (v21 | v22)
        {
          id v25 = +[NWURLSessionDownloadResumeInfo infoWithTask:]((uint64_t)NWURLSessionDownloadResumeInfo, v1);
          -[NWURLSessionDownloadResumeInfo serialize]((uint64_t)v25);
          id v1 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (__nwlog_url_log::onceToken != -1) {
            dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
          }
          v23 = (id)gurlLogObj;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)objc_super v27 = 0;
            _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_DEBUG, "Cannot create download resume data without ETag or Last-Modified", v27, 2u);
          }

          id v1 = 0;
        }

        goto LABEL_43;
      }
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      v15 = (id)gurlLogObj;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
LABEL_40:
        id v1 = 0;
LABEL_43:

        goto LABEL_44;
      }
      *(_WORD *)v28 = 0;
      id v16 = "Cannot create download resume data with non-HTTP response";
      v17 = v28;
    }
    _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_DEBUG, v16, v17, 2u);
    goto LABEL_40;
  }
LABEL_45:

  return v1;
}

uint64_t __56__NWURLSessionDownloadTask_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)errorWithResumeData:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v6 = v4;
  if (self)
  {
    uint64_t v6 = v4;
    if (v4)
    {
      uint64_t v6 = v4;
      if ([v4 code] != -999)
      {
        uint64_t v7 = [v5 downloadTaskResumeData];

        if (v7) {
          goto LABEL_7;
        }
        uint64_t v6 = -[NWURLSessionDownloadTask createResumeData](self);
        [v5 setDownloadTaskResumeData:v6];
      }
    }
  }

LABEL_7:

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionDownloadTask;
  if (-[NWURLSessionTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

- (id)initWithResumeInfo:(uint64_t)a3 fromOffset:(int)a4 identifier:(void *)a5 session:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v9 = a2;
  id v10 = a5;
  if (!a1)
  {
    __int16 v30 = 0;
    goto LABEL_29;
  }
  id v11 = v9[2];
  id v12 = v9[4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    unint64_t v14 = [v13 valueForHTTPHeaderField:@"ETag"];
    if (v14)
    {

      if (!a3) {
        goto LABEL_7;
      }
    }
    else
    {
      unint64_t v14 = [v13 valueForHTTPHeaderField:@"Last-Modified"];

      if (!a3) {
        goto LABEL_7;
      }
    }
    if (v14)
    {
      int v45 = a4;
      id v16 = v9[3];
      v15 = (void *)[v16 mutableCopy];

      [v15 setValue:v14 forHTTPHeaderField:@"If-Range"];
      v46 = [v11 valueForHTTPHeaderField:@"Range"];
      if ([v46 hasPrefix:@"bytes="])
      {
        v17 = [v46 componentsSeparatedByString:@"="];
        if ((unint64_t)[v17 count] <= 1)
        {
        }
        else
        {
          v18 = [v17 objectAtIndexedSubscript:1];

          if (v18)
          {
            id v19 = [v18 componentsSeparatedByString:@"-"];
            if ([v19 count] != 2)
            {
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
              }
              __int16 v32 = v18;
              v33 = (id)gurlLogObj;
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v46;
                _os_log_impl(&dword_1830D4000, v33, OS_LOG_TYPE_ERROR, "Unsupported Range header value: %@", buf, 0xCu);
              }

              __int16 v30 = 0;
              goto LABEL_28;
            }
            v40 = v18;
            if ([v18 hasSuffix:@"-"])
            {
              v20 = [v19 objectAtIndexedSubscript:0];
              uint64_t v41 = [v20 longLongValue];

              uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", v41 + a3);
              [v15 setValue:v21 forHTTPHeaderField:@"Range"];
              v42 = (void *)v21;
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
              }
              a4 = v45;
              uint64_t v22 = (id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }
            else if ([v18 hasPrefix:@"-"])
            {
              v34 = [v19 objectAtIndexedSubscript:1];
              uint64_t v43 = [v34 longLongValue];

              uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=-%lld", v43 - a3);
              [v15 setValue:v35 forHTTPHeaderField:@"Range"];
              a4 = v45;
              v42 = (void *)v35;
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
              }
              uint64_t v22 = (id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }
            else
            {
              v36 = [v19 objectAtIndexedSubscript:0];
              uint64_t v39 = [v36 longLongValue];

              v37 = [v19 objectAtIndexedSubscript:1];
              uint64_t v44 = [v37 longLongValue];

              uint64_t v38 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-%lld", v39 + a3, v44);
              [v15 setValue:v38 forHTTPHeaderField:@"Range"];
              a4 = v45;
              v42 = (void *)v38;
              if (__nwlog_url_log::onceToken != -1) {
                dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
              }
              uint64_t v22 = (id)gurlLogObj;
              if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_45;
              }
              *(_DWORD *)buf = 138412290;
              v48 = v42;
            }
            _os_log_impl(&dword_1830D4000, v22, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", buf, 0xCu);
LABEL_45:

            v23 = v40;
LABEL_24:

            goto LABEL_25;
          }
        }
      }
      v23 = objc_msgSend(NSString, "stringWithFormat:", @"bytes=%lld-", a3);
      [v15 setValue:v23 forHTTPHeaderField:@"Range"];
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      a4 = v45;
      id v19 = (id)gurlLogObj;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v48 = v23;
        _os_log_impl(&dword_1830D4000, v19, OS_LOG_TYPE_DEBUG, "Request Range header value: %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
LABEL_7:
  v15 = (void *)[v11 mutableCopy];
LABEL_25:
  v24 = -[NWURLSessionTask initWithRequest:identifier:session:](a1, v15, a4, v10);
  id v26 = v24;
  if (v24)
  {
    objc_setProperty_nonatomic_copy(v24, v25, v11, 48);
    id v27 = v9[5];
    [v26 setEarliestBeginDate:v27];

    [v26 setCountOfBytesClientExpectsToSend:v9[6]];
    [v26 setCountOfBytesClientExpectsToReceive:v9[7]];
    id v28 = v9[8];
    [v26 setTaskDescription:v28];

    LODWORD(v29) = *((_DWORD *)v9 + 3);
    [v26 setPriority:v29];
    [v26 setPrefersIncrementalDelivery:*((unsigned __int8 *)v9 + 8)];
    objc_msgSend(v26, "set_keepDownloadTaskFile:", *((unsigned __int8 *)v9 + 9));
  }
  a1 = v26;
  __int16 v30 = a1;
LABEL_28:

LABEL_29:
  return v30;
}

@end