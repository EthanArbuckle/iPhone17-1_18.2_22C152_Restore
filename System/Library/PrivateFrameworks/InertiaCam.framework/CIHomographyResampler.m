@interface CIHomographyResampler
- (CGRect)hightlightRect;
- (CIHomographyResampler)init;
- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5;
- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 pixelBufferPool:(__CVPixelBufferPool *)a6;
- (signed)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 toPixelBuffer:(__CVBuffer *)a6;
- (void)setHightlightRect:(CGRect)a3;
- (void)updateBackgroundFill:(CGRect)a3;
@end

@implementation CIHomographyResampler

- (CIHomographyResampler)init
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CIHomographyResampler;
  v2 = [(ImageHomographyResampler *)&v8 init];
  if (v2)
  {
    v9[0] = *MEMORY[0x1E4F1E240];
    v3 = [MEMORY[0x1E4F1CA98] null];
    v9[1] = *MEMORY[0x1E4F1E1F0];
    v10[0] = v3;
    v10[1] = MEMORY[0x1E4F1CC38];
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

    uint64_t v5 = [MEMORY[0x1E4F1E018] contextWithOptions:v4];
    ctx = v2->_ctx;
    v2->_ctx = (CIContext *)v5;
  }
  return v2;
}

- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5
{
  return -[CIHomographyResampler ResampleCVPixels:clipToRect:outputSize:pixelBufferPool:](self, "ResampleCVPixels:clipToRect:outputSize:pixelBufferPool:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.width, a5.height);
}

- (__CVBuffer)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 pixelBufferPool:(__CVPixelBufferPool *)a6
{
  double height = a5.height;
  double width = a5.width;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v27[1] = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef v25 = 0;
  uint64_t v26 = *MEMORY[0x1E4F24D20];
  v27[0] = MEMORY[0x1E4F1CC08];
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
  if (a6)
  {
    CFDictionaryRef PixelBufferAttributes = CVPixelBufferPoolGetPixelBufferAttributes(a6);
    v17 = [(__CFDictionary *)PixelBufferAttributes objectForKeyedSubscript:@"Height"];
    int v18 = [v17 unsignedIntValue];

    v19 = [(__CFDictionary *)PixelBufferAttributes objectForKeyedSubscript:@"Width"];
    int v20 = [v19 unsignedIntValue];

    if (v18 != height || v20 != width) {
      return v25;
    }
    CVReturn v21 = CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a6, &v25);
  }
  else
  {
    CFDictionaryRef v22 = (const __CFDictionary *)v15;
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    CVReturn v21 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (unint64_t)width, (unint64_t)height, PixelFormatType, v22, &v25);
  }
  if (!v21) {
    -[CIHomographyResampler ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:](self, "ResampleCVPixels:clipToRect:outputSize:toPixelBuffer:", a3, v25, x, y, v10, v9, width, height);
  }
  return v25;
}

- (void)updateBackgroundFill:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_lastFillRect = &self->_lastFillRect;
  if (!CGRectEqualToRect(a3, self->_lastFillRect))
  {
    id v9 = objc_alloc(MEMORY[0x1E4F1E050]);
    double v10 = [MEMORY[0x1E4F1E008] grayColor];
    v11 = (void *)[v9 initWithColor:v10];
    objc_msgSend(v11, "imageByCroppingToRect:", x, y, width, height);
    v12 = (CIImage *)objc_claimAutoreleasedReturnValue();
    fillImage = self->_fillImage;
    self->_fillImage = v12;

    p_lastFillRect->origin.double x = x;
    p_lastFillRect->origin.double y = y;
    p_lastFillRect->size.double width = width;
    p_lastFillRect->size.double height = height;
  }
}

- (signed)ResampleCVPixels:(__CVBuffer *)a3 clipToRect:(CGRect)a4 outputSize:(CGSize)a5 toPixelBuffer:(__CVBuffer *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  CGRect CleanRect = CVImageBufferGetCleanRect(a3);
  double v11 = CleanRect.origin.x;
  double v12 = CleanRect.origin.y;
  double v78 = CleanRect.size.width;
  double v13 = CleanRect.size.height;
  uint64_t v14 = 0;
  float v15 = (float)(unint64_t)CleanRect.size.height;
  do
  {
    float v16 = self->super.homographyMatrix[v14];
    *(&v91 + v14++) = v16;
  }
  while (v14 != 9);
  v76 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:a3];
  v17 = objc_msgSend(v76, "imageByCroppingToRect:", v11, v12, v78, v13);
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v89.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v89.c = v18;
  *(_OWORD *)&v89.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  CGAffineTransformTranslate(&v90, &v89, -v11, -v12);
  v62 = v17;
  [v17 imageByApplyingTransform:&v90];
  double v66 = y;
  double v67 = width;
  v61 = double v68 = height;
  v72 = [v61 imageByApplyingOrientation:4];
  double v65 = x;
  float v19 = v91;
  float v73 = v92;
  float v20 = v92 * v15;
  float v82 = v93;
  float v21 = v93 + (float)((float)(v92 * v15) + (float)(v91 * 0.0));
  float v22 = v96;
  float v70 = v95;
  float v23 = v95 * v15;
  float v80 = v94;
  float v24 = v96 + (float)((float)(v95 * v15) + (float)(v94 * 0.0));
  float v25 = v97;
  float v69 = v98;
  float v26 = v98 * v15;
  float v27 = (float)(v98 * v15) + (float)(v97 * 0.0);
  float v28 = v99;
  v75 = [MEMORY[0x1E4F1E080] vectorWithX:(float)(v21 / (float)(v99 + v27)) Y:(float)(v24 / (float)(v99 + v27))];
  float v29 = (float)(unint64_t)v78;
  v79 = [MEMORY[0x1E4F1E080] vectorWithX:(float)((float)(v82 + (float)(v20 + (float)(v19 * v29))) / (float)(v28 + (float)(v26 + (float)(v25 * v29)))) Y:(float)((float)(v22 + (float)(v23 + (float)(v80 * v29))) / (float)(v28 + (float)(v26 + (float)(v25 * v29))))];
  float v30 = v73 * 0.0;
  v74 = [MEMORY[0x1E4F1E080] vectorWithX:(float)((float)(v82 + (float)((float)(v73 * 0.0) + (float)(v19 * v29)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * v29)))) Y:(float)((float)(v22 + (float)((float)(v70 * 0.0) + (float)(v80 * v29)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * v29))))];
  v83 = [MEMORY[0x1E4F1E080] vectorWithX:(float)((float)(v82 + (float)(v30 + (float)(v19 * 0.0)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * 0.0)))) Y:(float)((float)(v22 + (float)((float)(v70 * 0.0) + (float)(v80 * 0.0)))/ (float)(v28 + (float)((float)(v69 * 0.0) + (float)(v25 * 0.0))))];
  v31 = [MEMORY[0x1E4F1E040] filterWithName:@"CIPerspectiveTransform"];
  v32 = [MEMORY[0x1E4F1E040] filterWithName:@"CICrop"];
  [v31 setValue:v75 forKey:@"inputTopLeft"];
  [v31 setValue:v79 forKey:@"inputTopRight"];
  [v31 setValue:v74 forKey:@"inputBottomRight"];
  [v31 setValue:v83 forKey:@"inputBottomLeft"];
  [v31 setValue:v72 forKey:@"inputImage"];
  v81 = [v31 outputImage];
  -[CIHomographyResampler updateBackgroundFill:](self, "updateBackgroundFill:", v65, v66, v67, v68);
  v71 = [v81 imageByCompositingOverImage:self->_fillImage];
  v33 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", (double)(int)v65, (double)(int)v66, (double)((int)(v67 + (double)(int)v65) - (int)v65), (double)((int)(v68 + (double)(int)v66) - (int)v66));
  [v32 setValue:v33 forKey:@"inputRectangle"];

  [v32 setValue:v71 forKey:@"inputImage"];
  v34 = [v32 outputImage];
  if (!CGRectIsEmpty(self->hightlightRect))
  {
    [v34 extent];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v43 = [MEMORY[0x1E4F1E040] filterWithName:@"CICrop"];
    v44 = objc_msgSend(MEMORY[0x1E4F1E080], "vectorWithCGRect:", self->hightlightRect.origin.x, self->hightlightRect.origin.y, self->hightlightRect.size.width, self->hightlightRect.size.height);
    [v43 setValue:v44 forKey:@"inputRectangle"];

    [v43 setValue:v34 forKey:@"inputImage"];
    v45 = [v43 outputImage];
    v46 = [MEMORY[0x1E4F1E040] filterWithName:@"CIColorControls"];
    LODWORD(v47) = 1050253722;
    v48 = [NSNumber numberWithFloat:v47];
    [v46 setValue:v48 forKey:@"inputContrast"];

    [v46 setValue:v34 forKey:@"inputImage"];
    v49 = [v46 outputImage];
    v50 = [v45 imageByCompositingOverImage:v49];

    uint64_t v51 = objc_msgSend(v50, "imageByCroppingToRect:", v36, v38, v40, v42);

    v34 = (void *)v51;
  }
  float v52 = v65;
  float v53 = v66;
  CGAffineTransformMakeTranslation(&v88, (float)-v52, (float)-v53);
  v54 = [v34 imageByApplyingTransform:&v88];
  v55 = v54;
  memset(&v87, 0, sizeof(v87));
  if (v54) {
    [v54 imageTransformForOrientation:4];
  }
  else {
    memset(&v86, 0, sizeof(v86));
  }
  CGAffineTransformInvert(&v87, &v86);
  CGAffineTransform v85 = v87;
  v56 = [v55 imageByApplyingTransform:&v85];
  float v57 = a5.width / v67;
  float v58 = a5.height / v68;
  CGAffineTransformMakeScale(&v84, v57, v58);
  v59 = [v56 imageByApplyingTransform:&v84];
  CVBufferPropagateAttachments(a3, a6);
  CVBufferRemoveAttachment(a6, (CFStringRef)*MEMORY[0x1E4F24A78]);
  [(CIContext *)self->_ctx render:v59 toCVPixelBuffer:a6];

  return 0;
}

- (CGRect)hightlightRect
{
  objc_copyStruct(v6, &self->hightlightRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setHightlightRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->hightlightRect, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillImage, 0);
  objc_storeStrong((id *)&self->_ctx, 0);
}

@end