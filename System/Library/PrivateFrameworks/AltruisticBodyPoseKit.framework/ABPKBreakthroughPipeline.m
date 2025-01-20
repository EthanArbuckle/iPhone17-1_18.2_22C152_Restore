@interface ABPKBreakthroughPipeline
- (ABPKBreakthroughPipeline)init;
- (ABPKBreakthroughPipeline)initWithFrequency:(unsigned int)a3;
- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5;
- (int)runWithInput:(__CVBuffer *)a3 atTimeStamp:(double)a4 andOutput:(id)a5;
@end

@implementation ABPKBreakthroughPipeline

- (ABPKBreakthroughPipeline)init
{
  return [(ABPKBreakthroughPipeline *)self initWithFrequency:30];
}

- (ABPKBreakthroughPipeline)initWithFrequency:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v8.receiver = self;
  v8.super_class = (Class)ABPKBreakthroughPipeline;
  v4 = [(ABPKBreakthroughPipeline *)&v8 init];
  if (v4)
  {
    v5 = [[ABPKGestureDetectionPipeline alloc] initWithFrequency:v3];
    gestureDetection = v4->_gestureDetection;
    v4->_gestureDetection = v5;
  }
  return v4;
}

- (int)runWithInput:(__CVBuffer *)a3 atTimeStamp:(double)a4 andOutput:(id)a5
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v34 = a5;
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(ABPKGestureDetectionPipeline *)self->_gestureDetection runWithInput:a3 abpkDeviceOrientation:3 atTimeStamp:v8 andOutput:a4])
  {
    v10 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_ERROR, " Gesture detection failed ", buf, 2u);
    }

    int v11 = 1;
  }
  else
  {
    unint64_t v12 = 0;
    *(void *)&long long v9 = 138412290;
    long long v33 = v9;
    while (objc_msgSend(v8, "count", v33) > v12)
    {
      v35 = objc_alloc_init(ABPKBreakthroughResult);
      v13 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = [v8 objectAtIndexedSubscript:v12];
        v15 = [v14 gestureTypes];
        *(_DWORD *)buf = v33;
        v37 = v15;
        _os_log_impl(&dword_21B7C6000, v13, OS_LOG_TYPE_DEBUG, " Gestures detected: %@ ", buf, 0xCu);
      }
      unint64_t v16 = 0;
      char v17 = 0;
      char v18 = 0;
      char v19 = 0;
      while (1)
      {
        v20 = [v8 objectAtIndexedSubscript:v12];
        v21 = [v20 gestureTypes];
        BOOL v22 = [v21 count] > v16;

        if (!v22) {
          break;
        }
        v23 = [v8 objectAtIndexedSubscript:v12];
        v24 = [v23 gestureTypes];
        v25 = [v24 objectAtIndexedSubscript:v16];
        uint64_t v26 = [v25 integerValue];

        if (v26)
        {
          if (v26 == 1)
          {
            char v18 = 1;
          }
          else if (v26 == 2)
          {
            char v17 = 1;
          }
        }
        else
        {
          char v19 = 1;
        }
        ++v16;
      }
      v27 = [v8 objectAtIndexedSubscript:v12];
      v28 = [v27 skeleton2D];
      v29 = [v8 objectAtIndexedSubscript:v12];
      uint64_t v30 = [v29 isPoseValid];
      v31 = [v8 objectAtIndexedSubscript:v12];
      -[ABPKBreakthroughResult set2dSkeleton:isPoseValid:trackingId:isFaceVisible:isRaisingHand:isWavingHand:](v35, "set2dSkeleton:isPoseValid:trackingId:isFaceVisible:isRaisingHand:isWavingHand:", v28, v30, [v31 trackingId], v17 & 1, v18 & 1, v19 & 1);

      [v34 addObject:v35];
      ++v12;
    }
    int v11 = 0;
  }

  return v11;
}

- (BOOL)overlayResult:(id)a3 OnImage:(__CVBuffer *)a4 andGenerateOverlayImage:(__CVBuffer *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = operator new(0xC0uLL);
  unint64_t v9 = 0;
  *id v8 = xmmword_21B813570;
  v8[1] = xmmword_21B813580;
  *(void *)&long long v10 = 255;
  *((void *)&v10 + 1) = 255;
  v8[2] = xmmword_21B813590;
  v8[3] = v10;
  v8[4] = xmmword_21B8135A0;
  v8[5] = xmmword_21B8135B0;
  *(void *)&long long v11 = 0xFF000000FFLL;
  *((void *)&v11 + 1) = 0xFF000000FFLL;
  v8[6] = v11;
  v8[7] = 0u;
  v8[8] = xmmword_21B8135C0;
  v8[9] = xmmword_21B8135D0;
  v8[10] = xmmword_21B8135E0;
  v8[11] = xmmword_21B8135F0;
  long long v20 = 0x8000100uLL;
  while (v9 < objc_msgSend(v7, "count", v20))
  {
    unint64_t v12 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v20;
      unint64_t v22 = v9;
      _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " \x10Overlaying result for Person: %lu ", buf, 0xCu);
    }

    v13 = [v7 objectAtIndexedSubscript:v9];
    if ([v13 isFaceVisible])
    {
      if ([v13 isWavingHand]) {
        int v14 = 1;
      }
      else {
        int v14 = [v13 isRaisingHand];
      }
    }
    else
    {
      int v14 = 0;
    }
    unsigned int v15 = [v13 trackingId];
    if (v14)
    {
      unint64_t v16 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " Breakthrough detected ", buf, 2u);
      }

      *(void *)&long long v17 = 0xFF00000000;
    }
    else
    {
      long long v17 = v8[v15 % 0xC];
    }
    if (v9) {
      char v18 = a5;
    }
    else {
      char v18 = a4;
    }
    [v13 overlayResultOnImage:v18 withResult:a5 withColor:*(double *)&v17];

    ++v9;
  }
  operator delete(v8);

  return 1;
}

- (void).cxx_destruct
{
}

@end