@interface AIASRequest
- (AIASRequest)initWithURL:(id)a3 data:(__CFDictionary *)a4 clientInfo:(id)a5 proxiedClientInfo:(id)a6 companionClientInfo:(id)a7 appleITeamId:(id)a8 appleIClientId:(id)a9 additionalHeaders:(id)a10;
- (BOOL)done;
- (BOOL)success;
- (NSError)error;
- (NSMutableData)data;
- (NSMutableURLRequest)URLRequest;
- (NSString)networkTaskDescription;
- (NSURLSession)session;
- (NSURLSessionDataTask)task;
- (OS_dispatch_semaphore)sema;
- (__AppleIDAuthSupportData)context;
- (void)resume;
- (void)setContext:(__AppleIDAuthSupportData *)a3;
- (void)setData:(id)a3;
- (void)setDone:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setNetworkTaskDescription:(id)a3;
- (void)setSema:(id)a3;
- (void)setSession:(id)a3;
- (void)setSuccess:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)setURLRequest:(id)a3;
@end

@implementation AIASRequest

- (AIASRequest)initWithURL:(id)a3 data:(__CFDictionary *)a4 clientInfo:(id)a5 proxiedClientInfo:(id)a6 companionClientInfo:(id)a7 appleITeamId:(id)a8 appleIClientId:(id)a9 additionalHeaders:(id)a10
{
  v52[1] = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v45 = a8;
  id v20 = a9;
  id v21 = a10;
  v48.receiver = self;
  v48.super_class = (Class)AIASRequest;
  v22 = [(AIASRequest *)&v48 init];
  if (v22)
  {
    id v44 = v16;
    v23 = (void *)[objc_alloc(MEMORY[0x263EFC5E8]) initWithURL:v16];
    [(AIASRequest *)v22 setURLRequest:v23];

    v51 = @"Version";
    v52[0] = @"1.0.1";
    uint64_t v24 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v49[0] = @"Header";
    v49[1] = @"Request";
    v43 = (void *)v24;
    v50[0] = v24;
    v50[1] = a4;
    v25 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    v26 = v17;
    if (!v17)
    {
      v26 = AppleIDAuthSupportGetClientInfo();
    }
    v27 = [MEMORY[0x263F08AC0] dataWithPropertyList:v25 format:100 options:0 error:0];
    if (v27)
    {
      v28 = [(AIASRequest *)v22 URLRequest];
      [v28 setHTTPMethod:@"POST"];

      v29 = [(AIASRequest *)v22 URLRequest];
      [v29 setHTTPBody:v27];

      v30 = [(AIASRequest *)v22 URLRequest];
      [v30 setValue:@"text/x-xml-plist" forHTTPHeaderField:@"Content-Type"];

      v31 = [(AIASRequest *)v22 URLRequest];
      v32 = v31;
      if (v17)
      {
        v33 = @"X-MMe-Client-Info";
      }
      else
      {
        [v31 setValue:v26 forHTTPHeaderField:@"User-Agent"];

        v31 = [(AIASRequest *)v22 URLRequest];
        v32 = v31;
        v33 = @"X-GS-Client-Info";
      }
      [v31 setValue:v26 forHTTPHeaderField:v33];
      v35 = v45;

      if (v18)
      {
        v36 = [(AIASRequest *)v22 URLRequest];
        [v36 setValue:v18 forHTTPHeaderField:@"X-MMe-Proxied-Client-Info"];
      }
      if (v19)
      {
        v37 = [(AIASRequest *)v22 URLRequest];
        [v37 setValue:v19 forHTTPHeaderField:@"X-MMe-Companion-Client-Info"];
      }
      if (v45)
      {
        v38 = [(AIASRequest *)v22 URLRequest];
        [v38 setValue:v45 forHTTPHeaderField:@"X-Apple-I-Team-Id"];
      }
      if (v20)
      {
        v39 = [(AIASRequest *)v22 URLRequest];
        [v39 setValue:v20 forHTTPHeaderField:@"X-Apple-I-Client-Id"];
      }
      if (v21)
      {
        v46[0] = MEMORY[0x263EF8330];
        v46[1] = 3221225472;
        v46[2] = __127__AIASRequest_initWithURL_data_clientInfo_proxiedClientInfo_companionClientInfo_appleITeamId_appleIClientId_additionalHeaders___block_invoke;
        v46[3] = &unk_264189780;
        v47 = v22;
        [v21 enumerateKeysAndObjectsUsingBlock:v46];
      }
      v40 = [MEMORY[0x263EFF990] data];
      [(AIASRequest *)v22 setData:v40];

      [(AIASRequest *)v22 setDone:0];
      [(AIASRequest *)v22 setSuccess:0];
      dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
      [(AIASRequest *)v22 setSema:v41];

      [(AIASRequest *)v22 setError:0];
      [(AIASRequest *)v22 setNetworkTaskDescription:0];
      v34 = v22;
    }
    else
    {
      v34 = 0;
      v35 = v45;
    }

    id v16 = v44;
  }
  else
  {
    v34 = 0;
    v26 = v17;
    v35 = v45;
  }

  return v34;
}

void __127__AIASRequest_initWithURL_data_clientInfo_proxiedClientInfo_companionClientInfo_appleITeamId_appleIClientId_additionalHeaders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    if ((unint64_t)[v5 length] < 2
      || ([v5 substringToIndex:2],
          v7 = objc_claimAutoreleasedReturnValue(),
          uint64_t v8 = [v7 caseInsensitiveCompare:@"X-"],
          v7,
          v8))
    {
      v9 = _AIDASOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v5;
        v10 = "Rejecting additional header %@: key must begin with X-";
LABEL_9:
        _os_log_impl(&dword_210AA1000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v11 = [*(id *)(a1 + 32) URLRequest];
      v12 = [v11 valueForHTTPHeaderField:v5];

      if (!v12)
      {
        v9 = [*(id *)(a1 + 32) URLRequest];
        [v9 setValue:v6 forHTTPHeaderField:v5];
        goto LABEL_10;
      }
      v9 = _AIDASOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v5;
        v10 = "Rejecting additional header %@: key is already set via other options";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v9 = _AIDASOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v5;
      v10 = "Rejecting additional header %@: key and value must be strings";
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (void)resume
{
  id v2 = [(AIASRequest *)self task];
  [v2 resume];
}

- (NSMutableURLRequest)URLRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 16, 1);
}

- (void)setURLRequest:(id)a3
{
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setData:(id)a3
{
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (__AppleIDAuthSupportData)context
{
  return self->_context;
}

- (void)setContext:(__AppleIDAuthSupportData *)a3
{
  self->_context = a3;
}

- (OS_dispatch_semaphore)sema
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSema:(id)a3
{
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTask:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 64, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)networkTaskDescription
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNetworkTaskDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkTaskDescription, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_sema, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URLRequest, 0);
}

@end