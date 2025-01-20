@interface ARImageScalingTechnique
+ (id)scalingPassDescriptionForInputSize:(CGSize)a3 scaledSize:(CGSize)a4 conversionPixelFormat:(unsigned int)a5;
- (ARImageScalingTechnique)initWithDownscaleFactor:(unsigned __int8)a3;
- (ARImageScalingTechnique)initWithScaledSize:(CGSize)a3;
- (BOOL)isEqual:(id)a3;
- (CGSize)scaledSize;
- (__CVBuffer)_applyScalingPasses:(__CVBuffer *)a3;
- (id)processData:(id)a3;
- (unint64_t)requiredSensorDataTypes;
- (unsigned)conversionPixelFormatType;
- (unsigned)downscaleFactor;
- (void)_createScalingPassesForInputSize:(CGSize)a3;
- (void)setConversionPixelFormatType:(unsigned int)a3;
@end

@implementation ARImageScalingTechnique

- (ARImageScalingTechnique)initWithDownscaleFactor:(unsigned __int8)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ARImageScalingTechnique;
  v4 = [(ARTechnique *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_downscaleFactor = a3;
    v4->_shouldUseScaleFactor = 1;
    v4->_conversionPixelFormatType = 0;
    v4->_scalingInputSize = (CGSize)*MEMORY[0x1E4F1DB30];
    scalingPasses = v4->_scalingPasses;
    v4->_scalingPasses = 0;
  }
  return v5;
}

- (ARImageScalingTechnique)initWithScaledSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ARImageScalingTechnique;
  v5 = [(ARTechnique *)&v9 init];
  v6 = v5;
  if (v5)
  {
    v5->_downscaleFactor = 0;
    v5->_conversionPixelFormatType = 0;
    v5->_scaledSize.CGFloat width = width;
    v5->_scaledSize.CGFloat height = height;
    v5->_shouldUseScaleFactor = 0;
    v5->_scalingInputSize = (CGSize)*MEMORY[0x1E4F1DB30];
    scalingPasses = v5->_scalingPasses;
    v5->_scalingPasses = 0;
  }
  return v6;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = (ARModifiedImageData *)v4;
  v7 = v6;
  objc_super v8 = v6;
  if (isKindOfClass)
  {
    double Width = (double)CVPixelBufferGetWidth([(ARImageData *)v6 pixelBuffer]);
    double Height = (double)CVPixelBufferGetHeight([(ARImageData *)v7 pixelBuffer]);
    if (!self->_shouldUseScaleFactor) {
      goto LABEL_5;
    }
    if ([(ARImageScalingTechnique *)self downscaleFactor] > 1)
    {
LABEL_9:
      -[ARImageScalingTechnique _createScalingPassesForInputSize:](self, "_createScalingPassesForInputSize:", Width, Height);
      v14 = [(ARImageScalingTechnique *)self _applyScalingPasses:[(ARImageData *)v7 pixelBuffer]];
      objc_super v8 = [[ARModifiedImageData alloc] initWithImageData:v7];
      [(ARImageData *)v8 setPixelBuffer:v14];
      [(ARImageData *)v7 cameraIntrinsics];
      double v27 = v16;
      float v28 = v15;
      double v26 = v17;
      [(ARImageData *)v7 imageResolution];
      double v19 = v18;
      double v21 = v20;
      [(ARImageData *)v8 imageResolution];
      *(float *)&double v24 = ARAdjustIntrinsicsForViewportSize(v28, v27, v26, v19, v21, v22, v23);
      [(ARImageData *)v8 setCameraIntrinsics:v24];
      CVPixelBufferRelease(v14);
LABEL_11:

      goto LABEL_12;
    }
    if (!self->_shouldUseScaleFactor)
    {
LABEL_5:
      [(ARImageScalingTechnique *)self scaledSize];
      if (v12 != Width || v11 != Height) {
        goto LABEL_9;
      }
    }
    objc_super v8 = v7;
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (void)_createScalingPassesForInputSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  p_scaledSize = &self->_scaledSize;
  if (self->_shouldUseScaleFactor)
  {
    double v7 = a3.width / (double)[(ARImageScalingTechnique *)self downscaleFactor];
    double v8 = height / (double)[(ARImageScalingTechnique *)self downscaleFactor];
  }
  else
  {
    double v7 = p_scaledSize->width;
    double v8 = self->_scaledSize.height;
  }
  p_scalingInputSize = &self->_scalingInputSize;
  if (self->_scalingInputSize.width != width || self->_scalingInputSize.height != height) {
    goto LABEL_27;
  }
  double v11 = p_scaledSize->height;
  if (p_scaledSize->width != v7 || v11 != v8) {
    goto LABEL_27;
  }
  uint64_t v13 = [(NSMutableArray *)self->_scalingPasses lastObject];
  if (!v13
    || (v14 = (void *)v13,
        [(NSMutableArray *)self->_scalingPasses lastObject],
        float v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 conversionPixelFormatType],
        unsigned int v17 = [(ARImageScalingTechnique *)self conversionPixelFormatType],
        v15,
        v14,
        v16 != v17))
  {
LABEL_27:
    if (self->_scalingPasses)
    {
      kdebug_trace();
      double v18 = _ARLogTechnique_12();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        double v19 = (objc_class *)objc_opt_class();
        double v20 = NSStringFromClass(v19);
        *(_DWORD *)buf = 138543618;
        v36 = v20;
        __int16 v37 = 2048;
        v38 = self;
        _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recreating scaling passes", buf, 0x16u);
      }
      double v21 = _ARLogTechnique_12();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        double v22 = (objc_class *)objc_opt_class();
        double v23 = NSStringFromClass(v22);
        double v24 = p_scalingInputSize->width;
        CGFloat v25 = self->_scalingInputSize.height;
        CGFloat v26 = p_scaledSize->width;
        CGFloat v27 = p_scaledSize->height;
        *(_DWORD *)buf = 138544642;
        v36 = v23;
        __int16 v37 = 2048;
        v38 = self;
        __int16 v39 = 2048;
        double v40 = v24;
        __int16 v41 = 2048;
        CGFloat v42 = v25;
        __int16 v43 = 2048;
        double v44 = v26;
        __int16 v45 = 2048;
        double v46 = v27;
        _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was scaling from %.1f x %.1f to %.1f x %.1f", buf, 0x3Eu);
      }
      float v28 = _ARLogTechnique_12();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (objc_class *)objc_opt_class();
        v30 = NSStringFromClass(v29);
        *(_DWORD *)buf = 138544642;
        v36 = v30;
        __int16 v37 = 2048;
        v38 = self;
        __int16 v39 = 2048;
        double v40 = width;
        __int16 v41 = 2048;
        CGFloat v42 = height;
        __int16 v43 = 2048;
        double v44 = v7;
        __int16 v45 = 2048;
        double v46 = v8;
        _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: now scaling from %.1f x %.1f to %.1f x %.1f", buf, 0x3Eu);
      }
    }
    p_scalingInputSize->double width = width;
    self->_scalingInputSize.double height = height;
    p_scaledSize->double width = v7;
    p_scaledSize->double height = v8;
    v31 = objc_msgSend((id)objc_opt_class(), "scalingPassDescriptionForInputSize:scaledSize:conversionPixelFormat:", -[ARImageScalingTechnique conversionPixelFormatType](self, "conversionPixelFormatType"), p_scalingInputSize->width, self->_scalingInputSize.height, p_scaledSize->width, p_scaledSize->height);
    v32 = (NSMutableArray *)objc_opt_new();
    scalingPasses = self->_scalingPasses;
    self->_scalingPasses = v32;

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __60__ARImageScalingTechnique__createScalingPassesForInputSize___block_invoke;
    v34[3] = &unk_1E6187DB0;
    v34[4] = self;
    [v31 enumerateObjectsUsingBlock:v34];
  }
}

void __60__ARImageScalingTechnique__createScalingPassesForInputSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[ARImageScalePass alloc] initWithDescription:v3];

  [*(id *)(*(void *)(a1 + 32) + 56) addObject:v4];
}

- (__CVBuffer)_applyScalingPasses:(__CVBuffer *)a3
{
  id v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CVPixelBufferRetain(a3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_scalingPasses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      v10 = v3;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v3 = (__CVBuffer *)objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "scalePixelBuffer:", v10, (void)v12);
        CVPixelBufferRelease(v10);
        ++v9;
        v10 = v3;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

+ (id)scalingPassDescriptionForInputSize:(CGSize)a3 scaledSize:(CGSize)a4 conversionPixelFormat:(unsigned int)a5
{
  double height = a4.height;
  double width = a4.width;
  double v7 = a3.height;
  double v8 = a3.width;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v10 = objc_opt_new();
  double v11 = _ARLogTechnique_12();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    long long v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138544642;
    v34 = v13;
    __int16 v35 = 2048;
    id v36 = a1;
    __int16 v37 = 2048;
    double v38 = v8;
    __int16 v39 = 2048;
    double v40 = v7;
    __int16 v41 = 2048;
    double v42 = width;
    __int16 v43 = 2048;
    double v44 = height;
    _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: scale (%.1f x %.1f) to (%.1f x %.1f) START", buf, 0x3Eu);
  }
  double v31 = width;
  double v32 = height;
  do
  {
    float v14 = width / v8;
    float v15 = height / v7;
    double v16 = fmaxf(v14, 0.25);
    double v17 = round(v8 * v16);
    double v18 = fmaxf(v15, 0.25);
    double v19 = round(v7 * v18);
    double v20 = -[ARImageScalingPassDescription initWithSize:]([ARImageScalingPassDescription alloc], "initWithSize:", v17, v19);
    [v10 addObject:v20];

    double v21 = _ARLogTechnique_12();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      double v22 = (objc_class *)objc_opt_class();
      double v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138545666;
      v34 = v23;
      __int16 v35 = 2048;
      id v36 = a1;
      __int16 v37 = 2048;
      double v38 = v8;
      __int16 v39 = 2048;
      double v40 = v7;
      __int16 v41 = 2048;
      double v42 = v17;
      __int16 v43 = 2048;
      double v44 = v19;
      __int16 v45 = 2048;
      double v46 = v16;
      __int16 v47 = 2048;
      double v48 = v18;
      __int16 v49 = 1024;
      BOOL v50 = v14 >= 0.25;
      __int16 v51 = 1024;
      BOOL v52 = v15 >= 0.25;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: \tscale (%f x %f) to (%f x %f) scaleX=%f, scaleY=%f, finalXPass=%d, finalYPass=%d", buf, 0x5Eu);
    }
    double width = v31;
    double height = v32;
    BOOL v24 = v17 == v31 && v19 == v32;
    double v7 = v19;
    double v8 = v17;
  }
  while (!v24);
  CGFloat v25 = _ARLogTechnique_12();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v26 = (objc_class *)objc_opt_class();
    CGFloat v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138544130;
    v34 = v27;
    __int16 v35 = 2048;
    id v36 = a1;
    __int16 v37 = 2048;
    double v38 = v17;
    __int16 v39 = 2048;
    double v40 = v19;
    _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: scaled to (%.1f x %.1f) COMPLETE", buf, 0x2Au);
  }
  float v28 = [v10 lastObject];
  [v28 setPixelBufferFormat:a5];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARImageScalingTechnique;
  if ([(ARTechnique *)&v15 isEqual:v4])
  {
    id v5 = v4;
    if (self->_shouldUseScaleFactor)
    {
      int v6 = [(ARImageScalingTechnique *)self downscaleFactor];
      BOOL v7 = v6 == [v5 downscaleFactor];
    }
    else
    {
      [(ARImageScalingTechnique *)self scaledSize];
      double v9 = v8;
      double v11 = v10;
      [v5 scaledSize];
      BOOL v7 = v11 == v13 && v9 == v12;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGSize)scaledSize
{
  double width = self->_scaledSize.width;
  double height = self->_scaledSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)conversionPixelFormatType
{
  return self->_conversionPixelFormatType;
}

- (void)setConversionPixelFormatType:(unsigned int)a3
{
  self->_conversionPixelFormatType = a3;
}

- (unsigned)downscaleFactor
{
  return self->_downscaleFactor;
}

- (void).cxx_destruct
{
}

@end