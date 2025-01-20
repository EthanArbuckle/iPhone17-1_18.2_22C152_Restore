@interface CIMetalProcessor
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3;
+ (BOOL)allowSRGBTranferFuntionOnOutput;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (id)logDescription:(id)a3;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
+ (void)setFilterParams:(id)a3 arguments:(id)a4 filter:(id)a5;
+ (void)setFilterParamsAndImages:(id)a3 arguments:(id)a4 filter:(id)a5;
@end

@implementation CIMetalProcessor

+ (id)logDescription:(id)a3
{
  v3 = NSString;
  uint64_t v4 = [a3 objectForKeyedSubscript:@"filterName"];
  v5 = @"nil";
  if (v4) {
    v5 = (__CFString *)v4;
  }
  return (id)[v3 stringWithFormat:@"CIMetalProcessor-%@", v5];
}

+ (void)setFilterParams:(id)a3 arguments:(id)a4 filter:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(a5, "setValuesForKeysWithDictionary:", objc_msgSend(a4, "objectForKeyedSubscript:", @"filterParameters"));
  v8 = (void *)[a4 objectForKeyedSubscript:@"inputImages"];
  v9 = (void *)[a4 objectForKeyedSubscript:@"inputImageKeys"];
  if ([v8 count])
  {
    unint64_t v10 = 0;
    do
    {
      v11 = (void *)[a3 objectAtIndexedSubscript:v10];
      uint64_t v12 = [v9 objectAtIndexedSubscript:v10];
      [v11 region];
      if (CGRectIsEmpty(v24))
      {
        v13 = +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor]);
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v10), "extent");
        objc_msgSend(a5, "setValue:forKey:", -[CIImage imageByCroppingToRect:](v13, "imageByCroppingToRect:"), v12);
      }
      else
      {
        v22 = @"CIImageColorSpace";
        v23[0] = [MEMORY[0x1E4F1CA98] null];
        v14 = +[CIImage imageWithIOSurface:options:](CIImage, "imageWithIOSurface:options:", [v11 surface], objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1));
        memset(&v21, 0, sizeof(v21));
        [v11 region];
        CGFloat v16 = v15;
        [v11 region];
        CGAffineTransformMakeTranslation(&v21, v16, v17);
        CGAffineTransform v20 = v21;
        v18 = [[(CIImage *)v14 imageByApplyingTransform:&v20] imageByClampingToExtent];
        objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v10), "extent");
        v19 = -[CIImage imageByCroppingToRect:](v18, "imageByCroppingToRect:");
        if ([v11 usesSRGBTransferFunction]) {
          v19 = [(CIImage *)v19 imageByApplyingFilter:@"CISRGBToneCurveToLinear"];
        }
        [a5 setValue:v19 forKey:v12];
      }
      ++v10;
    }
    while (v10 < [v8 count]);
  }
}

+ (void)setFilterParamsAndImages:(id)a3 arguments:(id)a4 filter:(id)a5
{
  objc_msgSend(a5, "setValuesForKeysWithDictionary:", objc_msgSend(a4, "objectForKeyedSubscript:", @"filterParameters"));
  v8 = (void *)[a4 objectForKeyedSubscript:@"inputImageKeys"];
  if ([a3 count])
  {
    unint64_t v9 = 0;
    do
    {
      objc_msgSend(a5, "setValue:forKey:", objc_msgSend(a3, "objectAtIndexedSubscript:", v9), objc_msgSend(v8, "objectAtIndexedSubscript:", v9));
      ++v9;
    }
    while (v9 < [a3 count]);
  }
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  unint64_t v10 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", [a4 objectForKeyedSubscript:@"filterName"]);
  if (!v10) {
    +[CIMetalProcessor processWithInputs:arguments:output:error:]();
  }
  v11 = v10;
  [a1 setFilterParams:a3 arguments:a4 filter:v10];
  uint64_t v12 = [(CIFilter *)v11 outputImage];
  if (!v12) {
    +[CIMetalProcessor processWithInputs:arguments:output:error:]();
  }
  v13 = (void *)v12;
  uint64_t v14 = [a5 metalContext];
  if (!v14) {
    +[CIMetalProcessor processWithInputs:arguments:output:error:]();
  }
  double v15 = (void *)v14;
  memset(&v27, 0, sizeof(v27));
  [a5 region];
  CGFloat v17 = -v16;
  [a5 region];
  CGAffineTransformMakeTranslation(&v27, v17, -v18);
  CGAffineTransform v26 = v27;
  v19 = (void *)[v13 imageByApplyingTransform:&v26];
  if ([a5 usesSRGBTransferFunction]) {
    v19 = (void *)[v19 imageByApplyingFilter:@"CILinearToSRGBToneCurve"];
  }
  [a5 region];
  double v21 = v20;
  [a5 region];
  double v23 = v22;
  CGRect v24 = -[CIRenderDestination initWithMTLTexture:commandBuffer:]([CIRenderDestination alloc], "initWithMTLTexture:commandBuffer:", [a5 metalTexture], objc_msgSend(a5, "metalCommandBuffer"));
  [(CIRenderDestination *)v24 setFlipped:1];
  objc_msgSend(v15, "startTaskToRender:fromRect:toDestination:atPoint:error:", v19, v24, 0, 0.0, 0.0, v21, v23, 0.0, 0.0);

  return 1;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v12 = (void *)[a4 objectForKeyedSubscript:@"inputImages"];
  v13 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", [a4 objectForKeyedSubscript:@"filterName"]);
  if (!v13) {
    +[CIMetalProcessor roiForInput:arguments:outputRect:]();
  }
  uint64_t v14 = v13;
  [a1 setFilterParamsAndImages:v12 arguments:a4 filter:v13];
  double v15 = [(CIFilter *)v14 outputImage];
  uint64_t v16 = [v12 objectAtIndexedSubscript:a3];

  -[CIImage regionOfInterestForImage:inRect:](v15, "regionOfInterestForImage:inRect:", v16, x, y, width, height);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (int)outputFormat
{
  return 0;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

+ (void)processWithInputs:arguments:output:error:.cold.1()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.2()
{
}

+ (void)processWithInputs:arguments:output:error:.cold.3()
{
}

+ (void)roiForInput:arguments:outputRect:.cold.1()
{
}

@end