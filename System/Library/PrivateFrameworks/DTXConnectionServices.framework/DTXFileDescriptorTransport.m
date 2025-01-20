@interface DTXFileDescriptorTransport
- (DTXFileDescriptorTransport)init;
- (DTXFileDescriptorTransport)initWithIncomingFileDescriptor:(int)a3 outgoingFileDescriptor:(int)a4 disconnectBlock:(id)a5;
- (DTXFileDescriptorTransport)initWithIncomingFilePath:(id)a3 outgoingFilePath:(id)a4 error:(id *)a5;
- (DTXFileDescriptorTransport)initWithXPCRepresentation:(id)a3;
- (id)serializedXPCRepresentation;
- (int)_createWriteKQueue:(int)a3;
- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4;
- (unsigned)supportedDirections;
- (void)_setupReadSource:(int)a3;
- (void)dealloc;
- (void)disconnect;
- (void)setupWithIncomingDescriptor:(int)a3 outgoingDescriptor:(int)a4 disconnectBlock:(id)a5;
@end

@implementation DTXFileDescriptorTransport

- (DTXFileDescriptorTransport)init
{
  v5.receiver = self;
  v5.super_class = (Class)DTXFileDescriptorTransport;
  v2 = [(DTXTransport *)&v5 init];
  v3 = v2;
  if (v2) {
    sub_22AF51B60(v2);
  }
  return v3;
}

- (DTXFileDescriptorTransport)initWithIncomingFilePath:(id)a3 outgoingFilePath:(id)a4 error:(id *)a5
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  v19.receiver = self;
  v19.super_class = (Class)DTXFileDescriptorTransport;
  v10 = [(DTXTransport *)&v19 init];
  v11 = v10;
  if (v10)
  {
    sub_22AF51B60(v10);
    if (v8)
    {
      uint64_t v14 = sub_22AF51DA8((void *)v8, 0x1000000, a5);
      if ((v14 & 0x80000000) == 0)
      {
        uint64_t v15 = v14;
        memset(&v18, 0, sizeof(v18));
        if (fstat(v14, &v18) || !v18.st_size) {
          [v11 disconnectWithCompletion:v12];
        }
        if (!v9) {
          goto LABEL_15;
        }
LABEL_11:
        if ((sub_22AF51DA8((void *)v9, 16778753, a5) & 0x80000000) != 0) {
          goto LABEL_16;
        }
LABEL_15:
        [v11 setupWithIncomingDescriptor:v12 outgoingDescriptor:v15 disconnectBlock:nil];
        goto LABEL_17;
      }
    }
    else
    {
      if (v9)
      {
        uint64_t v15 = 0xFFFFFFFFLL;
        goto LABEL_11;
      }
      if (v8 | v9)
      {
        uint64_t v15 = 0xFFFFFFFFLL;
        goto LABEL_15;
      }
    }
LABEL_16:
    [v11 disconnectWithTransitionContext:v12 completion:v13];

    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (DTXFileDescriptorTransport)initWithIncomingFileDescriptor:(int)a3 outgoingFileDescriptor:(int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DTXFileDescriptorTransport;
  unint64_t v9 = [(DTXTransport *)&v14 init];
  v10 = v9;
  if (v9)
  {
    sub_22AF51B60(v9);
    if ((int)(v5 & v6) < 0 != v12)
    {

      v10 = 0;
    }
    else
    {
      [v10 setupWithIncomingDescriptor:v11 outgoingDescriptor:v6 disconnectBlock:v5];
    }
  }

  return v10;
}

- (void)_setupReadSource:(int)a3
{
  uint64_t v5 = dispatch_source_create(MEMORY[0x263EF83E8], a3, 0, (dispatch_queue_t)self->_inputQueue);
  if ((a3 & 0x80000000) == 0)
  {
    int v6 = fcntl(a3, 3);
    if ((v6 & 4) == 0) {
      fcntl(a3, 4, v6 | 4u);
    }
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_22AF520B8;
  v12[3] = &unk_264884288;
  int v13 = a3;
  v12[4] = self;
  v7 = (void *)MEMORY[0x230F36B10](v12);
  id v8 = (void *)MEMORY[0x230F36B10]();
  id inputReaderBlock = self->_inputReaderBlock;
  self->_id inputReaderBlock = v8;

  dispatch_source_set_event_handler(v5, self->_inputReaderBlock);
  inputSource = self->_inputSource;
  self->_inputSource = (OS_dispatch_source *)v5;
  v11 = v5;

  dispatch_resume(v11);
}

- (int)_createWriteKQueue:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 < 0 || fcntl(a3, 73, 1) == -1)
  {
    int v6 = __error();
    NSLog(&cfstr_UnableToDisabl.isa, v3, *v6);
    return -1;
  }
  else
  {
    int v4 = kqueue();
    int v5 = v4;
    if (v4 < 0)
    {
      uint64_t v9 = *__error();
      NSLog(&cfstr_FailedToCreate.isa, v9);
    }
    else
    {
      changelist.ident = v3;
      *(_DWORD *)&changelist.filter = 2490366;
      memset(&changelist.fflags, 0, 20);
      if (kevent(v4, &changelist, 1, 0, 0, 0) == -1)
      {
        uint64_t v8 = *__error();
        NSLog(&cfstr_FailedToHandle.isa, v8);
      }
    }
  }
  return v5;
}

- (void)setupWithIncomingDescriptor:(int)a3 outgoingDescriptor:(int)a4 disconnectBlock:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  self->_inFD = a3;
  self->_outFD = a4;
  uint64_t v8 = (void *)MEMORY[0x230F36B10](a5, a2);
  id disconnectBlock = self->_disconnectBlock;
  self->_id disconnectBlock = v8;

  if ([self _watchdogReportType] == 3)
  {
LABEL_2:
    [self disconnectWithReason:v12 andError:v13];
    return;
  }
  if ((v6 & 0x80000000) != 0)
  {
    if ((v5 & 0x80000000) != 0) {
      goto LABEL_2;
    }
  }
  else if ((v5 & 0x80000000) != 0)
  {
LABEL_11:
    [self _setupReadSource:v12 withOptions:v6];
    goto LABEL_12;
  }
  int v14 = [self _createWriteKQueue:v12 withOptions:v5];
  if (v14 < 0) {
    goto LABEL_2;
  }
  self->_outputWaitKQ = v14;
  if ((v6 & 0x80000000) == 0) {
    goto LABEL_11;
  }
LABEL_12:

  [self setStatus:1];
}

- (DTXFileDescriptorTransport)initWithXPCRepresentation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DTXFileDescriptorTransport;
  uint64_t v5 = [(DTXTransport *)&v11 initWithXPCRepresentation:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    sub_22AF51B60(v5);
    uint64_t v7 = xpc_dictionary_dup_fd(v4, "_inFD");
    int v8 = xpc_dictionary_dup_fd(v4, "_outFD");
    if ((v7 & 0x80000000) != 0 && v8 < 0)
    {

      uint64_t v6 = 0;
    }
    else
    {
      [v6 setupWithIncomingDescriptor:v9 outgoingDescriptor:v7 disconnectBlock:nil];
    }
  }

  return v6;
}

- (void)dealloc
{
  int outputWaitKQ = self->_outputWaitKQ;
  if ((outputWaitKQ & 0x80000000) == 0)
  {
    close(outputWaitKQ);
    self->_int outputWaitKQ = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)DTXFileDescriptorTransport;
  [(DTXTransport *)&v4 dealloc];
}

- (id)serializedXPCRepresentation
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_22AF526BC;
  v10 = sub_22AF526CC;
  id v11 = 0;
  outputQueue = self->_outputQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_22AF526D4;
  v5[3] = &unk_2648839B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(outputQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (unint64_t)transmit:(const void *)a3 ofLength:(unint64_t)a4
{
  if ([self a2:a3] == YES)
  {
    uint64_t v15 = 0;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_22AF529AC;
    v14[3] = &unk_264884860;
    v14[4] = self;
    v14[5] = &v15;
    v14[6] = a3;
    v14[7] = a4;
    uint64_t v7 = (unsigned int (**)(void))MEMORY[0x230F36B10](v14);
    while (v7[2](v7) && v16[3] < a4)
    {
      memset(&eventlist, 0, sizeof(eventlist));
      uint64_t v10 = kevent(self->_outputWaitKQ, 0, 0, &eventlist, 1, 0);
      if (v10 == 1)
      {
        if ((__int16)eventlist.flags < 0) {
          goto LABEL_10;
        }
      }
      else if (*__error() != 4)
      {
        id v11 = __error();
        NSLog(&cfstr_KeventFailureN.isa, v10, *v11);
LABEL_10:
        [self disconnectWithError:v8];
        break;
      }
    }
    a4 = v16[3];

    _Block_object_dispose(&v15, 8);
  }
  return a4;
}

- (void)disconnect
{
  inputSource = self->_inputSource;
  if (inputSource) {
    dispatch_source_cancel(inputSource);
  }
  inputQueue = self->_inputQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22AF52C3C;
  block[3] = &unk_264883A58;
  block[4] = self;
  dispatch_sync(inputQueue, block);
  v7.receiver = self;
  v7.super_class = (Class)DTXFileDescriptorTransport;
  [(DTXTransport *)&v7 disconnect];
  outputQueue = self->_outputQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_22AF52CA4;
  v6[3] = &unk_264883A58;
  v6[4] = self;
  dispatch_async(outputQueue, v6);
}

- (unsigned)supportedDirections
{
  int outFD = self->_outFD;
  if (self->_inFD < 0)
  {
    if (outFD < 0)
    {
      v4.receiver = self;
      v4.super_class = (Class)DTXFileDescriptorTransport;
      return [(DTXTransport *)&v4 supportedDirections];
    }
    else
    {
      return 2;
    }
  }
  else if (outFD < 0)
  {
    return 1;
  }
  else
  {
    return 3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disconnectBlock, 0);
  objc_storeStrong(&self->_inputReaderBlock, 0);
  objc_storeStrong((id *)&self->_inputSource, 0);
  objc_storeStrong((id *)&self->_outputQueue, 0);

  objc_storeStrong((id *)&self->_inputQueue, 0);
}

@end