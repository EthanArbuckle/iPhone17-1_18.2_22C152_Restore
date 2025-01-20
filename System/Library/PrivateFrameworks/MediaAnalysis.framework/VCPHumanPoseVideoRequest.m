@interface VCPHumanPoseVideoRequest
- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4;
- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4;
- (VCPHumanPoseVideoRequest)init;
- (VCPHumanPoseVideoRequest)initWithOptions:(id)a3;
- (float)bodyDistance:(id)a3 withBodyB:(id)a4;
- (float)normDistance:(CGPoint)a3 point2:(CGPoint)a4;
- (id)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withOptions:(id)a4 error:(id *)a5;
- (int)associatePersons:(id)a3 withExisingPersons:(id)a4;
- (unsigned)preferredPixelFormat;
- (void)computeActionScoreForPerson:(id)a3;
- (void)computeVarWithID:(id)a3 index1:(int)a4 index2:(int)a5 interVar:(float *)a6 intraVar:(float *)a7;
@end

@implementation VCPHumanPoseVideoRequest

- (VCPHumanPoseVideoRequest)init
{
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "Not implemented, please use initWithOptions", v5, 2u);
    }
  }
  return 0;
}

- (VCPHumanPoseVideoRequest)initWithOptions:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCPHumanPoseVideoRequest;
  v5 = [(VCPRequest *)&v19 initWithOptions:v4];
  v7 = v5;
  if (v5)
  {
    int width = v5->super._width;
    if (width < 1 || (int height = v5->super._height, height < 1))
    {
      v10 = 0;
    }
    else
    {
      *(float *)&double v6 = (float)width / (float)height;
      v10 = [NSNumber numberWithFloat:v6];
    }
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    existingPersonsArray = v7->_existingPersonsArray;
    v7->_existingPersonsArray = (NSMutableArray *)v11;

    v13 = [[VCPImageHumanPoseAnalyzer alloc] initWithKeypointsOption:1 aspectRatio:v10 lightweight:0 forceCPU:v7->super._useCPUOnly sharedModel:0 flushModel:0];
    analyzer = v7->_analyzer;
    v7->_analyzer = v13;

    v15 = v7->_analyzer;
    if (v15) {
      [(VCPImageHumanPoseAnalyzer *)v15 preferredInputFormat:&v7->_personID height:&v7->_preferredWidth format:&v7->_preferredHeight];
    }
    *((_DWORD *)&v7->super._minHandSize + 1) = 0;
  }
  if (v7->_analyzer) {
    v16 = v7;
  }
  else {
    v16 = 0;
  }
  v17 = v16;

  return v17;
}

- (float)bodyDistance:(id)a3 withBodyB:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {

    float v11 = 0.0;
LABEL_14:
    float v27 = (float)(17.0 - v11) * 100.0;
    goto LABEL_15;
  }
  int v9 = 0;
  uint64_t v10 = *(void *)v30;
  float v11 = 0.0;
  float v12 = 0.0;
  do
  {
    uint64_t v13 = 0;
    uint64_t v14 = v9;
    do
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(v7);
      }
      v15 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
      v16 = objc_msgSend(v6, "objectAtIndexedSubscript:", v14 + v13, (void)v29);
      [v15 confidence];
      if (v17 > 0.1)
      {
        [v16 confidence];
        if (v18 > 0.1)
        {
          [v15 location];
          double v20 = v19;
          [v16 location];
          double v22 = v21;
          [v15 location];
          double v24 = v23;
          [v16 location];
          float v26 = ((v20 - v22) * (v20 - v22) + (v24 - v25) * (v24 - v25)) * 0.5;
          float v12 = v12 + sqrtf(v26);
          float v11 = v11 + 1.0;
        }
      }

      ++v13;
    }
    while (v8 != v13);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
    int v9 = v14 + v13;
  }
  while (v8);

  if (v11 <= 5.0) {
    goto LABEL_14;
  }
  float v27 = v12 / v11;
LABEL_15:

  return v27;
}

- (id)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withOptions:(id)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v35 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", a3, a4);
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v45 = 0;
  if (!self->_analyzer) {
    goto LABEL_28;
  }
  if (!a3)
  {
    uint64_t v13 = 0;
    int v11 = -50;
    if (!a5) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
LABEL_28:
    uint64_t v13 = 0;
    int v11 = -18;
    goto LABEL_29;
  }
  analyzer = self->_analyzer;
  id v44 = 0;
  int v11 = [(VCPImageHumanPoseAnalyzer *)analyzer analyzePixelBuffer:ImageBuffer flags:&v45 results:&v44 cancel:&__block_literal_global_44];
  id v12 = v44;
  uint64_t v13 = v12;
  if (v11) {
    goto LABEL_29;
  }
  uint64_t v14 = [v12 objectForKeyedSubscript:@"HumanPoseResults"];
  BOOL v15 = v14 == 0;

  if (!v15)
  {
    v16 = [v13 objectForKeyedSubscript:@"HumanPoseResults"];
    int v11 = +[VCPHumanPoseImageRequest parseResults:v16 observations:v35 revision:self->super._revision];

    if (v11
      || [v35 count]
      && (int v11 = [(VCPHumanPoseVideoRequest *)self associatePersons:v35 withExisingPersons:self->_existingPersons]) != 0)
    {
LABEL_29:
      if (!a5)
      {
LABEL_31:
        id v29 = 0;
        goto LABEL_32;
      }
LABEL_30:
      long long v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      long long v31 = [NSString stringWithFormat:@"Error: failed to processSampleBuffer"];
      v47 = v31;
      long long v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      *a5 = [v30 errorWithDomain:*MEMORY[0x1E4F28760] code:v11 userInfo:v32];

      goto LABEL_31;
    }
  }
  float v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v35];
  existingPersons = self->_existingPersons;
  self->_existingPersons = v17;

  if (self->super._humanActionWindowSize >= 1)
  {
    uint64_t v34 = 32;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v19 = v35;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v41 != v21) {
            objc_enumerationMutation(v19);
          }
          double v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          double v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v23, "personID", v34));
          [v8 setObject:v23 forKey:v24];
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
      }
      while (v20);
    }

    if ([(NSMutableArray *)self->_existingPersonsArray count] >= (unint64_t)*(int *)((char *)&self->super.super.isa + v34)) {
      [(NSMutableArray *)self->_existingPersonsArray removeLastObject];
    }
    -[NSMutableArray insertObject:atIndex:](self->_existingPersonsArray, "insertObject:atIndex:", v8, 0, v34);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v19;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v37 != v27) {
            objc_enumerationMutation(v25);
          }
          [(VCPHumanPoseVideoRequest *)self computeActionScoreForPerson:*(void *)(*((void *)&v36 + 1) + 8 * j)];
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v26);
    }
  }
  id v29 = v35;
LABEL_32:

  return v29;
}

uint64_t __66__VCPHumanPoseVideoRequest_processSampleBuffer_withOptions_error___block_invoke()
{
  return 0;
}

- (void)computeActionScoreForPerson:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  {
    *(float *)&int v69 = (double)self->super._humanActionWindowSize * 0.7;
    -[VCPHumanPoseVideoRequest computeActionScoreForPerson:]::kMinNumBodies = v69;
  }
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v3, "personID", v3));
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  obuint64_t j = self->_existingPersonsArray;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v76;
    float v7 = 0.0;
    float v8 = 0.0;
    float v9 = 0.0;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v76 != v6) {
        objc_enumerationMutation(obj);
      }
      int v11 = [*(id *)(*((void *)&v75 + 1) + 8 * v10) objectForKey:v4];
      id v12 = v11;
      if (!v11) {
        goto LABEL_25;
      }
      uint64_t v13 = [v11 keypoints];
      uint64_t v14 = [v13 objectAtIndexedSubscript:11];
      [v14 confidence];
      if (v15 <= 0.1)
      {
      }
      else
      {
        v16 = [v12 keypoints];
        float v17 = [v16 objectAtIndexedSubscript:5];
        [v17 confidence];
        BOOL v19 = v18 > 0.1;

        if (v19)
        {
          uint64_t v20 = [v12 keypoints];
          uint64_t v21 = [v20 objectAtIndexedSubscript:11];
          [v21 location];
          double v23 = v22;
          double v25 = v24;
          uint64_t v26 = [v12 keypoints];
          uint64_t v27 = [v26 objectAtIndexedSubscript:5];
          [v27 location];
          -[VCPHumanPoseVideoRequest normDistance:point2:](self, "normDistance:point2:", v23, v25, v28, v29);
          float v31 = v30;

LABEL_15:
          float v9 = v9 + v31;
          float v8 = v8 + 1.0;
          goto LABEL_17;
        }
      }
      long long v32 = [v12 keypoints];
      v33 = [v32 objectAtIndexedSubscript:12];
      [v33 confidence];
      if (v34 > 0.1)
      {
        v35 = [v12 keypoints];
        long long v36 = [v35 objectAtIndexedSubscript:6];
        [v36 confidence];
        BOOL v38 = v37 > 0.1;

        if (!v38) {
          goto LABEL_17;
        }
        long long v39 = [v12 keypoints];
        long long v40 = [v39 objectAtIndexedSubscript:12];
        [v40 location];
        double v42 = v41;
        double v44 = v43;
        uint64_t v45 = [v12 keypoints];
        uint64_t v46 = [v45 objectAtIndexedSubscript:6];
        [v46 location];
        -[VCPHumanPoseVideoRequest normDistance:point2:](self, "normDistance:point2:", v42, v44, v47, v48);
        float v31 = v49;

        goto LABEL_15;
      }

LABEL_17:
      for (uint64_t i = 5; i != 17; ++i)
      {
        v51 = [v12 keypoints];
        v52 = [v51 objectAtIndexedSubscript:i];
        [v52 confidence];
        BOOL v54 = v53 > 0.1;

        if (v54) {
          float v7 = v7 + 1.0;
        }
      }

      if (++v10 == v5)
      {
        uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v75 objects:v79 count:16];
        if (v5) {
          goto LABEL_4;
        }
        goto LABEL_25;
      }
    }
  }
  float v7 = 0.0;
  float v8 = 0.0;
  float v9 = 0.0;
LABEL_25:

  double v55 = 0.0;
  float v56 = 0.0;
  float v57 = 0.0;
  if (v8 >= *(float *)&-[VCPHumanPoseVideoRequest computeActionScoreForPerson:]::kMinNumBodies)
  {
    int humanActionWindowSize = self->super._humanActionWindowSize;
    unint64_t v74 = 0;
    -[VCPHumanPoseVideoRequest computeVarWithID:index1:index2:interVar:intraVar:](self, "computeVarWithID:index1:index2:interVar:intraVar:", v4, 9, 5, (char *)&v74 + 4, &v74, 0.0, 0.0);
    unint64_t v60 = v74;
    LODWORD(obja) = HIDWORD(v60);
    LODWORD(v59) = v60;
    [(VCPHumanPoseVideoRequest *)self computeVarWithID:v4 index1:10 index2:6 interVar:(char *)&v74 + 4 intraVar:&v74];
    unint64_t v61 = v74;
    [(VCPHumanPoseVideoRequest *)self computeVarWithID:v4 index1:15 index2:11 interVar:(char *)&v74 + 4 intraVar:&v74];
    float v63 = *((float *)&v74 + 1);
    float v62 = *(float *)&v74;
    [(VCPHumanPoseVideoRequest *)self computeVarWithID:v4 index1:16 index2:12 interVar:(char *)&v74 + 4 intraVar:&v74];
    *(float *)&double v55 = v7 / (float)(12 * humanActionWindowSize);
    float v64 = (float)(v9 / v8) * (float)((float)(v9 / v8) * 4.0);
    float v65 = sqrtf(fmaxf((float)((float)((float)((float)(obja + 0.0) + *((float *)&v61 + 1)) + v63) + *((float *)&v74 + 1)) / v64, 0.0));
    float v66 = sqrtf(fmaxf((float)((float)((float)((float)(v59 + 0.0) + *(float *)&v61) + v62) + *(float *)&v74) / v64, 0.0));
    float v57 = v65 + v65;
    float v56 = v66 + v66;
  }
  if (*(float *)&v55 <= 0.5) {
    float v67 = *(float *)&v55;
  }
  else {
    float v67 = 0.5;
  }
  *(float *)&double v55 = fminf(v56 * v67, 1.0);
  [v70 setRelativeActionScore:v55];
  *(float *)&double v68 = fminf(v57 * v67, 1.0);
  [v70 setAbsoluteActionScore:v68];
}

- (void)computeVarWithID:(id)a3 index1:(int)a4 index2:(int)a5 interVar:(float *)a6 intraVar:(float *)a7
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  v73 = a6;
  if (a6 && a7)
  {
    v72 = a7;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    obuint64_t j = self->_existingPersonsArray;
    uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v88 objects:v92 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v89;
      uint64_t v14 = a4;
      uint64_t v86 = a5;
      float v15 = 0.0;
      float v84 = 0.0;
      float v82 = 0.0;
      float v83 = 0.0;
      float v80 = 0.0;
      float v81 = 0.0;
      float v78 = 0.0;
      float v79 = 0.0;
      float v77 = 0.0;
LABEL_5:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v89 != v13) {
          objc_enumerationMutation(obj);
        }
        float v17 = [*(id *)(*((void *)&v88 + 1) + 8 * v16) objectForKey:v87];
        float v18 = v17;
        if (!v17) {
          break;
        }
        BOOL v19 = [v17 keypoints];
        uint64_t v20 = [v19 objectAtIndexedSubscript:v14];
        [v20 confidence];
        if (v21 <= 0.1)
        {
        }
        else
        {
          double v22 = [v18 keypoints];
          double v23 = [v22 objectAtIndexedSubscript:v86];
          [v23 confidence];
          BOOL v25 = v24 > 0.1;

          if (v25)
          {
            uint64_t v26 = [v18 keypoints];
            uint64_t v27 = [v26 objectAtIndexedSubscript:v14];
            [v27 location];
            double v76 = v28;

            double v29 = [v18 keypoints];
            float v30 = [v29 objectAtIndexedSubscript:v14];
            [v30 location];
            double v32 = v31;
            v33 = [v18 keypoints];
            float v34 = [v33 objectAtIndexedSubscript:v14];
            double v75 = v32;
            [v34 location];
            double v74 = v35;

            long long v36 = [v18 keypoints];
            float v37 = [v36 objectAtIndexedSubscript:v14];
            [v37 location];
            double v39 = v38;

            long long v40 = [v18 keypoints];
            double v41 = [v40 objectAtIndexedSubscript:v14];
            [v41 location];
            double v43 = v42;
            double v44 = [v18 keypoints];
            uint64_t v45 = [v44 objectAtIndexedSubscript:v14];
            [v45 location];
            double v47 = v46;

            double v48 = [v18 keypoints];
            float v49 = [v48 objectAtIndexedSubscript:v14];
            [v49 location];
            double v51 = v50;
            v52 = [v18 keypoints];
            float v53 = [v52 objectAtIndexedSubscript:v86];
            [v53 location];
            double v55 = v54;

            float v56 = [v18 keypoints];
            float v57 = [v56 objectAtIndexedSubscript:v14];
            [v57 location];
            double v59 = v58;
            unint64_t v60 = [v18 keypoints];
            unint64_t v61 = [v60 objectAtIndexedSubscript:v86];
            [v61 location];
            double v63 = v62;

            float v64 = v76 + v77;
            float v65 = v78 + v75 * v74;
            float v77 = v64;
            float v78 = v65;
            float v66 = v39 + v79;
            float v67 = v80 + v43 * v47;
            float v79 = v66;
            float v80 = v67;
            float v68 = v51 - v55;
            float v81 = v81 + v68;
            float v82 = v82 + (float)(v68 * v68);
            float v69 = v59 - v63;
            float v83 = v83 + v69;
            float v84 = v84 + (float)(v69 * v69);
            float v15 = v15 + 1.0;
          }
        }

        if (v12 == ++v16)
        {
          uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v88 objects:v92 count:16];
          if (v12) {
            goto LABEL_5;
          }
          break;
        }
      }

      float v70 = 0.0;
      float v71 = 0.0;
      if (v15 > 0.0)
      {
        float v71 = (float)((float)((float)(v80 / v15) - (float)((float)(v79 * v79) / (float)(v15 * v15)))
                    + (float)((float)(v78 / v15) - (float)((float)(v77 * v77) / (float)(v15 * v15))))
            * 0.5;
        float v70 = (float)((float)((float)(v84 / v15) - (float)((float)(v83 * v83) / (float)(v15 * v15)))
                    + (float)((float)(v82 / v15) - (float)((float)(v81 * v81) / (float)(v15 * v15))))
            * 0.5;
      }
    }
    else
    {

      float v70 = 0.0;
      float v71 = 0.0;
    }
    float *v73 = v71;
    float *v72 = v70;
  }
}

- (float)normDistance:(CGPoint)a3 point2:(CGPoint)a4
{
  float v4 = (a3.y - a4.y) * (a3.y - a4.y) + (a3.x - a4.x) * (a3.x - a4.x);
  return sqrtf(v4);
}

- (int)associatePersons:(id)a3 withExisingPersons:(id)a4
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v48 = a4;
  if ([v48 count])
  {
    unint64_t v6 = [v48 count];
    if (v6 >= [v53 count])
    {
      id v9 = [MEMORY[0x1E4F1CA48] arrayWithArray:v48];
      long long v73 = 0u;
      long long v74 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      id v7 = v53;
      uint64_t v41 = [v7 countByEnumeratingWithState:&v71 objects:v83 count:16];
      if (v41)
      {
        uint64_t v43 = *(void *)v72;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v72 != v43) {
              objc_enumerationMutation(v7);
            }
            uint64_t v27 = *(void **)(*((void *)&v71 + 1) + 8 * i);
            long long v67 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            id obja = v9;
            uint64_t v28 = [obja countByEnumeratingWithState:&v67 objects:v82 count:16];
            if (v28)
            {
              double v54 = 0;
              uint64_t v29 = 0;
              uint64_t v52 = *(void *)v68;
              float v30 = 3.4028e38;
              while (2)
              {
                uint64_t v50 = v28;
                for (uint64_t j = 0; j != v50; ++j)
                {
                  if (*(void *)v68 != v52) {
                    objc_enumerationMutation(obja);
                  }
                  double v32 = *(void **)(*((void *)&v67 + 1) + 8 * j);
                  uint64_t v14 = [v27 keypoints];
                  if ([v14 count] != 17)
                  {
                    id v9 = obja;
                    goto LABEL_61;
                  }
                  v33 = [v32 keypoints];
                  BOOL v34 = [v33 count] == 17;

                  if (!v34)
                  {
                    id v9 = obja;
                    goto LABEL_63;
                  }
                  double v35 = [v27 keypoints];
                  long long v36 = [v32 keypoints];
                  [(VCPHumanPoseVideoRequest *)self bodyDistance:v35 withBodyB:v36];
                  float v38 = v37;

                  if (v38 < v30)
                  {
                    uint64_t v29 = [v32 personID];
                    id v39 = v32;

                    double v54 = v39;
                    float v30 = v38;
                  }
                }
                uint64_t v28 = [obja countByEnumeratingWithState:&v67 objects:v82 count:16];
                if (v28) {
                  continue;
                }
                break;
              }
            }
            else
            {
              double v54 = 0;
              uint64_t v29 = 0;
            }

            [v27 setPersonID:v29];
            [obja removeObject:v54];
          }
          uint64_t v41 = [v7 countByEnumeratingWithState:&v71 objects:v83 count:16];
        }
        while (v41);
        LODWORD(v22) = 0;
        id v9 = obja;
      }
      else
      {
        LODWORD(v22) = 0;
      }
    }
    else
    {
      float v49 = [MEMORY[0x1E4F1CA48] arrayWithArray:v53];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v7 = v48;
      uint64_t v42 = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
      if (v42)
      {
        uint64_t v44 = *(void *)v64;
LABEL_5:
        obuint64_t j = 0;
LABEL_6:
        if (*(void *)v64 != v44) {
          objc_enumerationMutation(v7);
        }
        float v8 = *(void **)(*((void *)&v63 + 1) + 8 * (void)obj);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v9 = v49;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v80 count:16];
        if (v10)
        {
          double v54 = 0;
          uint64_t v51 = *(void *)v60;
          float v11 = 3.4028e38;
LABEL_10:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v60 != v51) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void **)(*((void *)&v59 + 1) + 8 * v12);
            uint64_t v14 = [v8 keypoints];
            if ([v14 count] != 17) {
              break;
            }
            float v15 = [v13 keypoints];
            BOOL v16 = [v15 count] == 17;

            if (!v16) {
              goto LABEL_63;
            }
            float v17 = [v8 keypoints];
            float v18 = [v13 keypoints];
            [(VCPHumanPoseVideoRequest *)self bodyDistance:v17 withBodyB:v18];
            float v20 = v19;

            if (v20 < v11)
            {
              id v21 = v13;

              float v11 = v20;
              double v54 = v21;
            }
            if (v10 == ++v12)
            {
              uint64_t v10 = [v9 countByEnumeratingWithState:&v59 objects:v80 count:16];
              if (v10) {
                goto LABEL_10;
              }

              if (!v54) {
                goto LABEL_64;
              }
              objc_msgSend(v54, "setPersonID:", objc_msgSend(v8, "personID"));
              [v9 removeObject:v54];

              obuint64_t j = (char *)obj + 1;
              if (obj != (id)v42) {
                goto LABEL_6;
              }
              uint64_t v42 = [v7 countByEnumeratingWithState:&v63 objects:v81 count:16];
              if (v42) {
                goto LABEL_5;
              }
              goto LABEL_22;
            }
          }
LABEL_61:
        }
        else
        {
          double v54 = 0;
        }
LABEL_63:

LABEL_64:
        LODWORD(v22) = -18;
      }
      else
      {
LABEL_22:

        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v7 = v49;
        uint64_t v22 = [v7 countByEnumeratingWithState:&v55 objects:v79 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v56;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v56 != v23) {
                objc_enumerationMutation(v7);
              }
              [*(id *)(*((void *)&v55 + 1) + 8 * k) setPersonID:(*((_DWORD *)&self->super._minHandSize + 1))++];
            }
            uint64_t v22 = [v7 countByEnumeratingWithState:&v55 objects:v79 count:16];
          }
          while (v22);
        }
        id v9 = v7;
      }
    }
  }
  else
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v9 = v53;
    uint64_t v22 = [v9 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v22)
    {
      uint64_t v25 = *(void *)v76;
      do
      {
        for (uint64_t m = 0; m != v22; ++m)
        {
          if (*(void *)v76 != v25) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v75 + 1) + 8 * m) setPersonID:(*((_DWORD *)&self->super._minHandSize + 1))++];
        }
        uint64_t v22 = [v9 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v22);
    }
  }

  return v22;
}

- (CGSize)preferredInputSizeWithOptions:(id)a3 error:(id *)a4
{
  double personID = (double)self->_personID;
  double preferredWidth = (double)self->_preferredWidth;
  result.int height = preferredWidth;
  result.int width = personID;
  return result;
}

- (unsigned)preferredPixelFormat
{
  return self->_preferredHeight;
}

- (BOOL)cleanupWithOptions:(id)a3 error:(id *)a4
{
  analyzer = self->_analyzer;
  self->_analyzer = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingPersonsArray, 0);
  objc_storeStrong((id *)&self->_existingPersons, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end