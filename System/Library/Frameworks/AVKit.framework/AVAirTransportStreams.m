@interface AVAirTransportStreams
- (AVAirTransportStreams)initWithInput:(id)a3 output:(id)a4;
- (BOOL)canWrite;
- (BOOL)isReadyToSend;
- (NSInputStream)inputStream;
- (NSOutputStream)outputStream;
- (NSString)description;
- (id)_readAvailableData;
- (id)_readDataNonBlockingUpToMaxLength:(unint64_t)a3;
- (int64_t)_writeData:(id)a3;
- (void)_inputStreamDidClose;
- (void)_inputStreamHasBytesAvailable;
- (void)_outputStreamDidOpen;
- (void)invalidate;
- (void)open;
- (void)stream:(id)a3 handleEvent:(unint64_t)a4;
@end

@implementation AVAirTransportStreams

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputStream, 0);

  objc_storeStrong((id *)&self->_inputStream, 0);
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (void)stream:(id)a3 handleEvent:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!isRunningEventThread()) {
    __assert_rtn("-[AVAirTransportStreams stream:handleEvent:]", "AVAirTransport.m", 211, "isRunningEventThread()");
  }
  id v7 = [(AVAirTransportStreams *)self inputStream];

  id v8 = [(AVAirTransportStreams *)self outputStream];

  v9 = @"Input";
  if (v8 == v6) {
    v9 = @"Output";
  }
  v10 = v9;
  if ((v4 & 8) == 0)
  {
    if ((v4 & 1) == 0) {
      goto LABEL_9;
    }
    v11 = _avairlog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      v17 = "-[AVAirTransportStreams stream:handleEvent:]";
      __int16 v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s %{public}@: OpenCompleted", (uint8_t *)&v16, 0x16u);
    }

    if (v8 == v6)
    {
      [(AVAirTransportStreams *)self _outputStreamDidOpen];
      if ((v4 & 0x10) != 0)
      {
LABEL_10:
        v12 = _avairlog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315394;
          v17 = "-[AVAirTransportStreams stream:handleEvent:]";
          __int16 v18 = 2114;
          v19 = v10;
          _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@: EndEncountered", (uint8_t *)&v16, 0x16u);
        }

        if (v7 == v6)
        {
          [(AVAirTransportStreams *)self _inputStreamDidClose];
          goto LABEL_28;
        }
      }
    }
    else
    {
LABEL_9:
      if ((v4 & 0x10) != 0) {
        goto LABEL_10;
      }
    }
    if ((v4 & 4) != 0)
    {
      v14 = _avairlog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        v17 = "-[AVAirTransportStreams stream:handleEvent:]";
        __int16 v18 = 2114;
        v19 = v10;
        _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@: HasSpaceAvailable", (uint8_t *)&v16, 0x16u);
      }

      if (v8 == v6) {
        [(AVAirTransportStreams *)self _outputStreamCanWrite];
      }
    }
    if ((v4 & 2) != 0)
    {
      v15 = _avairlog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315394;
        v17 = "-[AVAirTransportStreams stream:handleEvent:]";
        __int16 v18 = 2114;
        v19 = v10;
        _os_log_impl(&dword_1B05B7000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@: HasBytesAvailable", (uint8_t *)&v16, 0x16u);
      }

      if (v7 == v6) {
        [(AVAirTransportStreams *)self _inputStreamHasBytesAvailable];
      }
    }
    goto LABEL_28;
  }
  v13 = _avairlog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    v17 = "-[AVAirTransportStreams stream:handleEvent:]";
    __int16 v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s %{public}@: ErrorOccurred", (uint8_t *)&v16, 0x16u);
  }

LABEL_28:
}

- (void)_inputStreamDidClose
{
  [(AVAirTransport *)self terminatePendingRequests];
  id v3 = [(AVAirTransport *)self delegate];
  [v3 airTransportInputDidClose:self];
}

- (void)_outputStreamDidOpen
{
  id v3 = [(AVAirTransport *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(AVAirTransport *)self delegate];
    [v5 airTransportOutputDidOpen:self];
  }
}

- (void)_inputStreamHasBytesAvailable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = _avairlog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]";
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s inputStream hasBytesAvailable", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5640;
  v11 = __Block_byref_object_dispose__5641;
  id v12 = [(AVAirTransportStreams *)self _readAvailableData];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__AVAirTransportStreams__inputStreamHasBytesAvailable__block_invoke;
    v5[3] = &unk_1E5FC26E8;
    v5[4] = self;
    v5[5] = &buf;
    [(AVAirTransport *)self performOnAirChannelQueueSync:v5];
  }
  else
  {
    char v4 = _avairlog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v6 = 136315138;
      id v7 = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]";
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s ... but the data couldn't be read", v6, 0xCu);
    }
  }
  _Block_object_dispose(&buf, 8);
}

void __54__AVAirTransportStreams__inputStreamHasBytesAvailable__block_invoke(uint64_t a1, __n128 a2)
{
  id v3 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  a2.n128_u64[0] = 136315138;
  __n128 v16 = a2;
  do
  {
    char v4 = v3;
    id v5 = objc_msgSend(*(id *)(a1 + 32), "receiveResponseBlocks", *(_OWORD *)&v16);
    id v6 = [v5 firstObject];

    id v7 = [*(id *)(a1 + 32) streamDataTransformer];
    id v3 = [v7 reverseTransformerForMessageData:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    if (v3)
    {
      if (([v3 isIncomplete] & 1) == 0)
      {
        id v8 = *(void **)(a1 + 32);
        if (v6)
        {
          uint64_t v9 = [v8 receiveResponseBlocks];
          [v9 removeObjectAtIndex:0];

          ((void (**)(void, void *, void))v6)[2](v6, v3, 0);
        }
        else
        {
          id v12 = [v8 delegate];

          if (v12)
          {
            uint64_t v13 = [*(id *)(a1 + 32) delegate];
            [v13 airTransport:*(void *)(a1 + 32) didReceiveObject:v3];
          }
          else
          {
            uint64_t v13 = _avairlog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v16.n128_u32[0];
              __int16 v18 = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]_block_invoke";
              _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s unexpected message/response received; delegate not expecting messages",
                buf,
                0xCu);
            }
          }
        }
      }
    }
    else
    {
      v10 = _avairlog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = v16.n128_u32[0];
        __int16 v18 = "-[AVAirTransportStreams _inputStreamHasBytesAvailable]_block_invoke";
        _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s message data failed to deserialize", buf, 0xCu);
      }

      if (v6)
      {
        v11 = [*(id *)(a1 + 32) receiveResponseBlocks];
        [v11 removeObjectAtIndex:0];

        v6[2](v6, 0, -4);
      }
    }
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = 0;
  }
  while (([v3 shouldCallReverseTransformerAgain] & 1) != 0);
}

- (int64_t)_writeData:(id)a3
{
  id v4 = a3;
  id v5 = [(AVAirTransportStreams *)self outputStream];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  uint64_t v8 = [v6 length];

  int64_t v9 = [v5 write:v7 maxLength:v8];
  return v9;
}

- (id)_readAvailableData
{
  if (!isRunningEventThread()) {
    __assert_rtn("-[AVAirTransportStreams _readAvailableData]", "AVAirTransport.m", 140, "isRunningEventThread()");
  }

  return [(AVAirTransportStreams *)self _readDataNonBlockingUpToMaxLength:-1];
}

- (BOOL)canWrite
{
  v2 = [(AVAirTransportStreams *)self outputStream];
  char v3 = [v2 hasSpaceAvailable];

  return v3;
}

- (BOOL)isReadyToSend
{
  v2 = [(AVAirTransportStreams *)self outputStream];
  unint64_t v3 = [v2 streamStatus];

  return v3 > 1;
}

- (id)_readDataNonBlockingUpToMaxLength:(unint64_t)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!isRunningEventThread()) {
    __assert_rtn("-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]", "AVAirTransport.m", 86, "isRunningEventThread()");
  }
  id v5 = [(AVAirTransportStreams *)self inputStream];
  int v6 = [v5 hasBytesAvailable];

  if (!v6)
  {
    id v20 = 0;
    goto LABEL_31;
  }
  if (a3 >= 0x8000) {
    unint64_t v7 = 0x8000;
  }
  else {
    unint64_t v7 = a3;
  }
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v7];
  int64_t v9 = [(AVAirTransportStreams *)self inputStream];
  int v10 = [v9 hasBytesAvailable];

  if (v10)
  {
    uint64_t v11 = 0;
    while (1)
    {
      unint64_t v12 = v7 >= a3 - v11 ? a3 - v11 : v7;
      uint64_t v13 = [(AVAirTransportStreams *)self inputStream];
      id v14 = v8;
      uint64_t v15 = objc_msgSend(v13, "read:maxLength:", objc_msgSend(v14, "mutableBytes") + v11, v12);

      if (v15 < 1) {
        break;
      }
      if (v15 < v12
        || ([(AVAirTransportStreams *)self inputStream],
            __n128 v16 = objc_claimAutoreleasedReturnValue(),
            char v17 = [v16 hasBytesAvailable],
            v16,
            (v17 & 1) == 0))
      {
        [v14 setLength:v15 + v11];
        id v20 = v14;
        goto LABEL_30;
      }
      v11 += v15;
      [v14 increaseLengthBy:0x20000];
      __int16 v18 = [(AVAirTransportStreams *)self inputStream];
      char v19 = [v18 hasBytesAvailable];

      unint64_t v7 = 0x20000;
      if ((v19 & 1) == 0) {
        goto LABEL_29;
      }
    }
    if ((v15 & 0x8000000000000000) == 0)
    {
      v21 = [(AVAirTransportStreams *)self inputStream];
      uint64_t v22 = [v21 streamStatus];

      v23 = _avairlog();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22 == 5)
      {
        if (v24)
        {
          int v32 = 136315138;
          v33 = "-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]";
          v25 = "%s the input data disappeared! the input stream has closed.";
          v26 = v23;
          uint32_t v27 = 12;
LABEL_27:
          _os_log_impl(&dword_1B05B7000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v32, v27);
        }
      }
      else if (v24)
      {
        int v32 = 136315394;
        v33 = "-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]";
        __int16 v34 = 1024;
        LODWORD(v35) = v22;
        v25 = "%s the input data disappeared! Are multiple clients trying to read from this stream? (status = %d)";
        v26 = v23;
        uint32_t v27 = 18;
        goto LABEL_27;
      }

      goto LABEL_29;
    }
    v28 = _avairlog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [(AVAirTransportStreams *)self inputStream];
      v30 = [v29 streamError];
      int v32 = 136315394;
      v33 = "-[AVAirTransportStreams _readDataNonBlockingUpToMaxLength:]";
      __int16 v34 = 2114;
      v35 = v30;
      _os_log_impl(&dword_1B05B7000, v28, OS_LOG_TYPE_DEFAULT, "%s an error prevented bytes from being read! (%{public}@)", (uint8_t *)&v32, 0x16u);
    }
  }
LABEL_29:
  id v20 = 0;
LABEL_30:

LABEL_31:

  return v20;
}

- (NSString)description
{
  v13.receiver = self;
  v13.super_class = (Class)AVAirTransportStreams;
  unint64_t v3 = [(AVAirTransport *)&v13 delegate];
  if (v3)
  {
    id v4 = NSString;
    id v5 = (objc_class *)objc_opt_class();
    int v6 = NSStringFromClass(v5);
    unint64_t v7 = [v4 stringWithFormat:@"<%@ %p>", v6, v3];
  }
  else
  {
    unint64_t v7 = @"nil";
  }
  uint64_t v8 = NSString;
  int64_t v9 = (objc_class *)objc_opt_class();
  int v10 = NSStringFromClass(v9);
  uint64_t v11 = [v8 stringWithFormat:@"<%@ %p: (<%@, >%@), delegate=%@>", v10, self, self->_inputStream, self->_outputStream, v7];

  return (NSString *)v11;
}

- (void)open
{
  if (![(NSInputStream *)self->_inputStream streamStatus]) {
    [(NSInputStream *)self->_inputStream open];
  }
  if (![(NSOutputStream *)self->_outputStream streamStatus])
  {
    outputStream = self->_outputStream;
    [(NSOutputStream *)outputStream open];
  }
}

- (void)invalidate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(NSInputStream *)self->_inputStream setDelegate:0];
  [(NSOutputStream *)self->_outputStream setDelegate:0];
  inputStream = self->_inputStream;
  id v4 = +[AVAirTransport eventRunLoop];
  uint64_t v5 = *MEMORY[0x1E4F1C4B0];
  [(NSInputStream *)inputStream removeFromRunLoop:v4 forMode:*MEMORY[0x1E4F1C4B0]];

  outputStream = self->_outputStream;
  unint64_t v7 = +[AVAirTransport eventRunLoop];
  [(NSOutputStream *)outputStream removeFromRunLoop:v7 forMode:v5];

  [(NSInputStream *)self->_inputStream close];
  [(NSOutputStream *)self->_outputStream close];
  uint64_t v8 = _avairlog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v9 = self->_inputStream;
    int v10 = self->_outputStream;
    *(_DWORD *)long long buf = 136315650;
    uint64_t v15 = "-[AVAirTransportStreams invalidate]";
    __int16 v16 = 2048;
    char v17 = v9;
    __int16 v18 = 2048;
    char v19 = v10;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s shutting down streams %p and %p", buf, 0x20u);
  }

  uint64_t v11 = self->_inputStream;
  self->_inputStream = 0;

  unint64_t v12 = self->_outputStream;
  self->_outputStream = 0;

  v13.receiver = self;
  v13.super_class = (Class)AVAirTransportStreams;
  [(AVAirTransport *)&v13 invalidate];
}

- (AVAirTransportStreams)initWithInput:(id)a3 output:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVAirTransportStreams;
  int64_t v9 = [(AVAirTransport *)&v18 _initPrivate];
  int v10 = (AVAirTransportStreams *)v9;
  if (v9)
  {
    uint64_t v11 = v9 + 7;
    objc_storeStrong(v9 + 7, a3);
    objc_storeStrong((id *)&v10->_outputStream, a4);
    [*v11 setDelegate:v10];
    id v12 = *v11;
    objc_super v13 = +[AVAirTransport eventRunLoop];
    uint64_t v14 = *MEMORY[0x1E4F1C4B0];
    [v12 scheduleInRunLoop:v13 forMode:*MEMORY[0x1E4F1C4B0]];

    [(NSOutputStream *)v10->_outputStream setDelegate:v10];
    outputStream = v10->_outputStream;
    __int16 v16 = +[AVAirTransport eventRunLoop];
    [(NSOutputStream *)outputStream scheduleInRunLoop:v16 forMode:v14];
  }
  return v10;
}

@end