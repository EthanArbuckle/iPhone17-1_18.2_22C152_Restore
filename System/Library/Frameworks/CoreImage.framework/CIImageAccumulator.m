@interface CIImageAccumulator
+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)a3 format:(int)a4 options:(id)a5;
+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)extent format:(CIFormat)format;
+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)extent format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace;
- (CGColorSpace)colorSpace;
- (CGRect)extent;
- (CIFormat)format;
- (CIImage)image;
- (CIImageAccumulator)init;
- (CIImageAccumulator)initWithExtent:(CGRect)a3 format:(int)a4 options:(id)a5;
- (CIImageAccumulator)initWithExtent:(CGRect)extent format:(CIFormat)format;
- (CIImageAccumulator)initWithExtent:(CGRect)extent format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace;
- (id)description;
- (void)clear;
- (void)commitUpdates:(id)a3;
- (void)dealloc;
- (void)init;
- (void)setImage:(CIImage *)image;
- (void)setImage:(CIImage *)image dirtyRect:(CGRect)dirtyRect;
@end

@implementation CIImageAccumulator

- (CIImageAccumulator)init
{
  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(CIImageAccumulator *)v3 init];
  }

  return 0;
}

+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)a3 format:(int)a4 options:(id)a5
{
  uint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithExtent:format:options:", *(void *)&a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return (CIImageAccumulator *)v5;
}

+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)extent format:(CIFormat)format
{
  uint64_t v4 = objc_msgSend(objc_alloc((Class)a1), "initWithExtent:format:", *(void *)&format, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);

  return (CIImageAccumulator *)v4;
}

+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)extent format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v5 = objc_msgSend(objc_alloc((Class)a1), "initWithExtent:format:colorSpace:", *(void *)&format, colorSpace, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);

  return (CIImageAccumulator *)v5;
}

- (CIImageAccumulator)initWithExtent:(CGRect)extent format:(CIFormat)format
{
  return -[CIImageAccumulator initWithExtent:format:options:](self, "initWithExtent:format:options:", *(void *)&format, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

- (CIImageAccumulator)initWithExtent:(CGRect)extent format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v5 = *(void *)&format;
  double height = extent.size.height;
  double width = extent.size.width;
  double y = extent.origin.y;
  double x = extent.origin.x;
  v13[1] = *MEMORY[0x1E4F143B8];
  if (colorSpace)
  {
    v12 = @"color_space";
    v13[0] = colorSpace;
    colorSpace = (CGColorSpaceRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  }
  return -[CIImageAccumulator initWithExtent:format:options:](self, "initWithExtent:format:options:", v5, colorSpace, x, y, width, height);
}

- (CIImageAccumulator)initWithExtent:(CGRect)a3 format:(int)a4 options:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)CIImageAccumulator;
  v11 = [(CIImageAccumulator *)&v58 init];
  if (v11)
  {
    uint64_t v12 = [a5 objectForKey:@"color_space"];
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    if (CGRectIsEmpty(v62))
    {
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CIImageAccumulator initWithExtent:format:options:](v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }
    else
    {
      if (a4 == 267 || a4 == 265 || a4 == 264) {
        int v23 = 266;
      }
      else {
        int v23 = a4;
      }
      if (v23 == 1800) {
        int v23 = 2056;
      }
      if (v23 == 2824) {
        int v24 = 2056;
      }
      else {
        int v24 = v23;
      }
      if (v24 == 2312 || v24 == 2056 || v24 == 266)
      {
        v27 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        [v27 setObject:MEMORY[0x1E4F1CC28] forKey:@"kCIContextEnableBlending"];
        if (!v12) {
          objc_msgSend(v27, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), @"working_color_space");
        }
        [v27 setObject:@"CIImageAccumulator" forKey:@"kCIContextName"];
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        v59[0] = @"kCIContextCacheIntermediates";
        v59[1] = @"priority_request_low";
        v59[2] = @"priority_request_high";
        v59[3] = @"kCIContextUseMetalRenderer";
        v59[4] = @"quality";
        v59[5] = @"high_quality_downsample";
        v59[6] = @"kCIContextName";
        v28 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v59, 7, 0);
        uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v29)
        {
          uint64_t v30 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v55 != v30) {
                objc_enumerationMutation(v28);
              }
              uint64_t v32 = *(void *)(*((void *)&v54 + 1) + 8 * i);
              if ([a5 valueForKey:v32]) {
                objc_msgSend(v27, "setObject:forKey:", objc_msgSend(a5, "valueForKey:", v32), v32);
              }
            }
            uint64_t v29 = [v28 countByEnumeratingWithState:&v54 objects:v60 count:16];
          }
          while (v29);
        }
        if (+[CIContext contextWithOptions:v27])
        {
          v33 = (void *)[a5 objectForKey:@"blend_kernel"];
          if (v33)
          {
            if (([v33 isMemberOfClass:objc_opt_class()] & 1) == 0)
            {
              objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
              v34 = ci_logger_api();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
                -[CIImageAccumulator initWithExtent:format:options:]();
              }
            }
          }
          operator new();
        }
      }
      else
      {
        BOOL v35 = CI::name_for_format(v24) == 0;
        v36 = ci_logger_api();
        BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
        if (v35)
        {
          if (v37) {
            -[CIImageAccumulator initWithExtent:format:options:].cold.4(v36, v38, v39, v40, v41, v42, v43, v44);
          }
        }
        else if (v37)
        {
          -[CIImageAccumulator initWithExtent:format:options:].cold.5();
        }
      }
    }
    v45 = ci_logger_api();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[CIImageAccumulator initWithExtent:format:options:](v45, v46, v47, v48, v49, v50, v51, v52);
    }

    return 0;
  }
  return v11;
}

- (void)dealloc
{
  state = (CI::ImageAccumulator *)self->_state;
  if (state)
  {
    CI::ImageAccumulator::~ImageAccumulator(state);
    MEMORY[0x1997023B0]();
  }
  v4.receiver = self;
  v4.super_class = (Class)CIImageAccumulator;
  [(CIImageAccumulator *)&v4 dealloc];
}

- (CGRect)extent
{
  state = (double *)self->_state;
  double v3 = *state;
  double v4 = state[1];
  double v5 = state[2];
  double v6 = state[3];
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (CIFormat)format
{
  return *((_DWORD *)self->_state + 10);
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)*((void *)self->_state + 4);
}

- (CIImage)image
{
  return (CIImage *)CI::ImageAccumulator::get((CI::ImageAccumulator *)self->_state, 0);
}

- (void)setImage:(CIImage *)image
{
}

- (void)setImage:(CIImage *)image dirtyRect:(CGRect)dirtyRect
{
  state = self->_state;
  if (image)
  {
    double height = dirtyRect.size.height;
    double width = dirtyRect.size.width;
    double y = dirtyRect.origin.y;
    double x = dirtyRect.origin.x;
    CGFloat v11 = *(double *)state;
    CGFloat v12 = *((double *)state + 1);
    CGFloat v13 = *((double *)state + 2);
    CGFloat v14 = *((double *)state + 3);
    if (!CGRectIsInfinite(dirtyRect))
    {
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.double width = width;
      v27.size.double height = height;
      if (!CGRectIsEmpty(v27))
      {
        v28.origin.double x = x;
        v28.origin.double y = y;
        v28.size.double width = width;
        v28.size.double height = height;
        CGRect v29 = CGRectStandardize(v28);
        double x = ceil(v29.origin.x);
        double y = ceil(v29.origin.y);
        double v15 = floor(v29.origin.x + v29.size.width);
        double v16 = floor(v29.origin.y + v29.size.height);
        if (v15 > x && v16 > y)
        {
          double width = v15 - x;
          double height = v16 - y;
        }
        else
        {
          double x = *MEMORY[0x1E4F1DB20];
          double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
          double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
          double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        }
      }
    }
    v30.origin.double x = x;
    v30.origin.double y = y;
    v30.size.double width = width;
    v30.size.double height = height;
    v34.origin.double x = v11;
    v34.origin.double y = v12;
    v34.size.double width = v13;
    v34.size.double height = v14;
    CGRect v31 = CGRectIntersection(v30, v34);
    double v19 = v31.origin.x;
    double v20 = v31.origin.y;
    double v21 = v31.size.width;
    double v22 = v31.size.height;
    [(CIImage *)image extent];
    v35.origin.double x = v19;
    v35.origin.double y = v20;
    v35.size.double width = v21;
    v35.size.double height = v22;
    int v23 = image;
    if (!CGRectContainsRect(v32, v35)) {
      int v23 = [(CIImage *)image imageByCompositingOverImage:+[CIImage clearImage:](CIImage, "clearImage:", v19, v20, v21, v22)];
    }
    [(CIImage *)image extent];
    v36.origin.double x = v19;
    v36.origin.double y = v20;
    v36.size.double width = v21;
    v36.size.double height = v22;
    if (CGRectContainsRect(v33, v36)) {
      int v23 = -[CIImage imageByCroppingToRect:](v23, "imageByCroppingToRect:", v19, v20, v21, v22);
    }
    int v24 = (CI::ImageAccumulator *)self->_state;
    CI::ImageAccumulator::set(v24, v23);
  }
  else
  {
    uint64_t v18 = *((void *)state + 17);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = ___ZN2CI16ImageAccumulator5clearEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = state;
    dispatch_async(v18, block);
  }
}

- (void)clear
{
  state = self->_state;
  double v3 = *((void *)state + 17);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = ___ZN2CI16ImageAccumulator5clearEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = state;
  dispatch_async(v3, block);
}

- (void)commitUpdates:(id)a3
{
}

- (id)description
{
  [(CIImageAccumulator *)self extent];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  int v11 = [(CIImageAccumulator *)self format];
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<CIImageAccumulator: %p extent [%g %g %g %g] format %s>", self, v4, v6, v8, v10, CI::name_for_format(v11));
}

- (void)init
{
}

- (void)initWithExtent:(uint64_t)a3 format:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithExtent:(uint64_t)a3 format:(uint64_t)a4 options:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithExtent:format:options:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_193671000, v0, OS_LOG_TYPE_ERROR, "%{public}s blendKernel ignored (invalid value of type '%{public}s').\n", (uint8_t *)v1, 0x16u);
}

- (void)initWithExtent:(uint64_t)a3 format:(uint64_t)a4 options:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithExtent:format:options:.cold.5()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136446466;
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_193671000, v0, OS_LOG_TYPE_ERROR, "%{public}s failed because the format '%{public}s' is not supported.\n", (uint8_t *)v1, 0x16u);
}

@end