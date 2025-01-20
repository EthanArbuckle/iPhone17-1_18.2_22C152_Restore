@interface AXMBrailleEdgesDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (id)_generateResultFromImage:(id)a3 canvasDescription:(id)a4 invert:(BOOL)a5;
- (id)_processImage:(id)a3 analaysisOptions:(id)a4;
- (unsigned)_mapLuminance:(double)a3 toDiscreteNumber:(unint64_t)a4 invert:(BOOL)a5;
- (void)evaluate:(id)a3 metrics:(id)a4;
@end

@implementation AXMBrailleEdgesDetectorNode

+ (BOOL)isSupported
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)title
{
  return @"Braille Edge Detector";
}

- (id)_generateResultFromImage:(id)a3 canvasDescription:(id)a4 invert:(BOOL)a5
{
  BOOL v5 = a5;
  v57[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  size_t v10 = [v9 height];
  size_t v11 = [v9 width];
  v12 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v56 = *MEMORY[0x1E4F1E1E0];
  v57[0] = MEMORY[0x1E4F1CC28];
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:&v56 count:1];
  v14 = [v12 contextWithOptions:v13];

  [v8 extent];
  v15 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:", v8, 0.0, 0.0);
  if (v15)
  {
    v16 = v15;
    v45 = v14;
    id v46 = v8;
    size_t Width = CGImageGetWidth(v15);
    size_t Height = CGImageGetHeight(v16);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v43 = (char *)malloc_type_calloc(4 * v10 * v11, 1uLL, 0x100004077774924uLL);
    c = CGBitmapContextCreate(v43, v11, v10, 8uLL, 4 * v11, DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    v19 = AXLogCommon();
    size_t v20 = v10;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v41 = [NSNumber numberWithUnsignedInteger:v10];
      size_t v42 = Height;
      v21 = [NSNumber numberWithUnsignedInteger:v11];
      uint64_t v22 = [NSNumber numberWithUnsignedInteger:Height];
      [NSNumber numberWithUnsignedInteger:Width];
      *(_DWORD *)buf = 138413058;
      v49 = v41;
      __int16 v50 = 2112;
      v51 = v21;
      __int16 v52 = 2112;
      uint64_t v53 = v22;
      v23 = (void *)v22;
      v55 = __int16 v54 = 2112;
      v24 = (void *)v55;
      _os_log_impl(&dword_1B57D5000, v19, OS_LOG_TYPE_DEFAULT, "%@ %@ -- %@ %@", buf, 0x2Au);

      size_t v10 = v20;
      size_t Height = v42;
    }

    double v25 = (double)((v11 - Width) >> 1);
    double v26 = 0.0;
    if (v11 > Width)
    {
      unint64_t v27 = Width;
    }
    else
    {
      double v25 = 0.0;
      unint64_t v27 = v11;
    }
    if (Height >= v10) {
      unint64_t v28 = v10;
    }
    else {
      unint64_t v28 = Height;
    }
    if (v10 > Height) {
      double v26 = (double)((v10 - Height) >> 1);
    }
    double v29 = (double)v27;
    double v30 = (double)v28;
    CGContextDrawImage(c, *(CGRect *)&v25, v16);
    CGContextRelease(c);
    CFRelease(v16);
    v31 = [MEMORY[0x1E4F1CA58] data];
    if (v10)
    {
      uint64_t v34 = 0;
      v35 = v43 + 2;
      do
      {
        v36 = v35;
        for (size_t i = v11; i; --i)
        {
          LOBYTE(v32) = *(v36 - 2);
          LOBYTE(v33) = *(v36 - 1);
          *(double *)&unint64_t v38 = (double)v33 * 0.7152 / 255.0;
          double v39 = (double)v32 * 0.2126 / 255.0 + *(double *)&v38;
          LOBYTE(v38) = *v36;
          buf[0] = 0;
          buf[0] = -[AXMBrailleEdgesDetectorNode _mapLuminance:toDiscreteNumber:invert:](self, "_mapLuminance:toDiscreteNumber:invert:", [v9 numberOfDiscretePinHeights], v5, v39 + (double)v38 * 0.0722 / 255.0);
          [v31 appendBytes:buf length:1];
          v36 += 4;
        }
        ++v34;
        v35 += 4 * v11;
      }
      while (v34 != v20);
    }
    v14 = v45;
    id v8 = v46;
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (unsigned)_mapLuminance:(double)a3 toDiscreteNumber:(unint64_t)a4 invert:(BOOL)a5
{
  if (a5)
  {
    if (a4 >= 0x100)
    {
      float v5 = a3 * -255.0 + 1.0;
      return vcvtps_s32_f32(v5);
    }
    else
    {
      float v7 = (float)(a4 - 1) - (float)(a4 - 1) * a3;
      return vcvtms_u32_f32(v7);
    }
  }
  else if (a4 >= 0x100)
  {
    float v6 = a3 * 255.0;
    return vcvtms_s32_f32(v6);
  }
  else
  {
    float v9 = (float)(a4 - 1) * a3;
    return vcvtps_u32_f32(v9);
  }
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AXMBrailleEdgesDetectorNode;
  id v6 = a3;
  [(AXMEvaluationNode *)&v18 evaluate:v6 metrics:a4];
  float v7 = objc_msgSend(v6, "sourceInput", v18.receiver, v18.super_class);
  id v8 = [v7 ciImage];
  float v9 = [v6 analysisOptions];
  size_t v10 = [(AXMBrailleEdgesDetectorNode *)self _processImage:v8 analaysisOptions:v9];

  size_t v11 = [v6 result];
  v12 = [v6 analysisOptions];
  v13 = [v12 brailleEdgeOptions];
  v14 = [v13 canvasDescription];
  v15 = [v6 analysisOptions];

  v16 = [v15 brailleEdgeOptions];
  v17 = -[AXMBrailleEdgesDetectorNode _generateResultFromImage:canvasDescription:invert:](self, "_generateResultFromImage:canvasDescription:invert:", v10, v14, [v16 invert]);
  [v11 setBrailleEdges:v17];
}

- (id)_processImage:(id)a3 analaysisOptions:(id)a4
{
  v63[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v5 extent];
  if (v7 > 600.0)
  {
    [v5 extent];
    CGAffineTransformMakeScale(&v59, 600.0 / v8, 600.0 / v8);
    uint64_t v9 = [v5 imageByApplyingTransform:&v59 highQualityDownsample:1];

    id v5 = (id)v9;
  }
  size_t v10 = [v6 brailleEdgeOptions];
  [v10 edgeStrength];
  if (v11 > 0.0)
  {
    v12 = (void *)MEMORY[0x1E4F1E040];
    uint64_t v14 = *MEMORY[0x1E4F1E488];
    v62[0] = *MEMORY[0x1E4F1E480];
    uint64_t v13 = v62[0];
    v62[1] = v14;
    v63[0] = v5;
    v15 = NSNumber;
    [v10 edgeStrength];
    v16 = objc_msgSend(v15, "numberWithDouble:");
    v63[1] = v16;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:2];
    objc_super v18 = [v12 filterWithName:@"CIEdges" withInputParameters:v17];

    v19 = (void *)MEMORY[0x1E4F1E040];
    v60[0] = v13;
    size_t v20 = [v18 outputImage];
    v60[1] = v14;
    v61[0] = v20;
    v61[1] = &unk_1F0E93F80;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:2];
    uint64_t v22 = [v19 filterWithName:@"CIBloom" withInputParameters:v21];

    v23 = [v22 outputImage];
    v24 = [v22 outputImage];
    [v23 extent];
    CGFloat v26 = -v25;
    [v23 extent];
    CGAffineTransformMakeTranslation(&v57, v26, -v27);
    [v23 extent];
    double v29 = v28;
    [v5 extent];
    CGFloat v31 = v29 / v30;
    [v23 extent];
    double v33 = v32;
    [v5 extent];
    CGAffineTransformScale(&v58, &v57, v31, v33 / v34);
    uint64_t v35 = [v24 imageByApplyingTransform:&v58];

    id v5 = (id)v35;
  }
  v36 = [v10 canvasDescription];
  double v37 = (double)(unint64_t)[v36 width];
  [v5 extent];
  double v39 = v37 / v38 * 1.1;

  v40 = [v10 canvasDescription];
  double v41 = (double)(unint64_t)[v40 height];
  [v5 extent];
  double v43 = v41 / v42 * 1.1;

  if (v39 < v43) {
    double v43 = v39;
  }
  [v10 zoomLevel];
  CGAffineTransformMakeScale(&v56, v44 * v43, v44 * v43);
  v45 = [v5 imageByApplyingTransform:&v56 highQualityDownsample:1];
  [v45 extent];
  double v47 = v46;
  [v10 origin];
  CGFloat v49 = -(v48 * v47);
  [v45 extent];
  double v51 = v50;
  [v10 origin];
  CGAffineTransformMakeTranslation(&v55, v49, v51 * v52);
  uint64_t v53 = [v45 imageByApplyingTransform:&v55 highQualityDownsample:1];

  return v53;
}

@end