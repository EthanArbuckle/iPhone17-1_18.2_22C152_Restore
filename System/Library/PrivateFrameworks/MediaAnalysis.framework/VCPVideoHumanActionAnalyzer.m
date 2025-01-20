@interface VCPVideoHumanActionAnalyzer
- (CGRect)scaleRect:(CGRect)a3 scaleX:(float)a4 scaleY:(float)a5;
- (VCPVideoHumanActionAnalyzer)initWithTimeOfInterest:(id)a3 phFaces:(id)a4;
- (float)intersectionOverUnion:(CGRect)a3 rect:(CGRect)a4;
- (float)normDistance:(id)a3 point2:(id)a4;
- (id).cxx_construct;
- (id)associatePerson:(CGRect)a3 withPHFaces:(id)a4;
- (id)clipResults:(id *)a3;
- (id)privateResults;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7;
- (int)finishAnalysisPass:(id *)a3;
- (int)processPersons:(id)a3 humanBounds:(id)a4 dominantPersonIdx:(int)a5 frame:(__CVBuffer *)a6 timestamp:(id *)a7 duration:(id *)a8 frameStats:(id)a9;
- (void)addActiveResults:(id *)a3;
- (void)computeActionScore;
- (void)computeVar:(int)a3 index2:(int)a4 interVar:(float *)a5 intraVar:(float *)a6;
@end

@implementation VCPVideoHumanActionAnalyzer

- (VCPVideoHumanActionAnalyzer)initWithTimeOfInterest:(id)a3 phFaces:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v48.receiver = self;
  v48.super_class = (Class)VCPVideoHumanActionAnalyzer;
  v9 = [(VCPVideoHumanActionAnalyzer *)&v48 init];
  if (v9)
  {
    v10 = [VCPImageHumanPoseAnalyzer alloc];
    int HasANE = DeviceHasANE();
    uint64_t v12 = [(VCPImageHumanPoseAnalyzer *)v10 initWithKeypointsOption:1 aspectRatio:0 lightweight:HasANE ^ 1u forceCPU:0 sharedModel:1 flushModel:DeviceHasANE() ^ 1];
    v13 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v12;

    uint64_t v14 = MEMORY[0x1E4F1FA08];
    uint64_t v15 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *((_OWORD *)v9 + 1) = *MEMORY[0x1E4F1FA08];
    *((void *)v9 + 4) = v15;
    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    v17 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    v19 = (void *)*((void *)v9 + 16);
    *((void *)v9 + 16) = v18;

    uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
    v21 = (void *)*((void *)v9 + 17);
    *((void *)v9 + 17) = v20;

    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    v23 = (void *)*((void *)v9 + 18);
    *((void *)v9 + 18) = v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    v25 = (void *)*((void *)v9 + 19);
    *((void *)v9 + 19) = v24;

    *((_DWORD *)v9 + 18) = 0;
    uint64_t v26 = MEMORY[0x1E4F1F9F8];
    long long v27 = *MEMORY[0x1E4F1F9F8];
    *(void *)(v9 + 92) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v9 + 76) = v27;
    uint64_t v28 = *(void *)(v26 + 16);
    *(_OWORD *)(v9 + 100) = *(_OWORD *)v26;
    *(void *)(v9 + 116) = v28;
    v29 = (_OWORD *)MEMORY[0x1E4F1DB28];
    long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *((_OWORD *)v9 + 10) = *MEMORY[0x1E4F1DB28];
    *((_OWORD *)v9 + 11) = v30;
    long long v31 = v29[1];
    *((_OWORD *)v9 + 12) = *v29;
    *((_OWORD *)v9 + 13) = v31;
    *((_DWORD *)v9 + 56) = 0;
    *((_DWORD *)v9 + 57) = 0;
    *((_DWORD *)v9 + 58) = 0;
    *((_DWORD *)v9 + 59) = 0;
    uint64_t v32 = *(void *)(v26 + 16);
    *(_OWORD *)(v9 + 244) = *(_OWORD *)v26;
    *(void *)(v9 + 260) = v32;
    uint64_t v33 = *(void *)(v14 + 16);
    *(_OWORD *)(v9 + 40) = *(_OWORD *)v14;
    *((void *)v9 + 7) = v33;
    v34 = (void *)*((void *)v9 + 34);
    *((void *)v9 + 34) = 0;

    v9[280] = 0;
    objc_storeStrong((id *)v9 + 36, a3);
    uint64_t v35 = [MEMORY[0x1E4F1CA48] array];
    v36 = (void *)*((void *)v9 + 37);
    *((void *)v9 + 37) = v35;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v37 = v8;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v45 != v39) {
            objc_enumerationMutation(v37);
          }
          objc_msgSend(*((id *)v9 + 37), "addObject:", *(void *)(*((void *)&v44 + 1) + 8 * i), (void)v44);
        }
        uint64_t v38 = [v37 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v38);
    }
  }
  if (*((void *)v9 + 1)) {
    v41 = v9;
  }
  else {
    v41 = 0;
  }
  v42 = v41;

  return v42;
}

- (float)normDistance:(id)a3 point2:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectAtIndexedSubscript:0];
  [v7 floatValue];
  float v9 = v8;
  v10 = [v6 objectAtIndexedSubscript:0];
  [v10 floatValue];
  float v12 = v11;
  v13 = [v5 objectAtIndexedSubscript:0];
  [v13 floatValue];
  float v15 = v14;
  uint64_t v16 = [v6 objectAtIndexedSubscript:0];
  [v16 floatValue];
  float v18 = v17;
  v19 = [v5 objectAtIndexedSubscript:1];
  [v19 floatValue];
  float v21 = v20;
  uint64_t v22 = [v6 objectAtIndexedSubscript:1];
  [v22 floatValue];
  float v24 = v23;
  v25 = [v5 objectAtIndexedSubscript:1];
  [v25 floatValue];
  float v27 = v26;
  uint64_t v28 = [v6 objectAtIndexedSubscript:1];
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
            v13 = [v12 objectAtIndexedSubscript:a3];
            float v14 = [v13 objectAtIndexedSubscript:2];
            [v14 floatValue];
            if (v15 <= 0.1)
            {
            }
            else
            {
              uint64_t v16 = [v12 objectAtIndexedSubscript:v74];
              float v17 = [v16 objectAtIndexedSubscript:2];
              [v17 floatValue];
              BOOL v19 = v18 > 0.1;

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
                uint64_t v28 = [v27 objectAtIndexedSubscript:0];
                float v63 = v26;
                [v28 floatValue];
                float v62 = v29;

                float v30 = [v12 objectAtIndexedSubscript:a3];
                long long v31 = [v30 objectAtIndexedSubscript:1];
                [v31 floatValue];
                float v33 = v32;

                v34 = [v12 objectAtIndexedSubscript:a3];
                uint64_t v35 = [v34 objectAtIndexedSubscript:1];
                [v35 floatValue];
                float v37 = v36;
                uint64_t v38 = [v12 objectAtIndexedSubscript:a3];
                uint64_t v39 = [v38 objectAtIndexedSubscript:1];
                [v39 floatValue];
                float v41 = v40;

                v42 = [v12 objectAtIndexedSubscript:a3];
                v43 = [v42 objectAtIndexedSubscript:0];
                [v43 floatValue];
                float v45 = v44;
                long long v46 = [v12 objectAtIndexedSubscript:v74];
                long long v47 = [v46 objectAtIndexedSubscript:0];
                [v47 floatValue];
                float v49 = v48;

                uint64_t v50 = [v12 objectAtIndexedSubscript:a3];
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
        float v10 = [v9 objectAtIndexedSubscript:11];
        float v11 = [v10 objectAtIndexedSubscript:2];
        [v11 floatValue];
        if (v12 <= 0.1)
        {
        }
        else
        {
          v13 = [v9 objectAtIndexedSubscript:5];
          float v14 = [v13 objectAtIndexedSubscript:2];
          [v14 floatValue];
          BOOL v16 = v15 > 0.1;

          if (v16)
          {
            float v17 = [v9 objectAtIndexedSubscript:11];
            float v18 = [v9 objectAtIndexedSubscript:5];
            [(VCPVideoHumanActionAnalyzer *)self normDistance:v17 point2:v18];
            float v20 = v19;

            goto LABEL_14;
          }
        }
        float v21 = [v9 objectAtIndexedSubscript:12];
        float v22 = [v21 objectAtIndexedSubscript:2];
        [v22 floatValue];
        if (v23 <= 0.1)
        {
        }
        else
        {
          float v24 = [v9 objectAtIndexedSubscript:6];
          float v25 = [v24 objectAtIndexedSubscript:2];
          [v25 floatValue];
          BOOL v27 = v26 > 0.1;

          if (v27)
          {
            uint64_t v28 = [v9 objectAtIndexedSubscript:12];
            float v29 = [v9 objectAtIndexedSubscript:6];
            [(VCPVideoHumanActionAnalyzer *)self normDistance:v28 point2:v29];
            float v20 = v30;

LABEL_14:
            float v7 = v7 + v20;
            float v5 = v5 + 1.0;
          }
        }
        for (uint64_t j = 5; j != 17; ++j)
        {
          float v32 = [v9 objectAtIndexedSubscript:j];
          float v33 = [v32 objectAtIndexedSubscript:2];
          [v33 floatValue];
          BOOL v35 = v34 > 0.1;

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
    -[VCPVideoHumanActionAnalyzer computeVar:index2:interVar:intraVar:](self, "computeVar:index2:interVar:intraVar:", 9, 5, (char *)&v48 + 4, &v48, 0.0, 0.0, 0.0);
    unint64_t v40 = v48;
    LODWORD(v46) = HIDWORD(v40);
    LODWORD(v39) = v40;
    [(VCPVideoHumanActionAnalyzer *)self computeVar:10 index2:6 interVar:(char *)&v48 + 4 intraVar:&v48];
    unint64_t v41 = v48;
    [(VCPVideoHumanActionAnalyzer *)self computeVar:15 index2:11 interVar:(char *)&v48 + 4 intraVar:&v48];
    unint64_t v42 = v48;
    [(VCPVideoHumanActionAnalyzer *)self computeVar:16 index2:12 interVar:(char *)&v48 + 4 intraVar:&v48];
    float v36 = v6 / 84.0;
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
  return v14 * v13 / (v16.size.width * v16.size.height + 0.00999999978);
}

- (id)associatePerson:(CGRect)a3 withPHFaces:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  v49.origin.CGFloat x = x;
  v49.origin.CGFloat y = y;
  v49.size.double width = width;
  v49.size.double height = height;
  double MidX = CGRectGetMidX(v49);
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.double width = width;
  v50.size.double height = height;
  double MidY = CGRectGetMidY(v50);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  float v12 = self->_phFaces;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v13)
  {
    double v14 = 0;
    float v15 = MidX;
    float v16 = MidY;
    float v17 = width * height;
    float v18 = v17 * 0.7;
    float v19 = v17 * 1.3;
    float v20 = 3.4028e38;
    uint64_t v21 = *(void *)v43;
    double v22 = v16;
    double v23 = v15;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v21) {
          objc_enumerationMutation(v12);
        }
        float v25 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_msgSend(v25, "bodyWidth", (void)v42);
        double v27 = v26;
        [v25 bodyHeight];
        if (v27 * v28 > 0.0)
        {
          [v25 bodyWidth];
          double v30 = v29;
          [v25 bodyHeight];
          double v32 = v31;
          [v25 bodyCenterX];
          double v34 = v33;
          [v25 bodyCenterY];
          float v35 = v30 * v32;
          float v37 = vabdd_f64(v23, v34) + vabdd_f64(v22, v36);
          BOOL v38 = v20 > v37 && v18 < v35;
          if (v38 && v19 > v35)
          {
            id v40 = v25;

            float v20 = v37;
            double v14 = v40;
          }
        }
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v42 objects:v46 count:16];
    }
    while (v13);

    if (v14) {
      [(NSMutableArray *)self->_phFaces removeObject:v14];
    }
  }
  else
  {

    double v14 = 0;
  }

  return v14;
}

- (int)processPersons:(id)a3 humanBounds:(id)a4 dominantPersonIdx:(int)a5 frame:(__CVBuffer *)a6 timestamp:(id *)a7 duration:(id *)a8 frameStats:(id)a9
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v134 = a3;
  id v135 = a4;
  id v136 = a9;
  int Width = CVPixelBufferGetWidth(a6);
  int Height = CVPixelBufferGetHeight(a6);
  int64_t var3 = a7->var3;
  *(_OWORD *)(&self->_humanPoseScore + 1) = *(_OWORD *)&a7->var0;
  *(void *)&self->_lastHumanTimestamp.flags = var3;
  v137 = [v134 objectAtIndexedSubscript:a5];
  float v17 = [v134 objectAtIndexedSubscript:0];
  [v134 setObject:v17 atIndexedSubscript:a5];

  [v134 setObject:v137 atIndexedSubscript:0];
  float v18 = [v135 objectAtIndexedSubscript:a5];
  self->_humanRect = NSRectFromString(v18);

  double x = self->_humanRect.origin.x;
  double y = self->_humanRect.origin.y;
  double v22 = self->_humanRect.size.width;
  double v21 = self->_humanRect.size.height;
  [v136 faceArea];
  if (v23 <= 0.2
    && (float v24 = x + v22 * 0.5,
        float v25 = y + v21 * 0.5,
        fmax(self->_humanRect.size.width, self->_humanRect.size.height) >= fminf(fabsf(v24 + -0.5), fabsf(v25 + -0.5))))
  {
    p_humanRect = &self->_humanRect;
    v132 = a7;
    v133 = self;
    if ([v137 count])
    {
      long long v147 = 0u;
      long long v148 = 0u;
      long long v145 = 0u;
      long long v146 = 0u;
      id v26 = v137;
      uint64_t v27 = [v26 countByEnumeratingWithState:&v145 objects:v159 count:16];
      int v129 = Height;
      int v130 = Width;
      v128 = a6;
      if (v27)
      {
        int v28 = 0;
        int v29 = 0;
        uint64_t v30 = *(void *)v146;
        float v31 = 1.0;
        float v32 = 0.0;
        float v33 = 0.0;
        float v34 = 1.0;
        do
        {
          uint64_t v35 = 0;
          int v36 = v28;
          v28 += v27;
          do
          {
            if (*(void *)v146 != v30) {
              objc_enumerationMutation(v26);
            }
            float v37 = *(void **)(*((void *)&v145 + 1) + 8 * v35);
            BOOL v38 = [v37 objectAtIndexedSubscript:2];
            [v38 floatValue];
            BOOL v40 = v39 > 0.1;

            if (v40)
            {
              unint64_t v41 = [v37 objectAtIndexedSubscript:0];
              [v41 floatValue];
              if (v42 < v34) {
                float v34 = v42;
              }

              long long v43 = [v37 objectAtIndexedSubscript:1];
              [v43 floatValue];
              if (v44 < v31) {
                float v31 = v44;
              }

              long long v45 = [v37 objectAtIndexedSubscript:0];
              [v45 floatValue];
              if (v33 < v46) {
                float v33 = v46;
              }

              uint64_t v47 = [v37 objectAtIndexedSubscript:1];
              [v47 floatValue];
              if (v32 < v48) {
                float v32 = v48;
              }

              if (v36 + (int)v35 > 2) {
                ++v29;
              }
            }
            ++v35;
          }
          while (v27 != v35);
          uint64_t v27 = [v26 countByEnumeratingWithState:&v145 objects:v159 count:16];
        }
        while (v27);
      }
      else
      {
        int v29 = 0;
        float v31 = 1.0;
        float v32 = 0.0;
        float v33 = 0.0;
        float v34 = 1.0;
      }

      LODWORD(v50) = 1036831949;
      unint64_t v49 = +[VCPHuman flagsFromKeypoints:v26 withMinConfidence:v50];
      a7 = v132;
      self = v133;
      if ((v49 & 0x100000) != 0) {
        v133->_humanPoseScore = v133->_humanPoseScore + 0.5;
      }
      if ((v49 & 0x200000) != 0) {
        v133->_humanPoseScore = v133->_humanPoseScore + 0.5;
      }
      if (v29 >= 6)
      {
        float v51 = (float)(v33 + v34) * 0.5;
        float v52 = (float)(v32 + v31) * 0.5;
        float v53 = v133->_actionScoreAbsolute * 0.3;
        float v54 = v53 + 0.25;
        BOOL v55 = v53 <= 0.15;
        float v56 = 0.4;
        if (v55) {
          float v56 = v54;
        }
        float v57 = v32 - v31;
        if ((float)(v32 - v31) < (float)(v33 - v34)) {
          float v57 = v33 - v34;
        }
        float v58 = v57 * 1.2;
        if (v58 >= v56) {
          float v56 = v58;
        }
        if (v56 > 0.5) {
          float v56 = 0.5;
        }
        float v59 = (float)((float)v130 / (float)v129) * v56;
        if (v130 > v129)
        {
          float v59 = v56;
          float v56 = (float)((float)v129 / (float)v130) * v56;
        }
        float v60 = v133->_crop.size.width;
        float v61 = (float)(v60 * 0.8) * 0.5;
        if (v56 < v61) {
          float v56 = v61;
        }
        float v62 = v133->_crop.size.height;
        float v63 = (float)(v62 * 0.8) * 0.5;
        if (v59 >= v63) {
          float v63 = v59;
        }
        float v64 = v51 - v56;
        float v65 = 0.01;
        if ((float)(v51 - v56) < 0.01) {
          float v64 = 0.01;
        }
        float v66 = v51 + v56;
        float v67 = 0.99;
        if (v66 > 0.99) {
          float v66 = 0.99;
        }
        if ((float)(v52 - v63) >= 0.01) {
          float v65 = v52 - v63;
        }
        float v68 = v52 + v63;
        if (v68 <= 0.99) {
          float v67 = v68;
        }
        v133->_crop.origin.double x = v64;
        v133->_crop.origin.double y = v65;
        v133->_crop.size.double width = (float)(v66 - v64);
        v133->_crop.size.double height = (float)(v67 - v65);
        -[VCPVideoHumanActionAnalyzer scaleRect:scaleX:scaleY:](v133, "scaleRect:scaleX:scaleY:");
        double v70 = v69;
        double v72 = v71;
        double v74 = v73;
        double v76 = v75;
        long long v77 = [VCPVideoObjectTracker alloc];
        long long v143 = *(_OWORD *)&v132->var0;
        int64_t v144 = v132->var3;
        uint64_t v78 = -[VCPVideoObjectTracker initWithObjectBounds:inFrame:timestamp:](v77, "initWithObjectBounds:inFrame:timestamp:", v128, &v143, v70, v72, v74, v76);
        tracker = v133->_tracker;
        v133->_tracker = (VCPVideoObjectTracker *)v78;

        a7 = v132;
        self = v133;
      }
    }
    else
    {
      int v29 = 0;
      unint64_t v49 = 0;
    }
    float v80 = fmin(fmax(p_humanRect->size.width, p_humanRect->size.height), 0.5);
    self->_humanPoseScore = self->_humanPoseScore * (float)(v80 + 0.5);
    objc_msgSend(v136, "setHumanPoseScore:");
    if ((unint64_t)[(NSMutableArray *)self->_bodyArray count] >= 7) {
      [(NSMutableArray *)self->_bodyArray removeObjectAtIndex:0];
    }
    [(NSMutableArray *)self->_bodyArray addObject:v137];
    if (v29 >= 6)
    {
      v157[0] = @"humanKeypoints";
      v157[1] = @"humanBounds";
      v158[0] = v134;
      v158[1] = v135;
      v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v158 forKeys:v157 count:2];
      keyPersonResults = self->_keyPersonResults;
      v155[0] = @"start";
      CMTime time = (CMTime)*a7;
      CFDictionaryRef v83 = CMTimeCopyAsDictionary(&time, 0);
      v156[0] = v83;
      v155[1] = @"duration";
      CMTimeMake(&v142, 150, 1000);
      CMTime time = v142;
      CFDictionaryRef v84 = CMTimeCopyAsDictionary(&time, 0);
      v156[1] = v84;
      v155[2] = @"flags";
      v85 = [NSNumber numberWithUnsignedLongLong:v49];
      v155[3] = @"attributes";
      v156[2] = v85;
      v156[3] = v81;
      v86 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v156 forKeys:v155 count:4];
      [(NSMutableArray *)keyPersonResults addObject:v86];

      a7 = v132;
      self = v133;
    }
    if ((unint64_t)[(NSMutableArray *)self->_bodyArray count] >= 7)
    {
      [(VCPVideoHumanActionAnalyzer *)self computeActionScore];
      *(float *)&double v87 = self->_scoreAbsoluteMax;
      if (*(float *)&v87 < self->_actionScoreAbsolute) {
        *(float *)&double v87 = self->_actionScoreAbsolute;
      }
      self->_scoreAbsoluteMadouble x = *(float *)&v87;
      *(float *)&double v87 = self->_scoreRelativeMax;
      if (*(float *)&v87 < self->_actionScoreRelative) {
        *(float *)&double v87 = self->_actionScoreRelative;
      }
      self->_scoreRelativeMadouble x = *(float *)&v87;
      *(float *)&double v87 = self->_actionScoreRelative;
      [v136 setHumanActionScore:v87];
      v88 = (_OWORD *)((char *)&self->_endTime.epoch + 4);
      CMTime time = (CMTime)*a7;
      CMTime rhs = *(CMTime *)((char *)&self->_endTime.epoch + 4);
      CMTimeSubtract(&v141, &time, &rhs);
      Float64 Seconds = CMTimeGetSeconds(&v141);
      if (Seconds > 1.0)
      {
        v90 = (void *)MEMORY[0x1E4F1CA60];
        v153[0] = @"absoluteScore";
        *(float *)&Float64 Seconds = self->_scoreAbsoluteMax;
        v91 = [NSNumber numberWithFloat:Seconds];
        v154[0] = v91;
        v153[1] = @"relativeScore";
        *(float *)&double v92 = self->_scoreRelativeMax;
        v93 = [NSNumber numberWithFloat:v92];
        v154[1] = v93;
        v153[2] = @"humanScore";
        *(float *)&double v94 = self->_humanPoseScore;
        v95 = [NSNumber numberWithFloat:v94];
        v154[2] = v95;
        v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v154 forKeys:v153 count:3];
        v97 = [v90 dictionaryWithDictionary:v96];

        v98 = v133;
        if (v133->_timeOfInterest)
        {
          uint64_t v99 = [(NSMutableArray *)v133->_phFaces count];
          v98 = v133;
          if (v99)
          {
            [(NSNumber *)v133->_timeOfInterest floatValue];
            float v101 = v100;
            CMTime v140 = (CMTime)*v132;
            Float64 v102 = CMTimeGetSeconds(&v140);
            double v103 = v101;
            v98 = v133;
            if (v102 > v103)
            {
              *(_OWORD *)&v139.value = *v88;
              v139.epoch = *(void *)&self->_startTime.flags;
              Float64 v104 = CMTimeGetSeconds(&v139);
              v98 = v133;
              if (v104 < v103)
              {
                v105 = -[VCPVideoHumanActionAnalyzer associatePerson:withPHFaces:](v133, "associatePerson:withPHFaces:", v133->_phFaces, p_humanRect->origin.x, p_humanRect->origin.y, p_humanRect->size.width, p_humanRect->size.height);
                v106 = v105;
                if (v105)
                {
                  v107 = [v105 localIdentifier];
                  BOOL v108 = v107 == 0;

                  if (!v108)
                  {
                    v109 = [v106 localIdentifier];
                    [v97 setObject:v109 forKeyedSubscript:@"faceIdentifier"];

                    [v106 bodyCenterX];
                    double v111 = v110;
                    [v106 bodyWidth];
                    double v113 = v112;
                    [v106 bodyCenterY];
                    double v115 = v114;
                    [v106 bodyHeight];
                    double v117 = v116;
                    [v106 bodyWidth];
                    CGFloat v119 = v118;
                    [v106 bodyHeight];
                    v161.size.double height = v120;
                    v161.origin.double x = v111 + v113 * -0.5;
                    v161.origin.double y = v115 + v117 * -0.5;
                    v161.size.double width = v119;
                    v121 = NSStringFromRect(v161);
                    [v97 setObject:v121 forKeyedSubscript:@"humanBounds"];
                  }
                }

                v98 = v133;
              }
            }
          }
        }
        actionResults = v98->_actionResults;
        *(_OWORD *)&time.value = *v88;
        time.epoch = *(void *)&self->_startTime.flags;
        v151[0] = @"start";
        CFDictionaryRef v123 = CMTimeCopyAsDictionary(&time, 0);
        v152[0] = v123;
        v151[1] = @"duration";
        CMTime time = (CMTime)*v132;
        *(_OWORD *)&rhs.value = *v88;
        rhs.epoch = *(void *)&self->_startTime.flags;
        CMTimeSubtract(&v138, &time, &rhs);
        CMTime time = v138;
        CFDictionaryRef v124 = CMTimeCopyAsDictionary(&time, 0);
        v151[2] = @"attributes";
        v152[1] = v124;
        v152[2] = v97;
        v125 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v152 forKeys:v151 count:3];
        [(NSMutableArray *)actionResults addObject:v125];

        long long v126 = *(_OWORD *)&v132->var0;
        *(void *)&self->_startTime.flags = v132->var3;
        _OWORD *v88 = v126;
        v133->_scoreAbsoluteMadouble x = 0.0;
        v133->_scoreRelativeMadouble x = 0.0;
      }
    }
    [v136 setFrameProcessedByHumanAnalyzer:1];
  }
  else
  {
    self->_humanPoseScore = 0.0;
    self->_actionScoreRelative = 0.0;
  }

  return 0;
}

- (void)addActiveResults:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_activePoseResults count])
  {
    p_timeLastProcessFullFrame = (CMTime *)&self->_timeLastProcessFullFrame;
    if (self->_timeLastProcessFullFrame.flags)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      float v20 = self;
      obuint64_t j = self->_activePoseResults;
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v6)
      {
        uint64_t v19 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(obj);
            }
            CGFloat v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v30[0] = @"humanBounds";
            [v8 bounds];
            id v9 = NSStringFromRect(v34);
            v30[1] = @"humanConfidence";
            v31[0] = v9;
            CGFloat v10 = NSNumber;
            [v8 confidence];
            CGFloat v11 = objc_msgSend(v10, "numberWithFloat:");
            v31[1] = v11;
            float v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

            poseResults = v20->_poseResults;
            v28[0] = @"start";
            CMTime time = *p_timeLastProcessFullFrame;
            CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time, 0);
            v29[0] = v14;
            v28[1] = @"duration";
            CMTime time = (CMTime)*a3;
            CMTime rhs = *p_timeLastProcessFullFrame;
            CMTimeSubtract(&v21, &time, &rhs);
            CMTime time = v21;
            CFDictionaryRef v15 = CMTimeCopyAsDictionary(&time, 0);
            v29[1] = v15;
            v28[2] = @"flags";
            float v16 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "flags"));
            v28[3] = @"attributes";
            v29[2] = v16;
            v29[3] = v12;
            float v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:4];
            [(NSMutableArray *)poseResults addObject:v17];
          }
          uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v22 objects:v32 count:16];
        }
        while (v6);
      }
    }
  }
}

- (int)analyzeFrame:(__CVBuffer *)a3 timestamp:(id *)a4 duration:(id *)a5 frameStats:(id)a6 flags:(unint64_t *)a7
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v114 = a6;
  CFTypeRef v156 = 0;
  double v113 = [MEMORY[0x1E4F1CA48] array];
  double v111 = [MEMORY[0x1E4F1CA48] array];
  v107 = a5;
  int v130 = self;
  size_t Width = CVPixelBufferGetWidth(a3);
  cf = a3;
  size_t Height = CVPixelBufferGetHeight(a3);
  *(float *)&double v12 = v130->_humanPoseScore;
  [v114 setHumanPoseScore:v12];
  *(float *)&double v13 = v130->_actionScoreRelative;
  [v114 setHumanActionScore:v13];
  [v114 setFrameProcessedByHumanAnalyzer:1];
  CMTime lhs = *(CMTime *)a4;
  CMTime rhs = (CMTime)v130->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) < 0.150000006)
  {
    if (!CGRectIsEmpty(v130->_crop))
    {
      tracker = v130->_tracker;
      if (tracker)
      {
        int v15 = [(VCPVideoObjectTracker *)tracker trackObjectInFrame:cf];
        if (v15) {
          goto LABEL_14;
        }
        [(VCPVideoObjectTracker *)v130->_tracker objectBounds];
        -[VCPVideoHumanActionAnalyzer scaleRect:scaleX:scaleY:](v130, "scaleRect:scaleX:scaleY:");
        v130->_crop.origin.double x = v16;
        v130->_crop.origin.CGFloat y = v17;
        v130->_crop.size.double width = v18;
        v130->_crop.size.double height = v19;
      }
    }
    if (![v114 frameProcessedByFaceDetector])
    {
      uint64_t v30 = 0;
      float v31 = 0;
      int v15 = 0;
      goto LABEL_50;
    }
  }
  float v20 = v130->_tracker;
  v130->_tracker = 0;

  long long v21 = *(_OWORD *)&a4->var0;
  v130->_timeLastProcess.epoch = a4->var3;
  *(_OWORD *)&v130->_timeLastProcess.value = v21;
  v130->_humanPoseScore = 0.0;
  v130->_actionScoreAbsolute = 0.0;
  v106 = (_OWORD *)((char *)&v130->_endTime.epoch + 4);
  if ((v130->_startTime.timescale & 1) == 0)
  {
    long long v22 = *(_OWORD *)&a4->var0;
    *(void *)&v130->_startTime.flags = a4->var3;
    _OWORD *v106 = v22;
  }
  p_double x = &v130->_crop.origin.x;
  double v24 = v130->_crop.size.width;
  double v25 = v130->_crop.size.height;
  if (fmin(v24, v25) < 0.100000001)
  {
    CGSize v26 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)p_double x = *MEMORY[0x1E4F1DB28];
    v130->_crop.size = v26;
    double v24 = v130->_crop.size.width;
    double v25 = v130->_crop.size.height;
  }
  uint64_t v27 = *(void *)p_x;
  CGFloat y = v130->_crop.origin.y;
  if (CGRectIsEmpty(*(CGRect *)(&v24 - 2)))
  {
    CFTypeRef v156 = CFRetain(cf);
    goto LABEL_15;
  }
  v163.origin.double x = *p_x;
  v163.size.double width = v130->_crop.size.width;
  v163.size.double height = v130->_crop.size.height;
  float v29 = 1.0 - v163.size.height - v130->_crop.origin.y;
  v163.origin.CGFloat y = fmaxf(v29, 0.0);
  int v15 = Scaler::ScaleCropped(&v130->_scaler, v163, cf, (__CVBuffer **)&v156, Width, Height, 875704422);
  if (v15)
  {
LABEL_14:
    uint64_t v30 = 0;
    float v31 = 0;
    goto LABEL_50;
  }
LABEL_15:
  float v32 = v130;
  if (v130->_lastHumanTimestamp.timescale)
  {
    CMTime lhs = (CMTime)*a4;
    CMTime rhs = *(CMTime *)(&v130->_humanPoseScore + 1);
    CMTimeSubtract(&v154, &lhs, &rhs);
    Float64 Seconds = CMTimeGetSeconds(&v154);
    float v32 = v130;
    p_tracking = &v130->_tracking;
    v130->_tracking = Seconds < 1.0;
    if (Seconds < 1.0)
    {
      [(VCPImageHumanPoseAnalyzer *)v130->_poseAnalyzer setTrackingMode:1];
      poseAnalyzer = v130->_poseAnalyzer;
      id v153 = 0;
      int v15 = [(VCPImageHumanPoseAnalyzer *)poseAnalyzer analyzePixelBuffer:v156 flags:a7 results:&v153 cancel:&__block_literal_global_94];
      id v36 = v153;
      v109 = v36;
      if (v15)
      {
        CGFloat v119 = 0;
        goto LABEL_48;
      }
      long long v151 = 0u;
      long long v152 = 0u;
      long long v149 = 0u;
      long long v150 = 0u;
      id v117 = [v36 objectForKeyedSubscript:@"HumanPoseResults"];
      uint64_t v62 = [v117 countByEnumeratingWithState:&v149 objects:v161 count:16];
      if (v62)
      {
        uint64_t v122 = v62;
        unsigned int v118 = 0;
        int v116 = 0;
        CGFloat v119 = 0;
        uint64_t v120 = *(void *)v150;
        float v115 = 0.0;
        do
        {
          for (id obja = 0; obja != (id)v122; id obja = (char *)obja + 1)
          {
            if (*(void *)v150 != v120) {
              objc_enumerationMutation(v117);
            }
            float v63 = *(void **)(*((void *)&v149 + 1) + 8 * (void)obja);
            int v129 = [v63 objectForKeyedSubscript:@"attributes"];
            id v131 = [v129 objectForKeyedSubscript:@"humanKeypoints"];
            float v64 = [v63 objectForKeyedSubscript:@"flags"];
            uint64_t v125 = [v64 unsignedIntegerValue];

            float v65 = [v129 objectForKeyedSubscript:@"humanBounds"];
            NSRect v166 = NSRectFromString(v65);
            double x = v166.origin.x;
            double v67 = v166.origin.y;
            double v68 = v166.size.width;
            double v69 = v166.size.height;

            double v70 = [v129 objectForKeyedSubscript:@"humanConfidence"];
            [v70 floatValue];
            int v123 = v71;

            float v72 = fmax(v68, v69);
            if (v72 >= 0.1 && (v72 >= 0.2 || (v125 & 0x100000) != 0))
            {
              if (v131)
              {
                v167.origin.double x = *p_x;
                v167.origin.CGFloat y = v130->_crop.origin.y;
                v167.size.double width = v130->_crop.size.width;
                v167.size.double height = v130->_crop.size.height;
                float v74 = 0.0;
                if (CGRectIsEmpty(v167))
                {
                  double v75 = v131;
                }
                else
                {
                  double v75 = [MEMORY[0x1E4F1CA48] array];
                  long long v147 = 0u;
                  long long v148 = 0u;
                  long long v145 = 0u;
                  long long v146 = 0u;
                  id v132 = v131;
                  uint64_t v76 = [v132 countByEnumeratingWithState:&v145 objects:v160 count:16];
                  if (v76)
                  {
                    uint64_t v77 = *(void *)v146;
                    do
                    {
                      for (uint64_t i = 0; i != v76; ++i)
                      {
                        if (*(void *)v146 != v77) {
                          objc_enumerationMutation(v132);
                        }
                        v79 = *(void **)(*((void *)&v145 + 1) + 8 * i);
                        float v80 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
                        v81 = NSNumber;
                        double v82 = *p_x;
                        CFDictionaryRef v83 = [v79 objectAtIndexedSubscript:0];
                        [v83 floatValue];
                        v85 = [v81 numberWithDouble:v82 + v84 * v130->_crop.size.width];
                        [v80 setObject:v85 atIndexedSubscript:0];

                        v86 = NSNumber;
                        double v87 = v130->_crop.origin.y;
                        v88 = [v79 objectAtIndexedSubscript:1];
                        [v88 floatValue];
                        v90 = [v86 numberWithDouble:v87 + v89 * v130->_crop.size.height];
                        [v80 setObject:v90 atIndexedSubscript:1];

                        v91 = [v79 objectAtIndexedSubscript:2];
                        [v91 floatValue];
                        LODWORD(v87) = v92;

                        LODWORD(v93) = LODWORD(v87);
                        double v94 = [NSNumber numberWithFloat:v93];
                        [v80 setObject:v94 atIndexedSubscript:2];

                        [v75 addObject:v80];
                        if (*(float *)&v87 > 0.1) {
                          float v74 = v74 + 1.0;
                        }
                      }
                      uint64_t v76 = [v132 countByEnumeratingWithState:&v145 objects:v160 count:16];
                    }
                    while (v76);
                  }

                  id v131 = v75;
                }
                [v113 addObject:v75];
              }
              else
              {
                id v131 = 0;
                float v74 = 0.0;
              }
              v168.origin.double x = x;
              v168.origin.CGFloat y = v67;
              v168.size.double width = v68;
              v168.size.double height = v69;
              if (CGRectIsEmpty(v168))
              {
                v95 = v119;
              }
              else
              {
                v169.origin.double x = *p_x;
                v169.origin.CGFloat y = v130->_crop.origin.y;
                v169.size.double width = v130->_crop.size.width;
                v169.size.double height = v130->_crop.size.height;
                if (!CGRectIsEmpty(v169))
                {
                  double v96 = v130->_crop.size.width;
                  double v97 = v130->_crop.size.height;
                  double x = *p_x + x * v96;
                  double v67 = v130->_crop.origin.y + v67 * v97;
                  double v68 = v68 * v96;
                  double v69 = v69 * v97;
                }
                v170.origin.double x = x;
                v170.origin.CGFloat y = v67;
                v170.size.double width = v68;
                v170.size.double height = v69;
                v98 = NSStringFromRect(v170);
                [v111 addObject:v98];

                if (!CGRectIsEmpty(v130->_humanRect))
                {
                  -[VCPVideoHumanActionAnalyzer intersectionOverUnion:rect:](v130, "intersectionOverUnion:rect:", v130->_humanRect.origin.x, v130->_humanRect.origin.y, v130->_humanRect.size.width, v130->_humanRect.size.height, x, v67, v68, v69);
                  float v74 = v99 + 0.1;
                }
                v95 = objc_alloc_init(VCPHuman);

                [(VCPHuman *)v95 setFlags:v125];
                LODWORD(v100) = v123;
                [(VCPHuman *)v95 setConfidence:v100];
                -[VCPHuman setBounds:](v95, "setBounds:", x, v67, v68, v69);
              }
              float v101 = v115;
              BOOL v102 = v74 <= v115;
              if (v74 > v115) {
                float v101 = v74;
              }
              float v115 = v101;
              int v103 = v118;
              if (!v102) {
                int v103 = v116;
              }
              unsigned int v118 = v103;
              ++v116;
              CGFloat v119 = v95;
            }
          }
          uint64_t v122 = [v117 countByEnumeratingWithState:&v149 objects:v161 count:16];
        }
        while (v122);
      }
      else
      {
        unsigned int v118 = 0;
        CGFloat v119 = 0;
      }

      uint64_t v104 = [v111 count];
      if (v104 != [v113 count])
      {
        int v15 = -50;
        goto LABEL_48;
      }
      int v33 = 1;
      float v32 = v130;
    }
    else
    {
      int v33 = 0;
      unsigned int v118 = 0;
      CGFloat v119 = 0;
      v109 = 0;
    }
  }
  else
  {
    int v33 = 0;
    unsigned int v118 = 0;
    CGFloat v119 = 0;
    v109 = 0;
    p_tracking = &v130->_tracking;
    v130->_tracking = 0;
  }
  p_timeLastProcessFullFrame = &v32->_timeLastProcessFullFrame;
  CMTime lhs = (CMTime)*a4;
  CMTime rhs = (CMTime)v32->_timeLastProcessFullFrame;
  CMTimeSubtract(&v144, &lhs, &rhs);
  if (CMTimeGetSeconds(&v144) < 1.0)
  {
LABEL_43:
    if ([v113 count])
    {
      long long v135 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      long long v133 = *(_OWORD *)&v107->var0;
      int64_t v134 = v107->var3;
      int v15 = [(VCPVideoHumanActionAnalyzer *)v130 processPersons:v113 humanBounds:v111 dominantPersonIdx:v118 frame:cf timestamp:&v135 duration:&v133 frameStats:v114];
    }
    else
    {
      float v57 = (_OWORD *)MEMORY[0x1E4F1DB28];
      CGSize v58 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      v130->_humanRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      v130->_humanRect.size = v58;
      if (!*p_tracking)
      {
        CGSize v59 = (CGSize)v57[1];
        *(_OWORD *)p_double x = *v57;
        v130->_crop.size = v59;
      }
      [(NSMutableArray *)v130->_bodyArray removeAllObjects];
      int v15 = 0;
      long long v60 = *(_OWORD *)&a4->var0;
      *(void *)&v130->_startTime.flags = a4->var3;
      _OWORD *v106 = v60;
    }
    goto LABEL_48;
  }
  v121 = p_timeLastProcessFullFrame;
  v164.origin.double x = *p_x;
  v164.origin.CGFloat y = v130->_crop.origin.y;
  v164.size.double width = v130->_crop.size.width;
  v164.size.double height = v130->_crop.size.height;
  if ((v33 & CGRectIsEmpty(v164)) == 1)
  {
    id v38 = v109;
LABEL_27:
    long long v141 = *(_OWORD *)&a4->var0;
    int64_t v142 = a4->var3;
    [(VCPVideoHumanActionAnalyzer *)v130 addActiveResults:&v141];
    [(NSMutableArray *)v130->_activePoseResults removeAllObjects];
    unint64_t v41 = objc_msgSend(v38, "objectForKeyedSubscript:");
    CFDictionaryRef v124 = v38;
    unint64_t v42 = [v41 count];
    if (v42 <= [v111 count] && objc_msgSend(v111, "count") == 1)
    {

      if (v119)
      {
        [(NSMutableArray *)v130->_activePoseResults addObject:v119];
LABEL_40:
        long long v53 = *(_OWORD *)&a4->var0;
        v121->epoch = a4->var3;
        *(_OWORD *)&v121->value = v53;
        float v54 = [v38 objectForKeyedSubscript:@"HumanPoseResults"];
        BOOL v55 = [v54 count] == 0;

        if (!v55)
        {
          long long v56 = *(_OWORD *)&a4->var0;
          *(void *)&v130->_lastHumanTimestamp.flags = a4->var3;
          *(_OWORD *)(&v130->_humanPoseScore + 1) = v56;
        }

        goto LABEL_43;
      }
    }
    else
    {
    }
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    long long v43 = [v38 objectForKeyedSubscript:@"HumanPoseResults"];
    obuint64_t j = v43;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v137 objects:v159 count:16];
    if (v44)
    {
      uint64_t v128 = *(void *)v138;
      do
      {
        for (uint64_t j = 0; j != v44; ++j)
        {
          if (*(void *)v138 != v128) {
            objc_enumerationMutation(obj);
          }
          float v46 = *(void **)(*((void *)&v137 + 1) + 8 * j);
          uint64_t v47 = [v46 objectForKeyedSubscript:@"attributes"];
          float v48 = [v46 objectForKeyedSubscript:@"flags"];
          uint64_t v49 = [v48 unsignedIntegerValue];

          double v50 = objc_alloc_init(VCPHuman);
          [(VCPHuman *)v50 setFlags:v49];
          float v51 = [v47 objectForKeyedSubscript:@"humanBounds"];
          NSRect v165 = NSRectFromString(v51);
          -[VCPHuman setBounds:](v50, "setBounds:", v165.origin.x, v165.origin.y, v165.size.width, v165.size.height);

          float v52 = [v47 objectForKeyedSubscript:@"humanConfidence"];
          [v52 floatValue];
          -[VCPHuman setConfidence:](v50, "setConfidence:");

          [(NSMutableArray *)v130->_activePoseResults addObject:v50];
        }
        long long v43 = obj;
        uint64_t v44 = [obj countByEnumeratingWithState:&v137 objects:v159 count:16];
      }
      while (v44);
    }

    id v38 = v124;
    goto LABEL_40;
  }
  float v39 = v130->_poseAnalyzer;
  id v143 = 0;
  int v15 = [(VCPImageHumanPoseAnalyzer *)v39 analyzePixelBuffer:cf flags:a7 results:&v143 cancel:&__block_literal_global_234_1];
  id v40 = v143;
  id v38 = v40;
  if (!v15) {
    goto LABEL_27;
  }

LABEL_48:
  float v31 = v109;
  uint64_t v30 = v119;
  if (v156) {
    CFRelease(v156);
  }
LABEL_50:

  return v15;
}

uint64_t __80__VCPVideoHumanActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke()
{
  return 0;
}

uint64_t __80__VCPVideoHumanActionAnalyzer_analyzeFrame_timestamp_duration_frameStats_flags___block_invoke_2()
{
  return 0;
}

- (int)finishAnalysisPass:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a3->var1;
  [(VCPVideoHumanActionAnalyzer *)self addActiveResults:&var1];
  [(NSMutableArray *)self->_activePoseResults removeAllObjects];
  return 0;
}

- (id)clipResults:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  NSRect v34 = [MEMORY[0x1E4F1CA48] array];
  int v33 = [MEMORY[0x1E4F1CA48] array];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = self->_actionResults;
  uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v4)
  {
    uint64_t v35 = *(void *)v46;
    do
    {
      uint64_t v36 = v4;
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v46 != v35) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v6 = *(const __CFDictionary **)(*((void *)&v45 + 1) + 8 * i);
        memset(&v44, 0, sizeof(v44));
        CMTimeRangeMakeFromDictionary(&v44, v6);
        long long v7 = *(_OWORD *)&a3->var0.var3;
        *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
        *(_OWORD *)&range.start.epoch = v7;
        *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
        memset(&v43, 0, sizeof(v43));
        CMTimeRange otherRange = v44;
        CMTimeRangeGetIntersection(&v43, &range, &otherRange);
        if ((v43.start.flags & 1) != 0
          && (v43.duration.flags & 1) != 0
          && !v43.duration.epoch
          && (v43.duration.value & 0x8000000000000000) == 0)
        {
          CMTime time1 = v43.duration;
          CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
          if (!CMTimeCompare(&time1, &time2)) {
            continue;
          }
        }
        v58[0] = @"start";
        CMTime time = v43.start;
        CFDictionaryRef v8 = CMTimeCopyAsDictionary(&time, 0);
        v59[0] = v8;
        v58[1] = @"duration";
        CMTime time = v43.duration;
        CFDictionaryRef v9 = CMTimeCopyAsDictionary(&time, 0);
        v59[1] = v9;
        v58[2] = @"quality";
        CGFloat v10 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"attributes"];
        CGFloat v11 = [v10 objectForKeyedSubscript:@"humanScore"];
        v59[2] = v11;
        double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
        [v34 addObject:v12];

        v56[0] = @"start";
        CMTime time = v43.start;
        CFDictionaryRef v13 = CMTimeCopyAsDictionary(&time, 0);
        v57[0] = v13;
        v56[1] = @"duration";
        CMTime time = v43.duration;
        CFDictionaryRef v14 = CMTimeCopyAsDictionary(&time, 0);
        v57[1] = v14;
        v56[2] = @"quality";
        int v15 = [(__CFDictionary *)v6 objectForKeyedSubscript:@"attributes"];
        CGFloat v16 = [v15 objectForKeyedSubscript:@"absoluteScore"];
        v57[2] = v16;
        CGFloat v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];
        [v33 addObject:v17];
      }
      uint64_t v4 = [(NSMutableArray *)obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v4);
  }

  memset(&time, 0, sizeof(time));
  long long v18 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&v37.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&v37.start.epoch = v18;
  *(_OWORD *)&v37.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v38, &v37);
  v44.start = v38;
  *(_OWORD *)&v43.start.value = *(_OWORD *)((char *)&self->_endTime.epoch + 4);
  v43.start.epoch = *(void *)&self->_startTime.flags;
  CMTimeSubtract(&time, &v44.start, &v43.start);
  v54[0] = @"start";
  *(_OWORD *)&v44.start.value = *(_OWORD *)((char *)&self->_endTime.epoch + 4);
  v44.start.epoch = *(void *)&self->_startTime.flags;
  CFDictionaryRef v19 = CMTimeCopyAsDictionary(&v44.start, 0);
  v55[0] = v19;
  v54[1] = @"duration";
  v44.start = time;
  CFDictionaryRef v20 = CMTimeCopyAsDictionary(&v44.start, 0);
  v55[1] = v20;
  v54[2] = @"quality";
  *(float *)&double v21 = self->_humanPoseScore;
  long long v22 = [NSNumber numberWithFloat:v21];
  v55[2] = v22;
  long long v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
  [v34 addObject:v23];

  v52[0] = @"start";
  *(_OWORD *)&v44.start.value = *(_OWORD *)((char *)&self->_endTime.epoch + 4);
  v44.start.epoch = *(void *)&self->_startTime.flags;
  CFDictionaryRef v24 = CMTimeCopyAsDictionary(&v44.start, 0);
  v53[0] = v24;
  v52[1] = @"duration";
  v44.start = time;
  CFDictionaryRef v25 = CMTimeCopyAsDictionary(&v44.start, 0);
  v53[1] = v25;
  v52[2] = @"quality";
  *(float *)&double v26 = self->_scoreAbsoluteMax;
  uint64_t v27 = [NSNumber numberWithFloat:v26];
  v53[2] = v27;
  int v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
  [v33 addObject:v28];

  v50[0] = @"HumanActionResults";
  v50[1] = @"HumanPoseResults";
  v51[0] = v33;
  v51[1] = v34;
  float v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];

  return v29;
}

- (id)results
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_poseResults count]) {
    [v3 setObject:self->_poseResults forKeyedSubscript:@"HumanPoseResults"];
  }
  if ([(NSMutableArray *)self->_actionResults count]) {
    [v3 setObject:self->_actionResults forKeyedSubscript:@"HumanActionResults"];
  }
  return v3;
}

- (id)privateResults
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_keyPersonResults count];
  if (v3)
  {
    keyPersonResults = self->_keyPersonResults;
    CFDictionaryRef v6 = @"HumanPoseInternalResults";
    v7[0] = keyPersonResults;
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  }
  return v3;
}

- (void).cxx_destruct
{
  p_scaler = &self->_scaler;
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_scaler.transfer_session_.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&p_scaler->pool_.value_);
  objc_storeStrong((id *)&self->_phFaces, 0);
  objc_storeStrong((id *)&self->_timeOfInterest, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_activePoseResults, 0);
  objc_storeStrong((id *)&self->_poseResults, 0);
  objc_storeStrong((id *)&self->_keyPersonResults, 0);
  objc_storeStrong((id *)&self->_actionResults, 0);
  objc_storeStrong((id *)&self->_bodyArray, 0);
  objc_storeStrong((id *)&self->_poseAnalyzer, 0);
}

- (id).cxx_construct
{
  *((void *)self + 39) = 0;
  *((_DWORD *)self + 80) = 0;
  return self;
}

@end