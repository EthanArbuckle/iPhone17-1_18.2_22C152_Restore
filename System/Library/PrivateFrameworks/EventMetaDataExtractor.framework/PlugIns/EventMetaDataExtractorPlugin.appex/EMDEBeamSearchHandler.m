@interface EMDEBeamSearchHandler
- (EMDEBeamSearchHandler)initWithModel:(void *)a3 beamWidth:(int)a4 timeSteps:(int)a5 lengthPenalty:(float)a6 tokenThreshold:(float)a7;
- (MontrealNeuralNetworkTensor)inputTensor;
- (MontrealNeuralNetworkTensor)positionTensor;
- (MontrealNeuralNetworkTensor)segmentTensor;
- (MontrealNeuralNetworkTensor)tempTensor;
- (NSMutableArray)activeBeams;
- (NSMutableArray)finishedBeams;
- (NSMutableArray)nextBeams;
- (float)earlyStoppingPatience;
- (float)finishedBeamMaxScore;
- (float)lengthPenalty;
- (float)tokenThreshold;
- (id).cxx_construct;
- (id)getTopBeamWithModelState:(__CFArray *)a3 startPosition:(int)a4 allowedWords:()basic_string<char;
- (int)EOSToken;
- (int)beamWidth;
- (int)currentPosition;
- (int)maxLength;
- (int)vocabSize;
- (vector<const)currentStates;
- (vector<const)previousStates;
- (void)model;
- (void)runNextTimeStep;
- (void)setActiveBeams:(id)a3;
- (void)setBeamWidth:(int)a3;
- (void)setCurrentPosition:(int)a3;
- (void)setCurrentStates:(vector<const __CFArray *);
- (void)setEOSToken:(int)a3;
- (void)setEarlyStoppingPatience:(float)a3;
- (void)setFinishedBeamMaxScore:(float)a3;
- (void)setFinishedBeams:(id)a3;
- (void)setInputTensor:(MontrealNeuralNetworkTensor *)a3;
- (void)setLengthPenalty:(float)a3;
- (void)setMaxLength:(int)a3;
- (void)setModel:(void *)a3;
- (void)setNextBeams:(id)a3;
- (void)setPositionTensor:(MontrealNeuralNetworkTensor *)a3;
- (void)setPreviousStates:(vector<const __CFArray *);
- (void)setSegmentTensor:(MontrealNeuralNetworkTensor *)a3;
- (void)setTempTensor:(MontrealNeuralNetworkTensor *)a3;
- (void)setTokenThreshold:(float)a3;
- (void)setVocabSize:(int)a3;
- (void)updateBeamsWithPredictionFor:(id)a3 state:(__CFArray *)a4 predictions:(void *)a5;
@end

@implementation EMDEBeamSearchHandler

- (EMDEBeamSearchHandler)initWithModel:(void *)a3 beamWidth:(int)a4 timeSteps:(int)a5 lengthPenalty:(float)a6 tokenThreshold:(float)a7
{
  v7 = self;
  if (a3)
  {
    v34.receiver = self;
    v34.super_class = (Class)EMDEBeamSearchHandler;
    v13 = [(EMDEBeamSearchHandler *)&v34 init];
    v13->_maxLength = a5;
    v13->_beamWidth = a4;
    v13->_tokenThreshold = a7;
    v14 = +[EMDEUtils config];
    v15 = [v14 objectForKeyedSubscript:@"EMDE_EARLY_STOPPING_PATIENCE"];
    if (v15)
    {
      v16 = +[EMDEUtils config];
      v17 = [v16 objectForKeyedSubscript:@"EMDE_EARLY_STOPPING_PATIENCE"];
      [v17 floatValue];
      v13->_earlyStoppingPatience = v18;
    }
    else
    {
      v13->_earlyStoppingPatience = 2.0;
    }

    v13->_finishedBeamMaxScore = 0.0;
    v13->_lengthPenalty = a6;
    v21 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    activeBeams = v13->_activeBeams;
    v13->_activeBeams = v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    nextBeams = v13->_nextBeams;
    v13->_nextBeams = v23;

    v25 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    finishedBeams = v13->_finishedBeams;
    v13->_finishedBeams = v25;

    v27 = +[EMDEUtils config];
    v28 = [v27 objectForKeyedSubscript:@"EMDE_VOCAB_SIZE"];
    v13->_vocabSize = [v28 intValue];

    v29 = +[EMDEUtils config];
    v30 = [v29 objectForKeyedSubscript:@"EMDE_EOS_TOKEN_ID"];
    v31 = +[EMDEUtils config];
    if (v30) {
      [v31 objectForKeyedSubscript:@"EMDE_EOS_TOKEN_ID"];
    }
    else {
    v32 = [v31 objectForKeyedSubscript:@"EMDE_SEPARATOR_TOKEN"];
    }
    v13->_EOSToken = [v32 intValue];

    v13->_model = a3;
    v7 = v13;
    v20 = v7;
  }
  else
  {
    v19 = modelLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10008DD54(v19);
    }

    v20 = 0;
  }

  return v20;
}

- (void)updateBeamsWithPredictionFor:(id)a3 state:(__CFArray *)a4 predictions:(void *)a5
{
  id v8 = a3;
  if (v8 && a4 && a5)
  {
    if (self->_beamWidth >= 1)
    {
      uint64_t v9 = 0;
      do
      {
        unint64_t v10 = v9 + *((void *)a5 + 4);
        uint64_t v11 = *(void *)(*((void *)a5 + 1) + ((v10 >> 6) & 0x3FFFFFFFFFFFFF8));
        uint64_t v12 = v10 & 0x1FF;
        if (*(_DWORD *)(v11 + 8 * v12) == self->_EOSToken)
        {
          v13 = [EMDEBeamPath alloc];
          uint64_t v14 = *(void *)(*(void *)(*((void *)a5 + 1)
                                      + (((unint64_t)(v9 + *((void *)a5 + 4)) >> 6) & 0x3FFFFFFFFFFFFF8))
                          + 8 * ((v9 + *((void *)a5 + 4)) & 0x1FF));
          float lengthPenalty = self->_lengthPenalty;
          v16 = +[EMDEUtils config];
          v17 = [v16 objectForKeyedSubscript:@"EMDE_BEAM_VALIDATION_REQUIRED"];
          id v18 = [v17 BOOLValue];
          *(float *)&double v19 = lengthPenalty;
          id v20 = [(EMDEBeamPath *)v13 initFinishedBeamFrom:v8 additionalToken:v14 lengthPenalty:v18 validate:v19];

          if (v20)
          {
            [(NSMutableArray *)self->_finishedBeams addObject:v20];
            float finishedBeamMaxScore = self->_finishedBeamMaxScore;
            [v20 averageScore];
            if (finishedBeamMaxScore < v22)
            {
              [v20 averageScore];
              self->_float finishedBeamMaxScore = v23;
            }
          }
        }
        else
        {
          if (*(float *)(v11 + 8 * v12 + 4) < self->_tokenThreshold) {
            break;
          }
          v24 = [EMDEBeamPath alloc];
          uint64_t v25 = *(void *)(*(void *)(*((void *)a5 + 1)
                                      + (((unint64_t)(v9 + *((void *)a5 + 4)) >> 6) & 0x3FFFFFFFFFFFFF8))
                          + 8 * ((v9 + *((void *)a5 + 4)) & 0x1FF));
          float v26 = self->_lengthPenalty;
          v27 = +[EMDEUtils config];
          v28 = [v27 objectForKeyedSubscript:@"EMDE_BEAM_VALIDATION_REQUIRED"];
          id v29 = [v28 BOOLValue];
          *(float *)&double v30 = v26;
          id v20 = [(EMDEBeamPath *)v24 initChildBeamFrom:v8 additionalToken:v25 state:a4 lengthPenalty:v29 validate:v30];

          if (v20)
          {
            [v20 averageScore];
            if ((float)(v31 * self->_earlyStoppingPatience) > self->_finishedBeamMaxScore) {
              [(NSMutableArray *)self->_nextBeams addObject:v20];
            }
          }
        }

        ++v9;
      }
      while (v9 < self->_beamWidth);
    }
  }
  else
  {
    v32 = modelLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v33 = 138412802;
      id v34 = v8;
      __int16 v35 = 2112;
      v36 = a4;
      __int16 v37 = 2112;
      v38 = a5;
      _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "EMDEBeamSearchHandler - Found nil in input parameters for updateBeamsWithPredictionFor:%@ state:%@ predictions:%@", (uint8_t *)&v33, 0x20u);
    }
  }
}

- (void)runNextTimeStep
{
  v68[0] = kMRLNeuralNetworkTensorInfoInputDimensionKey;
  v3 = +[NSNumber numberWithInt:1];
  v69[0] = v3;
  v68[1] = kMRLNeuralNetworkTensorInfoSequenceLengthKey;
  v4 = +[NSNumber numberWithInt:1];
  v69[1] = v4;
  v54 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

  end = self->_previousStates.__end_;
  if (end != self->_previousStates.__begin_)
  {
    unint64_t v6 = 0;
    end = self->_previousStates.__begin_;
    do
    {
      CFRelease(end[v6++]);
      end = self->_previousStates.__begin_;
    }
    while (v6 < self->_previousStates.__end_ - end);
  }
  begin = (char *)self->_currentStates.__begin_;
  self->_previousStates.__end_ = end;
  p_currentStates = &self->_currentStates;
  sub_100004254((char *)&self->_previousStates, begin, (uint64_t)self->_currentStates.__end_, ((char *)self->_currentStates.__end_ - begin) >> 3);
  self->_currentStates.__end_ = self->_currentStates.__begin_;
  int currentPosition = self->_currentPosition;
  uint64_t v9 = (float *)operator new(4uLL);
  *uint64_t v9 = (float)currentPosition;
  self->_positionTensor = (MontrealNeuralNetworkTensor *)MRLNeuralNetworkTensorCreate();
  MRLNeuralNetworkTensorAppendData();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = self->_activeBeams;
  id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  uint64_t v11 = v9;
  if (v10)
  {
    p_end_cap = &self->_currentStates.__end_cap_;
    uint64_t v12 = *(void *)v63;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v63 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        if (v14)
        {
          [*(id *)(*((void *)&v62 + 1) + 8 * i) tokens];
          [v14 tokens];
          v16 = (unsigned char *)v59;
          v15 = (unsigned char *)v60;
          v17 = (char *)v56.i64[0];
        }
        else
        {
          v17 = 0;
          v15 = 0;
          v16 = 0;
          int64x2_t v56 = 0uLL;
          uint64_t v57 = 0;
          uint64_t v59 = 0;
          uint64_t v60 = 0;
          uint64_t v61 = 0;
        }
        int v18 = *(_DWORD *)&v17[v15 - v16 - 4];
        double v19 = (float *)operator new(4uLL);
        float *v19 = (float)v18;
        if (!v16 || (uint64_t v60 = (uint64_t)v16, operator delete(v16), (v17 = (char *)v56.i64[0]) != 0))
        {
          v56.i64[1] = (uint64_t)v17;
          operator delete(v17);
        }
        self->_inputTensor = (MontrealNeuralNetworkTensor *)MRLNeuralNetworkTensorCreate();
        MRLNeuralNetworkTensorAppendData();
        MRLNeuralNetworkSetInputTensor();
        MRLNeuralNetworkSetInputTensor();
        MRLNeuralNetworkSetInputTensor();
        MRLNeuralNetworkSetInputTensor();
        [v14 state];
        MRLNeuralNetworkPredict();
        uint64_t v20 = MRLNeuralNetworkCopyStates();
        v21 = (__CFArray *)v20;
        float v23 = self->_currentStates.__end_;
        value = self->_currentStates.__end_cap_.__value_;
        if (v23 >= value)
        {
          uint64_t v25 = v23 - p_currentStates->__begin_;
          if ((unint64_t)(v25 + 1) >> 61) {
            sub_100004204();
          }
          uint64_t v26 = (char *)value - (char *)p_currentStates->__begin_;
          uint64_t v27 = v26 >> 2;
          if (v26 >> 2 <= (unint64_t)(v25 + 1)) {
            uint64_t v27 = v25 + 1;
          }
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v28 = v27;
          }
          if (v28) {
            id v29 = (char *)sub_10000421C((uint64_t)p_end_cap, v28);
          }
          else {
            id v29 = 0;
          }
          double v30 = (__CFArray **)&v29[8 * v25];
          void *v30 = v21;
          v24 = v30 + 1;
          v32 = self->_currentStates.__begin_;
          float v31 = self->_currentStates.__end_;
          if (v31 != v32)
          {
            do
            {
              int v33 = *--v31;
              *--double v30 = v33;
            }
            while (v31 != v32);
            float v31 = p_currentStates->__begin_;
          }
          self->_currentStates.__begin_ = v30;
          self->_currentStates.__end_ = v24;
          self->_currentStates.__end_cap_.__value_ = (__CFArray **)&v29[8 * v28];
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          NSMutableArray *v23 = (__CFArray *)v20;
          v24 = v23 + 1;
        }
        self->_currentStates.__end_ = v24;
        uint64_t Output = MRLNeuralNetworkGetOutput();
        unint64_t beamWidth = self->_beamWidth;
        uint64_t v59 = 0;
        sub_100004360((uint64_t)&v56, beamWidth, &v59);
        int vocabSize = self->_vocabSize;
        if (vocabSize >= 1)
        {
          for (uint64_t j = 0; j < vocabSize; ++j)
          {
            uint64_t v38 = self->_beamWidth;
            if ((int)v38 >= 1)
            {
              uint64_t v39 = 0;
              while (*(float *)(Output + 4 * j) <= *(float *)(*(void *)(v56.i64[1]
                                                                         + (((v58 + v39) >> 6) & 0x3FFFFFFFFFFFFF8))
                                                             + 8 * ((v58 + v39) & 0x1FF)
                                                             + 4))
              {
                if (v38 == ++v39) {
                  goto LABEL_42;
                }
              }
              if (v57 == v56.i64[1]) {
                uint64_t v40 = 0;
              }
              else {
                uint64_t v40 = *(void *)(v56.i64[1] + 8 * (v58 >> 9)) + 8 * (v58 & 0x1FF);
              }
              uint64_t v59 = v56.i64[1] + 8 * (v58 >> 9);
              uint64_t v60 = v40;
              v41 = (char *)sub_100003964((uint64_t)&v59, v39);
              v55[0] = j;
              v55[1] = *(_DWORD *)(Output + 4 * j);
              sub_100003590(&v56, v41, v42, (uint64_t)v55);
              int vocabSize = self->_vocabSize;
            }
LABEL_42:
            ;
          }
        }
        -[EMDEBeamSearchHandler updateBeamsWithPredictionFor:state:predictions:](self, "updateBeamsWithPredictionFor:state:predictions:", v14, v21, &v56, p_end_cap);
        CFRelease(self->_inputTensor);
        sub_100004F10(&v56);
        operator delete(v19);
        uint64_t v9 = v11;
      }
      id v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v10);
  }

  CFRelease(self->_positionTensor);
  [(NSMutableArray *)self->_activeBeams removeAllObjects];
  nextBeams = self->_nextBeams;
  v44 = +[NSSortDescriptor sortDescriptorWithKey:@"score" ascending:0];
  v66 = v44;
  v45 = +[NSArray arrayWithObjects:&v66 count:1];
  [(NSMutableArray *)nextBeams sortUsingDescriptors:v45];

  for (uint64_t k = 0; ; ++k)
  {
    signed int v47 = [(NSMutableArray *)self->_nextBeams count];
    int v48 = self->_beamWidth;
    if (v48 >= v47) {
      int v48 = v47;
    }
    if (k >= v48) {
      break;
    }
    activeBeams = self->_activeBeams;
    v50 = [(NSMutableArray *)self->_nextBeams objectAtIndex:k];
    [(NSMutableArray *)activeBeams addObject:v50];
  }
  [(NSMutableArray *)self->_nextBeams removeAllObjects];
  operator delete(v9);
}

- (id)getTopBeamWithModelState:(__CFArray *)a3 startPosition:(int)a4 allowedWords:()basic_string<char
{
  if (a3)
  {
    self->_int currentPosition = a4;
    v43[0] = kMRLNeuralNetworkTensorInfoInputDimensionKey;
    id v8 = +[NSNumber numberWithInt:1];
    v44[0] = v8;
    v43[1] = kMRLNeuralNetworkTensorInfoSequenceLengthKey;
    uint64_t v9 = +[NSNumber numberWithInt:1];
    v44[1] = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];

    uint64_t v11 = operator new(4uLL);
    *uint64_t v11 = 1065353216;
    uint64_t v12 = operator new(4uLL);
    *uint64_t v12 = 1065353216;
    self->_segmentTensor = (MontrealNeuralNetworkTensor *)MRLNeuralNetworkTensorCreate();
    self->_tempTensor = (MontrealNeuralNetworkTensor *)MRLNeuralNetworkTensorCreate();
    MRLNeuralNetworkTensorAppendData();
    MRLNeuralNetworkTensorAppendData();
    v13 = [EMDEBeamPath alloc];
    if (*((char *)&a5->__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1000302DC(__p, a5->__r_.__value_.var0.var1.__data_, a5->__r_.__value_.var0.var1.__size_);
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)a5->__r_.__value_.var0.var0.__data_;
      uint64_t v41 = *((void *)&a5->__r_.__value_.var0.var1 + 2);
    }
    v15 = [(EMDEBeamPath *)v13 initWithState:a3 allowedWords:__p];
    if (SHIBYTE(v41) < 0) {
      operator delete(__p[0]);
    }
    -[NSMutableArray addObject:](self->_activeBeams, "addObject:", v15, __p[0], __p[1], v41);
    value = self->_currentStates.__end_cap_.__value_;
    end = self->_currentStates.__end_;
    if (end >= value)
    {
      begin = self->_currentStates.__begin_;
      uint64_t v20 = end - begin;
      if ((unint64_t)(v20 + 1) >> 61) {
        sub_100004204();
      }
      uint64_t v21 = (char *)value - (char *)begin;
      uint64_t v22 = v21 >> 2;
      if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
        uint64_t v22 = v20 + 1;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v23 = v22;
      }
      if (v23) {
        v24 = (char *)sub_10000421C((uint64_t)&self->_currentStates.__end_cap_, v23);
      }
      else {
        v24 = 0;
      }
      uint64_t v25 = (__CFArray **)&v24[8 * v20];
      uint64_t v26 = (__CFArray **)&v24[8 * v23];
      NSMutableArray *v25 = a3;
      int v18 = v25 + 1;
      unint64_t v28 = self->_currentStates.__begin_;
      uint64_t v27 = self->_currentStates.__end_;
      if (v27 != v28)
      {
        do
        {
          id v29 = *--v27;
          *--uint64_t v25 = v29;
        }
        while (v27 != v28);
        uint64_t v27 = self->_currentStates.__begin_;
      }
      self->_currentStates.__begin_ = v25;
      self->_currentStates.__end_ = v18;
      self->_currentStates.__end_cap_.__value_ = v26;
      if (v27) {
        operator delete(v27);
      }
    }
    else
    {
      *end = a3;
      int v18 = end + 1;
    }
    self->_currentStates.__end_ = v18;
    int currentPosition = self->_currentPosition;
    int v31 = currentPosition + self->_maxLength - 2;
    while (currentPosition < v31 && [(NSMutableArray *)self->_activeBeams count])
    {
      [(EMDEBeamSearchHandler *)self runNextTimeStep];
      int currentPosition = self->_currentPosition + 1;
      self->_int currentPosition = currentPosition;
    }
    v32 = self->_previousStates.__begin_;
    if (self->_previousStates.__end_ != v32)
    {
      unint64_t v33 = 0;
      do
      {
        CFRelease(v32[v33++]);
        v32 = self->_previousStates.__begin_;
      }
      while (v33 < self->_previousStates.__end_ - v32);
    }
    id v34 = self->_currentStates.__begin_;
    if (self->_currentStates.__end_ != v34)
    {
      unint64_t v35 = 0;
      do
      {
        CFRelease(v34[v35++]);
        id v34 = self->_currentStates.__begin_;
      }
      while (v35 < self->_currentStates.__end_ - v34);
    }
    CFRelease(self->_segmentTensor);
    CFRelease(self->_tempTensor);
    finishedBeams = self->_finishedBeams;
    __int16 v37 = +[NSSortDescriptor sortDescriptorWithKey:@"averageScore" ascending:0];
    uint64_t v42 = v37;
    uint64_t v38 = +[NSArray arrayWithObjects:&v42 count:1];
    [(NSMutableArray *)finishedBeams sortUsingDescriptors:v38];

    if ([(NSMutableArray *)self->_finishedBeams count])
    {
      uint64_t v14 = [(NSMutableArray *)self->_finishedBeams objectAtIndex:0];
    }
    else
    {
      uint64_t v14 = 0;
    }

    operator delete(v12);
    operator delete(v11);
  }
  else
  {
    id v10 = modelLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10008DDD0(v10);
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (int)maxLength
{
  return self->_maxLength;
}

- (void)setMaxLength:(int)a3
{
  self->_maxLength = a3;
}

- (int)beamWidth
{
  return self->_beamWidth;
}

- (void)setBeamWidth:(int)a3
{
  self->_unint64_t beamWidth = a3;
}

- (int)currentPosition
{
  return self->_currentPosition;
}

- (void)setCurrentPosition:(int)a3
{
  self->_int currentPosition = a3;
}

- (float)tokenThreshold
{
  return self->_tokenThreshold;
}

- (void)setTokenThreshold:(float)a3
{
  self->_tokenThreshold = a3;
}

- (float)earlyStoppingPatience
{
  return self->_earlyStoppingPatience;
}

- (void)setEarlyStoppingPatience:(float)a3
{
  self->_earlyStoppingPatience = a3;
}

- (float)finishedBeamMaxScore
{
  return self->_finishedBeamMaxScore;
}

- (void)setFinishedBeamMaxScore:(float)a3
{
  self->_float finishedBeamMaxScore = a3;
}

- (float)lengthPenalty
{
  return self->_lengthPenalty;
}

- (void)setLengthPenalty:(float)a3
{
  self->_float lengthPenalty = a3;
}

- (int)EOSToken
{
  return self->_EOSToken;
}

- (void)setEOSToken:(int)a3
{
  self->_EOSToken = a3;
}

- (int)vocabSize
{
  return self->_vocabSize;
}

- (void)setVocabSize:(int)a3
{
  self->_int vocabSize = a3;
}

- (NSMutableArray)activeBeams
{
  return self->_activeBeams;
}

- (void)setActiveBeams:(id)a3
{
}

- (NSMutableArray)nextBeams
{
  return self->_nextBeams;
}

- (void)setNextBeams:(id)a3
{
}

- (NSMutableArray)finishedBeams
{
  return self->_finishedBeams;
}

- (void)setFinishedBeams:(id)a3
{
}

- (void)model
{
  return self->_model;
}

- (void)setModel:(void *)a3
{
  self->_model = a3;
}

- (MontrealNeuralNetworkTensor)inputTensor
{
  return self->_inputTensor;
}

- (void)setInputTensor:(MontrealNeuralNetworkTensor *)a3
{
  self->_inputTensor = a3;
}

- (MontrealNeuralNetworkTensor)positionTensor
{
  return self->_positionTensor;
}

- (void)setPositionTensor:(MontrealNeuralNetworkTensor *)a3
{
  self->_positionTensor = a3;
}

- (MontrealNeuralNetworkTensor)segmentTensor
{
  return self->_segmentTensor;
}

- (void)setSegmentTensor:(MontrealNeuralNetworkTensor *)a3
{
  self->_segmentTensor = a3;
}

- (MontrealNeuralNetworkTensor)tempTensor
{
  return self->_tempTensor;
}

- (void)setTempTensor:(MontrealNeuralNetworkTensor *)a3
{
  self->_tempTensor = a3;
}

- (vector<const)previousStates
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<const __CFArray *, std::allocator<const __CFArray *>> *)sub_100004144(retstr, self->_previousStates.__begin_, (uint64_t)self->_previousStates.__end_, self->_previousStates.__end_- self->_previousStates.__begin_);
}

- (void)setPreviousStates:(vector<const __CFArray *)
{
  p_previousStates = (char *)&self->_previousStates;
  if (p_previousStates != (char *)a3) {
    sub_100004254(p_previousStates, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (vector<const)currentStates
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<const __CFArray *, std::allocator<const __CFArray *>> *)sub_100004144(retstr, self->_currentStates.__begin_, (uint64_t)self->_currentStates.__end_, self->_currentStates.__end_- self->_currentStates.__begin_);
}

- (void)setCurrentStates:(vector<const __CFArray *)
{
  p_currentStates = (char *)&self->_currentStates;
  if (p_currentStates != (char *)a3) {
    sub_100004254(p_currentStates, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (void).cxx_destruct
{
  begin = self->_currentStates.__begin_;
  if (begin)
  {
    self->_currentStates.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_previousStates.__begin_;
  if (v4)
  {
    self->_previousStates.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_finishedBeams, 0);
  objc_storeStrong((id *)&self->_nextBeams, 0);
  objc_storeStrong((id *)&self->_activeBeams, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_OWORD *)self + 7) = 0u;
  return self;
}

@end