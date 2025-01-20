@interface MomentumCurve
+ (float)defaultDispatchRate;
- (BOOL)atEndOfCurve;
- (BOOL)firstSwitchFromInterpolatedCurve;
- (BOOL)stopInterpolatingInfoSet;
- (BOOL)useInterpolatedCurve;
- (MomentumCurve)init;
- (float)currentInterval;
- (float)decayStopDelta;
- (float)deltaMultiplier;
- (float)firstSwitchFromInterpolatedCurveInterval;
- (float)firstSwitchFromInterpolatedCurveMultiplier;
- (float)frameInterval;
- (float)getTimeAtIndex:(unint64_t)a3 curve:(int)a4;
- (float)interpolationFrameInterval;
- (float)maxDecayTime;
- (float)momentumDecayRateAlphaWithMickeys:()pair<float;
- (float)nextInterval;
- (float)physicalFrameInterval;
- (float)scrollMomentumDispatchRate;
- (float)stopInterpolatingTime;
- (id).cxx_construct;
- (int)dragButtons;
- (int)subtype;
- (pair<int,)getCurrentMomentumDeltas;
- (pair<int,)getCurrentMomentumDeltasAndStep;
- (pair<int,)initialDelta;
- (unint64_t)curveIndex;
- (unint64_t)stopInterpolatingDefaultIndex;
- (unsigned)interpolationMinFrameSkipsAtEndOfTail;
- (unsigned)minFrameSkipsAtEndOfTail;
- (vector<std::vector<int>,)deltas;
- (vector<std::vector<int>,)interpolatedDeltas;
- (void)clearCurves;
- (void)generateCurvesWithInitialDelta:(const void *)a3;
- (void)generateCurvesWithMomentumState:(id)a3 scrollMomentumDispatchRate:(float)a4;
- (void)generateFrameIntervalMomentumDeltas;
- (void)interpolateFrameIntervalMomentumDeltas;
- (void)regenerateCurvesWithInitialDelta:(const void *)a3;
- (void)setAtEndOfCurve:(BOOL)a3;
- (void)setCurrentInterval:(float)a3;
- (void)setCurveIndex:(unint64_t)a3;
- (void)setDecayStopDelta:(float)a3;
- (void)setDeltaMultiplier:(float)a3;
- (void)setDeltas:()vector<std:(std::allocator<std::vector<int>>> *)a3 :vector<int>;
- (void)setDragButtons:(int)a3;
- (void)setFirstSwitchFromInterpolatedCurve:(BOOL)a3;
- (void)setFirstSwitchFromInterpolatedCurveInterval:(float)a3;
- (void)setFirstSwitchFromInterpolatedCurveMultiplier:(float)a3;
- (void)setFrameInterval:(float)a3;
- (void)setInitialDelta:()pair<int;
- (void)setInterpolatedDeltas:()vector<std:(std::allocator<std::vector<int>>> *)a3 :vector<int>;
- (void)setInterpolationFrameInterval:(float)a3;
- (void)setInterpolationMinFrameSkipsAtEndOfTail:(unsigned int)a3;
- (void)setMaxDecayTime:(float)a3;
- (void)setMinFrameSkipsAtEndOfTail:(unsigned int)a3;
- (void)setNextInterval:(float)a3;
- (void)setPhysicalFrameInterval:(float)a3;
- (void)setScrollMomentumDispatchRate:(float)a3;
- (void)setStopInterpolatingDefaultIndex:(unint64_t)a3;
- (void)setStopInterpolatingInfoSet:(BOOL)a3;
- (void)setStopInterpolatingTime:(float)a3;
- (void)setSubtype:(int)a3;
- (void)setUseInterpolatedCurve:(BOOL)a3;
- (void)smoothCurveBody:(int)a3;
- (void)smoothCurveTail:(int)a3 minFrameSkipsAtEndOfTail:(unsigned int)a4;
@end

@implementation MomentumCurve

+ (float)defaultDispatchRate
{
  return 60.0;
}

- (MomentumCurve)init
{
  v32.receiver = self;
  v32.super_class = (Class)MomentumCurve;
  v2 = [(MomentumCurve *)&v32 init];
  v3 = v2;
  if (v2)
  {
    p_deltas = &v2->_deltas;
    p_interpolatedDeltas = &v2->_interpolatedDeltas;
    char v6 = 1;
    do
    {
      char v7 = v6;
      end = v3->_deltas.__end_;
      unint64_t value = (unint64_t)v3->_deltas.__end_cap_.__value_;
      if ((unint64_t)end >= value)
      {
        begin = p_deltas->__begin_;
        unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)p_deltas->__begin_) >> 3);
        unint64_t v13 = v12 + 1;
        if (v12 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        long long v33 = 0u;
        long long v34 = 0u;
        unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value - (void)begin) >> 3);
        if (2 * v14 > v13) {
          unint64_t v13 = 2 * v14;
        }
        if (v14 >= 0x555555555555555) {
          unint64_t v15 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v15 = v13;
        }
        p_end_cap = &v3->_deltas.__end_cap_;
        v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v3->_deltas.__end_cap_, v15);
        v17 = &v16[24 * v12];
        *(void *)&long long v33 = v16;
        *((void *)&v33 + 1) = v17;
        *((void *)&v34 + 1) = &v16[24 * v18];
        *(void *)v17 = 0;
        *((void *)v17 + 1) = 0;
        *((void *)v17 + 2) = 0;
        *(void *)&long long v34 = v17 + 24;
        std::vector<std::vector<int>>::__swap_out_circular_buffer((uint64_t *)&v3->_deltas, &v33);
        v10 = v3->_deltas.__end_;
        std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)&v33);
      }
      else
      {
        v10 = end + 3;
        void *end = 0;
        end[1] = 0;
        end[2] = 0;
      }
      v3->_deltas.__end_ = v10;
      v20 = v3->_interpolatedDeltas.__end_;
      unint64_t v19 = (unint64_t)v3->_interpolatedDeltas.__end_cap_.__value_;
      if ((unint64_t)v20 >= v19)
      {
        v22 = p_interpolatedDeltas->__begin_;
        unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)v20 - (char *)p_interpolatedDeltas->__begin_) >> 3);
        unint64_t v24 = v23 + 1;
        if (v23 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
        }
        long long v33 = 0u;
        long long v34 = 0u;
        unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19 - (void)v22) >> 3);
        if (2 * v25 > v24) {
          unint64_t v24 = 2 * v25;
        }
        if (v25 >= 0x555555555555555) {
          unint64_t v26 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v26 = v24;
        }
        p_end_cap = &v3->_interpolatedDeltas.__end_cap_;
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v3->_interpolatedDeltas.__end_cap_, v26);
        v28 = &v27[24 * v23];
        *(void *)&long long v33 = v27;
        *((void *)&v33 + 1) = v28;
        *((void *)&v34 + 1) = &v27[24 * v29];
        *(void *)v28 = 0;
        *((void *)v28 + 1) = 0;
        *((void *)v28 + 2) = 0;
        *(void *)&long long v34 = v28 + 24;
        std::vector<std::vector<int>>::__swap_out_circular_buffer((uint64_t *)&v3->_interpolatedDeltas, &v33);
        v21 = v3->_interpolatedDeltas.__end_;
        std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)&v33);
      }
      else
      {
        v21 = v20 + 3;
        void *v20 = 0;
        v20[1] = 0;
        v20[2] = 0;
      }
      char v6 = 0;
      v3->_interpolatedDeltas.__end_ = v21;
    }
    while ((v7 & 1) != 0);
    v30 = v3;
  }

  return v3;
}

- (void)clearCurves
{
  begin = self->_deltas.__begin_;
  v3 = self->_interpolatedDeltas.__begin_;
  begin[1] = *begin;
  v3[1] = *v3;
  begin[4] = begin[3];
  v3[4] = v3[3];
  [(MomentumCurve *)self setCurveIndex:0];
}

- (void)generateCurvesWithMomentumState:(id)a3 scrollMomentumDispatchRate:(float)a4
{
  char v6 = (unsigned int *)a3;
  [(MomentumCurve *)self setSubtype:v6[3]];
  LODWORD(v7) = 1074580685;
  [(MomentumCurve *)self setMaxDecayTime:v7];
  *(float *)&double v8 = a4;
  [(MomentumCurve *)self setScrollMomentumDispatchRate:v8];
  if ([(MomentumCurve *)self subtype] == 1)
  {
    [(MomentumCurve *)self scrollMomentumDispatchRate];
    float v10 = v9;
    +[MomentumCurve defaultDispatchRate];
    BOOL v12 = vabds_f32(v10, v11) > 0.05;
  }
  else
  {
    BOOL v12 = 0;
  }
  [(MomentumCurve *)self setUseInterpolatedCurve:v12];
  [(MomentumCurve *)self scrollMomentumDispatchRate];
  *(float *)&double v14 = 1.0 / v13;
  [(MomentumCurve *)self setInterpolationFrameInterval:v14];
  [(MomentumCurve *)self setFirstSwitchFromInterpolatedCurve:0];
  [(MomentumCurve *)self setStopInterpolatingInfoSet:0];
  [(MomentumCurve *)self setMinFrameSkipsAtEndOfTail:0];
  double v15 = *((double *)v6 + 4);
  *(float *)&double v15 = v15;
  [(MomentumCurve *)self setPhysicalFrameInterval:v15];
  [(MomentumCurve *)self physicalFrameInterval];
  double v17 = v16;
  if (v17 < 0.001 || ([(MomentumCurve *)self physicalFrameInterval], double v17 = v18, v17 > 0.1))
  {
    LODWORD(v17) = 1008981770;
    [(MomentumCurve *)self setPhysicalFrameInterval:v17];
  }
  if ([(MomentumCurve *)self subtype] == 1)
  {
    +[MomentumCurve defaultDispatchRate];
    *(float *)&double v20 = 1.0 / v19;
    [(MomentumCurve *)self setFrameInterval:v20];
    [(MomentumCurve *)self frameInterval];
    float v22 = v21;
    [(MomentumCurve *)self physicalFrameInterval];
    *(float *)&double v24 = v22 / v23;
    [(MomentumCurve *)self setDeltaMultiplier:v24];
    LODWORD(v25) = 0.5;
    [(MomentumCurve *)self setDecayStopDelta:v25];
    [(MomentumCurve *)self setMinFrameSkipsAtEndOfTail:3];
    [(MomentumCurve *)self frameInterval];
    float v27 = v26;
    [(MomentumCurve *)self interpolationFrameInterval];
    [(MomentumCurve *)self setInterpolationMinFrameSkipsAtEndOfTail:(float)(roundf((float)(v27 / v28)* (float)([(MomentumCurve *)self minFrameSkipsAtEndOfTail] + 1))+ -1.0)];
    [(MomentumCurve *)self setDragButtons:0];
    uint64_t v29 = MTLoggingPlugin();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)v42 = 136315650;
    *(void *)&v42[4] = "";
    __int16 v43 = 2080;
    v44 = "";
    __int16 v45 = 2080;
    v46 = "-[MomentumCurve generateCurvesWithMomentumState:scrollMomentumDispatchRate:]";
    v30 = "[HID] [MT] %s%s%s Starting momentum scroll";
  }
  else
  {
    [(MomentumCurve *)self physicalFrameInterval];
    -[MomentumCurve setFrameInterval:](self, "setFrameInterval:");
    LODWORD(v31) = 1.0;
    [(MomentumCurve *)self setDeltaMultiplier:v31];
    LODWORD(v32) = 1.0;
    [(MomentumCurve *)self setDecayStopDelta:v32];
    [(MomentumCurve *)self setDragButtons:v6[6]];
    uint64_t v29 = MTLoggingPlugin();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_DWORD *)v42 = 136315650;
    *(void *)&v42[4] = "";
    __int16 v43 = 2080;
    v44 = "";
    __int16 v45 = 2080;
    v46 = "-[MomentumCurve generateCurvesWithMomentumState:scrollMomentumDispatchRate:]";
    v30 = "[HID] [MT] %s%s%s Starting momentum point / drag";
  }
  _os_log_impl(&def_411C8, v29, OS_LOG_TYPE_DEFAULT, v30, v42, 0x20u);
LABEL_13:

  *(float32x2_t *)v42 = vcvt_f32_s32(*(int32x2_t *)(v6 + 4));
  [(MomentumCurve *)self generateCurvesWithInitialDelta:v42];
  pair<int, int> v33 = [(MomentumCurve *)self initialDelta];
  long long v34 = MTLoggingPlugin();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v35 = [(MomentumCurve *)self subtype];
    [(MomentumCurve *)self frameInterval];
    float v37 = v36;
    [(MomentumCurve *)self interpolationFrameInterval];
    float v39 = v38;
    unsigned int v40 = [(MomentumCurve *)self useInterpolatedCurve];
    unsigned int v41 = [(MomentumCurve *)self dragButtons];
    *(_DWORD *)v42 = 136317442;
    *(void *)&v42[4] = "";
    __int16 v43 = 2080;
    v44 = "";
    __int16 v45 = 2080;
    v46 = "-[MomentumCurve generateCurvesWithMomentumState:scrollMomentumDispatchRate:]";
    __int16 v47 = 1024;
    unsigned int v48 = v35;
    __int16 v49 = 1024;
    int first = v33.first;
    __int16 v51 = 1024;
    int second = v33.second;
    __int16 v53 = 2048;
    double v54 = v37;
    __int16 v55 = 2048;
    double v56 = v39;
    __int16 v57 = 1024;
    unsigned int v58 = v40;
    __int16 v59 = 1024;
    unsigned int v60 = v41;
    _os_log_impl(&def_411C8, v34, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Subtype 0x%02X, initial delta (%d, %d), frame interval %f, interpolated frame interval %f, use interpolation %u, drag buttons %d", v42, 0x52u);
  }
}

- (void)regenerateCurvesWithInitialDelta:(const void *)a3
{
  v5 = MTLoggingPlugin();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = *(float *)a3;
    double v7 = *((float *)a3 + 1);
    int v8 = 136316162;
    float v9 = "";
    __int16 v10 = 2080;
    float v11 = "";
    __int16 v12 = 2080;
    float v13 = "-[MomentumCurve regenerateCurvesWithInitialDelta:]";
    __int16 v14 = 2048;
    double v15 = v6;
    __int16 v16 = 2048;
    double v17 = v7;
    _os_log_impl(&def_411C8, v5, OS_LOG_TYPE_DEFAULT, "[HID] [MT] %s%s%s Regenerating curves with initial delta (%4.1f, %4.1f)", (uint8_t *)&v8, 0x34u);
  }

  [(MomentumCurve *)self generateCurvesWithInitialDelta:a3];
}

- (void)generateCurvesWithInitialDelta:(const void *)a3
{
  [(MomentumCurve *)self clearCurves];
  [(MomentumCurve *)self setInitialDelta:(int)*(float *)a3 | ((unint64_t)(int)*((float *)a3 + 1) << 32)];
  [(MomentumCurve *)self generateFrameIntervalMomentumDeltas];
  if ([(MomentumCurve *)self useInterpolatedCurve])
  {
    [(MomentumCurve *)self smoothCurveTail:0 minFrameSkipsAtEndOfTail:[(MomentumCurve *)self minFrameSkipsAtEndOfTail]];
    [(MomentumCurve *)self interpolateFrameIntervalMomentumDeltas];
    [(MomentumCurve *)self smoothCurveTail:1 minFrameSkipsAtEndOfTail:[(MomentumCurve *)self interpolationMinFrameSkipsAtEndOfTail]];
    [(MomentumCurve *)self smoothCurveBody:1];
  }
  if ([(MomentumCurve *)self useInterpolatedCurve]) {
    [(MomentumCurve *)self interpolationFrameInterval];
  }
  else {
    [(MomentumCurve *)self frameInterval];
  }
  -[MomentumCurve setCurrentInterval:](self, "setCurrentInterval:");
  [(MomentumCurve *)self currentInterval];

  -[MomentumCurve setNextInterval:](self, "setNextInterval:");
}

- (void)generateFrameIntervalMomentumDeltas
{
  begin = self->_deltas.__begin_;
  v4 = (void **)(begin + 3);
  float v5 = (float)(int)[(MomentumCurve *)self initialDelta];
  float v6 = (float)(int)((unint64_t)[(MomentumCurve *)self initialDelta] >> 32);
  [(MomentumCurve *)self maxDecayTime];
  float v8 = *(float *)&v9;
  uint64_t v53 = (uint64_t)(begin + 2);
  HIDWORD(v9) = 0;
  float v54 = 0.0;
  float v10 = 0.0;
  do
  {
    *(float *)&double v9 = v5;
    *(float *)&double v7 = v6;
    -[MomentumCurve momentumDecayRateAlphaWithMickeys:](self, "momentumDecayRateAlphaWithMickeys:", v9, v7, v53);
    float v5 = v5 * v11;
    float v6 = v6 * v11;
    [(MomentumCurve *)self deltaMultiplier];
    float v13 = v5 * v12;
    [(MomentumCurve *)self deltaMultiplier];
    float v15 = v6 * v14;
    if ([(MomentumCurve *)self useInterpolatedCurve]
      && ![(MomentumCurve *)self stopInterpolatingInfoSet])
    {
      [(MomentumCurve *)self frameInterval];
      float v19 = v13 / v18;
      [(MomentumCurve *)self frameInterval];
      *(float *)&double v16 = fabsf(v15 / *(float *)&v16);
      if (fabsf(v19) <= 320.0 && *(float *)&v16 <= 320.0)
      {
        -[MomentumCurve setStopInterpolatingDefaultIndex:](self, "setStopInterpolatingDefaultIndex:", (uint64_t)(begin[1] - *begin) >> 2, v16);
        [(MomentumCurve *)self getTimeAtIndex:[(MomentumCurve *)self stopInterpolatingDefaultIndex] curve:0];
        -[MomentumCurve setStopInterpolatingTime:](self, "setStopInterpolatingTime:");
        [(MomentumCurve *)self setStopInterpolatingInfoSet:1];
        if (![(MomentumCurve *)self stopInterpolatingDefaultIndex]) {
          [(MomentumCurve *)self setUseInterpolatedCurve:0];
        }
      }
    }
    unsigned int v21 = llroundf(v13);
    unsigned int v22 = llroundf(v15);
    float v23 = fabsf(v13);
    float v24 = fabsf(v15);
    float v25 = v54;
    BOOL v26 = v23 < 1.0 && v24 < 1.0;
    *(float *)&double v16 = (float)(v54 + v13) - (float)(int)(float)(v54 + v13);
    *(float *)&double v17 = (float)(v10 + v15) - (float)(int)(float)(v10 + v15);
    if (v26) {
      int v27 = (int)(float)(v54 + v13);
    }
    else {
      int v27 = v21;
    }
    if (v26) {
      int v28 = (int)(float)(v10 + v15);
    }
    else {
      int v28 = v22;
    }
    if (v26) {
      float v10 = (float)(v10 + v15) - (float)(int)(float)(v10 + v15);
    }
    if (v26) {
      float v25 = (float)(v54 + v13) - (float)(int)(float)(v54 + v13);
    }
    float v54 = v25;
    if (v8 <= 0.0)
    {
      BOOL v29 = 1;
    }
    else
    {
      [(MomentumCurve *)self decayStopDelta];
      if (v23 >= *(float *)&v16)
      {
        BOOL v29 = 0;
      }
      else
      {
        [(MomentumCurve *)self decayStopDelta];
        BOOL v29 = v24 < *(float *)&v16;
      }
    }
    double v31 = (int *)begin[1];
    unint64_t v30 = begin[2];
    if ((unint64_t)v31 >= v30)
    {
      pair<int, int> v33 = (int *)*begin;
      uint64_t v34 = ((uint64_t)v31 - *begin) >> 2;
      unint64_t v35 = v34 + 1;
      if ((unint64_t)(v34 + 1) >> 62) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v36 = v30 - (void)v33;
      if (v36 >> 1 > v35) {
        unint64_t v35 = v36 >> 1;
      }
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v35;
      }
      if (v37)
      {
        float v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v53, v37);
        pair<int, int> v33 = (int *)*begin;
        double v31 = (int *)begin[1];
      }
      else
      {
        float v38 = 0;
      }
      float v39 = (int *)&v38[4 * v34];
      *float v39 = v27;
      double v32 = v39 + 1;
      while (v31 != v33)
      {
        int v40 = *--v31;
        *--float v39 = v40;
      }
      void *begin = v39;
      begin[1] = v32;
      begin[2] = &v38[4 * v37];
      if (v33) {
        operator delete(v33);
      }
    }
    else
    {
      *double v31 = v27;
      double v32 = v31 + 1;
    }
    begin[1] = v32;
    v42 = (int *)begin[4];
    unint64_t v41 = begin[5];
    if ((unint64_t)v42 >= v41)
    {
      v44 = (int *)*v4;
      uint64_t v45 = ((char *)v42 - (unsigned char *)*v4) >> 2;
      unint64_t v46 = v45 + 1;
      if ((unint64_t)(v45 + 1) >> 62) {
        std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v47 = v41 - (void)v44;
      if (v47 >> 1 > v46) {
        unint64_t v46 = v47 >> 1;
      }
      if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v48 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v48 = v46;
      }
      if (v48)
      {
        __int16 v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(begin + 5), v48);
        v44 = (int *)begin[3];
        v42 = (int *)begin[4];
      }
      else
      {
        __int16 v49 = 0;
      }
      v50 = (int *)&v49[4 * v45];
      int *v50 = v28;
      __int16 v43 = v50 + 1;
      while (v42 != v44)
      {
        int v51 = *--v42;
        *--v50 = v51;
      }
      begin[3] = v50;
      begin[4] = v43;
      begin[5] = &v49[4 * v48];
      if (v44) {
        operator delete(v44);
      }
    }
    else
    {
      int *v42 = v28;
      __int16 v43 = v42 + 1;
    }
    begin[4] = v43;
    if ([(MomentumCurve *)self subtype] == 1)
    {
      [(MomentumCurve *)self frameInterval];
      float v8 = v8 - *(float *)&v9;
    }
  }
  while (!v29);
}

- (void)interpolateFrameIntervalMomentumDeltas
{
  unint64_t v41 = self;
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v42 = v3;
    v4 = v41;
    float v5 = (uint64_t *)((char *)v41->_deltas.__begin_ + 24 * v2);
    begin = (char *)v41->_interpolatedDeltas.__begin_;
    [(MomentumCurve *)v41 interpolationFrameInterval];
    float v8 = v7;
    [(MomentumCurve *)v4 frameInterval];
    float v10 = v9;
    unint64_t v11 = (v5[1] - *v5) >> 2;
    [(MomentumCurve *)v4 frameInterval];
    float v13 = v12 * (float)v11;
    [(MomentumCurve *)v4 interpolationFrameInterval];
    unsigned int v15 = (float)(v13 / v14);
    if (v15)
    {
      int v16 = 0;
      double v17 = (void **)&begin[24 * v2];
      float v18 = v8 / v10;
      float v19 = (unsigned int **)(v17 + 1);
      double v20 = v17 + 2;
      float v21 = 0.0;
      do
      {
        float v43 = NAN;
        float v22 = modff((float)((float)v16 / (float)((float)v15 + -1.0)) * (float)(v11 - 1), &v43);
        unint64_t v23 = v43;
        uint64_t v24 = *v5;
        unint64_t v25 = (v5[1] - *v5) >> 2;
        if (v25 <= v23) {
LABEL_28:
        }
          std::vector<int>::__throw_out_of_range[abi:ne180100]();
        unint64_t v26 = (v23 + 1);
        int v27 = *(_DWORD *)(v24 + 4 * v23);
        if (v11 <= v26)
        {
          int v28 = 0;
        }
        else
        {
          if (v25 <= v26) {
            goto LABEL_28;
          }
          int v28 = *(_DWORD *)(v24 + 4 * v26);
        }
        float v29 = v21 + (float)(v18 * (float)((float)(v22 * (float)v28) + (float)((float)v27 * (float)(1.0 - v22))));
        unsigned int v30 = llroundf(v29);
        double v31 = *v19;
        if ((unint64_t)*v19 >= *v20)
        {
          pair<int, int> v33 = (unsigned int *)*v17;
          uint64_t v34 = ((char *)v31 - (unsigned char *)*v17) >> 2;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 62) {
            std::vector<HSUtil::CoderKey const*>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v36 = *v20 - (void)v33;
          if (v36 >> 1 > v35) {
            unint64_t v35 = v36 >> 1;
          }
          if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v35;
          }
          if (v37)
          {
            float v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)v20, v37);
            double v31 = *v19;
            pair<int, int> v33 = (unsigned int *)*v17;
          }
          else
          {
            float v38 = 0;
          }
          float v39 = (unsigned int *)&v38[4 * v34];
          *float v39 = v30;
          double v32 = v39 + 1;
          while (v31 != v33)
          {
            unsigned int v40 = *--v31;
            *--float v39 = v40;
          }
          char *v17 = v39;
          *float v19 = v32;
          void *v20 = &v38[4 * v37];
          if (v33) {
            operator delete(v33);
          }
        }
        else
        {
          *double v31 = v30;
          double v32 = v31 + 1;
        }
        float v21 = v29 - (float)(int)roundf(v29);
        *float v19 = v32;
        ++v16;
      }
      while (v16 != v15);
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v42 & 1) != 0);
}

- (float)momentumDecayRateAlphaWithMickeys:()pair<float
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  if ([(MomentumCurve *)self subtype] != 4)
  {
    unsigned int v15 = [(MomentumCurve *)self subtype];
    [(MomentumCurve *)self frameInterval];
    if (v15 == 2)
    {
      if (v16 <= 0.0)
      {
        [(MomentumCurve *)self frameInterval];
        double v21 = v29 / 0.00800000038;
        long double v22 = 0.850000024;
        return pow(v22, v21);
      }
      float v17 = hypotf(var0, var1);
      [(MomentumCurve *)self frameInterval];
      float v19 = v17 / v18;
      float v12 = 1.0;
      if (v19 > 0.0)
      {
        float v12 = 0.0;
        if (v19 < 500.0) {
          float v12 = (float)(500.0 - v19) / 500.0;
        }
      }
      float v13 = 0.95;
      float v14 = -0.1;
    }
    else
    {
      if (v16 <= 0.0)
      {
        [(MomentumCurve *)self frameInterval];
        double v21 = v30 / 0.00800000038;
        long double v22 = 0.975000024;
        return pow(v22, v21);
      }
      float v23 = hypotf(var0, var1);
      [(MomentumCurve *)self frameInterval];
      float v25 = v23 / v24;
      float v12 = 1.0;
      if (v25 > 0.0)
      {
        float v12 = 0.0;
        if (v25 < 250.0) {
          float v12 = (float)(250.0 - v25) / 250.0;
        }
      }
      float v13 = 0.975;
      float v14 = -0.065;
    }
    goto LABEL_25;
  }
  [(MomentumCurve *)self frameInterval];
  if (v6 > 0.0)
  {
    float v7 = hypotf(var0, var1);
    [(MomentumCurve *)self frameInterval];
    float v9 = v7 / v8;
    float v10 = 0.0;
    if (v9 > 2000.0)
    {
      float v10 = 1.0;
      if (v9 < 3000.0) {
        float v10 = (float)(v9 + -2000.0) / 1000.0;
      }
    }
    float v11 = 1.0;
    if (v9 > 0.0)
    {
      float v11 = 0.0;
      if (v9 < 250.0) {
        float v11 = (float)(250.0 - v9) / 250.0;
      }
    }
    if (v10 >= v11) {
      float v12 = v10;
    }
    else {
      float v12 = v11;
    }
    float v13 = 0.98;
    float v14 = -0.08;
LABEL_25:
    long double v26 = (float)(v13 + (float)(v12 * v14));
    [(MomentumCurve *)self frameInterval];
    double v21 = v27 / 0.00800000038;
    long double v22 = v26;
    return pow(v22, v21);
  }
  [(MomentumCurve *)self frameInterval];
  double v21 = v20 / 0.00800000038;
  long double v22 = 0.899999976;
  return pow(v22, v21);
}

- (void)smoothCurveBody:(int)a3
{
  unint64_t v3 = 0;
  uint64_t v4 = 128;
  if (!a3) {
    uint64_t v4 = 104;
  }
  float v5 = (Class *)((char *)&self->super.isa + v4);
  char v6 = 1;
  do
  {
    char v7 = v6;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5[1] - *v5) >> 3) <= v3) {
      std::vector<int>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v8 = *v5 + 24 * v3;
    float v9 = *(int **)v8;
    float v10 = *(int **)(v8 + 8);
    if (v10 != *(int **)v8 && *v9)
    {
      float v11 = v9 + 1;
      while (v11 != v10)
      {
        if (!*v11++)
        {
          float v10 = v11 - 1;
          break;
        }
      }
      if (*v9 < 1)
      {
        v15[1] = -86;
        std::__sort<std::__less<int,int> &,int *>();
      }
      else
      {
        unint64_t v13 = 126 - 2 * __clz(v10 - v9);
        if (v10 == v9) {
          uint64_t v14 = 0;
        }
        else {
          uint64_t v14 = v13;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(v9, v10, (uint64_t)v15, v14, 1);
      }
    }
    char v6 = 0;
    unint64_t v3 = 1;
  }
  while ((v7 & 1) != 0);
}

- (void)smoothCurveTail:(int)a3 minFrameSkipsAtEndOfTail:(unsigned int)a4
{
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  uint64_t v7 = 128;
  if (!a3) {
    uint64_t v7 = 104;
  }
  uint64_t v8 = (Class *)((char *)&self->super.isa + v7);
  std::vector<int>::size_type v9 = a4;
  char v10 = 1;
  do
  {
    char v11 = v10;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8[1] - *v8) >> 3) <= v5) {
LABEL_31:
    }
      std::vector<int>::__throw_out_of_range[abi:ne180100]();
    float v12 = (std::vector<int> *)(*v8 + 24 * v5);
    p_end = (uint64_t *)&v12->__end_;
    end = v12->__end_;
    std::vector<int>::pointer begin = v12->__begin_;
    if (end == v12->__begin_)
    {
      unsigned int v17 = 0;
      int v19 = -1;
      uint64_t v20 = (uint64_t)v12->__end_;
    }
    else
    {
      unint64_t v16 = 0;
      unsigned int v17 = 0;
      unsigned int v18 = 0;
      int v19 = -1;
      uint64_t v20 = (uint64_t)v12->__end_;
      do
      {
        v21.__i_ = &begin[v16];
        if (*v21.__i_)
        {
          if (v17 <= v18) {
            unsigned int v17 = v18;
          }
          std::vector<int>::size_type v22 = v17 - v18;
          std::vector<int>::value_type __x = 0;
          std::vector<int>::insert(v12, v21, v22, &__x);
          unsigned int v18 = 0;
          v16 += v22;
          uint64_t v20 = *p_end;
          std::vector<int>::pointer begin = v12->__begin_;
          int v19 = v16;
        }
        else
        {
          ++v18;
        }
        ++v16;
      }
      while (v16 < (v20 - (uint64_t)begin) >> 2);
      end = begin;
    }
    uint64_t v23 = (uint64_t)&end[v19 + 1];
    if (v23 != v20)
    {
      uint64_t *p_end = v23;
      uint64_t v20 = (uint64_t)&end[v19 + 1];
    }
    uint64_t v24 = v19;
    if (v19 != -1 && v17 < a4)
    {
      v25.__i_ = &end[v19 + 1];
      std::vector<int>::value_type __x = 0;
      std::vector<int>::insert(v12, v25, v9, &__x);
      long double v26 = v12->__begin_;
      if ((std::vector<int>::pointer)*p_end == v12->__begin_) {
        std::vector<int>::__throw_out_of_range[abi:ne180100]();
      }
      v27.__i_ = &v26[v24 + 1 + v9];
      if (*v26 < 1) {
        std::vector<int>::value_type v28 = -1;
      }
      else {
        std::vector<int>::value_type v28 = 1;
      }
      std::vector<int>::value_type __x = v28;
      std::vector<int>::insert(v12, v27, &__x);
      uint64_t v20 = *p_end;
      end = v12->__begin_;
    }
    char v10 = 0;
    unint64_t v29 = (v20 - (uint64_t)end) >> 2;
    if (v6 <= v29) {
      unint64_t v6 = v29;
    }
    unint64_t v5 = 1;
  }
  while ((v11 & 1) != 0);
  unint64_t v30 = 0;
  char v31 = 1;
  do
  {
    char v32 = v31;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8[1] - *v8) >> 3) <= v30) {
      goto LABEL_31;
    }
    pair<int, int> v33 = (std::vector<int> *)(*v8 + 24 * v30);
    v34.__i_ = v33->__end_;
    std::vector<int>::size_type v35 = v6 - (v34.__i_ - v33->__begin_);
    std::vector<int>::value_type __x = 0;
    std::vector<int>::insert(v33, v34, v35, &__x);
    char v31 = 0;
    unint64_t v30 = 1;
  }
  while ((v32 & 1) != 0);
}

- (float)getTimeAtIndex:(unint64_t)a3 curve:(int)a4
{
  if (a4) {
    [(MomentumCurve *)self interpolationFrameInterval];
  }
  else {
    [(MomentumCurve *)self frameInterval];
  }
  return v5 * (float)(a3 + 1);
}

- (BOOL)atEndOfCurve
{
  unsigned int v3 = [(MomentumCurve *)self useInterpolatedCurve];
  uint64_t v4 = 104;
  if (v3) {
    uint64_t v4 = 128;
  }
  float v5 = *(Class *)((char *)&self->super.isa + v4);
  return [(MomentumCurve *)self curveIndex] >= (uint64_t)(v5[1] - *v5) >> 2
      && [(MomentumCurve *)self curveIndex] >= (uint64_t)(v5[4] - v5[3]) >> 2;
}

- (pair<int,)getCurrentMomentumDeltasAndStep
{
  if ([(MomentumCurve *)self atEndOfCurve])
  {
    unsigned int v3 = MTLoggingPlugin();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v34 = 136315650;
      std::vector<int>::size_type v35 = "[Error] ";
      __int16 v36 = 2080;
      unint64_t v37 = "";
      __int16 v38 = 2080;
      float v39 = "-[MomentumCurve getCurrentMomentumDeltasAndStep]";
      _os_log_impl(&def_411C8, v3, OS_LOG_TYPE_ERROR, "[HID] [MT] %s%s%s Momentum deltas requested past the end of the curves", (uint8_t *)&v34, 0x20u);
    }

    unsigned int v4 = 0;
    uint64_t v5 = 0;
    return (pair<int, int>)(v4 | (unint64_t)(v5 << 32));
  }
  std::vector<int>::pointer begin = (uint64_t *)self->_deltas.__begin_;
  uint64_t v7 = (uint64_t *)self->_interpolatedDeltas.__begin_;
  unsigned int v8 = [(MomentumCurve *)self useInterpolatedCurve];
  unint64_t v9 = [(MomentumCurve *)self curveIndex];
  unint64_t v10 = v9;
  if (v8)
  {
    [(MomentumCurve *)self getTimeAtIndex:v9 curve:1];
    float v12 = v11;
    [(MomentumCurve *)self getTimeAtIndex:(char *)[(MomentumCurve *)self curveIndex] + 1 curve:1];
    float v14 = v13;
    unint64_t v15 = [(MomentumCurve *)self curveIndex];
    uint64_t v16 = *v7;
    if (v15 >= (v7[1] - *v7) >> 2) {
      std::vector<int>::__throw_out_of_range[abi:ne180100]();
    }
    unint64_t v17 = v15;
    unint64_t v18 = [(MomentumCurve *)self curveIndex];
    uint64_t v19 = v7[3];
    if (v18 >= (v7[4] - v19) >> 2) {
      std::vector<int>::__throw_out_of_range[abi:ne180100]();
    }
    unsigned int v4 = *(_DWORD *)(v16 + 4 * v17);
    uint64_t v5 = *(unsigned int *)(v19 + 4 * v18);
    [(MomentumCurve *)self setCurveIndex:(char *)[(MomentumCurve *)self curveIndex] + 1];
    [(MomentumCurve *)self interpolationFrameInterval];
    -[MomentumCurve setCurrentInterval:](self, "setCurrentInterval:");
    [(MomentumCurve *)self currentInterval];
    -[MomentumCurve setNextInterval:](self, "setNextInterval:");
    if ([(MomentumCurve *)self stopInterpolatingInfoSet])
    {
      if (![(MomentumCurve *)self atEndOfCurve])
      {
        [(MomentumCurve *)self stopInterpolatingTime];
        if (v14 >= v20)
        {
          [(MomentumCurve *)self setUseInterpolatedCurve:0];
          [(MomentumCurve *)self setCurveIndex:[(MomentumCurve *)self stopInterpolatingDefaultIndex]];
          [(MomentumCurve *)self getTimeAtIndex:[(MomentumCurve *)self curveIndex] curve:0];
          float v22 = v21 - v12;
          [(MomentumCurve *)self frameInterval];
          *(float *)&double v24 = v22 / v23;
          [(MomentumCurve *)self setFirstSwitchFromInterpolatedCurveMultiplier:v24];
          *(float *)&double v25 = v22;
          [(MomentumCurve *)self setFirstSwitchFromInterpolatedCurveInterval:v25];
          [(MomentumCurve *)self firstSwitchFromInterpolatedCurveInterval];
          -[MomentumCurve setNextInterval:](self, "setNextInterval:");
          long double v26 = self;
          uint64_t v27 = 1;
LABEL_16:
          [(MomentumCurve *)v26 setFirstSwitchFromInterpolatedCurve:v27];
        }
      }
    }
  }
  else
  {
    uint64_t v28 = *begin;
    if (v9 >= (begin[1] - *begin) >> 2) {
      std::vector<int>::__throw_out_of_range[abi:ne180100]();
    }
    unint64_t v29 = [(MomentumCurve *)self curveIndex];
    uint64_t v30 = begin[3];
    if (v29 >= (begin[4] - v30) >> 2) {
      std::vector<int>::__throw_out_of_range[abi:ne180100]();
    }
    unsigned int v4 = *(_DWORD *)(v28 + 4 * v10);
    uint64_t v5 = *(unsigned int *)(v30 + 4 * v29);
    [(MomentumCurve *)self setCurveIndex:(char *)[(MomentumCurve *)self curveIndex] + 1];
    [(MomentumCurve *)self frameInterval];
    -[MomentumCurve setCurrentInterval:](self, "setCurrentInterval:");
    [(MomentumCurve *)self currentInterval];
    -[MomentumCurve setNextInterval:](self, "setNextInterval:");
    if ([(MomentumCurve *)self firstSwitchFromInterpolatedCurve])
    {
      [(MomentumCurve *)self firstSwitchFromInterpolatedCurveMultiplier];
      unsigned int v4 = llroundf(v31 * (float)(int)v4);
      [(MomentumCurve *)self firstSwitchFromInterpolatedCurveMultiplier];
      LODWORD(v5) = llroundf(v32 * (float)(int)v5);
      [(MomentumCurve *)self firstSwitchFromInterpolatedCurveInterval];
      -[MomentumCurve setCurrentInterval:](self, "setCurrentInterval:");
      long double v26 = self;
      uint64_t v27 = 0;
      goto LABEL_16;
    }
  }
  return (pair<int, int>)(v4 | (unint64_t)(v5 << 32));
}

- (pair<int,)getCurrentMomentumDeltas
{
  if ([(MomentumCurve *)self atEndOfCurve])
  {
    return (pair<int, int>)0;
  }
  else
  {
    if ([(MomentumCurve *)self useInterpolatedCurve]) {
      uint64_t v4 = 128;
    }
    else {
      uint64_t v4 = 104;
    }
    uint64_t v5 = *(uint64_t **)((char *)&self->super.isa + v4);
    unint64_t v6 = [(MomentumCurve *)self curveIndex];
    uint64_t v7 = *v5;
    uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v4);
    return (pair<int, int>)(*(unsigned int *)(v7 + 4 * v6) | ((unint64_t)*(unsigned int *)(*(void *)(v8 + 24)
                                                                                                + 4
                                                                                                * [(MomentumCurve *)self curveIndex]) << 32));
  }
}

- (int)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(int)a3
{
  self->_subtype = a3;
}

- (void)setAtEndOfCurve:(BOOL)a3
{
  self->_atEndOfCurve = a3;
}

- (int)dragButtons
{
  return self->_dragButtons;
}

- (void)setDragButtons:(int)a3
{
  self->_dragButtons = a3;
}

- (float)scrollMomentumDispatchRate
{
  return self->_scrollMomentumDispatchRate;
}

- (void)setScrollMomentumDispatchRate:(float)a3
{
  self->_scrollMomentumDispatchRate = a3;
}

- (float)currentInterval
{
  return self->_currentInterval;
}

- (void)setCurrentInterval:(float)a3
{
  self->_currentInterval = a3;
}

- (float)nextInterval
{
  return self->_nextInterval;
}

- (void)setNextInterval:(float)a3
{
  self->_nextInterval = a3;
}

- (float)frameInterval
{
  return self->_frameInterval;
}

- (void)setFrameInterval:(float)a3
{
  self->_frameInterval = a3;
}

- (float)physicalFrameInterval
{
  return self->_physicalFrameInterval;
}

- (void)setPhysicalFrameInterval:(float)a3
{
  self->_physicalFrameInterval = a3;
}

- (float)deltaMultiplier
{
  return self->_deltaMultiplier;
}

- (void)setDeltaMultiplier:(float)a3
{
  self->_deltaMultiplier = a3;
}

- (float)maxDecayTime
{
  return self->_maxDecayTime;
}

- (void)setMaxDecayTime:(float)a3
{
  self->_maxDecayTime = a3;
}

- (float)decayStopDelta
{
  return self->_decayStopDelta;
}

- (void)setDecayStopDelta:(float)a3
{
  self->_decayStopDelta = a3;
}

- (BOOL)useInterpolatedCurve
{
  return self->_useInterpolatedCurve;
}

- (void)setUseInterpolatedCurve:(BOOL)a3
{
  self->_useInterpolatedCurve = a3;
}

- (float)interpolationFrameInterval
{
  return self->_interpolationFrameInterval;
}

- (void)setInterpolationFrameInterval:(float)a3
{
  self->_interpolationFrameInterval = a3;
}

- (BOOL)stopInterpolatingInfoSet
{
  return self->_stopInterpolatingInfoSet;
}

- (void)setStopInterpolatingInfoSet:(BOOL)a3
{
  self->_stopInterpolatingInfoSet = a3;
}

- (BOOL)firstSwitchFromInterpolatedCurve
{
  return self->_firstSwitchFromInterpolatedCurve;
}

- (void)setFirstSwitchFromInterpolatedCurve:(BOOL)a3
{
  self->_firstSwitchFromInterpolatedCurve = a3;
}

- (unint64_t)stopInterpolatingDefaultIndex
{
  return self->_stopInterpolatingDefaultIndex;
}

- (void)setStopInterpolatingDefaultIndex:(unint64_t)a3
{
  self->_stopInterpolatingDefaultIndex = a3;
}

- (float)stopInterpolatingTime
{
  return self->_stopInterpolatingTime;
}

- (void)setStopInterpolatingTime:(float)a3
{
  self->_stopInterpolatingTime = a3;
}

- (float)firstSwitchFromInterpolatedCurveMultiplier
{
  return self->_firstSwitchFromInterpolatedCurveMultiplier;
}

- (void)setFirstSwitchFromInterpolatedCurveMultiplier:(float)a3
{
  self->_firstSwitchFromInterpolatedCurveMultiplier = a3;
}

- (float)firstSwitchFromInterpolatedCurveInterval
{
  return self->_firstSwitchFromInterpolatedCurveInterval;
}

- (void)setFirstSwitchFromInterpolatedCurveInterval:(float)a3
{
  self->_firstSwitchFromInterpolatedCurveInterval = a3;
}

- (unsigned)minFrameSkipsAtEndOfTail
{
  return self->_minFrameSkipsAtEndOfTail;
}

- (void)setMinFrameSkipsAtEndOfTail:(unsigned int)a3
{
  self->_minFrameSkipsAtEndOfTail = a3;
}

- (unsigned)interpolationMinFrameSkipsAtEndOfTail
{
  return self->_interpolationMinFrameSkipsAtEndOfTail;
}

- (void)setInterpolationMinFrameSkipsAtEndOfTail:(unsigned int)a3
{
  self->_interpolationMinFrameSkipsAtEndOfTail = a3;
}

- (pair<int,)initialDelta
{
  return self->_initialDelta;
}

- (void)setInitialDelta:()pair<int
{
  self->_initialDelta = a3;
}

- (vector<std::vector<int>,)deltas
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::vector<int>, std::allocator<std::vector<int>>> *)std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(retstr, (uint64_t)self->_deltas.__begin_, (uint64_t)self->_deltas.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_deltas.__end_- (char *)self->_deltas.__begin_) >> 3));
}

- (void)setDeltas:()vector<std:(std::allocator<std::vector<int>>> *)a3 :vector<int>
{
  p_deltas = &self->_deltas;
  if (p_deltas != a3) {
    std::vector<std::vector<int>>::__assign_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>((uint64_t)p_deltas, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  }
}

- (vector<std::vector<int>,)interpolatedDeltas
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  return (vector<std::vector<int>, std::allocator<std::vector<int>>> *)std::vector<std::vector<int>>::__init_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>(retstr, (uint64_t)self->_interpolatedDeltas.__begin_, (uint64_t)self->_interpolatedDeltas.__end_, 0xAAAAAAAAAAAAAAABLL* (((char *)self->_interpolatedDeltas.__end_- (char *)self->_interpolatedDeltas.__begin_) >> 3));
}

- (void)setInterpolatedDeltas:()vector<std:(std::allocator<std::vector<int>>> *)a3 :vector<int>
{
  p_interpolatedDeltas = &self->_interpolatedDeltas;
  if (p_interpolatedDeltas != a3) {
    std::vector<std::vector<int>>::__assign_with_size[abi:ne180100]<std::vector<int>*,std::vector<int>*>((uint64_t)p_interpolatedDeltas, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  }
}

- (unint64_t)curveIndex
{
  return self->_curveIndex;
}

- (void)setCurveIndex:(unint64_t)a3
{
  self->_curveIndex = a3;
}

- (void).cxx_destruct
{
  p_interpolatedDeltas = &self->_interpolatedDeltas;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_interpolatedDeltas);
  p_interpolatedDeltas = &self->_deltas;
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_interpolatedDeltas);
}

- (id).cxx_construct
{
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  return self;
}

@end