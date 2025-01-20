@interface VCPVideoPixelStabilizer
- (VCPVideoPixelStabilizer)init;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)convertAnalysisResult;
- (void)dealloc;
@end

@implementation VCPVideoPixelStabilizer

- (VCPVideoPixelStabilizer)init
{
  v23.receiver = self;
  v23.super_class = (Class)VCPVideoPixelStabilizer;
  v2 = [(VCPVideoStabilizer *)&v23 init];
  v3 = v2;
  if (v2)
  {
    [(VCPVideoStabilizer *)v2 setGyroStabilization:0];
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v5 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 12);
    if (v5)
    {
      int v6 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 36);
      if ((v6 & 1) != 0 && !*(void *)(MEMORY[0x1E4F1FA20] + 40))
      {
        uint64_t v7 = *(void *)(MEMORY[0x1E4F1FA20] + 24);
        if ((v7 & 0x8000000000000000) == 0)
        {
          uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA20] + 16);
          int v9 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 32);
          uint64_t v19 = *MEMORY[0x1E4F1FA20];
          int v20 = *(_DWORD *)(MEMORY[0x1E4F1FA20] + 8);
          int v21 = v5;
          uint64_t v22 = v8;
          v10 = [MEMORY[0x1E4F29238] valueWithCMTime:&v19];
          [v4 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F6F3B8]];

          uint64_t v15 = v7;
          int v16 = v9;
          int v17 = v6;
          uint64_t v18 = 0;
          v11 = [MEMORY[0x1E4F29238] valueWithCMTime:&v15];
          [v4 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F6F3B0]];
        }
      }
    }
    uint64_t v12 = ICAnalysisInit();
    v3->_analysisSessionRef = (void *)v12;
    if (v12) {
      v13 = v3;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  if (self->_analysisSessionRef)
  {
    ICDestroyResult();
    self->_analysisSessionRef = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)VCPVideoPixelStabilizer;
  [(VCPVideoStabilizer *)&v3 dealloc];
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  return 0;
}

- (int)convertAnalysisResult
{
  uint64_t v3 = ICAnalysisStopAndGetResult();
  id v4 = 0;
  [(VCPVideoStabilizer *)self setAnalysisResultRef:v3];
  if (self->_analysisSessionRef)
  {
    ICDestroyResult();
    self->_analysisSessionRef = 0;
  }
  if ([(VCPVideoStabilizer *)self analysisResultRef])
  {
    [(VCPVideoStabilizer *)self analysisResultRef];
    ICGetAnalysisConfidence();
    -[VCPVideoStabilizer setAnalysisConfidence:](self, "setAnalysisConfidence:");
    [(VCPVideoStabilizer *)self analysisConfidence];
    if (v5 < 0.85) {
      [(VCPVideoStabilizer *)self setValidStabilization:0];
    }
    int v6 = 0;
  }
  else
  {
    int v6 = -18;
  }

  return v6;
}

@end