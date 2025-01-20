@interface NWURLSessionResponseConsumerDataCompletionHandler
- (NSURLResponse)response;
- (id)createResumeInfo;
- (id)initWithCompletionHandler:(id *)a1;
- (int64_t)countOfBytesReceived;
- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionResponseConsumerDataCompletionHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (id)createResumeInfo
{
  return 0;
}

- (int64_t)countOfBytesReceived
{
  if (!self) {
    return 0;
  }
  v3 = self->_data;
  if (!v3) {
    return 0;
  }
  v4 = v3;
  size_t size = dispatch_data_get_size((dispatch_data_t)self->_data);

  return size;
}

- (NSURLResponse)response
{
  if (self)
  {
    self = (NWURLSessionResponseConsumerDataCompletionHandler *)objc_getProperty(self, a2, 16, 1);
    uint64_t v2 = vars8;
  }
  return (NSURLResponse *)self;
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  v12 = (char *)a3;
  v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, void))a7;
  if (v13)
  {
    if (self) {
      data = self->_data;
    }
    else {
      data = 0;
    }
    v17 = data;
    dispatch_data_t concat = dispatch_data_create_concat(v17, v13);
    if (self) {
      objc_storeStrong((id *)&self->_data, concat);
    }

    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, [(NWURLSessionResponseConsumerDataCompletionHandler *)self countOfBytesReceived]);
  }
  if (v9)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v12);
    if (self)
    {
      id v19 = self->_completionHandler;
      v20 = self->_data;
      id Property = objc_getProperty(self, v21, 16, 1);
    }
    else
    {
      v20 = 0;
      id v19 = 0;
      id Property = 0;
    }
    id v23 = Property;
    if (v12)
    {
      uint64_t v24 = 248;
      if (!*((void *)v12 + 31)) {
        uint64_t v24 = 240;
      }
      id v25 = *(id *)&v12[v24];
    }
    else
    {
      id v25 = 0;
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __103__NWURLSessionResponseConsumerDataCompletionHandler_task_deliverData_complete_error_completionHandler___block_invoke;
    v41[3] = &unk_1E5249BF8;
    id v42 = v14;
    v43 = v20;
    id v44 = v23;
    id v45 = v19;
    id v26 = v23;
    v27 = v20;
    v39 = v26;
    id v40 = v14;
    id v37 = v19;
    v38 = v27;
    if (v12)
    {
      v28 = (id *)*((id *)v12 + 51);
      v30 = v28;
      if (v28) {
        int v31 = objc_msgSend(v28[3], "_callCompletionHandlerInline", v37, v27, v26);
      }
      else {
        int v31 = 0;
      }
      id v32 = objc_getProperty(v12, v29, 440, 1);
      v33 = [*((id *)v12 + 33) takeCachedResponse];
      v34 = (id *)*((id *)v12 + 51);
      v35 = v34;
      if (v34)
      {
        v36 = [v34[2] URLCache];
      }
      else
      {
        v36 = 0;
      }
    }
    else
    {
      v35 = 0;
      id v32 = 0;
      v30 = 0;
      int v31 = 0;
      v33 = 0;
      v36 = 0;
    }
    -[NWURLSessionDelegateWrapper runCompletionHandler:noAsync:task:metrics:cachedResponse:cache:]((uint64_t)v25, v41, v31, v12, v32, v33, v36);

    id v14 = v40;
  }
  v15[2](v15, 0);
}

uint64_t __103__NWURLSessionResponseConsumerDataCompletionHandler_task_deliverData_complete_error_completionHandler___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[7];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, 0, a1[6]);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, a1[5], a1[6]);
  }
}

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  v15 = (void (**)(id, uint64_t, void))a5;
  id v8 = a4;
  data = (OS_dispatch_data *)a3;
  if (self)
  {
    objc_setProperty_atomic(self, v9, v8, 16);
    uint64_t v11 = countOfBytesExpectedToReceive(v8);

    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](data, v11);
    v12 = (OS_dispatch_data *)MEMORY[0x1E4F14410];
    id v13 = MEMORY[0x1E4F14410];
    data = self->_data;
    self->_data = v12;
  }
  else
  {
    uint64_t v14 = countOfBytesExpectedToReceive(v8);

    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](data, v14);
  }

  v15[2](v15, 1, 0);
}

- (id)initWithCompletionHandler:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NWURLSessionResponseConsumerDataCompletionHandler;
    a1 = (id *)objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = _Block_copy(v3);
      id v5 = a1[1];
      a1[1] = v4;

      objc_storeStrong(a1 + 3, MEMORY[0x1E4F14410]);
    }
  }

  return a1;
}

@end