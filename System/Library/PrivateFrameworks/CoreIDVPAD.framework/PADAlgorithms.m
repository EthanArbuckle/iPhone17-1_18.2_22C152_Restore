@interface PADAlgorithms
- (PADAlgorithms)initWithPADModelConfiguration:(id)a3;
- (double)getPRDFakeFrameThreshold;
- (double)getPRDLiveFrameThreshold;
- (double)performIDMatching:(id)a3 toFaceprints:(id)a4 error:(id *)a5;
- (id).cxx_construct;
- (id)_retrieveFaceprintsFromPredictorUsingFACInput:(id)a3;
- (id)_retrieveReferenceFramesFromPredictor;
- (id)getFACVersion;
- (id)performFAC:(id)a3 gesture:(int64_t)a4 error:(id *)a5;
- (id)processFacePoseInput:(id)a3 gesture:(int64_t)a4 error:(id *)a5;
- (int64_t)performSC:(id)a3 assessmentTA:(id)a4 assessmentFakePRD:(id)a5 assessmentLivePRD:(id)a6 assessmentID:(id)a7 error:(id *)a8;
- (unint64_t)requiredObservationSetSizeFAC:(int64_t)a3;
- (void)performTA:(__CVBuffer *)a3 nccSignal:(double *)a4 stitchDetected:(BOOL *)a5 isSensitive:(BOOL)a6 error:(id *)a7;
@end

@implementation PADAlgorithms

- (PADAlgorithms)initWithPADModelConfiguration:(id)a3
{
  id v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)PADAlgorithms;
  v5 = [(PADAlgorithms *)&v86 init];

  if (!v5) {
    goto LABEL_60;
  }
  id v6 = v4;
  v7 = (char *)operator new(0x88uLL);
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = 0;
  *(void *)v7 = &unk_26D0A5C98;
  *(_OWORD *)(v7 + 24) = xmmword_21F0CB0A0;
  v8 = (LivenessCheck_Options *)(v7 + 24);
  *(_OWORD *)(v7 + 40) = xmmword_21F0CB0B0;
  *((_DWORD *)v7 + 14) = 1043730740;
  *(_OWORD *)(v7 + 60) = xmmword_21F0CB0C0;
  *((_DWORD *)v7 + 19) = 10;
  *((_OWORD *)v7 + 5) = xmmword_21F0CB0D0;
  *((_OWORD *)v7 + 6) = xmmword_21F0CB0E0;
  *((void *)v7 + 14) = 0x3E19999A3E99999ALL;
  *(_OWORD *)(v7 + 120) = xmmword_21F0CB0F0;
  v9 = objc_msgSend(v6, "objectForKey:", @"leftPoseDegree", v7 + 24, v7);

  if (v9)
  {
    v10 = [v6 objectForKey:@"leftPoseDegree"];
    [v10 floatValue];
    *(_DWORD *)v8 = v11;
  }
  v12 = [v6 objectForKey:@"rightPoseDegree"];

  if (v12)
  {
    v13 = [v6 objectForKey:@"rightPoseDegree"];
    [v13 floatValue];
    *((_DWORD *)v7 + 7) = v14;
  }
  v15 = [v6 objectForKey:@"upPoseDegree"];

  if (v15)
  {
    v16 = [v6 objectForKey:@"upPoseDegree"];
    [v16 floatValue];
    *((_DWORD *)v7 + 8) = v17;
  }
  v18 = [v6 objectForKey:@"downPoseDegree"];

  if (v18)
  {
    v19 = [v6 objectForKey:@"downPoseDegree"];
    [v19 floatValue];
    *((_DWORD *)v7 + 9) = v20;
  }
  v21 = [v6 objectForKey:@"eyebrowRatio"];

  if (v21)
  {
    v22 = [v6 objectForKey:@"eyebrowRatio"];
    [v22 floatValue];
    *((_DWORD *)v7 + 12) = v23;
  }
  v24 = [v6 objectForKey:@"mouthRatio"];

  if (v24)
  {
    v25 = [v6 objectForKey:@"mouthRatio"];
    [v25 floatValue];
    *((_DWORD *)v7 + 14) = v26;
  }
  v27 = [v6 objectForKey:@"eyeRatio"];

  if (v27)
  {
    v28 = [v6 objectForKey:@"eyeRatio"];
    [v28 floatValue];
    *((_DWORD *)v7 + 13) = v29;
  }
  v30 = [v6 objectForKey:@"consecutiveFrame"];

  if (v30)
  {
    v31 = [v6 objectForKey:@"consecutiveFrame"];
    *((_DWORD *)v7 + 15) = [v31 intValue];
  }
  v32 = [v6 objectForKey:@"eyeConsecutiveFrame"];

  if (v32)
  {
    v33 = [v6 objectForKey:@"eyeConsecutiveFrame"];
    *((_DWORD *)v7 + 16) = [v33 intValue];
  }
  v34 = [v6 objectForKey:@"bufferFAC"];

  if (v34)
  {
    v35 = [v6 objectForKey:@"bufferFAC"];
    *((_DWORD *)v7 + 17) = [v35 intValue];
  }
  v36 = [v6 objectForKey:@"bufferFACEye"];

  if (v36)
  {
    v37 = [v6 objectForKey:@"bufferFACEye"];
    *((_DWORD *)v7 + 18) = [v37 intValue];
  }
  v38 = [v6 objectForKey:@"secDiffTAThreshold"];

  if (v38)
  {
    v39 = [v6 objectForKey:@"secDiffTAThreshold"];
    [v39 floatValue];
    *((_DWORD *)v7 + 20) = v40;
  }
  v41 = [v6 objectForKey:@"bufferTA"];

  if (v41)
  {
    v42 = [v6 objectForKey:@"bufferTA"];
    *((_DWORD *)v7 + 19) = [v42 intValue];
  }
  v43 = [v6 objectForKey:@"prdThresholdFake"];

  if (v43)
  {
    v44 = [v6 objectForKey:@"prdThresholdFake"];
    [v44 floatValue];
    *((_DWORD *)v7 + 23) = v45;
  }
  v46 = [v6 objectForKey:@"prdFrameThresholdFake"];

  if (v46)
  {
    v47 = [v6 objectForKey:@"prdFrameThresholdFake"];
    [v47 floatValue];
    *((_DWORD *)v7 + 24) = v48;
  }
  v49 = [v6 objectForKey:@"prdThresholdLive"];

  if (v49)
  {
    v50 = [v6 objectForKey:@"prdThresholdLive"];
    [v50 floatValue];
    *((_DWORD *)v7 + 25) = v51;
  }
  v52 = [v6 objectForKey:@"prdFrameThresholdLive"];

  if (v52)
  {
    v53 = [v6 objectForKey:@"prdFrameThresholdLive"];
    [v53 floatValue];
    *((_DWORD *)v7 + 26) = v54;
  }
  v55 = [v6 objectForKey:@"facThreshold"];

  if (v55)
  {
    v56 = [v6 objectForKey:@"facThreshold"];
    [v56 floatValue];
    *((_DWORD *)v7 + 21) = v57;
  }
  v58 = [v6 objectForKey:@"taThreshold"];

  if (v58)
  {
    v59 = [v6 objectForKey:@"taThreshold"];
    [v59 floatValue];
    *((_DWORD *)v7 + 22) = v60;
  }
  v61 = [v6 objectForKey:@"idThreshold"];

  if (v61)
  {
    v62 = [v6 objectForKey:@"idThreshold"];
    [v62 floatValue];
    *((_DWORD *)v7 + 27) = v63;
  }
  v64 = [v6 objectForKey:@"stitchDetectorImageHeight"];

  if (v64)
  {
    v65 = [v6 objectForKey:@"stitchDetectorImageHeight"];
    *((_DWORD *)v7 + 30) = [v65 intValue];
  }
  v66 = [v6 objectForKey:@"stitchDetectorImageWidth"];

  if (v66)
  {
    v67 = [v6 objectForKey:@"stitchDetectorImageWidth"];
    *((_DWORD *)v7 + 31) = [v67 intValue];
  }
  v68 = [v6 objectForKey:@"stitchDetectorNccThreshold"];

  if (v68)
  {
    v69 = [v6 objectForKey:@"stitchDetectorNccThreshold"];
    [v69 floatValue];
    *((_DWORD *)v7 + 28) = v70;
  }
  v71 = [v6 objectForKey:@"stitchDetectorNccThreshold2"];

  if (v71)
  {
    v72 = [v6 objectForKey:@"stitchDetectorNccThreshold2"];
    [v72 floatValue];
    *((_DWORD *)v7 + 29) = v73;
  }
  v74 = [v6 objectForKey:@"stitchDetectorZonesH"];

  if (v74)
  {
    v75 = [v6 objectForKey:@"stitchDetectorZonesH"];
    *((_DWORD *)v7 + 32) = [v75 intValue];
  }
  v76 = [v6 objectForKey:@"stitchDetectorZonesW"];

  if (v76)
  {
    v77 = [v6 objectForKey:@"stitchDetectorZonesW"];
    *((_DWORD *)v7 + 33) = [v77 intValue];
  }
  cntrl = (std::__shared_weak_count *)v5->_config.__cntrl_;
  v5->_config.__ptr_ = v8;
  v5->_config.__cntrl_ = (__shared_weak_count *)v7;
  if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
    std::__shared_weak_count::__release_weak(cntrl);
  }
  ptr = v5->_config.__ptr_;
  v80 = operator new(0x230uLL);
  v80[1] = 0;
  v80[2] = 0;
  void *v80 = &unk_26D0A5CE8;
  uint64_t v81 = vision::mod::LivenessCheckPredictor::LivenessCheckPredictor((vision::mod::LivenessCheckPredictor *)(v80 + 3), ptr);
  v82 = (std::__shared_weak_count *)v5->_predictor.__cntrl_;
  v5->_predictor.__ptr_ = (LivenessCheckPredictor *)v81;
  v5->_predictor.__cntrl_ = (__shared_weak_count *)v80;
  if (!v82) {
    goto LABEL_60;
  }
  if (atomic_fetch_add(&v82->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    if (v5->_predictor.__ptr_)
    {
LABEL_60:
      v83 = v5;
      goto LABEL_61;
    }
  }
  else
  {
    ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
    std::__shared_weak_count::__release_weak(v82);
    if (v5->_predictor.__ptr_) {
      goto LABEL_60;
    }
  }
  v85 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
    -[PADAlgorithms initWithPADModelConfiguration:](v85);
  }

  v83 = 0;
LABEL_61:

  return v83;
}

- (id)getFACVersion
{
  return @"8.0";
}

- (unint64_t)requiredObservationSetSizeFAC:(int64_t)a3
{
  if (a3 == 9 || a3 == 4) {
    return *((int *)self->_config.__ptr_ + 12);
  }
  else {
    return *((int *)self->_config.__ptr_ + 11);
  }
}

- (id)processFacePoseInput:(id)a3 gesture:(int64_t)a4 error:(id *)a5
{
  v72[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [v8 facePoseValues];
  unint64_t v10 = [v9 count];

  int v11 = LivenessActionFromGesture(a4);
  v68 = 0;
  v69 = 0;
  uint64_t v70 = 0;
  v65 = 0;
  v66 = 0;
  uint64_t v67 = 0;
  v62 = 0;
  int v63 = 0;
  uint64_t v64 = 0;
  v59 = 0;
  int v60 = 0;
  uint64_t v61 = 0;
  __p = 0;
  int v57 = 0;
  uint64_t v58 = 0;
  if (v10)
  {
    std::vector<float>::__append((uint64_t)&v68, v10);
    v12 = (char *)v65;
    unint64_t v13 = (v66 - (unsigned char *)v65) >> 2;
    BOOL v14 = v10 >= v13;
    if (v10 > v13)
    {
      std::vector<float>::__append((uint64_t)&v65, v10 - v13);
      goto LABEL_7;
    }
  }
  else
  {
    v12 = 0;
    BOOL v14 = 1;
  }
  if (!v14) {
    v66 = &v12[4 * v10];
  }
LABEL_7:
  unint64_t v15 = (v63 - (unsigned char *)v62) >> 2;
  if (v10 <= v15)
  {
    if (v10 < v15) {
      int v63 = (char *)v62 + 4 * v10;
    }
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v62, v10 - v15);
  }
  unint64_t v16 = (v60 - (unsigned char *)v59) >> 2;
  if (v10 <= v16)
  {
    if (v10 < v16) {
      int v60 = (char *)v59 + 4 * v10;
    }
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v59, v10 - v16);
  }
  int v17 = v57;
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((v57 - (unsigned char *)__p) >> 3);
  if (v10 > v18)
  {
    std::vector<std::vector<float>>::__append((uint64_t)&__p, v10 - v18);
LABEL_25:
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    do
    {
      v25 = [v8 facePoseValues];
      int v26 = [v25 objectAtIndexedSubscript:v24];

      [v26 roll];
      *(float *)&double v27 = v27;
      *((_DWORD *)v62 + v24) = LODWORD(v27);
      [v26 pitch];
      *(float *)&double v28 = v28;
      *((_DWORD *)v65 + v24) = LODWORD(v28);
      [v26 yaw];
      *(float *)&double v29 = v29;
      *((_DWORD *)v59 + v24) = LODWORD(v29);
      [v26 smile];
      *(float *)&double v30 = v30;
      *((_DWORD *)v68 + v24) = LODWORD(v30);
      [v26 roll];
      if (fabs(v31) < 20.0)
      {
        [v26 pitch];
        if (fabs(v32) < 20.0) {
          [v26 yaw];
        }
      }
      v33 = [v26 landmarks];
      BOOL v34 = v33 == 0;

      if (v34)
      {
        v38 = (char *)__p + v23;
        v39 = *(void **)((char *)__p + v23);
        if (v39)
        {
          v38[1] = v39;
          operator delete(v39);
          void *v38 = 0;
          v38[1] = 0;
          v38[2] = 0;
        }
        void *v38 = 0;
        v38[1] = 0;
        v38[2] = 0;
      }
      else
      {
        v35 = [v26 landmarks];
        NSArrayAsVector(&v54, v35);
        v36 = (char *)__p + v23;
        v37 = *(void **)((char *)__p + v23);
        if (v37)
        {
          v36[1] = v37;
          operator delete(v37);
          void *v36 = 0;
          v36[1] = 0;
          v36[2] = 0;
        }
        *(_OWORD *)v36 = v54;
        v36[2] = v55;
        long long v54 = 0uLL;
        uint64_t v55 = 0;
      }
      ++v24;
      v23 += 24;
    }
    while (v10 != v24);
    goto LABEL_37;
  }
  if (v10 < v18)
  {
    v19 = (char *)__p + 24 * v10;
    if (v57 != v19)
    {
      int v20 = v57;
      do
      {
        v22 = (void *)*((void *)v20 - 3);
        v20 -= 24;
        v21 = v22;
        if (v22)
        {
          *((void *)v17 - 2) = v21;
          operator delete(v21);
        }
        int v17 = v20;
      }
      while (v20 != v19);
    }
    int v57 = v19;
  }
  if (v10) {
    goto LABEL_25;
  }
LABEL_37:
  ptr = self->_predictor.__ptr_;
  LODWORD(v54) = v11;
  uint64_t v41 = vision::mod::LivenessCheckPredictor::processFacePoseData((uint64_t)ptr, (uint64_t)&v68, (uint64_t *)&v65, &v59, &v62, &__p, (int *)&v54);
  if (v41)
  {
    if (!a5)
    {
      int v45 = 0;
      v47 = (char *)__p;
      if (!__p) {
        goto LABEL_49;
      }
      goto LABEL_42;
    }
    v42 = (void *)MEMORY[0x263F087E8];
    uint64_t v71 = *MEMORY[0x263F07F80];
    v43 = objc_msgSend(NSString, "stringWithFormat:", @"FAC classifier failed with status: %d", v41);
    v72[0] = v43;
    v44 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
    *a5 = [v42 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v44];

    int v45 = 0;
  }
  else
  {
    int v45 = objc_alloc_init(PADAlgorithmFACResult);
    v46 = [(PADAlgorithms *)self _retrieveFaceprintsFromPredictorUsingFACInput:v8];
    [(PADAlgorithmFACResult *)v45 setFaceprints:v46];

    v43 = [(PADAlgorithms *)self _retrieveReferenceFramesFromPredictor];
    [(PADAlgorithmFACResult *)v45 setReferenceFrameIndices:v43];
  }

  v47 = (char *)__p;
  if (!__p) {
    goto LABEL_49;
  }
LABEL_42:
  int v48 = v57;
  v49 = v47;
  if (v57 != v47)
  {
    v50 = v57;
    do
    {
      v52 = (void *)*((void *)v50 - 3);
      v50 -= 24;
      int v51 = v52;
      if (v52)
      {
        *((void *)v48 - 2) = v51;
        operator delete(v51);
      }
      int v48 = v50;
    }
    while (v50 != v47);
    v49 = __p;
  }
  int v57 = v47;
  operator delete(v49);
LABEL_49:
  if (v59)
  {
    int v60 = (char *)v59;
    operator delete(v59);
  }
  if (v62)
  {
    int v63 = (char *)v62;
    operator delete(v62);
  }
  if (v65)
  {
    v66 = (char *)v65;
    operator delete(v65);
  }
  if (v68)
  {
    v69 = v68;
    operator delete(v68);
  }

  return v45;
}

- (id)performFAC:(id)a3 gesture:(int64_t)a4 error:(id *)a5
{
  v81[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [v7 facePoseValues];
  unint64_t v9 = [v8 count];

  unint64_t v10 = [(PADAlgorithms *)self requiredObservationSetSizeFAC:a4];
  if (v9 < v10)
  {
    if (a5)
    {
      int v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v80 = *MEMORY[0x263F07F80];
      v12 = objc_msgSend(NSString, "stringWithFormat:", @"Insufficient observations: %d. Expected at least: %d", v9, v10);
      v81[0] = v12;
      unint64_t v13 = [NSDictionary dictionaryWithObjects:v81 forKeys:&v80 count:1];
      *a5 = [v11 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v13];
    }
    BOOL v14 = 0;
    goto LABEL_65;
  }
  int v15 = LivenessActionFromGesture(a4);
  v75 = 0;
  v76 = 0;
  uint64_t v77 = 0;
  v72 = 0;
  int v73 = 0;
  uint64_t v74 = 0;
  v69 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  v66 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  __p = 0;
  uint64_t v64 = 0;
  uint64_t v65 = 0;
  if (v9)
  {
    std::vector<float>::__append((uint64_t)&v75, v9);
    unint64_t v16 = (char *)v72;
    unint64_t v17 = (v73 - (unsigned char *)v72) >> 2;
    BOOL v18 = v9 >= v17;
    if (v9 > v17)
    {
      std::vector<float>::__append((uint64_t)&v72, v9 - v17);
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v16 = 0;
    BOOL v18 = 1;
  }
  if (!v18) {
    int v73 = &v16[4 * v9];
  }
LABEL_11:
  unint64_t v19 = (v70 - (unsigned char *)v69) >> 2;
  if (v9 <= v19)
  {
    if (v9 < v19) {
      uint64_t v70 = (char *)v69 + 4 * v9;
    }
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v69, v9 - v19);
  }
  unint64_t v20 = (v67 - (unsigned char *)v66) >> 2;
  if (v9 <= v20)
  {
    if (v9 < v20) {
      uint64_t v67 = (char *)v66 + 4 * v9;
    }
  }
  else
  {
    std::vector<float>::__append((uint64_t)&v66, v9 - v20);
  }
  v21 = v64;
  unint64_t v22 = 0xAAAAAAAAAAAAAAABLL * ((v64 - (unsigned char *)__p) >> 3);
  if (v9 <= v22)
  {
    if (v9 < v22)
    {
      uint64_t v23 = (char *)__p + 24 * v9;
      if (v64 != v23)
      {
        uint64_t v24 = v64;
        do
        {
          int v26 = (void *)*((void *)v24 - 3);
          v24 -= 24;
          v25 = v26;
          if (v26)
          {
            *((void *)v21 - 2) = v25;
            operator delete(v25);
          }
          v21 = v24;
        }
        while (v24 != v23);
      }
      uint64_t v64 = v23;
    }
    if (!v9)
    {
      unint64_t v29 = 0;
      goto LABEL_42;
    }
  }
  else
  {
    std::vector<std::vector<float>>::__append((uint64_t)&__p, v9 - v22);
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  do
  {
    double v30 = [v7 facePoseValues];
    double v31 = [v30 objectAtIndexedSubscript:v28];

    [v31 roll];
    *(float *)&double v32 = v32;
    *((_DWORD *)v69 + v28) = LODWORD(v32);
    [v31 pitch];
    *(float *)&double v33 = v33;
    *((_DWORD *)v72 + v28) = LODWORD(v33);
    [v31 yaw];
    *(float *)&double v34 = v34;
    *((_DWORD *)v66 + v28) = LODWORD(v34);
    [v31 smile];
    *(float *)&double v35 = v35;
    *((_DWORD *)v75 + v28) = LODWORD(v35);
    [v31 roll];
    if (fabs(v36) < 20.0)
    {
      [v31 pitch];
      if (fabs(v37) < 20.0)
      {
        [v31 yaw];
        if (fabs(v38) < 20.0) {
          ++v29;
        }
      }
    }
    v39 = [v31 landmarks];
    BOOL v40 = v39 == 0;

    if (v40)
    {
      v44 = (char *)__p + v27;
      int v45 = *(void **)((char *)__p + v27);
      if (v45)
      {
        v44[1] = v45;
        operator delete(v45);
        void *v44 = 0;
        v44[1] = 0;
        v44[2] = 0;
      }
      void *v44 = 0;
      v44[1] = 0;
      v44[2] = 0;
    }
    else
    {
      uint64_t v41 = [v31 landmarks];
      NSArrayAsVector(&v61, v41);
      v42 = (char *)__p + v27;
      v43 = *(void **)((char *)__p + v27);
      if (v43)
      {
        v42[1] = v43;
        operator delete(v43);
        void *v42 = 0;
        v42[1] = 0;
        v42[2] = 0;
      }
      *(_OWORD *)v42 = v61;
      v42[2] = v62;
      long long v61 = 0uLL;
      uint64_t v62 = 0;
    }
    ++v28;
    v27 += 24;
  }
  while (v9 != v28);
LABEL_42:
  ptr = (char *)self->_predictor.__ptr_;
  LODWORD(v61) = v15;
  uint64_t v47 = vision::mod::LivenessCheckPredictor::runFaceActionClassification(ptr, &v75, (uint64_t *)&v72, &v66, &v69, (uint64_t *)&__p, (int *)&v61);
  if (v47)
  {
    if (!a5)
    {
      BOOL v14 = 0;
      v53 = (char *)__p;
      if (__p) {
        goto LABEL_50;
      }
      goto LABEL_57;
    }
    int v48 = (void *)MEMORY[0x263F087E8];
    uint64_t v78 = *MEMORY[0x263F07F80];
    v49 = objc_msgSend(NSString, "stringWithFormat:", @"FAC classifier failed with status: %d", v47);
    v79 = v49;
    v50 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
    *a5 = [v48 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v50];

    BOOL v14 = 0;
  }
  else
  {
    BOOL v14 = objc_alloc_init(PADAlgorithmFACResult);
    if (vision::mod::LivenessCheckPredictor::getActionFinish((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_)) {
      int v51 = &unk_26D0AB690;
    }
    else {
      int v51 = &unk_26D0AB6A8;
    }
    [(PADAlgorithmFACResult *)v14 setAssessment:v51];
    [(PADAlgorithmFACResult *)v14 setIsHeadMovementDetected:v29 < v9 >> 1];
    v52 = [(PADAlgorithms *)self _retrieveFaceprintsFromPredictorUsingFACInput:v7];
    [(PADAlgorithmFACResult *)v14 setFaceprints:v52];

    v49 = [(PADAlgorithms *)self _retrieveReferenceFramesFromPredictor];
    [(PADAlgorithmFACResult *)v14 setReferenceFrameIndices:v49];
  }

  v53 = (char *)__p;
  if (__p)
  {
LABEL_50:
    long long v54 = v64;
    uint64_t v55 = v53;
    if (v64 != v53)
    {
      v56 = v64;
      do
      {
        uint64_t v58 = (void *)*((void *)v56 - 3);
        v56 -= 24;
        int v57 = v58;
        if (v58)
        {
          *((void *)v54 - 2) = v57;
          operator delete(v57);
        }
        long long v54 = v56;
      }
      while (v56 != v53);
      uint64_t v55 = __p;
    }
    uint64_t v64 = v53;
    operator delete(v55);
  }
LABEL_57:
  if (v66)
  {
    uint64_t v67 = (char *)v66;
    operator delete(v66);
  }
  if (v69)
  {
    uint64_t v70 = (char *)v69;
    operator delete(v69);
  }
  if (v72)
  {
    int v73 = (char *)v72;
    operator delete(v72);
  }
  if (v75)
  {
    v76 = v75;
    operator delete(v75);
  }
LABEL_65:

  return v14;
}

- (id)_retrieveFaceprintsFromPredictorUsingFACInput:(id)a3
{
  id v4 = a3;
  vision::mod::LivenessCheckPredictor::getIDmatchingFrameIndex(self->_predictor.__ptr_, &__p);
  v5 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  id v6 = v26;
  if (v26 != __p)
  {
    unint64_t v7 = 0;
    id v6 = (int *)__p;
    while (1)
    {
      unint64_t v8 = v6[v7];
      unint64_t v9 = [v4 facePoseValues];
      unint64_t v10 = [v9 count];

      if (v10 <= v8) {
        break;
      }
      int v11 = [v4 facePoseValues];
      v12 = [v11 objectAtIndexedSubscript:v8];
      unint64_t v13 = [v12 faceprint];

      if (v13)
      {
        id v23 = v13;
        unint64_t v24 = v8;
        BOOL v14 = objc_alloc_init(PADAlgorithmFACFaceprintResult);
        [(PADAlgorithmFACFaceprintResult *)v14 setFaceprint:v23];
        [(PADAlgorithmFACFaceprintResult *)v14 setIndex:v24];
        [v5 addObject:v14];
      }
      ++v7;
      id v6 = (int *)__p;
      if (v7 >= ((char *)v26 - (unsigned char *)__p) >> 2) {
        goto LABEL_10;
      }
    }
    int v15 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[PADAlgorithms _retrieveFaceprintsFromPredictorUsingFACInput:](v8, v15, v16, v17, v18, v19, v20, v21);
    }

    id v6 = (int *)__p;
  }
LABEL_10:
  if (v6)
  {
    int v26 = v6;
    operator delete(v6);
  }

  return v5;
}

PADAlgorithmFACFaceprintResult *__63__PADAlgorithms__retrieveFaceprintsFromPredictorUsingFACInput___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(PADAlgorithmFACFaceprintResult);
  [(PADAlgorithmFACFaceprintResult *)v2 setFaceprint:*(void *)(a1 + 32)];
  [(PADAlgorithmFACFaceprintResult *)v2 setIndex:*(void *)(a1 + 40)];
  return v2;
}

- (id)_retrieveReferenceFramesFromPredictor
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  vision::mod::LivenessCheckPredictor::getRaiseEyebrowsReferenceIndex(self->_predictor.__ptr_, &__p);
  v2 = (void *)[MEMORY[0x263EFFA68] mutableCopy];
  if (v9 != __p)
  {
    v3 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = (v9 - (unsigned char *)__p) >> 2;
      _os_log_impl(&dword_21F07C000, v3, OS_LOG_TYPE_INFO, "FAC used %lu frames as reference frames for the current gesture.", buf, 0xCu);
    }

    id v4 = (int *)__p;
    if (v9 != __p)
    {
      unint64_t v5 = 0;
      do
      {
        id v6 = [NSNumber numberWithUnsignedInteger:v4[v5]];
        [v2 addObject:v6];

        ++v5;
        id v4 = (int *)__p;
      }
      while (v5 < (v9 - (unsigned char *)__p) >> 2);
    }
  }
  if (__p)
  {
    unint64_t v9 = __p;
    operator delete(__p);
  }
  return v2;
}

- (void)performTA:(__CVBuffer *)a3 nccSignal:(double *)a4 stitchDetected:(BOOL *)a5 isSensitive:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  v28[1] = *MEMORY[0x263EF8340];
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a3);
  CVReturn v14 = CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (PlaneCount)
  {
    if (v14
      || (src.data = CVPixelBufferGetBaseAddressOfPlane(a3, 0),
          src.height = CVPixelBufferGetHeightOfPlane(a3, 0),
          src.width = CVPixelBufferGetWidthOfPlane(a3, 0),
          src.rowBytes = CVPixelBufferGetBytesPerRowOfPlane(a3, 0),
          CVPixelBufferUnlockBaseAddress(a3, 1uLL)))
    {
      if (a7)
      {
        int v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v27 = *MEMORY[0x263F07F80];
        uint64_t v16 = [NSString stringWithFormat:@"TA could not convert image to required type."];
        v28[0] = v16;
        uint64_t v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
        *a7 = [v15 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v17];
      }
      return;
    }
  }
  else
  {
    src.data = CVPixelBufferGetBaseAddress(a3);
    src.height = CVPixelBufferGetHeight(a3);
    src.width = CVPixelBufferGetWidth(a3);
    src.rowBytes = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  BOOL v23 = 0;
  float v22 = 0.0;
  uint64_t v18 = vision::mod::LivenessCheckPredictor::runStitchDetector((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_, &src, &v23, &v22, v8);
  if (v18)
  {
    if (a7)
    {
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v25 = *MEMORY[0x263F07F80];
      uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"TA model failed with status: %d", v18);
      int v26 = v20;
      uint64_t v21 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      *a7 = [v19 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v21];
    }
  }
  else
  {
    *a4 = v22;
    *a5 = v23;
  }
}

- (int64_t)performSC:(id)a3 assessmentTA:(id)a4 assessmentFakePRD:(id)a5 assessmentLivePRD:(id)a6 assessmentID:(id)a7 error:(id *)a8
{
  v37[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  ptr = self->_predictor.__ptr_;
  [v14 floatValue];
  float v35 = v20;
  [v15 floatValue];
  float v34 = v21;
  [v16 floatValue];
  float v33 = v22;
  [v17 floatValue];
  float v32 = v23;
  [v18 floatValue];
  float v31 = v24;
  uint64_t v25 = vision::mod::LivenessCheckPredictor::runSpoofingClassification((vision::mod::LivenessCheckPredictor *)ptr, &v35, &v34, &v33, &v32, &v31);
  if (v25)
  {
    if (a8)
    {
      int v26 = (void *)MEMORY[0x263F087E8];
      uint64_t v36 = *MEMORY[0x263F07F80];
      uint64_t v27 = objc_msgSend(NSString, "stringWithFormat:", @"SC model failed with status: %d", v25);
      v37[0] = v27;
      uint64_t v28 = [NSDictionary dictionaryWithObjects:v37 forKeys:&v36 count:1];
      *a8 = [v26 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v28];

      a8 = 0;
    }
  }
  else
  {
    int SpoofType = vision::mod::LivenessCheckPredictor::getSpoofType((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_);
    if (SpoofType == 2) {
      a8 = (id *)2;
    }
    else {
      a8 = (id *)(SpoofType == 1);
    }
  }

  return (int64_t)a8;
}

uint64_t __95__PADAlgorithms_performSC_assessmentTA_assessmentFakePRD_assessmentLivePRD_assessmentID_error___block_invoke(uint64_t a1)
{
  int SpoofType = vision::mod::LivenessCheckPredictor::getSpoofType(*(vision::mod::LivenessCheckPredictor **)(*(void *)(a1 + 32) + 24));
  if (SpoofType == 2) {
    return 2;
  }
  else {
    return SpoofType == 1;
  }
}

- (double)performIDMatching:(id)a3 toFaceprints:(id)a4 error:(id *)a5
{
  v64[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (![v9 count])
  {
    if (a5)
    {
      uint64_t v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v63 = *MEMORY[0x263F07F80];
      v64[0] = @"Faceprints must contain at least 1 value.";
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v64 forKeys:&v63 count:1];
      *a5 = [v11 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v12];
    }
    unint64_t v13 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[PADAlgorithms performIDMatching:toFaceprints:error:](v13);
    }

    goto LABEL_15;
  }
  if (![v8 count])
  {
    if (a5)
    {
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v61 = *MEMORY[0x263F07F80];
      uint64_t v62 = @"Baseline faceprint must contain at least 1 dimension.";
      id v15 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
      *a5 = [v14 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v15];
    }
    id v16 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PADAlgorithms performIDMatching:toFaceprints:error:](v16);
    }

LABEL_15:
    double IDmatchingScore = 0.0;
    goto LABEL_47;
  }
  long long v54 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  unint64_t v10 = [v9 count];
  if (v10) {
    std::vector<std::vector<float>>::__append((uint64_t)&v54, v10);
  }
  uint64_t v18 = 0;
  for (unint64_t i = 0; i < [v9 count]; ++i)
  {
    float v20 = [v9 objectAtIndexedSubscript:i];
    uint64_t v21 = [v20 count];
    LOBYTE(v21) = v21 == [v8 count];

    if ((v21 & 1) == 0)
    {
      if (a5)
      {
        uint64_t v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v59 = *MEMORY[0x263F07F80];
        uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Dimension mismatch on faceprint %d.", i);
        int v60 = v28;
        unint64_t v29 = [NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
        *a5 = [v27 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v29];
      }
      double v30 = os_log_create("com.apple.CoreIDV", "RGBLiveness");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[PADAlgorithms performIDMatching:toFaceprints:error:](i, v30, v31, v32, v33, v34, v35, v36);
      }

      double IDmatchingScore = 0.0;
      goto LABEL_39;
    }
    float v22 = [v9 objectAtIndexedSubscript:i];
    NSArrayAsVector(__p, v22);
    float v23 = (char *)v54 + v18;
    float v24 = *(void **)((char *)v54 + v18);
    if (v24)
    {
      v23[1] = v24;
      operator delete(v24);
      *float v23 = 0;
      v23[1] = 0;
      v23[2] = 0;
    }
    *(_OWORD *)float v23 = *(_OWORD *)__p;
    v23[2] = v53;
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v53 = 0;

    v18 += 24;
  }
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v53 = 0;
  unint64_t v25 = [v8 count];
  unint64_t v26 = ((char *)__p[1] - (char *)__p[0]) >> 2;
  if (v25 <= v26)
  {
    if (v25 < v26) {
      __p[1] = (char *)__p[0] + 4 * v25;
    }
  }
  else
  {
    std::vector<float>::__append((uint64_t)__p, v25 - v26);
  }
  for (unint64_t j = 0; j < [v8 count]; ++j)
  {
    double v38 = [v8 objectAtIndexedSubscript:j];
    [v38 floatValue];
    *((_DWORD *)__p[0] + j) = v39;
  }
  uint64_t v40 = vision::mod::LivenessCheckPredictor::runIDMatching((uint64_t)self->_predictor.__ptr_, (uint64_t *)&v54, (uint64_t *)__p);
  if (!v40)
  {
    double IDmatchingScore = vision::mod::LivenessCheckPredictor::getIDmatchingScore((vision::mod::LivenessCheckPredictor *)self->_predictor.__ptr_);
    v44 = __p[0];
    if (!__p[0]) {
      goto LABEL_39;
    }
LABEL_38:
    __p[1] = v44;
    operator delete(v44);
    goto LABEL_39;
  }
  double IDmatchingScore = 0.0;
  if (a5)
  {
    uint64_t v41 = (void *)MEMORY[0x263F087E8];
    uint64_t v57 = *MEMORY[0x263F07F80];
    v42 = objc_msgSend(NSString, "stringWithFormat:", @"ID model failed with status: %d", v40);
    uint64_t v58 = v42;
    v43 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    *a5 = [v41 errorWithDomain:@"com.apple.coreidv.CoreIDVPAD.PADErrorDomain" code:3 userInfo:v43];
  }
  v44 = __p[0];
  if (__p[0]) {
    goto LABEL_38;
  }
LABEL_39:
  int v45 = (char *)v54;
  if (v54)
  {
    v46 = v55;
    uint64_t v47 = v54;
    if (v55 != v54)
    {
      int v48 = v55;
      do
      {
        v50 = (void *)*((void *)v48 - 3);
        v48 -= 24;
        v49 = v50;
        if (v50)
        {
          *((void *)v46 - 2) = v49;
          operator delete(v49);
        }
        v46 = v48;
      }
      while (v48 != v45);
      uint64_t v47 = v54;
    }
    uint64_t v55 = v45;
    operator delete(v47);
  }
LABEL_47:

  return IDmatchingScore;
}

- (double)getPRDFakeFrameThreshold
{
  return *((float *)self->_config.__ptr_ + 18);
}

- (double)getPRDLiveFrameThreshold
{
  return *((float *)self->_config.__ptr_ + 20);
}

- (void).cxx_destruct
{
  cntrl = self->_predictor.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    id v4 = self->_config.__cntrl_;
    if (!v4) {
      return;
    }
  }
  else
  {
    id v4 = self->_config.__cntrl_;
    if (!v4) {
      return;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v4 + 16))(v4, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void)initWithPADModelConfiguration:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21F07C000, log, OS_LOG_TYPE_DEBUG, "Could not create predictor object.", v1, 2u);
}

- (void)_retrieveFaceprintsFromPredictorUsingFACInput:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)performIDMatching:(os_log_t)log toFaceprints:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F07C000, log, OS_LOG_TYPE_ERROR, "Faceprints must contain at least 1 value.", v1, 2u);
}

- (void)performIDMatching:(os_log_t)log toFaceprints:error:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F07C000, log, OS_LOG_TYPE_ERROR, "Baseline faceprint must contain at least 1 dimension.", v1, 2u);
}

- (void)performIDMatching:(uint64_t)a3 toFaceprints:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end