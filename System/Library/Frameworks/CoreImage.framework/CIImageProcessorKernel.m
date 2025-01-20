@interface CIImageProcessorKernel
+ (BOOL)allowCompressedInputsAndOutputs;
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)canOutputLossyCompressed;
+ (BOOL)canReduceOutputChannels;
+ (BOOL)outputIsOpaque;
+ (BOOL)processWithInputs:(NSArray *)inputs arguments:(NSDictionary *)arguments output:(id)output error:(NSError *)error;
+ (BOOL)skipFormatChecks;
+ (BOOL)synchronizeInputs;
+ (CIFormat)formatForInputAtIndex:(int)input;
+ (CIFormat)outputFormat;
+ (CIImage)applyWithExtent:(CGRect)extent inputs:(NSArray *)inputs arguments:(NSDictionary *)args error:(NSError *)error;
+ (NSArray)roiTileArrayForInput:(int)input arguments:(NSDictionary *)arguments outputRect:(CGRect)outputRect;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4;
+ (int)outputFormatWithArguments:(id)a3;
+ (unint64_t)_digestForArgs:(id)a3;
@end

@implementation CIImageProcessorKernel

+ (BOOL)processWithInputs:(NSArray *)inputs arguments:(NSDictionary *)arguments output:(id)output error:(NSError *)error
{
  v6 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v7 = *MEMORY[0x1E4F1C3C8];
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[v6 exceptionWithName:v7, objc_msgSend(v8, "stringWithFormat:", @"%s must be overridden in %@ class", "+[CIImageProcessorKernel processWithInputs:arguments:output:error:]", NSStringFromClass(v9)), 0 reason userInfo];
  objc_exception_throw(v10);
}

+ (NSArray)roiTileArrayForInput:(int)input arguments:(NSDictionary *)arguments outputRect:(CGRect)outputRect
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "roiForInput:arguments:outputRect:", *(void *)&input, arguments, outputRect.origin.x, outputRect.origin.y, outputRect.size.width, outputRect.size.height);
  v6[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
}

+ (CIFormat)formatForInputAtIndex:(int)input
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 0;
}

+ (CIFormat)outputFormat
{
  return 0;
}

+ (int)outputFormatWithArguments:(id)a3
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 0;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 0;
}

+ (BOOL)canOutputLossyCompressed
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)skipFormatChecks
{
  return 0;
}

+ (id)logDescription:(id)a3
{
  v3 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v3);
}

+ (unint64_t)_digestForArgs:(id)a3
{
  BOOL v6 = 0;
  XXH64_reset(v5, 0);
  if (a3 && (digestAdd((CI::XXHashHelper *)v5, (objc_object *)a3, &v6), v6)) {
    return 0;
  }
  else {
    return XXH64_digest((uint64_t)v5);
  }
}

+ (CIImage)applyWithExtent:(CGRect)extent inputs:(NSArray *)inputs arguments:(NSDictionary *)args error:(NSError *)error
{
  CGFloat height = extent.size.height;
  CGFloat width = extent.size.width;
  CGFloat y = extent.origin.y;
  CGFloat x = extent.origin.x;
  v61[1] = *MEMORY[0x1E4F143B8];
  SEL v12 = NSSelectorFromString(&cfstr_Processwithinp.isa);
  uint64_t v13 = [(id)objc_opt_class() methodForSelector:v12];
  uint64_t v14 = +[CIImageProcessorKernel methodForSelector:v12];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  if (v13 == v14 || v15 == v16)
  {
    v45 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v46 = *MEMORY[0x1E4F1C3C8];
    v47 = NSString;
    v48 = (objc_class *)objc_opt_class();
    v49 = (void *)[v45 exceptionWithName:v46, objc_msgSend(v47, "stringWithFormat:", @"%s must be overridden in %@ class", "+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]", NSStringFromClass(v48)), 0 reason userInfo];
    objc_exception_throw(v49);
  }
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  if (CGRectIsEmpty(v63))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    char v19 = [(id)objc_opt_class() skipFormatChecks];
    size_t v20 = [(NSArray *)inputs count];
    uint64_t v21 = [(id)objc_opt_class() methodForSelector:sel_outputFormatWithArguments_];
    uint64_t v22 = +[CIImageProcessorKernel methodForSelector:sel_outputFormatWithArguments_];
    v23 = objc_opt_class();
    if (v21 == v22) {
      uint64_t v24 = [v23 outputFormat];
    }
    else {
      uint64_t v24 = [v23 outputFormatWithArguments:args];
    }
    int v26 = CI::format_modernize(v24, (CI *)"+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]", v25);
    int v27 = v26;
    if (v26) {
      char v28 = v19;
    }
    else {
      char v28 = 1;
    }
    if (v28 & 1) != 0 || (CI::ProcessorImage::format_is_supported(v26, 0))
    {
      if (!v27 || v27 == 266) {
        [(id)objc_opt_class() allowSRGBTranferFuntionOnOutput];
      }
      if (v27 != 261 && v27 != 2053 && v27 != 2309) {
        [(id)objc_opt_class() outputIsOpaque];
      }
      if (![a1 _digestForArgs:args])
      {
        v29 = ci_logger_performance();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (objc_class *)objc_opt_class();
          *(_DWORD *)buf = 136446466;
          v57 = "+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]";
          __int16 v58 = 2114;
          v59 = NSStringFromClass(v30);
          _os_log_impl(&dword_193671000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s each object in arguments dictionary be an NSArray, NSDictionary, NSNumber, NSValue, NSData, NSString, NSNull, CIVector, CIColor, CIImage, CGImageRef or CGColorSpaceRef for CoreImage to cache optimally (%{public}@).", buf, 0x16u);
        }
      }
      v50 = error;
      if (v20)
      {
        v52 = malloc_type_calloc(4uLL, v20, 0xCAE51A57uLL);
        v31 = malloc_type_calloc(1uLL, v20, 0xAA7E0D6AuLL);
      }
      else
      {
        v31 = 0;
        v52 = 0;
      }
      uint64_t v32 = [(id)objc_opt_class() methodForSelector:sel_formatForInputAtIndex_arguments_];
      uint64_t v33 = +[CIImageProcessorKernel methodForSelector:sel_formatForInputAtIndex_arguments_];
      if (!v20)
      {
LABEL_44:
        [(id)objc_opt_class() methodForSelector:sel_roiTileArrayForInput_arguments_outputRect_];
        +[CIImageProcessorKernel methodForSelector:sel_roiTileArrayForInput_arguments_outputRect_];
        if (v20) {
          operator new();
        }
        [(id)objc_opt_class() logDescription:args];
        operator new();
      }
      uint64_t v34 = v33;
      size_t v35 = 0;
      size_t v36 = 0;
      while (1)
      {
        v37 = objc_opt_class();
        uint64_t v38 = v32 == v34
            ? [v37 formatForInputAtIndex:v36]
            : [v37 formatForInputAtIndex:v36 arguments:args];
        int v40 = CI::format_modernize(v38, (CI *)"+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]", v39);
        int v41 = v40;
        v52[v35] = v40;
        char v42 = v40 ? v19 : 1;
        if ((v42 & 1) == 0 && (CI::ProcessorImage::format_is_supported(v40, 1) & 1) == 0) {
          break;
        }
        v31[v35] = 0;
        if (!v41 || v41 == 266) {
          v31[v35] = [(id)objc_opt_class() allowSRGBTranferFuntionOnInputAtIndex:v36];
        }
        size_t v35 = (v36 + 1);
        size_t v36 = v35;
        if (v20 <= v35) {
          goto LABEL_44;
        }
      }
      if (v50)
      {
        v44 = (void *)MEMORY[0x1E4F28C58];
        v54 = @"CINonLocalizedDescriptionKey";
        uint64_t v55 = [NSString stringWithFormat:@"inputFormat for image %d must be 0, %s.", v36, "R8, Rh, Rf, BGRA8, RGBAh, RGBAf"];
        *v50 = (NSError *)objc_msgSend(v44, "errorWithDomain:code:userInfo:", @"CIImageProcessorKernel", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
      }
      free(v52);
      if (v31) {
        free(v31);
      }
    }
    else if (error)
    {
      v43 = (void *)MEMORY[0x1E4F28C58];
      v60 = @"CINonLocalizedDescriptionKey";
      v61[0] = [NSString stringWithFormat:@"outputFormat must be 0, %s.", "R8, Rh, Rf, BGRA8, RGBAh, RGBAf"];
      *error = (NSError *)objc_msgSend(v43, "errorWithDomain:code:userInfo:", @"CIImageProcessorKernel", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v61, &v60, 1));
    }
    return 0;
  }
}

void __65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v14 = (void *)MEMORY[0x199702DB0]();
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  uint64_t v15 = objc_msgSend((id)objc_opt_class(), "roiTileArrayForInput:arguments:outputRect:", a2, *(void *)(a1 + 40), a4, a5, a6, a7);
  for (unint64_t i = 0; [v15 count] > i; ++i)
  {
    objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", i), "CGRectValue");
    uint64_t v21 = v17;
    uint64_t v22 = v18;
    uint64_t v23 = v19;
    uint64_t v24 = v20;
    int v26 = a3[1];
    unint64_t v25 = (unint64_t)a3[2];
    if ((unint64_t)v26 >= v25)
    {
      char v28 = *a3;
      uint64_t v29 = (v26 - *a3) >> 5;
      unint64_t v30 = v29 + 1;
      if ((unint64_t)(v29 + 1) >> 59) {
        abort();
      }
      uint64_t v31 = v25 - (void)v28;
      if (v31 >> 4 > v30) {
        unint64_t v30 = v31 >> 4;
      }
      if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v32 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v32 = v30;
      }
      if (v32)
      {
        uint64_t v33 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SoftwareDAGDescriptor::ArgumentInfo>>((uint64_t)(a3 + 2), v32);
        char v28 = *a3;
        int v26 = a3[1];
      }
      else
      {
        uint64_t v33 = 0;
      }
      uint64_t v34 = &v33[32 * v29];
      *(void *)uint64_t v34 = v21;
      *((void *)v34 + 1) = v22;
      *((void *)v34 + 2) = v23;
      *((void *)v34 + 3) = v24;
      if (v26 == v28)
      {
        v37 = &v33[32 * v29];
      }
      else
      {
        size_t v35 = &v33[32 * v29];
        do
        {
          long long v36 = *((_OWORD *)v26 - 1);
          v37 = v35 - 32;
          *((_OWORD *)v35 - 2) = *((_OWORD *)v26 - 2);
          *((_OWORD *)v35 - 1) = v36;
          v26 -= 32;
          v35 -= 32;
        }
        while (v26 != v28);
      }
      int v27 = v34 + 32;
      *a3 = v37;
      a3[1] = v34 + 32;
      a3[2] = &v33[32 * v32];
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      *(void *)int v26 = v17;
      *((void *)v26 + 1) = v18;
      int v27 = v26 + 32;
      *((void *)v26 + 2) = v19;
      *((void *)v26 + 3) = v20;
    }
    a3[1] = v27;
  }
}

void __65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error___block_invoke_2(void *a1, void *a2, uint64_t *a3, void *a4, void *a5, void *a6, uint64_t a7, long long *a8, double a9, double a10, double a11, double a12, uint64_t a13, unsigned __int8 a14, int a15, void *a16, CI::TileTask *a17)
{
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x199702DB0]();
  uint64_t v24 = [CIImageProcessorOutput alloc];
  long long v119 = *a8;
  v101 = -[CIImageProcessorOutput initWithSurface:texture:digest:allowSRGB:bounds:context:tileTask:](v24, "initWithSurface:texture:digest:allowSRGB:bounds:context:tileTask:", a7, &v119, a13, a14, a16, a17, a9, a10, a11, a12);
  long long v119 = 0uLL;
  if (a1[8] <= 1uLL) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = a1[8];
  }
  std::vector<std::vector<CGRect>>::vector(v118, v25);
  if (a1[8])
  {
    uint64_t v26 = 0;
    unint64_t v27 = 0;
    do
    {
      (*(void (**)(uint8_t *__return_ptr, double, double, double, double))(a1[7] + 16))(buf, a9, a10, a11, a12);
      char v28 = (void *)(v118[0] + v26);
      uint64_t v29 = *(void **)(v118[0] + v26);
      if (v29)
      {
        v28[1] = v29;
        operator delete(v29);
        *char v28 = 0;
        v28[1] = 0;
        v28[2] = 0;
      }
      *(_OWORD *)char v28 = *(_OWORD *)buf;
      v28[2] = v123;
      ++v27;
      unint64_t v30 = a1[8];
      v26 += 24;
    }
    while (v30 > v27);
  }
  else
  {
    unint64_t v30 = 0;
  }
  uint64_t v32 = *(void *)v118[0];
  uint64_t v31 = *(void *)(v118[0] + 8);
  v111 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v30];
  if (a1[8])
  {
    unint64_t v33 = 0;
    uint64_t v104 = (v31 - v32) >> 5;
    unsigned int v34 = 1;
    v112 = a1;
    while (1)
    {
      std::vector<CGRect>::vector(__p, v118[0] + 24 * v33);
      CGRect v125 = CGRectInset(*((CGRect *)__p[0] + a15), 0.001, 0.001);
      CGRect v126 = CGRectIntegral(v125);
      CGFloat x = v126.origin.x;
      CGFloat y = v126.origin.y;
      CGFloat width = v126.size.width;
      CGFloat height = v126.size.height;
      if (CGRectIsNull(v126))
      {
        unint64_t v115 = 0;
        unint64_t v116 = 0;
        int v39 = 0x7FFFFFFF;
        int v40 = 0x7FFFFFFF;
      }
      else
      {
        v127.origin.CGFloat x = x;
        v127.origin.CGFloat y = y;
        v127.size.CGFloat width = width;
        v127.size.CGFloat height = height;
        if (CGRectIsInfinite(v127))
        {
          int v39 = -2147483647;
          unint64_t v115 = 0xFFFFFFFFLL;
          unint64_t v116 = 0xFFFFFFFFLL;
          int v40 = -2147483647;
        }
        else
        {
          v128.origin.CGFloat x = x;
          v128.origin.CGFloat y = y;
          v128.size.CGFloat width = width;
          v128.size.CGFloat height = height;
          CGRect v129 = CGRectInset(v128, 0.000001, 0.000001);
          CGRect v130 = CGRectIntegral(v129);
          int v40 = (int)v130.origin.x;
          int v39 = (int)v130.origin.y;
          unint64_t v115 = (unint64_t)v130.size.height;
          unint64_t v116 = (unint64_t)v130.size.width;
        }
      }
      CGRect v131 = CGRectInset(*(CGRect *)(*a5 + 32 * v33), 0.001, 0.001);
      CGRect v132 = CGRectIntegral(v131);
      CGFloat v41 = v132.origin.x;
      CGFloat v42 = v132.origin.y;
      CGFloat v43 = v132.size.width;
      CGFloat v44 = v132.size.height;
      if (CGRectIsNull(v132))
      {
        unint64_t v45 = 0;
        unint64_t v46 = 0;
        int v47 = 0x7FFFFFFF;
        int v48 = 0x7FFFFFFF;
      }
      else
      {
        v133.origin.CGFloat x = v41;
        v133.origin.CGFloat y = v42;
        v133.size.CGFloat width = v43;
        v133.size.CGFloat height = v44;
        if (CGRectIsInfinite(v133))
        {
          int v47 = -2147483647;
          unint64_t v45 = 0xFFFFFFFFLL;
          unint64_t v46 = 0xFFFFFFFFLL;
          int v48 = -2147483647;
        }
        else
        {
          v134.origin.CGFloat x = v41;
          v134.origin.CGFloat y = v42;
          v134.size.CGFloat width = v43;
          v134.size.CGFloat height = v44;
          CGRect v135 = CGRectInset(v134, 0.000001, 0.000001);
          CGRect v136 = CGRectIntegral(v135);
          int v48 = (int)v136.origin.x;
          int v47 = (int)v136.origin.y;
          unint64_t v46 = (unint64_t)v136.size.width;
          unint64_t v45 = (unint64_t)v136.size.height;
        }
      }
      v49 = *(__IOSurface **)(*a2 + 8 * v33);
      uint64_t v50 = *a3;
      uint64_t v113 = *(void *)(*a4 + 8 * v33);
      uint64_t v114 = *(void *)(*a6 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (1 << v33);
      if (v40 != v48 || v39 != v47 || v116 != v46 || v115 != v45)
      {
        if (*((unsigned char *)v112 + 72)) {
          break;
        }
      }
      v66 = [CIImageProcessorInput alloc];
      long long v120 = *(_OWORD *)(v50 + 16 * v33);
      if (v48 == -2147483647)
      {
        uint64_t v67 = v113;
        if (v47 == -2147483647 && v46 == 0xFFFFFFFF && v45 == 0xFFFFFFFF)
        {
          v68 = (double *)MEMORY[0x1E4F1DB10];
LABEL_67:
          double v69 = *v68;
          double v70 = v68[1];
          Surface = v49;
LABEL_91:
          double v71 = v68[2];
          double v72 = v68[3];
          goto LABEL_93;
        }
      }
      else
      {
        uint64_t v67 = v113;
        if (v48 == 0x7FFFFFFF && v47 == 0x7FFFFFFF && !v46 && !v45)
        {
          v68 = (double *)MEMORY[0x1E4F1DB20];
          goto LABEL_67;
        }
      }
      double v69 = (double)v48;
      double v70 = (double)v47;
      double v71 = (double)v46;
      Surface = v49;
      double v72 = (double)v45;
LABEL_93:
      objc_msgSend(v111, "addObject:", -[CIImageProcessorInput initWithSurface:texture:digest:allowSRGB:bounds:roiTileIndex:roiTileCount:context:](v66, "initWithSurface:texture:digest:allowSRGB:bounds:roiTileIndex:roiTileCount:context:", Surface, &v120, v67, v114 != 0, a15, v104, v69, v70, v71, v72, a16));
      a1 = v112;
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      unint64_t v33 = v34;
      if (v112[8] <= (unint64_t)v34++) {
        goto LABEL_137;
      }
    }
    BOOL v53 = v48 == -2147483647 && v47 == -2147483647 && v46 == 0xFFFFFFFF && v45 == 0xFFFFFFFF;
    char v54 = v53;
    int v110 = v39;
    if (!v53)
    {
      if (v40 != 0x7FFFFFFF)
      {
        if (v40 == -2147483647 && v39 == -2147483647 && v116 == 0xFFFFFFFF && v115 == 0xFFFFFFFF)
        {
          BOOL v55 = 1;
          goto LABEL_43;
        }
LABEL_106:
        BOOL v85 = v48 == 0x7FFFFFFF && v47 == 0x7FFFFFFF && v46 == 0 && v45 == 0;
        BOOL v55 = 1;
        if (v48 <= v40 && !v85 && v48 + (int)v46 >= v40 + (int)v116 && v47 <= v110) {
          BOOL v55 = v47 + (int)v45 < v110 + (int)v115;
        }
LABEL_43:
        uint64_t PixelFormat = IOSurfaceGetPixelFormat(v49);
        Surface = CreateSurface((__CVBuffer *)v116, (__CVBuffer *)v115, 0, PixelFormat, v55);
        CFAutorelease(Surface);
        int v58 = 0x7FFFFFFF;
        if (v48 == 0x7FFFFFFF && v47 == 0x7FFFFFFF && !v46 && !v45
          || v40 == 0x7FFFFFFF && v110 == 0x7FFFFFFF && !v116 && !v115)
        {
          unint64_t v102 = 0;
          unint64_t v103 = 0;
LABEL_52:
          int v59 = 0x7FFFFFFF;
          goto LABEL_53;
        }
        unint64_t v102 = v116;
        unint64_t v103 = v115;
        int v58 = v110;
        char v81 = v54;
        int v59 = v40;
        if ((v81 & 1) == 0)
        {
          if (v40 == -2147483647 && v110 == -2147483647 && v116 == 0xFFFFFFFF && v115 == 0xFFFFFFFF)
          {
            unint64_t v102 = v46;
            unint64_t v103 = v45;
            int v58 = v47;
            int v59 = v48;
          }
          else
          {
            if (v48 <= v40) {
              int v59 = v40;
            }
            else {
              int v59 = v48;
            }
            int v86 = v48 + v46;
            if (v48 + (int)v46 >= v40 + (int)v116) {
              int v86 = v40 + v116;
            }
            BOOL v87 = __OFSUB__(v86, v59);
            int v88 = v86 - v59;
            if (v88 < 0 != v87) {
              goto LABEL_136;
            }
            if (v47 <= v110) {
              int v58 = v110;
            }
            else {
              int v58 = v47;
            }
            int v89 = v47 + v45;
            if (v47 + (int)v45 >= v110 + (int)v115) {
              int v89 = v110 + v115;
            }
            BOOL v87 = __OFSUB__(v89, v58);
            int v90 = v89 - v58;
            if (v90 < 0 != v87)
            {
LABEL_136:
              unint64_t v102 = 0;
              unint64_t v103 = 0;
              int v58 = 0x7FFFFFFF;
              goto LABEL_52;
            }
            unint64_t v102 = v88;
            unint64_t v103 = v90;
          }
        }
LABEL_53:
        int v60 = v59 - v48;
        int v61 = v47 + v45 - (v58 + v103);
        if ((*(unsigned int (**)(void *))(*a16 + 16))(a16) == 77)
        {
          Queue = (void *)CIMetalCommandBufferGetQueue(a16[224]);
          if (Queue)
          {
            v64 = (void *)a16[226];
            if (v64)
            {
              int v65 = 0;
              goto LABEL_77;
            }
LABEL_76:
            v64 = CIMetalCommandBufferCreate((uint64_t)"CIImageProcessor::createTileInput", Queue, 0, 0);
            int v65 = 1;
LABEL_77:
            v73 = (CI *)IOSurfaceGetPixelFormat(v49);
            int v74 = CI::format_from_PixelFormatType(v73);
            unsigned int v75 = CIMetalFormatForFormat(v74, v114 != 0);
            Device = (void *)CIMetalTextureGetDevice(v64);
            v77 = CIMetalTextureCreateFromIOSurface((uint64_t)"CIImageProcessor::createTileInput", Device, v49, 0, v75, 1);
            v78 = (void *)CIMetalTextureGetDevice(v64);
            v79 = CIMetalTextureCreateFromIOSurface((uint64_t)"CIImageProcessor::createTileInput", v78, Surface, 0, v75, 2);
            CIMetalCommandBufferCopyTexture(v64, (uint64_t)v79, (uint64_t)v77, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), (double)v60, (double)v61, (double)v102, (double)v103);
            CFRelease(v77);
            CFRelease(v79);
            if (v65)
            {
              CIMetalCommandBufferCommit(v64);
              CIMetalCommandBufferWaitUntilCompleted(v64);
            }
            goto LABEL_80;
          }
        }
        else
        {
          Queue = objc_msgSend(-[CIImageProcessorOutput metalContext](v101, "metalContext"), "internalCommandQueue");
          if (Queue) {
            goto LABEL_76;
          }
        }
        *(void *)buf = 0;
        *(void *)&buf[8] = v102;
        unint64_t v123 = v103;
        LODWORD(v121[0]) = v60;
        HIDWORD(v121[0]) = v47 + v45 - (v58 + v103);
        v121[1] = (CFTypeRef)v102;
        v121[2] = (CFTypeRef)v103;
        CI::Context::blitSurface(Surface, (__IOSurface *)buf, (IRect *)v49, (__IOSurface *)v121, v63);
LABEL_80:
        v66 = [CIImageProcessorInput alloc];
        *(void *)&long long v120 = 0;
        uint64_t v67 = v113;
        if (v40 == -2147483647)
        {
          if (v110 != -2147483647 || v116 != 0xFFFFFFFF || v115 != 0xFFFFFFFF)
          {
LABEL_92:
            double v69 = (double)v40;
            double v70 = (double)v110;
            double v71 = (double)v116;
            double v72 = (double)v115;
            goto LABEL_93;
          }
          v68 = (double *)MEMORY[0x1E4F1DB10];
        }
        else
        {
          if (v40 != 0x7FFFFFFF || v110 != 0x7FFFFFFF || v116 || v115) {
            goto LABEL_92;
          }
          v68 = (double *)MEMORY[0x1E4F1DB20];
        }
        double v69 = *v68;
        double v70 = v68[1];
        goto LABEL_91;
      }
      if (v39 != 0x7FFFFFFF || v116 || v115) {
        goto LABEL_106;
      }
    }
    BOOL v55 = 0;
    goto LABEL_43;
  }
LABEL_137:
  v91 = ci_signpost_log_render();
  os_signpost_id_t v92 = (*(uint64_t (**)(void *))(*a16 + 272))(a16) << 32;
  if (v92 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v91))
  {
    uint64_t v93 = a1[4];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v93;
    _os_signpost_emit_with_name_impl(&dword_193671000, v91, OS_SIGNPOST_INTERVAL_BEGIN, v92, "processor_process", "%{public}@", buf, 0xCu);
  }
  uint64_t v94 = (*(uint64_t (**)(void *))(*a16 + 272))(a16);
  TimerBase::TimerBase((uint64_t)buf, v94, 0, (uint64_t)"processor_process", 0);
  v121[0] = 0;
  [(id)objc_opt_class() processWithInputs:v111 arguments:a1[6] output:v101 error:v121];
  if (v121[0]) {
    CI::TileTask::setCommandBufferError(a17, v121[0]);
  }
  _ZZZ65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error__EUb0_EN13SignpostTimerD1Ev((TimerBase *)buf);
  v95 = ci_signpost_log_render();
  os_signpost_id_t v96 = (*(uint64_t (**)(void *))(*a16 + 272))(a16) << 32;
  if (v96 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v95))
  {
    uint64_t v97 = a1[4];
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v97;
    _os_signpost_emit_with_name_impl(&dword_193671000, v95, OS_SIGNPOST_INTERVAL_BEGIN, v96, "processor_postprocess", "%{public}@", buf, 0xCu);
  }
  uint64_t v98 = (*(uint64_t (**)(void *))(*a16 + 272))(a16);
  TimerBase::TimerBase((uint64_t)buf, v98, 0, (uint64_t)"processor_postprocess", 0);
  post_process(v111, v101, (uint64_t)a16);
  _ZZZ65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error__EUb0_EN13SignpostTimerD1E_0v((TimerBase *)buf);
  *(void *)buf = v118;
  std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100](v99);
}

@end