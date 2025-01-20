@interface VCPVideoCNNAutoplay
- (VCPVideoCNNAutoplay)init;
- (id).cxx_construct;
- (id)results;
- (int)finishAnalysisPass:(id *)a3;
- (int)loadAnalysisResults:(id)a3 audioResults:(id)a4;
- (int)run:(id)a3;
- (void)dealloc;
@end

@implementation VCPVideoCNNAutoplay

- (VCPVideoCNNAutoplay)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCPVideoCNNAutoplay;
  v2 = [(VCPVideoCNNAutoplay *)&v9 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    uint64_t v4 = [v3 resourceURL];

    [MEMORY[0x1E4F1CB10] URLWithString:@"autoplay_head.espresso.net" relativeToURL:v4];
    objc_claimAutoreleasedReturnValue();
    summaryResults = v2->_summaryResults;
    v2->_summaryResults = 0;

    settlingGatingResults = v2->_settlingGatingResults;
    v2->_settlingGatingResults = 0;

    inputNames = v2->_inputNames;
    v2->_inputNames = (NSArray *)&unk_1F15EE3A0;

    std::vector<void *>::resize((uint64_t)&v2->_inputsData, [(NSArray *)v2->_inputNames count]);
    operator new[]();
  }
  return 0;
}

- (void)dealloc
{
  analysisInput = self->_analysisInput;
  if (analysisInput) {
    MEMORY[0x1C186C790](analysisInput, 0x1000C8052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCPVideoCNNAutoplay;
  [(VCPVideoCNNAutoplay *)&v4 dealloc];
}

- (int)loadAnalysisResults:(id)a3 audioResults:(id)a4
{
  v22[8] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  a4;
  v20 = v6;
  {
    v22[0] = @"QualityResults";
    v22[1] = @"FineSubjectMotionResults";
    v22[2] = @"SubtleMotionResults";
    v22[3] = @"HumanActionResults";
    v22[4] = @"InterestingnessResults";
    v22[5] = @"CameraMotionResults";
    v22[6] = @"expressionChangeScore";
    v22[7] = @"visualPleasingScore";
    -[VCPVideoCNNAutoplay loadAnalysisResults:audioResults:]::analysisKeys = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:8];
  }
  bzero(self->_analysisInput, 0x300uLL);
  v7 = [v6 objectForKeyedSubscript:@"MovieSummaryResults"];
  BOOL v8 = v7 == 0;

  if (v8)
  {
    self->_skip = 1;
  }
  else
  {
    objc_super v9 = [v20 objectForKeyedSubscript:@"MovieSummaryResults"];
    uint64_t v10 = [v9 objectAtIndexedSubscript:0];
    v11 = (NSMutableDictionary *)[v10 mutableCopy];
    summaryResults = self->_summaryResults;
    self->_summaryResults = v11;
  }
  v13 = [v20 objectForKeyedSubscript:@"SettlingEffectsGatingResults"];
  v14 = [v13 objectAtIndexedSubscript:0];
  v15 = (NSMutableDictionary *)[v14 mutableCopy];
  settlingGatingResults = self->_settlingGatingResults;
  self->_settlingGatingResults = v15;

  memset(&v21, 0, sizeof(v21));
  v17 = [v20 objectForKeyedSubscript:@"MovieSummaryResults"];
  CFDictionaryRef v18 = [v17 objectAtIndexedSubscript:0];
  CMTimeRangeMakeFromDictionary(&v21, v18);

  operator new[]();
}

- (int)run:(id)a3
{
  id v4 = a3;
  if ([v4 outputBeforeFc] && !self->_skip)
  {
    *self->_inputsData.__begin_ = (float *)[v4 outputBeforeFc];
    *((void *)self->_inputsData.__begin_ + 1) = self->_analysisInput;
    modelEspresso = self->_modelEspresso;
    v57 = 0;
    uint64_t v58 = 0;
    v56 = 0;
    std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&v56, self->_inputsData.__begin_, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - self->_inputsData.__begin_);
    int v6 = [(VCPCNNModelEspresso *)modelEspresso espressoForwardInputs:&v56];
    if (v56)
    {
      v57 = v56;
      operator delete(v56);
    }
    if (v6) {
      goto LABEL_26;
    }
    v39 = self->_modelEspresso;
    if (!v39) {
      goto LABEL_25;
    }
    [(VCPCNNModelEspresso *)v39 outputBlob];
    if (!v55) {
      goto LABEL_25;
    }
    uint64_t v40 = 0;
    float v41 = 0.0;
    char v42 = 1;
    do
    {
      char v43 = v42;
      float v44 = expf(*(float *)(v55 + 4 * v40));
      char v42 = 0;
      float v41 = v41 + v44;
      uint64_t v40 = 1;
    }
    while ((v43 & 1) != 0);
    v45 = NSNumber;
    float v46 = (float)(expf(*(float *)(v55 + 4)) / v41) + -0.2;
    float v47 = 1.0;
    if (v46 < 1.0) {
      float v47 = v46;
    }
    BOOL v48 = v46 > 0.0;
    double v49 = 0.0;
    if (v48) {
      *(float *)&double v49 = v47;
    }
    v50 = [v45 numberWithFloat:v49];
    [(NSMutableDictionary *)self->_summaryResults setObject:v50 forKeyedSubscript:@"quality"];
  }
  if (![v4 outputBeforeFcSettling])
  {
LABEL_12:
    int v6 = 0;
    goto LABEL_26;
  }
  *self->_inputsData.__begin_ = (float *)[v4 outputBeforeFcSettling];
  *((void *)self->_inputsData.__begin_ + 1) = self->_analysisInput;
  v5 = self->_modelEspresso;
  v53 = 0;
  uint64_t v54 = 0;
  __p = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&__p, self->_inputsData.__begin_, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - self->_inputsData.__begin_);
  int v6 = [(VCPCNNModelEspresso *)v5 espressoForwardInputs:&__p];
  if (__p)
  {
    v53 = __p;
    operator delete(__p);
  }
  if (!v6)
  {
    v7 = self->_modelEspresso;
    if (v7)
    {
      [(VCPCNNModelEspresso *)v7 outputBlob];
      uint64_t v8 = v55;
      if (v55)
      {
        uint64_t v9 = 0;
        float v10 = 0.0;
        char v11 = 1;
        do
        {
          char v12 = v11;
          float v13 = expf(*(float *)(v8 + 4 * v9));
          char v11 = 0;
          float v10 = v10 + v13;
          uint64_t v9 = 1;
        }
        while ((v12 & 1) != 0);
        float v14 = expf(*(float *)(v8 + 4));
        v15 = [(NSMutableDictionary *)self->_settlingGatingResults objectForKeyedSubscript:@"attributes"];
        v16 = [v15 objectForKeyedSubscript:@"ExposureChangeScore"];
        [v16 floatValue];
        float v18 = v17;

        v19 = [(NSMutableDictionary *)self->_settlingGatingResults objectForKeyedSubscript:@"attributes"];
        v20 = [v19 objectForKeyedSubscript:@"SharpnessScore"];
        [v20 floatValue];
        float v22 = v21;

        v23 = [(NSMutableDictionary *)self->_settlingGatingResults objectForKeyedSubscript:@"attributes"];
        v24 = [v23 objectForKeyedSubscript:@"ZoomChangeScore"];
        [v24 floatValue];
        float v26 = v25;

        v27 = [(NSMutableDictionary *)self->_settlingGatingResults objectForKeyedSubscript:@"attributes"];
        v28 = [v27 objectForKeyedSubscript:@"FlashScore"];
        [v28 floatValue];
        float v30 = v29;
        float v31 = v14 / v10;

        *(float *)&double v32 = (float)((float)((float)(v31 * v18) * v22) * v26) * v30;
        v33 = [NSNumber numberWithFloat:v32];
        [(NSMutableDictionary *)self->_settlingGatingResults setObject:v33 forKeyedSubscript:@"quality"];

        v34 = [(NSMutableDictionary *)self->_settlingGatingResults objectForKeyedSubscript:@"attributes"];
        v35 = (void *)[v34 mutableCopy];

        *(float *)&double v36 = v31;
        v37 = [NSNumber numberWithFloat:v36];
        [v35 setObject:v37 forKeyedSubscript:@"AutoplayScore"];

        [(NSMutableDictionary *)self->_settlingGatingResults setObject:v35 forKeyedSubscript:@"attributes"];
        goto LABEL_12;
      }
    }
LABEL_25:
    int v6 = -18;
  }
LABEL_26:

  return v6;
}

- (int)finishAnalysisPass:(id *)a3
{
  return 0;
}

- (id)results
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_summaryResults)
  {
    v8[0] = self->_summaryResults;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v3 setObject:v4 forKeyedSubscript:@"MovieSummaryResults"];
  }
  if (self->_settlingGatingResults)
  {
    settlingGatingResults = self->_settlingGatingResults;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&settlingGatingResults count:1];
    [v3 setObject:v5 forKeyedSubscript:@"SettlingEffectsGatingResults"];
  }
  return v3;
}

- (void).cxx_destruct
{
  p_inputsData = &self->_inputsData;
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    p_inputsData->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_settlingGatingResults, 0);
  objc_storeStrong((id *)&self->_summaryResults, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end