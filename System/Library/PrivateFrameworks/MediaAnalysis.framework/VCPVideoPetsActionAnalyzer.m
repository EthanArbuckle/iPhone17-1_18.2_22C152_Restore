@interface VCPVideoPetsActionAnalyzer
- (CGRect)scaleRect:(CGRect)a3 scaleX:(float)a4 scaleY:(float)a5;
- (VCPVideoPetsActionAnalyzer)initWithTimeOfInterest:(id)a3;
- (float)intersectionOverUnion:(CGRect)a3 rect:(CGRect)a4;
- (float)normDistance:(id)a3 point2:(id)a4;
- (id).cxx_construct;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7;
- (int)finishAnalysisPass:(id *)a3;
- (int)processPets:(id)a3 petsBounds:(id)a4 dominantPetIdx:(int)a5 frame:(__CVBuffer *)a6 timestamp:(id *)a7 duration:(id *)a8 frameStats:(id)a9;
- (void)computeActionScore;
- (void)computeVar:(int)a3 index2:(int)a4 interVar:(float *)a5 intraVar:(float *)a6;
@end

@implementation VCPVideoPetsActionAnalyzer

- (VCPVideoPetsActionAnalyzer)initWithTimeOfInterest:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)VCPVideoPetsActionAnalyzer;
  v6 = [(VCPVideoPetsActionAnalyzer *)&v31 init];
  if (v6)
  {
    v7 = [[VCPImagePetsKeypointsAnalyzer alloc] initWithMaxNumRegions:2 forceCPU:0 sharedModel:1];
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    uint64_t v9 = MEMORY[0x1E4F1FA08];
    uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *((_OWORD *)v6 + 1) = *MEMORY[0x1E4F1FA08];
    *((void *)v6 + 4) = v10;
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = (void *)*((void *)v6 + 16);
    *((void *)v6 + 16) = v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    v16 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = (void *)*((void *)v6 + 18);
    *((void *)v6 + 18) = v17;

    *((_DWORD *)v6 + 18) = 0;
    uint64_t v19 = MEMORY[0x1E4F1F9F8];
    long long v20 = *MEMORY[0x1E4F1F9F8];
    *(void *)(v6 + 92) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v6 + 76) = v20;
    uint64_t v21 = *(void *)(v19 + 16);
    *(_OWORD *)(v6 + 100) = *(_OWORD *)v19;
    *(void *)(v6 + 116) = v21;
    v22 = (_OWORD *)MEMORY[0x1E4F1DB28];
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v6 + 152) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v6 + 168) = v23;
    long long v24 = v22[1];
    *(_OWORD *)(v6 + 184) = *v22;
    *(_OWORD *)(v6 + 200) = v24;
    *((_DWORD *)v6 + 54) = 0;
    *((_DWORD *)v6 + 55) = 0;
    *((_DWORD *)v6 + 56) = 0;
    *((_DWORD *)v6 + 57) = 0;
    uint64_t v25 = *(void *)(v19 + 16);
    *(_OWORD *)(v6 + 232) = *(_OWORD *)v19;
    *((void *)v6 + 31) = v25;
    uint64_t v26 = *(void *)(v9 + 16);
    *(_OWORD *)(v6 + 40) = *(_OWORD *)v9;
    *((void *)v6 + 7) = v26;
    v27 = (void *)*((void *)v6 + 32);
    *((void *)v6 + 32) = 0;

    v6[264] = 0;
    objc_storeStrong((id *)v6 + 34, a3);
    v6[280] = 1;
  }
  if (*((void *)v6 + 1)) {
    v28 = v6;
  }
  else {
    v28 = 0;
  }
  v29 = v28;

  return v29;
}

- (float)normDistance:(id)a3 point2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectAtIndexedSubscript:0];
  [v7 floatValue];
  float v9 = v8;
  uint64_t v10 = [v6 objectAtIndexedSubscript:0];
  [v10 floatValue];
  float v12 = v11;
  uint64_t v13 = [v5 objectAtIndexedSubscript:0];
  [v13 floatValue];
  float v15 = v14;
  v16 = [v6 objectAtIndexedSubscript:0];
  [v16 floatValue];
  float v18 = v17;
  uint64_t v19 = [v5 objectAtIndexedSubscript:1];
  [v19 floatValue];
  float v21 = v20;
  v22 = [v6 objectAtIndexedSubscript:1];
  [v22 floatValue];
  float v24 = v23;
  uint64_t v25 = [v5 objectAtIndexedSubscript:1];
  [v25 floatValue];
  float v27 = v26;
  v28 = [v6 objectAtIndexedSubscript:1];
  [v28 floatValue];
  float v30 = sqrtf((float)((float)(v21 - v24) * (float)(v27 - v29)) + (float)((float)(v9 - v12) * (float)(v15 - v18)));

  return v30;
}

- (void)computeVar:(int)a3 index2:(int)a4 interVar:(float *)a5 intraVar:(float *)a6
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (a5 && a6)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    obj = self->_bodyArray;
    uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v75 objects:v79 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v76;
      uint64_t v74 = a4;
      float v72 = 0.0;
      float v67 = 0.0;
      float v65 = 0.0;
      float v66 = 0.0;
      float v70 = 0.0;
      float v71 = 0.0;
      float v68 = 0.0;
      float v69 = 0.0;
      float v10 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v76 != v9) {
            objc_enumerationMutation(obj);
          }
          float v12 = *(void **)(*((void *)&v75 + 1) + 8 * i);
          if ([v12 count])
          {
            uint64_t v13 = [v12 objectAtIndexedSubscript:a3];
            float v14 = [v13 objectAtIndexedSubscript:2];
            [v14 floatValue];
            if (v15 <= 0.15)
            {
            }
            else
            {
              v16 = [v12 objectAtIndexedSubscript:v74];
              float v17 = [v16 objectAtIndexedSubscript:2];
              [v17 floatValue];
              BOOL v19 = v18 > 0.15;

              if (v19)
              {
                float v20 = [v12 objectAtIndexedSubscript:a3];
                float v21 = [v20 objectAtIndexedSubscript:0];
                [v21 floatValue];
                float v64 = v22;

                float v23 = [v12 objectAtIndexedSubscript:a3];
                float v24 = [v23 objectAtIndexedSubscript:0];
                [v24 floatValue];
                float v26 = v25;
                float v27 = [v12 objectAtIndexedSubscript:a3];
                v28 = [v27 objectAtIndexedSubscript:0];
                float v63 = v26;
                [v28 floatValue];
                float v62 = v29;

                float v30 = [v12 objectAtIndexedSubscript:a3];
                objc_super v31 = [v30 objectAtIndexedSubscript:1];
                [v31 floatValue];
                float v33 = v32;

                v34 = [v12 objectAtIndexedSubscript:a3];
                v35 = [v34 objectAtIndexedSubscript:1];
                [v35 floatValue];
                float v37 = v36;
                v38 = [v12 objectAtIndexedSubscript:a3];
                v39 = [v38 objectAtIndexedSubscript:1];
                [v39 floatValue];
                float v41 = v40;

                v42 = [v12 objectAtIndexedSubscript:a3];
                v43 = [v42 objectAtIndexedSubscript:0];
                [v43 floatValue];
                float v45 = v44;
                v46 = [v12 objectAtIndexedSubscript:v74];
                v47 = [v46 objectAtIndexedSubscript:0];
                [v47 floatValue];
                float v49 = v48;

                v50 = [v12 objectAtIndexedSubscript:a3];
                v51 = [v50 objectAtIndexedSubscript:1];
                [v51 floatValue];
                float v53 = v52;
                v54 = [v12 objectAtIndexedSubscript:v74];
                v55 = [v54 objectAtIndexedSubscript:1];
                [v55 floatValue];
                float v57 = v56;

                float v72 = v72 + v64;
                float v65 = v65 + (float)(v63 * v62);
                float v66 = v66 + (float)(v37 * v41);
                float v67 = v67 + v33;
                float v68 = v68 + (float)((float)(v45 - v49) * (float)(v45 - v49));
                float v70 = v70 + (float)(v45 - v49);
                float v71 = v71 + (float)(v53 - v57);
                float v69 = v69 + (float)((float)(v53 - v57) * (float)(v53 - v57));
                float v10 = v10 + 1.0;
              }
            }
          }
        }
        uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v75 objects:v79 count:16];
      }
      while (v8);

      float v58 = 0.0;
      float v59 = 0.0;
      if (v10 > 0.0)
      {
        float v59 = (float)((float)((float)(v65 / v10) - (float)((float)(v72 * v72) / (float)(v10 * v10)))
                    + (float)((float)(v66 / v10) - (float)((float)(v67 * v67) / (float)(v10 * v10))))
            * 0.5;
        float v58 = (float)((float)((float)(v68 / v10) - (float)((float)(v70 * v70) / (float)(v10 * v10)))
                    + (float)((float)(v69 / v10) - (float)((float)(v71 * v71) / (float)(v10 * v10))))
            * 0.5;
      }
    }
    else
    {

      float v58 = 0.0;
      float v59 = 0.0;
    }
    *a5 = v59;
    *a6 = v58;
  }
}

- (void)computeActionScore
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v2 = self->_bodyArray;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v3)
  {

    float v36 = 0.0;
    float v37 = 0.0;
    float v38 = 0.0;
    goto LABEL_25;
  }
  uint64_t v4 = *(void *)v50;
  float v5 = 0.0;
  float v6 = 0.0;
  float v7 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (*(void *)v50 != v4) {
        objc_enumerationMutation(v2);
      }
      uint64_t v9 = *(void **)(*((void *)&v49 + 1) + 8 * i);
      if ([v9 count])
      {
        float v10 = [v9 objectAtIndexedSubscript:16];
        float v11 = [v10 objectAtIndexedSubscript:2];
        [v11 floatValue];
        if (v12 <= 0.15)
        {
        }
        else
        {
          uint64_t v13 = [v9 objectAtIndexedSubscript:10];
          float v14 = [v13 objectAtIndexedSubscript:2];
          [v14 floatValue];
          BOOL v16 = v15 > 0.15;

          if (v16)
          {
            float v17 = [v9 objectAtIndexedSubscript:16];
            float v18 = [v9 objectAtIndexedSubscript:10];
            [(VCPVideoPetsActionAnalyzer *)self normDistance:v17 point2:v18];
            float v20 = v19;

            goto LABEL_14;
          }
        }
        float v21 = [v9 objectAtIndexedSubscript:19];
        float v22 = [v21 objectAtIndexedSubscript:2];
        [v22 floatValue];
        if (v23 <= 0.15)
        {
        }
        else
        {
          float v24 = [v9 objectAtIndexedSubscript:13];
          float v25 = [v24 objectAtIndexedSubscript:2];
          [v25 floatValue];
          BOOL v27 = v26 > 0.15;

          if (v27)
          {
            v28 = [v9 objectAtIndexedSubscript:19];
            float v29 = [v9 objectAtIndexedSubscript:13];
            [(VCPVideoPetsActionAnalyzer *)self normDistance:v28 point2:v29];
            float v20 = v30;

LABEL_14:
            float v7 = v7 + v20;
            float v5 = v5 + 1.0;
          }
        }
        for (uint64_t j = 10; j != 25; ++j)
        {
          float v32 = [v9 objectAtIndexedSubscript:j];
          float v33 = [v32 objectAtIndexedSubscript:2];
          [v33 floatValue];
          BOOL v35 = v34 > 0.15;

          if (v35) {
            float v6 = v6 + 1.0;
          }
        }
        continue;
      }
    }
    uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v49 objects:v53 count:16];
  }
  while (v3);

  float v36 = 0.0;
  float v37 = 0.0;
  float v38 = 0.0;
  if (v5 >= 5.0)
  {
    unint64_t v48 = 0;
    -[VCPVideoPetsActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 12, 10, (char *)&v48 + 4, &v48, 0.0, 0.0, 0.0);
    unint64_t v40 = v48;
    LODWORD(v46) = HIDWORD(v40);
    LODWORD(v39) = v40;
    [(VCPVideoPetsActionAnalyzer *)self computeVar:15 index2:13 interVar:(char *)&v48 + 4 intraVar:&v48];
    unint64_t v41 = v48;
    [(VCPVideoPetsActionAnalyzer *)self computeVar:18 index2:16 interVar:(char *)&v48 + 4 intraVar:&v48];
    unint64_t v42 = v48;
    [(VCPVideoPetsActionAnalyzer *)self computeVar:21 index2:19 interVar:(char *)&v48 + 4 intraVar:&v48];
    float v36 = v6 / 105.0;
    float v43 = (float)(v7 / v5) * (float)((float)(v7 / v5) * 4.0);
    float v44 = sqrtf(fmaxf((float)((float)((float)((float)(v46 + 0.0) + *((float *)&v41 + 1)) + *((float *)&v42 + 1))+ *((float *)&v48 + 1))/ v43, 0.0));
    float v45 = sqrtf(fmaxf((float)((float)((float)((float)(v39 + 0.0) + *(float *)&v41) + *(float *)&v42) + *(float *)&v48) / v43, 0.0));
    float v38 = v44 + v44;
    float v37 = v45 + v45;
  }
LABEL_25:
  if (v36 > 0.5) {
    float v36 = 0.5;
  }
  self->_actionScoreAbsolute = fminf(v38 * v36, 1.0);
  self->_actionScoreRelative = fminf(v37 * v36, 1.0);
}

- (CGRect)scaleRect:(CGRect)a3 scaleX:(float)a4 scaleY:(float)a5
{
  double v5 = a4;
  double v6 = a3.origin.x * v5;
  double v7 = a5;
  double v8 = a3.origin.y * v7;
  double v9 = a3.size.width * v5;
  double v10 = a3.size.height * v7;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (float)intersectionOverUnion:(CGRect)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  CGRect v15 = CGRectIntersection(a3, a4);
  double v13 = v15.size.height;
  double v14 = v15.size.width;
  v15.origin.CGFloat x = v11;
  v15.origin.CGFloat y = v10;
  v15.size.CGFloat width = v9;
  v15.size.CGFloat height = v8;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v16 = CGRectUnion(v15, v17);
  return v14 * v13 / (v16.size.width * v16.size.height + 0.00000011920929);
}

- (int)processPets:(id)a3 petsBounds:(id)a4 dominantPetIdx:(int)a5 frame:(__CVBuffer *)a6 timestamp:(id *)a7 duration:(id *)a8 frameStats:(id)a9
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v102 = a3;
  id v103 = a4;
  id v101 = a9;
  int Width = CVPixelBufferGetWidth(a6);
  int Height = CVPixelBufferGetHeight(a6);
  int64_t var3 = a7->var3;
  *(_OWORD *)&self->_lastPetTimestamp.value = *(_OWORD *)&a7->var0;
  self->_lastPetTimestamp.CMTimeEpoch epoch = var3;
  CGRect v17 = [v102 objectAtIndexedSubscript:a5];
  float v18 = [v102 objectAtIndexedSubscript:0];
  [v102 setObject:v18 atIndexedSubscript:a5];

  [v102 setObject:v17 atIndexedSubscript:0];
  float v19 = [v103 objectAtIndexedSubscript:a5];
  self->_petRect = NSRectFromString(v19);

  double v20 = self->_petRect.size.width;
  double v21 = self->_petRect.size.height;
  float v22 = self->_petRect.origin.x + v20 * 0.5;
  float v23 = self->_petRect.origin.y + v21 * 0.5;
  if (fmax(v20, v21) < fminf(fabsf(v22 + -0.5), fabsf(v23 + -0.5)))
  {
    self->_actionScoreRelative = 0.0;
    goto LABEL_67;
  }
  v99 = (CMTime *)a7;
  v100 = self;
  if ([v17 count])
  {
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    tracker = v17;
    v98 = v17;
    uint64_t v25 = [(VCPVideoObjectTracker *)tracker countByEnumeratingWithState:&v108 objects:v117 count:16];
    if (v25)
    {
      int v95 = Height;
      int v96 = Width;
      v97 = a6;
      int v26 = 0;
      int v27 = 0;
      uint64_t v28 = *(void *)v109;
      float v29 = 1.0;
      float v30 = 0.0;
      float v31 = 0.0;
      float v32 = 1.0;
      do
      {
        uint64_t v33 = 0;
        int v34 = v26;
        v26 += v25;
        do
        {
          if (*(void *)v109 != v28) {
            objc_enumerationMutation(tracker);
          }
          BOOL v35 = *(void **)(*((void *)&v108 + 1) + 8 * v33);
          float v36 = [v35 objectAtIndexedSubscript:2];
          [v36 floatValue];
          BOOL v38 = v37 > 0.15;

          if (v38)
          {
            float v39 = [v35 objectAtIndexedSubscript:0];
            [v39 floatValue];
            if (v40 < v32) {
              float v32 = v40;
            }

            unint64_t v41 = [v35 objectAtIndexedSubscript:1];
            [v41 floatValue];
            if (v42 < v29) {
              float v29 = v42;
            }

            float v43 = [v35 objectAtIndexedSubscript:0];
            [v43 floatValue];
            if (v31 < v44) {
              float v31 = v44;
            }

            float v45 = [v35 objectAtIndexedSubscript:1];
            [v45 floatValue];
            if (v30 < v46) {
              float v30 = v46;
            }

            if (v34 + (int)v33 > 2) {
              ++v27;
            }
          }
          ++v33;
        }
        while (v25 != v33);
        uint64_t v25 = [(VCPVideoObjectTracker *)tracker countByEnumeratingWithState:&v108 objects:v117 count:16];
      }
      while (v25);

      CGRect v17 = v98;
      self = v100;
      if (v27 < 6) {
        goto LABEL_53;
      }
      float v47 = (float)(v31 + v32) * 0.5;
      float v48 = (float)(v30 + v29) * 0.5;
      float v49 = v100->_actionScoreAbsolute * 0.3;
      float v50 = v49 + 0.25;
      BOOL v51 = v49 <= 0.15;
      float v52 = 0.4;
      if (v51) {
        float v52 = v50;
      }
      float v53 = v30 - v29;
      if ((float)(v30 - v29) < (float)(v31 - v32)) {
        float v53 = v31 - v32;
      }
      float v54 = v53 * 1.2;
      if (v54 >= v52) {
        float v52 = v54;
      }
      if (v52 <= 0.5) {
        float v55 = v52;
      }
      else {
        float v55 = 0.5;
      }
      if (v96 > v95) {
        float v56 = v55;
      }
      else {
        float v56 = (float)((float)v96 / (float)v95) * v55;
      }
      if (v96 > v95) {
        float v55 = (float)((float)v95 / (float)v96) * v55;
      }
      float v57 = v100->_crop.size.width;
      float v58 = (float)(v57 * 0.8) * 0.5;
      if (v55 < v58) {
        float v55 = v58;
      }
      float v59 = v100->_crop.size.height;
      float v60 = (float)(v59 * 0.8) * 0.5;
      if (v56 >= v60) {
        float v60 = v56;
      }
      float v61 = v47 - v55;
      float v62 = 0.01;
      if ((float)(v47 - v55) < 0.01) {
        float v61 = 0.01;
      }
      float v63 = v47 + v55;
      float v64 = 0.99;
      if (v63 <= 0.99) {
        float v65 = v63;
      }
      else {
        float v65 = 0.99;
      }
      if ((float)(v48 - v60) >= 0.01) {
        float v62 = v48 - v60;
      }
      float v66 = v48 + v60;
      if (v66 <= 0.99) {
        float v64 = v66;
      }
      v100->_crop.origin.CGFloat x = v61;
      v100->_crop.origin.CGFloat y = v62;
      v100->_crop.size.CGFloat width = (float)(v65 - v61);
      v100->_crop.size.CGFloat height = (float)(v64 - v62);
      -[VCPVideoPetsActionAnalyzer scaleRect:scaleX:scaleY:](v100, "scaleRect:scaleX:scaleY:");
      double v68 = v67;
      double v70 = v69;
      double v72 = v71;
      double v74 = v73;
      long long v75 = [VCPVideoObjectTracker alloc];
      long long v106 = *(_OWORD *)&v99->value;
      CMTimeEpoch epoch = v99->epoch;
      uint64_t v76 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v75, "initWithObjectBounds:inFrame:timestamp:", v97, &v106, v68, v70, v72, v74);
      tracker = v100->_tracker;
      v100->_tracker = (VCPVideoObjectTracker *)v76;
    }

    CGRect v17 = v98;
    self = v100;
  }
LABEL_53:
  if ((unint64_t)[(NSMutableArray *)self->_bodyArray count] >= 7) {
    [(NSMutableArray *)self->_bodyArray removeObjectAtIndex:0];
  }
  [(NSMutableArray *)self->_bodyArray addObject:v17];
  if ((unint64_t)[(NSMutableArray *)self->_bodyArray count] >= 7)
  {
    [(VCPVideoPetsActionAnalyzer *)self computeActionScore];
    *(float *)&double v77 = self->_scoreAbsoluteMax;
    if (*(float *)&v77 < self->_actionScoreAbsolute) {
      *(float *)&double v77 = self->_actionScoreAbsolute;
    }
    self->_scoreAbsoluteMaCGFloat x = *(float *)&v77;
    *(float *)&double v77 = self->_scoreRelativeMax;
    if (*(float *)&v77 < self->_actionScoreRelative) {
      *(float *)&double v77 = self->_actionScoreRelative;
    }
    self->_scoreRelativeMaCGFloat x = *(float *)&v77;
    *(float *)&double v77 = self->_actionScoreRelative;
    [v101 setPetsActionScore:v77];
    long long v78 = (CMTime *)((char *)&self->_endTime.epoch + 4);
    CMTime lhs = *v99;
    CMTime rhs = *(CMTime *)((char *)&self->_endTime.epoch + 4);
    CMTimeSubtract(&time, &lhs, &rhs);
    if (CMTimeGetSeconds(&time) > 1.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v80 = VCPLogInstance();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          scoreAbsoluteMaCGFloat x = self->_scoreAbsoluteMax;
          scoreRelativeMaCGFloat x = self->_scoreRelativeMax;
          LODWORD(lhs.value) = 134218240;
          *(double *)((char *)&lhs.value + 4) = scoreAbsoluteMax;
          LOWORD(lhs.flags) = 2048;
          *(double *)((char *)&lhs.flags + 2) = scoreRelativeMax;
          _os_log_impl(&dword_1BBEDA000, v80, OS_LOG_TYPE_DEBUG, "VideoPetActionAnalyzer: _scoreAbsoluteMaCGFloat x = %f, _scoreRelativeMax =%f", (uint8_t *)&lhs, 0x16u);
        }

        self = v100;
      }
      v83 = (void *)MEMORY[0x1E4F1CA60];
      v115[0] = @"petsAbsoluteScore";
      *(float *)&double v79 = self->_scoreAbsoluteMax;
      v84 = [NSNumber numberWithFloat:v79];
      v115[1] = @"petsRelativeScore";
      v116[0] = v84;
      *(float *)&double v85 = self->_scoreRelativeMax;
      v86 = [NSNumber numberWithFloat:v85];
      v116[1] = v86;
      v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v116 forKeys:v115 count:2];
      v88 = [v83 dictionaryWithDictionary:v87];

      actionResults = v100->_actionResults;
      v113[0] = @"start";
      CMTime lhs = *v78;
      CFDictionaryRef v90 = CMTimeCopyAsDictionary(&lhs, 0);
      v114[0] = v90;
      v113[1] = @"duration";
      CMTime lhs = *v99;
      CMTime rhs = *v78;
      CMTimeSubtract(&v104, &lhs, &rhs);
      CMTime lhs = v104;
      CFDictionaryRef v91 = CMTimeCopyAsDictionary(&lhs, 0);
      v113[2] = @"attributes";
      v114[1] = v91;
      v114[2] = v88;
      v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v114 forKeys:v113 count:3];
      [(NSMutableArray *)actionResults addObject:v92];

      long long v93 = *(_OWORD *)&v99->value;
      v78->CMTimeEpoch epoch = v99->epoch;
      *(_OWORD *)&v78->value = v93;
      v100->_scoreAbsoluteMaCGFloat x = 0.0;
      v100->_scoreRelativeMaCGFloat x = 0.0;
    }
  }
  [v101 setFrameProcessedByPetsActionAnalyzer:1];
LABEL_67:

  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v98 = a6;
  CFTypeRef v131 = 0;
  id v102 = [MEMORY[0x1E4F1CA48] array];
  v100 = [MEMORY[0x1E4F1CA48] array];
  v94 = a5;
  long long v108 = self;
  size_t Width = CVPixelBufferGetWidth(a3);
  cf = a3;
  size_t Height = CVPixelBufferGetHeight(a3);
  *(float *)&double v12 = self->_actionScoreRelative;
  [v98 setPetsActionScore:v12];
  [v98 setFrameProcessedByPetsActionAnalyzer:1];
  p_timeLastProcess = &self->_timeLastProcess;
  CMTime lhs = *(CMTime *)a4;
  CMTime rhs = (CMTime)self->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= 0.150000006)
  {
    uint64_t v28 = self;
    self->_sampleFlag = 1;
  }
  else
  {
    p_crop = &self->_crop;
    if (!CGRectIsEmpty(self->_crop) && self->_tracker)
    {
      CGRect v15 = VCPSignPostLog();
      os_signpost_id_t v16 = os_signpost_id_generate(v15);

      CGRect v17 = VCPSignPostLog();
      float v18 = v17;
      unint64_t v19 = v16 - 1;
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(lhs.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "VCPVideoPetsActionTracker", "", (uint8_t *)&lhs, 2u);
      }

      id v111 = (id)Width;
      os_signpost_id_t v20 = v16;
      int v21 = [(VCPVideoObjectTracker *)v108->_tracker trackObjectInFrame:cf];
      if (v21) {
        goto LABEL_22;
      }
      float v22 = VCPSignPostLog();
      float v23 = v22;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        LOWORD(lhs.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v20, "VCPVideoPetsActionTracker", "", (uint8_t *)&lhs, 2u);
      }

      size_t Width = (size_t)v111;
      [(VCPVideoObjectTracker *)v108->_tracker objectBounds];
      -[VCPVideoPetsActionAnalyzer scaleRect:scaleX:scaleY:](v108, "scaleRect:scaleX:scaleY:");
      p_crop->origin.double x = v24;
      p_crop->origin.CGFloat y = v25;
      p_crop->size.CGFloat width = v26;
      p_crop->size.CGFloat height = v27;
    }
    uint64_t v28 = v108;
    if (!v108->_sampleFlag)
    {
      id v103 = 0;
      int v21 = 0;
      goto LABEL_78;
    }
  }
  tracker = v28->_tracker;
  v28->_tracker = 0;

  long long v30 = *(_OWORD *)&a4->var0;
  p_timeLastProcess->CMTimeEpoch epoch = a4->var3;
  *(_OWORD *)&p_timeLastProcess->value = v30;
  v108->_actionScoreAbsolute = 0.0;
  v108->_sampleFlag = 0;
  int v96 = (_OWORD *)((char *)&v108->_endTime.epoch + 4);
  if ((v108->_startTime.timescale & 1) == 0)
  {
    long long v31 = *(_OWORD *)&a4->var0;
    *(void *)&v108->_startTime.flags = a4->var3;
    *int v96 = v31;
  }
  p_double x = &v108->_crop.origin.x;
  double v33 = v108->_crop.size.width;
  double v34 = v108->_crop.size.height;
  if (fmin(v33, v34) < 0.100000001)
  {
    CGSize v35 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)p_double x = *MEMORY[0x1E4F1DB28];
    v108->_crop.size = v35;
    double v33 = v108->_crop.size.width;
    double v34 = v108->_crop.size.height;
  }
  uint64_t v36 = *(void *)p_x;
  CGFloat y = v108->_crop.origin.y;
  if (CGRectIsEmpty(*(CGRect *)(&v33 - 2)))
  {
    CFTypeRef v131 = CFRetain(cf);
    BOOL v38 = v108;
    goto LABEL_23;
  }
  v137.origin.double x = *p_x;
  v137.size.CGFloat width = v108->_crop.size.width;
  v137.size.CGFloat height = v108->_crop.size.height;
  float v39 = 1.0 - v137.size.height - v108->_crop.origin.y;
  v137.origin.CGFloat y = fmaxf(v39, 0.0);
  BOOL v38 = v108;
  int v21 = Scaler::ScaleCropped(&v108->_scaler, v137, cf, (__CVBuffer **)&v131, Width, Height, 875704422);
  if (v21)
  {
LABEL_22:
    id v103 = 0;
    goto LABEL_78;
  }
LABEL_23:
  p_lastPetTimestamp = &v38->_lastPetTimestamp;
  if (v38->_lastPetTimestamp.flags)
  {
    CMTime lhs = (CMTime)*a4;
    CMTime rhs = (CMTime)v38->_lastPetTimestamp;
    CMTimeSubtract(&v129, &lhs, &rhs);
    Float64 Seconds = CMTimeGetSeconds(&v129);
    BOOL v38 = v108;
    p_tracking = &v108->_tracking;
    v108->_tracking = Seconds < 1.0;
    if (Seconds < 1.0)
    {
      poseAnalyzer = v108->_poseAnalyzer;
      id v128 = 0;
      int v21 = [(VCPImagePetsKeypointsAnalyzer *)poseAnalyzer analyzePixelBuffer:v131 flags:a7 results:&v128 cancel:&__block_literal_global_47];
      id v43 = v128;
      id v103 = v43;
      if (v21) {
        goto LABEL_76;
      }
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      obuint64_t j = [v43 objectForKeyedSubscript:@"PetsKeypointsResults"];
      uint64_t v44 = [obj countByEnumeratingWithState:&v124 objects:v135 count:16];
      if (v44)
      {
        uint64_t v106 = v44;
        unsigned int v107 = 0;
        int v104 = 0;
        uint64_t v105 = *(void *)v125;
        float v45 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v106; ++i)
          {
            if (*(void *)v125 != v105) {
              objc_enumerationMutation(obj);
            }
            long long v109 = [*(id *)(*((void *)&v124 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
            id v112 = [v109 objectForKeyedSubscript:@"petsKeypoints"];
            float v46 = [v109 objectForKeyedSubscript:@"petsBounds"];
            NSRect v138 = NSRectFromString(v46);
            double x = v138.origin.x;
            double v48 = v138.origin.y;
            double v49 = v138.size.width;
            double v50 = v138.size.height;

            float v51 = fmax(v49, v50);
            if (v51 >= 0.1 && v51 >= 0.2)
            {
              if (v112)
              {
                v139.origin.double x = *p_x;
                v139.origin.CGFloat y = v108->_crop.origin.y;
                v139.size.CGFloat width = v108->_crop.size.width;
                v139.size.CGFloat height = v108->_crop.size.height;
                float v52 = 0.0;
                if (CGRectIsEmpty(v139))
                {
                  float v53 = v112;
                }
                else
                {
                  float v53 = [MEMORY[0x1E4F1CA48] array];
                  long long v122 = 0u;
                  long long v123 = 0u;
                  long long v120 = 0u;
                  long long v121 = 0u;
                  id v113 = v112;
                  uint64_t v54 = [v113 countByEnumeratingWithState:&v120 objects:v134 count:16];
                  if (v54)
                  {
                    uint64_t v55 = *(void *)v121;
                    do
                    {
                      for (uint64_t j = 0; j != v54; ++j)
                      {
                        if (*(void *)v121 != v55) {
                          objc_enumerationMutation(v113);
                        }
                        float v57 = *(void **)(*((void *)&v120 + 1) + 8 * j);
                        float v58 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
                        float v59 = NSNumber;
                        double v60 = *p_x;
                        float v61 = [v57 objectAtIndexedSubscript:0];
                        [v61 floatValue];
                        float v63 = [v59 numberWithDouble:v60 + v62 * v108->_crop.size.width];
                        [v58 setObject:v63 atIndexedSubscript:0];

                        float v64 = NSNumber;
                        double v65 = v108->_crop.origin.y;
                        float v66 = [v57 objectAtIndexedSubscript:1];
                        [v66 floatValue];
                        double v68 = [v64 numberWithDouble:v65 + v67 * v108->_crop.size.height];
                        [v58 setObject:v68 atIndexedSubscript:1];

                        double v69 = [v57 objectAtIndexedSubscript:2];
                        [v69 floatValue];
                        LODWORD(v65) = v70;

                        LODWORD(v71) = LODWORD(v65);
                        double v72 = [NSNumber numberWithFloat:v71];
                        [v58 setObject:v72 atIndexedSubscript:2];

                        [v53 addObject:v58];
                        if (*(float *)&v65 > 0.15) {
                          float v52 = v52 + 1.0;
                        }
                      }
                      uint64_t v54 = [v113 countByEnumeratingWithState:&v120 objects:v134 count:16];
                    }
                    while (v54);
                  }

                  id v112 = v53;
                }
                [v102 addObject:v53];
              }
              else
              {
                id v112 = 0;
                float v52 = 0.0;
              }
              v140.origin.double x = x;
              v140.origin.CGFloat y = v48;
              v140.size.CGFloat width = v49;
              v140.size.CGFloat height = v50;
              if (!CGRectIsEmpty(v140))
              {
                v141.origin.double x = *p_x;
                v141.origin.CGFloat y = v108->_crop.origin.y;
                v141.size.CGFloat width = v108->_crop.size.width;
                v141.size.CGFloat height = v108->_crop.size.height;
                if (!CGRectIsEmpty(v141))
                {
                  double v73 = v108->_crop.size.width;
                  double v74 = v108->_crop.size.height;
                  double x = *p_x + x * v73;
                  double v48 = v108->_crop.origin.y + v48 * v74;
                  double v49 = v49 * v73;
                  double v50 = v50 * v74;
                }
                v142.origin.double x = x;
                v142.origin.CGFloat y = v48;
                v142.size.CGFloat width = v49;
                v142.size.CGFloat height = v50;
                long long v75 = NSStringFromRect(v142);
                [v100 addObject:v75];

                if (!CGRectIsEmpty(v108->_petRect))
                {
                  -[VCPVideoPetsActionAnalyzer intersectionOverUnion:rect:](v108, "intersectionOverUnion:rect:", v108->_petRect.origin.x, v108->_petRect.origin.y, v108->_petRect.size.width, v108->_petRect.size.height, x, v48, v49, v50);
                  float v52 = v76 + 0.1;
                }
              }
              BOOL v77 = v52 <= v45;
              if (v52 > v45) {
                float v45 = v52;
              }
              int v78 = v107;
              if (!v77) {
                int v78 = v104;
              }
              unsigned int v107 = v78;
              ++v104;
            }
          }
          uint64_t v106 = [obj countByEnumeratingWithState:&v124 objects:v135 count:16];
        }
        while (v106);
      }
      else
      {
        unsigned int v107 = 0;
      }

      uint64_t v91 = [v100 count];
      if (v91 != [v102 count])
      {
        int v21 = -50;
        goto LABEL_76;
      }
      int v40 = 1;
      BOOL v38 = v108;
    }
    else
    {
      int v40 = 0;
      unsigned int v107 = 0;
      id v103 = 0;
    }
  }
  else
  {
    int v40 = 0;
    unsigned int v107 = 0;
    id v103 = 0;
    p_tracking = &v38->_tracking;
    v38->_tracking = 0;
  }
  CMTime lhs = (CMTime)*a4;
  CMTime rhs = (CMTime)v38->_timeLastProcessFullFrame;
  CMTimeSubtract(&v119, &lhs, &rhs);
  if (CMTimeGetSeconds(&v119) < 1.0)
  {
LABEL_71:
    if ([v102 count])
    {
      long long v116 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      long long v114 = *(_OWORD *)&v94->var0;
      int64_t v115 = v94->var3;
      int v21 = [(VCPVideoPetsActionAnalyzer *)v108 processPets:v102 petsBounds:v100 dominantPetIdx:v107 frame:cf timestamp:&v116 duration:&v114 frameStats:v98];
    }
    else
    {
      v86 = (_OWORD *)MEMORY[0x1E4F1DB28];
      CGSize v87 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      v108->_petRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      v108->_petRect.size = v87;
      if (!*p_tracking)
      {
        CGSize v88 = (CGSize)v86[1];
        *(_OWORD *)p_double x = *v86;
        v108->_crop.size = v88;
      }
      [(NSMutableArray *)v108->_bodyArray removeAllObjects];
      int v21 = 0;
      long long v89 = *(_OWORD *)&a4->var0;
      *(void *)&v108->_startTime.flags = a4->var3;
      *int v96 = v89;
    }
    goto LABEL_76;
  }
  v143.origin.double x = *p_x;
  v143.origin.CGFloat y = v108->_crop.origin.y;
  v143.size.CGFloat width = v108->_crop.size.width;
  v143.size.CGFloat height = v108->_crop.size.height;
  if ((v40 & CGRectIsEmpty(v143)) == 1)
  {
    id v79 = v103;
LABEL_68:
    long long v82 = *(_OWORD *)&a4->var0;
    v38->_timeLastProcessFullFrame.CMTimeEpoch epoch = a4->var3;
    *(_OWORD *)&v38->_timeLastProcessFullFrame.value = v82;
    v83 = [v79 objectForKeyedSubscript:@"PetsKeypointsResults"];
    BOOL v84 = [v83 count] == 0;

    if (!v84)
    {
      long long v85 = *(_OWORD *)&a4->var0;
      p_lastPetTimestamp->CMTimeEpoch epoch = a4->var3;
      *(_OWORD *)&p_lastPetTimestamp->value = v85;
    }

    goto LABEL_71;
  }
  uint64_t v80 = v108->_poseAnalyzer;
  v81 = [v98 petsDetections];
  id v118 = 0;
  int v21 = [(VCPImagePetsKeypointsAnalyzer *)v80 analyzePixelBuffer:cf flags:a7 petsDetections:v81 results:&v118 cancel:&__block_literal_global_234_0];
  id v79 = v118;

  if (!v21) {
    goto LABEL_68;
  }

LABEL_76:
  if (v131) {
    CFRelease(v131);
  }
LABEL_78:

  return v21;
}

uint64_t __79__VCPVideoPetsActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke()
{
  return 0;
}

uint64_t __79__VCPVideoPetsActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke_2()
{
  return 0;
}

- (int)finishAnalysisPass:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VideoPetActionAnalyzer: finishAnalysisPass", v5, 2u);
    }
  }
  return 0;
}

- (id)results
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_actionResults count]) {
    [v3 setObject:self->_actionResults forKeyedSubscript:@"PetsActionResults"];
  }
  return v3;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_timeOfInterest, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_poseResults, 0);
  objc_storeStrong((id *)&self->_keyPetResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_bodyArray, 0);
  objc_storeStrong((id *)&self->_poseAnalyzer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 37) = 0;
  *((_DWORD *)self + 76) = 0;
  return self;
}

@end