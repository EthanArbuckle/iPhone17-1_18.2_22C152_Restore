@interface MCResourceDownloader
- (MCPeerID)peerID;
- (MCResourceDownloader)initWithSession:(id)a3 resourceUrl:(id)a4 name:(id)a5 peerID:(id)a6;
- (MCSession)session;
- (NSString)resourceName;
- (NSURLSession)urlSession;
- (NSURLSessionDataTask)urlTask;
- (id)urlResponseHandler;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)dealloc;
- (void)sendData:(id)a3 fromByteOffset:(unint64_t)a4;
- (void)setPeerID:(id)a3;
- (void)setResourceName:(id)a3;
- (void)setSession:(id)a3;
- (void)setUrlResponseHandler:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)setUrlTask:(id)a3;
- (void)syncCloseStreamForSession:(id)a3 withError:(id)a4;
@end

@implementation MCResourceDownloader

- (MCResourceDownloader)initWithSession:(id)a3 resourceUrl:(id)a4 name:(id)a5 peerID:(id)a6
{
  v14.receiver = self;
  v14.super_class = (Class)MCResourceDownloader;
  v10 = [(MCResourceDownloader *)&v14 init];
  v11 = v10;
  if (v10)
  {
    [(MCResourceDownloader *)v10 setSession:a3];
    [(MCResourceDownloader *)v11 setResourceName:a5];
    [(MCResourceDownloader *)v11 setPeerID:a6];
    uint64_t v12 = [MEMORY[0x263EFC630] requestWithURL:a4];
    -[MCResourceDownloader setUrlSession:](v11, "setUrlSession:", objc_msgSend(MEMORY[0x263EFC640], "sessionWithConfiguration:delegate:delegateQueue:", objc_msgSend(MEMORY[0x263EFC648], "defaultSessionConfiguration"), v11, 0));
    [(MCResourceDownloader *)v11 setUrlTask:[(NSURLSession *)v11->_urlSession dataTaskWithRequest:v12]];
    [(NSURLSessionDataTask *)v11->_urlTask resume];
  }
  return v11;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_session, 0);
  _Block_release(self->_urlResponseHandler);
  v3.receiver = self;
  v3.super_class = (Class)MCResourceDownloader;
  [(MCResourceDownloader *)&v3 dealloc];
}

- (MCSession)session
{
  return (MCSession *)objc_loadWeak((id *)&self->_session);
}

- (void)setSession:(id)a3
{
}

- (void)syncCloseStreamForSession:(id)a3 withError:(id)a4
{
  v7 = objc_msgSend((id)objc_msgSend(a3, "peerStates"), "objectForKey:", self->_peerID);
  v8 = objc_msgSend((id)objc_msgSend(v7, "outgoingStreams"), "objectForKey:", self->_resourceName);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a3, "syncSendXDataStreamCloseFromSenderToPID:streamID:closeReason:", -[MCPeerID pid](self->_peerID, "pid"), objc_msgSend(v8, "streamID"), 2 * (a4 != 0));
    peerID = self->_peerID;
    [a3 syncCloseOutgoingStream:v9 forPeer:peerID state:v7 error:a4 shouldTriggerCancelProgress:0];
  }
  else
  {
    v11 = objc_msgSend((id)objc_msgSend(v7, "outgoingStreamRequests"), "objectForKey:", self->_resourceName);
    if ([v11 completionHandler])
    {
      uint64_t v12 = [a3 callbackQueue];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __60__MCResourceDownloader_syncCloseStreamForSession_withError___block_invoke;
      v13[3] = &unk_264337D58;
      v13[4] = v11;
      v13[5] = a4;
      dispatch_async(v12, v13);
    }
    objc_msgSend((id)objc_msgSend(v7, "outgoingStreamRequests"), "removeObjectForKey:", self->_resourceName);
  }
}

uint64_t __60__MCResourceDownloader_syncCloseStreamForSession_withError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];
  (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 setCompletionHandler:0];
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v8 = [(MCResourceDownloader *)self session];
  v9 = mcs_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v13 = a3;
    __int16 v14 = 2112;
    id v15 = a5;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "URL session[%@] did complete with error [%@].", buf, 0x16u);
  }
  if (a5)
  {
    if (v8)
    {
      v10 = [(MCSession *)v8 syncQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__MCResourceDownloader_URLSession_task_didCompleteWithError___block_invoke;
      block[3] = &unk_264337D80;
      block[4] = self;
      block[5] = v8;
      block[6] = a5;
      dispatch_async(v10, block);
    }
  }
}

void __61__MCResourceDownloader_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) syncCloseStreamForSession:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
  uint64_t v2 = *(void **)(a1 + 40);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v10 = mcs_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = a4;
    __int16 v17 = 2112;
    id v18 = a5;
    _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "URLSession received task[%@] response[%@].", buf, 0x16u);
  }
  v11 = [(MCResourceDownloader *)self session];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = [(MCSession *)v11 syncQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
    block[3] = &unk_264337DA8;
    block[4] = v12;
    block[5] = self;
    void block[7] = a4;
    block[8] = a6;
    block[6] = a5;
    dispatch_async(v13, block);
  }
}

void __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerStates"), "objectForKey:", *(void *)(*(void *)(a1 + 40) + 48));
  objc_super v3 = objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "objectForKey:", *(void *)(*(void *)(a1 + 40) + 40));
  v4 = mcs_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412802;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = [v3 name];
    __int16 v16 = 1024;
    int v17 = [v3 streamID];
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Streaming: received HTTP response [%@] stream name [%@] streamID [%08X].", buf, 0x1Cu);
  }
  int v6 = [*(id *)(a1 + 48) statusCode];
  v7 = *(void (***)(void, void))(a1 + 64);
  if (v6 == 200)
  {
    *(void *)(*(void *)(a1 + 40) + 24) = _Block_copy(v7);
    if (![*(id *)(a1 + 56) countOfBytesExpectedToReceive]) {
      [v3 setProgressUnbounded:1];
    }
    objc_msgSend((id)objc_msgSend(v3, "progress"), "setTotalUnitCount:", objc_msgSend(*(id *)(a1 + 56), "countOfBytesExpectedToReceive"));
    [*(id *)(a1 + 32) syncStartStreamWithName:*(void *)(*(void *)(a1 + 40) + 40) toPeer:*(void *)(*(void *)(a1 + 40) + 48) mcFD:0xFFFFFFFFLL isResource:1];
  }
  else
  {
    v7[2](v7, 0);
    uint64_t v8 = [MEMORY[0x263EFC5E0] localizedStringForStatusCode:v6];
    uint64_t v9 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 6, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", v8, *MEMORY[0x263F08320]));
    if ([v3 completionHandler])
    {
      v10 = [*(id *)(a1 + 32) callbackQueue];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_173;
      v11[3] = &unk_264337D58;
      v11[4] = v3;
      v11[5] = v9;
      dispatch_async(v10, v11);
    }
    objc_msgSend((id)objc_msgSend(v2, "outgoingStreamRequests"), "removeObjectForKey:", *(void *)(*(void *)(a1 + 40) + 40));
  }
}

uint64_t __81__MCResourceDownloader_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_173(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];
  (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
  objc_super v3 = *(void **)(a1 + 32);

  return [v3 setCompletionHandler:0];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v8 = mcs_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = a4;
    __int16 v16 = 1024;
    int v17 = [a5 length];
    _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "URLSession received task[%@] bytes[%d].", buf, 0x12u);
  }
  [(NSURLSessionDataTask *)self->_urlTask suspend];
  uint64_t v9 = [(MCResourceDownloader *)self session];
  if (v9)
  {
    v10 = v9;
    if ([a5 length])
    {
      [(MCResourceDownloader *)self sendData:a5 fromByteOffset:0];
    }
    else
    {
      uint64_t v12 = [(MCSession *)v10 syncQueue];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __59__MCResourceDownloader_URLSession_dataTask_didReceiveData___block_invoke;
      v13[3] = &unk_264337D58;
      v13[4] = self;
      v13[5] = v10;
      dispatch_async(v12, v13);
    }
  }
  else
  {
    v11 = mcs_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MCResourceDownloader URLSession:dataTask:didReceiveData:]();
    }
    [(NSURLSessionDataTask *)self->_urlTask cancel];
  }
}

void __59__MCResourceDownloader_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncCloseStreamForSession:withError:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"No data.", *MEMORY[0x263F08320])));
  uint64_t v2 = *(void **)(a1 + 40);
}

- (void)sendData:(id)a3 fromByteOffset:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v7 = [(MCResourceDownloader *)self session];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](-[MCSession peerStates](v7, "peerStates"), "objectForKey:", self->_peerID), "outgoingStreams"), "objectForKey:", self->_resourceName);
    [v9 setSourceSuspended:1];
    v20[1] = v20;
    v10 = (_DWORD *)((char *)v20 - ((AGPSessionMaximumSegmentSize(1) + 15) & 0x1FFFFFFF0));
    _DWORD *v10 = bswap32([v9 streamID]);
    LODWORD(v11) = AGPSessionMaximumSegmentSize(1) - 4;
    uint64_t v12 = [a3 length];
    unint64_t v13 = v12 - a4;
    if (v12 - a4 >= (int)v11) {
      size_t v11 = (int)v11;
    }
    else {
      size_t v11 = v12 - a4;
    }
    memcpy(v10 + 1, (const void *)([a3 bytes] + a4), v11);
    __int16 v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v9 name];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      size_t v27 = v11;
      __int16 v28 = 2048;
      unint64_t v29 = v13;
      _os_log_impl(&dword_218756000, v14, OS_LOG_TYPE_DEFAULT, "Streaming: Outgoing HTTP download stream segment [%@]: %ld bytes to send (total %ld).", buf, 0x20u);
    }
    *(_DWORD *)buf = 0;
    unsigned int v23 = [(MCPeerID *)self->_peerID pid];
    uint64_t v16 = [(MCSession *)v8 agpSession];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke;
    v22[3] = &unk_264337DD0;
    v22[8] = v11;
    v22[9] = v13;
    v22[4] = v9;
    v22[5] = self;
    v22[10] = a4;
    v22[6] = a3;
    v22[7] = v8;
    if (AGPSessionSendTo(v16, (int *)&v23, 1, (uint64_t)v10, (int)v11 + 4, (uint64_t)buf, 0, 0xAu, 1, v22))
    {
      int v17 = mcs_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MCResourceDownloader sendData:fromByteOffset:]();
      }
      uint64_t v18 = [(MCSession *)v8 syncQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_177;
      block[3] = &unk_264337D58;
      block[4] = self;
      block[5] = v8;
      dispatch_async(v18, block);
    }
  }
  else
  {
    uint64_t v19 = mcs_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MCResourceDownloader URLSession:dataTask:didReceiveData:]();
    }
    [(NSURLSessionDataTask *)self->_urlTask cancel];
  }
}

void __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) progress])
  {
    int v2 = [*(id *)(a1 + 32) progressUnbounded];
    objc_super v3 = (void *)[*(id *)(a1 + 32) progress];
    v4 = v3;
    if (v2)
    {
      uint64_t v5 = [v3 totalUnitCount];
      uint64_t v6 = v5 - objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "progress"), "completedUnitCount");
      v4 = (void *)[*(id *)(a1 + 32) progress];
      uint64_t v7 = (uint64_t)((double)[v4 completedUnitCount] + (double)v6 * 0.05);
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 64) + [v3 completedUnitCount];
    }
    [v4 setCompletedUnitCount:v7];
  }
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v9 = *(id **)(a1 + 40);
  if (*(void *)(a1 + 72) == v8)
  {
    if ([v9[2] state] == 3)
    {
      v10 = [*(id *)(a1 + 56) syncQueue];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_2;
      v12[3] = &unk_264337D58;
      uint64_t v11 = *(void *)(a1 + 56);
      v12[4] = *(void *)(a1 + 40);
      v12[5] = v11;
      dispatch_async(v10, v12);
    }
    else
    {
      [*(id *)(*(void *)(a1 + 40) + 16) resume];
      [*(id *)(a1 + 32) setSourceSuspended:0];
    }
  }
  else
  {
    [v9 sendData:*(void *)(a1 + 48) fromByteOffset:*(void *)(a1 + 80) + v8];
  }
}

uint64_t __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncCloseStreamForSession:*(void *)(a1 + 40) withError:0];
}

void __48__MCResourceDownloader_sendData_fromByteOffset___block_invoke_177(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "syncCloseStreamForSession:withError:", *(void *)(a1 + 40), objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"MCSession", 0, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Send failure.", *MEMORY[0x263F08320])));
  int v2 = *(void **)(a1 + 40);
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (NSURLSessionDataTask)urlTask
{
  return self->_urlTask;
}

- (void)setUrlTask:(id)a3
{
}

- (id)urlResponseHandler
{
  return self->_urlResponseHandler;
}

- (void)setUrlResponseHandler:(id)a3
{
  self->_urlResponseHandler = a3;
}

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (void)URLSession:dataTask:didReceiveData:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "No MCSession for this resource send.", v2, v3, v4, v5, v6);
}

- (void)sendData:fromByteOffset:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_1(&dword_218756000, v0, v1, "AGPSendTo failed with status: %08X, error: %d.", 67109376, v2);
}

@end