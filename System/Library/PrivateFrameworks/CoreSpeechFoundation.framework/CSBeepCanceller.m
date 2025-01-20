@interface CSBeepCanceller
- (CSBeepCanceller)init;
- (CSBeepCancellerDelegate)delegate;
- (NSDictionary)metrics;
- (id).cxx_construct;
- (void)cancelBeepFromSamples:(id)a3 timestamp:(unint64_t)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)willBeep;
@end

@implementation CSBeepCanceller

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  begin = self->_shortBuffer.__begin_;
  if (begin)
  {
    self->_shortBuffer.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_floatBuffer.__begin_;
  if (v4)
  {
    self->_floatBuffer.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->_beepFloatVec.__begin_;
  if (v5)
  {
    self->_beepFloatVec.__end_ = v5;
    operator delete(v5);
  }
  std::unique_ptr<BatchBeepCanceller>::reset[abi:ne180100]((uint64_t *)&self->_beepCanceller, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSBeepCancellerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSBeepCancellerDelegate *)WeakRetained;
}

- (NSDictionary)metrics
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7809;
  v10 = __Block_byref_object_dispose__7810;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__CSBeepCanceller_metrics__block_invoke;
  v5[3] = &unk_1E6200F40;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __26__CSBeepCanceller_metrics__block_invoke(uint64_t a1)
{
  v27[9] = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned int **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = v2[66];
  unsigned int v4 = v2[67];
  unsigned int v5 = v2[68];
  unsigned int v6 = v2[69];
  unsigned int v7 = v2[70];
  unsigned int v8 = v2[71];
  v9 = objc_msgSend(NSNumber, "numberWithInt:", v2[65], @"beepLocation");
  v27[0] = v9;
  v26[1] = @"statsComputed";
  v10 = [NSNumber numberWithInt:v3];
  v27[1] = v10;
  v26[2] = @"beepPower";
  LODWORD(v11) = v4;
  v12 = [NSNumber numberWithFloat:v11];
  v27[2] = v12;
  v26[3] = @"signalPower";
  LODWORD(v13) = v5;
  v14 = [NSNumber numberWithFloat:v13];
  v27[3] = v14;
  v26[4] = @"originalPower";
  LODWORD(v15) = v6;
  v16 = [NSNumber numberWithFloat:v15];
  v27[4] = v16;
  v26[5] = @"absMaxVal";
  LODWORD(v17) = v7;
  v18 = [NSNumber numberWithFloat:v17];
  v27[5] = v18;
  v26[6] = @"above95pcOfMax";
  LODWORD(v19) = v8;
  v20 = [NSNumber numberWithFloat:v19];
  v27[6] = v20;
  v26[7] = @"totalInputSamples";
  v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 96)];
  v27[7] = v21;
  v26[8] = @"totalOutputSamples";
  v22 = [NSNumber numberWithUnsignedLongLong:*(void *)(*(void *)(a1 + 32) + 104)];
  v27[8] = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:9];
  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
}

- (void)reset
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v7 = "-[CSBeepCanceller reset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s Reset beep cancellation", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__CSBeepCanceller_reset__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __24__CSBeepCanceller_reset__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 16);
  *(_DWORD *)(v1 + 284) = 0;
  *(void *)(v1 + 268) = 0;
  *(void *)(v1 + 276) = 0;
  *(void *)(v1 + 260) = 0x1FFFFFFFFCLL;
  BatchBeepCanceller::reset(*(BatchBeepCanceller **)(*(void *)(a1 + 32) + 16));
}

- (void)willBeep
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unsigned int v7 = "-[CSBeepCanceller willBeep]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s It will beep now", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CSBeepCanceller_willBeep__block_invoke;
  block[3] = &unk_1E6201288;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __27__CSBeepCanceller_willBeep__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 16);
  if (!*(unsigned char *)(v1 + 228))
  {
    *(_DWORD *)(v1 + 260) = -3;
    *(_DWORD *)(v1 + 284) = 0;
    *(void *)(v1 + 268) = 0;
    *(void *)(v1 + 276) = 0;
  }
  *(_DWORD *)(v1 + 224) = 1;
  return result;
}

- (void)cancelBeepFromSamples:(id)a3 timestamp:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CSBeepCanceller_cancelBeepFromSamples_timestamp___block_invoke;
  block[3] = &unk_1E6200148;
  id v10 = v6;
  double v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __51__CSBeepCanceller_cancelBeepFromSamples_timestamp___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) length];
  id v3 = +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:*(void *)(a1 + 32)];
  unsigned int v4 = (const void *)[v3 bytes];
  uint64_t v5 = v2 >> 1;

  uint64_t v6 = (v2 >> 1);
  if (v6) {
    memmove(*(void **)(*(void *)(a1 + 40) + 48), v4, 4 * v6);
  }
  *(void *)(*(void *)(a1 + 40) + 96) += v6;
  double v15 = 0;
  unsigned int v7 = BatchBeepCanceller::feedFloat(*(BatchBeepCanceller **)(*(void *)(a1 + 40) + 16), *(const float **)(*(void *)(a1 + 40) + 48), v5, (const float **)&v15);
  id v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:4 * v7];
  +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:](CSFLPCMTypeConverter, "convertToShortLPCMBufFromFloatLPCMBuf:");
  id v8 = objc_claimAutoreleasedReturnValue();
  v9 = (const void *)[v8 bytes];

  if (v7)
  {
    size_t v10 = 2 * v7;
    memmove(*(void **)(*(void *)(a1 + 40) + 72), v9, v10);
    *(void *)(*(void *)(a1 + 40) + 104) += v7;
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 112));
    uint64_t v12 = *(void *)(a1 + 40);
    double v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(v12 + 72) length:v10];
    [WeakRetained beepCancellerDidCancelSamples:v12 buffer:v13 timestamp:*(void *)(a1 + 48)];
  }
  else
  {
    *(void *)(*(void *)(a1 + 40) + 104) = *(void *)(*(void *)(a1 + 40) + 104);
  }
}

- (CSBeepCanceller)init
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)CSBeepCanceller;
  unint64_t v2 = [(CSBeepCanceller *)&v35 init];
  if (v2)
  {
    id v3 = [(id)objc_opt_class() description];
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = +[CSAsset fallBackAssetResourcePath];
    unsigned int v7 = [v6 stringByAppendingPathComponent:@"jbl_begin.bin"];
    id v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[CSBeepCanceller init]";
      __int16 v38 = 2114;
      uint64_t v39 = (uint64_t)v7;
      _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s BeepCanceller asset file loading from : %{public}@", buf, 0x16u);
    }
    id v34 = 0;
    v9 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7 options:8 error:&v34];
    id v10 = v34;
    double v11 = v10;
    if (v9 && !v10)
    {
      id v33 = v9;
      uint64_t v12 = (char *)[v33 bytes];
      uint64_t v13 = [v33 length];
      unint64_t v14 = v13;
      p_beepFloatVec = &v2->_beepFloatVec;
      begin = v2->_beepFloatVec.__begin_;
      unint64_t v17 = v13 >> 2;
      uint64_t value = (uint64_t)v2->_beepFloatVec.__end_cap_.__value_;
      if (v13 >> 2 <= (unint64_t)((value - (uint64_t)begin) >> 2))
      {
        p_end = (void **)&v2->_beepFloatVec.__end_;
        end = v2->_beepFloatVec.__end_;
        unint64_t v24 = end - begin;
        if (v24 < v17)
        {
          unint64_t v25 = (unint64_t)v13 >> 2;
          v26 = &v12[4 * ((unint64_t)v13 >> 2)];
          if (end != begin)
          {
            memmove(begin, v12, (char *)end - (char *)begin);
            begin = (float *)*p_end;
          }
          size_t v27 = v26 - &v12[4 * v24];
          if (v24 != v25) {
            memmove(begin, &v12[4 * v24], v27);
          }
LABEL_27:
          v28 = (char *)begin + v27;
          *p_end = (char *)begin + v27;
          v29 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = (v28 - (char *)p_beepFloatVec->__begin_) >> 2;
            *(_DWORD *)buf = 136315394;
            v37 = "-[CSBeepCanceller init]";
            __int16 v38 = 2050;
            uint64_t v39 = v30;
            _os_log_impl(&dword_1BA1A5000, v29, OS_LOG_TYPE_DEFAULT, "%s beepVector Size = %{public}lu", buf, 0x16u);
          }
          operator new();
        }
      }
      else
      {
        if (begin)
        {
          v2->_beepFloatVec.__end_ = begin;
          operator delete(begin);
          uint64_t value = 0;
          p_beepFloatVec->__begin_ = 0;
          v2->_beepFloatVec.__end_ = 0;
          v2->_beepFloatVec.__end_cap_.__value_ = 0;
        }
        if ((v14 & 0x8000000000000000) != 0) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v19 = value >> 1;
        if (value >> 1 <= v17) {
          uint64_t v19 = v17;
        }
        if ((unint64_t)value >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v20 = v19;
        }
        std::vector<float>::__vallocate[abi:ne180100](&v2->_beepFloatVec.__begin_, v20);
        p_end = (void **)&v2->_beepFloatVec.__end_;
        begin = v2->_beepFloatVec.__end_;
      }
      size_t v27 = v14 & 0xFFFFFFFFFFFFFFFCLL;
      if (v14 >= 4) {
        memmove(begin, v12, v14 & 0xFFFFFFFFFFFFFFFCLL);
      }
      goto LABEL_27;
    }
    v22 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[CSBeepCanceller init]";
      __int16 v38 = 2112;
      uint64_t v39 = (uint64_t)v7;
      _os_log_error_impl(&dword_1BA1A5000, v22, OS_LOG_TYPE_ERROR, "%s Could not read beep file: %@", buf, 0x16u);
    }

    v31 = 0;
  }
  else
  {
    v31 = (CSBeepCanceller *)0;
  }

  return v31;
}

@end