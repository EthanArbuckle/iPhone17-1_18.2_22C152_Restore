@interface _EARSyncSpeechRecognizer
+ (void)initialize;
- (_EARSyncSpeechRecognizer)initWithConfiguration:(id)a3;
- (_EARSyncSpeechRecognizer)initWithConfiguration:(id)a3 memoryLock:(BOOL)a4;
- (id).cxx_construct;
- (id)getSpeechRecognitionResultFromTokens:()vector<std:(std:(id)a4 :allocator<std::vector<quasar::Token>>> *)a3 :vector<quasar::Token> taskName:;
- (id)resultsWithAddedAudio:(id)a3 numberOfSamples:(unint64_t)a4 taskName:(id)a5;
- (id)resultsWithAddedFloatAudio:(id)a3 numberOfSamples:(unint64_t)a4 taskName:(id)a5;
- (id)resultsWithEndedAudio;
- (void)resetWithSamplingRate:(unsigned int)a3 language:(id)a4 taskType:(id)a5 userId:(id)a6 sessionId:(id)a7 deviceId:(id)a8 farField:(BOOL)a9 atypicalSpeech:(BOOL)a10 maxAudioBufferSizeSeconds:(unsigned int)a11;
- (void)resetWithSamplingRate:(unsigned int)a3 language:(id)a4 taskType:(id)a5 userId:(id)a6 sessionId:(id)a7 deviceId:(id)a8 farField:(BOOL)a9 audioSource:(id)a10 maxAudioBufferSizeSeconds:(unsigned int)a11;
@end

@implementation _EARSyncSpeechRecognizer

+ (void)initialize
{
  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
  }
}

- (_EARSyncSpeechRecognizer)initWithConfiguration:(id)a3
{
  return [(_EARSyncSpeechRecognizer *)self initWithConfiguration:a3 memoryLock:0];
}

- (_EARSyncSpeechRecognizer)initWithConfiguration:(id)a3 memoryLock:(BOOL)a4
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_EARSyncSpeechRecognizer;
  v6 = [(_EARSyncSpeechRecognizer *)&v11 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple._EARSpeechRecognizer.formatter", 0);
    formatterQueue = v6->_formatterQueue;
    v6->_formatterQueue = (OS_dispatch_queue *)v7;

    [v5 fileSystemRepresentation];
    operator new();
  }
  v9 = (_EARSyncSpeechRecognizer *)0;

  return v9;
}

- (void)resetWithSamplingRate:(unsigned int)a3 language:(id)a4 taskType:(id)a5 userId:(id)a6 sessionId:(id)a7 deviceId:(id)a8 farField:(BOOL)a9 audioSource:(id)a10 maxAudioBufferSizeSeconds:(unsigned int)a11
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  ptr = self->_syncRecognizer.__ptr_;
  if (v17)
  {
    objc_msgSend(v17, "ear_toString");
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v32[0] = 0;
    v32[1] = 0;
    uint64_t v33 = 0;
    if (v18)
    {
LABEL_3:
      objc_msgSend(v18, "ear_toString");
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  v30[0] = 0;
  v30[1] = 0;
  uint64_t v31 = 0;
  if (v19)
  {
LABEL_4:
    objc_msgSend(v19, "ear_toString");
    if (v20) {
      goto LABEL_5;
    }
LABEL_10:
    v26[0] = 0;
    v26[1] = 0;
    uint64_t v27 = 0;
    if (v21) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  v28[0] = 0;
  v28[1] = 0;
  uint64_t v29 = 0;
  if (!v20) {
    goto LABEL_10;
  }
LABEL_5:
  objc_msgSend(v20, "ear_toString");
  if (v21)
  {
LABEL_6:
    objc_msgSend(v21, "ear_toString");
    goto LABEL_12;
  }
LABEL_11:
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v25 = 0;
LABEL_12:
  (*(void (**)(SyncSpeechRecognizer *, uint64_t, void **, void **, void **, void **, void **, BOOL, _BYTE))(*(void *)ptr + 24))(ptr, v15, v32, v30, v28, v26, __p, a9, 0);
  if (SHIBYTE(v25) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v27) < 0) {
    operator delete(v26[0]);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete(v28[0]);
  }
  if (SHIBYTE(v31) < 0) {
    operator delete(v30[0]);
  }
  if (SHIBYTE(v33) < 0) {
    operator delete(v32[0]);
  }
}

- (void)resetWithSamplingRate:(unsigned int)a3 language:(id)a4 taskType:(id)a5 userId:(id)a6 sessionId:(id)a7 deviceId:(id)a8 farField:(BOOL)a9 atypicalSpeech:(BOOL)a10 maxAudioBufferSizeSeconds:(unsigned int)a11
{
  uint64_t v15 = *(void *)&a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  ptr = self->_syncRecognizer.__ptr_;
  if (v17)
  {
    objc_msgSend(v17, "ear_toString");
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v31[0] = 0;
    v31[1] = 0;
    uint64_t v32 = 0;
    if (v18)
    {
LABEL_3:
      objc_msgSend(v18, "ear_toString");
      if (v19) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  v29[0] = 0;
  v29[1] = 0;
  uint64_t v30 = 0;
  if (v19)
  {
LABEL_4:
    objc_msgSend(v19, "ear_toString");
    if (v20) {
      goto LABEL_5;
    }
LABEL_10:
    v25[0] = 0;
    v25[1] = 0;
    uint64_t v26 = 0;
    if (v21) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  v27[0] = 0;
  v27[1] = 0;
  uint64_t v28 = 0;
  if (!v20) {
    goto LABEL_10;
  }
LABEL_5:
  objc_msgSend(v20, "ear_toString");
  if (v21)
  {
LABEL_6:
    objc_msgSend(v21, "ear_toString");
    goto LABEL_12;
  }
LABEL_11:
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v24 = 0;
LABEL_12:
  (*(void (**)(SyncSpeechRecognizer *, uint64_t, void **, void **, void **, void **, void **, BOOL, BOOL))(*(void *)ptr + 24))(ptr, v15, v31, v29, v27, v25, __p, a9, a10);
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v26) < 0) {
    operator delete(v25[0]);
  }
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v30) < 0) {
    operator delete(v29[0]);
  }
  if (SHIBYTE(v32) < 0) {
    operator delete(v31[0]);
  }
}

- (id)getSpeechRecognitionResultFromTokens:()vector<std:(std:(id)a4 :allocator<std::vector<quasar::Token>>> *)a3 :vector<quasar::Token> taskName:
{
  id v6 = a4;
  dispatch_queue_t v7 = self->_formatter;
  id v8 = v6;
  v53 = 0;
  v54 = 0;
  unint64_t v55 = 0;
  v50 = 0;
  v51 = 0;
  unint64_t v52 = 0;
  begin = (uint64_t *)a3->__begin_;
  end = a3->__end_;
  v39 = v8;
  if (a3->__begin_ != end)
  {
    id v11 = v8;
    do
    {
      long long v48 = 0uLL;
      uint64_t v49 = 0;
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v48, *begin, begin[1], 0x6DB6DB6DB6DB6DB7 * ((begin[1] - *begin) >> 5));
      v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      if (v7)
      {
        [(_EARFormatter *)v7 formatWords:begin unrepairedWordsOut:&v45 task:v11];
        std::vector<quasar::Token>::__vdeallocate((void **)&v48);
        long long v48 = v43;
        uint64_t v49 = v44;
        uint64_t v44 = 0;
        long long v43 = 0uLL;
        v56 = (void **)&v43;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v56);
      }
      v12 = v54;
      if ((unint64_t)v54 >= v55)
      {
        uint64_t v13 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)&v53, (uint64_t *)&v48);
      }
      else
      {
        void *v54 = 0;
        v12[1] = 0;
        v12[2] = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v12, v48, *((uint64_t *)&v48 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)&v48 + 1) - v48) >> 5));
        uint64_t v13 = (uint64_t)(v12 + 3);
      }
      v54 = (void *)v13;
      v14 = v51;
      if ((unint64_t)v51 >= v52)
      {
        uint64_t v15 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)&v50, (uint64_t *)&v45);
      }
      else
      {
        void *v51 = 0;
        v14[1] = 0;
        v14[2] = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v14, (uint64_t)v45, v46, 0x6DB6DB6DB6DB6DB7 * ((v46 - (uint64_t)v45) >> 5));
        uint64_t v15 = (uint64_t)(v14 + 3);
      }
      v51 = (void *)v15;
      *(void *)&long long v43 = &v45;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
      v45 = (void **)&v48;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v45);
      begin += 3;
    }
    while (begin != end);
  }
  v16 = [_EARSpeechRecognition alloc];
  id v17 = [MEMORY[0x1E4F1CAD0] set];
  id v18 = [(_EARSpeechRecognition *)v16 _initWithNBestList:a3 useHatText:1 endsOfSentencePunctuations:v17];

  if (v7)
  {
    id v19 = [_EARSpeechRecognition alloc];
    id v20 = [MEMORY[0x1E4F1CAD0] set];
    id v21 = [(_EARSpeechRecognition *)v19 _initWithNBestList:&v53 useHatText:0 endsOfSentencePunctuations:v20];
  }
  else
  {
    id v21 = v18;
  }
  id v22 = [_EARSpeechRecognition alloc];
  v23 = [MEMORY[0x1E4F1CAD0] set];
  id v24 = [(_EARSpeechRecognition *)v22 _initWithNBestList:&v50 useHatText:0 endsOfSentencePunctuations:v23];

  id v25 = [[_EARSpeechRecognitionResultPackage alloc] _initWithRecognition:v21 preITNRecognition:v18 unrepairedRecognition:v24 recognitionIsFormatted:v7 != 0 isFinal:1];
  *(void *)&long long v48 = &v50;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  v50 = &v53;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v50);

  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v26 = [v25 recognition];
  uint64_t v27 = [v26 nBest];

  uint64_t v28 = [v25 preITNRecognition];
  uint64_t v29 = [v28 nBest];

  unint64_t v30 = [v27 count];
  if (v30 >= [v29 count]) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = v27;
  }
  uint64_t v32 = [v31 count];
  if (v32)
  {
    for (uint64_t i = 0; i != v32; ++i)
    {
      v34 = [_EARSpeechRecognitionResult alloc];
      v35 = [v27 objectAtIndex:i];
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v35, v42);
      v36 = [v29 objectAtIndex:i];
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v36, v41);
      id v37 = [(_EARSpeechRecognitionResult *)v34 _initWithTokens:v42 preITNTokens:v41];
      v53 = (void **)v41;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v53);

      v53 = (void **)v42;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v53);

      [v40 addObject:v37];
    }
  }

  return v40;
}

- (id)resultsWithAddedAudio:(id)a3 numberOfSamples:(unint64_t)a4 taskName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  [v9 bytes];
  (*(void (**)(void ***__return_ptr))(*(void *)self->_syncRecognizer.__ptr_ + 32))(&v13);
  v16 = 0;
  uint64_t v17 = 0;
  uint64_t v15 = 0;
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v15, (uint64_t *)*v13, (uint64_t *)v13[1], 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v13[1] - (unsigned char *)*v13) >> 3));
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  memset(v12, 0, sizeof(v12));
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(v12, v15, v16, 0xAAAAAAAAAAAAAAABLL * (v16 - v15));
  v10 = [(_EARSyncSpeechRecognizer *)self getSpeechRecognitionResultFromTokens:v12 taskName:v8];
  uint64_t v13 = (void **)v12;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v13);
  uint64_t v13 = (void **)&v15;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v10;
}

- (id)resultsWithAddedFloatAudio:(id)a3 numberOfSamples:(unint64_t)a4 taskName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = 0;
  v16 = 0;
  uint64_t v17 = 0;
  if ([v8 length] >= 4 * a4)
  {
    [v8 bytes];
    (*(void (**)(void ***__return_ptr))(*(void *)self->_syncRecognizer.__ptr_ + 48))(&v13);
    if (&v15 != (uint64_t **)v13) {
      std::vector<std::vector<quasar::Token>>::__assign_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>((uint64_t)&v15, (uint64_t *)*v13, (uint64_t *)v13[1], 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v13[1] - (unsigned char *)*v13) >> 3));
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  memset(v12, 0, sizeof(v12));
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(v12, v15, v16, 0xAAAAAAAAAAAAAAABLL * (v16 - v15));
  v10 = [(_EARSyncSpeechRecognizer *)self getSpeechRecognitionResultFromTokens:v12 taskName:v9];
  uint64_t v13 = (void **)v12;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v13);
  uint64_t v13 = (void **)&v15;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v13);

  return v10;
}

- (id)resultsWithEndedAudio
{
  (*(void (**)(void ***__return_ptr))(*(void *)self->_syncRecognizer.__ptr_ + 56))(&v6);
  id v9 = 0;
  uint64_t v10 = 0;
  id v8 = 0;
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v8, (uint64_t *)*v6, (uint64_t *)v6[1], 0xAAAAAAAAAAAAAAABLL * (((unsigned char *)v6[1] - (unsigned char *)*v6) >> 3));
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  memset(v5, 0, sizeof(v5));
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(v5, v8, v9, 0xAAAAAAAAAAAAAAABLL * (v9 - v8));
  v3 = [(_EARSyncSpeechRecognizer *)self getSpeechRecognitionResultFromTokens:v5 taskName:@"Ending current audio stream."];
  id v6 = (void **)v5;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v6);
  id v6 = (void **)&v8;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v6);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configPath, 0);
  cntrl = self->_syncRecognizer.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_formatterQueue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void)initWithConfiguration:(int)a1 memoryLock:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B1A86000, a2, OS_LOG_TYPE_ERROR, "Could not build recognizer: %d", (uint8_t *)v2, 8u);
}

- (uint64_t)initWithConfiguration:(uint64_t)a1 memoryLock:.cold.2(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

@end