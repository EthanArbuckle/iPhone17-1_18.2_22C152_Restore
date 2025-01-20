@interface C2WarmRequest
- (C2RequestOptions)warmOptions;
- (C2WarmRequest)initWithData:(id)a3 callback:(id)a4;
- (NSMutableURLRequest)warmRequest;
- (NSURLSessionTask)warmTask;
- (id)callback;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)send;
- (void)setCallback:(id)a3;
- (void)setWarmOptions:(id)a3;
- (void)setWarmRequest:(id)a3;
- (void)setWarmTask:(id)a3;
@end

@implementation C2WarmRequest

- (C2WarmRequest)initWithData:(id)a3 callback:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)C2WarmRequest;
  v8 = [(C2WarmRequest *)&v38 init];
  if (!v8) {
    goto LABEL_43;
  }
  if (!v6)
  {
    v15 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DC1CA000, v15, OS_LOG_TYPE_ERROR, "Missing data, cannot init C2WarmRequest", buf, 2u);
    }
    goto LABEL_42;
  }
  id v37 = 0;
  v9 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v6 error:&v37];
  id v10 = v37;
  v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (!v12)
  {
    v13 = mmcs_logging_logger_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      v14 = "Error deserializing request options with error %@";
LABEL_20:
      _os_log_impl(&dword_1DC1CA000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v16 = [v9 invokedURL];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F29128] UUID];
    v18 = [v17 UUIDString];

    if (v18)
    {
      v19 = [NSString stringWithFormat:@"C2WarmRequest requestUUID:%@", v18];
      if (v19)
      {
        [v9 setIdentifier:v19];
        v20 = (void *)MEMORY[0x1E4F29088];
        v21 = [v9 invokedURL];
        v22 = [v20 componentsWithURL:v21 resolvingAgainstBaseURL:1];

        if (v22)
        {
          [v22 setQueryItems:MEMORY[0x1E4F1CBF0]];
          [v22 setPath:@"/asset/init"];
          v23 = [v22 URL];
          if (v23)
          {
            v24 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v23];
            v25 = v24;
            if (v24)
            {
              [v24 setValue:v18 forHTTPHeaderField:@"x-apple-request-uuid"];
              objc_storeStrong((id *)&v8->_warmRequest, v25);
              uint64_t v26 = MEMORY[0x1E019B3E0](v7);
              id callback = v8->_callback;
              v8->_id callback = (id)v26;

              objc_storeStrong((id *)&v8->_warmOptions, v9);
              int v28 = 0;
            }
            else
            {
              v34 = mmcs_logging_logger_default();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v40 = v23;
                _os_log_impl(&dword_1DC1CA000, v34, OS_LOG_TYPE_ERROR, "Error initializing urlRequest with warmURL %@", buf, 0xCu);
              }
              int v28 = 1;
            }
          }
          else
          {
            v33 = mmcs_logging_logger_default();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v22;
              _os_log_impl(&dword_1DC1CA000, v33, OS_LOG_TYPE_ERROR, "Error initializing warmURL with urlComponents %@", buf, 0xCu);
            }
            int v28 = 1;
          }
        }
        else
        {
          v31 = mmcs_logging_logger_default();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = [v9 invokedURL];
            *(_DWORD *)buf = 138412290;
            v40 = v32;
            _os_log_impl(&dword_1DC1CA000, v31, OS_LOG_TYPE_ERROR, "Error initializing urlComponents with url %@", buf, 0xCu);
          }
          int v28 = 1;
        }
      }
      else
      {
        v30 = mmcs_logging_logger_default();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DC1CA000, v30, OS_LOG_TYPE_ERROR, "Error initializing requestIdentifier", buf, 2u);
        }
        int v28 = 1;
      }
    }
    else
    {
      v29 = mmcs_logging_logger_default();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DC1CA000, v29, OS_LOG_TYPE_ERROR, "Error initializing requestUUID", buf, 2u);
      }
      int v28 = 1;
    }

    if (v28) {
      goto LABEL_42;
    }
LABEL_43:
    v35 = v8;
    goto LABEL_44;
  }
  v13 = mmcs_logging_logger_default();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v40 = v9;
    v14 = "Request options missing invokedURL %@ required for warming.";
    goto LABEL_20;
  }
LABEL_21:

LABEL_42:
  v35 = 0;
LABEL_44:

  return v35;
}

- (void)send
{
  if (!self->_warmRequest)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"mmcs_http_warm.m" lineNumber:79 description:@"warmRequest must not be nil."];
  }
  if (!self->_warmOptions)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"mmcs_http_warm.m" lineNumber:80 description:@"warmOptions must not be nil."];
  }
  v4 = [MEMORY[0x1E4F50D70] sharedManager];
  v5 = [v4 createDataTaskWithRequest:self->_warmRequest options:self->_warmOptions delegate:self sessionHandle:0];
  warmTask = self->_warmTask;
  self->_warmTask = v5;

  id v7 = self->_warmTask;
  if (v7)
  {
    [(NSURLSessionTask *)v7 resume];
  }
  else
  {
    CFErrorRef error = mmcs_cferror_create_error(@"com.apple.mmcs", 1, @"Error generating dataTask for C2WarmRequest.");
    id callback = (void (**)(id, CFErrorRef))self->_callback;
    if (callback) {
      callback[2](callback, error);
    }
    if (error)
    {
      CFRelease(error);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v14 = v9;
    error_with_underlying_CFErrorRef error = mmcs_cferror_create_error_with_underlying_error(@"com.apple.mmcs", 38, v9, @"Encountered Network Error on Warm Request", v10, v11, v12, v13, v17);
  }
  else
  {
    error_with_underlying_CFErrorRef error = 0;
  }
  id callback = (void (**)(id, CFErrorRef))self->_callback;
  if (callback) {
    callback[2](callback, error_with_underlying_error);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"mmcs_http_warm.m" lineNumber:130 description:@"Unexpected callback."];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
}

- (NSMutableURLRequest)warmRequest
{
  return self->_warmRequest;
}

- (void)setWarmRequest:(id)a3
{
}

- (C2RequestOptions)warmOptions
{
  return self->_warmOptions;
}

- (void)setWarmOptions:(id)a3
{
}

- (NSURLSessionTask)warmTask
{
  return self->_warmTask;
}

- (void)setWarmTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warmTask, 0);
  objc_storeStrong((id *)&self->_warmOptions, 0);
  objc_storeStrong((id *)&self->_warmRequest, 0);
  objc_storeStrong(&self->_callback, 0);
}

@end