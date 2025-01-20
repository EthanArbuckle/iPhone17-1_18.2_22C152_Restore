@interface NWURLSessionResponseConsumerDataDelegate
- (NSURLResponse)response;
- (id)createResumeInfo;
- (int64_t)countOfBytesReceived;
- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionResponseConsumerDataDelegate

- (void).cxx_destruct
{
}

- (id)createResumeInfo
{
  return 0;
}

- (int64_t)countOfBytesReceived
{
  if (self) {
    return *(void *)(self + 16);
  }
  return self;
}

- (NSURLResponse)response
{
  if (self)
  {
    self = (NWURLSessionResponseConsumerDataDelegate *)objc_getProperty(self, a2, 8, 1);
    uint64_t v2 = vars8;
  }
  return (NSURLResponse *)self;
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  BOOL v56 = a5;
  v11 = (char *)a3;
  v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (v12)
  {
    if (self)
    {
      int64_t v15 = self->_countOfBytesReceivedInternal + dispatch_data_get_size(v12);
      self->_countOfBytesReceivedInternal = v15;
    }
    else
    {
      int64_t v15 = 0;
    }
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v11, v15);
    if (v11)
    {
      uint64_t v16 = 248;
      if (!*((void *)v11 + 31)) {
        uint64_t v16 = 240;
      }
      v17 = (id *)*(id *)&v11[v16];
      id v19 = objc_getProperty(v11, v18, 440, 1);
      v20 = [*((id *)v11 + 33) takeCachedResponse];
      v21 = (id *)*((id *)v11 + 51);
      if (v21)
      {
        v48 = v21;
        v22 = [v21[2] URLCache];
      }
      else
      {
        v48 = 0;
        v22 = 0;
      }
    }
    else
    {
      v48 = 0;
      id v19 = 0;
      v17 = 0;
      v20 = 0;
      v22 = 0;
    }
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v58 = __94__NWURLSessionResponseConsumerDataDelegate_task_deliverData_complete_error_completionHandler___block_invoke;
    v59 = &unk_1E524AFA8;
    id v47 = v14;
    id v60 = v14;
    v54 = v11;
    v53 = v12;
    id v51 = v13;
    id v23 = v19;
    id v52 = v20;
    id v50 = v22;
    v55 = v57;
    if (!v17) {
      goto LABEL_24;
    }
    v25 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didReceiveData_withCB];
    uint64_t v27 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didReceiveData_withoutCB];
    uint64_t v30 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_willCacheResponse];
    v31 = 0;
    v49 = v23;
    if (v23)
    {
      v32 = (void *)v27;
      if (v56)
      {
        v31 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didFinishCollectingMetrics];
      }
    }
    else
    {
      v32 = (void *)v27;
    }
    v33 = (void *)v30;
    if (v56)
    {
      v34 = [(NWURLSessionDelegateWrapper *)v17 delegateFor_didCompleteWithError];
      if (v25) {
        goto LABEL_22;
      }
    }
    else
    {
      v34 = 0;
      if (v25) {
        goto LABEL_22;
      }
    }
    if (!v32 && !v31 && !v34)
    {
      v58((uint64_t)v55);
LABEL_23:

      id v23 = v49;
LABEL_24:

      id v14 = v47;
      goto LABEL_25;
    }
LABEL_22:
    v46 = v12;
    id v35 = v17[4];
    id v45 = v13;
    id v36 = v17[5];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __117__NWURLSessionDelegateWrapper_dataTask_didReceiveData_complete_error_metrics_cachedResponse_cache_completionHandler___block_invoke;
    v61[3] = &unk_1E5249A70;
    id v62 = v25;
    id v63 = v35;
    v64 = v54;
    v65 = v53;
    id v66 = v36;
    v76 = v55;
    id v37 = v32;
    BOOL v77 = v56;
    id v67 = v37;
    v68 = v17;
    id v69 = v52;
    id v70 = v50;
    id v71 = v33;
    id v72 = v31;
    id v73 = v49;
    id v74 = v34;
    id v75 = v51;
    v38 = v17[6];
    id v39 = v36;
    id v40 = v35;
    -[NWURLSessionDelegateQueue runDelegateBlock:](v38, v61);

    id v13 = v45;
    v12 = v46;
    goto LABEL_23;
  }
  if (v56)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v11);
    v42 = -[NWURLSessionTask delegateWrapper](v11);
    if (v11) {
      id Property = objc_getProperty(v11, v41, 440, 1);
    }
    else {
      id Property = 0;
    }
    id v44 = Property;
    -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v42, v11, v13, v44);
  }
  (*((void (**)(id, void))v14 + 2))(v14, 0);
LABEL_25:
}

uint64_t __94__NWURLSessionResponseConsumerDataDelegate_task_deliverData_complete_error_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  v8 = a3;
  id v9 = a4;
  id v11 = a5;
  if (self) {
    objc_setProperty_atomic(self, v10, v9, 8);
  }
  uint64_t v12 = countOfBytesExpectedToReceive(v9);
  -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
  if (v8)
  {
    uint64_t v13 = 31;
    if (!v8[31]) {
      uint64_t v13 = 30;
    }
    id v14 = (id)v8[v13];
  }
  else
  {
    id v14 = 0;
  }
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v34 = __83__NWURLSessionResponseConsumerDataDelegate_task_deliverResponse_completionHandler___block_invoke;
  id v35 = &unk_1E5243DD0;
  id v36 = v11;
  id v15 = v11;
  uint64_t v16 = v8;
  id v17 = v9;
  id v19 = v33;
  if (v14)
  {
    v20 = [(NWURLSessionDelegateWrapper *)(char *)v14 delegateFor_didReceiveResponse];
    if (v20)
    {
      id v32 = v15;
      id v21 = *((id *)v14 + 4);
      id v22 = *((id *)v14 + 5);
      id v23 = [NWURLSessionDelegateDeallocBomb alloc];
      id v24 = v20;
      if (v23)
      {
        v37.receiver = v23;
        v37.super_class = (Class)NWURLSessionDelegateDeallocBomb;
        id v25 = [(NWURLSessionResponseConsumerDataDelegate *)&v37 init];
        v26 = v25;
        if (v25)
        {
          objc_storeStrong((id *)v25 + 2, v20);
          if (sel_dataTask_didReceiveResponse_completionHandler_) {
            uint64_t v27 = sel_dataTask_didReceiveResponse_completionHandler_;
          }
          else {
            uint64_t v27 = 0;
          }
          v26[3] = v27;
        }
      }
      else
      {
        v26 = 0;
      }

      v37.receiver = (id)MEMORY[0x1E4F143A8];
      v37.super_class = (Class)3221225472;
      v38 = __77__NWURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke;
      id v39 = &unk_1E52498E0;
      id v40 = v24;
      id v41 = v21;
      v42 = v16;
      id v43 = v17;
      id v44 = v26;
      id v45 = v22;
      v46 = v19;
      v28 = (void *)*((void *)v14 + 6);
      id v29 = v22;
      uint64_t v30 = v26;
      id v31 = v21;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v28, &v37);

      id v15 = v32;
    }
    else
    {
      ((void (*)(void *, uint64_t))v34)(v19, 1);
    }
  }
}

uint64_t __83__NWURLSessionResponseConsumerDataDelegate_task_deliverResponse_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end