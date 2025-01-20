@interface CIPersonSegmentationKernel
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIPersonSegmentationKernel

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
  v52[1] = *MEMORY[0x1E4F143B8];
  v10 = (void *)MEMORY[0x199702DB0](a1, a2);
  uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "pixelBuffer");
  if (!v11)
  {
    if (a6)
    {
      v23 = (void *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CIPersonSegmentationFilter" code:1 userInfo:&unk_1EE4AB1D0];
LABEL_18:
      BOOL v26 = 0;
      *a6 = v23;
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  uint64_t v12 = v11;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__12;
  v48 = __Block_byref_object_dispose__12;
  v13 = (objc_class *)getVNGeneratePersonSegmentationRequestClass_softClass;
  uint64_t v49 = getVNGeneratePersonSegmentationRequestClass_softClass;
  if (!getVNGeneratePersonSegmentationRequestClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getVNGeneratePersonSegmentationRequestClass_block_invoke;
    v42 = &unk_1E57710B8;
    v43 = &v44;
    __getVNGeneratePersonSegmentationRequestClass_block_invoke((uint64_t)&v39);
    v13 = (objc_class *)v45[5];
  }
  _Block_object_dispose(&v44, 8);
  id v14 = objc_alloc_init(v13);
  objc_msgSend(v14, "setQualityLevel:", objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"q"), "unsignedIntValue"));
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3052000000;
  v47 = __Block_byref_object_copy__12;
  v48 = __Block_byref_object_dispose__12;
  v15 = (objc_class *)getVNImageRequestHandlerClass_softClass;
  uint64_t v49 = getVNImageRequestHandlerClass_softClass;
  if (!getVNImageRequestHandlerClass_softClass)
  {
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __getVNImageRequestHandlerClass_block_invoke;
    v42 = &unk_1E57710B8;
    v43 = &v44;
    __getVNImageRequestHandlerClass_block_invoke((uint64_t)&v39);
    v15 = (objc_class *)v45[5];
  }
  _Block_object_dispose(&v44, 8);
  id v16 = [v15 alloc];
  id v17 = (id)[v16 initWithCVPixelBuffer:v12 options:MEMORY[0x1E4F1CC08]];
  v52[0] = v14;
  if (!objc_msgSend(v17, "performRequests:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v52, 1), a6))goto LABEL_31; {
  v18 = (__CVBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "results"), "firstObject"), "pixelBuffer");
  }
  v19 = v18;
  if (!v18)
  {
    v22 = @"Couldn't get the output pixelBuffer from Vision request result";
    if (!a6) {
      goto LABEL_31;
    }
    goto LABEL_17;
  }
  size_t Width = CVPixelBufferGetWidth(v18);
  [a5 region];
  if (v21 != (double)Width)
  {
    v22 = @"The output pixelBuffer from Vision is not the expected width.";
    if (!a6) {
      goto LABEL_31;
    }
    goto LABEL_17;
  }
  size_t Height = CVPixelBufferGetHeight(v19);
  [a5 region];
  if (v25 != (double)Height)
  {
    v22 = @"The output pixelBuffer from Vision is not the expected height.";
    if (a6)
    {
LABEL_17:
      v50 = @"CINonLocalizedDescriptionKey";
      v51 = v22;
      v23 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CIPersonSegmentationKernel", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
      goto LABEL_18;
    }
LABEL_31:
    BOOL v26 = 0;
    goto LABEL_32;
  }
  if (CVPixelBufferGetPixelFormatType(v19) != 1278226488)
  {
    v22 = @"The output pixelBuffer from Vision is not the expected format.";
    if (a6) {
      goto LABEL_17;
    }
    goto LABEL_31;
  }
  CVPixelBufferLockBaseAddress(v19, 1uLL);
  v27 = (char *)[a5 baseAddress];
  [a5 region];
  double v28 = CGRectGetHeight(v53);
  unint64_t v29 = [a5 bytesPerRow];
  size_t v30 = CVPixelBufferGetHeight(v19);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v19);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(v19);
  if (v30 >= (unint64_t)v28) {
    unint64_t v33 = (unint64_t)v28;
  }
  else {
    unint64_t v33 = v30;
  }
  if (BytesPerRow >= v29) {
    size_t v34 = v29;
  }
  else {
    size_t v34 = BytesPerRow;
  }
  if (v33)
  {
    v35 = BaseAddress;
    unsigned int v36 = 1;
    do
    {
      memmove(v27, v35, v34);
      v27 += v29;
      v35 += BytesPerRow;
    }
    while (v33 > v36++);
  }
  CVPixelBufferUnlockBaseAddress(v19, 1uLL);
  BOOL v26 = 1;
LABEL_32:
  return v26;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 266;
}

+ (int)outputFormat
{
  return 261;
}

@end