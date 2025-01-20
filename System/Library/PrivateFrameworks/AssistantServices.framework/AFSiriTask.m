@interface AFSiriTask
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AFSiriTask)initWithBSXPCCoder:(id)a3;
- (AFSiriTask)initWithCoder:(id)a3;
- (NSString)description;
- (id)_initWithRequest:(id)a3 remoteResponseListenerEndpoint:(id)a4 usageResultListenerEndpoint:(id)a5;
- (id)_responseHandlerConnection;
- (id)_usageResultHandlerConnection;
- (id)request;
- (void)_invalidateConnectionAfterMessageSent:(id)a3;
- (void)completeWithResponse:(id)a3;
- (void)dealloc;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)failWithError:(id)a3;
- (void)reportUsageResult:(id)a3;
@end

@implementation AFSiriTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageResultListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteResponseListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (AFSiriTask)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Request"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteResponseListenerEndpoint"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RemoteUsageResultListenerEndpoint"];

  v8 = [(AFSiriTask *)self _initWithRequest:v5 remoteResponseListenerEndpoint:v6 usageResultListenerEndpoint:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  request = self->_request;
  id v5 = a3;
  [v5 encodeObject:request forKey:@"Request"];
  [v5 encodeObject:self->_remoteResponseListenerEndpoint forKey:@"RemoteResponseListenerEndpoint"];
  [v5 encodeObject:self->_usageResultListenerEndpoint forKey:@"RemoteUsageResultListenerEndpoint"];
}

- (AFSiriTask)initWithBSXPCCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Request"];
  if (!v5)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315138;
      *(void *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s the encoded request failed to decode", v25, 0xCu);
    }
  }
  uint64_t v7 = MEMORY[0x1E4F145A0];
  uint64_t v8 = [v4 decodeXPCObjectOfType:MEMORY[0x1E4F145A0] forKey:@"RemoteResponseListenerEndpoint"];
  v9 = (void *)v8;
  if (!v8)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(void *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = 0;
      v11 = "%s no encoded response endpoint: %{public}@";
      goto LABEL_20;
    }
LABEL_9:
    id v12 = 0;
    goto LABEL_11;
  }
  if (MEMORY[0x19F3A5530](v8) != v7)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(void *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v9;
      v11 = "%s the encoded response endpoint is in an unexpected format: %{public}@";
LABEL_20:
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, v11, v25, 0x16u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v13 = (objc_class *)MEMORY[0x1E4F292A0];
  id v14 = v9;
  id v12 = objc_alloc_init(v13);
  [v12 _setEndpoint:v14];

LABEL_11:
  uint64_t v15 = MEMORY[0x1E4F145A0];
  uint64_t v16 = objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E4F145A0], @"RemoteUsageResultListenerEndpoint", *(_OWORD *)v25, *(void *)&v25[16], v26);
  v17 = (void *)v16;
  if (v16)
  {
    if (MEMORY[0x19F3A5530](v16) == v15)
    {
      v21 = (objc_class *)MEMORY[0x1E4F292A0];
      id v22 = v17;
      id v20 = objc_alloc_init(v21);
      [v20 _setEndpoint:v22];

      goto LABEL_18;
    }
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(void *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = v17;
      v19 = "%s the encoded usage results endpoint is in an unexpected format: %{public}@";
LABEL_22:
      _os_log_error_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_ERROR, v19, v25, 0x16u);
    }
  }
  else
  {
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(void *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(void *)&v25[14] = 0;
      v19 = "%s no encoded usage results endpoint: %{public}@";
      goto LABEL_22;
    }
  }
  id v20 = 0;
LABEL_18:
  v23 = -[AFSiriTask _initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:](self, "_initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:", v5, v12, v20, *(void *)v25, *(_OWORD *)&v25[8]);

  return v23;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  request = self->_request;
  id v10 = v4;
  if (request) {
    [v4 encodeObject:request forKey:@"Request"];
  }
  remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
  if (remoteResponseListenerEndpoint)
  {
    uint64_t v7 = [(NSXPCListenerEndpoint *)remoteResponseListenerEndpoint _endpoint];
    [v10 encodeXPCObject:v7 forKey:@"RemoteResponseListenerEndpoint"];
  }
  usageResultListenerEndpoint = self->_usageResultListenerEndpoint;
  if (usageResultListenerEndpoint)
  {
    v9 = [(NSXPCListenerEndpoint *)usageResultListenerEndpoint _endpoint];
    [v10 encodeXPCObject:v9 forKey:@"RemoteUsageResultListenerEndpoint"];
  }
}

- (void)reportUsageResult:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v12 = "-[AFSiriTask reportUsageResult:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v6 = [(AFSiriTask *)self _usageResultHandlerConnection];
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__AFSiriTask_reportUsageResult___block_invoke;
  v9[3] = &unk_1E592C5E8;
  objc_copyWeak(&v10, (id *)buf);
  uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v7 handleSiriTaskUsageResult:v4 fromRequest:self->_request];
  [(AFSiriTask *)self _invalidateConnectionAfterMessageSent:v6];
  usageResultListenerEndpoint = self->_usageResultListenerEndpoint;
  self->_usageResultListenerEndpoint = 0;

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __32__AFSiriTask_reportUsageResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    id v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315650;
    uint64_t v8 = "-[AFSiriTask reportUsageResult:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s Task %@ unable to communicate usage results to handler: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (id)_usageResultHandlerConnection
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_usageResultListenerEndpoint];
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEC2890];
  [v2 setRemoteObjectInterface:v3];

  [v2 resume];
  return v2;
}

- (void)completeWithResponse:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[AFSiriTask completeWithResponse:]";
    __int16 v14 = 2112;
    id v15 = v4;
    _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int v7 = [(AFSiriTask *)self _responseHandlerConnection];
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __35__AFSiriTask_completeWithResponse___block_invoke;
  v10[3] = &unk_1E592C5E8;
  objc_copyWeak(&v11, (id *)buf);
  uint64_t v8 = [v7 remoteObjectProxyWithErrorHandler:v10];
  [v8 handleSiriResponse:v4 atTime:v5];
  [(AFSiriTask *)self _invalidateConnectionAfterMessageSent:v7];
  remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
  self->_remoteResponseListenerEndpoint = 0;

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __35__AFSiriTask_completeWithResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v7 = 136315650;
    uint64_t v8 = "-[AFSiriTask completeWithResponse:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = WeakRetained;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s Task %@ completed, but was unable to communicate that to the response handler: %{public}@", (uint8_t *)&v7, 0x20u);
  }
}

- (void)failWithError:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(void *)&location[4] = "-[AFSiriTask failWithError:]";
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s %{public}@", location, 0x16u);
  }
  int v7 = [(AFSiriTask *)self _responseHandlerConnection];
  objc_initWeak((id *)location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __28__AFSiriTask_failWithError___block_invoke;
  __int16 v14 = &unk_1E592C5C0;
  objc_copyWeak(&v16, (id *)location);
  id v8 = v4;
  id v15 = v8;
  __int16 v9 = [v7 remoteObjectProxyWithErrorHandler:&v11];
  objc_msgSend(v9, "handleFailureOfRequest:error:atTime:", self->_request, v8, v5, v11, v12, v13, v14);
  [(AFSiriTask *)self _invalidateConnectionAfterMessageSent:v7];
  remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
  self->_remoteResponseListenerEndpoint = 0;

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)location);
}

void __28__AFSiriTask_failWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 136315906;
    __int16 v9 = "-[AFSiriTask failWithError:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s Task %@ failed with error %{public}@, but was unable to communicate that to the response handler: %{public}@", (uint8_t *)&v8, 0x2Au);
  }
}

- (void)_invalidateConnectionAfterMessageSent:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AFSiriTask__invalidateConnectionAfterMessageSent___block_invoke;
  v5[3] = &unk_1E592C678;
  id v6 = v3;
  id v4 = v3;
  [v4 addBarrierBlock:v5];
}

uint64_t __52__AFSiriTask__invalidateConnectionAfterMessageSent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (id)_responseHandlerConnection
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_remoteResponseListenerEndpoint];
  id v4 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EEEA1DC0];
  [v3 setRemoteObjectInterface:v4];

  [v3 resume];
  if (!v3)
  {
    uint64_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
      int v8 = 136315394;
      __int16 v9 = "-[AFSiriTask _responseHandlerConnection]";
      __int16 v10 = 2112;
      id v11 = remoteResponseListenerEndpoint;
      _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s Fatal error sending response - couldn't make XPC connection from endpoint: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return v3;
}

- (id)request
{
  return self->_request;
}

- (NSString)description
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
  id v4 = [(id)objc_opt_class() description];
  [v3 appendString:v4];

  objc_msgSend(v3, "appendFormat:", @": %p;", self);
  [v3 appendString:@" request="];
  uint64_t v5 = [(AFSiriRequest *)self->_request description];
  [v3 appendString:v5];

  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v6 = "-[AFSiriTask dealloc]";
    __int16 v7 = 2048;
    int v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s <AFSiriTask %p>", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFSiriTask;
  [(AFSiriTask *)&v4 dealloc];
}

- (id)_initWithRequest:(id)a3 remoteResponseListenerEndpoint:(id)a4 usageResultListenerEndpoint:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v18 = "-[AFSiriTask _initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:]";
    __int16 v19 = 2048;
    uint64_t v20 = self;
    _os_log_impl(&dword_19CF1D000, v12, OS_LOG_TYPE_INFO, "%s <AFSiriTask %p>", buf, 0x16u);
  }
  v16.receiver = self;
  v16.super_class = (Class)AFSiriTask;
  uint64_t v13 = [(AFSiriTask *)&v16 init];
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if (AFLogInitIfNeeded_once != -1) {
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2935);
  }
}

@end