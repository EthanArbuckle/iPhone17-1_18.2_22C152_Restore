@interface APSKStreamAudio
- (APSKStreamAudio)initWithAudioDescription:(const AudioStreamBasicDescription *)a3 delegate:(id)a4 delegateQueue:(id)a5 options:(id)a6;
- (BOOL)active;
- (BOOL)useVideoLatency;
- (const)asbd;
- (id)enqueueAudioDataBlock;
- (int)enqueueAudioData:(id)a3;
- (int)enqueueAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6;
- (void)setAudioSender:(id)a3;
- (void)setUseVideoLatency:(BOOL)a3;
@end

@implementation APSKStreamAudio

- (APSKStreamAudio)initWithAudioDescription:(const AudioStreamBasicDescription *)a3 delegate:(id)a4 delegateQueue:(id)a5 options:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v29.receiver = self;
  v29.super_class = (Class)APSKStreamAudio;
  v13 = [(APSKStreamAudio *)&v29 init];
  v14 = v13;
  if (v13)
  {
    if (a3->mFormatID != 1819304813) {
      goto LABEL_19;
    }
    if (a3->mSampleRate <= 0.0) {
      goto LABEL_19;
    }
    if (!a3->mBytesPerPacket) {
      goto LABEL_19;
    }
    long long v15 = *(_OWORD *)&a3->mSampleRate;
    long long v16 = *(_OWORD *)&a3->mBytesPerPacket;
    *((void *)v13 + 5) = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)(v13 + 24) = v16;
    *(_OWORD *)(v13 + 8) = v15;
    objc_storeWeak((id *)v13 + 6, v10);
    v17 = (dispatch_queue_t *)(v14 + 56);
    objc_storeStrong((id *)v14 + 7, a5);
    objc_storeStrong((id *)v14 + 9, a6);
    objc_storeWeak((id *)v14 + 10, 0);
    *((_WORD *)v14 + 44) = 0;
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.apskstreamaudio.stateq", 0);
    v19 = (void *)*((void *)v14 + 8);
    *((void *)v14 + 8) = v18;

    if (!*((void *)v14 + 8)) {
      goto LABEL_19;
    }
    id WeakRetained = objc_loadWeakRetained((id *)v14 + 6);
    if (WeakRetained)
    {
      dispatch_queue_t v21 = *v17;

      if (!v21)
      {
        dispatch_queue_t v22 = dispatch_queue_create("com.apple.apskstreamaudio.delegateq", 0);
        dispatch_queue_t v23 = *v17;
        dispatch_queue_t *v17 = v22;

        if (!*v17) {
          goto LABEL_19;
        }
      }
    }
    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.apskstreamaudio.dataq", v24);
    v26 = (void *)*((void *)v14 + 13);
    *((void *)v14 + 13) = v25;

    if (!*((void *)v14 + 13)
      || !FigCFWeakReferenceHolderCreateWithReferencedObject()
      || APSRealTimeSignalCreate()
      || APSRingBufferCreate())
    {
LABEL_19:
      APSLogErrorAt();
      v27 = 0;
      goto LABEL_18;
    }
    *((_DWORD *)v14 + 30) = 0;
    if (gLogCategory_AirPlaySenderKit <= 50
      && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v27 = v14;
LABEL_18:

  return v27;
}

- (int)enqueueAudioData:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__APSKStreamAudio_enqueueAudioData___block_invoke;
  block[3] = &unk_265222480;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(queue, block);
  v6 = (void *)v14[5];
  if (v6)
  {
    int v7 = [v6 sendAudioData:v4];
    if (v7)
    {
      v8 = self->_queue;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __36__APSKStreamAudio_enqueueAudioData___block_invoke_2;
      v10[3] = &unk_2652224F8;
      v10[4] = self;
      int v11 = v7;
      dispatch_sync(v8, v10);
    }
  }
  else
  {
    int v7 = -6709;
  }
  _Block_object_dispose(&v13, 8);

  return v7;
}

uint64_t __36__APSKStreamAudio_enqueueAudioData___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  return MEMORY[0x270F9A758]();
}

void __36__APSKStreamAudio_enqueueAudioData___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 89))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 80));

    if (WeakRetained)
    {
      if (gLogCategory_AirPlaySenderKit <= 90
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = *(NSObject **)(v6 + 56);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __36__APSKStreamAudio_enqueueAudioData___block_invoke_3;
        block[3] = &unk_2652224F8;
        block[4] = v6;
        int v9 = *(_DWORD *)(a1 + 40);
        dispatch_async(v7, block);
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 89) = 1;
    }
  }
}

void __36__APSKStreamAudio_enqueueAudioData___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained audioStreamDidFail:*(void *)(a1 + 32) withError:*(unsigned int *)(a1 + 40)];
}

- (int)enqueueAudioDataWithTimestamps:(id)a3 forHostTime:(id *)a4 forSampleTime:(unint64_t)a5 forDiscontinuity:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  uint64_t v21 = 0;
  dispatch_queue_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  dispatch_queue_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke;
  block[3] = &unk_265222480;
  block[4] = self;
  void block[5] = &v21;
  dispatch_sync(queue, block);
  id v12 = (void *)v22[5];
  if (v12)
  {
    long long v18 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    int v13 = [v12 sendAudioDataWithTimestamps:v10 forHostTime:&v18 forSampleTime:a5 forDiscontinuity:v6];
    if (v13)
    {
      v14 = self->_queue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_2;
      v16[3] = &unk_2652224F8;
      v16[4] = self;
      int v17 = v13;
      dispatch_sync(v14, v16);
    }
  }
  else
  {
    int v13 = -6709;
  }
  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  return MEMORY[0x270F9A758]();
}

void __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 89))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 80));

    if (WeakRetained)
    {
      if (gLogCategory_AirPlaySenderKit <= 90
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        int v7 = *(NSObject **)(v6 + 56);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_3;
        block[3] = &unk_2652224F8;
        block[4] = v6;
        int v9 = *(_DWORD *)(a1 + 40);
        dispatch_async(v7, block);
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 89) = 1;
    }
  }
}

void __93__APSKStreamAudio_enqueueAudioDataWithTimestamps_forHostTime_forSampleTime_forDiscontinuity___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained audioStreamDidFail:*(void *)(a1 + 32) withError:*(unsigned int *)(a1 + 40)];
}

- (BOOL)active
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __25__APSKStreamAudio_active__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __25__APSKStreamAudio_active__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = WeakRetained != 0;
}

- (BOOL)useVideoLatency
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__APSKStreamAudio_useVideoLatency__block_invoke;
  v5[3] = &unk_265222480;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__APSKStreamAudio_useVideoLatency__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 88);
  return result;
}

- (void)setUseVideoLatency:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__APSKStreamAudio_setUseVideoLatency___block_invoke;
  v4[3] = &unk_265222978;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

uint64_t __38__APSKStreamAudio_setUseVideoLatency___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 88) = *(unsigned char *)(result + 40);
  return result;
}

- (id)enqueueAudioDataBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__APSKStreamAudio_enqueueAudioDataBlock__block_invoke;
  aBlock[3] = &unk_2652229A0;
  aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  return v2;
}

uint64_t __40__APSKStreamAudio_enqueueAudioDataBlock__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3, CMTime *a4, uint64_t a5, char a6)
{
  uint64_t v14 = 0;
  CMTime v11 = *a4;
  uint64_t v12 = CMClockConvertHostTimeToSystemUnits(&v11);
  uint64_t v13 = a5;
  LODWORD(v14) = a3;
  BYTE4(v14) = a6;
  if ((unint64_t)a3 + 24 > APSRingBufferGetBytesFree()) {
    return 4294960557;
  }
  uint64_t result = APSRingBufferEnqueueBytes();
  if (!result)
  {
    uint64_t result = APSRingBufferEnqueueBytes();
    if (!result)
    {
      atomic_fetch_add((atomic_uint *volatile)(*(void *)(a1 + 32) + 120), 1u);
      APSRealTimeSignalRaise();
      return 0;
    }
  }
  return result;
}

- (void)setAudioSender:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__APSKStreamAudio_setAudioSender___block_invoke;
  v7[3] = &unk_2652224D0;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __34__APSKStreamAudio_setAudioSender___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 80));
  id v4 = WeakRetained;
  if (v2)
  {

    if (v4)
    {
      APSLogErrorAt();
    }
    else
    {
      objc_storeWeak((id *)(*(void *)(a1 + 40) + 80), *(id *)(a1 + 32));
      *(unsigned char *)(*(void *)(a1 + 40) + 89) = 0;
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        uint64_t v7 = *(void *)(a1 + 40);
        id v8 = *(NSObject **)(v7 + 56);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __34__APSKStreamAudio_setAudioSender___block_invoke_2;
        v14[3] = &unk_2652224A8;
        v14[4] = v7;
        char v9 = v14;
LABEL_16:
        dispatch_async(v8, v9);
      }
    }
  }
  else
  {

    if (v4)
    {
      objc_storeWeak((id *)(*(void *)(a1 + 40) + 80), 0);
      if (gLogCategory_AirPlaySenderKit <= 50
        && (gLogCategory_AirPlaySenderKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 40);
        id v8 = *(NSObject **)(v12 + 56);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __34__APSKStreamAudio_setAudioSender___block_invoke_3;
        block[3] = &unk_2652224A8;
        block[4] = v12;
        char v9 = block;
        goto LABEL_16;
      }
    }
  }
}

void __34__APSKStreamAudio_setAudioSender___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained audioStreamDidStart:*(void *)(a1 + 32)];
}

void __34__APSKStreamAudio_setAudioSender___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained audioStreamDidStop:*(void *)(a1 + 32)];
}

- (const)asbd
{
  return &self->_asbd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rtQueue, 0);
  objc_destroyWeak((id *)&self->_audioSender);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end