@interface _EARSpeechRecognitionAudioBuffer
+ (void)initialize;
- (double)bufferedAudioDuration;
- (double)consumedAudioDuration;
- (id).cxx_construct;
- (id)_initWithAudioBuffer:(shared_ptr<quasar:(id)a4 :RecogAudioBufferBase>)a3 speechRecognizer:;
- (unint64_t)packetArrivalTimestampFromAudioTime:(float)a3;
- (void)_detachFromRecognizer;
- (void)_setUnderlyingBuffer:(shared_ptr<quasar::RecogAudioBufferBase>)a3;
- (void)addAudioSampleData:(id)a3;
- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4;
- (void)cancelRecognition;
- (void)endAudio;
- (void)stopAudioDecoding;
- (void)triggerServerSideEndPointer;
@end

@implementation _EARSpeechRecognitionAudioBuffer

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (id)_initWithAudioBuffer:(shared_ptr<quasar:(id)a4 :RecogAudioBufferBase>)a3 speechRecognizer:
{
  ptr = a3.__ptr_;
  v6 = a3.__cntrl_;
  v15.receiver = self;
  v15.super_class = (Class)_EARSpeechRecognitionAudioBuffer;
  v7 = [(_EARSpeechRecognitionAudioBuffer *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v10 = *(RecogAudioBufferBase **)ptr;
    uint64_t v9 = *((void *)ptr + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v7->_buffer.__cntrl_;
    v8->_buffer.__ptr_ = v10;
    v8->_buffer.__cntrl_ = (__shared_weak_count *)v9;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.siri._EARSpeechRecognitionAudioBuffer", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeWeak((id *)&v8->_speechRecognizer, v6);
  }

  return v8;
}

- (void)addAudioSamples:(const signed __int16 *)a3 count:(unint64_t)a4
{
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:a3 length:2 * a4];
  -[_EARSpeechRecognitionAudioBuffer addAudioSampleData:](self, "addAudioSampleData:");
}

- (void)addAudioSampleData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55___EARSpeechRecognitionAudioBuffer_addAudioSampleData___block_invoke;
  v7[3] = &unk_1E5FFE528;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)endAudio
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___EARSpeechRecognitionAudioBuffer_endAudio__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)triggerServerSideEndPointer
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___EARSpeechRecognitionAudioBuffer_triggerServerSideEndPointer__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelRecognition
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___EARSpeechRecognitionAudioBuffer_cancelRecognition__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)stopAudioDecoding
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___EARSpeechRecognitionAudioBuffer_stopAudioDecoding__block_invoke;
  block[3] = &unk_1E5FFE4B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_setUnderlyingBuffer:(shared_ptr<quasar::RecogAudioBufferBase>)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3321888768;
  block[2] = __57___EARSpeechRecognitionAudioBuffer__setUnderlyingBuffer___block_invoke;
  block[3] = &unk_1F0A63CA8;
  uint64_t v6 = *(void *)a3.__ptr_;
  id v5 = (std::__shared_weak_count *)*((void *)a3.__ptr_ + 1);
  block[4] = self;
  void block[5] = v6;
  id v8 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  dispatch_async(queue, block);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

- (void)_detachFromRecognizer
{
}

- (double)bufferedAudioDuration
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___EARSpeechRecognitionAudioBuffer_bufferedAudioDuration__block_invoke;
  v5[3] = &unk_1E5FFE550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)consumedAudioDuration
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57___EARSpeechRecognitionAudioBuffer_consumedAudioDuration__block_invoke;
  v5[3] = &unk_1E5FFE550;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)packetArrivalTimestampFromAudioTime:(float)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___EARSpeechRecognitionAudioBuffer_packetArrivalTimestampFromAudioTime___block_invoke;
  block[3] = &unk_1E5FFE890;
  block[4] = self;
  void block[5] = &v8;
  float v7 = a3;
  dispatch_sync(queue, block);
  unint64_t v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_speechRecognizer);
  objc_storeStrong((id *)&self->_queue, 0);
  cntrl = self->_buffer.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end