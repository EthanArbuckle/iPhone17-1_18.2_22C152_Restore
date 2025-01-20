@interface __NSCFURLSessionDelegateWrapper
- (_BYTE)check__isWaitingForConnection_withError;
- (_BYTE)check__isWaitingForConnection_withoutError;
- (id)_downloadTaskNeedsDownloadDirectory:(uint64_t)a1;
- (id)initWithSession:(id *)a1;
- (uint64_t)_willSendRequestForEstablishedConnection;
- (uint64_t)check__alternatePathAvailable;
- (uint64_t)check__conditionalRequirementsChanged;
- (uint64_t)check__willSendRequestForEstablishedConnection;
- (uint64_t)check_betterRouteDiscovered;
- (uint64_t)check_didBecomeDownloadTask;
- (uint64_t)check_didBecomeInputOutputStream;
- (uint64_t)check_didBecomeStreamTask;
- (uint64_t)check_didFinishDownloadingToURL;
- (uint64_t)check_didReceiveChallenge;
- (uint64_t)check_didReceiveResponse;
- (uint64_t)check_didWriteData;
- (uint64_t)check_isWaitingForConnectivity;
- (uint64_t)check_needNewBodyStreamFromOffset;
- (uint64_t)check_sessionDidReceiveChallenge;
- (uint64_t)check_willBeginDelayedRequest;
- (uint64_t)check_willPerformHTTPRedirection;
- (uint64_t)didBecomeInputOutputStream;
- (uint64_t)didFinishDownloadingToURL;
- (uint64_t)didReceiveChallenge;
- (uint64_t)didReceiveResponse;
- (uint64_t)didWriteData;
- (uint64_t)sessionDidReceiveChallenge;
- (uint64_t)willBeginDelayedRequest;
- (void)_connectionEstablishedForStreamTask:(uint64_t)a1;
- (void)_openFileAtPath:(uint64_t)a3 mode:(void *)a4 completionHandler:;
- (void)_willRetryBackgroundDataTask:(void *)a3 withError:;
- (void)betterRouteDiscoveredForStreamTask:(uint64_t)a1;
- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:;
- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:;
- (void)dataTask:(void *)a3 didReceiveData:(void *)a4 completionHandler:;
- (void)dataTask:(void *)a3 didReceiveResponse:(void *)a4 completionHandler:;
- (void)dataTask:(void *)a3 willCacheResponse:(void *)a4 completionHandler:;
- (void)didBecomeInvalidWithError:(uint64_t)a1;
- (void)didCreateTask:(uint64_t)a1;
- (void)didFinishEventsForBackgroundURLSession;
- (void)didReceiveChallenge:(void *)a3 completionHandler:;
- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:;
- (void)downloadTask:(uint64_t)a3 didWriteData:(uint64_t)a4 totalBytesWritten:(uint64_t)a5 totalBytesExpectedToWrite:(void *)a6 completionHandler:;
- (void)downloadTask:(void *)a3 _didReceiveResponse:;
- (void)downloadTask:(void *)a3 didFinishDownloadingToURL:(void *)a4 completionHandler:;
- (void)readClosedForStreamTask:(void *)a3 completionHandler:;
- (void)setFallbackDelegateWrapper:(uint64_t)a1;
- (void)streamTask:(void *)a3 didBecomeInputStream:(void *)a4 outputStream:(void *)a5 completionHandler:;
- (void)task:(uint64_t)a3 _alternatePathAvailable:;
- (void)task:(uint64_t)a3 _conditionalRequirementsChanged:;
- (void)task:(uint64_t)a3 didSendBodyData:(uint64_t)a4 totalBytesSent:(uint64_t)a5 totalBytesExpectedToSend:;
- (void)task:(uint64_t)a3 needNewBodyStreamFromOffset:(void *)a4 completionHandler:;
- (void)task:(void *)a3 _getAuthHeadersForResponse:(void *)a4 completionHandler:;
- (void)task:(void *)a3 _isWaitingForConnectionWithError:;
- (void)task:(void *)a3 _schemeUpgraded:(void *)a4 completionHandler:;
- (void)task:(void *)a3 _willSendRequestForEstablishedConnection:(void *)a4 completionHandler:;
- (void)task:(void *)a3 _willUseEffectiveConfiguration:(void *)a4 completionHandler:;
- (void)task:(void *)a3 didCompleteWithError:(void *)a4 completionHandler:;
- (void)task:(void *)a3 didFinishCollectingMetrics:(void *)a4 completionHandler:;
- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:;
- (void)task:(void *)a3 didReceiveInformationalResponse:;
- (void)task:(void *)a3 needNewBodyStream:;
- (void)task:(void *)a3 willBeginDelayedRequest:(void *)a4 completionHandler:;
- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:;
- (void)taskIsWaitingForConnectivity:(uint64_t)a1;
- (void)webSocketTask:(uint64_t)a3 didCloseWithCode:(void *)a4 reason:;
- (void)webSocketTask:(void *)a3 didOpenWithProtocol:;
- (void)writeClosedForStreamTask:(void *)a3 completionHandler:;
@end

@implementation __NSCFURLSessionDelegateWrapper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_wrappedDelegate, 0);

  objc_storeStrong((id *)&self->_fallbackDelegateWrapper, 0);
}

- (id)initWithSession:(id *)a1
{
  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)__NSCFURLSessionDelegateWrapper;
    v4 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[5] = v3;
      if (v3) {
        v5 = (void *)v3[15];
      }
      else {
        v5 = 0;
      }
      objc_storeStrong(v4 + 6, v5);
    }
  }

  return a1;
}

- (void)setFallbackDelegateWrapper:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)dataTask:(void *)a3 didReceiveData:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    char v13 = *(unsigned char *)(a1 + 11);
    if ((v13 & 8) != 0)
    {
      char v15 = *(unsigned char *)(a1 + 16);
      if ((v15 & 0x40) != 0)
      {
LABEL_7:
        id v16 = *(id *)(a1 + 40);
        id v17 = *(id *)(a1 + 48);
        v18 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_dataTask_didReceiveData_completionHandler_, v12);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke;
        v33[3] = &unk_1E52526D0;
        id v34 = v12;
        id v19 = v16;
        id v35 = v19;
        id v36 = v7;
        id v37 = v8;
        id v38 = v18;
        id v20 = v17;
        id v39 = v20;
        v40 = v10;
        v21 = v18;
        -[NSURLSession runDelegateBlock:]((uint64_t)v19, v33);

        goto LABEL_18;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v14 = 64;
      }
      else {
        char v14 = 0;
      }
      char v15 = *(unsigned char *)(a1 + 16) & 0xBF | v14;
      *(unsigned char *)(a1 + 16) = v15;
      char v13 = *(unsigned char *)(a1 + 11) | 8;
      *(unsigned char *)(a1 + 11) = v13;
      if ((v15 & 0x40) != 0) {
        goto LABEL_7;
      }
    }
    if ((v13 & 4) == 0)
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v22 = 32;
      }
      else {
        char v22 = 0;
      }
      char v15 = *(unsigned char *)(a1 + 16) & 0xDF | v22;
      *(unsigned char *)(a1 + 16) = v15;
      *(unsigned char *)(a1 + 11) |= 4u;
    }
    if ((v15 & 0x20) == 0)
    {
      uint64_t v23 = *(void *)(a1 + 24);
      if (v23) {
        -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveData:completionHandler:](v23, v7, v8, v10);
      }
      else {
        v10[2](v10);
      }
      goto LABEL_19;
    }
    id v24 = *(id *)(a1 + 40);
    id v25 = *(id *)(a1 + 48);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __77____NSCFURLSessionDelegateWrapper_dataTask_didReceiveData_completionHandler___block_invoke_3;
    v26[3] = &unk_1E5252680;
    v27 = v12;
    id v28 = v24;
    id v29 = v7;
    id v30 = v8;
    id v31 = v25;
    v32 = v10;
    id v20 = v25;
    id v19 = v24;
    -[NSURLSession runDelegateBlock:]((uint64_t)v19, v26);

    v21 = v27;
LABEL_18:

LABEL_19:
  }
}

- (void)task:(void *)a3 didFinishCollectingMetrics:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(unsigned char *)(a1 + 9) & 0x20) != 0)
    {
      if (*(unsigned char *)(a1 + 15)) {
        goto LABEL_4;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      char v13 = *(unsigned char *)(a1 + 15) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(unsigned char *)(a1 + 15) = v13;
      *(unsigned char *)(a1 + 9) |= 0x20u;
      if (v13)
      {
LABEL_4:
        id v14 = *(id *)(a1 + 40);
        id v15 = *(id *)(a1 + 48);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __85____NSCFURLSessionDelegateWrapper_task_didFinishCollectingMetrics_completionHandler___block_invoke;
        v19[3] = &unk_1E5252680;
        id v20 = v12;
        id v21 = v14;
        id v22 = v7;
        id v23 = v8;
        id v24 = v15;
        id v25 = v10;
        id v16 = v15;
        id v17 = v14;
        -[NSURLSession runDelegateBlock:]((uint64_t)v17, v19);

LABEL_9:
        goto LABEL_10;
      }
    }
    uint64_t v18 = *(void *)(a1 + 24);
    if (v18) {
      -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v18, v7, v8, v10);
    }
    else {
      v10[2](v10);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)dataTask:(void *)a3 willCacheResponse:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(unsigned char *)(a1 + 11) & 0x10) != 0)
    {
      if ((*(unsigned char *)(a1 + 16) & 0x80) != 0)
      {
LABEL_7:
        id v15 = *(id *)(a1 + 40);
        id v16 = *(id *)(a1 + 48);
        id v17 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_dataTask_willCacheResponse_completionHandler_, v12);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __80____NSCFURLSessionDelegateWrapper_dataTask_willCacheResponse_completionHandler___block_invoke;
        v22[3] = &unk_1E52526D0;
        id v23 = v12;
        id v18 = v15;
        id v24 = v18;
        id v25 = v7;
        id v26 = v8;
        id v27 = v17;
        id v19 = v16;
        id v28 = v19;
        id v29 = v10;
        id v20 = v17;
        -[NSURLSession runDelegateBlock:]((uint64_t)v18, v22);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v13 = 0x80;
      }
      else {
        char v13 = 0;
      }
      char v14 = v13 & 0x80 | *(unsigned char *)(a1 + 16) & 0x7F;
      *(unsigned char *)(a1 + 16) = v14;
      *(unsigned char *)(a1 + 11) |= 0x10u;
      if (v14 < 0) {
        goto LABEL_7;
      }
    }
    uint64_t v21 = *(void *)(a1 + 24);
    if (v21) {
      -[__NSCFURLSessionDelegateWrapper dataTask:willCacheResponse:completionHandler:](v21, v7, v8, v10);
    }
    else {
      (*((void (**)(id, id))v10 + 2))(v10, v8);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)task:(void *)a3 _willSendRequestForEstablishedConnection:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check__willSendRequestForEstablishedConnection])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      id v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__willSendRequestForEstablishedConnection_completionHandler_, v11);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __99____NSCFURLSessionDelegateWrapper_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
      v20[3] = &unk_1E52526D0;
      id v21 = v11;
      id v16 = v13;
      id v22 = v16;
      id v23 = v7;
      id v24 = v8;
      id v25 = v15;
      id v17 = v14;
      id v26 = v17;
      id v27 = v10;
      id v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 24);
      if (v19) {
        -[__NSCFURLSessionDelegateWrapper task:_willSendRequestForEstablishedConnection:completionHandler:](v19, v7, v8, v10);
      }
      else {
        (*((void (**)(id, id))v10 + 2))(v10, v8);
      }
    }
  }
}

- (void)dataTask:(void *)a3 didReceiveResponse:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didReceiveResponse])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      id v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_dataTask_didReceiveResponse_completionHandler_, v11);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __81____NSCFURLSessionDelegateWrapper_dataTask_didReceiveResponse_completionHandler___block_invoke;
      v20[3] = &unk_1E52526D0;
      id v21 = v11;
      id v16 = v13;
      id v22 = v16;
      id v23 = v7;
      id v24 = v8;
      id v25 = v15;
      id v17 = v14;
      id v26 = v17;
      id v27 = v10;
      id v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 24);
      if (v19) {
        -[__NSCFURLSessionDelegateWrapper dataTask:didReceiveResponse:completionHandler:](v19, v7, v8, v10);
      }
      else {
        (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
      }
    }
  }
}

- (uint64_t)check_didReceiveResponse
{
  if (self)
  {
    v2 = self;
    if ((char)self[10] < 0)
    {
      LODWORD(self) = (self[16] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 4;
      }
      else {
        char v3 = 0;
      }
      v2[16] = v2[16] & 0xFB | v3;
      v2[10] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)didReceiveResponse
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_didReceiveResponse])
    {
      return 1;
    }
    else
    {
      v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_didReceiveResponse];
    }
  }
  return result;
}

- (void)task:(void *)a3 didCompleteWithError:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(unsigned char *)(a1 + 9) & 0x40) != 0)
    {
      if ((*(unsigned char *)(a1 + 15) & 2) == 0)
      {
LABEL_7:
        uint64_t v14 = *(void *)(a1 + 24);
        if (v14) {
          -[__NSCFURLSessionDelegateWrapper task:didCompleteWithError:completionHandler:](v14, v7, v8, v10);
        }
        else {
          v10[2](v10);
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v13 = 2;
      }
      else {
        int v13 = 0;
      }
      *(unsigned char *)(a1 + 15) = *(unsigned char *)(a1 + 15) & 0xFD | v13;
      *(unsigned char *)(a1 + 9) |= 0x40u;
      if (!v13) {
        goto LABEL_7;
      }
    }
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __79____NSCFURLSessionDelegateWrapper_task_didCompleteWithError_completionHandler___block_invoke;
    v19[3] = &unk_1E5252680;
    id v20 = v12;
    id v21 = v15;
    id v22 = v7;
    id v23 = v8;
    id v24 = v16;
    id v25 = v10;
    id v17 = v16;
    id v18 = v15;
    -[NSURLSession runDelegateBlock:]((uint64_t)v18, v19);

LABEL_11:
  }
}

- (_BYTE)check__isWaitingForConnection_withoutError
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[10] & 0x10) != 0)
    {
      char v4 = self[15];
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v3 = 0x80;
      }
      else {
        char v3 = 0;
      }
      char v4 = v3 & 0x80 | v2[15] & 0x7F;
      v2[15] = v4;
      v2[10] |= 0x10u;
    }
    return (unsigned char *)(v4 < 0);
  }
  return self;
}

- (_BYTE)check__isWaitingForConnection_withError
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[10] & 0x20) != 0)
    {
      char v3 = self[16];
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      char v3 = v2[16] & 0xFE | objc_opt_respondsToSelector() & 1;
      v2[16] = v3;
      v2[10] |= 0x20u;
    }
    return (unsigned char *)(v3 & 1);
  }
  return self;
}

- (uint64_t)check__conditionalRequirementsChanged
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[10] & 2) != 0)
    {
      LODWORD(self) = (self[15] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 16;
      }
      else {
        char v3 = 0;
      }
      v2[15] = v2[15] & 0xEF | v3;
      v2[10] |= 2u;
    }
  }
  return self & 1;
}

- (uint64_t)check__alternatePathAvailable
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[10] & 0x40) != 0)
    {
      LODWORD(self) = (self[16] >> 1) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 2;
      }
      else {
        char v3 = 0;
      }
      v2[16] = v2[16] & 0xFD | v3;
      v2[10] |= 0x40u;
    }
  }
  return self & 1;
}

- (uint64_t)check_isWaitingForConnectivity
{
  if (self)
  {
    uint64_t v2 = self;
    if ((char)self[8] < 0)
    {
      LODWORD(self) = (self[14] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 4;
      }
      else {
        char v3 = 0;
      }
      v2[14] = v2[14] & 0xFB | v3;
      v2[8] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)_willSendRequestForEstablishedConnection
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check__willSendRequestForEstablishedConnection])
    {
      return 1;
    }
    else
    {
      char v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check__willSendRequestForEstablishedConnection];
    }
  }
  return result;
}

- (uint64_t)check__willSendRequestForEstablishedConnection
{
  if (self)
  {
    uint64_t v2 = self;
    if (self[10])
    {
      LODWORD(self) = (self[15] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 8;
      }
      else {
        char v3 = 0;
      }
      v2[15] = v2[15] & 0xF7 | v3;
      v2[10] |= 1u;
    }
  }
  return self & 1;
}

- (void)downloadTask:(void *)a3 didFinishDownloadingToURL:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didFinishDownloadingToURL])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __92____NSCFURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_completionHandler___block_invoke;
      v18[3] = &unk_1E5252680;
      id v19 = v11;
      id v20 = v13;
      id v21 = v7;
      id v22 = v8;
      id v23 = v14;
      id v24 = v10;
      id v15 = v14;
      id v16 = v13;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v18);
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 24);
      if (v17) {
        -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v17, v7, v8, v10);
      }
      else {
        v10[2](v10);
      }
    }
  }
}

- (uint64_t)check_didFinishDownloadingToURL
{
  if (self)
  {
    uint64_t v2 = self;
    if ((char)self[11] < 0)
    {
      LODWORD(self) = (self[17] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 4;
      }
      else {
        char v3 = 0;
      }
      v2[17] = v2[17] & 0xFB | v3;
      v2[11] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)didFinishDownloadingToURL
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_didFinishDownloadingToURL])
    {
      return 1;
    }
    else
    {
      char v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_didFinishDownloadingToURL];
    }
  }
  return result;
}

- (void)task:(uint64_t)a3 didSendBodyData:(uint64_t)a4 totalBytesSent:(uint64_t)a5 totalBytesExpectedToSend:
{
  id v10 = a2;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(unsigned char *)(a1 + 9) & 0x10) != 0)
    {
      if ((*(unsigned char *)(a1 + 14) & 0x80) != 0)
      {
LABEL_7:
        id v15 = *(id *)(a1 + 40);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __96____NSCFURLSessionDelegateWrapper_task_didSendBodyData_totalBytesSent_totalBytesExpectedToSend___block_invoke;
        v17[3] = &unk_1E52568D0;
        id v18 = v12;
        id v19 = v15;
        id v20 = v10;
        uint64_t v21 = a3;
        uint64_t v22 = a4;
        uint64_t v23 = a5;
        id v16 = v15;
        -[NSURLSession runDelegateBlock:]((uint64_t)v16, v17);

LABEL_10:
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v13 = 0x80;
      }
      else {
        char v13 = 0;
      }
      char v14 = v13 & 0x80 | *(unsigned char *)(a1 + 14) & 0x7F;
      *(unsigned char *)(a1 + 14) = v14;
      *(unsigned char *)(a1 + 9) |= 0x10u;
      if (v14 < 0) {
        goto LABEL_7;
      }
    }
    -[__NSCFURLSessionDelegateWrapper task:didSendBodyData:totalBytesSent:totalBytesExpectedToSend:](*(void *)(a1 + 24), v10, a3, a4, a5);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)task:(void *)a3 _willUseEffectiveConfiguration:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(unsigned char *)(a1 + 10) & 8) != 0)
    {
      if ((*(unsigned char *)(a1 + 15) & 0x40) == 0)
      {
LABEL_7:
        uint64_t v14 = *(void *)(a1 + 24);
        if (v14) {
          -[__NSCFURLSessionDelegateWrapper task:_willUseEffectiveConfiguration:completionHandler:](v14, v7, v8, v10);
        }
        else {
          v10[2](v10, v8);
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v13 = 64;
      }
      else {
        int v13 = 0;
      }
      *(unsigned char *)(a1 + 15) = *(unsigned char *)(a1 + 15) & 0xBF | v13;
      *(unsigned char *)(a1 + 10) |= 8u;
      if (!v13) {
        goto LABEL_7;
      }
    }
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    uint64_t v17 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__willUseEffectiveConfiguration_completionHandler_, v12);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __89____NSCFURLSessionDelegateWrapper_task__willUseEffectiveConfiguration_completionHandler___block_invoke;
    v21[3] = &unk_1E52526D0;
    id v22 = v12;
    id v18 = v15;
    id v23 = v18;
    id v24 = v7;
    id v25 = v8;
    id v26 = v17;
    id v19 = v16;
    id v27 = v19;
    id v28 = v10;
    id v20 = v17;
    -[NSURLSession runDelegateBlock:]((uint64_t)v18, v21);

LABEL_11:
  }
}

- (void)dataTask:(void *)a3 didBecomeDownloadTask:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didBecomeDownloadTask])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __84____NSCFURLSessionDelegateWrapper_dataTask_didBecomeDownloadTask_completionHandler___block_invoke;
      v18[3] = &unk_1E5252680;
      id v19 = v11;
      id v20 = v13;
      id v21 = v7;
      id v22 = v8;
      id v23 = v14;
      id v24 = v10;
      id v15 = v14;
      id v16 = v13;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v18);
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 24);
      if (v17) {
        -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeDownloadTask:completionHandler:](v17, v7, v8, v10);
      }
      else {
        v10[2](v10);
      }
    }
  }
}

- (uint64_t)check_didBecomeDownloadTask
{
  if (self)
  {
    uint64_t v2 = self;
    if (self[11])
    {
      LODWORD(self) = (self[16] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 8;
      }
      else {
        char v3 = 0;
      }
      v2[16] = v2[16] & 0xF7 | v3;
      v2[11] |= 1u;
    }
  }
  return self & 1;
}

- (void)downloadTask:(void *)a3 _didReceiveResponse:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(unsigned char *)(a1 + 12) & 4) != 0)
    {
      if ((*(unsigned char *)(a1 + 17) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper downloadTask:_didReceiveResponse:](*(void *)(a1 + 24), v5, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v10 = 32;
      }
      else {
        int v10 = 0;
      }
      *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 17) & 0xDF | v10;
      *(unsigned char *)(a1 + 12) |= 4u;
      if (!v10) {
        goto LABEL_7;
      }
    }
    id v11 = *(id *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __68____NSCFURLSessionDelegateWrapper_downloadTask__didReceiveResponse___block_invoke;
    v13[3] = &unk_1E5256948;
    id v14 = v9;
    id v15 = v11;
    id v16 = v5;
    id v17 = v7;
    id v12 = v11;
    -[NSURLSession runDelegateBlock:]((uint64_t)v12, v13);

    goto LABEL_10;
  }
LABEL_11:
}

- (id)_downloadTaskNeedsDownloadDirectory:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v6 = objc_getProperty((id)a1, v3, 32, 1);
    if ((*(unsigned char *)(a1 + 12) & 8) != 0)
    {
      if ((*(unsigned char *)(a1 + 17) & 0x40) == 0)
      {
LABEL_7:
        uint64_t v8 = -[__NSCFURLSessionDelegateWrapper _downloadTaskNeedsDownloadDirectory:](*(void *)(a1 + 24), v4);
LABEL_10:
        a1 = v8;

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v5, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v7 = 64;
      }
      else {
        int v7 = 0;
      }
      *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 17) & 0xBF | v7;
      *(unsigned char *)(a1 + 12) |= 8u;
      if (!v7) {
        goto LABEL_7;
      }
    }
    uint64_t v8 = [v6 _URLSession:*(void *)(a1 + 40) downloadTaskNeedsDownloadDirectory:v4];
    goto LABEL_10;
  }
LABEL_11:

  return (id)a1;
}

- (uint64_t)check_willPerformHTTPRedirection
{
  if (self)
  {
    uint64_t v2 = self;
    if (self[9])
    {
      LODWORD(self) = (self[14] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 8;
      }
      else {
        char v3 = 0;
      }
      v2[14] = v2[14] & 0xF7 | v3;
      v2[9] |= 1u;
    }
  }
  return self & 1;
}

- (uint64_t)check_willBeginDelayedRequest
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[8] & 0x40) != 0)
    {
      LODWORD(self) = (self[14] >> 1) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 2;
      }
      else {
        char v3 = 0;
      }
      v2[14] = v2[14] & 0xFD | v3;
      v2[8] |= 0x40u;
    }
  }
  return self & 1;
}

- (uint64_t)willBeginDelayedRequest
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_willBeginDelayedRequest])
    {
      return 1;
    }
    else
    {
      id v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_willBeginDelayedRequest];
    }
  }
  return result;
}

- (uint64_t)didReceiveChallenge
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_didReceiveChallenge])
    {
      return 1;
    }
    else
    {
      id v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_didReceiveChallenge];
    }
  }
  return result;
}

- (void)task:(void *)a3 didReceiveChallenge:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didReceiveChallenge])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      id v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_didReceiveChallenge_completionHandler_, v11);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __78____NSCFURLSessionDelegateWrapper_task_didReceiveChallenge_completionHandler___block_invoke;
      v20[3] = &unk_1E52526D0;
      id v21 = v11;
      id v16 = v13;
      id v22 = v16;
      id v23 = v7;
      id v24 = v8;
      id v25 = v15;
      id v17 = v14;
      id v26 = v17;
      id v27 = v10;
      id v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 24);
      if (v19) {
        -[__NSCFURLSessionDelegateWrapper task:didReceiveChallenge:completionHandler:](v19, v7, v8, v10);
      }
      else {
        (*((void (**)(id, uint64_t, void))v10 + 2))(v10, 1, 0);
      }
    }
  }
}

- (uint64_t)check_didReceiveChallenge
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[9] & 2) != 0)
    {
      LODWORD(self) = (self[14] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 16;
      }
      else {
        char v3 = 0;
      }
      v2[14] = v2[14] & 0xEF | v3;
      v2[9] |= 2u;
    }
  }
  return self & 1;
}

- (uint64_t)sessionDidReceiveChallenge
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_sessionDidReceiveChallenge])
    {
      return 1;
    }
    else
    {
      id v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_sessionDidReceiveChallenge];
    }
  }
  return result;
}

- (uint64_t)check_sessionDidReceiveChallenge
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[8] & 2) != 0)
    {
      LODWORD(self) = (self[13] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 16;
      }
      else {
        char v3 = 0;
      }
      v2[13] = v2[13] & 0xEF | v3;
      v2[8] |= 2u;
    }
  }
  return self & 1;
}

- (void)didReceiveChallenge:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = objc_getProperty((id)a1, v6, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_sessionDidReceiveChallenge])
    {
      id v10 = *(id *)(a1 + 40);
      id v11 = *(id *)(a1 + 48);
      id v12 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_didReceiveChallenge_completionHandler_, v8);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __73____NSCFURLSessionDelegateWrapper_didReceiveChallenge_completionHandler___block_invoke;
      v17[3] = &unk_1E5252680;
      id v18 = v8;
      id v13 = v10;
      id v19 = v13;
      id v20 = v5;
      id v21 = v12;
      id v14 = v11;
      id v22 = v14;
      id v23 = v7;
      id v15 = v12;
      -[NSURLSession runDelegateBlock:]((uint64_t)v13, v17);
    }
    else
    {
      uint64_t v16 = *(void *)(a1 + 24);
      if (v16) {
        -[__NSCFURLSessionDelegateWrapper didReceiveChallenge:completionHandler:](v16, v5, v7);
      }
      else {
        (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
      }
    }
  }
}

- (void)didCreateTask:(uint64_t)a1
{
  id v8 = a2;
  if (a1)
  {
    id v5 = objc_getProperty((id)a1, v3, 32, 1);
    if ((*(unsigned char *)(a1 + 8) & 0x20) != 0)
    {
      if (*(unsigned char *)(a1 + 14)) {
        goto LABEL_4;
      }
    }
    else
    {
      objc_getProperty((id)a1, v4, 32, 1);
      char v6 = *(unsigned char *)(a1 + 14) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(unsigned char *)(a1 + 14) = v6;
      *(unsigned char *)(a1 + 8) |= 0x20u;
      if (v6)
      {
LABEL_4:
        [v5 URLSession:*(void *)(a1 + 40) didCreateTask:v8];
LABEL_8:

        goto LABEL_9;
      }
    }
    uint64_t v7 = *(void *)(a1 + 24);
    if (v7) {
      -[__NSCFURLSessionDelegateWrapper didCreateTask:](v7, v8);
    }
    goto LABEL_8;
  }
LABEL_9:
}

- (void)didBecomeInvalidWithError:(uint64_t)a1
{
  if (a1)
  {
    id v4 = objc_getProperty((id)a1, a2, 32, 1);
    if (*(unsigned char *)(a1 + 8))
    {
      if ((*(unsigned char *)(a1 + 13) & 8) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper didBecomeInvalidWithError:](*(void *)(a1 + 24));
        objc_setProperty_atomic((id)a1, v6, 0, 32);
LABEL_10:

        return;
      }
    }
    else
    {
      objc_getProperty((id)a1, v3, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v5 = 8;
      }
      else {
        int v5 = 0;
      }
      *(unsigned char *)(a1 + 13) = *(unsigned char *)(a1 + 13) & 0xF7 | v5;
      *(unsigned char *)(a1 + 8) |= 1u;
      if (!v5) {
        goto LABEL_7;
      }
    }
    id v7 = *(id *)(a1 + 40);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61____NSCFURLSessionDelegateWrapper_didBecomeInvalidWithError___block_invoke;
    v9[3] = &unk_1E5256948;
    id v10 = v4;
    id v11 = v7;
    id v12 = 0;
    uint64_t v13 = a1;
    id v8 = v7;
    -[NSURLSession runDelegateBlock:]((uint64_t)v8, v9);

    goto LABEL_10;
  }
}

- (uint64_t)check_needNewBodyStreamFromOffset
{
  if ((self[9] & 8) != 0)
  {
    int v3 = (self[14] >> 6) & 1;
  }
  else
  {
    objc_getProperty(self, a2, 32, 1);
    LOBYTE(v3) = objc_opt_respondsToSelector();
    if (v3) {
      char v4 = 64;
    }
    else {
      char v4 = 0;
    }
    self[14] = self[14] & 0xBF | v4;
    self[9] |= 8u;
  }
  return v3 & 1;
}

- (uint64_t)check_didBecomeStreamTask
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[11] & 2) != 0)
    {
      LODWORD(self) = (self[16] >> 4) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 16;
      }
      else {
        char v3 = 0;
      }
      v2[16] = v2[16] & 0xEF | v3;
      v2[11] |= 2u;
    }
  }
  return self & 1;
}

- (uint64_t)check_didWriteData
{
  if (self)
  {
    uint64_t v2 = self;
    if (self[12])
    {
      LODWORD(self) = (self[17] >> 3) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 8;
      }
      else {
        char v3 = 0;
      }
      v2[17] = v2[17] & 0xF7 | v3;
      v2[12] |= 1u;
    }
  }
  return self & 1;
}

- (uint64_t)didWriteData
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_didWriteData])
    {
      return 1;
    }
    else
    {
      char v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_didWriteData];
    }
  }
  return result;
}

- (uint64_t)check_betterRouteDiscovered
{
  if (self)
  {
    uint64_t v2 = self;
    if ((self[12] & 0x40) != 0)
    {
      LODWORD(self) = (self[18] >> 1) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 2;
      }
      else {
        char v3 = 0;
      }
      v2[18] = v2[18] & 0xFD | v3;
      v2[12] |= 0x40u;
    }
  }
  return self & 1;
}

- (uint64_t)check_didBecomeInputOutputStream
{
  if (self)
  {
    uint64_t v2 = self;
    if ((char)self[12] < 0)
    {
      LODWORD(self) = (self[18] >> 2) & 1;
    }
    else
    {
      objc_getProperty(self, a2, 32, 1);
      LOBYTE(self) = objc_opt_respondsToSelector();
      if (self) {
        char v3 = 4;
      }
      else {
        char v3 = 0;
      }
      v2[18] = v2[18] & 0xFB | v3;
      v2[12] |= 0x80u;
    }
  }
  return self & 1;
}

- (uint64_t)didBecomeInputOutputStream
{
  if (result)
  {
    uint64_t v2 = result;
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)result check_didBecomeInputOutputStream])
    {
      return 1;
    }
    else
    {
      char v4 = *(unsigned __int8 **)(v2 + 24);
      return [(__NSCFURLSessionDelegateWrapper *)v4 check_didBecomeInputOutputStream];
    }
  }
  return result;
}

- (void)didFinishEventsForBackgroundURLSession
{
  if (a1)
  {
    id v4 = objc_getProperty((id)a1, a2, 32, 1);
    if ((*(unsigned char *)(a1 + 8) & 4) != 0)
    {
      if ((*(unsigned char *)(a1 + 13) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper didFinishEventsForBackgroundURLSession](*(void *)(a1 + 24));
LABEL_10:

        return;
      }
    }
    else
    {
      objc_getProperty((id)a1, v3, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v5 = 32;
      }
      else {
        int v5 = 0;
      }
      *(unsigned char *)(a1 + 13) = *(unsigned char *)(a1 + 13) & 0xDF | v5;
      *(unsigned char *)(a1 + 8) |= 4u;
      if (!v5) {
        goto LABEL_7;
      }
    }
    id v6 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73____NSCFURLSessionDelegateWrapper_didFinishEventsForBackgroundURLSession__block_invoke;
    v8[3] = &unk_1E5257FB0;
    id v9 = v4;
    id v10 = v6;
    id v7 = v6;
    -[NSURLSession runDelegateBlock:]((uint64_t)v7, v8);

    goto LABEL_10;
  }
}

- (void)task:(void *)a3 _getAuthHeadersForResponse:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if ((*(unsigned char *)(a1 + 8) & 8) != 0)
    {
      if ((*(unsigned char *)(a1 + 13) & 0x40) == 0)
      {
LABEL_7:
        uint64_t v14 = *(void *)(a1 + 24);
        if (v14) {
          -[__NSCFURLSessionDelegateWrapper task:_getAuthHeadersForResponse:completionHandler:](v14, v7, v8, v10);
        }
        else {
          (*((void (**)(id, void, void, void))v10 + 2))(v10, 0, 0, 0);
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v13 = 64;
      }
      else {
        int v13 = 0;
      }
      *(unsigned char *)(a1 + 13) = *(unsigned char *)(a1 + 13) & 0xBF | v13;
      *(unsigned char *)(a1 + 8) |= 8u;
      if (!v13) {
        goto LABEL_7;
      }
    }
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v17 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__getAuthHeadersForResponse_completionHandler_, v12);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __85____NSCFURLSessionDelegateWrapper_task__getAuthHeadersForResponse_completionHandler___block_invoke;
    v21[3] = &unk_1E52526D0;
    id v22 = v12;
    id v18 = v15;
    id v23 = v18;
    id v24 = v7;
    id v25 = v8;
    id v26 = v17;
    id v19 = v16;
    id v27 = v19;
    id v28 = v10;
    id v20 = v17;
    -[NSURLSession runDelegateBlock:]((uint64_t)v18, v21);

LABEL_11:
  }
}

- (void)_openFileAtPath:(uint64_t)a3 mode:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v9 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v8, 32, 1);
    if ((*(unsigned char *)(a1 + 8) & 0x10) != 0)
    {
      if ((*(unsigned char *)(a1 + 13) & 0x80) != 0)
      {
LABEL_7:
        id v14 = *(id *)(a1 + 40);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __74____NSCFURLSessionDelegateWrapper__openFileAtPath_mode_completionHandler___block_invoke;
        v17[3] = &unk_1E5255280;
        id v18 = v11;
        id v19 = v14;
        id v20 = v7;
        int v22 = a3;
        id v21 = v9;
        id v15 = v14;
        -[NSURLSession runDelegateBlock:]((uint64_t)v15, v17);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v10, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v12 = 0x80;
      }
      else {
        char v12 = 0;
      }
      char v13 = v12 & 0x80 | *(unsigned char *)(a1 + 13) & 0x7F;
      *(unsigned char *)(a1 + 13) = v13;
      *(unsigned char *)(a1 + 8) |= 0x10u;
      if (v13 < 0) {
        goto LABEL_7;
      }
    }
    uint64_t v16 = *(void *)(a1 + 24);
    if (v16) {
      -[__NSCFURLSessionDelegateWrapper _openFileAtPath:mode:completionHandler:](v16, v7, a3, v9);
    }
    else {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, 0xFFFFFFFFLL);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)task:(void *)a3 willBeginDelayedRequest:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_willBeginDelayedRequest])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      id v15 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_willBeginDelayedRequest_completionHandler_, v11);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __82____NSCFURLSessionDelegateWrapper_task_willBeginDelayedRequest_completionHandler___block_invoke;
      v20[3] = &unk_1E52526D0;
      id v21 = v11;
      id v16 = v13;
      id v22 = v16;
      id v23 = v7;
      id v24 = v8;
      id v25 = v15;
      id v17 = v14;
      id v26 = v17;
      id v27 = v10;
      id v18 = v15;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v20);
    }
    else
    {
      uint64_t v19 = *(void *)(a1 + 24);
      if (v19) {
        -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v19, v7, v8, v10);
      }
      else {
        (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
      }
    }
  }
}

- (void)taskIsWaitingForConnectivity:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty((id)a1, v3, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_isWaitingForConnectivity])
    {
      id v7 = *(id *)(a1 + 40);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64____NSCFURLSessionDelegateWrapper_taskIsWaitingForConnectivity___block_invoke;
      v9[3] = &unk_1E52582F0;
      id v10 = v5;
      id v11 = v7;
      id v12 = v4;
      id v8 = v7;
      -[NSURLSession runDelegateBlock:]((uint64_t)v8, v9);
    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper taskIsWaitingForConnectivity:](*(void *)(a1 + 24), v4);
    }
  }
}

- (void)task:(void *)a3 willPerformHTTPRedirection:(void *)a4 newRequest:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  if (a1)
  {
    id v14 = objc_getProperty((id)a1, v12, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_willPerformHTTPRedirection])
    {
      id v16 = *(id *)(a1 + 40);
      id v17 = *(id *)(a1 + 48);
      id v18 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_willPerformHTTPRedirection_newRequest_completionHandler_, v14);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __96____NSCFURLSessionDelegateWrapper_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
      v23[3] = &unk_1E5252720;
      id v24 = v14;
      id v19 = v16;
      id v25 = v19;
      id v26 = v9;
      id v27 = v10;
      id v28 = v11;
      id v29 = v18;
      id v20 = v17;
      id v30 = v20;
      id v31 = v13;
      id v21 = v18;
      -[NSURLSession runDelegateBlock:]((uint64_t)v19, v23);
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 24);
      if (v22) {
        -[__NSCFURLSessionDelegateWrapper task:willPerformHTTPRedirection:newRequest:completionHandler:](v22, v9, v10, v11, v13);
      }
      else {
        (*((void (**)(id, id))v13 + 2))(v13, v11);
      }
    }
  }
}

- (void)task:(void *)a3 needNewBodyStream:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(unsigned char *)(a1 + 9) & 4) != 0)
    {
      if ((*(unsigned char *)(a1 + 14) & 0x20) == 0)
      {
LABEL_7:
        if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_needNewBodyStreamFromOffset])
        {
          -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:](a1, v5, 0, v7);
        }
        else
        {
          uint64_t v17 = *(void *)(a1 + 24);
          if (v17) {
            -[__NSCFURLSessionDelegateWrapper task:needNewBodyStream:](v17, v5, v7);
          }
          else {
            (*((void (**)(id, void))v7 + 2))(v7, 0);
          }
        }
        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v10 = 32;
      }
      else {
        int v10 = 0;
      }
      *(unsigned char *)(a1 + 14) = *(unsigned char *)(a1 + 14) & 0xDF | v10;
      *(unsigned char *)(a1 + 9) |= 4u;
      if (!v10) {
        goto LABEL_7;
      }
    }
    id v11 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    id v13 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_needNewBodyStream_, v9);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58____NSCFURLSessionDelegateWrapper_task_needNewBodyStream___block_invoke;
    v18[3] = &unk_1E5252680;
    id v19 = v9;
    id v14 = v11;
    id v20 = v14;
    id v21 = v5;
    id v22 = v13;
    id v15 = v12;
    id v23 = v15;
    id v24 = v7;
    id v16 = v13;
    -[NSURLSession runDelegateBlock:]((uint64_t)v14, v18);

LABEL_11:
  }
}

- (void)task:(uint64_t)a3 needNewBodyStreamFromOffset:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v9 = a4;
  if (a1)
  {
    id v10 = objc_getProperty((id)a1, v8, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_needNewBodyStreamFromOffset])
    {
      id v12 = *(id *)(a1 + 40);
      id v13 = *(id *)(a1 + 48);
      id v14 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task_needNewBodyStreamFromOffset_completionHandler_, v10);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __86____NSCFURLSessionDelegateWrapper_task_needNewBodyStreamFromOffset_completionHandler___block_invoke;
      v19[3] = &unk_1E5252770;
      id v20 = v10;
      id v15 = v12;
      id v21 = v15;
      uint64_t v26 = a3;
      id v22 = v7;
      id v23 = v14;
      id v16 = v13;
      id v24 = v16;
      id v25 = v9;
      uint64_t v17 = v14;
      -[NSURLSession runDelegateBlock:]((uint64_t)v15, v19);
    }
    else
    {
      uint64_t v18 = *(void *)(a1 + 24);
      if (v18) {
        -[__NSCFURLSessionDelegateWrapper task:needNewBodyStreamFromOffset:completionHandler:](v18, v7, a3, v9);
      }
      else {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }
    }
  }
}

- (void)task:(void *)a3 _schemeUpgraded:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v12 = objc_getProperty((id)a1, v9, 32, 1);
    if (*(char *)(a1 + 9) < 0)
    {
      if ((*(unsigned char *)(a1 + 15) & 4) != 0)
      {
LABEL_7:
        id v14 = *(id *)(a1 + 40);
        id v15 = *(id *)(a1 + 48);
        id v16 = -[__NSCFDeallocBomb initWithMethod:delegate:]([__NSCFDeallocBomb alloc], (uint64_t)sel_task__schemeUpgraded_completionHandler_, v12);
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __74____NSCFURLSessionDelegateWrapper_task__schemeUpgraded_completionHandler___block_invoke;
        v21[3] = &unk_1E52526D0;
        id v22 = v12;
        id v17 = v14;
        id v23 = v17;
        id v24 = v7;
        id v25 = v8;
        id v26 = v16;
        id v18 = v15;
        id v27 = v18;
        id v28 = v10;
        id v19 = v16;
        -[NSURLSession runDelegateBlock:]((uint64_t)v17, v21);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v11, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v13 = 4;
      }
      else {
        int v13 = 0;
      }
      *(unsigned char *)(a1 + 15) = *(unsigned char *)(a1 + 15) & 0xFB | v13;
      *(unsigned char *)(a1 + 9) |= 0x80u;
      if (v13) {
        goto LABEL_7;
      }
    }
    uint64_t v20 = *(void *)(a1 + 24);
    if (v20) {
      -[__NSCFURLSessionDelegateWrapper task:_schemeUpgraded:completionHandler:](v20, v7, v8, v10);
    }
    else {
      (*((void (**)(id, id))v10 + 2))(v10, v8);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)task:(uint64_t)a3 _conditionalRequirementsChanged:
{
  id v6 = a2;
  if (a1)
  {
    id v7 = objc_getProperty((id)a1, v5, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check__conditionalRequirementsChanged])
    {
      id v9 = *(id *)(a1 + 40);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __72____NSCFURLSessionDelegateWrapper_task__conditionalRequirementsChanged___block_invoke;
      v11[3] = &unk_1E5252798;
      id v12 = v7;
      id v13 = v9;
      id v14 = v6;
      char v15 = a3;
      id v10 = v9;
      -[NSURLSession runDelegateBlock:]((uint64_t)v10, v11);
    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper task:_conditionalRequirementsChanged:](*(void *)(a1 + 24), v6, a3);
    }
  }
}

- (void)task:(void *)a3 didReceiveInformationalResponse:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(unsigned char *)(a1 + 10) & 4) != 0)
    {
      if ((*(unsigned char *)(a1 + 15) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper task:didReceiveInformationalResponse:](*(void *)(a1 + 24), v5, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v10 = 32;
      }
      else {
        int v10 = 0;
      }
      *(unsigned char *)(a1 + 15) = *(unsigned char *)(a1 + 15) & 0xDF | v10;
      *(unsigned char *)(a1 + 10) |= 4u;
      if (!v10) {
        goto LABEL_7;
      }
    }
    id v11 = *(id *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72____NSCFURLSessionDelegateWrapper_task_didReceiveInformationalResponse___block_invoke;
    v13[3] = &unk_1E5256948;
    id v14 = v9;
    id v15 = v11;
    id v16 = v5;
    id v17 = v7;
    id v12 = v11;
    -[NSURLSession runDelegateBlock:]((uint64_t)v12, v13);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)task:(void *)a3 _isWaitingForConnectionWithError:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v8 = objc_getProperty((id)a1, v6, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned char *)a1 check__isWaitingForConnection_withError])
    {
      id v11 = *(id *)(a1 + 40);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke;
      v21[3] = &unk_1E5256948;
      id v22 = v8;
      id v23 = v11;
      id v24 = v5;
      id v25 = v7;
      id v12 = v11;
      -[NSURLSession runDelegateBlock:]((uint64_t)v12, v21);
      id v13 = &v22;
      id v14 = &v23;
      id v15 = &v24;
    }
    else
    {
      if (![(__NSCFURLSessionDelegateWrapper *)(unsigned char *)a1 check__isWaitingForConnection_withoutError])
      {
        -[__NSCFURLSessionDelegateWrapper task:_isWaitingForConnectionWithError:](*(void *)(a1 + 24), v5, v7);
        goto LABEL_8;
      }
      id v16 = *(id *)(a1 + 40);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __73____NSCFURLSessionDelegateWrapper_task__isWaitingForConnectionWithError___block_invoke_2;
      v17[3] = &unk_1E52582F0;
      id v18 = v8;
      id v19 = v16;
      id v20 = v5;
      id v12 = v16;
      -[NSURLSession runDelegateBlock:]((uint64_t)v12, v17);
      id v13 = &v18;
      id v14 = &v19;
      id v15 = &v20;
    }

LABEL_8:
  }
}

- (void)task:(uint64_t)a3 _alternatePathAvailable:
{
  id v6 = a2;
  if (a1)
  {
    id v7 = objc_getProperty((id)a1, v5, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check__alternatePathAvailable])
    {
      id v9 = *(id *)(a1 + 40);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64____NSCFURLSessionDelegateWrapper_task__alternatePathAvailable___block_invoke;
      v11[3] = &unk_1E52527C0;
      id v12 = v7;
      id v13 = v9;
      id v14 = v6;
      int v15 = a3;
      id v10 = v9;
      -[NSURLSession runDelegateBlock:]((uint64_t)v10, v11);
    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper task:_alternatePathAvailable:](*(void *)(a1 + 24), v6, a3);
    }
  }
}

- (void)dataTask:(void *)a3 didBecomeStreamTask:(void *)a4 completionHandler:
{
  id v7 = a2;
  id v8 = a3;
  id v10 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v9, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didBecomeStreamTask])
    {
      id v13 = *(id *)(a1 + 40);
      id v14 = *(id *)(a1 + 48);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __82____NSCFURLSessionDelegateWrapper_dataTask_didBecomeStreamTask_completionHandler___block_invoke;
      v18[3] = &unk_1E5252680;
      id v19 = v11;
      id v20 = v13;
      id v21 = v7;
      id v22 = v8;
      id v23 = v14;
      id v24 = v10;
      id v15 = v14;
      id v16 = v13;
      -[NSURLSession runDelegateBlock:]((uint64_t)v16, v18);
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 24);
      if (v17) {
        -[__NSCFURLSessionDelegateWrapper dataTask:didBecomeStreamTask:completionHandler:](v17, v7, v8, v10);
      }
      else {
        v10[2](v10);
      }
    }
  }
}

- (void)_willRetryBackgroundDataTask:(void *)a3 withError:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    char v10 = *(unsigned char *)(a1 + 11);
    if ((v10 & 0x40) != 0)
    {
      char v12 = *(unsigned char *)(a1 + 17);
      if ((v12 & 2) != 0)
      {
LABEL_7:
        id v13 = *(id *)(a1 + 40);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke;
        v23[3] = &unk_1E5256948;
        id v24 = v9;
        id v25 = v13;
        id v26 = v5;
        id v27 = v7;
        id v14 = v13;
        -[NSURLSession runDelegateBlock:]((uint64_t)v14, v23);
        id v15 = &v24;
        id v16 = &v25;
        uint64_t v17 = &v26;

        goto LABEL_14;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v11 = 2;
      }
      else {
        char v11 = 0;
      }
      char v12 = *(unsigned char *)(a1 + 17) & 0xFD | v11;
      *(unsigned char *)(a1 + 17) = v12;
      char v10 = *(unsigned char *)(a1 + 11) | 0x40;
      *(unsigned char *)(a1 + 11) = v10;
      if ((v12 & 2) != 0) {
        goto LABEL_7;
      }
    }
    if ((v10 & 0x20) == 0)
    {
      objc_getProperty((id)a1, v8, 32, 1);
      char v12 = *(unsigned char *)(a1 + 17) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(unsigned char *)(a1 + 17) = v12;
      *(unsigned char *)(a1 + 11) |= 0x20u;
    }
    if ((v12 & 1) == 0)
    {
      -[__NSCFURLSessionDelegateWrapper _willRetryBackgroundDataTask:withError:](*(void *)(a1 + 24), v5, v7);
LABEL_15:

      goto LABEL_16;
    }
    id v18 = *(id *)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __74____NSCFURLSessionDelegateWrapper__willRetryBackgroundDataTask_withError___block_invoke_2;
    v19[3] = &unk_1E52582F0;
    id v20 = v9;
    id v21 = v18;
    id v22 = v5;
    id v14 = v18;
    -[NSURLSession runDelegateBlock:]((uint64_t)v14, v19);
    id v15 = &v20;
    id v16 = &v21;
    uint64_t v17 = &v22;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
}

- (void)downloadTask:(uint64_t)a3 didWriteData:(uint64_t)a4 totalBytesWritten:(uint64_t)a5 totalBytesExpectedToWrite:(void *)a6 completionHandler:
{
  id v11 = a2;
  id v13 = a6;
  if (a1)
  {
    id v14 = objc_getProperty((id)a1, v12, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didWriteData])
    {
      id v16 = *(id *)(a1 + 40);
      id v17 = *(id *)(a1 + 48);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __123____NSCFURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke;
      v21[3] = &unk_1E5252838;
      id v22 = v14;
      id v23 = v16;
      uint64_t v27 = a3;
      uint64_t v28 = a4;
      uint64_t v29 = a5;
      id v24 = v11;
      id v25 = v17;
      id v26 = v13;
      id v18 = v17;
      id v19 = v16;
      -[NSURLSession runDelegateBlock:]((uint64_t)v19, v21);
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 24);
      if (v20) {
        -[__NSCFURLSessionDelegateWrapper downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:completionHandler:](v20, v11, a3, a4, a5, v13);
      }
      else {
        v13[2](v13);
      }
    }
  }
}

- (void)downloadTask:(uint64_t)a3 didResumeAtOffset:(uint64_t)a4 expectedTotalBytes:
{
  id v8 = a2;
  if (a1)
  {
    id v10 = objc_getProperty((id)a1, v7, 32, 1);
    if ((*(unsigned char *)(a1 + 12) & 2) != 0)
    {
      if ((*(unsigned char *)(a1 + 17) & 0x10) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:](*(void *)(a1 + 24), v8, a3, a4);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v9, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v11 = 16;
      }
      else {
        int v11 = 0;
      }
      *(unsigned char *)(a1 + 17) = *(unsigned char *)(a1 + 17) & 0xEF | v11;
      *(unsigned char *)(a1 + 12) |= 2u;
      if (!v11) {
        goto LABEL_7;
      }
    }
    id v12 = *(id *)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __85____NSCFURLSessionDelegateWrapper_downloadTask_didResumeAtOffset_expectedTotalBytes___block_invoke;
    v14[3] = &unk_1E5252860;
    id v15 = v10;
    id v16 = v12;
    id v17 = v8;
    uint64_t v18 = a3;
    uint64_t v19 = a4;
    id v13 = v12;
    -[NSURLSession runDelegateBlock:]((uint64_t)v13, v14);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)readClosedForStreamTask:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(unsigned char *)(a1 + 12) & 0x10) != 0)
    {
      if ((*(unsigned char *)(a1 + 17) & 0x80) != 0)
      {
LABEL_7:
        id v12 = *(id *)(a1 + 40);
        id v13 = *(id *)(a1 + 48);
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __77____NSCFURLSessionDelegateWrapper_readClosedForStreamTask_completionHandler___block_invoke;
        v17[3] = &unk_1E5257F80;
        id v18 = v9;
        id v19 = v12;
        id v20 = v5;
        id v21 = v13;
        id v22 = v7;
        id v14 = v13;
        id v15 = v12;
        -[NSURLSession runDelegateBlock:]((uint64_t)v15, v17);

LABEL_12:
        goto LABEL_13;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if (objc_opt_respondsToSelector()) {
        char v10 = 0x80;
      }
      else {
        char v10 = 0;
      }
      char v11 = v10 & 0x80 | *(unsigned char *)(a1 + 17) & 0x7F;
      *(unsigned char *)(a1 + 17) = v11;
      *(unsigned char *)(a1 + 12) |= 0x10u;
      if (v11 < 0) {
        goto LABEL_7;
      }
    }
    uint64_t v16 = *(void *)(a1 + 24);
    if (v16) {
      -[__NSCFURLSessionDelegateWrapper readClosedForStreamTask:completionHandler:](v16, v5, v7);
    }
    else {
      v7[2](v7);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)writeClosedForStreamTask:(void *)a3 completionHandler:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(unsigned char *)(a1 + 12) & 0x20) != 0)
    {
      if (*(unsigned char *)(a1 + 18)) {
        goto LABEL_4;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      char v10 = *(unsigned char *)(a1 + 18) & 0xFE | objc_opt_respondsToSelector() & 1;
      *(unsigned char *)(a1 + 18) = v10;
      *(unsigned char *)(a1 + 12) |= 0x20u;
      if (v10)
      {
LABEL_4:
        id v11 = *(id *)(a1 + 40);
        id v12 = *(id *)(a1 + 48);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __78____NSCFURLSessionDelegateWrapper_writeClosedForStreamTask_completionHandler___block_invoke;
        v16[3] = &unk_1E5257F80;
        id v17 = v9;
        id v18 = v11;
        id v19 = v5;
        id v20 = v12;
        id v21 = v7;
        id v13 = v12;
        id v14 = v11;
        -[NSURLSession runDelegateBlock:]((uint64_t)v14, v16);

LABEL_9:
        goto LABEL_10;
      }
    }
    uint64_t v15 = *(void *)(a1 + 24);
    if (v15) {
      -[__NSCFURLSessionDelegateWrapper writeClosedForStreamTask:completionHandler:](v15, v5, v7);
    }
    else {
      v7[2](v7);
    }
    goto LABEL_9;
  }
LABEL_10:
}

- (void)betterRouteDiscoveredForStreamTask:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = objc_getProperty((id)a1, v3, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_betterRouteDiscovered])
    {
      id v7 = *(id *)(a1 + 40);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __70____NSCFURLSessionDelegateWrapper_betterRouteDiscoveredForStreamTask___block_invoke;
      v9[3] = &unk_1E52582F0;
      id v10 = v5;
      id v11 = v7;
      id v12 = v4;
      id v8 = v7;
      -[NSURLSession runDelegateBlock:]((uint64_t)v8, v9);
    }
    else
    {
      -[__NSCFURLSessionDelegateWrapper betterRouteDiscoveredForStreamTask:](*(void *)(a1 + 24), v4);
    }
  }
}

- (void)streamTask:(void *)a3 didBecomeInputStream:(void *)a4 outputStream:(void *)a5 completionHandler:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v13 = a5;
  if (a1)
  {
    id v14 = objc_getProperty((id)a1, v12, 32, 1);
    if ([(__NSCFURLSessionDelegateWrapper *)(unsigned __int8 *)a1 check_didBecomeInputOutputStream])
    {
      id v16 = *(id *)(a1 + 40);
      id v17 = *(id *)(a1 + 48);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __98____NSCFURLSessionDelegateWrapper_streamTask_didBecomeInputStream_outputStream_completionHandler___block_invoke;
      v21[3] = &unk_1E52526D0;
      id v22 = v14;
      id v23 = v16;
      id v24 = v9;
      id v25 = v10;
      id v26 = v11;
      id v27 = v17;
      uint64_t v28 = v13;
      id v18 = v17;
      id v19 = v16;
      -[NSURLSession runDelegateBlock:]((uint64_t)v19, v21);
    }
    else
    {
      uint64_t v20 = *(void *)(a1 + 24);
      if (v20) {
        -[__NSCFURLSessionDelegateWrapper streamTask:didBecomeInputStream:outputStream:completionHandler:](v20, v9, v10, v11, v13);
      }
      else {
        v13[2](v13);
      }
    }
  }
}

- (void)_connectionEstablishedForStreamTask:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v6 = objc_getProperty((id)a1, v3, 32, 1);
    if (*(unsigned char *)(a1 + 13))
    {
      if ((*(unsigned char *)(a1 + 18) & 8) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper _connectionEstablishedForStreamTask:](*(void *)(a1 + 24), v4);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v5, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v7 = 8;
      }
      else {
        int v7 = 0;
      }
      *(unsigned char *)(a1 + 18) = *(unsigned char *)(a1 + 18) & 0xF7 | v7;
      *(unsigned char *)(a1 + 13) |= 1u;
      if (!v7) {
        goto LABEL_7;
      }
    }
    id v8 = *(id *)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71____NSCFURLSessionDelegateWrapper__connectionEstablishedForStreamTask___block_invoke;
    v10[3] = &unk_1E52582F0;
    id v11 = v6;
    id v12 = v8;
    id v13 = v4;
    id v9 = v8;
    -[NSURLSession runDelegateBlock:]((uint64_t)v9, v10);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)webSocketTask:(void *)a3 didOpenWithProtocol:
{
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id v9 = objc_getProperty((id)a1, v6, 32, 1);
    if ((*(unsigned char *)(a1 + 13) & 2) != 0)
    {
      if ((*(unsigned char *)(a1 + 18) & 0x10) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper webSocketTask:didOpenWithProtocol:](*(void *)(a1 + 24), v5, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v8, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v10 = 16;
      }
      else {
        int v10 = 0;
      }
      *(unsigned char *)(a1 + 18) = *(unsigned char *)(a1 + 18) & 0xEF | v10;
      *(unsigned char *)(a1 + 13) |= 2u;
      if (!v10) {
        goto LABEL_7;
      }
    }
    id v11 = *(id *)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69____NSCFURLSessionDelegateWrapper_webSocketTask_didOpenWithProtocol___block_invoke;
    v13[3] = &unk_1E5256948;
    id v14 = v9;
    id v15 = v11;
    id v16 = v5;
    id v17 = v7;
    id v12 = v11;
    -[NSURLSession runDelegateBlock:]((uint64_t)v12, v13);

    goto LABEL_10;
  }
LABEL_11:
}

- (void)webSocketTask:(uint64_t)a3 didCloseWithCode:(void *)a4 reason:
{
  id v7 = a2;
  id v9 = a4;
  if (a1)
  {
    id v11 = objc_getProperty((id)a1, v8, 32, 1);
    if ((*(unsigned char *)(a1 + 13) & 4) != 0)
    {
      if ((*(unsigned char *)(a1 + 18) & 0x20) == 0)
      {
LABEL_7:
        -[__NSCFURLSessionDelegateWrapper webSocketTask:didCloseWithCode:reason:](*(void *)(a1 + 24), v7, a3, v9);
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_getProperty((id)a1, v10, 32, 1);
      if (objc_opt_respondsToSelector()) {
        int v12 = 32;
      }
      else {
        int v12 = 0;
      }
      *(unsigned char *)(a1 + 18) = *(unsigned char *)(a1 + 18) & 0xDF | v12;
      *(unsigned char *)(a1 + 13) |= 4u;
      if (!v12) {
        goto LABEL_7;
      }
    }
    id v13 = *(id *)(a1 + 40);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73____NSCFURLSessionDelegateWrapper_webSocketTask_didCloseWithCode_reason___block_invoke;
    v15[3] = &unk_1E52538C0;
    id v16 = v11;
    id v17 = v13;
    id v18 = v7;
    uint64_t v20 = a3;
    id v19 = v9;
    id v14 = v13;
    -[NSURLSession runDelegateBlock:]((uint64_t)v14, v15);

    goto LABEL_10;
  }
LABEL_11:
}

@end