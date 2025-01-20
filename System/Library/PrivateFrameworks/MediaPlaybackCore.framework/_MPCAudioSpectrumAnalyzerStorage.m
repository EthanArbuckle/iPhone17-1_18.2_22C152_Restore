@interface _MPCAudioSpectrumAnalyzerStorage
- (_MPCAudioSpectrumAnalyzerStorage)initWithMaximumNumberOfFrames:(int64_t)a3 sampleRate:(float)a4;
- (float)sampleRate;
- (int64_t)halfN;
- (int64_t)log2N;
- (int64_t)maxNumberOfFrames;
- (void)_destroyFFTSetup;
- (void)_freeBuffers;
- (void)_prepareBuffers;
- (void)analyzeAudioData:(void *)a3 numberFrames:(unsigned int)a4 observers:(id)a5;
- (void)analyzeFrequencies:(AudioBufferList *)a3 numberFrames:(unint64_t)a4 observers:(id)a5;
- (void)dealloc;
- (void)setHalfN:(int64_t)a3;
- (void)setLog2N:(int64_t)a3;
- (void)setMaxNumberOfFrames:(int64_t)a3;
- (void)setSampleRate:(float)a3;
@end

@implementation _MPCAudioSpectrumAnalyzerStorage

- (_MPCAudioSpectrumAnalyzerStorage)initWithMaximumNumberOfFrames:(int64_t)a3 sampleRate:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_MPCAudioSpectrumAnalyzerStorage;
  v6 = [(_MPCAudioSpectrumAnalyzerStorage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_sampleRate = a4;
    if (a3 >= 0) {
      int64_t v8 = a3;
    }
    else {
      int64_t v8 = a3 + 1;
    }
    v6->_maxNumberOfFrames = a3;
    v6->_halfN = (uint64_t)(double)(v8 >> 1);
    v6->_log2N = vcvtpd_s64_f64(log2((double)a3));
    [(_MPCAudioSpectrumAnalyzerStorage *)v7 _prepareBuffers];
  }
  return v7;
}

- (void)_prepareBuffers
{
  self->_fftSetup = vDSP_create_fftsetup(self->_log2N, 0);
  self->_fftBuffer.imagp = (float *)malloc_type_calloc(self->_halfN, 4uLL, 0x100004052888210uLL);
  self->_fftBuffer.realp = (float *)malloc_type_calloc(self->_halfN, 4uLL, 0x100004052888210uLL);
  self->_intermediateBuffer = (float *)malloc_type_calloc(self->_maxNumberOfFrames, 4uLL, 0x100004052888210uLL);
}

- (void)setLog2N:(int64_t)a3
{
  self->_log2N = a3;
}

- (int64_t)log2N
{
  return self->_log2N;
}

- (void)setHalfN:(int64_t)a3
{
  self->_halfN = a3;
}

- (int64_t)halfN
{
  return self->_halfN;
}

- (void)setMaxNumberOfFrames:(int64_t)a3
{
  self->_maxNumberOfFrames = a3;
}

- (int64_t)maxNumberOfFrames
{
  return self->_maxNumberOfFrames;
}

- (void)setSampleRate:(float)a3
{
  self->_sampleRate = a3;
}

- (float)sampleRate
{
  return self->_sampleRate;
}

- (void)analyzeAudioData:(void *)a3 numberFrames:(unsigned int)a4 observers:(id)a5
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v8 = a5;
  intermediateBuffer = self->_intermediateBuffer;
  if (intermediateBuffer != a3) {
    memcpy(intermediateBuffer, a3, 4 * a4);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * i) beginReport];
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v11);
  }
  vDSP_ctoz((const DSPComplex *)self->_intermediateBuffer, 2, &self->_fftBuffer, 1, self->_halfN);
  vDSP_fft_zrip(self->_fftSetup, &self->_fftBuffer, 1, self->_log2N, 1);
  vDSP_vclr(self->_intermediateBuffer, 1, a4);
  vDSP_zaspec(&self->_fftBuffer, self->_intermediateBuffer, self->_halfN);
  float __C = 0.0;
  vDSP_sve(self->_intermediateBuffer, 1, &__C, self->_halfN);
  if (__C > 0.0 && self->_halfN >= 1)
  {
    int64_t v14 = 0;
    float v15 = (float)a4;
    do
    {
      float v16 = self->_intermediateBuffer[v14];
      float v17 = __C;
      float sampleRate = self->_sampleRate;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v19 = v8;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        float v22 = v16 / v17;
        uint64_t v23 = *(void *)v42;
        float v24 = (float)(sampleRate * (float)(int)v14) / v15;
        do
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v42 != v23) {
              objc_enumerationMutation(v19);
            }
            v26 = *(id *)(*((void *)&v41 + 1) + 8 * j);
            unint64_t v27 = v26[4];
            if (v27)
            {
              unint64_t v28 = 0;
              v29 = (float *)(v26[1] + 24);
              do
              {
                if (*(v29 - 4) < v24 && *(v29 - 3) >= v24)
                {
                  ++*(void *)v29;
                  *(v29 - 2) = v22 + *(v29 - 2);
                  unint64_t v27 = v26[4];
                }
                ++v28;
                v29 += 8;
              }
              while (v28 < v27);
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v41 objects:v51 count:16];
        }
        while (v21);
      }

      ++v14;
    }
    while (self->_halfN > v14);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v30 = v8;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v31)
  {
    uint64_t v33 = v31;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v30);
        }
        v36 = *(void **)(*((void *)&v37 + 1) + 8 * k);
        *(float *)&double v32 = __C;
        objc_msgSend(v36, "setPowerLevel:", v32, (void)v37);
        [v36 finishReport];
      }
      uint64_t v33 = [v30 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v33);
  }
}

- (void)analyzeFrequencies:(AudioBufferList *)a3 numberFrames:(unint64_t)a4 observers:(id)a5
{
  id v8 = a5;
  if (a3->mNumberBuffers)
  {
    mData = (const float *)a3->mBuffers[0].mData;
    if (a3->mNumberBuffers == 1)
    {
      if (!mData) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v10 = *(const float **)&a3[1].mBuffers[0].mNumberChannels;
      if (mData && v10)
      {
        float __C = 0.5;
        vDSP_vasm(mData, 1, v10, 1, &__C, self->_intermediateBuffer, 1, a4);
LABEL_11:
        [(_MPCAudioSpectrumAnalyzerStorage *)self analyzeAudioData:self->_intermediateBuffer numberFrames:a4 observers:v8];
        goto LABEL_12;
      }
      if (!mData)
      {
        if (!v10) {
          goto LABEL_12;
        }
        intermediateBuffer = self->_intermediateBuffer;
        mData = *(const float **)&a3[1].mBuffers[0].mNumberChannels;
        size_t v12 = 4 * a4;
        goto LABEL_10;
      }
    }
    intermediateBuffer = self->_intermediateBuffer;
    size_t v12 = 4 * a4;
LABEL_10:
    memcpy(intermediateBuffer, mData, v12);
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_freeBuffers
{
  intermediateBuffer = self->_intermediateBuffer;
  if (intermediateBuffer) {
    free(intermediateBuffer);
  }
  imagp = self->_fftBuffer.imagp;
  if (imagp) {
    free(imagp);
  }
  realp = self->_fftBuffer.realp;
  if (realp)
  {
    free(realp);
  }
}

- (void)_destroyFFTSetup
{
  fftSetup = self->_fftSetup;
  if (fftSetup)
  {
    vDSP_destroy_fftsetup(fftSetup);
    self->_fftSetup = 0;
  }
}

- (void)dealloc
{
  [(_MPCAudioSpectrumAnalyzerStorage *)self _freeBuffers];
  [(_MPCAudioSpectrumAnalyzerStorage *)self _destroyFFTSetup];
  v3.receiver = self;
  v3.super_class = (Class)_MPCAudioSpectrumAnalyzerStorage;
  [(_MPCAudioSpectrumAnalyzerStorage *)&v3 dealloc];
}

@end