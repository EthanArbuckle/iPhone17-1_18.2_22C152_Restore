@interface VCPVideoCNNQuality
- (VCPVideoCNNQuality)init;
- (id)results;
- (int)finishAnalysisPass:(id *)a3;
- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7;
@end

@implementation VCPVideoCNNQuality

- (VCPVideoCNNQuality)init
{
  v13.receiver = self;
  v13.super_class = (Class)VCPVideoCNNQuality;
  v2 = [(VCPVideoCNNQuality *)&v13 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    v4 = [v3 resourceURL];

    v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"quality_head.espresso.net" relativeToURL:v4];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    results = v2->_results;
    v2->_results = (NSMutableArray *)v6;

    v8 = [VCPCNNModelEspresso alloc];
    uint64_t v9 = [(VCPCNNModelEspresso *)v8 initWithParameters:v5 inputNames:&unk_1F15EDF80 outputNames:0 properties:MEMORY[0x1E4F1CC08]];
    modelEspresso = v2->_modelEspresso;
    v2->_modelEspresso = (VCPCNNModelEspresso *)v9;

    v11 = v2->_modelEspresso;
    if (v11) {
      [(VCPCNNModelEspresso *)v11 prepareModelWithConfig:&stru_1F15A0D70];
    }
  }
  return v2;
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  v37[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v29 = self;
  int v11 = -[VCPCNNModelEspresso espressoForward:](self->_modelEspresso, "espressoForward:", [v10 outputBeforeTemporalPooling]);
  if (!v11)
  {
    modelEspresso = v29->_modelEspresso;
    if (modelEspresso && ([(VCPCNNModelEspresso *)modelEspresso outputBlob], (CMTimeValue value = time.value) != 0))
    {
      id v28 = v10;
      uint64_t v14 = 0;
      char v15 = 1;
      do
      {
        uint64_t v16 = 0;
        char v17 = v15;
        float v18 = 0.0;
        do
        {
          float v18 = v18 + expf(*(float *)(value + 20 * v14 + v16));
          v16 += 4;
        }
        while (v16 != 20);
        uint64_t v19 = 0;
        float v20 = 0.0;
        do
        {
          float v20 = v20
              + (float)((float)(expf(*(float *)(value + 20 * v14 + v19 * 4)) / v18)
                      * *(float *)&-[VCPVideoCNNQuality run:withPersons:andRegionCrop:atTime:andDuration:]::kClassScore[v19]);
          ++v19;
        }
        while (v19 != 5);
        memset(&v33, 0, sizeof(v33));
        CMTime time = (CMTime)*a7;
        CMTimeMultiply(&v31, &time, v14);
        CMTime time = v31;
        CMTimeMultiplyByRatio(&v32, &time, 1, 2);
        CMTime time = v32;
        CMTime rhs = (CMTime)*a6;
        CMTimeAdd(&v33, &time, &rhs);
        results = v29->_results;
        v36[0] = @"start";
        CMTime time = v33;
        CFDictionaryRef v22 = CMTimeCopyAsDictionary(&time, 0);
        v37[0] = v22;
        v36[1] = @"duration";
        CMTime time = (CMTime)*a7;
        CMTimeMultiplyByRatio(&v30, &time, 1, 2);
        CMTime time = v30;
        CFDictionaryRef v23 = CMTimeCopyAsDictionary(&time, 0);
        v37[1] = v23;
        v36[2] = @"quality";
        *(float *)&double v24 = v20;
        v25 = [NSNumber numberWithFloat:v24];
        v37[2] = v25;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:3];
        [(NSMutableArray *)results addObject:v26];

        char v15 = 0;
        uint64_t v14 = 1;
      }
      while ((v17 & 1) != 0);
      int v11 = 0;
      id v10 = v28;
    }
    else
    {
      int v11 = -18;
    }
  }

  return v11;
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
    v5 = @"MLQualityResults";
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
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end