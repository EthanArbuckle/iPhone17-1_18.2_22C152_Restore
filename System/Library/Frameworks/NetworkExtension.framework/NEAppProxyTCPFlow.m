@interface NEAppProxyTCPFlow
- (NEAppProxyTCPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4;
- (NWEndpoint)remoteEndpoint;
- (OS_nw_endpoint)remoteFlowEndpoint;
- (id)description;
- (void)readDataWithCompletionHandler:(void *)completionHandler;
- (void)writeData:(NSData *)data withCompletionHandler:(void *)completionHandler;
@end

@implementation NEAppProxyTCPFlow

- (void).cxx_destruct
{
}

- (OS_nw_endpoint)remoteFlowEndpoint
{
  return (OS_nw_endpoint *)objc_getProperty(self, a2, 56, 1);
}

- (id)description
{
  v3 = NSString;
  v4 = [(NEAppProxyFlow *)self metaData];
  v5 = [(NEAppProxyTCPFlow *)self remoteFlowEndpoint];
  v6 = [(NEAppProxyFlow *)self networkInterface];
  BOOL v7 = [(NEAppProxyFlow *)self isBound];
  v8 = &stru_1EF054CB8;
  if (v7) {
    v8 = @"(bound)";
  }
  v9 = [v3 stringWithFormat:@"TCP %@ remote: %@ interface %@%@", v4, v5, v6, v8];

  return v9;
}

- (NWEndpoint)remoteEndpoint
{
  v2 = (void *)MEMORY[0x1E4F38BE8];
  v3 = [(NEAppProxyTCPFlow *)self remoteFlowEndpoint];
  v4 = [v2 endpointWithCEndpoint:v3];

  return (NWEndpoint *)v4;
}

- (void)writeData:(NSData *)data withCompletionHandler:(void *)completionHandler
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v6 = completionHandler;
  BOOL v7 = data;
  if ((isa_nsdata(v7) & 1) == 0)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        flow = self->super._flow;
      }
      else {
        flow = 0;
      }
      *(_DWORD *)buf = 134217984;
      CFHashCode v32 = CFHash(flow);
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%lu: Data object passed is not an NSData", buf, 0xCu);
    }

    if (self) {
      id Property = objc_getProperty(self, v9, 40, 1);
    }
    else {
      id Property = 0;
    }
    v11 = Property;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke;
    block[3] = &unk_1E5993770;
    id v30 = v6;
    dispatch_async(v11, block);
  }
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  v26 = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_2;
  v27 = &unk_1E598EFC0;
  id v12 = v6;
  id v28 = v12;
  uint64_t v13 = NEFlowWrite();

  if (v13)
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (self) {
        v18 = self->super._flow;
      }
      else {
        v18 = 0;
      }
      CFHashCode v19 = CFHash(v18);
      *(_DWORD *)buf = 134217984;
      CFHashCode v32 = v19;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "%lu: Failed to write flow Data", buf, 0xCu);
    }

    if (self) {
      id v16 = objc_getProperty(self, v15, 40, 1);
    }
    else {
      id v16 = 0;
    }
    v17 = v16;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_5;
    v21[3] = &unk_1E5992D18;
    id v22 = v12;
    uint64_t v23 = v13;
    dispatch_async(v17, v21);
  }
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, 4);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __53__NEAppProxyTCPFlow_writeData_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)readDataWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke;
  v17 = &unk_1E598EF70;
  id v5 = v4;
  id v18 = v5;
  uint64_t v6 = NEFlowAsyncRead();
  if (v6)
  {
    uint64_t v8 = v6;
    if (self) {
      id Property = objc_getProperty(self, v7, 40, 1);
    }
    else {
      id Property = 0;
    }
    v10 = Property;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E5992D18;
    id v12 = v5;
    uint64_t v13 = v8;
    dispatch_async(v10, block);
  }
}

void __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (v8) {
    id v5 = v8;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, a3);
  (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
}

void __51__NEAppProxyTCPFlow_readDataWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  +[NEAppProxyFlow errorForFlowError:]((uint64_t)NEAppProxyFlow, *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

- (NEAppProxyTCPFlow)initWithNEFlow:(_NEFlow *)a3 queue:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NEAppProxyTCPFlow;
  BOOL v7 = [(NEAppProxyFlow *)&v11 initWithNEFlow:a3 queue:v6];
  if (v7)
  {
    id v8 = +[NEAppProxyFlow copyRemoteEndpointFromFlow:]();
    remoteFlowEndpoint = v7->_remoteFlowEndpoint;
    v7->_remoteFlowEndpoint = (OS_nw_endpoint *)v8;

    if (!v7->_remoteFlowEndpoint) {
      __assert_rtn("-[NEAppProxyTCPFlow initWithNEFlow:queue:]", "NEAppProxyTCPFlow.m", 20, "_remoteFlowEndpoint != nil");
    }
  }

  return v7;
}

@end