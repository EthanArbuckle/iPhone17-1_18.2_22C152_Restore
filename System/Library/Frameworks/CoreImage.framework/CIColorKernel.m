@interface CIColorKernel
+ (CIColorKernel)kernelWithString:(NSString *)string;
+ (id)SDOFV2MetalKernelNamed:(id)a3;
+ (id)SDOFV3MetalKernelNamed:(id)a3;
- (BOOL)canReduceOutputChannels;
- (BOOL)perservesAlpha;
- (BOOL)preservesRange;
- (CIColorKernel)initWithString:(id)a3;
- (CIImage)applyWithExtent:(CGRect)extent arguments:(NSArray *)args;
- (id)_initWithReflection:(CIKernelReflection *)a3 constants:(id)a4 constantTypes:(id)a5;
- (id)applyWithExtent:(CGRect)a3 arguments:(id)a4 options:(id)a5;
- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5;
- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6;
- (void)setCanReduceOutputChannels:(BOOL)a3;
- (void)setPerservesAlpha:(BOOL)a3;
- (void)setPreservesRange:(BOOL)a3;
@end

@implementation CIColorKernel

- (id)applyWithExtent:(CGRect)a3 arguments:(id)a4 options:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (CGRectIsEmpty(a3))
  {
    return +[CIImage emptyImage];
  }
  else
  {
    priv = self->super._priv;
    if ((*(unsigned int (**)(void *))(*priv + 16))(priv) == 62)
    {
      int v9 = [a4 count];
      if (CI::Kernel::num_apply_arguments((CI::Kernel *)priv) == v9)
      {
        if (v9 < 1) {
LABEL_28:
        }
          operator new();
        uint64_t v10 = 0;
        while (1)
        {
          if (*((unsigned char *)priv + 12))
          {
            int type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 18), v10);
          }
          else if (v10 >= *((int *)priv + 5))
          {
            int type = 0;
          }
          else
          {
            int type = *(_DWORD *)(priv[9] + 4 * v10);
          }
          if ((*(uint64_t (**)(void *))(*priv + 72))(priv)
            && !priv[4]
            && (type == 15 || type == 8)
            && (([a4 objectAtIndexedSubscript:v10],
                 objc_opt_class(),
                 (objc_opt_isKindOfClass() & 1) != 0)
             || ([a4 objectAtIndexedSubscript:v10],
                 objc_opt_class(),
                 (objc_opt_isKindOfClass() & 1) != 0)))
          {
            CI::Kernel::set_argument_type(priv, v10, 1);
            CI::Kernel::set_half_color_inputs((uint64_t)priv, type == 15);
          }
          else if ((verify_argument_type((void *)[a4 objectAtIndexedSubscript:v10], type, 1) & 1) == 0)
          {
            v14 = ci_logger_api();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = priv[3];
              v16 = expected_argument_type(type);
              [a4 objectAtIndexedSubscript:v10];
              int v17 = 136447234;
              v18 = "-[CIColorKernel applyWithExtent:arguments:options:]";
              __int16 v19 = 2082;
              uint64_t v20 = v15;
              __int16 v21 = 1024;
              int v22 = v10;
              __int16 v23 = 2082;
              v24 = v16;
              __int16 v25 = 2114;
              uint64_t v26 = [(id)objc_opt_class() description];
              _os_log_error_impl(&dword_193671000, v14, OS_LOG_TYPE_ERROR, "%{public}s type mismatch for kernel '%{public}s' parameter %d. %{public}sGot %{public}@.", (uint8_t *)&v17, 0x30u);
            }
            return 0;
          }
          if (v9 == ++v10) {
            goto LABEL_28;
          }
        }
      }
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[CIColorKernel applyWithExtent:arguments:options:]((CI::Kernel *)priv);
      }
    }
    else
    {
      v12 = ci_logger_api();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CIColorKernel applyWithExtent:arguments:options:].cold.4();
      }
    }
    return 0;
  }
}

- (CIImage)applyWithExtent:(CGRect)extent arguments:(NSArray *)args
{
  return (CIImage *)-[CIColorKernel applyWithExtent:arguments:options:](self, "applyWithExtent:arguments:options:", args, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

+ (CIColorKernel)kernelWithString:(NSString *)string
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
  uint64_t v10 = __34__CIColorKernel_kernelWithString___block_invoke;
  v11 = &unk_1E5771BE8;
  id v12 = a1;
  if (check_cikl_string(string, "+[CIColorKernel kernelWithString:]"))
  {
    v6 = (CIColorKernel *)(id)[objc_alloc((Class)a1) initWithString:string];
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

void __34__CIColorKernel_kernelWithString___block_invoke(uint64_t a1)
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

- (CIColorKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIColorKernel initWithString:]"))
  {
    return (CIColorKernel *)[(CIKernel *)self _initWithString:a3 andCIKernelLibrary:0 usingCruftCompatibility:0 isInternal:0];
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
  priv = (CI::Kernel *)self->super._priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((unsigned char *)priv + 162) != 0;
}

- (void)setPerservesAlpha:(BOOL)a3
{
  priv = (CI::Kernel *)self->super._priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
  {
    CI::Kernel::set_preserves_alpha((uint64_t)priv, a3);
  }
}

- (BOOL)preservesRange
{
  priv = (CI::Kernel *)self->super._priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((unsigned char *)priv + 163) != 0;
}

- (void)setPreservesRange:(BOOL)a3
{
  priv = (CI::Kernel *)self->super._priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
  {
    CI::Kernel::set_preserves_range((uint64_t)priv, a3);
  }
}

- (BOOL)canReduceOutputChannels
{
  priv = (CI::Kernel *)self->super._priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((unsigned char *)priv + 160) != 0;
}

- (void)setCanReduceOutputChannels:(BOOL)a3
{
  priv = (CI::Kernel *)self->super._priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
  {
    CI::Kernel::set_can_reduce_output_channels((uint64_t)priv, a3);
  }
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v18.origin.double x = (*((double (**)(id, void, CGPoint, __n128, CGSize, __n128))a4 + 2))(a4, 0, a3.origin, *(__n128 *)&a3.origin.y, a3.size, *(__n128 *)&a3.size.height);
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = width;
    v19.size.double height = height;
    if (!CGRectEqualToRect(v18, v19))
    {
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 136446210;
        v16 = "-[CIColorKernel applyWithExtent:roiCallback:arguments:options:]";
        _os_log_impl(&dword_193671000, v13, OS_LOG_TYPE_INFO, "%{public}s ignores callback and is not recomended.  Use applyWithExtent:arguments:options: instead.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  return -[CIColorKernel applyWithExtent:arguments:options:](self, "applyWithExtent:arguments:options:", a5, a6, x, y, width, height);
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    v16.origin.double x = (*((double (**)(id, void, CGPoint, __n128, CGSize, __n128))a4 + 2))(a4, 0, a3.origin, *(__n128 *)&a3.origin.y, a3.size, *(__n128 *)&a3.size.height);
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    if (!CGRectEqualToRect(v16, v17))
    {
      v11 = ci_logger_api();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 136446210;
        uint64_t v14 = "-[CIColorKernel applyWithExtent:roiCallback:arguments:]";
        _os_log_impl(&dword_193671000, v11, OS_LOG_TYPE_INFO, "%{public}s ignores callback and is not recomended.  Use applyWithExtent:arguments: instead.", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  return -[CIColorKernel applyWithExtent:arguments:](self, "applyWithExtent:arguments:", a5, x, y, width, height);
}

+ (id)SDOFV2MetalKernelNamed:(id)a3
{
  if (SDOFV2MetalLibURL::onceToken != -1) {
    dispatch_once(&SDOFV2MetalLibURL::onceToken, &__block_literal_global_17_1);
  }
  if (!SDOFV2MetalLibURL::url) {
    return 0;
  }

  return +[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:error:](CIColorKernel, "cachedKernelWithFunctionName:fromMetalLibrary:error:", a3);
}

+ (id)SDOFV3MetalKernelNamed:(id)a3
{
  if (SDOFV3MetalLibURL::onceToken != -1) {
    dispatch_once(&SDOFV3MetalLibURL::onceToken, &__block_literal_global_32);
  }
  if (!SDOFV3MetalLibURL::url) {
    return 0;
  }

  return +[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:error:](CIColorKernel, "cachedKernelWithFunctionName:fromMetalLibrary:error:", a3);
}

- (void)applyWithExtent:arguments:options:.cold.1()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  v1[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_193671000, v0, OS_LOG_TYPE_DEBUG, "%{public}s kernel '%{public}s' specified 'preservesAlpha' but has no inputs.", (uint8_t *)v1, 0x16u);
}

- (void)applyWithExtent:arguments:options:.cold.2()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  v1[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  _os_log_debug_impl(&dword_193671000, v0, OS_LOG_TYPE_DEBUG, "%{public}s kernel '%{public}s' specified 'preservesAlpha' but extent is not the same as the extent of the first input image.", (uint8_t *)v1, 0x16u);
}

- (void)applyWithExtent:(CI::Kernel *)a1 arguments:options:.cold.3(CI::Kernel *a1)
{
  CI::Kernel::num_apply_arguments(a1);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_9_1(&dword_193671000, v1, v2, "%{public}s argument count mismatch for kernel '%{public}s', expected %d but saw %d.", v3, v4, v5, v6, 2u);
}

- (void)applyWithExtent:arguments:options:.cold.4()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_3_0(&dword_193671000, v0, v1, "%{public}s kernel '%{public}s' is not a color kernel.", (uint8_t *)v2);
}

@end