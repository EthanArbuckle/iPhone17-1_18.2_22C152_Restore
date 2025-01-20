@interface ADExecutor
- (ADExecutor)init;
- (NSString)networkVersionString;
- (id)getIntermediateWithName:(id)a3;
- (id)getIntermediates;
- (int64_t)convertIntrinsicsFrom:(__CVBuffer *)a3 cropBy:(CGRect)a4 to:(__CVBuffer *)a5;
- (int64_t)numberOfExecutionSteps;
- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 descriptorForROI:(id)a5 exifOrientation:(unsigned int)a6 rotationPreference:(unint64_t)a7 inferenceDescriptor:(id)a8;
- (int64_t)solveRotationPreference:(unint64_t)a3;
- (void)dealloc;
- (void)frameExecutionEnd;
- (void)frameExecutionStart;
@end

@implementation ADExecutor

- (ADExecutor)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADExecutor;
  v2 = [(ADExecutor *)&v8 init];
  v3 = (ADExecutor *)v2;
  if (v2)
  {
    long long v4 = *MEMORY[0x263F001A8];
    *(_OWORD *)(v2 + 24) = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)(v2 + 8) = v4;
    *((void *)v2 + 5) = 255;
    *((_DWORD *)v2 + 12) = 1;
    int v5 = [MEMORY[0x263F28048] hasANE];
    uint64_t v6 = 2;
    if (v5) {
      uint64_t v6 = 4;
    }
    v3->_engineType = v6;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currFrameStartTime, 0);
  objc_storeStrong((id *)&self->_espressoRunner, 0);
}

- (int64_t)numberOfExecutionSteps
{
  return 999;
}

- (id)getIntermediateWithName:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v20 = v4;
  [(ADExecutor *)self getIntermediates];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      uint64_t v19 = v6;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        v10 = [v9 objectForKeyedSubscript:@"name"];
        if ([v10 isEqualToString:v4])
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v11 = [v9 allKeys];
          uint64_t v12 = v7;
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v23;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v11);
                }
                v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
                if (([v16 isEqualToString:@"name"] & 1) == 0)
                {
                  v17 = [v9 objectForKeyedSubscript:v16];

                  id v4 = v20;
                  id v5 = v21;

                  goto LABEL_21;
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }

          id v4 = v20;
          id v5 = v21;
          uint64_t v7 = v12;
          uint64_t v6 = v19;
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      v17 = 0;
    }
    while (v6);
  }
  else
  {
    v17 = 0;
  }
LABEL_21:

  return v17;
}

- (id)getIntermediates
{
  return (id)MEMORY[0x263EFFA68];
}

- (int64_t)convertIntrinsicsFrom:(__CVBuffer *)a3 cropBy:(CGRect)a4 to:(__CVBuffer *)a5
{
  v59[2] = *MEMORY[0x263EF8340];
  if (!a3) {
    return -22953;
  }
  double y = a4.origin.y;
  double x = a4.origin.x;
  CFTypeRef Attachment = CVBufferGetAttachment(a3, @"Calibration Data", 0);
  if (!Attachment) {
    return -22953;
  }
  v10 = (void *)Attachment;
  CFRetain(Attachment);
  CFTypeID v11 = CFGetTypeID(v10);
  if (v11 != CFDictionaryGetTypeID())
  {
    CFRelease(v10);
    return -22953;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:@"Sensors"];
  uint64_t v13 = [v12 objectForKeyedSubscript:@"Intrinsics"];
  uint64_t v14 = [v13 allKeys];
  v15 = [v14 firstObject];

  v16 = [v10 objectForKeyedSubscript:@"Sensors"];
  v17 = [v16 objectForKeyedSubscript:@"Intrinsics"];
  v18 = [v17 objectForKeyedSubscript:v15];

  if (v18)
  {
    uint64_t v19 = [v18 objectForKeyedSubscript:@"Pinhole"];
    id v20 = [v19 objectForKeyedSubscript:@"Principal Point"];
    id v21 = [v20 objectForKeyedSubscript:@"Data"];

    long long v22 = [v18 objectForKeyedSubscript:@"Pinhole"];
    long long v23 = [v22 objectForKeyedSubscript:@"Focal Length"];
    long long v24 = [v23 objectForKeyedSubscript:@"Data"];

    int64_t v25 = -22953;
    if (v21 && v24)
    {
      long long v26 = [v24 objectAtIndex:0];
      [v26 doubleValue];
      double v28 = v27;

      long long v29 = [v21 objectAtIndex:0];
      [v29 doubleValue];
      double v31 = v30;
      uint64_t v32 = [v21 objectAtIndex:1];
      [v32 doubleValue];
      double v34 = v33;

      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      size_t v37 = CVPixelBufferGetWidth(a5);
      size_t v38 = CVPixelBufferGetHeight(a5);
      double v39 = (double)Width;
      double v40 = (double)v37;
      if ((double)Width / (double)Height == (double)v37 / (double)v38)
      {
        double v42 = v31 - x;
        double v43 = v40 / v39;
        v58[0] = @"Principal Point";
        v56 = @"Data";
        v55[0] = [NSNumber numberWithDouble:v42 * (v40 / v39)];
        v50 = (void *)v55[0];
        v49 = [NSNumber numberWithDouble:(v34 - y) * v43];
        v55[1] = v49;
        v48 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
        v57 = v48;
        v47 = [NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
        v58[1] = @"Focal Length";
        v59[0] = v47;
        v53 = @"Data";
        v44 = [NSNumber numberWithDouble:v28 * v43];
        v52 = v44;
        v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
        v54 = v45;
        v46 = [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        v59[1] = v46;
        CVBufferSetAttachment(a5, @"Calibration Data", (CFTypeRef)[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:2], kCVAttachmentMode_ShouldPropagate);

        int64_t v25 = 0;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot convert intrinsics when aspect ratios don't match", buf, 2u);
        }
        int64_t v25 = -22951;
      }
    }
  }
  else
  {
    int64_t v25 = -22953;
  }

  return v25;
}

- (NSString)networkVersionString
{
  return (NSString *)[(ADEspressoRunner *)self->_espressoRunner networkVersionString];
}

- (int64_t)solveRotationPreference:(unint64_t)a3
{
  int v5 = objc_msgSend(MEMORY[0x263F26CA8], "isLandscapeSize:", self->_inputRoi.size.width, self->_inputRoi.size.height);
  int v6 = v5 ^ [MEMORY[0x263F26CA8] isLandscape:self->_layout];
  if (self->_layout == 255) {
    int v6 = 0;
  }
  if (a3 == 2)
  {
    if (v6) {
      return 3;
    }
    else {
      return 0;
    }
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        unsigned int v7 = self->_inputOrientation - 2;
        if (v7 < 7) {
          return qword_215FC5528[v7];
        }
      }
      return 0;
    }
    unsigned int inputOrientation = self->_inputOrientation;
    if (v6)
    {
      if (inputOrientation - 5 < 4) {
        return qword_215FC47E8[inputOrientation - 5];
      }
      return 0;
    }
    return 2 * (inputOrientation - 3 < 2);
  }
}

- (int64_t)prepareForEngineType:(unint64_t)a3 roi:(CGRect)a4 descriptorForROI:(id)a5 exifOrientation:(unsigned int)a6 rotationPreference:(unint64_t)a7 inferenceDescriptor:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v17 = a5;
  id v18 = a8;
  if (ADDebugUtilsADVerboseLogsEnabled)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 134219520;
      unint64_t v34 = a3;
      __int16 v35 = 2048;
      CGFloat v36 = x;
      __int16 v37 = 2048;
      CGFloat v38 = y;
      __int16 v39 = 2048;
      CGFloat v40 = width;
      __int16 v41 = 2048;
      CGFloat v42 = height;
      __int16 v43 = 1024;
      int v44 = v10;
      __int16 v45 = 2048;
      unint64_t v46 = a7;
      _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "preparing executor with engine %lu, roi: (%f,%f,%f,%f) orientation %d, rotation preference %lu", (uint8_t *)&v33, 0x44u);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    int v33 = 134219520;
    unint64_t v34 = a3;
    __int16 v35 = 2048;
    CGFloat v36 = x;
    __int16 v37 = 2048;
    CGFloat v38 = y;
    __int16 v39 = 2048;
    CGFloat v40 = width;
    __int16 v41 = 2048;
    CGFloat v42 = height;
    __int16 v43 = 1024;
    int v44 = v10;
    __int16 v45 = 2048;
    unint64_t v46 = a7;
    _os_log_debug_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "preparing executor with engine %lu, roi: (%f,%f,%f,%f) orientation %d, rotation preference %lu", (uint8_t *)&v33, 0x44u);
  }
  self->_inputRoi.origin.CGFloat x = x;
  self->_inputRoi.origin.CGFloat y = y;
  self->_inputRoi.size.CGFloat width = width;
  self->_inputRoi.size.CGFloat height = height;
  self->_unsigned int inputOrientation = v10;
  self->_rotationPreference = a7;
  v48.origin.CGFloat x = x;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  if (CGRectIsEmpty(v48))
  {
    unint64_t v19 = 255;
    goto LABEL_12;
  }
  uint64_t v20 = objc_msgSend(v17, "layoutForSize:", self->_inputRoi.size.width, self->_inputRoi.size.height);
  unint64_t v19 = [MEMORY[0x263F26CA8] adjustLayout:v20 sourceOrientation:v10 toRotationPreference:a7];
  if (v19 != 254)
  {
LABEL_12:
    if (self->_layout != v19 || self->_engineType != a3 || (long long v22 = self->_espressoRunner) == 0)
    {
      self->_unint64_t engineType = a3;
      self->_layout = v19;
      long long v23 = (ADEspressoRunner *)objc_alloc(MEMORY[0x263F26C58]);
      espressoRunner = self->_espressoRunner;
      self->_espressoRunner = v23;

      int64_t v25 = self->_espressoRunner;
      long long v26 = [v18 networkURL];
      double v27 = [v26 absoluteString];
      unint64_t engineType = self->_engineType;
      long long v29 = [v18 configurationNameForLayout:self->_layout];
      double v30 = [(ADEspressoRunner *)v25 initWithPath:v27 forEngine:engineType configurationName:v29];
      double v31 = self->_espressoRunner;
      self->_espressoRunner = v30;

      self->_rotationConstant = [(ADExecutor *)self solveRotationPreference:self->_rotationPreference];
      long long v22 = self->_espressoRunner;
    }
    if (v22) {
      int64_t v21 = 0;
    }
    else {
      int64_t v21 = -22960;
    }
    goto LABEL_19;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v33) = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot prepare executor with unknown layout", (uint8_t *)&v33, 2u);
  }
  int64_t v21 = -22957;
LABEL_19:

  return v21;
}

- (void)frameExecutionEnd
{
  v3 = [MEMORY[0x263EFF910] now];
  [v3 timeIntervalSinceDate:self->_currFrameStartTime];
  self->_totalFrameTime = v4 + self->_totalFrameTime;

  ++self->_framesCompleted;
}

- (void)frameExecutionStart
{
  v3 = [MEMORY[0x263EFF910] now];
  currFrameStartTime = self->_currFrameStartTime;
  self->_currFrameStartTime = v3;

  ++self->_framesStarted;
}

- (void)dealloc
{
  v25[5] = *MEMORY[0x263EF8340];
  v24[0] = @"ExecutorName";
  v3 = (objc_class *)objc_opt_class();
  double v4 = NSStringFromClass(v3);
  v25[0] = v4;
  v24[1] = @"FramesStarted";
  int v5 = [NSNumber numberWithUnsignedLong:self->_framesStarted];
  v25[1] = v5;
  v24[2] = @"FramesCompleted";
  int v6 = [NSNumber numberWithUnsignedLong:self->_framesCompleted];
  v25[2] = v6;
  v24[3] = @"AverageFrameTime";
  unint64_t framesCompleted = self->_framesCompleted;
  if (framesCompleted) {
    double v8 = self->_totalFrameTime / (double)framesCompleted * 1000.0;
  }
  else {
    double v8 = 0.0;
  }
  v9 = [NSNumber numberWithDouble:v8];
  v25[3] = v9;
  v24[4] = @"Process";
  uint64_t v10 = [MEMORY[0x263F08AB0] processInfo];
  CFTypeID v11 = [v10 processName];
  v25[4] = v11;
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];

  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  unint64_t v19 = __21__ADExecutor_dealloc__block_invoke;
  uint64_t v20 = &unk_26425B998;
  id v13 = v12;
  id v21 = v13;
  char v14 = AnalyticsSendEventLazy();
  if (ADDebugUtilsADVerboseLogsEnabled) {
    char v15 = v14;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v23 = @"com.apple.AppleDepth.ExecutorStatistics";
    _os_log_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed sending event %@ to CoreAnalytics", buf, 0xCu);
  }

  v16.receiver = self;
  v16.super_class = (Class)ADExecutor;
  [(ADExecutor *)&v16 dealloc];
}

id __21__ADExecutor_dealloc__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end