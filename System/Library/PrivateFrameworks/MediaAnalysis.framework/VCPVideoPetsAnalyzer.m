@interface VCPVideoPetsAnalyzer
- (VCPVideoPetsAnalyzer)initWithTransform:(CGAffineTransform *)a3;
- (id)parseResults:(id)a3 toDetections:(id)a4 atTime:(id *)a5 fromTime:(id *)a6 addActiveRegions:(id)a7;
- (id)results;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6;
- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6 frameStats:(id)a7;
- (int)finishAnalysisPass:(id *)a3;
- (void)addDetectionToDict:(id *)a3 withActiveRegions:(id)a4 forPetsDetections:(id)a5 fromTime:(id *)a6;
@end

@implementation VCPVideoPetsAnalyzer

- (VCPVideoPetsAnalyzer)initWithTransform:(CGAffineTransform *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VCPVideoPetsAnalyzer;
  v3 = [(VCPVideoPetsAnalyzer *)&v21 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v6;

    long long v8 = *MEMORY[0x1E4F1FA08];
    *((void *)v3 + 5) = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    *(_OWORD *)(v3 + 24) = v8;
    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    long long v10 = *MEMORY[0x1E4F1F9F8];
    *((void *)v3 + 8) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *((_OWORD *)v3 + 3) = v10;
    uint64_t v11 = *(void *)(v9 + 16);
    *(_OWORD *)(v3 + 72) = *(_OWORD *)v9;
    *((void *)v3 + 11) = v11;
    v12 = [[VCPImagePetsAnalyzer alloc] initWithMaxNumRegions:5];
    v13 = (void *)*((void *)v3 + 12);
    *((void *)v3 + 12) = v12;

    v14 = (void *)*((void *)v3 + 12);
    if (v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C978] array];
      v16 = (void *)*((void *)v3 + 13);
      *((void *)v3 + 13) = v15;

      uint64_t v17 = [MEMORY[0x1E4F1C978] array];
      v18 = (void *)*((void *)v3 + 14);
      *((void *)v3 + 14) = v17;

      v14 = v3;
    }
    v19 = v14;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)parseResults:(id)a3 toDetections:(id)a4 atTime:(id *)a5 fromTime:(id *)a6 addActiveRegions:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v46 = a4;
  id v11 = a7;
  if (![v10 count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1C978] array];

    long long v13 = *MEMORY[0x1E4F1F9F8];
    a6->var3 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)&a6->var0 = v13;
    id v11 = (id)v12;
  }
  v40 = v11;
  v42 = [MEMORY[0x1E4F1CA48] array];
  id v14 = (id)[MEMORY[0x1E4F1CA48] arrayWithArray:v10];
  long long v55 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  obuint64_t j = v10;
  uint64_t v15 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v53;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v53 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
        v19 = [v18 objectForKeyedSubscript:@"petsBounds"];
        if (v19)
        {
          v20 = [v18 objectForKeyedSubscript:@"petsConfidence"];
          [v20 floatValue];
          int v22 = v21;

          v23 = [VCPPetsRegion alloc];
          NSRect v66 = NSRectFromString(v19);
          LODWORD(v24) = v22;
          v25 = -[VCPPetsRegion initWith:confidence:](v23, "initWith:confidence:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height, v24);
          if (!v25)
          {

            id v38 = [MEMORY[0x1E4F1C978] array];
            goto LABEL_25;
          }
          [v42 addObject:v25];
        }
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v43 = v40;
  uint64_t v26 = [v43 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v26)
  {
    uint64_t v44 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v49 != v44) {
          objc_enumerationMutation(v43);
        }
        v28 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        v60[0] = @"petsBounds";
        [v28 bound];
        v29 = NSStringFromRect(v67);
        v60[1] = @"petsConfidence";
        v61[0] = v29;
        v30 = NSNumber;
        [v28 confidence];
        v31 = objc_msgSend(v30, "numberWithFloat:");
        v61[1] = v31;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];

        CMTime time = (CMTime)*a6;
        v58[0] = @"start";
        CFDictionaryRef v33 = CMTimeCopyAsDictionary(&time, 0);
        v59[0] = v33;
        v58[1] = @"duration";
        CMTime time = (CMTime)*a5;
        CMTime rhs = (CMTime)*a6;
        CMTimeSubtract(&v47, &time, &rhs);
        CMTime time = v47;
        CFDictionaryRef v34 = CMTimeCopyAsDictionary(&time, 0);
        v58[2] = @"attributes";
        v59[1] = v34;
        v59[2] = v32;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:3];
        [v46 addObject:v35];
      }
      uint64_t v26 = [v43 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v26);
  }

  if ([v42 count])
  {
    id v36 = v42;

    long long v37 = *(_OWORD *)&a5->var0;
    a6->var3 = a5->var3;
    *(_OWORD *)&a6->var0 = v37;
  }
  else
  {
    id v36 = v43;
  }
  id v38 = v36;
  v40 = v38;
LABEL_25:

  return v38;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6 frameStats:(id)a7
{
  id v10 = a7;
  id v11 = (void *)MEMORY[0x1C186D320]();
  uint64_t v33 = 0;
  CMTime lhs = *(CMTime *)a4;
  CMTime rhs = (CMTime)self->_timeLastProcess;
  CMTimeSubtract(&time, &lhs, &rhs);
  if (CMTimeGetSeconds(&time) >= 1.0)
  {
    petsAnalyer = self->_petsAnalyer;
    id v31 = 0;
    int v12 = [(VCPImagePetsAnalyzer *)petsAnalyer analyzePixelBuffer:a3 flags:&v33 results:&v31 cancel:&__block_literal_global_0];
    id v15 = v31;
    long long v13 = v15;
    if (!v12)
    {
      uint64_t v16 = [v15 objectForKeyedSubscript:@"PetsResults"];
      petsDetections = self->_petsDetections;
      long long v29 = *(_OWORD *)&a4->var0;
      int64_t var3 = a4->var3;
      v18 = [(VCPVideoPetsAnalyzer *)self parseResults:v16 toDetections:petsDetections atTime:&v29 fromTime:&self->_petsStart addActiveRegions:self->_petsActiveRegions];
      petsActiveRegions = self->_petsActiveRegions;
      self->_petsActiveRegions = v18;

      v20 = [v13 objectForKeyedSubscript:@"PetsFaceResults"];
      petsFaceDetections = self->_petsFaceDetections;
      long long v27 = *(_OWORD *)&a4->var0;
      int64_t v28 = a4->var3;
      int v22 = [(VCPVideoPetsAnalyzer *)self parseResults:v20 toDetections:petsFaceDetections atTime:&v27 fromTime:&self->_petsFaceStart addActiveRegions:self->_petsFaceActiveRegions];
      petsFaceActiveRegions = self->_petsFaceActiveRegions;
      self->_petsFaceActiveRegions = v22;

      int v12 = 0;
      long long v24 = *(_OWORD *)&a4->var0;
      self->_timeLastProcess.epoch = a4->var3;
      *(_OWORD *)&self->_timeLastProcess.value = v24;
    }
  }
  else
  {
    int v12 = 0;
    long long v13 = 0;
  }
  if (!v12)
  {
    v25 = [v13 objectForKeyedSubscript:@"PetsResults"];
    [v10 setPetsDetections:v25];
  }
  return v12;
}

uint64_t __80__VCPVideoPetsAnalyzer_analyzeFrame_withTimestamp_andDuration_flags_frameStats___block_invoke()
{
  return 0;
}

- (int)analyzeFrame:(__CVBuffer *)a3 withTimestamp:(id *)a4 andDuration:(id *)a5 flags:(unint64_t *)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  return [(VCPVideoPetsAnalyzer *)self analyzeFrame:a3 withTimestamp:&v8 andDuration:&v7 flags:a6 frameStats:0];
}

- (void)addDetectionToDict:(id *)a3 withActiveRegions:(id)a4 forPetsDetections:(id)a5 fromTime:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v20 = a4;
  id v23 = a5;
  memset(&v31, 0, sizeof(v31));
  long long v9 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v9;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v30, &range);
  CMTime lhs = v30;
  CMTime rhs = *(CMTime *)a6;
  CMTimeSubtract(&v31, &lhs, &rhs);
  CMTime time = v31;
  if (CMTimeGetSeconds(&time) > 0.300000012)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    obuint64_t j = v20;
    uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    if (v10)
    {
      uint64_t v22 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(obj);
          }
          int v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v36[0] = @"petsBounds";
          [v12 bound];
          long long v13 = NSStringFromRect(v40);
          v37[0] = v13;
          v36[1] = @"petsConfidence";
          id v14 = NSNumber;
          [v12 confidence];
          id v15 = objc_msgSend(v14, "numberWithFloat:");
          v37[1] = v15;
          uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

          CMTime lhs = (CMTime)*a6;
          v34[0] = @"start";
          CFDictionaryRef v17 = CMTimeCopyAsDictionary(&lhs, 0);
          v35[0] = v17;
          v34[1] = @"duration";
          CMTime lhs = v31;
          CFDictionaryRef v18 = CMTimeCopyAsDictionary(&lhs, 0);
          v34[2] = @"attributes";
          v35[1] = v18;
          v35[2] = v16;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:3];
          [v23 addObject:v19];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
      }
      while (v10);
    }
  }
}

- (int)finishAnalysisPass:(id *)a3
{
  if ([(NSArray *)self->_petsActiveRegions count])
  {
    long long v5 = *(_OWORD *)&a3->var0.var3;
    v21[0] = *(_OWORD *)&a3->var0.var0;
    v21[1] = v5;
    petsActiveRegions = self->_petsActiveRegions;
    v21[2] = *(_OWORD *)&a3->var1.var1;
    petsDetections = self->_petsDetections;
    long long v19 = *(_OWORD *)&self->_petsStart.value;
    int64_t epoch = self->_petsStart.epoch;
    [(VCPVideoPetsAnalyzer *)self addDetectionToDict:v21 withActiveRegions:petsActiveRegions forPetsDetections:petsDetections fromTime:&v19];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [MEMORY[0x1E4F1C978] array];
    long long v9 = self->_petsActiveRegions;
    self->_petsActiveRegions = v8;
  }
  if ([(NSArray *)self->_petsFaceActiveRegions count])
  {
    long long v10 = *(_OWORD *)&a3->var0.var3;
    v18[0] = *(_OWORD *)&a3->var0.var0;
    v18[1] = v10;
    petsFaceActiveRegions = self->_petsFaceActiveRegions;
    v18[2] = *(_OWORD *)&a3->var1.var1;
    petsFaceDetections = self->_petsFaceDetections;
    long long v16 = *(_OWORD *)&self->_petsFaceStart.value;
    int64_t v17 = self->_petsFaceStart.epoch;
    [(VCPVideoPetsAnalyzer *)self addDetectionToDict:v18 withActiveRegions:petsFaceActiveRegions forPetsDetections:petsFaceDetections fromTime:&v16];
    long long v13 = [MEMORY[0x1E4F1C978] array];
    id v14 = self->_petsFaceActiveRegions;
    self->_petsFaceActiveRegions = v13;
  }
  return 0;
}

- (id)results
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_petsDetections count]) {
    [v3 setValue:self->_petsDetections forKey:@"PetsResults"];
  }
  if ([(NSMutableArray *)self->_petsFaceDetections count]) {
    [v3 setValue:self->_petsFaceDetections forKey:@"PetsFaceResults"];
  }
  if ([v3 count]) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petsFaceActiveRegions, 0);
  objc_storeStrong((id *)&self->_petsActiveRegions, 0);
  objc_storeStrong((id *)&self->_petsAnalyer, 0);
  objc_storeStrong((id *)&self->_petsFaceDetections, 0);
  objc_storeStrong((id *)&self->_petsDetections, 0);
}

@end