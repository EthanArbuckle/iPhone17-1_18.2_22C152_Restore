@interface NTKUltraCubeSegmentationValidator
+ (BOOL)isAuxiliaryDictionarySegmentationValid:(id)a3;
+ (NTKUltraCubeSegmentationBimodalScore)bimodalScoreForMaskImage:(CGImage *)a3;
@end

@implementation NTKUltraCubeSegmentationValidator

+ (BOOL)isAuxiliaryDictionarySegmentationValid:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NTKUltraCubeSegmentation maskImageFromAuxiliaryDictionary:v4];
    if (v5)
    {
      [a1 bimodalScoreForMaskImage:v5];
      float v7 = v6;
      v8 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315394;
        v11 = "+[NTKUltraCubeSegmentationValidator isAuxiliaryDictionarySegmentationValid:]";
        __int16 v12 = 2048;
        double v13 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s: segmentation has a bimodalScore of %f", (uint8_t *)&v10, 0x16u);
      }

      CGImageRelease(v5);
      LOBYTE(v5) = v7 > 0.5;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

+ (NTKUltraCubeSegmentationBimodalScore)bimodalScoreForMaskImage:(CGImage *)a3
{
  if (a3)
  {
    v3 = +[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:");
    id v4 = +[CIFilter areaHistogramFilter];
    [v4 setInputImage:v3];
    [v4 setCount:100];
    [v3 extent];
    objc_msgSend(v4, "setExtent:");
    LODWORD(v5) = 1.0;
    [v4 setScale:v5];
    float v6 = [v4 outputImage];
    if (v6)
    {
      float v7 = +[CIContext context];
      id v8 = [objc_alloc((Class)NSMutableData) initWithLength:400];
      id v9 = [v8 mutableBytes];
      id v10 = [v8 length];
      [v6 extent];
      objc_msgSend(v7, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v6, v9, v10, kCIFormatRf, 0);
      id v11 = v8;
      __int16 v12 = (float *)[v11 bytes];
      float v13 = *v12;
      float v14 = v12[99];
      NTKSmoothstep();
      float v16 = v15;
      NTKSmoothstep();
      float v18 = v17;
      NTKSmoothstep();
      float v20 = (float)(v16 * v18) * v19;
    }
    else
    {
      v21 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 136315138;
        v26 = "+[NTKUltraCubeSegmentationValidator bimodalScoreForMaskImage:]";
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%s: outputImage on the histogramFilter was nil", (uint8_t *)&v25, 0xCu);
      }

      float v14 = 0.0;
      float v13 = 0.0;
      float v20 = 0.0;
    }
  }
  else
  {
    float v14 = 0.0;
    float v13 = 0.0;
    float v20 = 0.0;
  }
  float v22 = v20;
  float v23 = v13;
  float v24 = v14;
  result.var2 = v24;
  result.var1 = v23;
  result.var0 = v22;
  return result;
}

@end