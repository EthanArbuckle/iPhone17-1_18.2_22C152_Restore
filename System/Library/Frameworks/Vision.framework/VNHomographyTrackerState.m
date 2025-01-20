@interface VNHomographyTrackerState
- (BOOL)ICShouldBeCanceled;
- (VNHomographyTrackerState)init;
- (id).cxx_construct;
- (void)ICReportFrameAnalysis:(id)a3 forPresentationTime:(id *)a4 withStats:(id)a5;
- (void)dealloc;
@end

@implementation VNHomographyTrackerState

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_transformsAndConfidences.__begin_;
  if (begin)
  {
    self->_transformsAndConfidences.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_analysisSemaphore, 0);
}

- (void)ICReportFrameAnalysis:(id)a3 forPresentationTime:(id *)a4 withStats:(id)a5
{
  id v60 = a3;
  id v7 = a5;
  v8 = [v60 objectAtIndexedSubscript:0];
  [v8 floatValue];
  *(void *)&long long v58 = v9;
  v10 = [v60 objectAtIndexedSubscript:3];
  [v10 floatValue];
  int v53 = v11;
  v12 = [v60 objectAtIndexedSubscript:6];
  [v12 floatValue];
  int v52 = v13;

  v14 = [v60 objectAtIndexedSubscript:1];
  [v14 floatValue];
  *(void *)&long long v56 = v15;
  v16 = [v60 objectAtIndexedSubscript:4];
  [v16 floatValue];
  int v51 = v17;
  v18 = [v60 objectAtIndexedSubscript:7];
  [v18 floatValue];
  int v50 = v19;

  v20 = [v60 objectAtIndexedSubscript:2];
  [v20 floatValue];
  *(void *)&long long v54 = v21;
  v22 = [v60 objectAtIndexedSubscript:5];
  [v22 floatValue];
  int v49 = v23;
  v24 = [v60 objectAtIndexedSubscript:8];
  [v24 floatValue];
  int v48 = v25;

  v26 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F6F3A0]];
  [v26 floatValue];
  int v28 = v27;
  long long v29 = v58;
  DWORD1(v29) = v53;
  DWORD2(v29) = v52;
  long long v59 = v29;
  long long v30 = v56;
  DWORD1(v30) = v51;
  DWORD2(v30) = v50;
  long long v57 = v30;
  long long v31 = v54;
  DWORD1(v31) = v49;
  DWORD2(v31) = v48;
  long long v55 = v31;

  os_unfair_lock_lock(&self->_resultsLock);
  end = (char *)self->_transformsAndConfidences.__end_;
  value = (char *)self->_transformsAndConfidences.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->_transformsAndConfidences.__begin_;
    uint64_t v36 = (end - begin) >> 6;
    unint64_t v37 = v36 + 1;
    if ((unint64_t)(v36 + 1) >> 58) {
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v38 = value - begin;
    if (v38 >> 5 > v37) {
      unint64_t v37 = v38 >> 5;
    }
    if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v39 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v39 = v37;
    }
    if (v39) {
      unint64_t v39 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<simd_float3x3,float>>>(v39);
    }
    else {
      uint64_t v40 = 0;
    }
    v41 = (_DWORD *)(v39 + (v36 << 6));
    v42 = (void *)(v39 + (v40 << 6));
    *(void *)v41 = v59;
    v41[2] = DWORD2(v59);
    v41[3] = 0;
    v41[6] = DWORD2(v57);
    *((void *)v41 + 2) = v57;
    v41[7] = 0;
    *((void *)v41 + 4) = v55;
    v41[10] = DWORD2(v55);
    v41[11] = 0;
    v41[12] = v28;
    v34 = v41 + 16;
    v44 = (char *)self->_transformsAndConfidences.__begin_;
    v43 = (char *)self->_transformsAndConfidences.__end_;
    if (v43 != v44)
    {
      do
      {
        long long v45 = *((_OWORD *)v43 - 4);
        long long v46 = *((_OWORD *)v43 - 3);
        long long v47 = *((_OWORD *)v43 - 1);
        *((_OWORD *)v41 - 2) = *((_OWORD *)v43 - 2);
        *((_OWORD *)v41 - 1) = v47;
        *((_OWORD *)v41 - 4) = v45;
        *((_OWORD *)v41 - 3) = v46;
        v41 -= 16;
        v43 -= 64;
      }
      while (v43 != v44);
      v43 = (char *)self->_transformsAndConfidences.__begin_;
    }
    self->_transformsAndConfidences.__begin_ = v41;
    self->_transformsAndConfidences.__end_ = v34;
    self->_transformsAndConfidences.__end_cap_.__value_ = v42;
    if (v43) {
      operator delete(v43);
    }
  }
  else
  {
    *((_DWORD *)end + 2) = DWORD2(v59);
    *(void *)end = v59;
    *((_DWORD *)end + 3) = 0;
    *((_DWORD *)end + 6) = DWORD2(v57);
    *((void *)end + 2) = v57;
    *((_DWORD *)end + 7) = 0;
    *((_DWORD *)end + 10) = DWORD2(v55);
    *((void *)end + 4) = v55;
    *((_DWORD *)end + 11) = 0;
    v34 = end + 64;
    *((_DWORD *)end + 12) = v28;
  }
  self->_transformsAndConfidences.__end_ = v34;
  os_unfair_lock_unlock(&self->_resultsLock);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_analysisSemaphore);
}

- (BOOL)ICShouldBeCanceled
{
  return 0;
}

- (void)dealloc
{
  if (self->_analysisSession)
  {
    ICDestroyResult();
    self->_analysisSession = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VNHomographyTrackerState;
  [(VNHomographyTrackerState *)&v3 dealloc];
}

- (VNHomographyTrackerState)init
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VNHomographyTrackerState;
  v2 = [(VNHomographyTrackerState *)&v9 init];
  objc_super v3 = v2;
  if (!v2) {
    goto LABEL_5;
  }
  uint64_t v10 = *MEMORY[0x1E4F6F388];
  v11[0] = v2;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v3->_analysisSession = (void *)ICAnalysisInit();

  if (!v3->_analysisSession) {
    goto LABEL_5;
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  analysisSemaphore = v3->_analysisSemaphore;
  v3->_analysisSemaphore = (OS_dispatch_semaphore *)v5;

  if (v3->_analysisSemaphore)
  {
    v3->_analysisPreRollFramesRemaining = 5;
    v3->_resultsLock._os_unfair_lock_opaque = 0;
    id v7 = v3;
  }
  else
  {
LABEL_5:
    id v7 = 0;
  }

  return v7;
}

@end