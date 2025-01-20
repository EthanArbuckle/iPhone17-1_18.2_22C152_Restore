@interface MFComposeActivityHandoffOperation
+ (id)receivingOperationWithInputStream:(id)a3 outputStream:(id)a4;
+ (id)sendingOperationWithDraftData:(id)a3 inputStream:(id)a4 outputStream:(id)a5;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (MFComposeActivityHandoffOperation)initWithInputStream:(id)a3 outputStream:(id)a4;
- (MFComposeActivityHandoffOperationDelegate)delegate;
- (NSData)draftData;
- (int64_t)transmissionType;
- (unint64_t)bytesExpected;
- (unint64_t)bytesReceived;
- (void)_checkInHandoffStream:(id)a3;
- (void)_commonHandoffStreamInitializationWithStream:(id)a3;
- (void)_complete;
- (void)_didFinishTransferringHandoffPayload;
- (void)_failedToTransferHandoffPayload;
- (void)_finishReceivingHandoffDataAndCloseStream;
- (void)_handleErrorCode:(unint64_t)a3 logString:(id)a4;
- (void)_receivingDataStream:(id)a3 handleEvent:(unint64_t)a4;
- (void)_receivingMessageStream:(id)a3 handleEvent:(unint64_t)a4;
- (void)_sendingDataStream:(id)a3 handleEvent:(unint64_t)a4;
- (void)_sendingMessageStream:(id)a3 handleEvent:(unint64_t)a4;
- (void)_setExecuting:(BOOL)a3;
- (void)_setFinished:(BOOL)a3;
- (void)_startHandoffStreams;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setDraftData:(id)a3;
- (void)setTransmissionType:(int64_t)a3;
- (void)start;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation MFComposeActivityHandoffOperation

+ (id)receivingOperationWithInputStream:(id)a3 outputStream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithInputStream:v6 outputStream:v7];
  v9 = v8;
  if (v8) {
    [v8 setTransmissionType:1];
  }

  return v9;
}

+ (id)sendingOperationWithDraftData:(id)a3 inputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithInputStream:v9 outputStream:v10];
  v12 = v11;
  if (v11)
  {
    [v11 setTransmissionType:2];
    [v12 setDraftData:v8];
  }

  return v12;
}

- (MFComposeActivityHandoffOperation)initWithInputStream:(id)a3 outputStream:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MFComposeActivityHandoffOperation;
  id v9 = [(MFComposeActivityHandoffOperation *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    v9->_draftDataByteIndex = 0;
    objc_storeStrong((id *)&v9->_inputStream, a3);
    objc_storeStrong((id *)&v10->_outputStream, a4);
    v10->_transmissionType = 0;
    dispatch_queue_t v11 = dispatch_queue_create("Activity Handoff Stream Handler", 0);
    streamHandlerQueue = v10->_streamHandlerQueue;
    v10->_streamHandlerQueue = (OS_dispatch_queue *)v11;
  }
  return v10;
}

- (void)dealloc
{
  [(NSInputStream *)self->_inputStream close];
  [(NSOutputStream *)self->_outputStream close];
  v3.receiver = self;
  v3.super_class = (Class)MFComposeActivityHandoffOperation;
  [(MFComposeActivityHandoffOperation *)&v3 dealloc];
}

- (void)start
{
  [(MFComposeActivityHandoffOperation *)self _setExecuting:1];
  if ([(MFComposeActivityHandoffOperation *)self isCancelled])
  {
    [(MFComposeActivityHandoffOperation *)self _complete];
  }
  else
  {
    [(MFComposeActivityHandoffOperation *)self _startHandoffStreams];
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)_setExecuting:(BOOL)a3
{
  [(MFComposeActivityHandoffOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = a3;

  [(MFComposeActivityHandoffOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isExecuting
{
  return !self->_finished;
}

- (void)_setFinished:(BOOL)a3
{
  [(MFComposeActivityHandoffOperation *)self willChangeValueForKey:@"isFinished"];
  self->_finished = a3;

  [(MFComposeActivityHandoffOperation *)self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)_complete
{
  [(MFComposeActivityHandoffOperation *)self _setExecuting:0];

  [(MFComposeActivityHandoffOperation *)self _setFinished:1];
}

- (void)_startHandoffStreams
{
}

- (void)_handleErrorCode:(unint64_t)a3 logString:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    v15 = &v18;
    id v7 = (__CFString *)[[NSString alloc] initWithFormat:v6 arguments:&v18];
  }
  else
  {
    id v7 = @"Unknown Error";
  }
  id v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[MFComposeActivityHandoffOperation _handleErrorCode:logString:]((uint64_t)v7, a3, v8);
  }

  if (a3 >= 0x64)
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = v7;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    dispatch_queue_t v11 = [v9 errorWithDomain:@"MFActivityHandoffOperationError" code:a3 userInfo:v10];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__MFComposeActivityHandoffOperation__handleErrorCode_logString___block_invoke;
    v13[3] = &unk_1E5F79038;
    v13[4] = self;
    id v14 = v11;
    id v12 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v13);
  }
}

void __64__MFComposeActivityHandoffOperation__handleErrorCode_logString___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 activityHandoffOperation:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  streamHandlerQueue = self->_streamHandlerQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MFComposeActivityHandoffOperation_stream_handleEvent___block_invoke;
  block[3] = &unk_1E5F79060;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(streamHandlerQueue, block);
}

void *__56__MFComposeActivityHandoffOperation_stream_handleEvent___block_invoke(void *a1)
{
  result = (void *)a1[4];
  uint64_t v3 = result[39];
  if (v3 == 2)
  {
    uint64_t v5 = a1[5];
    if (result[34] == v5)
    {
      return (void *)[result _sendingDataStream:result[34] handleEvent:a1[6]];
    }
    else if (result[33] == v5)
    {
      return objc_msgSend(result, "_sendingMessageStream:handleEvent:");
    }
  }
  else if (v3 == 1)
  {
    uint64_t v4 = a1[5];
    if (result[33] == v4)
    {
      return (void *)[result _receivingDataStream:result[33] handleEvent:a1[6]];
    }
    else if (result[34] == v4)
    {
      return objc_msgSend(result, "_receivingMessageStream:handleEvent:");
    }
  }
  return result;
}

- (void)_didFinishTransferringHandoffPayload
{
  uint64_t v3 = MFLogGeneral();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF945000, v3, OS_LOG_TYPE_INFO, "#Hand-Off Got success receipt from receiving end.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__MFComposeActivityHandoffOperation__didFinishTransferringHandoffPayload__block_invoke;
  block[3] = &unk_1E5F79088;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __73__MFComposeActivityHandoffOperation__didFinishTransferringHandoffPayload__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 activityHandoffOperation:*(void *)(a1 + 32) didFinishSendingDataWithResult:1];
}

- (void)_failedToTransferHandoffPayload
{
  [(MFComposeActivityHandoffOperation *)self _handleErrorCode:2 logString:@"Receiving end sent failure receipt."];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__MFComposeActivityHandoffOperation__failedToTransferHandoffPayload__block_invoke;
  block[3] = &unk_1E5F79088;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __68__MFComposeActivityHandoffOperation__failedToTransferHandoffPayload__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 activityHandoffOperation:*(void *)(a1 + 32) didFinishSendingDataWithResult:2];
}

- (void)_receivingMessageStream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 8)
  {
    id v8 = v6;
    id v7 = [v6 streamError];
    [(MFComposeActivityHandoffOperation *)self _handleErrorCode:3, @"Receiving Message Channel had error: %@", v7 logString];

    id v6 = v8;
  }
}

- (void)_sendingMessageStream:(id)a3 handleEvent:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  switch(a4)
  {
    case 8uLL:
      id v9 = [v6 streamError];
      [(MFComposeActivityHandoffOperation *)self _handleErrorCode:3, @"Sending Message Channel had error: %@", v9 logString];

      break;
    case 2uLL:
      unsigned int v11 = 0;
      [(NSInputStream *)self->_inputStream read:&v11 maxLength:4];
      uint64_t v10 = bswap32(v11);
      unsigned int v11 = v10;
      if (v10 == 2)
      {
        [(MFComposeActivityHandoffOperation *)self _failedToTransferHandoffPayload];
      }
      else if (v10 == 1)
      {
        [(MFComposeActivityHandoffOperation *)self _didFinishTransferringHandoffPayload];
      }
      else
      {
        [(MFComposeActivityHandoffOperation *)self _handleErrorCode:4, @"Unrecognized message sent to message channel: %d", v10 logString];
      }
      [(MFComposeActivityHandoffOperation *)self _checkInHandoffStream:self->_inputStream];
      break;
    case 1uLL:
      id v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[MFComposeActivityHandoffOperation _sendingMessageStream:handleEvent:]();
      }

      break;
  }
}

- (void)_receivingDataStream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v4 = MEMORY[0x1F4188790](self, a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v7 = v4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = v8;
  if (v6 <= 7)
  {
    if (v6 != 1)
    {
      if (v6 == 2)
      {
        if (*(void *)(v7 + 280))
        {
          memset(__b, 170, sizeof(__b));
          uint64_t v10 = [*(id *)(v7 + 264) read:__b maxLength:0x8000];
          if (v10)
          {
            id v11 = *(id *)(v7 + 280);
            [v11 appendBytes:__b length:v10];
            *(void *)(v7 + 296) += v10;
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __70__MFComposeActivityHandoffOperation__receivingDataStream_handleEvent___block_invoke;
            block[3] = &unk_1E5F79088;
            block[4] = v7;
            dispatch_async(MEMORY[0x1E4F14428], block);
            if ((unint64_t)[v11 length] >= *(void *)(v7 + 304))
            {
              id v12 = MFLogGeneral();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
                -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.4((uint64_t)v23, [v11 length], v12);
              }

              [(id)v7 _finishReceivingHandoffDataAndCloseStream];
            }
            goto LABEL_25;
          }
          v19 = [*(id *)(v7 + 264) streamError];
          BOOL v20 = v19 == 0;

          if (!v20)
          {
            id v11 = [*(id *)(v7 + 264) streamError];
            [(id)v7 _handleErrorCode:102, @"Failed to read bytes from input stream! %@", v11 logString];
LABEL_25:

            goto LABEL_30;
          }
          v21 = MFLogGeneral();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:]((uint64_t)v23, [*(id *)(v7 + 280) length], v21);
          }

          [(id)v7 _finishReceivingHandoffDataAndCloseStream];
        }
        else
        {
          __b[0] = 0;
          [*(id *)(v7 + 264) read:__b maxLength:4];
          int v15 = __b[0];
          __b[0] = bswap32(__b[0]);
          if (v15)
          {
            uint64_t v16 = MFLogGeneral();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
              -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:](__b, v16);
            }

            id v17 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
            uint64_t v18 = *(void **)(v7 + 280);
            *(void *)(v7 + 280) = v17;

            *(void *)(v7 + 296) = 0;
            *(void *)(v7 + 304) = __b[0];
          }
          else
          {
            [(id)v7 _handleErrorCode:101 logString:@"Failed to get expected size from sending end"];
          }
        }
      }
      goto LABEL_30;
    }
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:]();
    }
LABEL_14:

    goto LABEL_30;
  }
  if (v6 == 8)
  {
    id v14 = [*(id *)(v7 + 264) streamError];
    [(id)v7 _handleErrorCode:102, @"Data receiving stream had an error: %@", v14 logString];

    goto LABEL_30;
  }
  if (v6 == 16)
  {
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[MFComposeActivityHandoffOperation _receivingDataStream:handleEvent:].cold.5();
    }
    goto LABEL_14;
  }
LABEL_30:
}

void __70__MFComposeActivityHandoffOperation__receivingDataStream_handleEvent___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 activityHandoffOperationReceivedBytes:*(void *)(a1 + 32)];
}

- (void)_sendingDataStream:(id)a3 handleEvent:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSData *)self->_draftData length])
  {
    if ((uint64_t)a4 > 7)
    {
      if (a4 == 8)
      {
        id v22 = [(NSOutputStream *)self->_outputStream streamError];
        [(MFComposeActivityHandoffOperation *)self _handleErrorCode:104, @"Output stream had an error: %@", v22 logString];
      }
      else if (a4 == 16)
      {
        outputStream = self->_outputStream;
        [(MFComposeActivityHandoffOperation *)self _checkInHandoffStream:outputStream];
      }
    }
    else if (a4 == 1)
    {
      uint64_t v18 = MFLogGeneral();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[MFComposeActivityHandoffOperation _sendingDataStream:handleEvent:]();
      }
    }
    else if (a4 == 4)
    {
      NSUInteger v6 = [(NSData *)self->_draftData length];
      uint64_t v10 = v6;
      p_unint64_t draftDataByteIndex = &self->_draftDataByteIndex;
      unint64_t draftDataByteIndex = self->_draftDataByteIndex;
      if (!draftDataByteIndex)
      {
        unsigned int v23 = bswap32(v6);
        [(NSOutputStream *)self->_outputStream write:&v23 maxLength:4];
        v13 = MFLogGeneral();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[MFComposeActivityHandoffOperation _sendingDataStream:handleEvent:](v10, v13, v14);
        }

        unint64_t draftDataByteIndex = *p_draftDataByteIndex;
      }
      unint64_t v15 = v10 - draftDataByteIndex;
      if (v15 >= 0x8000) {
        size_t v16 = 0x8000;
      }
      else {
        size_t v16 = v15;
      }
      if (v16)
      {
        MEMORY[0x1F4188790](v6, v7, v8, v9);
        memset((char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v16);
        -[NSData getBytes:range:](self->_draftData, "getBytes:range:", (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), *p_draftDataByteIndex, v16);
        *p_draftDataByteIndex += [(NSOutputStream *)self->_outputStream write:(char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) maxLength:v16];
      }
      else
      {
        v19 = MFLogGeneral();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[MFComposeActivityHandoffOperation _sendingDataStream:handleEvent:]((uint64_t *)&self->_draftDataByteIndex, v19, v20);
        }

        [(MFComposeActivityHandoffOperation *)self _checkInHandoffStream:self->_outputStream];
      }
    }
  }
  else
  {
    [(MFComposeActivityHandoffOperation *)self _handleErrorCode:103 logString:@"Could not handle sending stream event. Draft data length was zero."];
  }
}

- (void)_finishReceivingHandoffDataAndCloseStream
{
  if (pthread_main_np())
  {
    NSUInteger v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"MFActivityHandoffOperation.m" lineNumber:395 description:@"Current thread is main"];
  }
  inputStream = self->_inputStream;
  if (inputStream && [(NSInputStream *)inputStream streamStatus] != 6)
  {
    [(MFComposeActivityHandoffOperation *)self _checkInHandoffStream:self->_inputStream];
    if ([(NSData *)self->_draftData length]) {
      int v5 = 0x1000000;
    }
    else {
      int v5 = 0x2000000;
    }
    int v8 = v5;
    [(NSOutputStream *)self->_outputStream write:&v8 maxLength:4];
    [(MFComposeActivityHandoffOperation *)self _checkInHandoffStream:self->_outputStream];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__MFComposeActivityHandoffOperation__finishReceivingHandoffDataAndCloseStream__block_invoke;
    v7[3] = &unk_1E5F79088;
    v7[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], v7);
  }
}

void __78__MFComposeActivityHandoffOperation__finishReceivingHandoffDataAndCloseStream__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 activityHandoffOperation:*(void *)(a1 + 32) didFinishReceivingData:*(void *)(*(void *)(a1 + 32) + 280)];
}

- (void)_commonHandoffStreamInitializationWithStream:(id)a3
{
  id v5 = a3;
  [v5 setDelegate:self];
  uint64_t v4 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v5 scheduleInRunLoop:v4 forMode:*MEMORY[0x1E4F1C3A0]];

  [v5 open];
}

- (void)_checkInHandoffStream:(id)a3
{
  uint64_t v4 = (NSInputStream *)a3;
  id v5 = v4;
  if ((NSInputStream *)self->_outputStream == v4)
  {
    self->_doneWithOutputStream = 1;
  }
  else if (self->_inputStream == v4)
  {
    self->_doneWithInputStream = 1;
  }
  if (self->_doneWithInputStream && self->_doneWithOutputStream)
  {
    NSUInteger v6 = (void *)MEMORY[0x1E4F1C3A0];
    if (self->_inputStream)
    {
      uint64_t v7 = MFLogGeneral();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);

      if (v8)
      {
        uint64_t v9 = MFLogGeneral();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AF945000, v9, OS_LOG_TYPE_INFO, "#Hand-Off Closing stream: Input Stream", buf, 2u);
        }
      }
      [(NSInputStream *)self->_inputStream close];
      inputStream = self->_inputStream;
      id v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(NSInputStream *)inputStream removeFromRunLoop:v11 forMode:*v6];

      id v12 = self->_inputStream;
      self->_inputStream = 0;
    }
    if (self->_outputStream)
    {
      v13 = MFLogGeneral();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

      if (v14)
      {
        unint64_t v15 = MFLogGeneral();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1AF945000, v15, OS_LOG_TYPE_INFO, "#Hand-Off Closing stream: Output Stream", v19, 2u);
        }
      }
      [(NSOutputStream *)self->_outputStream close];
      outputStream = self->_outputStream;
      id v17 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(NSOutputStream *)outputStream removeFromRunLoop:v17 forMode:*v6];

      uint64_t v18 = self->_outputStream;
      self->_outputStream = 0;
    }
    [(MFComposeActivityHandoffOperation *)self _complete];
    self->_doneWithInputStream = 0;
    self->_doneWithOutputStream = 0;
  }
}

- (unint64_t)bytesReceived
{
  return self->_draftBytesReceived;
}

- (unint64_t)bytesExpected
{
  return self->_draftExpectedSize;
}

- (int64_t)transmissionType
{
  return self->_transmissionType;
}

- (void)setTransmissionType:(int64_t)a3
{
  self->_transmissionType = a3;
}

- (NSData)draftData
{
  return self->_draftData;
}

- (void)setDraftData:(id)a3
{
}

- (MFComposeActivityHandoffOperationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFComposeActivityHandoffOperationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_draftData, 0);
  objc_storeStrong((id *)&self->_outputStream, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);

  objc_storeStrong((id *)&self->_streamHandlerQueue, 0);
}

- (void)_handleErrorCode:(os_log_t)log logString:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "#Hand-Off ** Handoff Operation Error (%lu): %@", (uint8_t *)&v3, 0x16u);
}

- (void)_sendingMessageStream:handleEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AF945000, v0, v1, "#Hand-Off Sending message input stream opened.", v2, v3, v4, v5, v6);
}

- (void)_receivingDataStream:handleEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AF945000, v0, v1, "#Hand-Off Receiving stream opened.", v2, v3, v4, v5, v6);
}

- (void)_receivingDataStream:(int *)a1 handleEvent:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1AF945000, a2, OS_LOG_TYPE_DEBUG, "#Hand-Off Expecting message of size: %d bytes", (uint8_t *)v3, 8u);
}

- (void)_receivingDataStream:(NSObject *)a3 handleEvent:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1(&dword_1AF945000, a3, (uint64_t)a3, "#Hand-Off Finished reading from stream. Got %lu bytes", (uint8_t *)a1);
}

- (void)_receivingDataStream:(NSObject *)a3 handleEvent:.cold.4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_1(&dword_1AF945000, a3, (uint64_t)a3, "#Hand-Off It looks like we got all the data (%lu bytes) from the input stream. Closing.", (uint8_t *)a1);
}

- (void)_receivingDataStream:handleEvent:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AF945000, v0, v1, "#Hand-Off Receiving stream end occurred.", v2, v3, v4, v5, v6);
}

- (void)_sendingDataStream:handleEvent:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AF945000, v0, v1, "#Hand-Off Sending stream opened.", v2, v3, v4, v5, v6);
}

- (void)_sendingDataStream:(uint64_t)a3 handleEvent:.cold.2(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_1(&dword_1AF945000, a2, a3, "#Hand-Off Done sending message payload. Sent %lu bytes.", (uint8_t *)&v4);
}

- (void)_sendingDataStream:(uint64_t)a3 handleEvent:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AF945000, a2, a3, "#Hand-Off Sending message payload of size: %lu bytes", (uint8_t *)&v3);
}

@end