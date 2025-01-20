@interface CISaliencyMapKernel
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CISaliencyMapKernel

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  v5 = objc_msgSend(a4, "objectForKeyedSubscript:", @"rect", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  [v5 CGRectValue];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0, a4), "pixelBuffer");
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__17;
    v29 = __Block_byref_object_dispose__17;
    v10 = (objc_class *)getVNGenerateAttentionBasedSaliencyImageRequestClass(void)::softClass;
    uint64_t v30 = getVNGenerateAttentionBasedSaliencyImageRequestClass(void)::softClass;
    if (!getVNGenerateAttentionBasedSaliencyImageRequestClass(void)::softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = ___ZL52getVNGenerateAttentionBasedSaliencyImageRequestClassv_block_invoke;
      v23 = &unk_1E57710B8;
      v24 = &v25;
      ___ZL52getVNGenerateAttentionBasedSaliencyImageRequestClassv_block_invoke((uint64_t)&v20);
      v10 = (objc_class *)v26[5];
    }
    _Block_object_dispose(&v25, 8);
    id v11 = objc_alloc_init(v10);
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__17;
    v29 = __Block_byref_object_dispose__17;
    v12 = (objc_class *)getVNImageRequestHandlerClass(void)::softClass;
    uint64_t v30 = getVNImageRequestHandlerClass(void)::softClass;
    if (!getVNImageRequestHandlerClass(void)::softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = ___ZL29getVNImageRequestHandlerClassv_block_invoke_1;
      v23 = &unk_1E57710B8;
      v24 = &v25;
      ___ZL29getVNImageRequestHandlerClassv_block_invoke_1((uint64_t)&v20);
      v12 = (objc_class *)v26[5];
    }
    _Block_object_dispose(&v25, 8);
    id v13 = [v12 alloc];
    v14 = (void *)[v13 initWithCVPixelBuffer:v9 options:MEMORY[0x1E4F1CC08]];
    v31[0] = v11;
    if (objc_msgSend(v14, "performRequests:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v31, 1), a6))
    {
      v15 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "results"), "firstObject"), "pixelBuffer");

      if (v15)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __64__CISaliencyMapKernel_processWithInputs_arguments_output_error___block_invoke;
        v19[3] = &unk_1E5772D98;
        v19[4] = a5;
        PixelBufferApplyPlaneReadOnlyBlock(v15, (uint64_t)v19);
        return 1;
      }
      if (a6)
      {
        uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CISaliencyMapFilter" code:1 userInfo:&unk_1EE4AB360];
        goto LABEL_15;
      }
    }
    else
    {
    }
    return 0;
  }
  if (!a6) {
    return 0;
  }
  uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CISaliencyMapFilter" code:1 userInfo:&unk_1EE4AB338];
LABEL_15:
  v18 = (void *)v17;
  BOOL result = 0;
  *a6 = v18;
  return result;
}

void *__64__CISaliencyMapKernel_processWithInputs_arguments_output_error___block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  v10 = (char *)[*(id *)(a1 + 32) baseAddress];
  [*(id *)(a1 + 32) region];
  unint64_t Height = (unint64_t)CGRectGetHeight(v14);
  BOOL result = (void *)[*(id *)(a1 + 32) bytesPerRow];
  if (Height < a5) {
    a5 = Height;
  }
  if (a5)
  {
    size_t v13 = (size_t)result;
    do
    {
      BOOL result = memcpy(v10, a2, v13);
      a2 += a6;
      v10 += v13;
      --a5;
    }
    while (a5);
  }
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 266;
}

+ (int)outputFormat
{
  return 2309;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end