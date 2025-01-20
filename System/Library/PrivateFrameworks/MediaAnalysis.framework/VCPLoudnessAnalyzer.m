@interface VCPLoudnessAnalyzer
- (VCPLoudnessAnalyzer)init;
- (id).cxx_construct;
- (id)results;
- (int)finalizeAnalysisAtTime:(id *)a3;
- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4;
- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4;
- (void)dealloc;
@end

@implementation VCPLoudnessAnalyzer

- (VCPLoudnessAnalyzer)init
{
  v8.receiver = self;
  v8.super_class = (Class)VCPLoudnessAnalyzer;
  v2 = [(VCPLoudnessAnalyzer *)&v8 init];
  v3 = v2;
  if (v2)
  {
    v2->_framePosition = 0;
    v2->_sampleRate = 16000.0;
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    loudnessResults = v3->_loudnessResults;
    v3->_loudnessResults = (NSMutableArray *)v4;

    v6 = v3;
  }

  return v3;
}

- (int)setupWithSample:(opaqueCMSampleBuffer *)a3 andSampleBatchSize:(int)a4
{
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  if (CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription)) {
    operator new();
  }
  return -50;
}

- (void)dealloc
{
  loudnessAnalyzer = self->_loudnessAnalyzer;
  if (loudnessAnalyzer)
  {
    LkFsMeasure::~LkFsMeasure(loudnessAnalyzer);
    MEMORY[0x1C186C7D0]();
  }
  processFormat = self->_processFormat;
  if (processFormat) {
    MEMORY[0x1C186C7D0](processFormat, 0x1000C400A747E1ELL);
  }
  samplesForProcessingBufferList = self->_samplesForProcessingBufferList;
  if (samplesForProcessingBufferList)
  {
    AUOutputBL::~AUOutputBL(samplesForProcessingBufferList);
    MEMORY[0x1C186C7D0]();
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPLoudnessAnalyzer;
  [(VCPLoudnessAnalyzer *)&v6 dealloc];
}

- (int)processAudioSamples:(AudioBufferList *)a3 timestamp:(AudioTimeStamp *)a4
{
  std::vector<float>::__insert_with_size[abi:ne180100]<float *,float *>((uint64_t)&self->_loudnessSampleBuffer, (uint64_t)self->_loudnessSampleBuffer.__end_, (char *)a3->mBuffers[0].mData, (char *)a3->mBuffers[0].mData + ((int)a3->mBuffers[0].mDataByteSize & 0xFFFFFFFFFFFFFFFCLL), (uint64_t)(int)a3->mBuffers[0].mDataByteSize >> 2);
  begin = self->_loudnessSampleBuffer.__begin_;
  unint64_t samplesFor100ms = self->_samplesFor100ms;
  if (samplesFor100ms <= self->_loudnessSampleBuffer.__end_ - begin)
  {
    __src = 0;
    v45 = 0;
    uint64_t v46 = 0;
    std::vector<float>::__insert_with_size[abi:ne180100]<float *,float *>((uint64_t)&__src, 0, (char *)begin, (char *)&begin[samplesFor100ms], samplesFor100ms);
    var2 = self->_samplesForProcessingBufferList->var2;
    mData = var2->mBuffers[0].mData;
    uint64_t v9 = self->_samplesFor100ms;
    if (v9)
    {
      memmove(mData, __src, 4 * v9);
      var2 = self->_samplesForProcessingBufferList->var2;
      LODWORD(v9) = self->_samplesFor100ms;
    }
    double v10 = LkFsMeasure::Process(self->_loudnessAnalyzer, var2, v9, 0);
    double v11 = v10;
    value = self->_momentaryEnergyValues.__end_cap_.__value_;
    end = self->_momentaryEnergyValues.__end_;
    if (end >= value)
    {
      v15 = self->_momentaryEnergyValues.__begin_;
      uint64_t v16 = end - v15;
      if ((unint64_t)(v16 + 1) >> 61) {
        std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v17 = (char *)value - (char *)v15;
      unint64_t v18 = ((char *)value - (char *)v15) >> 2;
      if (v18 <= v16 + 1) {
        unint64_t v18 = v16 + 1;
      }
      if (v17 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19)
      {
        v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&self->_momentaryEnergyValues.__end_cap_, v19);
        v15 = self->_momentaryEnergyValues.__begin_;
        end = self->_momentaryEnergyValues.__end_;
      }
      else
      {
        v20 = 0;
      }
      v21 = (double *)&v20[8 * v16];
      v22 = (double *)&v20[8 * v19];
      double *v21 = v11;
      v14 = v21 + 1;
      while (end != v15)
      {
        uint64_t v23 = *((void *)end-- - 1);
        *((void *)v21-- - 1) = v23;
      }
      self->_momentaryEnergyValues.__begin_ = v21;
      self->_momentaryEnergyValues.__end_ = v14;
      self->_momentaryEnergyValues.__end_cap_.__value_ = v22;
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      double *end = v10;
      v14 = end + 1;
    }
    self->_momentaryEnergyValues.__end_ = v14;
    float __C = 0.0;
    vDSP_maxmgv((const float *)mData, 1, &__C, self->_samplesFor100ms);
    v24 = self->_peakValues.__end_cap_.__value_;
    double v25 = __C;
    v26 = self->_peakValues.__end_;
    if (v26 >= v24)
    {
      v28 = self->_peakValues.__begin_;
      uint64_t v29 = v26 - v28;
      if ((unint64_t)(v29 + 1) >> 61) {
        std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v30 = (char *)v24 - (char *)v28;
      unint64_t v31 = ((char *)v24 - (char *)v28) >> 2;
      if (v31 <= v29 + 1) {
        unint64_t v31 = v29 + 1;
      }
      if (v30 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v31;
      }
      if (v32)
      {
        v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<VCPProtoKeypoint>>>((uint64_t)&self->_peakValues.__end_cap_, v32);
        v28 = self->_peakValues.__begin_;
        v26 = self->_peakValues.__end_;
      }
      else
      {
        v33 = 0;
      }
      v34 = (double *)&v33[8 * v29];
      v35 = (double *)&v33[8 * v32];
      double *v34 = v25;
      v27 = v34 + 1;
      while (v26 != v28)
      {
        uint64_t v36 = *((void *)v26-- - 1);
        *((void *)v34-- - 1) = v36;
      }
      self->_peakValues.__begin_ = v34;
      self->_peakValues.__end_ = v27;
      self->_peakValues.__end_cap_.__value_ = v35;
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      double *v26 = v25;
      v27 = v26 + 1;
    }
    self->_peakValues.__end_ = v27;
    uint64_t v37 = self->_samplesFor100ms;
    if (v37)
    {
      v39 = self->_loudnessSampleBuffer.__begin_;
      v38 = self->_loudnessSampleBuffer.__end_;
      v40 = &v39[v37];
      int64_t v41 = (char *)v38 - (char *)v40;
      if (v38 != v40) {
        memmove(self->_loudnessSampleBuffer.__begin_, v40, (char *)v38 - (char *)v40);
      }
      self->_loudnessSampleBuffer.__end_ = (float *)((char *)v39 + v41);
    }
    if (__src)
    {
      v45 = __src;
      operator delete(__src);
    }
  }
  return 0;
}

- (int)finalizeAnalysisAtTime:(id *)a3
{
  v36[3] = *MEMORY[0x1E4F143B8];
  begin = self->_momentaryEnergyValues.__begin_;
  end = self->_momentaryEnergyValues.__end_;
  if (begin != end)
  {
    uint64_t v5 = (char *)end - (char *)begin;
    uint64_t v6 = (unint64_t)v5 <= 0x18 ? 0 : 3;
    if (v6 < (unint64_t)(v5 >> 3))
    {
      uint64_t v8 = 0;
      uint64_t v9 = v5 >> 3;
      if (v9 >= 10) {
        uint64_t v9 = 10;
      }
      uint64_t v10 = v9 - v6;
      do
      {
        __p = 0;
        v27 = 0;
        uint64_t v28 = 0;
        std::vector<double>::__insert_with_size[abi:ne180100]<std::__wrap_iter<double *>,std::__wrap_iter<double *>>((uint64_t)&__p, 0, (char *)&begin[v6], (char *)&begin[v6 + v10], v10);
        uint64_t v25 = 0;
        double v11 = LkFsMeasure::ComputeProgramLoudnessFromBlockEnergies((uint64_t)&__p, (double *)&v25);
        uint64_t v12 = v6 + v10;
        if (v10 < 1)
        {
          double v14 = -INFINITY;
        }
        else
        {
          double v14 = -INFINITY;
          do
          {
            v13 = self->_peakValues.__begin_;
            if (v14 <= v13[v6]) {
              double v14 = v13[v6];
            }
            ++v6;
          }
          while (v6 < v12);
        }
        CMTimeMake(&time, (uint64_t)(float)(self->_sampleRate * (float)v8), (int)self->_sampleRate);
        CMTime v30 = time;
        CMTimeMake(&time, (uint64_t)(float)((float)(self->_sampleRate * (float)v12) / 10.0), (int)self->_sampleRate);
        CMTime v29 = time;
        loudnessResults = self->_loudnessResults;
        v35[0] = @"start";
        CMTime time = v30;
        CFDictionaryRef v16 = CMTimeCopyAsDictionary(&time, 0);
        v36[0] = v16;
        v35[1] = @"duration";
        CMTime time = v29;
        CMTime rhs = v30;
        CMTimeSubtract(&v24, &time, &rhs);
        CMTime time = v24;
        CFDictionaryRef v17 = CMTimeCopyAsDictionary(&time, 0);
        v36[1] = v17;
        v35[2] = @"attributes";
        v33[0] = @"energyValues";
        unint64_t v18 = [NSNumber numberWithDouble:v11];
        v34[0] = v18;
        v33[1] = @"peakValues";
        unint64_t v19 = [NSNumber numberWithDouble:v14];
        v34[1] = v19;
        v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];
        v36[2] = v20;
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
        [(NSMutableArray *)loudnessResults addObject:v21];

        begin = self->_momentaryEnergyValues.__begin_;
        unint64_t v22 = self->_momentaryEnergyValues.__end_ - begin;
        if ((uint64_t)(v22 - v12) >= 10) {
          uint64_t v10 = 10;
        }
        else {
          uint64_t v10 = v22 - v12;
        }
        if (__p)
        {
          v27 = __p;
          operator delete(__p);
          begin = self->_momentaryEnergyValues.__begin_;
          unint64_t v22 = self->_momentaryEnergyValues.__end_ - begin;
        }
        ++v8;
        uint64_t v6 = v12;
      }
      while (v12 < v22);
    }
  }
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  loudnessResults = self->_loudnessResults;
  uint64_t v5 = @"LoudnessResults";
  v6[0] = loudnessResults;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loudnessResults, 0);
  begin = self->_loudnessSampleBuffer.__begin_;
  if (begin)
  {
    self->_loudnessSampleBuffer.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = self->_momentaryEnergyValues.__begin_;
  if (v4)
  {
    self->_momentaryEnergyValues.__end_ = v4;
    operator delete(v4);
  }
  uint64_t v5 = self->_peakValues.__begin_;
  if (v5)
  {
    self->_peakValues.__end_ = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_pcmBuffer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 14) = 0;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end