@interface VCPLightMotionAnalyzer
+ (float)autoLiveMotionScore:(id)a3;
- (VCPLightMotionAnalyzer)init;
- (VCPLightMotionAnalyzer)initWithQueue:(id)a3 turbo:(BOOL)a4;
- (float)actionScore;
- (float)motionDivScore;
- (id).cxx_construct;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)cameraMotionDetection:(void *)a3;
- (int)computeMotionDivScore:(EncodeStats *)a3;
- (int)generateThresholds:(float)a3[6] withConfidences:(float)a4[6];
- (int)prewarmWithWidth:(int)a3 height:(int)a4;
- (void)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 completion:(id)a6;
- (void)dealloc;
@end

@implementation VCPLightMotionAnalyzer

- (VCPLightMotionAnalyzer)initWithQueue:(id)a3 turbo:(BOOL)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VCPLightMotionAnalyzer;
  v8 = [(VCPLightMotionAnalyzer *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    v9->_frame.histogram_.moments_hist_[1] = 0;
    LOBYTE(v9->_flags) = a4;
    v10 = (ma::EncodeAnalysis *)operator new(0x3C0uLL, MEMORY[0x1E4FBA2D0]);
    v11 = v10;
    if (v10)
    {
      ma::EncodeAnalysis::EncodeAnalysis(v10, 0, a4, 1, 0);
      v12 = v9;
    }
    else
    {
      v12 = 0;
    }
    v9->_encodeAnalysis = v11;
    v9->_frame.frame_idx_ = 0;
    *(void *)&v9->_cameraMotionConfidences[5][3] = 0;
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)prewarmWithWidth:(int)a3 height:(int)a4
{
  if (self->_frame.histogram_.moments_hist_[1]) {
    return 0;
  }
  int result = 0;
  if (a4 >= 1 && a3 >= 1 && self->_queue)
  {
    Async = (int *)ma::EncodeStatsHW::CreateAsync(*(ma::EncodeStatsHW **)&a3, *(uint64_t *)&a4, LOBYTE(self->_flags), 1);
    self->_frame.histogram_.moments_hist_[1] = Async;
    if (Async)
    {
      *((void *)self->_encodeAnalysis + 12) = Async;
      encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
      v8 = self->_frame.histogram_.moments_hist_[1];
      int v10 = v8[44];
      int v9 = v8[45];
      int v12 = v10 + 15;
      BOOL v11 = v10 < -15;
      int v13 = v10 + 30;
      if (!v11) {
        int v13 = v12;
      }
      int v14 = v13 >> 4;
      int v15 = v9 + 15;
      BOOL v11 = v9 < -15;
      int v16 = v9 + 30;
      if (!v11) {
        int v16 = v15;
      }
      return ma::EncodeAnalysis::Initialize(encodeAnalysis, v14, v16 >> 4);
    }
    else
    {
      return -108;
    }
  }
  return result;
}

- (id).cxx_construct
{
  return self;
}

+ (float)autoLiveMotionScore:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  int v3 = [v32 count];
  int v4 = v3;
  if (v3 >= 5) {
    int v5 = 5;
  }
  else {
    int v5 = v3;
  }
  float v6 = 1.0;
  if ((v5 & 0x80000000) == 0)
  {
    uint64_t v7 = 0;
    uint64_t v8 = (v5 + 1);
    while (1)
    {
      int v9 = [v32 objectAtIndexedSubscript:v7];
      int v10 = [v9 objectForKeyedSubscript:@"flags"];
      __int16 v11 = [v10 integerValue];

      if ((v11 & 0x1000) != 0) {
        break;
      }
      if (v8 == ++v7) {
        goto LABEL_10;
      }
    }
    float v6 = 0.05;
  }
LABEL_10:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v32;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v13)
  {
    int v33 = 0;
    uint64_t v14 = *(void *)v36;
    if (v4 >= 0) {
      int v15 = v4;
    }
    else {
      int v15 = v4 + 1;
    }
    int v34 = v15 >> 1;
    float v16 = 0.0;
    float v17 = 0.0;
    do
    {
      uint64_t v18 = 0;
      int v19 = v33;
      v33 += v13;
      do
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v12);
        }
        v20 = *(void **)(*((void *)&v35 + 1) + 8 * v18);
        v21 = [v20 objectForKeyedSubscript:@"subjectMotionScore"];
        BOOL v22 = v21 == 0;

        if (!v22)
        {
          v23 = [v20 objectForKeyedSubscript:@"subjectMotionScore"];
          [v23 floatValue];
          float v25 = v24;

          *(float *)&double v26 = v6;
          if (v19 + (int)v18 >= 6)
          {
            v27 = objc_msgSend(v20, "objectForKeyedSubscript:", @"flags", v26);
            __int16 v28 = [v27 integerValue];

            LODWORD(v26) = 1.0;
            if ((v28 & 0x1000) != 0)
            {
              if (v19 + (int)v18 >= v34) {
                *(float *)&double v26 = 1.0;
              }
              else {
                *(float *)&double v26 = 0.05;
              }
            }
          }
          float v16 = v16 + *(float *)&v26;
          float v17 = v17 + (float)(*(float *)&v26 * (float)(v25 * v25));
        }
        ++v18;
      }
      while (v13 != v18);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);

    float v29 = 1.0;
    if (v16 > 0.0)
    {
      float v30 = fabsf(sqrtf(v17 / v16));
      if ((float)(v17 / v16) == -INFINITY) {
        float v29 = INFINITY;
      }
      else {
        float v29 = v30;
      }
    }
  }
  else
  {

    float v29 = 1.0;
  }

  return v29;
}

- (VCPLightMotionAnalyzer)init
{
  return 0;
}

- (void)dealloc
{
  encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
  if (encodeAnalysis)
  {
    ma::EncodeAnalysis::~EncodeAnalysis(encodeAnalysis);
    MEMORY[0x1C186C7D0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPLightMotionAnalyzer;
  [(VCPLightMotionAnalyzer *)&v4 dealloc];
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  if (self->_queue) {
    return -18;
  }
  p_frame = &self->_frame;
  CMTime v16 = *(CMTime *)a4;
  CMTime v15 = *(CMTime *)a5;
  ma::Frame::Initialize((ma::Frame *)&self->_frame, &v16, &v15, a3, 0);
  if (!result)
  {
    encodeAnalysis = (ma::EncodeAnalysis *)self->_encodeAnalysis;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
    int result = ma::EncodeAnalysis::ProcessFrame(encodeAnalysis, (CMTime *)&v14, a3, (ma::Frame *)p_frame, 0, 0);
    if (!result)
    {
      int result = [(VCPLightMotionAnalyzer *)self cameraMotionDetection:&p_frame->acc_var_.z_];
      if (!result)
      {
        int result = [(VCPLightMotionAnalyzer *)self computeMotionDivScore:ma::EncodeAnalysis::getEncodeStats((ma::EncodeAnalysis *)self->_encodeAnalysis)];
        if (!result)
        {
          if (a6) {
            *a6 |= *(void *)&self->_cameraMotionConfidences[5][3];
          }
          int result = 0;
          HIDWORD(self->_flags) = LODWORD(p_frame->motion_result_.confidence_[5]);
          if (p_frame->frame_idx_ == 2147483646) {
            int v13 = 0;
          }
          else {
            int v13 = p_frame->frame_idx_ + 1;
          }
          p_frame->frame_idx_ = v13;
        }
      }
    }
  }
  return result;
}

- (int)generateThresholds:(float)a3[6] withConfidences:(float)a4[6]
{
  for (uint64_t i = 0; i != 6; ++i)
  {
    float v5 = a4[i];
    float v6 = -4.5;
    if (v5 >= 0.1)
    {
      float v6 = -0.1;
      if (v5 <= 0.9) {
        float v6 = (float)(v5 * 5.5) + -5.05;
      }
    }
    a3[i] = v6;
  }
  return 0;
}

- (int)cameraMotionDetection:(void *)a3
{
  uint64_t v5 = 0;
  v25[3] = *MEMORY[0x1E4F143B8];
  p_stats = &self->_stats;
  int frame_idx = self->_frame.frame_idx_;
  uint64_t v8 = &self->_cameraMotionParams[5][3];
  do
  {
    *(_DWORD *)((char *)&self->_stats + 4 * (frame_idx % 5) + v5 * 4) = *(_DWORD *)a3;
    self->_cameraMotionParams[5][frame_idx % 5 + 3 + v5] = *((float *)a3 + 6);
    v5 += 5;
    a3 = (char *)a3 + 4;
  }
  while (v5 != 30);
  memset(v25, 0, 24);
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (frame_idx >= 5)
  {
    for (uint64_t i = 0; i != 6; ++i)
    {
      uint64_t v10 = 0;
      float v11 = *((float *)&v22 + i);
      float v12 = *((float *)v25 + i);
      do
      {
        float v11 = *(float *)((char *)p_stats + v10 * 4) + v11;
        float v12 = v8[v10++] + v12;
      }
      while (v10 != 5);
      *((float *)&v22 + i) = v11;
      *((float *)v25 + i) = v12;
      p_stats = (EncodeStatsHW **)((char *)p_stats + 20);
      v8 += 5;
    }
    uint64_t v13 = 0;
    LODWORD(v3) = 5.0;
    do
    {
      *(float *)((char *)&v22 + v13) = *(float *)((char *)&v22 + v13) / 5.0;
      *(float *)((char *)v25 + v13) = *(float *)((char *)v25 + v13) / 5.0;
      v13 += 4;
    }
    while (v13 != 24);
    -[VCPLightMotionAnalyzer generateThresholds:withConfidences:](self, "generateThresholds:withConfidences:", &v19, v25, v3);
    uint64_t v14 = 0;
    float v15 = 3.4028e38;
    do
    {
      if (*(float *)((char *)&v22 + v14) < v15) {
        float v15 = *(float *)((char *)&v22 + v14);
      }
      v14 += 4;
    }
    while (v14 != 24);
    BOOL v16 = *(float *)&v23 < (float)(v15 * 0.5) && *(float *)&v23 < *(float *)&v20;
    uint64_t v17 = 4096;
    if (!v16) {
      uint64_t v17 = 0;
    }
    *(void *)&self->_cameraMotionConfidences[5][3] = *(void *)&self->_cameraMotionConfidences[5][3] & 0xFFFFFFFFFFFFEFFFLL | v17;
  }
  return 0;
}

- (int)computeMotionDivScore:(EncodeStats *)a3
{
  if (!a3) {
    return -18;
  }
  int var25 = a3->var25;
  int var26 = a3->var26;
  int v6 = var25 + 15;
  BOOL v5 = var25 < -15;
  int v7 = var25 + 30;
  if (!v5) {
    int v7 = v6;
  }
  int v8 = v7 >> 4;
  int v9 = var26 + 15;
  BOOL v5 = var26 < -15;
  int v10 = var26 + 30;
  if (!v5) {
    int v10 = v9;
  }
  int v11 = (v10 >> 4) * v8;
  float v12 = 0.0;
  float v13 = 0.0;
  float v14 = 0.0;
  if (v11 >= 1)
  {
    unint64_t v15 = 0;
    var1 = a3->var1;
    uint64_t v17 = 2 * v11;
    do
    {
      if (*var1++)
      {
        float v19 = (float)(HIBYTE(a3->var15[v15 / 2]) + HIBYTE(a3->var16[v15 / 2]));
        float v13 = v13
            + (float)(v19
                    * (float)(vabds_f32((float)*((__int16 *)a3->var3 + v15), *(float *)&self->_frame.motion_result_.support_size_)+ vabds_f32((float)*((__int16 *)a3->var3 + v15 + 1), self->_frame.motion_result_.residual_var_)));
        float v14 = v14 + (float)(v19 + 2.0);
      }
      v15 += 2;
    }
    while (v17 != v15);
  }
  int v20 = 0;
  float v21 = (float)(v13 / (float)(v14 + 10.0)) / 40.0;
  float v22 = 1.0;
  if (v21 < 1.0) {
    float v22 = v21;
  }
  if (v21 > 0.0) {
    float v12 = v22;
  }
  *(float *)&self->_turbo = v12;
  return v20;
}

- (void)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 completion:(id)a6
{
  id v10 = a6;
  CFRetain(a3);
  Width = (ma::EncodeStatsHW *)CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (!self->_queue)
  {
LABEL_9:
    uint64_t v15 = 4294967278;
    goto LABEL_10;
  }
  uint64_t v13 = Height;
  CMTime v25 = (CMTime)*a4;
  CMTime v24 = (CMTime)*a5;
  ma::Frame::Initialize((ma::Frame *)&self->_frame, &v25, &v24, a3, 0);
  uint64_t v15 = v14;
  if (!v14)
  {
    Async = self->_frame.histogram_.moments_hist_[1];
    if (Async
      || (Async = (int *)ma::EncodeStatsHW::CreateAsync(Width, v13, LOBYTE(self->_flags), 1),
          (self->_frame.histogram_.moments_hist_[1] = Async) != 0))
    {
      if (Async[44] == Width && Async[45] == v13)
      {
        long long v22 = *(_OWORD *)&a4->var0;
        int64_t var3 = a4->var3;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke;
        v17[3] = &unk_1E6298338;
        long long v20 = v22;
        int64_t v21 = var3;
        v17[4] = self;
        float v19 = a3;
        id v18 = v10;
        uint64_t v15 = ma::EncodeStatsHW::ProcessFrameAsync((uint64_t)Async, (uint64_t)&v22, a3, v17);

        if (!v15) {
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
    goto LABEL_9;
  }
LABEL_10:
  if (a3) {
    CFRelease(a3);
  }
  (*((void (**)(id, void, uint64_t, float, float))v10 + 2))(v10, 0, v15, -1.0, -1.0);
LABEL_13:
}

void __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke_2;
  block[3] = &unk_1E6298310;
  block[4] = v2;
  long long v10 = *(_OWORD *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  BOOL v5 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  id v7 = v5;
  dispatch_async(v3, block);
}

uint64_t __76__VCPLightMotionAnalyzer_analyzeFrame_withTimestamp_andDuration_completion___block_invoke_2(uint64_t a1, __n128 a2, __n128 a3)
{
  uint64_t v4 = *(ma::EncodeStatsHW **)(*(void *)(a1 + 32) + 432);
  int v5 = *((_DWORD *)v4 + 46);
  if (!v5)
  {
    int v5 = ma::EncodeStatsHW::ParseStatsFromSampleBuffer(v4, *(CMSampleBufferRef *)(a1 + 48));
    if (!v5)
    {
      int v6 = *(void **)(a1 + 32);
      id v7 = (ma::EncodeAnalysis *)v6[1];
      uint64_t v8 = (ma::EncodeStats *)v6[54];
      CMTime v14 = *(CMTime *)(a1 + 64);
      int v5 = ma::EncodeAnalysis::AnalyzeFrame(v7, v8, &v14, *(CVPixelBufferRef *)(a1 + 56), (ma::Frame *)(v6 + 3), 0, 0);
      if (!v5)
      {
        int v5 = [*(id *)(a1 + 32) cameraMotionDetection:*(void *)(a1 + 32) + 152];
        if (!v5)
        {
          int v5 = [*(id *)(a1 + 32) computeMotionDivScore:*(void *)(*(void *)(a1 + 32) + 432)];
          if (!v5)
          {
            *(_DWORD *)(*(void *)(a1 + 32) + 692) = *(_DWORD *)(*(void *)(a1 + 32) + 204);
            ++*(_DWORD *)(*(void *)(a1 + 32) + 24);
            uint64_t v9 = *(void *)(a1 + 32);
            int v5 = 0;
            if (*(_DWORD *)(v9 + 24) == 0x7FFFFFFF) {
              *(_DWORD *)(v9 + 24) = 0;
            }
          }
        }
      }
    }
  }
  long long v10 = *(const void **)(a1 + 48);
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = *(const void **)(a1 + 56);
  if (v11) {
    CFRelease(v11);
  }
  if (v5)
  {
    a2.n128_u32[1] = -1074790400;
    a2.n128_f32[0] = -1.0;
    a3.n128_f32[0] = -1.0;
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    a2.n128_u32[0] = *(_DWORD *)(v13 + 692);
    a3.n128_u32[0] = *(_DWORD *)(v13 + 696);
  }
  return (*(uint64_t (**)(__n128, __n128))(*(void *)(a1 + 40) + 16))(a2, a3);
}

- (float)actionScore
{
  return *((float *)&self->_flags + 1);
}

- (float)motionDivScore
{
  return *(float *)&self->_turbo;
}

- (void).cxx_destruct
{
  p_frame = &self->_frame;
  ma::Histogram::~Histogram((ma::Histogram *)&self->_frame.colorfulness_score_);
  ma::MotionResult::~MotionResult((ma::MotionResult *)&p_frame->acc_var_.z_);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end