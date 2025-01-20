@interface StabilizeParamGenerator
- (AutoLoopStabilizer)stabilizer;
- (StabilizeParamGenerator)initWithStabilizer:(id)a3;
- (id)generatePassThruForAsset:(id)a3 trimStart:(id *)a4 trimLength:(id *)a5;
- (id)generateStabilizeParams;
- (id)generateTrivialPassThruForFrameTimes:(void *)a3 totalDuration:(id *)a4;
- (void)CopyCoordinateShiftedHomographies:(void *)a3 firstIndex:(unint64_t)a4 lastIndex:(unint64_t)a5 toStabilizeParams:(id)a6 withImageBounds:(CGSize)a7;
- (void)ICGetIdentityHomographies:(void *)a3 toStabilizeParams:(id)a4 withImageBounds:(CGSize)a5 firstFrameIndex:(unint64_t)a6 lastFrameIndex:(unint64_t)a7;
- (void)setStabilizer:(id)a3;
@end

@implementation StabilizeParamGenerator

- (void)ICGetIdentityHomographies:(void *)a3 toStabilizeParams:(id)a4 withImageBounds:(CGSize)a5 firstFrameIndex:(unint64_t)a6 lastFrameIndex:(unint64_t)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  ICGetIdentityHomographies();
  long long v24 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v21 + 1) + 8 * v9);
        CFDictionaryRef v11 = [v10 objectForKeyedSubscript:@"rawTime"];
        CMTimeMakeFromDictionary(&v18, v11);
        CMTime v20 = v18;

        v12 = [v10 objectForKeyedSubscript:@"homography"];
        for (uint64_t i = 0; i != 9; ++i)
        {
          v14 = [v12 objectAtIndexedSubscript:i];
          [v14 floatValue];
          v19[i] = v15;
        }
        [v17 append:v19];

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (void)CopyCoordinateShiftedHomographies:(void *)a3 firstIndex:(unint64_t)a4 lastIndex:(unint64_t)a5 toStabilizeParams:(id)a6 withImageBounds:(CGSize)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v17 = a6;
  ICGetCoordinateShiftedHomographies();
  long long v24 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(id *)(*((void *)&v21 + 1) + 8 * v9);
        CFDictionaryRef v11 = [v10 objectForKeyedSubscript:@"rawTime"];
        CMTimeMakeFromDictionary(&v18, v11);
        CMTime v20 = v18;

        v12 = [v10 objectForKeyedSubscript:@"homography"];
        for (uint64_t i = 0; i != 9; ++i)
        {
          v14 = [v12 objectAtIndexedSubscript:i];
          [v14 floatValue];
          v19[i] = v15;
        }
        [v17 append:v19];

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
}

- (id)generateStabilizeParams
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  [(AutoLoopStabilizer *)self->stabilizer inputMovieDimensions];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(AutoLoopStabilizer *)self->stabilizer icCorrectionResultRef];
  if (v7)
  {
    uint64_t v8 = v7;
    id v30 = +[StabilizeParams stabilizeParams];
    CMTime v47 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F0];
    CMTime v46 = v47;
    ICGetResultFramePresentationTimes();
    __p = 0;
    v44 = 0;
    v29 = v45 = 0;
    sub_1DD3ABBB0(&__p, [v29 count]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = v29;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(v9);
          }
          CMTimeMakeFromDictionary(&v38, *(CFDictionaryRef *)(*((void *)&v39 + 1) + 8 * i));
          v13 = v44;
          if (v44 >= (void *)v45)
          {
            unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44 - (unsigned char *)__p) >> 3);
            unint64_t v17 = v16 + 1;
            if (v16 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_1DD3A9B50();
            }
            if (0x5555555555555556 * ((v45 - (unsigned char *)__p) >> 3) > v17) {
              unint64_t v17 = 0x5555555555555556 * ((v45 - (unsigned char *)__p) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((v45 - (unsigned char *)__p) >> 3) >= 0x555555555555555) {
              unint64_t v18 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v18 = v17;
            }
            if (v18) {
              v19 = (char *)sub_1DD3A9BF8((uint64_t)&v45, v18);
            }
            else {
              v19 = 0;
            }
            CMTime v20 = &v19[24 * v16];
            long long v21 = *(_OWORD *)&v38.value;
            *((void *)v20 + 2) = v38.epoch;
            *(_OWORD *)CMTime v20 = v21;
            long long v23 = (char *)__p;
            long long v22 = (char *)v44;
            long long v24 = v20;
            if (v44 != __p)
            {
              do
              {
                long long v25 = *(_OWORD *)(v22 - 24);
                *((void *)v24 - 1) = *((void *)v22 - 1);
                *(_OWORD *)(v24 - 24) = v25;
                v24 -= 24;
                v22 -= 24;
              }
              while (v22 != v23);
              long long v22 = (char *)__p;
            }
            int v15 = v20 + 24;
            __p = v24;
            v44 = v20 + 24;
            v45 = &v19[24 * v18];
            if (v22) {
              operator delete(v22);
            }
          }
          else
          {
            long long v14 = *(_OWORD *)&v38.value;
            v44[2] = v38.epoch;
            _OWORD *v13 = v14;
            int v15 = (void *)v13 + 3;
          }
          v44 = v15;
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v10);
    }

    if (v44 != __p)
    {
      CMTime v47 = *(CMTime *)__p;
      unint64_t v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v44 - (unsigned char *)__p) >> 3) - 1;
      CMTime v38 = *(CMTime *)((unsigned char *)__p + v26);
      CMTime lhs = v38;
      stabilizer = self->stabilizer;
      if (stabilizer) {
        [(AutoLoopStabilizer *)stabilizer minimumFrameDuration];
      }
      else {
        memset(&rhs, 0, sizeof(rhs));
      }
      CMTimeAdd(&v37, &lhs, &rhs);
      CMTime v38 = v37;
      CMTime v34 = v37;
      CMTime v33 = v47;
      CMTimeSubtract(&v37, &v34, &v33);
      CMTime v46 = v37;
      if ([(AutoLoopStabilizer *)self->stabilizer lastStabilizationResult] == 4)
      {
        [v30 setPassThrough:1];
        objc_msgSend(v30, "setCropRect:", 0.0, 0.0, v4, v6);
        -[StabilizeParamGenerator ICGetIdentityHomographies:toStabilizeParams:withImageBounds:firstFrameIndex:lastFrameIndex:](self, "ICGetIdentityHomographies:toStabilizeParams:withImageBounds:firstFrameIndex:lastFrameIndex:", v8, v30, 0, v26, v4, v6);
      }
      else
      {
        [(AutoLoopStabilizer *)self->stabilizer cropRect];
        objc_msgSend(v30, "setCropRect:");
        -[StabilizeParamGenerator CopyCoordinateShiftedHomographies:firstIndex:lastIndex:toStabilizeParams:withImageBounds:](self, "CopyCoordinateShiftedHomographies:firstIndex:lastIndex:toStabilizeParams:withImageBounds:", v8, 0, v26, v30, v4, v6);
      }
    }
    CMTime v32 = v47;
    objc_msgSend(v30, "setRoiStart:", &v32, v8);
    CMTime v31 = v46;
    [v30 setRoiLength:&v31];
    if (__p)
    {
      v44 = __p;
      operator delete(__p);
    }
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (id)generatePassThruForAsset:(id)a3 trimStart:(id *)a4 trimLength:(id *)a5
{
  id v8 = a3;
  id v9 = objc_alloc_init(AutoLoopStabilizer);
  [(StabilizeParamGenerator *)self setStabilizer:v9];

  uint64_t v10 = [(StabilizeParamGenerator *)self stabilizer];
  [v10 setMovieAssetIn:v8];

  if ((a4->var2 & 0x1D) == 1)
  {
    uint64_t v11 = [(StabilizeParamGenerator *)self stabilizer];
    long long v22 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [v11 setTrimStart:&v22];
  }
  if ((a5->var2 & 0x1D) == 1)
  {
    v12 = [(StabilizeParamGenerator *)self stabilizer];
    long long v20 = *(_OWORD *)&a5->var0;
    int64_t v21 = a5->var3;
    [v12 setTrimLength:&v20];
  }
  uint64_t v19 = 0;
  v13 = [(StabilizeParamGenerator *)self stabilizer];
  int v14 = [v13 analyzeForAutoloopWithDirect:0 toAnalysisOutput:&v19];

  if (v14
    && ([(StabilizeParamGenerator *)self stabilizer],
        int v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 processStabilizationAnalysis:v19 forcePassThru:1 forceSmoothing:0 forceSequentialTripod:0], v15, v16 == 4))
  {
    unint64_t v17 = [(StabilizeParamGenerator *)self generateStabilizeParams];
  }
  else
  {
    unint64_t v17 = 0;
  }

  return v17;
}

- (id)generateTrivialPassThruForFrameTimes:(void *)a3 totalDuration:(id *)a4
{
  double v6 = +[StabilizeParams stabilizeParams];
  [v6 setPassThrough:1];
  objc_msgSend(v6, "setCropRect:", 0.0, 0.0, 1.0, 1.0);
  uint64_t v7 = *(long long **)a3;
  if (*((void *)a3 + 1) == *(void *)a3) {
    sub_1DD3B37AC();
  }
  long long v8 = *v7;
  uint64_t v13 = *((void *)v7 + 2);
  long long v12 = v8;
  [v6 setRoiStart:&v12];
  long long v10 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  [v6 setRoiLength:&v10];

  return v6;
}

- (StabilizeParamGenerator)initWithStabilizer:(id)a3
{
  return self;
}

- (AutoLoopStabilizer)stabilizer
{
  return self->stabilizer;
}

- (void)setStabilizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end