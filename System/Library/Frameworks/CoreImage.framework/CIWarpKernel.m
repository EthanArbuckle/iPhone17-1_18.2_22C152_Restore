@interface CIWarpKernel
+ (CIWarpKernel)kernelWithString:(NSString *)string;
- (BOOL)canReduceOutputChannels;
- (BOOL)perservesAlpha;
- (BOOL)preservesRange;
- (CGRect)autogenerateROI:(void *)a3 args:(SerialObjectPtrArray *)a4 arguments:(id)a5 extent:(CGRect)a6;
- (CIImage)applyWithExtent:(CGRect)extent roiCallback:(CIKernelROICallback)callback inputImage:(CIImage *)image arguments:(NSArray *)args;
- (CIWarpKernel)initWithString:(id)a3;
- (id)_initWithReflection:(CIKernelReflection *)a3 constants:(id)a4 constantTypes:(id)a5;
- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5;
- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6;
- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 inputImage:(id)a5 arguments:(id)a6 options:(id)a7;
- (id)generateGeneralKernelFromWarpKernel:(void *)a3 args:(SerialObjectPtrArray *)a4;
- (id)generateMainFromWarpKernel:(void *)a3 args:(SerialObjectPtrArray *)a4;
- (id)makeGridImage:(CGRect)a3 nx:(int)a4 ny:(int)a5;
@end

@implementation CIWarpKernel

+ (CIWarpKernel)kernelWithString:(NSString *)string
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = [a1 description];
    _os_signpost_emit_with_name_impl(&dword_193671000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@"", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v10 = __33__CIWarpKernel_kernelWithString___block_invoke;
  v11 = &unk_1E5771BE8;
  id v12 = a1;
  if (check_cikl_string(string, "+[CIWarpKernel kernelWithString:]"))
  {
    v6 = (CIWarpKernel *)(id)[objc_alloc((Class)a1) initWithString:string];
    if (v6)
    {
      v7 = (NSString *)[(id)objc_opt_class() description];
      CoreAnalytics(v7, &cfstr_Kernelwithstri.isa, 1);
    }
  }
  else
  {
    v6 = 0;
  }
  v10((uint64_t)v9);
  return v6;
}

void __33__CIWarpKernel_kernelWithString___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) description];
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_193671000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@"", (uint8_t *)&v4, 0xCu);
  }
}

- (CIWarpKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIWarpKernel initWithString:]"))
  {
    return (CIWarpKernel *)[(CIKernel *)self _initWithString:a3 andCIKernelLibrary:0 usingCruftCompatibility:0 isInternal:0];
  }
  else
  {

    return 0;
  }
}

- (id)_initWithReflection:(CIKernelReflection *)a3 constants:(id)a4 constantTypes:(id)a5
{
}

- (BOOL)perservesAlpha
{
  return 0;
}

- (BOOL)preservesRange
{
  return 1;
}

- (BOOL)canReduceOutputChannels
{
  return 1;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6
{
  uint64_t v6 = ci_logger_api();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[CIWarpKernel applyWithExtent:roiCallback:arguments:options:](v6, v7, v8, v9, v10, v11, v12, v13);
  }
  return 0;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5
{
  uint64_t v5 = ci_logger_api();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[CIWarpKernel applyWithExtent:roiCallback:arguments:](v5, v6, v7, v8, v9, v10, v11, v12);
  }
  return 0;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 inputImage:(id)a5 arguments:(id)a6 options:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3) || !a5 || ([a5 extent], CGRectIsEmpty(v32)))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    priv = self->super._priv;
    if ((*(unsigned int (**)(void *))(*priv + 16))(priv) == 63)
    {
      int v12 = [a6 count];
      if (CI::Kernel::num_apply_arguments((CI::Kernel *)priv) == v12)
      {
        if (v12 < 1) {
LABEL_18:
        }
          operator new();
        uint64_t v13 = 0;
        while (1)
        {
          if (*((unsigned char *)priv + 12)) {
            int type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 18), v13);
          }
          else {
            int type = v13 >= *((int *)priv + 5) ? 0 : *(_DWORD *)(priv[9] + 4 * v13);
          }
          if ((verify_argument_type((void *)[a6 objectAtIndexedSubscript:v13], type, 0) & 1) == 0) {
            break;
          }
          if (v12 == ++v13) {
            goto LABEL_18;
          }
        }
        v17 = ci_logger_api();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = priv[3];
          v19 = expected_argument_type(type);
          [a6 objectAtIndexedSubscript:v13];
          *(_DWORD *)buf = 136447234;
          v21 = "-[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:]";
          __int16 v22 = 2082;
          uint64_t v23 = v18;
          __int16 v24 = 1024;
          int v25 = v13;
          __int16 v26 = 2082;
          v27 = v19;
          __int16 v28 = 2114;
          uint64_t v29 = [(id)objc_opt_class() description];
          _os_log_error_impl(&dword_193671000, v17, OS_LOG_TYPE_ERROR, "%{public}s type mismatch for kernel '%{public}s' parameter %d. %{public}sGot %{public}@.", buf, 0x30u);
        }
      }
      else
      {
        v16 = ci_logger_api();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:]((CI::Kernel *)priv);
        }
      }
    }
    else
    {
      uint64_t v15 = ci_logger_api();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:]();
      }
    }
    return 0;
  }
}

- (CIImage)applyWithExtent:(CGRect)extent roiCallback:(CIKernelROICallback)callback inputImage:(CIImage *)image arguments:(NSArray *)args
{
  return (CIImage *)-[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:](self, "applyWithExtent:roiCallback:inputImage:arguments:options:", callback, image, args, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

- (id)generateMainFromWarpKernel:(void *)a3 args:(SerialObjectPtrArray *)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F28E78] stringWithUTF8String:*((void *)a3 + 4)];
  objc_msgSend(v6, "insertString:atIndex:", @",vec2 samplePoint", objc_msgSend(v6, "rangeOfString:", @"")));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"destCoord()", @"samplePoint", 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "appendString:", objc_msgSend(NSString, "stringWithFormat:", @"\nkernel vec4 autoROI_%s(__sample s,vec4 e,"), *((void *)a3 + 3));
  if (a4->var0 < 2)
  {
    objc_msgSend(v6, "appendString:", @"  vec2 pt =(");
    objc_msgSend(v6, "appendString:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)a3 + 3)));
    objc_msgSend(v6, "appendString:", @"(");
  }
  else
  {
    uint64_t v7 = 0;
    int var0 = a4->var0;
    uint64_t v8 = (a4->var0 - 1);
    do
    {
      if (*((unsigned char *)a3 + 12))
      {
        int type = CI::KernelArguments::get_type((CI::KernelArguments *)((char *)a3 + 144), v7);
      }
      else if (v7 >= *((int *)a3 + 5))
      {
        int type = 0;
      }
      else
      {
        int type = *(_DWORD *)(*((void *)a3 + 9) + 4 * v7);
      }
      uint64_t v10 = v7 + 1;
      if (v8 - 1 == v7) {
        uint64_t v11 = ") {";
      }
      else {
        uint64_t v11 = ",";
      }
      [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%s v%d%s", off_1E5772F48[type], v7++, v11)];
    }
    while (v8 != v10);
    objc_msgSend(v6, "appendString:", @"  vec2 pt =(");
    objc_msgSend(v6, "appendString:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)a3 + 3)));
    objc_msgSend(v6, "appendString:", @"(");
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = (v12 + 1);
      if (v12 - var0 == -2) {
        uint64_t v14 = ",s.xy) - e.xy) / e.zw; return pt.xyxy; }";
      }
      else {
        uint64_t v14 = ", ";
      }
      [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"v%d%s", v12, v14)];
      uint64_t v12 = v13;
    }
    while (v13 - var0 != -1);
  }
  return v6;
}

- (id)generateGeneralKernelFromWarpKernel:(void *)a3 args:(SerialObjectPtrArray *)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F28E78] stringWithUTF8String:*((void *)a3 + 4)];
  objc_msgSend(v6, "appendString:", objc_msgSend(NSString, "stringWithFormat:", @"\nkernel vec4 autoROI_%s(sampler s,vec4 e,"), *((void *)a3 + 3));
  if (a4->var0 < 2)
  {
    [v6 appendString:@"  vec2 pt = "];
    objc_msgSend(v6, "appendString:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)a3 + 3)));
    objc_msgSend(v6, "appendString:", @"(");
  }
  else
  {
    uint64_t v7 = 0;
    int var0 = a4->var0;
    uint64_t v8 = (a4->var0 - 1);
    do
    {
      if (*((unsigned char *)a3 + 12))
      {
        int type = CI::KernelArguments::get_type((CI::KernelArguments *)((char *)a3 + 144), v7);
      }
      else if (v7 >= *((int *)a3 + 5))
      {
        int type = 0;
      }
      else
      {
        int type = *(_DWORD *)(*((void *)a3 + 9) + 4 * v7);
      }
      uint64_t v10 = v7 + 1;
      uint64_t v11 = ") {";
      if (v8 - 1 != v7) {
        uint64_t v11 = ",";
      }
      [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%s v%d%s", off_1E5772F48[type], v7++, v11)];
    }
    while (v8 != v10);
    [v6 appendString:@"  vec2 pt = "];
    objc_msgSend(v6, "appendString:", objc_msgSend(NSString, "stringWithUTF8String:", *((void *)a3 + 3)));
    objc_msgSend(v6, "appendString:", @"(");
    uint64_t v12 = 0;
    do
    {
      uint64_t v13 = (v12 + 1);
      if (v12 - var0 == -2) {
        uint64_t v14 = ");\n  ";
      }
      else {
        uint64_t v14 = ",";
      }
      [v6 appendString:objc_msgSend(NSString, "stringWithFormat:", @"v%d%s", v12, v14)];
      uint64_t v12 = v13;
    }
    while (v13 - var0 != -1);
  }
  [v6 appendString:@" return ((samplerTransform(s, pt).xyxy)- e.xyxy) / e.zwzw; }"];
  return v6;
}

- (id)makeGridImage:(CGRect)a3 nx:(int)a4 ny:(int)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v11 = 16 * a4;
  size_t v12 = v11 * a5;
  uint64_t v13 = (char *)malloc_type_malloc(v12, 0x9A4C69uLL);
  uint64_t v14 = v13;
  if (a5 >= 1)
  {
    int v15 = 0;
    uint64_t v18 = v13 + 4;
    do
    {
      if (a4 >= 1)
      {
        float v16 = height / (double)(a5 - 1);
        double v19 = (float)(v16 * (float)v15);
        if (v15 - a5 == -1) {
          double v19 = height;
        }
        float v20 = y + v19;
        float v17 = x + width;
        *((float *)v18 - 1) = v17;
        *(float *)uint64_t v18 = v20;
        *(void *)(v18 + 4) = 0x3F80000000000000;
      }
      ++v15;
      v18 += 16;
    }
    while (v15 != a5);
  }
  uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:v12];
  free(v14);
  uint64_t v22 = [MEMORY[0x1E4F1CA98] null];

  return +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v21, v11, 2312, v22, (double)a4, (double)a5);
}

- (CGRect)autogenerateROI:(void *)a3 args:(SerialObjectPtrArray *)a4 arguments:(id)a5 extent:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  v50[3] = *MEMORY[0x1E4F143B8];
  if (CGRectIsInfinite(a6)
    || (v51.origin.x = x, v51.origin.y = y, v51.size.width = width, v51.size.double height = height, CGRectIsEmpty(v51)))
  {
    CGFloat v14 = *MEMORY[0x1E4F1DB20];
    CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v48.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v48.c = v18;
    *(_OWORD *)&v48.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v19 = +[CIKernel kernelWithString:[(CIWarpKernel *)self generateGeneralKernelFromWarpKernel:a3 args:a4]];
    float v20 = +[CIFilter filterWithName:@"CIConstantColorGenerator"];
    [(CIFilter *)v20 setDefaults];
    uint64_t v21 = objc_msgSend((id)-[CIFilter valueForKey:](v20, "valueForKey:", @"outputImage"), "imageByCroppingToRect:", x, y, width, height);
    CGAffineTransformMakeTranslation(&v48, -x, -y);
    CGAffineTransform v47 = v48;
    uint64_t v22 = (void *)[v21 imageByApplyingTransform:&v47];
    CGAffineTransformMakeScale(&v46, 16.0 / width, 16.0 / height);
    CGAffineTransform v48 = v46;
    CGAffineTransform v45 = v46;
    uint64_t v23 = (void *)[v22 imageByApplyingTransform:&v45];
    CGAffineTransformMakeTranslation(&v46, -x, -y);
    CGAffineTransform v48 = v46;
    CGAffineTransform v44 = v46;
    CGAffineTransformScale(&v46, &v44, 16.0 / width, 16.0 / height);
    CGAffineTransform v48 = v46;
    __int16 v24 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:a5];
    [v24 insertObject:v23 atIndex:0];
    objc_msgSend(v24, "insertObject:atIndex:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", 0.0, 0.0, 16.0, 16.0), 1);
    [v23 extent];
    uint64_t v25 = -[CIKernel applyWithExtent:roiCallback:arguments:](v19, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_67, v24);
    v50[0] = MEMORY[0x1E4F1CC38];
    v49[0] = @"software_renderer";
    v49[1] = @"working_format";
    v50[1] = [NSNumber numberWithInt:2312];
    v49[2] = @"working_color_space";
    v50[2] = [MEMORY[0x1E4F1CA98] null];
    id v26 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", @"CIWarpKernel-autoROI", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3]);
    v27 = +[CIContext defaultWorkingColorSpace];
    __int16 v28 = (float *)malloc_type_malloc(0x1000uLL, 0x19BEE661uLL);
    objc_msgSend(v26, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v25, v28, 256, 2312, v27, 0.0, 0.0, 16.0, 16.0);
    int v29 = 0;
    float v30 = *v28;
    float v31 = v28[1];
    CGRect v32 = v28;
    float v33 = v31;
    float v34 = *v28;
    do
    {
      uint64_t v35 = 0;
      do
      {
        float v36 = v32[v35];
        if (v36 <= 10000.0 && v36 >= -10000.0)
        {
          float v37 = v32[v35 + 1];
          if (v37 <= 10000.0 && v37 >= -10000.0)
          {
            float v38 = x + v36 * width;
            float v39 = y + v37 * height;
            if (v34 <= v38) {
              float v34 = v38;
            }
            if (v30 >= v38) {
              float v30 = v38;
            }
            if (v33 <= v39) {
              float v33 = v39;
            }
            if (v31 >= v39) {
              float v31 = v39;
            }
          }
        }
        v35 += 4;
      }
      while ((v35 * 4) != 256);
      v32 += 64;
      ++v29;
    }
    while (v29 != 16);
    v52.origin.double x = v30;
    v52.origin.double y = v31;
    v52.size.double width = (float)(v34 - v30);
    v52.size.double height = (float)(v33 - v31);
    CGRect v53 = CGRectInset(v52, -0.5, -0.5);
    CGFloat v14 = v53.origin.x;
    CGFloat v15 = v53.origin.y;
    CGFloat v16 = v53.size.width;
    CGFloat v17 = v53.size.height;
    free(v28);
  }
  double v40 = v14;
  double v41 = v15;
  double v42 = v16;
  double v43 = v17;
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.double y = v41;
  result.origin.double x = v40;
  return result;
}

- (void)applyWithExtent:(uint64_t)a3 roiCallback:(uint64_t)a4 arguments:(uint64_t)a5 options:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyWithExtent:(uint64_t)a3 roiCallback:(uint64_t)a4 arguments:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)applyWithExtent:(CI::Kernel *)a1 roiCallback:inputImage:arguments:options:.cold.1(CI::Kernel *a1)
{
  CI::Kernel::num_apply_arguments(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_1(&dword_193671000, v1, v2, "%{public}s argument count mismatch for kernel '%{public}s', expected %d but saw %d.", v3, v4, v5, v6, 2u);
}

- (void)applyWithExtent:roiCallback:inputImage:arguments:options:.cold.2()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s kernel '%{public}s' is not a warp kernel.", (uint8_t *)v2);
}

@end