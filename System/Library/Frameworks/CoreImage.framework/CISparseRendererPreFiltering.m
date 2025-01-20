@interface CISparseRendererPreFiltering
- (CIImage)inputImage;
- (NSDictionary)inputTuningParameters;
- (NSNumber)inputApertureScaling;
- (NSNumber)inputScale;
- (id)_kernel:(BOOL)a3;
- (id)outputImage;
- (id)outputImage:(id)a3 horizontal:(BOOL)a4 width:(double)a5;
- (void)dumpImage:(id)a3 extent:(CGRect)a4 prefixFilename:(id)a5;
- (void)setInputApertureScaling:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputScale:(id)a3;
- (void)setInputTuningParameters:(id)a3;
@end

@implementation CISparseRendererPreFiltering

- (id)_kernel:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = SDOFV2MetalLibURL();
  if (v3) {
    v5 = @"_sparserendering_prefilter_x";
  }
  else {
    v5 = @"_sparserendering_prefilter_y";
  }

  return +[CIKernel cachedKernelWithFunctionName:v5 fromMetalLibrary:v4 error:0];
}

- (id)outputImage:(id)a3 horizontal:(BOOL)a4 width:(double)a5
{
  v44[3] = *MEMORY[0x1E4F143B8];
  if (a3 && (id v9 = [(CISparseRendererPreFiltering *)self _kernel:a4]) != 0)
  {
    v10 = v9;
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    int v41 = 0;
    SDOFRenderingValue(&cfstr_Prefilterradiu.isa, self->inputTuningParameters);
    int v41 = v11;
    [(NSNumber *)self->inputApertureScaling floatValue];
    float v13 = v12;
    SDOFHighlightRecoveryValue(&cfstr_Blurradiust1.isa, self->inputTuningParameters);
    float v15 = v14;
    SDOFHighlightRecoveryValue(&cfstr_Blurradiust0.isa, self->inputTuningParameters);
    float v17 = v16;
    SDOFRenderingValue(&cfstr_Maxblur.isa, self->inputTuningParameters);
    float v19 = v18;
    SDOFRenderingValue(&cfstr_Prefilterradiu.isa, self->inputTuningParameters);
    float v21 = v20;
    SDOFRenderingValue(&cfstr_Prefilterblurs.isa, self->inputTuningParameters);
    float v23 = v22;
    SDOFHighlightRecoveryValue(&cfstr_Prefiltergain.isa, self->inputTuningParameters);
    v25 = +[CIVector vectorWithX:v19 Y:v21 Z:v23 W:v24];
    [(NSNumber *)self->inputScale floatValue];
    v27 = +[CIVector vectorWithX:(float)(1.0 / (float)((float)(v13 * v15) - (float)(v13 * v17))) Y:(float)-(float)((float)(1.0 / (float)((float)(v13 * v15) - (float)(v13 * v17))) * (float)(v13 * v17)) Z:a5 W:v26];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    int v39 = 0;
    [(NSNumber *)self->inputScale floatValue];
    int v39 = v28;
    double v29 = *MEMORY[0x1E4F1DB10];
    double v30 = *(double *)(MEMORY[0x1E4F1DB10] + 8);
    double v31 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
    double v32 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __61__CISparseRendererPreFiltering_outputImage_horizontal_width___block_invoke;
    v36[3] = &unk_1E5772988;
    BOOL v37 = a4;
    v36[4] = v40;
    v36[5] = v38;
    v44[0] = a3;
    v44[1] = v25;
    v44[2] = v27;
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    v42 = @"kCIKernelOutputFormat";
    uint64_t v43 = [NSNumber numberWithInt:2056];
    v34 = objc_msgSend(v10, "applyWithExtent:roiCallback:arguments:options:", v36, v33, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1), v29, v30, v31, v32);
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(v40, 8);
    return v34;
  }
  else
  {
    return +[CIImage emptyImage];
  }
}

double __61__CISparseRendererPreFiltering_outputImage_horizontal_width___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  float v5 = -(float)(*(float *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
              * *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  double v6 = v5;
  if (*(unsigned char *)(a1 + 48)) {
    double v7 = v5;
  }
  else {
    double v7 = 0.0;
  }
  if (*(unsigned char *)(a1 + 48)) {
    double v6 = 0.0;
  }
  *(void *)&double result = (unint64_t)CGRectInset(*(CGRect *)&a2, v7, v6);
  return result;
}

- (void)dumpImage:(id)a3 extent:(CGRect)a4 prefixFilename:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  v15[2] = *MEMORY[0x1E4F143B8];
  v8 = objc_msgSend(a3, "imageByCroppingToRect:", a4.origin.x, a4.origin.y);
  id v9 = malloc_type_malloc((unint64_t)(height * (width * 8.0)), 0x45B71925uLL);
  if (v9)
  {
    v10 = v9;
    v14[0] = @"working_format";
    v14[1] = @"kCIContextName";
    v15[0] = [NSNumber numberWithInt:2056];
    v15[1] = @"CIPortraitBlurVr-dumpImage";
    int v11 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2]);
    [v8 extent];
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v8, v10, (uint64_t)(width * 8.0), 2056, 0);
    float v12 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:v10 length:(unint64_t)(height * (width * 8.0))];
    uint64_t v13 = [NSString stringWithFormat:@"%@/%@%gx%g.f16", NSTemporaryDirectory(), a5, *(void *)&width, *(void *)&height];
    [v12 writeToFile:v13 atomically:1];
    NSLog(&cfstr_Filename_0.isa, v13);
    free(v10);
  }
}

- (id)outputImage
{
  [(CIImage *)self->inputImage extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CISparseRendererPreFiltering *)self outputImage:[(CISparseRendererPreFiltering *)self outputImage:[(CIImage *)self->inputImage imageByClampingToExtent] horizontal:1 width:v7] horizontal:0 width:v7];
  v14.origin.x = v4;
  v14.origin.y = v6;
  v14.size.double width = v8;
  v14.size.double height = v10;
  if (CGRectEqualToRect(*MEMORY[0x1E4F1DB10], v14)) {
    return v11;
  }

  return (id)objc_msgSend(v11, "imageByCroppingToRect:", v4, v6, v8, v10);
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputImage:(id)a3
{
}

- (NSDictionary)inputTuningParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputTuningParameters:(id)a3
{
}

- (NSNumber)inputApertureScaling
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputApertureScaling:(id)a3
{
}

- (NSNumber)inputScale
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputScale:(id)a3
{
}

@end