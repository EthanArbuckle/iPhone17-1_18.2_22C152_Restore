@interface VCPVideoCNNCameraMotion
- (VCPVideoCNNCameraMotion)init;
- (id)results;
- (int)finishAnalysisPass:(id *)a3;
- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7;
@end

@implementation VCPVideoCNNCameraMotion

- (VCPVideoCNNCameraMotion)init
{
  v18.receiver = self;
  v18.super_class = (Class)VCPVideoCNNCameraMotion;
  v2 = [(VCPVideoCNNCameraMotion *)&v18 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v4 = [v3 resourceURL];

    v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"cameramotiontype_head.espresso.net" relativeToURL:v4];
    v6 = [MEMORY[0x1E4F1CB10] URLWithString:@"cameramotionscore_head.espresso.net" relativeToURL:v4];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    results = v2->_results;
    v2->_results = (NSMutableArray *)v7;

    v9 = [VCPCNNModelEspresso alloc];
    uint64_t v10 = [(VCPCNNModelEspresso *)v9 initWithParameters:v5 inputNames:&unk_1F15EE7A8 outputNames:0 properties:MEMORY[0x1E4F1CC08]];
    motionTypeModel = v2->_motionTypeModel;
    v2->_motionTypeModel = (VCPCNNModelEspresso *)v10;

    v12 = v2->_motionTypeModel;
    if (v12)
    {
      if (![(VCPCNNModelEspresso *)v12 prepareModelWithConfig:&stru_1F15A0D70])
      {
        v13 = [VCPCNNModelEspresso alloc];
        uint64_t v14 = [(VCPCNNModelEspresso *)v13 initWithParameters:v6 inputNames:&unk_1F15EE7C0 outputNames:0 properties:MEMORY[0x1E4F1CC08]];
        motionScoreModel = v2->_motionScoreModel;
        v2->_motionScoreModel = (VCPCNNModelEspresso *)v14;

        v16 = v2->_motionScoreModel;
        if (v16) {
          [(VCPCNNModelEspresso *)v16 prepareModelWithConfig:&stru_1F15A0D70];
        }
      }
    }
  }
  return v2;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = -[VCPCNNModelEspresso espressoForward:](self->_motionTypeModel, "espressoForward:", [v9 outputBeforeTemporalPooling]);
  if (v10) {
    goto LABEL_21;
  }
  motionTypeModel = self->_motionTypeModel;
  if (!motionTypeModel) {
    goto LABEL_20;
  }
  [(VCPCNNModelEspresso *)motionTypeModel outputBlob];
  CMTimeValue value = time.value;
  if (!time.value) {
    goto LABEL_20;
  }
  uint64_t v14 = 0;
  v46[0] = 0;
  char v15 = 1;
  do
  {
    char v16 = v15;
    v17 = (_DWORD *)(value + 44 * v14);
    LODWORD(v12) = *v17;
    for (uint64_t i = 1; i != 11; ++i)
    {
      float v19 = *(float *)&v17[i];
      if (v19 > *(float *)&v12)
      {
        *((_DWORD *)v46 + v14) = i;
        *(float *)&double v12 = v19;
      }
    }
    char v15 = 0;
    *((_DWORD *)v46 + v14) = 1 << (-[VCPVideoCNNCameraMotion run:withPersons:andRegionCrop:atTime:andDuration:]::kClassType[*((int *)v46 + v14)]
                                 + 6);
    uint64_t v14 = 1;
  }
  while ((v16 & 1) != 0);
  int v10 = -[VCPCNNModelEspresso espressoForward:](self->_motionScoreModel, "espressoForward:", objc_msgSend(v9, "outputBeforeTemporalPooling", v12));
  if (!v10)
  {
    motionScoreModel = self->_motionScoreModel;
    if (motionScoreModel)
    {
      [(VCPCNNModelEspresso *)motionScoreModel outputBlob];
      CMTimeValue v36 = time.value;
      if (time.value)
      {
        uint64_t v21 = 0;
        char v22 = 1;
        do
        {
          uint64_t v23 = 0;
          char v35 = v22;
          float v24 = 0.0;
          do
          {
            float v24 = v24 + expf(*(float *)(v36 + 20 * v21 + v23));
            v23 += 4;
          }
          while (v23 != 20);
          uint64_t v25 = 0;
          float v26 = 0.0;
          do
          {
            float v26 = v26
                + (float)((float)(expf(*(float *)(v36 + 20 * v21 + v25 * 4)) / v24)
                        * *(float *)&-[VCPVideoCNNCameraMotion run:withPersons:andRegionCrop:atTime:andDuration:]::kClassScore[v25]);
            ++v25;
          }
          while (v25 != 5);
          memset(&v41, 0, sizeof(v41));
          CMTime time = (CMTime)*a7;
          CMTimeMultiply(&v39, &time, v21);
          CMTime time = v39;
          CMTimeMultiplyByRatio(&v40, &time, 1, 2);
          CMTime time = v40;
          CMTime rhs = (CMTime)*a6;
          CMTimeAdd(&v41, &time, &rhs);
          results = self->_results;
          v44[0] = @"start";
          CMTime time = v41;
          CFDictionaryRef v28 = CMTimeCopyAsDictionary(&time, 0);
          v45[0] = v28;
          v44[1] = @"duration";
          CMTime time = (CMTime)*a7;
          CMTimeMultiplyByRatio(&v38, &time, 1, 2);
          CMTime time = v38;
          CFDictionaryRef v29 = CMTimeCopyAsDictionary(&time, 0);
          v45[1] = v29;
          v44[2] = @"flags";
          v30 = [NSNumber numberWithInt:*((unsigned int *)v46 + v21)];
          *(float *)&double v31 = 1.0 - v26;
          v45[2] = v30;
          v44[3] = @"quality";
          v32 = [NSNumber numberWithFloat:v31];
          v45[3] = v32;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];
          [(NSMutableArray *)results addObject:v33];

          char v22 = 0;
          uint64_t v21 = 1;
        }
        while ((v35 & 1) != 0);
        int v10 = 0;
        goto LABEL_21;
      }
    }
LABEL_20:
    int v10 = -18;
  }
LABEL_21:

  return v10;
}

- (int)finishAnalysisPass:(id *)a3
{
  return 0;
}

- (id)results
{
  v6[1] = *MEMORY[0x1E4F143B8];
  results = self->_results;
  if (results)
  {
    v5 = @"MLCameraMotionResults";
    v6[0] = results;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_motionScoreModel, 0);
  objc_storeStrong((id *)&self->_motionTypeModel, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end