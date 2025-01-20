@interface VCPFullVideoAnalyzer
+ (BOOL)enableMoflow;
+ (BOOL)useSceneprintInSceneAnalysis;
- (NSArray)globalMotion;
- (NSDictionary)objectsMotion;
- (VCPFullVideoAnalyzer)initWithTransform:(CGAffineTransform *)a3;
- (VCPFullVideoAnalyzer)initWithVideoOrientation:(int)a3 preferredTransform:(CGAffineTransform *)a4 metaOrientation:(id)a5 privateResults:(id)a6 embeddings:(id)a7 isTimelapse:(BOOL)a8 isIris:(BOOL)a9 irisPhotoOffsetSec:(float)a10 irisPhotoExposureSec:(float)a11 slowMoRate:(float)a12 faceDominated:(BOOL)a13;
- (float)actionScore;
- (float)computeExposureScoreOfFrame:(void *)a3;
- (float)estimateExpressionScore:(id)a3 encodeStats:(EncodeStats *)a4 frameWidth:(int)a5 frameHeight:(int)a6;
- (float)estimateQualityScore:(void *)a3;
- (float)getSceneSwichFrequency;
- (float)interestingnessScore;
- (float)obstructionScore;
- (float)qualityScore;
- (float)trackingScore;
- (id).cxx_construct;
- (id)clipResults:(id *)a3;
- (id)privateResults;
- (id)processSceneResults;
- (id)results;
- (int)addResult:(__CFArray *)a3 to:(id)a4 forKey:(id)a5 optional:(BOOL)a6;
- (int)addSceneAnalysisResult:(id)a3 to:(id)a4 clipRange:(id *)a5;
- (int)addSceneAnalysisResult:(id)a3 to:(id)a4 optional:(BOOL)a5;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7 cancel:(id)a8;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 properties:(id)a6 frameStats:(id)a7 flags:(unint64_t *)a8 cancel:(id)a9;
- (int)finishAnalysisPass:(id *)a3;
- (int)isStableMetaMotion:(id *)a3;
- (int)process:(int)a3;
- (int)seedAnalyzersWithPixelBuffer:(__CVBuffer *)a3 startTime:(id *)a4 frameStats:(id)a5;
- (void)dealloc;
- (void)prepareLivePhotoAnalysisByScenes:(id)a3;
- (void)prepareVideoAnalysisByScenes:(id)a3;
- (void)processAndEstimateQualityScore:(void *)a3;
- (void)reviseFrameTrackScore:(void *)a3 saliencyRegions:(id)a4;
- (void)setActionScore:(float)a3;
- (void)setInterestingnessScore:(float)a3;
- (void)setNextCaptureFrame:(__CVBuffer *)a3;
- (void)setObstructionScore:(float)a3;
- (void)setQualityScore:(float)a3;
- (void)setTrackingScore:(float)a3;
@end

@implementation VCPFullVideoAnalyzer

+ (BOOL)useSceneprintInSceneAnalysis
{
  return 0;
}

+ (BOOL)enableMoflow
{
  return 0;
}

- (VCPFullVideoAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  v39.receiver = self;
  v39.super_class = (Class)VCPFullVideoAnalyzer;
  v4 = [(VCPFullVideoAnalyzer *)&v39 init];
  v5 = v4;
  if (!v4)
  {
    v34 = 0;
    goto LABEL_30;
  }
  LOBYTE(v4->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = 0;
  BYTE1(v4->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = 0;
  BYTE2(v4->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = 0;
  LODWORD(v4->_frameBuffer.buffer_[34].motion_result_.action_score_) = 3;
  BOOL v6 = +[VCPFullVideoAnalyzer enableMoflow];
  BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.gmv_[1]) = v6;
  v7 = (ma::EncodeAnalysis *)operator new(0x3C0uLL, MEMORY[0x1E4FBA2D0]);
  v8 = v7;
  if (v7) {
    ma::EncodeAnalysis::EncodeAnalysis(v7, (const ma::FrameBuffer *)&v5->_frameBuffer, 0, 0, v6);
  }
  v5->_encodeAnalysis = v8;
  v9 = (ma::PreEncodeAnalysis *)operator new(0xC0uLL, MEMORY[0x1E4FBA2D0]);
  v10 = v9;
  if (v9) {
    ma::PreEncodeAnalysis::PreEncodeAnalysis(v9);
  }
  v5->_preencodeAnalysis = v10;
  v11 = (char *)operator new(0x38uLL, MEMORY[0x1E4FBA2D0]);
  if (v11)
  {
    *(void *)v11 = 0;
    *((void *)v11 + 1) = 0;
    *((void *)v11 + 2) = 0;
    uint64_t v12 = MEMORY[0x1E4F1FA48];
    *(_OWORD *)(v11 + 24) = *MEMORY[0x1E4F1FA48];
    *((void *)v11 + 5) = *(void *)(v12 + 16);
    v11[48] = 1;
    *((_DWORD *)v11 + 13) = 0;
  }
  v5->_obstructionAnalysis = v11;
  v13 = (ma::SceneAnalysis *)operator new(0x518uLL, MEMORY[0x1E4FBA2D0]);
  if (v13)
  {
    int action_score_low = LODWORD(v5->_frameBuffer.buffer_[34].motion_result_.action_score_);
    long long v15 = *(_OWORD *)&a3->c;
    v38[0] = *(_OWORD *)&a3->a;
    v38[1] = v15;
    v38[2] = *(_OWORD *)&a3->tx;
    int v16 = angleForTransform(v38);
    ma::SceneAnalysis::SceneAnalysis(v13, action_score_low, v16, BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, LOBYTE(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, BYTE2(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, (const ma::FrameBuffer *)&v5->_frameBuffer, +[VCPFullVideoAnalyzer useSceneprintInSceneAnalysis]);
  }
  v5->_sceneAnalysis = v13;
  v17 = (MotionFilter *)operator new(0x10uLL, MEMORY[0x1E4FBA2D0]);
  v18 = v17;
  if (v17) {
    ma::MotionFilter::MotionFilter((uint64_t)v17, &v5->_frameBuffer, BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.fine_action_score_), 0);
  }
  v5->_motionFilter = v18;
  v19 = (ma::MetaDataAnalysis *)operator new(0x28uLL, MEMORY[0x1E4FBA2D0]);
  v20 = v19;
  if (v19) {
    ma::MetaDataAnalysis::MetaDataAnalysis(v19, &v5->_frameBuffer);
  }
  v5->_metadataAnalysis = (MetaDataAnalysis *)v20;
  v21 = [VCPFrameScoreFilter alloc];
  LODWORD(v22) = 1120403456;
  LODWORD(v23) = 1050253722;
  uint64_t v24 = [(VCPFrameScoreFilter *)v21 initWithFilterTabs:5 distanceVariance:v22 diffVariance:v23];
  v25 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.valid_mb_;
  *(void *)&v5->_frameBuffer.buffer_[34].motion_result_.valid_mb_ = v24;

  v26 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.residual_var_;
  *(void *)&v5->_frameBuffer.buffer_[34].motion_result_.residual_var_ = 0;

  v27 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.action_blocks_;
  *(void *)&v5->_frameBuffer.buffer_[34].motion_result_.action_blocks_ = 0;

  if (LOBYTE(v5->_frameBuffer.buffer_[34].motion_result_.gmv_[1])
    || (v28 = objc_alloc_init(VCPMotionFlowSubtleMotionAnalyzer),
        v29 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1],
        *(void *)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1] = v28,
        v29,
        (preencodeAnalysis = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1]) != 0))
  {
    if (!BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.gmv_[1])
      || (v31 = objc_alloc_init(VCPMotionFlowAnalyzer),
          v32 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3],
          *(void *)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3] = v31,
          v32,
          (preencodeAnalysis = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3]) != 0))
    {
      v5->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5] = 0.0;
      preencodeAnalysis = v5->_preencodeAnalysis;
      if (preencodeAnalysis)
      {
        preencodeAnalysis = v5->_encodeAnalysis;
        if (preencodeAnalysis)
        {
          preencodeAnalysis = v5->_obstructionAnalysis;
          if (preencodeAnalysis)
          {
            sceneAnalysis = (ma::SceneAnalysis *)v5->_sceneAnalysis;
            if (!sceneAnalysis) {
              goto LABEL_27;
            }
            preencodeAnalysis = v5->_motionFilter;
            if (!preencodeAnalysis) {
              goto LABEL_28;
            }
            preencodeAnalysis = v5->_metadataAnalysis;
            if (!preencodeAnalysis) {
              goto LABEL_28;
            }
            preencodeAnalysis = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.valid_mb_;
            if (!preencodeAnalysis) {
              goto LABEL_28;
            }
            if (ma::SceneAnalysis::Initialize(sceneAnalysis, 0, 0, 1.0)
              || MotionAnalysis<ma::ObstructionSegment>::Initialize((uint64_t)v5->_obstructionAnalysis))
            {
LABEL_27:
              preencodeAnalysis = 0;
            }
            else
            {
              BYTE1(v5->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
              LOBYTE(v5->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
              BYTE2(v5->_frameBuffer.buffer_[34].motion_result_.track_score_) = 1;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0] = -1.0;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1] = -1.0;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2] = -1.0;
              v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3] = -1.0;
              v36 = *(void **)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5];
              *(void *)&v5->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5] = 0;

              value = (void *)v5->_frameBuffer.buffer_[34].motion_result_.duration_.value;
              v5->_frameBuffer.buffer_[34].motion_result_.duration_.value = 0;

              preencodeAnalysis = v5;
            }
          }
        }
      }
    }
  }
LABEL_28:
  v34 = preencodeAnalysis;
LABEL_30:

  return v34;
}

- (VCPFullVideoAnalyzer)initWithVideoOrientation:(int)a3 preferredTransform:(CGAffineTransform *)a4 metaOrientation:(id)a5 privateResults:(id)a6 embeddings:(id)a7 isTimelapse:(BOOL)a8 isIris:(BOOL)a9 irisPhotoOffsetSec:(float)a10 irisPhotoExposureSec:(float)a11 slowMoRate:(float)a12 faceDominated:(BOOL)a13
{
  CFArrayRef v22 = (const __CFArray *)a5;
  CFDictionaryRef v23 = (const __CFDictionary *)a6;
  id v24 = a7;
  v54.receiver = self;
  v54.super_class = (Class)VCPFullVideoAnalyzer;
  v25 = [(VCPFullVideoAnalyzer *)&v54 init];
  v26 = v25;
  if (v25)
  {
    LOBYTE(v25->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = a8;
    BYTE1(v25->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = a9;
    BYTE2(v25->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) = a12 < 1.0;
    LODWORD(v25->_frameBuffer.buffer_[34].motion_result_.action_score_) = a3;
    BOOL v27 = +[VCPFullVideoAnalyzer enableMoflow];
    BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]) = v27;
    v28 = (ma::EncodeAnalysis *)operator new(0x3C0uLL, MEMORY[0x1E4FBA2D0]);
    v29 = v28;
    if (v28) {
      ma::EncodeAnalysis::EncodeAnalysis(v28, (const ma::FrameBuffer *)&v26->_frameBuffer, 0, 0, v27);
    }
    v26->_encodeAnalysis = v29;
    v30 = (ma::PreEncodeAnalysis *)operator new(0xC0uLL, MEMORY[0x1E4FBA2D0]);
    v31 = v30;
    if (v30) {
      ma::PreEncodeAnalysis::PreEncodeAnalysis(v30);
    }
    v26->_preencodeAnalysis = v31;
    v32 = (char *)operator new(0x38uLL, MEMORY[0x1E4FBA2D0]);
    if (v32)
    {
      *(void *)v32 = 0;
      *((void *)v32 + 1) = 0;
      *((void *)v32 + 2) = 0;
      uint64_t v33 = MEMORY[0x1E4F1FA48];
      *(_OWORD *)(v32 + 24) = *MEMORY[0x1E4F1FA48];
      *((void *)v32 + 5) = *(void *)(v33 + 16);
      v32[48] = 1;
      *((_DWORD *)v32 + 13) = 0;
    }
    v26->_obstructionAnalysis = v32;
    v34 = (ma::SceneAnalysis *)operator new(0x518uLL, MEMORY[0x1E4FBA2D0]);
    if (v34)
    {
      int action_score_low = LODWORD(v26->_frameBuffer.buffer_[34].motion_result_.action_score_);
      long long v36 = *(_OWORD *)&a4->c;
      v53[0] = *(_OWORD *)&a4->a;
      v53[1] = v36;
      v53[2] = *(_OWORD *)&a4->tx;
      int v37 = angleForTransform(v53);
      ma::SceneAnalysis::SceneAnalysis(v34, action_score_low, v37, BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, BYTE2(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_) != 0, (const ma::FrameBuffer *)&v26->_frameBuffer, +[VCPFullVideoAnalyzer useSceneprintInSceneAnalysis]);
    }
    v26->_sceneAnalysis = v34;
    v38 = (MotionFilter *)operator new(0x10uLL, MEMORY[0x1E4FBA2D0]);
    objc_super v39 = v38;
    if (v38) {
      ma::MotionFilter::MotionFilter((uint64_t)v38, &v26->_frameBuffer, BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_), 1);
    }
    v26->_motionFilter = v39;
    v40 = (ma::MetaDataAnalysis *)operator new(0x28uLL, MEMORY[0x1E4FBA2D0]);
    v41 = v40;
    if (v40) {
      ma::MetaDataAnalysis::MetaDataAnalysis(v40, &v26->_frameBuffer);
    }
    v26->_metadataAnalysis = (MetaDataAnalysis *)v41;
    objc_storeStrong((id *)&v26->_frameBuffer.buffer_[34].motion_result_.residual_var_, a6);
    LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]) = a13;
    objc_storeStrong((id *)&v26->_frameBuffer.buffer_[34].motion_result_.action_blocks_, a7);
    if (!LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
    {
      v42 = objc_alloc_init(VCPMotionFlowSubtleMotionAnalyzer);
      v43 = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1];
      *(void *)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1] = v42;

      preencodeAnalysis = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1];
      if (!preencodeAnalysis) {
        goto LABEL_28;
      }
    }
    if (BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
    {
      v45 = objc_alloc_init(VCPMotionFlowAnalyzer);
      v46 = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3];
      *(void *)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3] = v45;

      preencodeAnalysis = *(void **)&v26->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3];
      if (!preencodeAnalysis) {
        goto LABEL_28;
      }
    }
    preencodeAnalysis = v26->_preencodeAnalysis;
    if (!preencodeAnalysis) {
      goto LABEL_28;
    }
    preencodeAnalysis = v26->_encodeAnalysis;
    if (!preencodeAnalysis) {
      goto LABEL_28;
    }
    preencodeAnalysis = v26->_obstructionAnalysis;
    if (!preencodeAnalysis) {
      goto LABEL_28;
    }
    sceneAnalysis = (ma::SceneAnalysis *)v26->_sceneAnalysis;
    if (sceneAnalysis)
    {
      preencodeAnalysis = v26->_motionFilter;
      if (!preencodeAnalysis) {
        goto LABEL_28;
      }
      preencodeAnalysis = v26->_metadataAnalysis;
      if (!preencodeAnalysis) {
        goto LABEL_28;
      }
      if (!ma::SceneAnalysis::Initialize(sceneAnalysis, v22, v23, a12))
      {
        int v50 = MotionAnalysis<ma::ObstructionSegment>::Initialize((uint64_t)v26->_obstructionAnalysis);
        if (!v50)
        {
          if (!BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.fine_action_score_)) {
            goto LABEL_35;
          }
          v51 = (ma::IrisAnalysis *)operator new(0x20uLL, MEMORY[0x1E4FBA2D0]);
          if (!v51)
          {
            preencodeAnalysis = 0;
            v26->_irisAnalysis = 0;
            goto LABEL_28;
          }
          v52 = v51;
          ma::IrisAnalysis::IrisAnalysis((uint64_t)v51);
          v26->_irisAnalysis = (IrisAnalysis *)v52;
          int v50 = ma::IrisAnalysis::Initialize(v52, a10, a11);
          if (!v50)
          {
LABEL_35:
            int v50 = 0;
            BYTE1(v26->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
            LOBYTE(v26->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
            BYTE2(v26->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
          }
        }
        if (v50) {
          preencodeAnalysis = 0;
        }
        else {
          preencodeAnalysis = v26;
        }
        goto LABEL_28;
      }
      preencodeAnalysis = 0;
    }
    else
    {
      preencodeAnalysis = 0;
    }
LABEL_28:
    v48 = preencodeAnalysis;
    goto LABEL_29;
  }
  v48 = 0;
LABEL_29:

  return v48;
}

- (void)dealloc
{
  encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
  if (encodeAnalysis)
  {
    ma::EncodeAnalysis::~EncodeAnalysis(encodeAnalysis);
    MEMORY[0x1C186C7D0]();
  }
  preencodeAnalysis = (ma::PreEncodeAnalysis *)self->_preencodeAnalysis;
  if (preencodeAnalysis)
  {
    ma::PreEncodeAnalysis::~PreEncodeAnalysis(preencodeAnalysis);
    MEMORY[0x1C186C7D0]();
  }
  obstructionAnalysis = self->_obstructionAnalysis;
  if (obstructionAnalysis)
  {
    BOOL v6 = MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)obstructionAnalysis);
    MEMORY[0x1C186C7D0](v6, 0x1020C40E918D4D9);
  }
  sceneAnalysis = (char *)self->_sceneAnalysis;
  if (sceneAnalysis)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)(sceneAnalysis + 1272));
    MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)(sceneAnalysis + 1200));
    ma::QualityAnalysis::~QualityAnalysis((ma::QualityAnalysis *)(sceneAnalysis + 984));
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)(sceneAnalysis + 952));
    MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)(sceneAnalysis + 896));
    ma::MovingObjectAnalysis::~MovingObjectAnalysis((ma::MovingObjectAnalysis *)(sceneAnalysis + 832));
    ma::DescriptorAnalysis::~DescriptorAnalysis((ma::DescriptorAnalysis *)(sceneAnalysis + 760));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 672));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 584));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 496));
    ma::SubtleMotionAnalysis::~SubtleMotionAnalysis((ma::SubtleMotionAnalysis *)(sceneAnalysis + 408));
    ma::CameraMotionAnalysis::~CameraMotionAnalysis((ma::CameraMotionAnalysis *)(sceneAnalysis + 80));
    v8 = MotionAnalysis<ma::ObstructionSegment>::~MotionAnalysis((uint64_t)sceneAnalysis);
    MEMORY[0x1C186C7D0](v8, 0x1060C40189E915CLL);
  }
  motionFilter = self->_motionFilter;
  if (motionFilter)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)motionFilter);
    MEMORY[0x1C186C7D0]();
  }
  metadataAnalysis = self->_metadataAnalysis;
  if (metadataAnalysis)
  {
    ma::MotionFilter::~MotionFilter((ma::MotionFilter *)metadataAnalysis);
    MEMORY[0x1C186C7D0]();
  }
  irisAnalysis = self->_irisAnalysis;
  if (irisAnalysis)
  {
    ma::IrisAnalysis::~IrisAnalysis((ma::IrisAnalysis *)irisAnalysis);
    MEMORY[0x1C186C7D0]();
  }
  v12.receiver = self;
  v12.super_class = (Class)VCPFullVideoAnalyzer;
  [(VCPFullVideoAnalyzer *)&v12 dealloc];
}

- (int)seedAnalyzersWithPixelBuffer:(__CVBuffer *)a3 startTime:(id *)a4 frameStats:(id)a5
{
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (self->_frameBuffer.frame_count_ || !LODWORD(self->_frameBuffer.buffer_[34].motion_result_.action_score_)) {
    return -50;
  }
  int v11 = Height;
  ma::PreEncodeAnalysis::Initialize((uint64_t)self->_preencodeAnalysis, Width, Height);
  sceneAnalysis = (ma::SceneAnalysis *)self->_sceneAnalysis;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  ma::SceneAnalysis::SetStartTime(sceneAnalysis, (CMTime *)&v13);
  if (ma::Histogram::InitializeAsIdealExposureHistogram((ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_, v11 * Width))return -18; {
  else
  }
    return 0;
}

- (void)prepareVideoAnalysisByScenes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    BYTE1(self->_frameBuffer.buffer_[34].motion_result_.track_score_) = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(&unk_1F15EDEA8, "containsObject:", v10, (void)v14))
          {
            int v11 = [v6 objectForKeyedSubscript:v10];
            [v11 floatValue];
            BOOL v13 = v12 > 0.1;

            if (v13)
            {
              BYTE1(self->_frameBuffer.buffer_[34].motion_result_.track_score_) = 1;
              goto LABEL_13;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (void)prepareLivePhotoAnalysisByScenes:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5] = 0.0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (objc_msgSend(&unk_1F15EDEC0, "containsObject:", v10, (void)v23))
          {
            int v11 = [v6 objectForKeyedSubscript:v10];
            [v11 floatValue];
            BOOL v13 = v12 > 0.1;

            if (v13)
            {
              LODWORD(self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5]) = 1;
              goto LABEL_13;
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    long long v14 = [v6 objectForKey:@"flag"];
    if (v14)
    {
      long long v15 = [v6 objectForKeyedSubscript:@"flag"];
      [v15 floatValue];
      BOOL v17 = v16 > 0.1;

      if (v17)
      {
        int v18 = 2;
LABEL_19:
        LODWORD(self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5]) = v18;
        goto LABEL_20;
      }
    }
    uint64_t v19 = objc_msgSend(v6, "objectForKey:", @"candle", (void)v23);
    if (v19)
    {
      v20 = [v6 objectForKeyedSubscript:@"candle"];
      [v20 floatValue];
      BOOL v22 = v21 > 0.1;

      if (v22)
      {
        int v18 = 3;
        goto LABEL_19;
      }
    }
  }
LABEL_20:
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7 cancel:(id)a8
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  return [(VCPFullVideoAnalyzer *)self analyzeFrame:a3 timestamp:&v10 duration:&v9 properties:0 frameStats:a6 flags:a7 cancel:a8];
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 properties:(id)a6 frameStats:(id)a7 flags:(unint64_t *)a8 cancel:(id)a9
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v94 = a6;
  id v95 = a7;
  id v93 = a9;
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  long long v15 = [v95 videoActivityDescriptor];

  if (v15) {
    goto LABEL_7;
  }
  float v16 = [VCPVideoActivityDescriptor alloc];
  int v17 = Width + 15;
  if ((int)Width < -15) {
    int v17 = Width + 30;
  }
  uint64_t v18 = (v17 >> 4);
  int v19 = Height + 15;
  if ((int)Height < -15) {
    int v19 = Height + 30;
  }
  v20 = [(VCPVideoActivityDescriptor *)v16 initWithFrameWidthInMb:v18 heightInMb:(v19 >> 4)];
  [v95 setVideoActivityDescriptor:v20];

  float v21 = [v95 videoActivityDescriptor];

  if (v21)
  {
LABEL_7:
    size_t v89 = Height;
    if (self->_frameBuffer.frame_count_
      || (long long v119 = *(_OWORD *)&a4->var0,
          int64_t v120 = a4->var3,
          (int Descriptor = [(VCPFullVideoAnalyzer *)self seedAnalyzersWithPixelBuffer:a3 startTime:&v119 frameStats:v95]) == 0))
    {
      p_frameBuffer = (ma::FrameBuffer *)&self->_frameBuffer;
      Next = ma::FrameBuffer::GetNext((ma::FrameBuffer *)&self->_frameBuffer);
      v92 = [v94 objectForKeyedSubscript:@"objects"];
      if (v92)
      {
        v88 = Next;
        v86 = self;
        long long v117 = 0u;
        long long v118 = 0u;
        long long v115 = 0u;
        long long v116 = 0u;
        id v23 = v92;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v115 objects:v123 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v116;
          long long v26 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
          while (2)
          {
            for (uint64_t i = 0; i != v24; ++i)
            {
              if (*(void *)v116 != v25) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v115 + 1) + 8 * i);
              v114 = 0;
              v29 = (ma::Object *)operator new(0x60uLL, v26);
              if (!v29)
              {
                v114 = 0;
                if ((int)MediaAnalysisLogLevel() >= 3)
                {
                  v49 = VCPLogInstance();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_ERROR, "Failed to allocate memory", buf, 2u);
                  }
                }
                int Descriptor = -108;
                goto LABEL_39;
              }
              v114 = v29;
              objc_msgSend(v23, "objectForKeyedSubscript:", v28, ma::Object::Object(v29).n128_f64[0]);
              v30 = (NSString *)objc_claimAutoreleasedReturnValue();
              NSRect v125 = NSRectFromString(v30);
              CGFloat x = v125.origin.x;
              CGFloat y = v125.origin.y;
              CGFloat v33 = v125.size.width;
              CGFloat v34 = v125.size.height;

              v35 = v114;
              *((CGFloat *)v114 + 1) = x;
              *((CGFloat *)v35 + 2) = y;
              *((CGFloat *)v35 + 3) = v33;
              *((CGFloat *)v35 + 4) = v34;
              *(_DWORD *)v35 = [v28 intValue];
              int Descriptor = Vector<ma::Object *>::PushBack((CFMutableArrayRef *)v88 + 41);
              if (Descriptor)
              {
                if (v114) {
                  MEMORY[0x1C186C7D0](v114, 0x1000C40E841BE39);
                }
                goto LABEL_39;
              }
            }
            uint64_t v24 = [v23 countByEnumeratingWithState:&v115 objects:v123 count:16];
            if (v24) {
              continue;
            }
            break;
          }
        }

        self = v86;
        Next = v88;
      }
      CMTime v112 = (CMTime)*a4;
      CMTime v111 = (CMTime)*a5;
      ma::Frame::Initialize((ma::Frame *)Next, &v112, &v111, a3, 1);
      int Descriptor = v37;
      if (v37) {
        goto LABEL_40;
      }
      if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
      {
        v38 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3];
        long long v109 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        long long v107 = *(_OWORD *)&a5->var0;
        int64_t v108 = a5->var3;
        [v38 analyzePixelBuffer:a3 withFrame:Next withTimestamp:&v109 andDuration:&v107 cancel:v93];
      }
      unsigned int v39 = *(_DWORD *)a8;
      encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
      CMTime v106 = (CMTime)*a4;
      int Descriptor = ma::EncodeAnalysis::ProcessFrame(encodeAnalysis, &v106, a3, (ma::Frame *)Next, BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_), (v39 >> 5) & 1 | BYTE1(self->_frameBuffer.buffer_[34].motion_result_.track_score_));
      if (Descriptor) {
        goto LABEL_40;
      }
      if (!LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.gmv_[1]))
      {
        v41 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1];
        long long v104 = *(_OWORD *)&a4->var0;
        int64_t v105 = a4->var3;
        long long v102 = *(_OWORD *)&a5->var0;
        int64_t v103 = a5->var3;
        [v41 analyzePixelBuffer:a3 withFrame:Next withTimestamp:&v104 andDuration:&v102 hasSubtleScene:LODWORD(self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[5]) cancel:v93];
      }
      if (ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis))
      {
        v42 = [v95 detectedFaces];
        BOOL v43 = [v42 count] == 0;

        if (!v43)
        {
          v44 = [v95 detectedFaces];
          [(VCPFullVideoAnalyzer *)self estimateExpressionScore:v44 encodeStats:ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis) frameWidth:Width frameHeight:v89];
          float v46 = v45;

          long long v47 = *(_OWORD *)(Next + 4);
          uint64_t v101 = *(void *)(Next + 20);
          long long v100 = v47;
          if ([(VCPFullVideoAnalyzer *)self isStableMetaMotion:&v100] < 0)
          {
            unsigned int v48 = 0;
            Next[196] = 0;
          }
          else
          {
            unsigned int v48 = Next[196];
          }
          [v95 frameExpressionScore];
          if (v46 >= *(float *)&v51) {
            *(float *)&double v51 = v46;
          }
          *(float *)&double v51 = *(float *)&v51 * (float)v48;
          [v95 setFrameExpressionScore:v51];
        }
      }
      if (!BYTE2(self->_frameBuffer.buffer_[34].motion_result_.track_score_))
      {
        v52 = +[VCPSaliencyRegion salientRegionsFromPixelBuffer:a3];
        [(VCPFullVideoAnalyzer *)self reviseFrameTrackScore:Next saliencyRegions:v52];
      }
      if (BYTE2(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
      {
        int Descriptor = ma::SlowMotionAnalysis::ProcessFrame((ma::SlowMotionAnalysis *)((char *)self->_sceneAnalysis + 1200), (const ma::Frame *)Next);
        if (Descriptor) {
          goto LABEL_40;
        }
      }
      if (!*(_DWORD *)Next) {
        *((unsigned char *)self->_sceneAnalysis + 64) = *(unsigned char *)(*((void *)self->_encodeAnalysis + 12) + 173);
      }
      if (!BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
      {
        int Descriptor = ma::DescriptorAnalysis::GenerateDescriptor((ma::DescriptorAnalysis *)((char *)self->_sceneAnalysis + 760), a3, (ma::Frame *)Next);
        if (Descriptor) {
          goto LABEL_40;
        }
      }
      if (BYTE2(self->_frameBuffer.buffer_[34].motion_result_.track_score_))
      {
        [(VCPFullVideoAnalyzer *)self processAndEstimateQualityScore:Next];
        int v53 = *(_DWORD *)p_frameBuffer - 1;
        if (*(int *)p_frameBuffer > 1)
        {
          objc_super v54 = (Frame *)ma::FrameBuffer::Get(p_frameBuffer, *(_DWORD *)p_frameBuffer - 2);
          v55 = (Frame *)ma::FrameBuffer::Get(p_frameBuffer, v53);
          int Descriptor = ma::SceneAnalysis::ProcessFrame((ma::SceneAnalysis *)self->_sceneAnalysis, v54, v55);
          if (Descriptor) {
            goto LABEL_40;
          }
        }
        if (ma::CameraMotionAnalysis::isCurrentSegmentStable((ma::CameraMotionSegment **)self->_sceneAnalysis + 10)
          || ma::Translation::AbsSum((ma::Translation *)(Next + 52)) < 25.0)
        {
          *((_DWORD *)Next + 46) = 0;
        }
      }
      else if (*(int *)p_frameBuffer >= 6)
      {
        int Descriptor = [(VCPFullVideoAnalyzer *)self process:(*(_DWORD *)p_frameBuffer - 5)];
        if (Descriptor) {
          goto LABEL_40;
        }
      }
      if (!ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis) || *(int *)p_frameBuffer < 2)
      {
LABEL_69:
        if (!BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_)
          && *(void *)(*((void *)self->_encodeAnalysis + 12) + 32)
          && *(_DWORD *)Next)
        {
          v85 = [v95 videoActivityDescriptor];
          [v85 ExtractActivityDescriptorFromStats:ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis)];
        }
        LODWORD(v56) = *((_DWORD *)Next + 19);
        [v95 setCameraMotionScore:v56];
        uint64_t v60 = 176;
        if (!*(void *)(*((void *)self->_encodeAnalysis + 12) + 32)) {
          uint64_t v60 = 180;
        }
        LODWORD(v59) = *(_DWORD *)&Next[v60];
        [v95 setSubjectActionScore:v59];
        LODWORD(v61) = *((_DWORD *)Next + 48);
        [v95 setSubtleMotionScore:v61];
        LODWORD(v62) = *((_DWORD *)Next + 86);
        [v95 setInterestingnessScore:v62];
        LODWORD(v63) = *((_DWORD *)Next + 88);
        [v95 setColorfulnessScore:v63];
        [v95 setFrameProcessedByVideoAnalyzer:Next[208]];
        [v95 setSubMbMotionAvailable:*(void *)(*((void *)self->_encodeAnalysis + 12) + 32) != 0];
        [(VCPFullVideoAnalyzer *)self computeExposureScoreOfFrame:Next];
        objc_msgSend(v95, "setExposureScore:");
        long long v98 = *(_OWORD *)(Next + 228);
        uint64_t v99 = *(void *)(Next + 244);
        [v95 setMotionParam:&v98];
        long long v96 = *(_OWORD *)(Next + 252);
        uint64_t v97 = *(void *)(Next + 268);
        [v95 setMotionParamDiff:&v96];
        self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0] = ma::QualityAnalysis::currentSegmentScore((ma::QualitySegment **)self->_sceneAnalysis+ 123);
        self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1] = ma::FineSubjectMotionAnalysis::currentSegmentScore((ma::FineSubjectMotionAnalysis *)((char *)self->_sceneAnalysis + 496), *(_DWORD *)Next);
        LODWORD(v64) = *((_DWORD *)Next + 46);
        [*(id *)&self->_frameBuffer.buffer_[34].motion_result_.valid_mb_ processFrameScore:Next[208] validScore:v64];
        self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[4] = v65;
        [v95 interestingnessScore];
        v66 = Next;
        v67 = self;
        self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2] = v68;
        id v23 = [MEMORY[0x1E4F1CA60] dictionary];
        for (CFIndex j = 0; ; ++j)
        {
          CFArrayRef v70 = (const __CFArray *)*((void *)v66 + 41);
          if (v70) {
            LODWORD(v70) = CFArrayGetCount(v70);
          }
          if (j >= (int)v70) {
            break;
          }
          ValueAtIndeCGFloat x = (unsigned int **)CFArrayGetValueAtIndex(*((CFArrayRef *)v66 + 41), j);
          v72 = *ValueAtIndex;
          LODWORD(v73) = (*ValueAtIndex)[21];
          v74 = [NSNumber numberWithFloat:v73];
          v122[0] = v74;
          LODWORD(v75) = v72[22];
          v76 = [NSNumber numberWithFloat:v75];
          v122[1] = v76;
          v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v122 count:2];
          v78 = [NSNumber numberWithInt:*v72];
          [v23 setObject:v77 forKeyedSubscript:v78];
        }
        objc_storeStrong((id *)&v67->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5], v23);
        *(float *)&double v79 = *((float *)v66 + 55) * 0.25;
        v80 = [NSNumber numberWithFloat:v79];
        v121[0] = v80;
        *(float *)&double v81 = *((float *)v66 + 56) * 0.25;
        v82 = [NSNumber numberWithFloat:v81];
        v121[1] = v82;
        uint64_t v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v121 count:2];
        value = (void *)v67->_frameBuffer.buffer_[34].motion_result_.duration_.value;
        v67->_frameBuffer.buffer_[34].motion_result_.duration_.value = v83;

        int Descriptor = 0;
LABEL_39:

        goto LABEL_40;
      }
      obstructionAnalysis = (const __CFArray **)self->_obstructionAnalysis;
      EncodeStats = (const ma::EncodeStats *)ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis);
      int Descriptor = ma::ObstructionAnalysis::ProcessFrame(obstructionAnalysis, (const ma::Frame *)Next, EncodeStats);
      if (!Descriptor)
      {
        self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3] = *((float *)self->_obstructionAnalysis
                                                                                       + 13);
        goto LABEL_69;
      }
LABEL_40:
    }
  }
  else
  {
    int Descriptor = -108;
  }

  return Descriptor;
}

- (int)isStableMetaMotion:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [*(id *)&self->_frameBuffer.buffer_[34].motion_result_.residual_var_ objectForKeyedSubscript:@"MetaMotionResults"];

  if (!v5) {
    return 0;
  }
  [*(id *)&self->_frameBuffer.buffer_[34].motion_result_.residual_var_ objectForKeyedSubscript:@"MetaMotionResults"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        CFDictionaryRef v10 = *(const __CFDictionary **)(*((void *)&v19 + 1) + 8 * i);
        memset(&v18, 0, sizeof(v18));
        CMTimeRangeMakeFromDictionary(&v18, v10);
        CMTimeRange range = v18;
        $3CC8671D27C23BF42ADDB32F2B5E48AE v16 = *a3;
        if (CMTimeRangeContainsTime(&range, (CMTime *)&v16))
        {
          float v12 = [(__CFDictionary *)v10 objectForKeyedSubscript:@"quality"];
          [v12 floatValue];
          float v14 = v13;

          if (v14 < 10.0) {
            int v11 = 1;
          }
          else {
            int v11 = -1;
          }
          goto LABEL_14;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int v11 = 0;
LABEL_14:

  return v11;
}

- (float)estimateExpressionScore:(id)a3 encodeStats:(EncodeStats *)a4 frameWidth:(int)a5 frameHeight:(int)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int var25 = a4->var25;
  int var26 = a4->var26;
  int v11 = var25 + 15;
  BOOL v10 = var25 < -15;
  int v12 = var25 + 30;
  if (!v10) {
    int v12 = v11;
  }
  int v37 = v12;
  int v13 = var26 + 15;
  long long v38 = 0u;
  long long v39 = 0u;
  if (var26 >= -15) {
    int v14 = var26 + 15;
  }
  else {
    int v14 = var26 + 30;
  }
  long long v40 = 0uLL;
  long long v41 = 0uLL;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) bounds];
        v42.b = 0.0;
        v42.c = 0.0;
        v42.a = 1.0;
        *(_OWORD *)&v42.d = xmmword_1BC280F00;
        v42.tCGFloat y = 1.0;
        CGRect v46 = CGRectApplyAffineTransform(v45, &v42);
      }
      uint64_t v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height);
    }
    while (v16);
  }

  int v19 = v13 / 64;
  if (v13 / 64 >= 3 * (v14 >> 4) / 4)
  {
    float v35 = NAN;
  }
  else
  {
    int v20 = v37 >> 4;
    if (v11 >= 0) {
      int v21 = v11;
    }
    else {
      int v21 = v11 + 63;
    }
    int v22 = v21 >> 6;
    int v23 = 3 * v20 + 3;
    if (3 * v20 >= 0) {
      int v23 = 3 * v20;
    }
    int v24 = v23 >> 2;
    uint64_t v25 = (uint64_t)v21 >> 6;
    uint64_t v26 = v19;
    uint64_t v27 = 2 * (v25 + v19 * (uint64_t)v20);
    uint64_t v28 = 2 * v20;
    uint64_t v29 = ((uint64_t)v23 >> 2) - v22;
    float v30 = 0.0;
    float v31 = 0.0;
    do
    {
      if (v22 < v24)
      {
        v32 = (unsigned __int16 *)((char *)a4->var19 + v27);
        uint64_t v33 = v29;
        do
        {
          unsigned int v34 = *v32++;
          float v31 = v31 + (float)((float)v34 / 1000.0);
          float v30 = v30 + 1.0;
          --v33;
        }
        while (v33);
      }
      ++v26;
      v27 += v28;
    }
    while (v26 != 3 * (v14 >> 4) / 4);
    float v35 = (float)(v31 / v30) + -1000.0;
  }

  return v35 / 2500.0;
}

- (int)finishAnalysisPass:(id *)a3
{
  p_frameBuffer = &self->_frameBuffer;
  int frame_count = self->_frameBuffer.frame_count_;
  if (!frame_count || LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.track_score_)) {
    return -18;
  }
  if (frame_count <= 5) {
    int v7 = 5;
  }
  else {
    int v7 = self->_frameBuffer.frame_count_;
  }
  uint64_t v8 = (v7 - 4);
  if ((int)v8 >= frame_count)
  {
LABEL_11:
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = (const ma::Frame *)ma::FrameBuffer::Get((ma::FrameBuffer *)p_frameBuffer, frame_count - 1);
    int result = ma::PreEncodeAnalysis::Finalize((ma::PreEncodeAnalysis *)self->_preencodeAnalysis, v9);
    if (!result)
    {
      int result = ma::ObstructionAnalysis::Finalize((CFArrayRef *)self->_obstructionAnalysis, v9);
      if (!result)
      {
        int result = ma::SceneAnalysis::Finalize((const __CFArray **)self->_sceneAnalysis, v9, frame_count, (CFArrayRef *)self->_obstructionAnalysis);
        if (!result)
        {
          LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.track_score_) = 1;
          uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
          int v11 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_;
          *(void *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_ = v10;

          if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
          {
            int result = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"MetaMotionProcessedResults" to:*(void *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_ optional:1];
            if (!result) {
              return result;
            }
            int v12 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_;
            *(void *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_ = 0;
          }
          return 0;
        }
      }
    }
  }
  else
  {
    while (1)
    {
      int result = [(VCPFullVideoAnalyzer *)self process:v8];
      if (result) {
        break;
      }
      uint64_t v8 = (v8 + 1);
      if (frame_count == v8) {
        goto LABEL_11;
      }
    }
  }
  return result;
}

- (int)process:(int)a3
{
  if (a3 < 1) {
    return -50;
  }
  p_frameBuffer = &self->_frameBuffer;
  if (self->_frameBuffer.frame_count_ <= a3) {
    return -50;
  }
  id v6 = (Frame *)ma::FrameBuffer::Get((ma::FrameBuffer *)&self->_frameBuffer, a3 - 1);
  uint64_t v7 = ma::FrameBuffer::Get((ma::FrameBuffer *)p_frameBuffer, a3);
  if (!LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_)) {
    ma::MotionFilter::ProcessMotion((ma::FrameBuffer **)self->_motionFilter, a3, (ma::Translation *)(v7 + 52), 2);
  }
  ma::MetaDataAnalysis::EstimateMetadataFromMotion((ma::MetaDataAnalysis *)self->_metadataAnalysis, a3, (const ma::Translation *)(v7 + 52), BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_));
  if (!BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_)
    || (int result = ma::IrisAnalysis::UpdateStats((ma::IrisAnalysis *)self->_irisAnalysis, v6, (const Frame *)v7)) == 0)
  {
    ma::PreEncodeAnalysis::ProcessFrame((ma::PreEncodeAnalysis *)self->_preencodeAnalysis, (const ma::Frame *)v7);
    sceneAnalysis = (ma::SceneAnalysis *)self->_sceneAnalysis;
    return ma::SceneAnalysis::ProcessFrame(sceneAnalysis, v6, (Frame *)v7);
  }
  return result;
}

- (void)processAndEstimateQualityScore:(void *)a3
{
  if (!LOBYTE(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
  {
    int frame_count = self->_frameBuffer.frame_count_;
    if (frame_count >= 1) {
      ma::MotionFilter::ProcessMotion((ma::FrameBuffer **)self->_motionFilter, frame_count - 1, (ma::Translation *)((char *)a3 + 52), 2);
    }
  }
  ma::MetaDataAnalysis::EstimateMetadataFromMotion((ma::MetaDataAnalysis *)self->_metadataAnalysis, self->_frameBuffer.frame_count_ - 1, (const ma::Translation *)((char *)a3 + 52), 1);
  [(VCPFullVideoAnalyzer *)self estimateQualityScore:a3];
  *((_DWORD *)a3 + 19) = v6;
}

- (id)processSceneResults
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"SceneResults" to:v3 optional:0];
  id v4 = [v3 objectForKeyedSubscript:@"SceneResults"];
  for (unint64_t i = 0; i < [v4 count]; ++i)
  {
    memset(&v13, 0, sizeof(v13));
    CFDictionaryRef v6 = [v4 objectAtIndexedSubscript:i];
    CMTimeRangeMakeFromDictionary(&v13, v6);

    uint64_t v7 = *(void **)&self->_frameBuffer.buffer_[34].motion_result_.action_blocks_;
    CMTimeRange v12 = v13;
    uint64_t v8 = [v7 getEmbeddingsForRange:&v12 useFP16:1];
    if (v8)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v4 objectAtIndexedSubscript:i];
      uint64_t v10 = [v9 objectForKeyedSubscript:@"attributes"];

      [v10 setObject:v8 forKeyedSubscript:@"embeddings"];
    }
  }
  return v4;
}

- (float)estimateQualityScore:(void *)a3
{
  if (ma::Histogram::NoInfo((ma::Histogram *)((char *)a3 + 360)) || *((unsigned char *)a3 + 108)) {
    return 0.0;
  }
  float v5 = ma::Translation::AbsSum((ma::Translation *)((char *)a3 + 52));
  float v6 = expf(v5 * -0.07);
  float v7 = ma::Translation::AbsSum((ma::Translation *)((char *)a3 + 112));
  float v8 = expf(v7 * -10.0);
  float v9 = 0.0;
  float v10 = fmaxf(v8, 0.0);
  if (v6 > 0.0) {
    float v9 = v6 * 0.7;
  }
  return v9 + (float)(v10 * 0.3);
}

- (id)results
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"CameraMotionResults" to:v3 optional:0];
  if (v4) {
    goto LABEL_4;
  }
  int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"SubjectMotionResults" to:v3 optional:0];
  if (v4) {
    goto LABEL_4;
  }
  int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"QualityResults" to:v3 optional:0];
  if (v4) {
    goto LABEL_4;
  }
  if (*(void *)&self->_frameBuffer.buffer_[34].motion_result_.action_blocks_)
  {
    float v8 = [(VCPFullVideoAnalyzer *)self processSceneResults];
    [v3 setObject:v8 forKeyedSubscript:@"SceneResults"];
  }
  else
  {
    int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"SceneResults" to:v3 optional:0];
    if (v4) {
      goto LABEL_4;
    }
  }
  if (BYTE1(self->_frameBuffer.buffer_[34].motion_result_.fine_action_score_))
  {
    int v4 = [(VCPFullVideoAnalyzer *)self addResult:ma::IrisAnalysis::GetBoundBoxResults((ma::IrisAnalysis *)self->_irisAnalysis) to:v3 forKey:@"IrisObjectsResults" optional:1];
  }
  else
  {
    int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"FeatureVectorResults" to:v3 optional:0];
    if (v4) {
      goto LABEL_4;
    }
    int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"SceneprintResults" to:v3 optional:0];
  }
  if (!v4)
  {
    int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"FineSubjectMotionResults" to:v3 optional:1];
    if (!v4)
    {
      int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"SubtleMotionResults" to:v3 optional:1];
      if (!v4)
      {
        int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"MovingObjectsResults" to:v3 optional:1];
        if (!v4)
        {
          int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"OrientationResults" to:v3 optional:1];
          if (!v4)
          {
            int v4 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"InterestingnessResults" to:v3 optional:1];
            if (!v4)
            {
              int v4 = [(VCPFullVideoAnalyzer *)self addResult:*((void *)self->_obstructionAnalysis + 2) to:v3 forKey:@"ObstructionResults" optional:1];
              if (!v4) {
                int v4 = [(VCPFullVideoAnalyzer *)self addResult:ma::PreEncodeAnalysis::GetResults((ma::PreEncodeAnalysis *)self->_preencodeAnalysis) to:v3 forKey:@"PreEncodeResults" optional:1];
              }
            }
          }
        }
      }
    }
  }
LABEL_4:
  if (v4) {
    float v5 = 0;
  }
  else {
    float v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (id)privateResults
{
  return *(id *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_;
}

- (int)addSceneAnalysisResult:(id)a3 to:(id)a4 optional:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  CFTypeRef cf = 0;
  int v10 = ma::SceneAnalysis::CopyProperty((ma::SceneAnalysis *)self->_sceneAnalysis, v8, 0, (CFArrayRef *)&cf);
  if (!v10) {
    int v10 = [(VCPFullVideoAnalyzer *)self addResult:cf to:v9 forKey:v8 optional:v5];
  }
  if (cf) {
    CFRelease(cf);
  }

  return v10;
}

- (int)addSceneAnalysisResult:(id)a3 to:(id)a4 clipRange:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  CFArrayRef v15 = 0;
  sceneAnalysis = (CFArrayRef *)self->_sceneAnalysis;
  long long v11 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&v14.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&v14.start.epoch = v11;
  *(_OWORD *)&v14.duration.timescale = *(_OWORD *)&a5->var1.var1;
  int v12 = ma::SceneAnalysis::CopyProperty(sceneAnalysis, &v14, v8, 0, &v15);
  if (!v12) {
    int v12 = [(VCPFullVideoAnalyzer *)self addResult:v15 to:v9 forKey:v8 optional:0];
  }
  if (v15) {
    CFRelease(v15);
  }

  return v12;
}

- (int)addResult:(__CFArray *)a3 to:(id)a4 forKey:(id)a5 optional:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if (a3) {
    int v11 = 1;
  }
  else {
    int v11 = v6;
  }
  if (v11) {
    int v12 = 0;
  }
  else {
    int v12 = -50;
  }
  if (a3)
  {
    CopCGFloat y = CFArrayCreateCopy(0, a3);
    [v9 setObject:Copy forKey:v10];

    int v12 = 0;
  }

  return v12;
}

- (float)getSceneSwichFrequency
{
  sceneAnalysis = (float *)self->_sceneAnalysis;
  if (sceneAnalysis) {
    return sceneAnalysis[14];
  }
  else {
    return 0.0;
  }
}

- (void)setNextCaptureFrame:(__CVBuffer *)a3
{
  *((void *)self->_sceneAnalysis + 158) = a3;
}

- (void)reviseFrameTrackScore:(void *)a3 saliencyRegions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  CFIndex v6 = 0;
  char v7 = 0;
  while (1)
  {
    CFArrayRef v8 = (const __CFArray *)*((void *)a3 + 39);
    if (v8) {
      LODWORD(v8) = CFArrayGetCount(v8);
    }
    if (v6 >= (int)v8) {
      break;
    }
    uint64_t v9 = *(void *)CFArrayGetValueAtIndex(*((CFArrayRef *)a3 + 39), v6);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * i) bound];
          if (CGRectIntersectsRect(v20, *(CGRect *)(v9 + 8)))
          {
            char v7 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    ++v6;
  }
  if ((v7 & 1) == 0) {
    *((_DWORD *)a3 + 46) = 0;
  }
}

- (float)computeExposureScoreOfFrame:(void *)a3
{
  return ma::Histogram::EarthMoverDistance((ma::Histogram *)((char *)a3 + 360), (const ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_, 0);
}

- (id)clipResults:(id *)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v6 = *(_OWORD *)&a3->var0.var3;
  v19[0] = *(_OWORD *)&a3->var0.var0;
  v19[1] = v6;
  v19[2] = *(_OWORD *)&a3->var1.var1;
  int v7 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"QualityResults" to:v5 clipRange:v19];
  if (!v7)
  {
    long long v8 = *(_OWORD *)&a3->var0.var3;
    v18[0] = *(_OWORD *)&a3->var0.var0;
    v18[1] = v8;
    v18[2] = *(_OWORD *)&a3->var1.var1;
    int v7 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"FineSubjectMotionResults" to:v5 clipRange:v18];
    if (!v7)
    {
      long long v9 = *(_OWORD *)&a3->var0.var3;
      v17[0] = *(_OWORD *)&a3->var0.var0;
      v17[1] = v9;
      v17[2] = *(_OWORD *)&a3->var1.var1;
      int v7 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"SubtleMotionResults" to:v5 clipRange:v17];
      if (!v7)
      {
        long long v10 = *(_OWORD *)&a3->var0.var3;
        v16[0] = *(_OWORD *)&a3->var0.var0;
        v16[1] = v10;
        v16[2] = *(_OWORD *)&a3->var1.var1;
        int v7 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"CameraMotionResults" to:v5 clipRange:v16];
        if (!v7)
        {
          long long v11 = *(_OWORD *)&a3->var0.var3;
          v15[0] = *(_OWORD *)&a3->var0.var0;
          v15[1] = v11;
          v15[2] = *(_OWORD *)&a3->var1.var1;
          int v7 = [(VCPFullVideoAnalyzer *)self addSceneAnalysisResult:@"InterestingnessResults" to:v5 clipRange:v15];
        }
      }
    }
  }
  if (v7) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v5;
  }
  id v13 = v12;

  return v13;
}

- (float)qualityScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0];
}

- (void)setQualityScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[0] = a3;
}

- (float)actionScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1];
}

- (void)setActionScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[1] = a3;
}

- (float)interestingnessScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2];
}

- (void)setInterestingnessScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[2] = a3;
}

- (float)obstructionScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3];
}

- (void)setObstructionScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[3] = a3;
}

- (float)trackingScore
{
  return self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[4];
}

- (void)setTrackingScore:(float)a3
{
  self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[4] = a3;
}

- (NSDictionary)objectsMotion
{
  return *(NSDictionary **)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5];
}

- (NSArray)globalMotion
{
  return (NSArray *)self->_frameBuffer.buffer_[34].motion_result_.duration_.value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.duration_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_diff_.__elems_[5], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[3], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.motion_param_.__elems_[1], 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.residual_var_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.valid_mb_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.action_blocks_, 0);
  objc_storeStrong((id *)&self->_frameBuffer.buffer_[34].motion_result_.subtle_motion_score_, 0);
  ma::Histogram::~Histogram((ma::Histogram *)&self->_frameBuffer.buffer_[34].motion_result_);
  v3 = &self->_frameBuffer.buffer_[33].motion_result_.motion_param_diff_.__elems_[3];
  uint64_t v4 = -14280;
  do
  {
    ma::Histogram::~Histogram((ma::Histogram *)(v3 + 58));
    ma::MotionResult::~MotionResult((ma::MotionResult *)v3);
    v3 -= 102;
    v4 += 408;
  }
  while (v4);
}

- (id).cxx_construct
{
  return self;
}

@end