@interface SLRequestBodyInputStream
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4;
- (BOOL)hasBytesAvailable;
- (NSStreamDelegate)delegate;
- (SLRequestBodyInputStream)initWithMultiParts:(id)a3 multiPartBoundary:(id)a4;
- (id)nextStream;
- (id)streamError;
- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4;
- (unint64_t)bytesRead;
- (unint64_t)streamStatus;
- (unint64_t)totalBytes;
- (void)_scheduleCallback;
- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_streamEventTrigger;
- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SLRequestBodyInputStream

- (SLRequestBodyInputStream)initWithMultiParts:(id)a3 multiPartBoundary:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SLRequestBodyInputStream;
  v9 = [(SLRequestBodyInputStream *)&v39 init];
  if (v9)
  {
    v10 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [[SLRequestMultiPartInputStream alloc] initWithMultiPart:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v13);
    }
    id v30 = v7;

    v17 = [NSString stringWithFormat:@"--%@--\r\n", v8];
    v18 = [v17 dataUsingEncoding:4];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          v9->_dataLength += [*(id *)(*((void *)&v31 + 1) + 8 * j) length];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v21);
    }

    if ([v19 count])
    {
      v9->_dataLength += [v18 length];
      v24 = [MEMORY[0x1E4F1CA10] inputStreamWithData:v18];
      [v19 addObject:v24];
      objc_storeStrong((id *)&v9->_inputStreams, v10);
      uint64_t v25 = [(NSArray *)v9->_inputStreams objectAtIndex:0];
      currentStream = v9->_currentStream;
      v9->_currentStream = (SLRequestMultiPartInputStream *)v25;
    }
    v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](v9->_inputStreams, "count"));
    v29 = [NSNumber numberWithUnsignedInteger:v9->_dataLength];
    _SLLog(v4, 7, @"SLRequestBodyInputStream %@ initWithMultiParts:multiPartBoundary: _inputStreams.count %@ _dataLength %@");

    id v7 = v30;
  }

  return v9;
}

- (void)dealloc
{
  rls = self->_rls;
  if (rls)
  {
    CFRunLoopSourceInvalidate(rls);
    CFRelease(self->_rls);
  }
  release = (void (*)(void *, SEL))self->_clientContext.release;
  if (release) {
    release(self->_clientContext.info, a2);
  }
  v5.receiver = self;
  v5.super_class = (Class)SLRequestBodyInputStream;
  [(SLRequestBodyInputStream *)&v5 dealloc];
}

- (id)nextStream
{
  unint64_t v3 = self->_currentIndex + 1;
  self->_currentIndex = v3;
  if (v3 == [(NSArray *)self->_inputStreams count])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = [(NSArray *)self->_inputStreams objectAtIndex:self->_currentIndex];
  }

  return v4;
}

- (void)_streamEventTrigger
{
  objc_super v5 = [NSNumber numberWithUnsignedInteger:self->_dataOffset];
  [NSNumber numberWithUnsignedInteger:self->_dataLength];
  v24 = v23 = v5;
  uint64_t v22 = self;
  _SLLog(v2, 7, @"SLRequestBodyInputStream %@ _streamEventTrigger _dataOffset %@ _dataLength %@");

  p_selfReferenceDuringStreamEventTrigger = &self->_selfReferenceDuringStreamEventTrigger;
  objc_storeStrong((id *)&self->_selfReferenceDuringStreamEventTrigger, self);
  BOOL openEventSent = self->_openEventSent;
  if (self->_openEventSent)
  {
    unint64_t dataOffset = self->_dataOffset;
    unint64_t dataLength = self->_dataLength;
    if (dataOffset >= dataLength || self->_streamStatus == 6)
    {
      if (dataOffset != dataLength) {
        goto LABEL_17;
      }
      self->_streamStatus = 5;
      clientCallback = (void (*)(SLRequestBodyInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        uint64_t v12 = self;
        uint64_t v13 = 16;
LABEL_11:
        clientCallback(v12, v13, info);
        goto LABEL_17;
      }
      v16 = [(SLRequestBodyInputStream *)self delegate];
      v17 = v16;
      v18 = self;
      uint64_t v19 = 16;
    }
    else
    {
      clientCallback = (void (*)(SLRequestBodyInputStream *, uint64_t, void *))self->_clientCallback;
      if (clientCallback)
      {
        info = self->_clientContext.info;
        uint64_t v12 = self;
        uint64_t v13 = 2;
        goto LABEL_11;
      }
      v16 = [(SLRequestBodyInputStream *)self delegate];
      v17 = v16;
      v18 = self;
      uint64_t v19 = 2;
    }
    [v16 stream:v18 handleEvent:v19];
  }
  else
  {
    uint64_t v14 = (void (*)(SLRequestBodyInputStream *, uint64_t, void *))self->_clientCallback;
    if (v14)
    {
      v14(self, 1, self->_clientContext.info);
    }
    else
    {
      v15 = [(SLRequestBodyInputStream *)self delegate];
      [v15 stream:self handleEvent:1];
    }
    self->_BOOL openEventSent = 1;
  }
LABEL_17:
  if (self->_dataOffset <= self->_dataLength)
  {
    if (openEventSent) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2 object:self file:@"SLRequestBodyInputStream.m" lineNumber:140 description:@"sanity check for stream data"];

  if (!openEventSent) {
LABEL_19:
  }
    [(SLRequestBodyInputStream *)self _scheduleCallback];
LABEL_20:
  uint64_t v20 = *p_selfReferenceDuringStreamEventTrigger;
  *p_selfReferenceDuringStreamEventTrigger = 0;
}

- (void)_scheduleCallback
{
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
  rls = self->_rls;
  if (!rls)
  {
    v10.version = 0;
    memset(&v10.retain, 0, 56);
    v10.info = self;
    v10.perform = (void (__cdecl *)(void *))_streamEventTrigger;
    rls = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v10);
    self->_rls = rls;
    if (!rls)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"SLRequestBodyInputStream.m" lineNumber:176 description:@"should be able to make run loop source"];

      rls = self->_rls;
    }
  }
  CFRunLoopAddSource(a3, rls, a4);
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  p_clientContext = &self->_clientContext;
  if (a5)
  {
    long long v8 = *(_OWORD *)&a5->var0;
    long long v9 = *(_OWORD *)&a5->var2;
    self->_clientContext.copyDescription = a5->var4;
    *(_OWORD *)&p_clientContext->version = v8;
    *(_OWORD *)&self->_clientContext.retain = v9;
    retain = (void (*)(void *, SEL, unint64_t))self->_clientContext.retain;
    if (retain) {
      retain(self->_clientContext.info, a2, a3);
    }
  }
  else
  {
    release = (void (*)(void *, SEL, unint64_t))self->_clientContext.release;
    if (release) {
      release(self->_clientContext.info, a2, a3);
    }
    p_clientContext->copyDescription = 0;
    *(_OWORD *)&p_clientContext->version = 0u;
    *(_OWORD *)&p_clientContext->retain = 0u;
  }
  self->_clientCallback = a4;
  return 1;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  id v6 = a4;
  -[SLRequestBodyInputStream _scheduleInCFRunLoop:forMode:](self, "_scheduleInCFRunLoop:forMode:", [a3 getCFRunLoop], v6);
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  id v6 = a4;
  -[SLRequestBodyInputStream _unscheduleFromCFRunLoop:forMode:](self, "_unscheduleFromCFRunLoop:forMode:", [a3 getCFRunLoop], v6);
}

- (void)open
{
  _SLLog(v2, 7, @"SLRequestBodyInputStream %@ open");
  [(SLRequestBodyInputStream *)self _scheduleCallback];
  self->_streamStatus = 2;
}

- (void)close
{
  _SLLog(v2, 7, @"SLRequestBodyInputStream %@ close");
  rls = self->_rls;
  if (rls) {
    CFRunLoopSourceInvalidate(rls);
  }
  self->_streamStatus = 6;
}

- (id)streamError
{
  return 0;
}

- (unint64_t)streamStatus
{
  return self->_streamStatus;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  [NSNumber numberWithUnsignedInteger:a4];
  v18 = v16 = a3;
  v15 = self;
  _SLLog(v4, 7, @"SLRequestBodyInputStream %@ read: %p maxLength: %@");

  unint64_t v8 = 0;
  if (a4)
  {
    while (self->_dataOffset + v8 < self->_dataLength)
    {
      if (![(SLRequestMultiPartInputStream *)self->_currentStream hasBytesAvailable])
      {
        _SLLog(v4, 6, @"SLRequestBodyInputStream %@ Current stream has no bytes, switching");
        [(SLRequestMultiPartInputStream *)self->_currentStream close];
        long long v9 = [(SLRequestBodyInputStream *)self nextStream];
        currentStream = self->_currentStream;
        self->_currentStream = v9;

        id v11 = self->_currentStream;
        if (!v11)
        {
          _SLLog(v4, 3, @"Bad state, current stream is nil");
          break;
        }
        [(SLRequestMultiPartInputStream *)v11 open];
      }
      v17 = [NSNumber numberWithInteger:v8];
      _SLLog(v4, 6, @"SLRequestBodyInputStream %@ read:maxLength: Will source bytes at offset %@");

      v8 += -[SLRequestMultiPartInputStream read:maxLength:](self->_currentStream, "read:maxLength:", &a3[v8], a4 - v8, self, v17);
      uint64_t v12 = [NSNumber numberWithInteger:v8];
      [NSNumber numberWithUnsignedInteger:a4];
      v18 = v16 = v12;
      v15 = self;
      _SLLog(v4, 6, @"SLRequestBodyInputStream %@ read:maxLength: Total %@ bytes written to buffer, maxLen %@");

      if (v8 >= a4) {
        break;
      }
    }
  }
  self->_dataOffset += v8;
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:v15];
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_dataLength];
  _SLLog(v4, 6, @"SLRequestBodyInputStream %@ read:maxLength: Total %@ bytes streamed, total length is %@");

  [(SLRequestBodyInputStream *)self _scheduleCallback];
  return v8;
}

- (unint64_t)totalBytes
{
  return self->_dataLength;
}

- (unint64_t)bytesRead
{
  return self->_dataOffset;
}

- (BOOL)hasBytesAvailable
{
  return self->_dataOffset < self->_dataLength;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (NSStreamDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSStreamDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selfReferenceDuringStreamEventTrigger, 0);
  objc_storeStrong((id *)&self->_currentStream, 0);

  objc_storeStrong((id *)&self->_inputStreams, 0);
}

@end