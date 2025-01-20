@interface VCPVideoCNNHighlight
- (VCPVideoCNNHighlight)init;
- (id).cxx_construct;
- (id)results;
- (int)finishAnalysisPass:(id *)a3;
- (int)loadAnalysisResults:(id)a3;
- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7;
- (void)dealloc;
@end

@implementation VCPVideoCNNHighlight

- (VCPVideoCNNHighlight)init
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCPVideoCNNHighlight;
  v2 = [(VCPVideoCNNHighlight *)&v9 init];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F28B50], "vcp_mediaAnalysisBundle");
    uint64_t v4 = [v3 resourceURL];

    [MEMORY[0x1E4F1CB10] URLWithString:@"highlight_head.espresso.net" relativeToURL:v4];
    objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    results = v2->_results;
    v2->_results = (NSMutableArray *)v5;

    inputNames = v2->_inputNames;
    v2->_inputNames = (NSArray *)&unk_1F15EE0A0;

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
  v4.super_class = (Class)VCPVideoCNNHighlight;
  [(VCPVideoCNNHighlight *)&v4 dealloc];
}

- (int)loadAnalysisResults:(id)a3
{
  v5[8] = *MEMORY[0x1E4F143B8];
  a3;
  {
    {
      v5[0] = @"QualityResults";
      v5[1] = @"FineSubjectMotionResults";
      v5[2] = @"SubtleMotionResults";
      v5[3] = @"HumanActionResults";
      v5[4] = @"HumanPoseResults";
      v5[5] = @"InterestingnessResults";
      v5[6] = @"CameraMotionResults";
      v5[7] = @"VoiceResults";
      -[VCPVideoCNNHighlight loadAnalysisResults:]::analysisKeys = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:8];
    }
  }
  bzero(self->_analysisInput, 0x500uLL);
  operator new[]();
}

- (int)run:(id)a3 withPersons:(id)a4 andRegionCrop:(CGRect)a5 atTime:(id *)a6 andDuration:(id *)a7
{
  v42[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  p_inputsData = &self->_inputsData;
  v31 = v10;
  if ((float **)((char *)self->_inputsData.__end_ - (char *)self->_inputsData.__begin_) != (float **)16) {
    goto LABEL_16;
  }
  *p_inputsData->__begin_ = (float *)[v10 outputBeforeTemporalPooling];
  *((void *)p_inputsData->__begin_ + 1) = self->_analysisInput;
  begin = p_inputsData->__begin_;
  if (!*p_inputsData->__begin_ || !begin[1]) {
    goto LABEL_16;
  }
  modelEspresso = self->_modelEspresso;
  v38 = 0;
  uint64_t v39 = 0;
  v37 = 0;
  std::vector<float *>::__init_with_size[abi:ne180100]<float **,float **>(&v37, begin, (uint64_t)self->_inputsData.__end_, self->_inputsData.__end_ - begin);
  int v14 = [(VCPCNNModelEspresso *)modelEspresso espressoForwardInputs:&v37];
  if (v37)
  {
    v38 = v37;
    operator delete(v37);
  }
  if (!v14)
  {
    v15 = self->_modelEspresso;
    if (v15)
    {
      [(VCPCNNModelEspresso *)v15 outputBlob];
      CMTimeValue value = time.value;
      if (time.value)
      {
        uint64_t v16 = 0;
        char v17 = 1;
        do
        {
          uint64_t v18 = 0;
          char v19 = v17;
          float v20 = 0.0;
          do
          {
            float v20 = v20 + expf(*(float *)(value + 20 * v16 + v18));
            v18 += 4;
          }
          while (v18 != 20);
          uint64_t v21 = 0;
          float v22 = 0.0;
          do
          {
            float v22 = v22
                + (float)((float)(expf(*(float *)(value + 20 * v16 + v21 * 4)) / v20)
                        * *(float *)&-[VCPVideoCNNHighlight run:withPersons:andRegionCrop:atTime:andDuration:]::kClassScore[v21]);
            ++v21;
          }
          while (v21 != 5);
          memset(&v35, 0, sizeof(v35));
          CMTime time = (CMTime)*a7;
          CMTimeMultiply(&v33, &time, v16);
          CMTime time = v33;
          CMTimeMultiplyByRatio(&v34, &time, 1, 2);
          CMTime time = v34;
          CMTime rhs = (CMTime)*a6;
          CMTimeAdd(&v35, &time, &rhs);
          results = self->_results;
          v41[0] = @"start";
          CMTime time = v35;
          CFDictionaryRef v24 = CMTimeCopyAsDictionary(&time, 0);
          v42[0] = v24;
          v41[1] = @"duration";
          CMTime time = (CMTime)*a7;
          CMTimeMultiplyByRatio(&v32, &time, 1, 2);
          CMTime time = v32;
          CFDictionaryRef v25 = CMTimeCopyAsDictionary(&time, 0);
          v42[1] = v25;
          v41[2] = @"quality";
          *(float *)&double v26 = v22;
          v27 = [NSNumber numberWithFloat:v26];
          v42[2] = v27;
          v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
          [(NSMutableArray *)results addObject:v28];

          char v17 = 0;
          int v14 = 0;
          uint64_t v16 = 1;
        }
        while ((v19 & 1) != 0);
        goto LABEL_17;
      }
    }
LABEL_16:
    int v14 = -18;
  }
LABEL_17:

  return v14;
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
    uint64_t v5 = @"MLHighlightScoreResults";
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
  p_inputsData = &self->_inputsData;
  begin = self->_inputsData.__begin_;
  if (begin)
  {
    p_inputsData->__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_inputNames, 0);
  objc_storeStrong((id *)&self->_modelEspresso, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end