@interface NWURLSessionResponseConsumerDownload
- (NSURLResponse)response;
- (id)createResumeInfo;
- (id)errorForErrorCode:(uint64_t)a3 withPOSIXCode:(void *)a4 andTask:;
- (id)initWithResumeInfo:(void *)a3 completionHandler:;
- (int64_t)countOfBytesReceived;
- (void)checkCountOfBytesReceived;
- (void)deliverCompletionForTask:(uint64_t)a1;
- (void)setError:(uint64_t)a1;
- (void)setFileURL:(uint64_t)a1;
- (void)setIo:(uint64_t)a1;
- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7;
- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation NWURLSessionResponseConsumerDownload

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  if (!*(unsigned char *)(a1 + 56))
  {
LABEL_2:
    v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
    return;
  }
  v4 = *(void **)(a1 + 32);
  if (!v4 || !v4[6])
  {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:]((uint64_t)v4, *(void **)(a1 + 40));
    goto LABEL_2;
  }
  objc_setProperty_nonatomic_copy(v4, a2, *(id *)(a1 + 48), 56);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    v6 = *(NSObject **)(v5 + 48);
  }
  else {
    v6 = 0;
  }

  dispatch_io_close(v6, 0);
}

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v8 = (id *)a3;
  id v9 = a4;
  v11 = (void (**)(id, void, void *))a5;
  if (!self)
  {
    uint64_t v44 = countOfBytesExpectedToReceive(v9);
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v44);
    if (v8) {
      goto LABEL_7;
    }
LABEL_44:
    v16 = 0;
    v17 = 0;
    goto LABEL_31;
  }
  objc_setProperty_atomic(self, v10, v9, 24);
  uint64_t v12 = countOfBytesExpectedToReceive(v9);
  if (self->_isResuming)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 statusCode] == 206)
    {
      if (v12 != *MEMORY[0x1E4F18D08]) {
        v12 += self->_countOfBytesReceivedInternal;
      }
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
      int64_t countOfBytesReceivedInternal = self->_countOfBytesReceivedInternal;
    }
    else
    {
      v45 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v45 removeItemAtURL:self->_fileURL error:0];

      -[NWURLSessionResponseConsumerDownload checkCountOfBytesReceived]((uint64_t)self);
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
      int64_t countOfBytesReceivedInternal = 0;
    }
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v8, countOfBytesReceivedInternal);
    v37 = -[NWURLSessionTask delegateWrapper](v8);
    -[NWURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:]((uint64_t)v37, v8, [v8 countOfBytesReceived], objc_msgSend(v8, "countOfBytesExpectedToReceive"));
  }
  else
  {
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
  }
  v13 = self->_fileURL;
  if (v13)
  {
    BOOL isResuming = self->_isResuming;

    if (!isResuming)
    {
      v40 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v40 removeItemAtURL:self->_fileURL error:0];

      fileURL = self->_fileURL;
      if (!fileURL) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
  }
  if (!v8) {
    goto LABEL_44;
  }
LABEL_7:
  v15 = (id *)v8[51];
  v16 = v15;
  if (v15)
  {
    v17 = [v15[3] _pathToDownloadTaskFile];

    if (!v17)
    {

      if (!self)
      {
LABEL_11:
        v19 = [MEMORY[0x1E4F28CB8] defaultManager];
        v20 = [v19 temporaryDirectory];
        v21 = [v20 URLByAppendingPathComponent:@"URLSessionDownload_XXXXXX.tmp" isDirectory:0];

        if (![v21 getFileSystemRepresentation:v49 maxLength:1024])
        {
          uint64_t v38 = 63;
LABEL_35:
          v39 = -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:]((uint64_t)self, -3000, v38, v8);
          v11[2](v11, 0, v39);

          goto LABEL_23;
        }
        int v22 = mkstemps(v49, 4);
        if (v22 != -1)
        {
          dispatch_fd_t v23 = v22;
          v24 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v49 isDirectory:0 relativeToURL:0];
          if (self)
          {
            v25 = self->_fileURL;
            self->_fileURL = v24;

            v26 = self->_fileURL;
          }
          else
          {

            v26 = 0;
          }
          v27 = v26;
          v28 = [(NSURL *)v27 lastPathComponent];
          if (self) {
            objc_storeStrong((id *)&self->_tempFileName, v28);
          }

          if (v8) {
            goto LABEL_18;
          }
LABEL_42:
          v30 = 0;
          v31 = 0;
          goto LABEL_20;
        }
LABEL_34:
        uint64_t v38 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        goto LABEL_35;
      }
      goto LABEL_10;
    }
    v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v17 isDirectory:0];
    -[NWURLSessionResponseConsumerDownload setFileURL:]((uint64_t)self, v16);
  }
  else
  {
    v17 = 0;
  }
LABEL_31:

  if (!self) {
    goto LABEL_11;
  }
LABEL_10:
  fileURL = self->_fileURL;
  if (!fileURL) {
    goto LABEL_11;
  }
LABEL_37:
  v41 = fileURL;
  v21 = v41;
  if (self->_isResuming) {
    int v42 = 521;
  }
  else {
    int v42 = 2561;
  }
  int v43 = open([(NSURL *)v41 fileSystemRepresentation], v42, 438);
  if (v43 == -1) {
    goto LABEL_34;
  }
  dispatch_fd_t v23 = v43;

  if (!v8) {
    goto LABEL_42;
  }
LABEL_18:
  id v29 = v8[50];
  v30 = v29;
  if (v29) {
    v31 = (void *)*((void *)v29 + 18);
  }
  else {
    v31 = 0;
  }
LABEL_20:
  v32 = v31;
  cleanup_handler[0] = MEMORY[0x1E4F143A8];
  cleanup_handler[1] = 3221225472;
  cleanup_handler[2] = __79__NWURLSessionResponseConsumerDownload_task_deliverResponse_completionHandler___block_invoke;
  cleanup_handler[3] = &unk_1E5243DF8;
  cleanup_handler[4] = self;
  dispatch_fd_t v48 = v23;
  v47 = v8;
  v33 = (OS_dispatch_io *)dispatch_io_create(0, v23, v32, cleanup_handler);
  if (self)
  {
    io = self->_io;
    self->_io = v33;

    v35 = self->_io;
  }
  else
  {

    v35 = 0;
  }
  dispatch_io_set_low_water(v35, 0xFFFFFFFFFFFFFFFFLL);
  v11[2](v11, 1, 0);

LABEL_23:
}

void __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_pendingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_io, 0);
  objc_storeStrong((id *)&self->_tempFileName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);

  objc_storeStrong(&self->_completionHandler, 0);
}

- (id)createResumeInfo
{
  v3 = objc_alloc_init(NWURLSessionResponseConsumerResumeInfo);
  v4 = v3;
  if (self)
  {
    tempFileName = self->_tempFileName;
    if (tempFileName)
    {
      if (!v3) {
        goto LABEL_8;
      }
      uint64_t v6 = 16;
      goto LABEL_7;
    }
    tempFileName = self->_fileURL;
    if (!v3) {
      goto LABEL_8;
    }
LABEL_6:
    uint64_t v6 = 8;
LABEL_7:
    v7 = tempFileName;
    v8 = *(Class *)((char *)&v4->super.isa + v6);
    *(Class *)((char *)&v4->super.isa + v6) = v7;

    goto LABEL_8;
  }
  tempFileName = 0;
  if (v3) {
    goto LABEL_6;
  }
LABEL_8:

  return v4;
}

- (int64_t)countOfBytesReceived
{
  if (self) {
    return *(void *)(self + 72);
  }
  return self;
}

- (NSURLResponse)response
{
  if (self)
  {
    self = (NWURLSessionResponseConsumerDownload *)objc_getProperty(self, a2, 24, 1);
    uint64_t v2 = vars8;
  }
  return (NSURLResponse *)self;
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (!v13)
  {
    size_t size = 0;
    if (self) {
      goto LABEL_3;
    }
LABEL_16:
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, 0);
    BOOL v18 = v14 == 0;
    if (!v14 && v9)
    {
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v12, 0);
      goto LABEL_20;
    }
    goto LABEL_5;
  }
  size_t size = dispatch_data_get_size(v13);
  if (!self) {
    goto LABEL_16;
  }
LABEL_3:
  int64_t v17 = self->_countOfBytesReceivedInternal + size;
  self->_int64_t countOfBytesReceivedInternal = v17;
  -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, v17);
  BOOL v18 = v14 == 0;
  if (!v14 && v9)
  {
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v12, self->_countOfBytesReceivedInternal);
    if (self->_io) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_5:
  if (v18)
  {
    if (!self) {
      goto LABEL_20;
    }
  }
  else
  {
    -[NWURLSessionResponseConsumerDownload setError:]((uint64_t)self, v14);
    if (!self) {
      goto LABEL_20;
    }
  }
  if (self->_io)
  {
LABEL_8:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke;
    aBlock[3] = &unk_1E5243E20;
    v19 = (id *)v12;
    size_t v35 = size;
    v32 = v19;
    v33 = self;
    BOOL v36 = v9;
    id v34 = v15;
    v20 = _Block_copy(aBlock);
    v21 = v20;
    if (v13)
    {
      int v22 = self->_io;
      if (v19)
      {
        id v23 = v19[50];
        v24 = v23;
        if (v23) {
          v25 = (void *)*((void *)v23 + 18);
        }
        else {
          v25 = 0;
        }
      }
      else
      {
        v24 = 0;
        v25 = 0;
      }
      v26 = v25;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_3;
      v28[3] = &unk_1E5243E48;
      v28[4] = self;
      id v29 = v19;
      id v30 = v21;
      dispatch_io_write((dispatch_io_t)v22, 0, v13, v26, v28);
    }
    else
    {
      (*((void (**)(void *))v20 + 2))(v20);
    }

    goto LABEL_14;
  }
LABEL_20:
  if (v9) {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:]((uint64_t)self, v12);
  }
  if (self) {
    error = self->_error;
  }
  else {
    error = 0;
  }
  (*((void (**)(id, NWURLError *))v15 + 2))(v15, error);
LABEL_14:
}

- (void)setError:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)deliverCompletionForTask:(uint64_t)a1
{
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v3);
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 64);
    v7 = [v6 downloadTaskResumeData];
    BOOL v8 = v7 != 0;

    if (v4)
    {
      BOOL v9 = (id *)v4[51];
      v10 = v9;
      if (v9 && ([v9[3] _keepDownloadTaskFile] & 1) != 0)
      {
        BOOL v11 = 1;

        if (!v5) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }
    BOOL v11 = *(void *)(a1 + 40) == 0;

    if (!v5) {
      goto LABEL_10;
    }
LABEL_9:
    if (v6)
    {
      if (!v7 && !*(void *)(a1 + 40))
      {
        v26 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v26 removeItemAtURL:v5 error:0];
      }
      id v5 = 0;
      id v12 = *(void **)(a1 + 16);
      if (v12) {
        goto LABEL_11;
      }
      goto LABEL_24;
    }
LABEL_10:
    id v12 = *(void **)(a1 + 16);
    if (v12)
    {
LABEL_11:
      id v13 = v12;
      id v15 = objc_getProperty((id)a1, v14, 24, 1);
      if (v4)
      {
        uint64_t v16 = 31;
        if (!v4[31]) {
          uint64_t v16 = 30;
        }
        id v17 = v4[v16];
      }
      else
      {
        id v17 = 0;
      }
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke;
      v59[3] = &unk_1E5243E70;
      id v63 = v13;
      id v60 = v5;
      id v61 = v15;
      id v62 = v6;
      BOOL v64 = v11;
      BOOL v65 = v8;
      id v18 = v15;
      id v19 = v13;
      if (v4)
      {
        v20 = (id *)v4[51];
        int v22 = v20;
        if (v20) {
          int v23 = [v20[3] _callCompletionHandlerInline];
        }
        else {
          int v23 = 0;
        }
        id Property = objc_getProperty(v4, v21, 440, 1);
      }
      else
      {
        int v23 = 0;
        int v22 = 0;
        id Property = 0;
      }
      id v25 = Property;
      -[NWURLSessionDelegateWrapper runCompletionHandler:noAsync:task:metrics:cachedResponse:cache:]((uint64_t)v17, v59, v23, v4, v25, 0, 0);

      goto LABEL_46;
    }
LABEL_24:
    if (v6) {
      BOOL v27 = 1;
    }
    else {
      BOOL v27 = v5 == 0;
    }
    int v28 = !v27;
    if (v4)
    {
      uint64_t v29 = 31;
      if (!v4[31]) {
        uint64_t v29 = 30;
      }
      v31 = (id *)v4[v29];
      if (v28)
      {
        id v32 = *(id *)(a1 + 32);
        id v34 = objc_getProperty(v4, v33, 440, 1);
LABEL_35:
        id v35 = v34;
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v55 = __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke_2;
        v56 = &unk_1E5248D20;
        BOOL v58 = v11;
        id v57 = v5;
        v53 = v4;
        id v52 = v32;
        id v36 = v35;
        uint64_t v38 = v54;
        if (v31)
        {
          v40 = [(NWURLSessionDelegateWrapper *)v31 delegateFor_didFinishDownloadingToURL];
          if (v36)
          {
            v41 = [(NWURLSessionDelegateWrapper *)v31 delegateFor_didFinishCollectingMetrics];
          }
          else
          {
            v41 = 0;
          }
          uint64_t v42 = [(NWURLSessionDelegateWrapper *)v31 delegateFor_didCompleteWithError];
          int v43 = (void *)v42;
          if (v40 || v41 || v42)
          {
            id v49 = v31[4];
            v51 = v38;
            id v44 = v31[5];
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __102__NWURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_error_metrics_completionHandler___block_invoke;
            v66[3] = &unk_1E5249A98;
            id v67 = v40;
            id v68 = v49;
            v69 = v53;
            id v70 = v52;
            id v71 = v41;
            id v72 = v36;
            id v73 = v43;
            id v74 = 0;
            id v75 = v44;
            id v76 = v51;
            v45 = v31[6];
            id v50 = v44;
            id v46 = v49;
            -[NWURLSessionDelegateQueue runDelegateBlock:](v45, v66);

            uint64_t v38 = v51;
          }
          else
          {
            v55((uint64_t)v38);
          }
        }
        goto LABEL_46;
      }
      id v47 = objc_getProperty(v4, v30, 440, 1);
    }
    else
    {
      if (v28)
      {
        id v32 = *(id *)(a1 + 32);
        v31 = 0;
        id v34 = 0;
        goto LABEL_35;
      }
      v31 = 0;
      id v47 = 0;
    }
    id v48 = v47;
    -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v31, v4, v6, v48);

LABEL_46:
  }
}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = 248;
    if (!*(void *)(v2 + 248)) {
      uint64_t v3 = 240;
    }
    v4 = (id *)*(id *)(v2 + v3);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      goto LABEL_5;
    }
  }
  else
  {
    id v5 = 0;
    v4 = 0;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
LABEL_5:
      uint64_t v7 = *(void *)(v6 + 72);
      goto LABEL_6;
    }
  }
  uint64_t v7 = 0;
LABEL_6:
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = [v5 countOfBytesExpectedToReceive];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  int v23 = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_2;
  v24 = &unk_1E52484D8;
  char v27 = *(unsigned char *)(a1 + 64);
  int8x16_t v21 = *(int8x16_t *)(a1 + 32);
  id v10 = (id)v21.i64[0];
  int8x16_t v25 = vextq_s8(v21, v21, 8uLL);
  id v26 = *(id *)(a1 + 48);
  id v11 = v5;
  id v13 = v22;
  if (v4)
  {
    SEL v14 = [(NWURLSessionDelegateWrapper *)v4 delegateFor_didWriteData];
    if (v14)
    {
      id v15 = v4[4];
      id v16 = v4[5];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __119__NWURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke;
      v28[3] = &unk_1E52499F8;
      id v29 = v14;
      id v30 = v15;
      id v17 = v11;
      uint64_t v34 = v8;
      uint64_t v35 = v7;
      uint64_t v36 = v9;
      id v31 = v17;
      id v32 = v16;
      SEL v33 = v13;
      id v18 = v4[6];
      id v19 = v16;
      id v20 = v15;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v18, v28);
    }
    else
    {
      ((void (*)(void *))v23)(v13);
    }
  }
}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_3(uint64_t a1, int a2, void *a3, int a4)
{
  id v10 = a3;
  if (a2)
  {
    if (a4)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (!v7 || !*(void *)(v7 + 64))
      {
        uint64_t v8 = -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:](v7, -3003, a4, *(void **)(a1 + 40));
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          objc_storeStrong((id *)(v9 + 64), v8);
        }
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)errorForErrorCode:(uint64_t)a3 withPOSIXCode:(void *)a4 andTask:
{
  if (a1)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28798];
    id v8 = a4;
    uint64_t v9 = [v6 errorWithDomain:v7 code:a3 userInfo:0];
    id v10 = [NWURLError alloc];
    id v11 = v8;
    if (v10)
    {
      uint64_t v12 = *MEMORY[0x1E4F289A0];
      v16.receiver = v10;
      v16.super_class = (Class)NWURLError;
      id v13 = objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v12, a2, 0);
      SEL v14 = v13;
      if (v13) {
        [v13 fillErrorForLoader:0 andTask:v11];
      }
    }
    else
    {
      SEL v14 = 0;
    }

    [v14 setUnderlyingError:v9];
  }
  else
  {
    SEL v14 = 0;
  }

  return v14;
}

void __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  if (*(void *)(a1 + 32) && !*(unsigned char *)(a1 + 64) && !*(unsigned char *)(a1 + 65))
  {
    id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
}

- (void)checkCountOfBytesReceived
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1C5F8];
  [*(id *)(a1 + 32) removeCachedResourceValueForKey:*MEMORY[0x1E4F1C5F8]];
  uint64_t v3 = *(void **)(a1 + 32);
  id v10 = 0;
  id v11 = 0;
  id v4 = v3;
  char v5 = [v4 getResourceValue:&v11 forKey:v2 error:&v10];
  id v6 = v11;
  id v7 = v10;

  if (v5)
  {
    uint64_t v8 = [v6 longLongValue];
  }
  else
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    uint64_t v9 = (id)gurlLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1830D4000, v9, OS_LOG_TYPE_ERROR, "Error getting response consumer file size: %@", buf, 0xCu);
    }

    uint64_t v8 = 0;
  }
  *(void *)(a1 + 72) = v8;
}

- (void)setFileURL:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void __79__NWURLSessionResponseConsumerDownload_task_deliverResponse_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 64);
  }
  if (a2 || v4)
  {
    uint64_t v16 = 65541;
    if (ffsctl(*(_DWORD *)(a1 + 48), 0xC0084A44uLL, &v16, 0))
    {
      if (__nwlog_url_log::onceToken != -1) {
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
      }
      id v13 = (id)gurlLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        *(_DWORD *)buf = 67109120;
        int v18 = v14;
        _os_log_impl(&dword_1830D4000, v13, OS_LOG_TYPE_ERROR, "Failed to make download file purgeable: %{errno}d", buf, 8u);
      }
    }
    close(*(_DWORD *)(a1 + 48));
    if (a2)
    {
      id v15 = -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:](*(void *)(a1 + 32), -3000, a2, *(void **)(a1 + 40));
      -[NWURLSessionResponseConsumerDownload setError:](*(void *)(a1 + 32), v15);

      -[NWURLSessionResponseConsumerDownload setIo:](*(void *)(a1 + 32));
      return;
    }
  }
  else
  {
    close(*(_DWORD *)(a1 + 48));
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5 && *(void *)(v5 + 56))
  {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:](v5, *(void **)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = *(void **)(v6 + 56);
      uint64_t v8 = (uint64_t)v7 + 16;
    }
    else
    {
      id v7 = 0;
      uint64_t v8 = 16;
    }
    uint64_t v9 = *(void (**)(void))v8;
    id v10 = v7;
    v9();

    uint64_t v12 = *(void **)(a1 + 32);
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v11, 0, 56);
    }
  }
}

- (void)setIo:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), 0);
  }
}

- (id)initWithResumeInfo:(void *)a3 completionHandler:
{
  uint64_t v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)NWURLSessionResponseConsumerDownload;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      id v7 = _Block_copy(v6);
      id v8 = a1[2];
      a1[2] = v7;

      if (v5)
      {
        objc_storeStrong(a1 + 5, v5[2]);
        if (a1[5])
        {
          id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v10 = [v9 temporaryDirectory];
          uint64_t v11 = [v10 URLByAppendingPathComponent:a1[5] isDirectory:0];
          id v12 = a1[4];
          a1[4] = (id)v11;
        }
        else
        {
          id v13 = v5[1];
          id v9 = a1[4];
          a1[4] = v13;
        }

        *((unsigned char *)a1 + 8) = 1;
        -[NWURLSessionResponseConsumerDownload checkCountOfBytesReceived]((uint64_t)a1);
      }
    }
  }

  return a1;
}

@end