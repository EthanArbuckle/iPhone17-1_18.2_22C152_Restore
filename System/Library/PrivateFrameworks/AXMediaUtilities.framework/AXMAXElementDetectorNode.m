@interface AXMAXElementDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (AXMindNetDetector)clickabilityDetector;
- (AXMindNetDetector)mindNetDetector;
- (double)IoUForbb1:(CGRect)a3 bb2:(CGRect)a4;
- (id)_imageByWipingTextFromRects:(id)a3 image:(id)a4 colorSpace:(CGColorSpace *)a5 ciContext:(id)a6;
- (id)_nonMaxSupression:(id)a3 iouThreshold:(double)a4;
- (id)_performCrossClassNMSForDetections:(id)a3 iouThreshold:(double)a4;
- (id)_screenEquivalenceToken:(id)a3;
- (id)contentVersionKey;
- (id)mlModelClasses;
- (id)mobileAssetType;
- (id)modelResourceNames;
- (int64_t)remapUIClassForClickability:(int)a3 andClass:(int64_t)a4;
- (unint64_t)maxSupportedFormatVersion;
- (unint64_t)minSupportedFormatVersion;
- (void)_evaluateANOD:(id)a3 metrics:(id)a4;
- (void)_initializeClickabilityModel;
- (void)_initializeIconDetector;
- (void)_initializeMindNetDetector;
- (void)evaluate:(id)a3 metrics:(id)a4;
@end

@implementation AXMAXElementDetectorNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isSupported
{
  return 1;
}

+ (id)title
{
  return @"AXElement Detector";
}

- (id)mlModelClasses
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)mobileAssetType
{
  v2 = [MEMORY[0x1E4F47E30] policy];
  v3 = [v2 assetType];

  return v3;
}

- (id)modelResourceNames
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)minSupportedFormatVersion
{
  v2 = [MEMORY[0x1E4F47E30] policy];
  v3 = [v2 minSupportedFormatVersion];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)maxSupportedFormatVersion
{
  v2 = [MEMORY[0x1E4F47E30] policy];
  v3 = [v2 maxSupportedFormatVersion];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)contentVersionKey
{
  return @"_ContentVersion_v2";
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXMAXElementDetectorNode;
  id v8 = [(AXMMobileAssetEvaluationNode *)&v13 evaluate:v6 metrics:v7];
  v9 = (void *)MEMORY[0x1BA9A10B0](v8);
  v10 = AXMediaLogDiagnostics();
  if (os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B57D5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode", (const char *)&unk_1B58C0396, v12, 2u);
  }

  [(AXMAXElementDetectorNode *)self _evaluateANOD:v6 metrics:v7];
  v11 = AXMediaLogDiagnostics();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B57D5000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode", (const char *)&unk_1B58C0396, v12, 2u);
  }
}

- (id)_imageByWipingTextFromRects:(id)a3 image:(id)a4 colorSpace:(CGColorSpace *)a5 ciContext:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v59 = a4;
  id v58 = a6;
  v9 = objc_msgSend(MEMORY[0x1E4F1E050], "emptyImage", v8);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
  if (v10)
  {
    uint64_t v57 = *(void *)v71;
    unsigned int v56 = *MEMORY[0x1E4F1E2F0];
    uint64_t v55 = *MEMORY[0x1E4F1E448];
    do
    {
      uint64_t v11 = 0;
      v67 = v9;
      uint64_t v60 = v10;
      do
      {
        if (*(void *)v71 != v57) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v11;
        v12 = *(void **)(*((void *)&v70 + 1) + 8 * v11);
        context = (void *)MEMORY[0x1BA9A10B0]();
        [v12 rectValue];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        v21 = objc_msgSend(v59, "imageByCroppingToRect:");
        [v21 extent];
        double v23 = v22;
        [v21 extent];
        double v25 = v24;
        [v21 extent];
        unint64_t v26 = vcvtd_n_u64_f64(v23, 2uLL);
        unint64_t v28 = (unint64_t)v27;
        [MEMORY[0x1E4F1CA58] dataWithLength:(unint64_t)v27 * v26];
        v65 = v21;
        id v66 = objc_claimAutoreleasedReturnValue();
        v29 = v21;
        uint64_t v30 = [v66 mutableBytes];
        [v29 extent];
        objc_msgSend(v58, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v29, v30, v26, v56, a5);
        v31 = [MEMORY[0x1E4F1CA60] dictionary];
        id v64 = v66;
        uint64_t v32 = [v64 bytes];
        if ((unint64_t)v25)
        {
          uint64_t v33 = 0;
          int v69 = 0;
          unint64_t v34 = 0;
          uint64_t v35 = 0;
          uint64_t v36 = v32 + 3;
          do
          {
            uint64_t v68 = v33;
            if (v28)
            {
              for (unint64_t i = 0; i < v28; i += 8)
              {
                uint64_t v38 = bswap32(*(_DWORD *)(v36 + v35 - 3));
                v39 = [NSNumber numberWithLongLong:v38];
                uint64_t v40 = [v31 objectForKeyedSubscript:v39];
                v41 = (void *)v40;
                v42 = &unk_1F0E93628;
                if (v40) {
                  v42 = (void *)v40;
                }
                id v43 = v42;

                v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v43, "unsignedIntegerValue") + 1);

                v45 = [NSNumber numberWithLongLong:v38];
                [v31 setObject:v44 forKeyedSubscript:v45];

                if ([v44 unsignedIntegerValue] > v34)
                {
                  unint64_t v34 = [v44 unsignedIntegerValue];
                  int v69 = v38;
                }

                v35 += 4;
              }
            }
            uint64_t v33 = v68 + 8;
          }
          while (v68 + 8 < (unint64_t)v25);
        }
        else
        {
          int v69 = 0;
        }
        v46 = [MEMORY[0x1E4F1E008] colorWithRed:a5 green:(double)HIBYTE(v69) / 255.0 blue:(double)BYTE2(v69) / 255.0 alpha:(double)BYTE1(v69) / 255.0 colorSpace:(double)v69 / 255.0];
        v47 = [MEMORY[0x1E4F1E040] filterWithName:@"CIConstantColorGenerator"];
        [v47 setValue:v46 forKey:v55];
        v48 = [v47 outputImage];
        v49 = [MEMORY[0x1E4F1E040] filterWithName:@"CICrop"];
        [v49 setValue:v48 forKey:@"inputImage"];
        v50 = [MEMORY[0x1E4F1E080] vectorWithX:v14 Y:v16 Z:v18 W:v20];
        [v49 setValue:v50 forKey:@"inputRectangle"];

        v51 = [v49 outputImage];
        v9 = [v51 imageByCompositingOverImage:v67];

        uint64_t v11 = v62 + 1;
        v67 = v9;
      }
      while (v62 + 1 != v60);
      uint64_t v10 = [obj countByEnumeratingWithState:&v70 objects:v74 count:16];
    }
    while (v10);
  }

  v52 = [v9 imageByCompositingOverImage:v59];

  return v52;
}

- (id)_screenEquivalenceToken:(id)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 extent];
  double v5 = v4;
  [v3 extent];
  if (v5 <= v6)
  {
    [v3 extent];
    double v8 = v9;
  }
  else
  {
    [v3 extent];
    double v8 = v7;
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v12 = *MEMORY[0x1E4F1E4E8];
  v47[0] = *MEMORY[0x1E4F1E480];
  uint64_t v11 = v47[0];
  v47[1] = v12;
  v48[0] = v3;
  v48[1] = &unk_1F0E93EB0;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  double v14 = [v10 filterWithName:@"CIColorControls" withInputParameters:v13];

  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, 32.0 / v8, 32.0 / v8);
  v39 = v14;
  uint64_t v15 = [MEMORY[0x1E4F29238] valueWithBytes:&v41 objCType:"{CGAffineTransform=dddddd}"];
  double v16 = (void *)MEMORY[0x1E4F1E040];
  uint64_t v17 = *MEMORY[0x1E4F1E508];
  v45[1] = v11;
  v46[0] = v15;
  v45[0] = v17;
  uint64_t v40 = (void *)v15;
  double v18 = [v14 outputImage];
  v46[1] = v18;
  double v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  double v20 = [v16 filterWithName:@"CIAffineTransform" withInputParameters:v19];

  uint64_t v38 = v20;
  v21 = [v20 outputImage];
  double v22 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v43 = *MEMORY[0x1E4F1E1E0];
  uint64_t v44 = MEMORY[0x1E4F1CC28];
  double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  double v24 = [v22 contextWithOptions:v23];

  [v21 extent];
  double v25 = (CGImage *)objc_msgSend(v24, "createCGImage:fromRect:", v21);
  unint64_t Width = CGImageGetWidth(v25);
  unint64_t Height = CGImageGetHeight(v25);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v29 = (unsigned __int8 *)malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  uint64_t v30 = CGBitmapContextCreate(v29, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v50.size.width = (double)Width;
  v50.size.height = (double)Height;
  v50.origin.x = 0.0;
  v50.origin.y = 0.0;
  CGContextDrawImage(v30, v50, v25);
  CGContextRelease(v30);
  CFRelease(v25);
  memset(v42, 0, sizeof(v42));
  if (Height)
  {
    uint64_t v31 = 0;
    unint64_t v32 = 0;
    uint64_t v33 = v29 + 4;
    do
    {
      unint64_t v34 = v33;
      unint64_t v35 = Width - 1;
      if (Width != 1)
      {
        do
        {
          if (*(v34 - 4) < *v34) {
            *(void *)((char *)v42 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v32;
          }
          v34 += 4;
          ++v32;
          --v35;
        }
        while (v35);
      }
      ++v31;
      v33 += 4 * Width;
    }
    while (v31 != Height);
  }
  free(v29);
  uint64_t v36 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v42 length:128];

  return v36;
}

- (id)_nonMaxSupression:(id)a3 iouThreshold:(double)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v38 = (id)objc_opt_new();
  [v35 sortedArrayUsingComparator:&__block_literal_global_13];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        double v5 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v41 = v38;
        uint64_t v6 = [v41 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v6)
        {
          uint64_t v43 = *(void *)v45;
          while (2)
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v45 != v43) {
                objc_enumerationMutation(v41);
              }
              double v8 = *(void **)(*((void *)&v44 + 1) + 8 * j);
              double v9 = [v8 labels];
              uint64_t v10 = [v9 firstObject];
              uint64_t v11 = [v10 identifier];

              uint64_t v12 = [v5 labels];
              double v13 = [v12 firstObject];
              double v14 = [v13 identifier];

              if ([v11 isEqual:v14]) {
                goto LABEL_31;
              }
              uint64_t v15 = +[AXMVisionFeature nameForUIClass:7];
              if ([v11 isEqualToString:v15])
              {
                int v16 = 1;
              }
              else
              {
                uint64_t v17 = +[AXMVisionFeature nameForUIClass:7];
                int v16 = [v14 isEqualToString:v17];
              }
              double v18 = +[AXMVisionFeature nameForUIClass:5];
              if ([v11 isEqualToString:v18])
              {
                int v19 = 1;
              }
              else
              {
                double v20 = +[AXMVisionFeature nameForUIClass:5];
                int v19 = [v14 isEqualToString:v20];
              }
              if (v19 & v16)
              {
LABEL_31:
                [v5 boundingBox];
                double v22 = v21;
                double v24 = v23;
                double v26 = v25;
                double v28 = v27;
                [v8 boundingBox];
                -[AXMAXElementDetectorNode IoUForbb1:bb2:](self, "IoUForbb1:bb2:", v22, v24, v26, v28, v29, v30, v31, v32);
                if (v33 > a4)
                {

                  goto LABEL_24;
                }
              }
            }
            uint64_t v6 = [v41 countByEnumeratingWithState:&v44 objects:v52 count:16];
            if (v6) {
              continue;
            }
            break;
          }
        }

        [v41 addObject:v5];
LABEL_24:
        ;
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v39);
  }

  return v38;
}

uint64_t __59__AXMAXElementDetectorNode__nonMaxSupression_iouThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 >= v8)
  {
    [v4 confidence];
    float v11 = v10;
    [v5 confidence];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)_initializeClickabilityModel
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_ERROR, "Clickability model does not exist: %@", v1, 0xCu);
}

- (void)_initializeMindNetDetector
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "MindNet detect had no base URL", v2, v3, v4, v5, v6);
}

- (double)IoUForbb1:(CGRect)a3 bb2:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  CGRect v15 = CGRectIntersection(a3, a4);
  double v13 = v15.size.height;
  double v14 = v15.size.width;
  v15.origin.CGFloat x = v11;
  v15.origin.CGFloat y = v10;
  v15.size.CGFloat width = v9;
  v15.size.CGFloat height = v8;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v16 = CGRectUnion(v15, v17);
  return v14 * v13 / (v16.size.width * v16.size.height);
}

- (id)_performCrossClassNMSForDetections:(id)a3 iouThreshold:(double)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v32 = (id)objc_opt_new();
  [v29 sortedArrayUsingComparator:&__block_literal_global_141];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v6)
  {
    uint64_t v31 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(obj);
        }
        CGFloat v8 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v9 = v32;
        uint64_t v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16, v29);
        if (v10)
        {
          uint64_t v11 = *(void *)v34;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v34 != v11) {
                objc_enumerationMutation(v9);
              }
              double v13 = *(void **)(*((void *)&v33 + 1) + 8 * j);
              int v14 = [v13 label];
              if (v14 == [v8 label])
              {
                [v8 box];
                double v16 = v15;
                double v18 = v17;
                double v20 = v19;
                double v22 = v21;
                [v13 box];
                -[AXMAXElementDetectorNode IoUForbb1:bb2:](self, "IoUForbb1:bb2:", v16, v18, v20, v22, v23, v24, v25, v26);
                if (v27 > a4)
                {

                  goto LABEL_17;
                }
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v41 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        [v9 addObject:v8];
LABEL_17:
        ;
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v6);
  }

  return v32;
}

uint64_t __76__AXMAXElementDetectorNode__performCrossClassNMSForDetections_iouThreshold___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 >= v8)
  {
    [v4 confidence];
    float v11 = v10;
    [v5 confidence];
    if (v11 <= v12) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = -1;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

- (void)_initializeIconDetector
{
  uint64_t v3 = [(AXMMobileAssetEvaluationNode *)[AXMIconClassDetectorNode alloc] initWithIdentifier:@"ScreenRecognitionIconDetector"];
  iconDetector = self->_iconDetector;
  self->_iconDetector = v3;

  id v5 = self->_iconDetector;

  [(AXMIconClassDetectorNode *)v5 setWriteDebugImage:0];
}

- (void)_evaluateANOD:(id)a3 metrics:(id)a4
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v203 = a3;
  id v185 = a4;
  if (!self->_mindNetDetector) {
    [(AXMAXElementDetectorNode *)self _initializeMindNetDetector];
  }
  if (!self->_clickabilityDetector) {
    [(AXMAXElementDetectorNode *)self _initializeClickabilityModel];
  }
  if (!self->_iconDetector) {
    [(AXMAXElementDetectorNode *)self _initializeIconDetector];
  }
  v206 = self;
  if (self->_mindNetDetector)
  {
    float v6 = [v203 sourceInput];
    v191 = [v6 ciImage];

    float v7 = AXMediaLogDiagnostics();
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B57D5000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-ScreenEquivalence", (const char *)&unk_1B58C0396, buf, 2u);
    }

    v184 = [(AXMAXElementDetectorNode *)self _screenEquivalenceToken:v191];
    float v8 = [v203 result];
    [v8 setEquivalenceToken:v184];

    uint64_t v9 = AXMediaLogDiagnostics();
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B57D5000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-ScreenEquivalence", (const char *)&unk_1B58C0396, buf, 2u);
    }

    float v10 = [v203 analysisOptions];
    float v11 = [v10 equivalenceToken];
    int v12 = [v184 isEqualToData:v11];

    if (v12)
    {
      id obj = AXMediaLogElementVision();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG)) {
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:]();
      }
    }
    else
    {
      int v14 = AXMediaLogMLElement();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "Beginning element detection:", buf, 2u);
      }

      [v191 extent];
      float v17 = v16;
      float v181 = v17;
      if (v17 == 0.0 || (float v18 = v15, v180 = v18, v18 == 0.0))
      {
        v173 = AXMediaLogMLElement();
        if (os_log_type_enabled(v173, OS_LOG_TYPE_ERROR)) {
          -[AXMAXElementDetectorNode _evaluateANOD:metrics:]();
        }

        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1BA9A0B00](exception, "esp error");
        __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      if (v206->_mindNetDetector)
      {
        double v20 = Current;
        double v21 = AXMediaLogDiagnostics();
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B57D5000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-MindNet", (const char *)&unk_1B58C0396, buf, 2u);
        }

        double v22 = [(AXMindNetDetector *)v206->_mindNetDetector detect:v191];
        double v23 = AXMediaLogDiagnostics();
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B57D5000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AXMLElementDetectorNode-MindNet", (const char *)&unk_1B58C0396, buf, 2u);
        }

        double v24 = AXMediaLogMLElement();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          CFAbsoluteTime v171 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v171 - v20;
          _os_log_debug_impl(&dword_1B57D5000, v24, OS_LOG_TYPE_DEBUG, "Time to mindnet: %f", buf, 0xCu);
        }

        double v25 = [v22 objectForKeyedSubscript:@"boxes"];
        *(float *)&double v26 = v180;
        *(float *)&double v27 = v181;
        v177 = [(AXMindNetDetector *)v206->_mindNetDetector processBoxes:v25 withHeight:v26 andWidth:v27];
      }
      else
      {
        v177 = [(AXMAXElementDetectorNode *)v206 _performCrossClassNMSForDetections:0 iouThreshold:0.2];
      }
      v178 = [v203 visionImageRequestHandler];
      double v28 = [v203 analysisOptions];
      v183 = [v28 textDetectionOptions];

      v182 = +[AXMTextDetectorNode effectiveLanguagesFromOptions:v183];
      id v29 = AXMediaLogElementVision();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.8();
      }

      double v30 = (void *)[v182 count];
      if (v30)
      {
        *(void *)v242 = 0;
        v243 = v242;
        uint64_t v244 = 0x2050000000;
        uint64_t v31 = (void *)getVNRecognizeTextRequestClass(void)::softClass;
        uint64_t v245 = getVNRecognizeTextRequestClass(void)::softClass;
        if (!getVNRecognizeTextRequestClass(void)::softClass)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = ___ZL30getVNRecognizeTextRequestClassv_block_invoke;
          v235 = &unk_1E6117478;
          v236[0] = v242;
          ___ZL30getVNRecognizeTextRequestClassv_block_invoke((uint64_t)buf);
          uint64_t v31 = (void *)*((void *)v243 + 3);
        }
        id v32 = v31;
        _Block_object_dispose(v242, 8);
        id v33 = objc_alloc_init(v32);
        objc_msgSend(v33, "setRecognitionLevel:", +[AXMTextDetectorNode recognitionLevelFromOptions:](AXMTextDetectorNode, "recognitionLevelFromOptions:", v183));
        [v33 setRecognitionLanguages:v182];
        objc_msgSend(v33, "setUsesLanguageCorrection:", objc_msgSend(v183, "usesLanguageCorrection"));
        [v183 normalizedMinimumTextHeightRatio];
        *(float *)&double v34 = v34;
        [v33 setMinimumTextHeight:v34];
        long long v35 = v33;
        long long v36 = AXMediaLogElementVision();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.7([v35 recognitionLevel], (uint64_t)v182, v242, v36);
        }

        double v37 = CFAbsoluteTimeGetCurrent();
        v241 = v35;
        long long v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v241 count:1];
        id v231 = 0;
        [v178 performRequests:v38 error:&v231];
        id v39 = v231;

        long long v40 = AXMediaLogMLElement();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          CFAbsoluteTime v172 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          *(double *)&buf[4] = v172 - v37;
          _os_log_debug_impl(&dword_1B57D5000, v40, OS_LOG_TYPE_DEBUG, "Time to OCR: %f", buf, 0xCu);
        }

        if (v39)
        {
          id v41 = AXMediaLogMLElement();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v39;
            _os_log_impl(&dword_1B57D5000, v41, OS_LOG_TYPE_DEFAULT, "OCR error: %@", buf, 0xCu);
          }
        }
        double v30 = v35;
      }
      v202 = v30;
      v42 = [v30 results];
      v179 = [v42 indexesOfObjectsPassingTest:&__block_literal_global_154_0];

      uint64_t v43 = [v202 results];
      long long v44 = [v43 objectsAtIndexes:v179];
      v189 = (void *)[v44 mutableCopy];

      long long v45 = AXMediaLogElementVision();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.6();
      }

      v175 = [(AXMindNetDetector *)v206->_clickabilityDetector detect:v191];
      v176 = [v175 objectForKeyedSubscript:@"boxes"];
      *(float *)&double v46 = v180;
      *(float *)&double v47 = v181;
      v192 = -[AXMindNetDetector processBoxes:withHeight:andWidth:](v206->_clickabilityDetector, "processBoxes:withHeight:andWidth:", v46, v47);
      long long v48 = AXMediaLogElementVision();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG)) {
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.5();
      }

      long long v229 = 0u;
      long long v230 = 0u;
      long long v227 = 0u;
      long long v228 = 0u;
      id obj = v177;
      uint64_t v197 = [obj countByEnumeratingWithState:&v227 objects:v240 count:16];
      if (v197)
      {
        uint64_t v196 = *(void *)v228;
        double v195 = v181;
        double v198 = v180;
        do
        {
          for (uint64_t i = 0; i != v197; ++i)
          {
            if (*(void *)v228 != v196) {
              objc_enumerationMutation(obj);
            }
            long long v49 = *(void **)(*((void *)&v227 + 1) + 8 * i);
            [v49 box];
            double v204 = v51 * v195;
            double v53 = v52 * v198;
            double v199 = v54 * v195;
            double v200 = (1.0 - v50 - v52) * v198;
            if ([v49 label] == 11)
            {
              v207 = [MEMORY[0x1E4F1CA48] array];
              long long v225 = 0u;
              long long v226 = 0u;
              long long v223 = 0u;
              long long v224 = 0u;
              id v55 = v189;
              uint64_t v56 = [v55 countByEnumeratingWithState:&v223 objects:v239 count:16];
              if (v56)
              {
                uint64_t v57 = *(void *)v224;
                v210 = &stru_1F0E72D10;
                do
                {
                  for (uint64_t j = 0; j != v56; ++j)
                  {
                    if (*(void *)v224 != v57) {
                      objc_enumerationMutation(v55);
                    }
                    id v59 = *(void **)(*((void *)&v223 + 1) + 8 * j);
                    uint64_t v60 = [v59 topCandidates:1];
                    v61 = [v60 firstObject];

                    [v59 boundingBox];
                    CGFloat v63 = v62;
                    CGFloat v65 = v64;
                    CGFloat v67 = v66;
                    CGFloat v69 = v68;
                    [v49 box];
                    v262.origin.CGFloat x = v70;
                    v262.origin.CGFloat y = v71;
                    v262.size.double width = v72;
                    v262.size.double height = v73;
                    v248.origin.CGFloat x = v63;
                    v248.origin.CGFloat y = v65;
                    v248.size.double width = v67;
                    v248.size.double height = v69;
                    CGRect v249 = CGRectIntersection(v248, v262);
                    double width = v249.size.width;
                    double height = v249.size.height;
                    objc_msgSend(v59, "boundingBox", v249.origin.x, v249.origin.y);
                    double v77 = v76;
                    [v59 boundingBox];
                    if (width * height / (v77 * v78) > 0.7225)
                    {
                      v79 = [v61 string];
                      BOOL v80 = [v79 length] == 0;

                      if (!v80)
                      {
                        v81 = [(__CFString *)v210 stringByAppendingString:@" "];
                        v82 = [v61 string];
                        uint64_t v83 = [v81 stringByAppendingString:v82];

                        v210 = (__CFString *)v83;
                        [(__CFString *)v207 addObject:v59];
                      }
                    }
                  }
                  uint64_t v56 = [v55 countByEnumeratingWithState:&v223 objects:v239 count:16];
                }
                while (v56);
              }
              else
              {
                v210 = &stru_1F0E72D10;
              }

              [v55 removeObjectsInArray:v207];
              if ([(__CFString *)v210 length])
              {
                [v49 confidence];
                float v93 = v92;
                int v94 = [v49 label];
                [v203 size];
                v97 = +[AXMVisionFeature featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:", 0, v94, v210, v199, v200, v204, v53, v93, v95, v96);
              }
              else
              {
                v97 = 0;
              }
            }
            else
            {
              int v84 = [v49 label];
              v207 = &stru_1F0E72D10;
              if (v84 == 5)
              {
                v250.origin.CGFloat x = v199;
                v250.origin.CGFloat y = v200;
                v250.size.double width = v204;
                v250.size.double height = v53;
                double MinX = CGRectGetMinX(v250);
                v251.origin.CGFloat x = v199;
                v251.origin.CGFloat y = v200;
                v251.size.double width = v204;
                v251.size.double height = v53;
                double v208 = CGRectGetWidth(v251);
                v252.origin.CGFloat x = v199;
                v252.origin.CGFloat y = v200;
                v252.size.double width = v204;
                v252.size.double height = v53;
                double MinY = CGRectGetMinY(v252);
                v253.origin.CGFloat x = v199;
                v253.origin.CGFloat y = v200;
                v253.size.double width = v204;
                v253.size.double height = v53;
                double v187 = CGRectGetHeight(v253);
                v254.origin.CGFloat x = v199;
                v254.origin.CGFloat y = v200;
                v254.size.double width = v204;
                v254.size.double height = v53;
                double v186 = CGRectGetWidth(v254);
                v255.origin.CGFloat x = v199;
                v255.origin.CGFloat y = v200;
                v255.size.double width = v204;
                v255.size.double height = v53;
                double v85 = CGRectGetWidth(v255);
                v256.origin.CGFloat x = v199;
                v256.origin.CGFloat y = v200;
                v256.size.double width = v204;
                v256.size.double height = v53;
                double v86 = CGRectGetHeight(v256);
                v257.origin.CGFloat x = v199;
                v257.origin.CGFloat y = v200;
                v257.size.double width = v204;
                v257.size.double height = v53;
                CGFloat v87 = CGRectGetHeight(v257);
                double v88 = MinX + v208 * -0.1;
                double v89 = MinY + v187 * -0.1;
                double v90 = v186 + (v85 + v85) * 0.1;
                double v91 = v86 + (v87 + v87) * 0.1;
                if (v90 <= v91)
                {
                  double v88 = v88 + (v91 - v90) * -0.5;
                  double v90 = v91;
                }
                else
                {
                  double v89 = v89 + (v90 - v91) * -0.5;
                }
                double v98 = v198 - (v90 + v89);
                v99 = -[NSObject imageByCroppingToRect:](v191, "imageByCroppingToRect:", v88, v98, v90, v90);
                v100 = [MEMORY[0x1E4F1E040] filterWithName:@"CIAffineTransform"];
                v101 = [MEMORY[0x1E4F28AF0] transform];
                [v101 translateXBy:-v88 yBy:-v98];
                [v100 setValue:v101 forKey:@"inputTransform"];
                [v100 setValue:v99 forKey:@"inputImage"];
                v194 = [v100 valueForKey:@"outputImage"];

                uint64_t v102 = +[AXMPipelineContextInput inputWithCIImage:v194];
                v237[0] = @"input";
                v237[1] = @"diagnosticsEnabled";
                v188 = (void *)v102;
                v238[0] = v102;
                v238[1] = MEMORY[0x1E4F1CC28];
                v103 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v238 forKeys:v237 count:2];
                v104 = +[AXMVisionAnalysisOptions defaultOptions];
                v212 = +[AXMVisionPipelineContext contextWithSourceParameters:v103 options:v104];

                v221[0] = MEMORY[0x1E4F143A8];
                v221[1] = 3221225472;
                v221[2] = __50__AXMAXElementDetectorNode__evaluateANOD_metrics___block_invoke_171;
                v221[3] = &unk_1E6117D10;
                id v105 = v188;
                id v222 = v105;
                [v212 produceImage:v221];
                v106 = NSString;
                v107 = [NSNumber numberWithDouble:v98];
                v108 = [v106 stringWithFormat:@"%@-image.png", v107];
                [(AXMIconClassDetectorNode *)v206->_iconDetector setLoggingName:v108];

                [(AXMIconClassDetectorNode *)v206->_iconDetector evaluate:v212 metrics:v185];
                v109 = [v212 result];
                v110 = [v109 features];
                v111 = [v110 firstObject];

                v207 = [v111 value];
                v112 = AXMediaLogMLElement();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
                {
                  v258.origin.CGFloat x = v88;
                  v258.origin.CGFloat y = v89;
                  v258.size.double width = v90;
                  v258.size.double height = v90;
                  NSStringFromRect(v258);
                  id v113 = (id)objc_claimAutoreleasedReturnValue();
                  [v194 extent];
                  v247.double width = v114;
                  v247.double height = v115;
                  NSStringFromSize(v247);
                  id v116 = (id)objc_claimAutoreleasedReturnValue();
                  [v49 box];
                  v117 = NSStringFromRect(v259);
                  *(_DWORD *)buf = 138413058;
                  *(void *)&buf[4] = v207;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v113;
                  *(_WORD *)&buf[22] = 2112;
                  v235 = v116;
                  LOWORD(v236[0]) = 2112;
                  *(void *)((char *)v236 + 2) = v117;
                  _os_log_impl(&dword_1B57D5000, v112, OS_LOG_TYPE_INFO, "Icon detected: %@ for bounds %@ in image: %@ -> %@", buf, 0x2Au);
                }
              }
              [v49 confidence];
              float v119 = v118;
              [v203 size];
              v97 = +[AXMVisionFeature featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:", 0, v84, v207, v199, v200, v204, v53, v119, v120, v121);
              v210 = &stru_1F0E72D10;
            }

            if (v97)
            {
              long long v219 = 0u;
              long long v220 = 0u;
              long long v217 = 0u;
              long long v218 = 0u;
              id v209 = v192;
              uint64_t v122 = [v209 countByEnumeratingWithState:&v217 objects:v233 count:16];
              if (v122)
              {
                uint64_t v123 = *(void *)v218;
                do
                {
                  for (uint64_t k = 0; k != v122; ++k)
                  {
                    if (*(void *)v218 != v123) {
                      objc_enumerationMutation(v209);
                    }
                    v125 = *(void **)(*((void *)&v217 + 1) + 8 * k);
                    [v49 box];
                    CGFloat v127 = v126;
                    CGFloat v129 = v128;
                    CGFloat v131 = v130;
                    CGFloat v133 = v132;
                    [v125 box];
                    v263.origin.CGFloat x = v134;
                    v263.origin.CGFloat y = v135;
                    v263.size.double width = v136;
                    v263.size.double height = v137;
                    v260.origin.CGFloat x = v127;
                    v260.origin.CGFloat y = v129;
                    v260.size.double width = v131;
                    v260.size.double height = v133;
                    CGRect v261 = CGRectIntersection(v260, v263);
                    double v138 = v261.size.width;
                    double v139 = v261.size.height;
                    objc_msgSend(v125, "box", v261.origin.x, v261.origin.y);
                    double v141 = v140;
                    [v125 box];
                    if (v138 * v139 / (v141 * v142) > 0.5)
                    {
                      uint64_t v143 = -[AXMAXElementDetectorNode remapUIClassForClickability:andClass:](v206, "remapUIClassForClickability:andClass:", [v125 label], objc_msgSend(v97, "uiClass"));
                      v144 = AXMediaLogMLElement();
                      if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
                      {
                        v205 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v97, "uiClass"));
                        v145 = [NSNumber numberWithInteger:v143];
                        v146 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v125, "label"));
                        v147 = [v97 debugDescription];
                        *(_DWORD *)buf = 138413058;
                        *(void *)&buf[4] = v205;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v145;
                        *(_WORD *)&buf[22] = 2112;
                        v235 = v146;
                        LOWORD(v236[0]) = 2112;
                        *(void *)((char *)v236 + 2) = v147;
                        _os_log_debug_impl(&dword_1B57D5000, v144, OS_LOG_TYPE_DEBUG, "Remap class from %@ -> %@ for clickable (%@) %@", buf, 0x2Au);
                      }
                      [v97 setUiClass:v143];
                    }
                  }
                  uint64_t v122 = [v209 countByEnumeratingWithState:&v217 objects:v233 count:16];
                }
                while (v122);
              }

              [v203 appendFeature:v97];
            }
          }
          uint64_t v197 = [obj countByEnumeratingWithState:&v227 objects:v240 count:16];
        }
        while (v197);
      }

      long long v215 = 0u;
      long long v216 = 0u;
      long long v213 = 0u;
      long long v214 = 0u;
      id v148 = v189;
      uint64_t v149 = [v148 countByEnumeratingWithState:&v213 objects:v232 count:16];
      if (v149)
      {
        uint64_t v150 = *(void *)v214;
        do
        {
          for (uint64_t m = 0; m != v149; ++m)
          {
            if (*(void *)v214 != v150) {
              objc_enumerationMutation(v148);
            }
            v152 = *(void **)(*((void *)&v213 + 1) + 8 * m);
            [v152 boundingBox];
            double v154 = v153;
            double v156 = v155;
            double v158 = v157;
            double v160 = v159;
            v161 = [v152 topCandidates:1];
            v162 = [v161 firstObject];

            v163 = [v162 string];
            [v162 confidence];
            float v165 = v164;
            [v203 size];
            v168 = +[AXMVisionFeature featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:](AXMVisionFeature, "featureWithVisionRequest:axElementRect:confidence:uiClass:label:canvasSize:", v202, 11, v163, v154 * v181, (1.0 - v156 - v160) * v180, v158 * v181, v160 * v180, v165, v166, v167);
            [v203 appendFeature:v168];
          }
          uint64_t v149 = [v148 countByEnumeratingWithState:&v213 objects:v232 count:16];
        }
        while (v149);
      }

      v169 = AXMediaLogElementVision();
      if (os_log_type_enabled(v169, OS_LOG_TYPE_DEBUG))
      {
        v170 = [v203 result];
        -[AXMAXElementDetectorNode _evaluateANOD:metrics:].cold.4(v170, buf, v169);
      }
    }
    double v13 = v191;
  }
  else
  {
    double v13 = AXMediaLogMLElement();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AXMAXElementDetectorNode _evaluateANOD:metrics:]();
    }
  }
}

BOOL __50__AXMAXElementDetectorNode__evaluateANOD_metrics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 topCandidates:1];
  uint64_t v3 = [v2 firstObject];

  [v3 confidence];
  BOOL v5 = v4 >= 0.31;

  return v5;
}

id __50__AXMAXElementDetectorNode__evaluateANOD_metrics___block_invoke_171(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (int64_t)remapUIClassForClickability:(int)a3 andClass:(int64_t)a4
{
  int64_t v4 = 17;
  if (a4 != 11) {
    int64_t v4 = a4;
  }
  int64_t v5 = 15;
  if (a4 != 7) {
    int64_t v5 = a4;
  }
  int64_t v6 = 16;
  if (a4 != 5) {
    int64_t v6 = a4;
  }
  if (a3 != 6) {
    int64_t v6 = a4;
  }
  if (a3 != 9) {
    int64_t v5 = v6;
  }
  if (a3 == 14) {
    return v4;
  }
  else {
    return v5;
  }
}

- (AXMindNetDetector)mindNetDetector
{
  return self->_mindNetDetector;
}

- (AXMindNetDetector)clickabilityDetector
{
  return self->_clickabilityDetector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clickabilityDetector, 0);
  objc_storeStrong((id *)&self->_mindNetDetector, 0);

  objc_storeStrong((id *)&self->_iconDetector, 0);
}

- (void)_evaluateANOD:metrics:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "No mindnet detector", v2, v3, v4, v5, v6);
}

- (void)_evaluateANOD:metrics:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1B57D5000, v0, OS_LOG_TYPE_DEBUG, "Same equivalence token - no work to do", v1, 2u);
}

- (void)_evaluateANOD:metrics:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B57D5000, v0, v1, "ERROR: zero image dimension", v2, v3, v4, v5, v6);
}

- (void)_evaluateANOD:(os_log_t)log metrics:.cold.4(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "OCR: %@", buf, 0xCu);
}

- (void)_evaluateANOD:metrics:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "Clickable Results: %@", v2, v3, v4, v5, v6);
}

- (void)_evaluateANOD:metrics:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "OCR Results: %@", v2, v3, v4, v5, v6);
}

- (void)_evaluateANOD:(uint8_t *)buf metrics:(os_log_t)log .cold.7(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_debug_impl(&dword_1B57D5000, log, OS_LOG_TYPE_DEBUG, "Performing OCR: %d, %@", buf, 0x12u);
}

- (void)_evaluateANOD:metrics:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_1B57D5000, v0, v1, "Effective text detect languages: %@", v2, v3, v4, v5, v6);
}

@end