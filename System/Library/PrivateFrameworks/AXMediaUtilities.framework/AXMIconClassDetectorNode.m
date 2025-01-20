@interface AXMIconClassDetectorNode
+ (BOOL)isSupported;
+ (BOOL)supportsSecureCoding;
+ (id)title;
- (BOOL)writeDebugImage;
- (NSArray)iconClassLabels;
- (NSString)loggingName;
- (id)_localizedClassForClass:(id)a3;
- (id)classLabelForIdx:(unint64_t)a3;
- (id)mlModelClasses;
- (id)mobileAssetType;
- (id)modelResourceNames;
- (unint64_t)maxSupportedFormatVersion;
- (unint64_t)minSupportedFormatVersion;
- (void)_initializeClassLabels;
- (void)evaluate:(id)a3 metrics:(id)a4;
- (void)mlModelClasses;
- (void)setLoggingName:(id)a3;
- (void)setWriteDebugImage:(BOOL)a3;
@end

@implementation AXMIconClassDetectorNode

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
  return @"Icon Class Detector";
}

- (id)mlModelClasses
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(AXMMobileAssetEvaluationNode *)self formatVersion] == 2)
  {
    v14[0] = objc_opt_class();
    v3 = v14;
  }
  else
  {
    v4 = AXMediaLogMLElement();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(AXMIconClassDetectorNode *)(uint64_t)self mlModelClasses];
    }

    uint64_t v13 = objc_opt_class();
    v3 = &v13;
  }
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];

  return v11;
}

- (id)mobileAssetType
{
  v2 = [MEMORY[0x1E4F47E38] policy];
  v3 = [v2 assetType];

  return v3;
}

- (id)modelResourceNames
{
  return &unk_1F0E941D0;
}

- (unint64_t)minSupportedFormatVersion
{
  v2 = [MEMORY[0x1E4F47E38] policy];
  v3 = [v2 minSupportedFormatVersion];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (unint64_t)maxSupportedFormatVersion
{
  v2 = [MEMORY[0x1E4F47E38] policy];
  v3 = [v2 maxSupportedFormatVersion];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)classLabelForIdx:(unint64_t)a3
{
  iconClassLabels = self->_iconClassLabels;
  if (iconClassLabels) {
    uint64_t v5 = iconClassLabels;
  }
  else {
    uint64_t v5 = (NSArray *)&unk_1F0E941E8;
  }
  uint64_t v6 = (void *)-[AXMIconClassDetectorNode classLabelForIdx:]::classLabels;
  -[AXMIconClassDetectorNode classLabelForIdx:]::classLabels = (uint64_t)v5;

  if ([(id)-[AXMIconClassDetectorNode classLabelForIdx:]::classLabels count] <= a3)
  {
    uint64_t v7 = @"unknown";
  }
  else
  {
    uint64_t v7 = [(id)-[AXMIconClassDetectorNode classLabelForIdx:]::classLabels objectAtIndexedSubscript:a3];
  }

  return v7;
}

- (void)_initializeClassLabels
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "Icon Class detector had no base URL", v1, 2u);
}

- (void)evaluate:(id)a3 metrics:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v65.receiver = self;
  v65.super_class = (Class)AXMIconClassDetectorNode;
  [(AXMMobileAssetEvaluationNode *)&v65 evaluate:v6 metrics:v7];
  if (!self->_iconClassLabels) {
    [(AXMIconClassDetectorNode *)self _initializeClassLabels];
  }
  uint64_t v8 = [(AXMMobileAssetEvaluationNode *)self mlModels];
  unint64_t v9 = [v8 count];
  uint64_t v10 = [(AXMIconClassDetectorNode *)self mlModelClasses];
  LOBYTE(v9) = v9 < [v10 count];

  if ((v9 & 1) == 0)
  {
    v11 = [v6 generateImageRepresentation];
    [v11 extent];
    double v13 = v12;
    [v11 extent];
    double v15 = v14;
    [v11 extent];
    double v17 = v16;
    [v11 extent];
    if (v17 <= v18)
    {
      [v11 extent];
      double v20 = v21;
    }
    else
    {
      [v11 extent];
      double v20 = v19;
    }
    v22 = [MEMORY[0x1E4F1E040] filterWithName:@"CILanczosScaleTransform"];
    [v22 setValue:v11 forKey:@"inputImage"];
    v23 = [NSNumber numberWithDouble:256.0 / v20];
    [v22 setValue:v23 forKey:@"inputScale"];

    v24 = [NSNumber numberWithDouble:1.0 / (v13 / v15)];
    [v22 setValue:v24 forKey:@"inputAspectRatio"];

    uint64_t v25 = [v22 outputImage];

    v26 = (void *)v25;
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v27 = CVPixelBufferCreate(0, 0x100uLL, 0x100uLL, 0x42475241u, 0, &pixelBufferOut);
    if (v27 || !pixelBufferOut)
    {
      if (pixelBufferOut)
      {
        CFRelease(pixelBufferOut);
        CVPixelBufferRef pixelBufferOut = 0;
      }
      v48 = AXMediaLogMLElement();
      v62 = v48;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        -[AXMIconClassDetectorNode evaluate:metrics:](v27, v48, v49, v50, v51, v52, v53, v54);
      }
    }
    else
    {
      v62 = [MEMORY[0x1E4F1E018] contextWithOptions:0];
      [v62 render:v25 toCVPixelBuffer:pixelBufferOut];
      v28 = [iconclassificationInput alloc];
      v60 = [(iconclassificationInput *)v28 initWithImage_Placeholder:pixelBufferOut];
      v29 = [(AXMMobileAssetEvaluationNode *)self mlModels];
      v30 = [v29 firstObject];
      id v63 = 0;
      v31 = [v30 predictionFromFeatures:v60 error:&v63];
      id v61 = v63;

      if (v61)
      {
        v32 = AXMediaLogMLElement();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[AXMIconClassDetectorNode evaluate:metrics:]((uint64_t)v61, v32, v33, v34, v35, v36, v37, v38);
        }
      }
      unint64_t v39 = 0;
      unint64_t v40 = 0;
      double v41 = 0.0;
      while (1)
      {
        v42 = objc_msgSend(v31, "leaf_leaf_predictions_probabilities");
        BOOL v43 = v40 < [v42 count];

        if (!v43) {
          break;
        }
        v44 = objc_msgSend(v31, "leaf_leaf_predictions_probabilities");
        v45 = [v44 objectAtIndexedSubscript:v40];
        [v45 doubleValue];
        double v47 = v46;

        if (v47 > v41)
        {
          unint64_t v39 = v40;
          double v41 = v47;
        }
        ++v40;
      }
      v55 = [(AXMIconClassDetectorNode *)self classLabelForIdx:v39];
      v56 = AXMediaLogMLElement();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v57 = [NSNumber numberWithUnsignedInteger:v39];
        *(_DWORD *)buf = 138412546;
        v67 = v55;
        __int16 v68 = 2112;
        v69 = v57;
        _os_log_impl(&dword_1B57D5000, v56, OS_LOG_TYPE_INFO, "Determined label class for icon: %@ (%@)", buf, 0x16u);
      }
      if (v41 <= 0.9 || ([v55 isEqualToString:@"unknown"] & 1) != 0)
      {
        v58 = v55;
      }
      else
      {
        v58 = [(AXMIconClassDetectorNode *)self _localizedClassForClass:v55];

        v59 = +[AXMVisionFeature featureWithIconClass:v58 confidence:v41];
        [v6 appendFeature:v59];
      }
    }
  }
}

- (id)_localizedClassForClass:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.accessibility.AXMediaUtilities"];
  uint64_t v5 = [@"icon.type." stringByAppendingString:v3];
  id v6 = [v4 localizedStringForKey:v5 value:&stru_1F0E72D10 table:@"Accessibility"];

  return v6;
}

- (BOOL)writeDebugImage
{
  return self->_writeDebugImage;
}

- (void)setWriteDebugImage:(BOOL)a3
{
  self->_writeDebugImage = a3;
}

- (NSString)loggingName
{
  return self->_loggingName;
}

- (void)setLoggingName:(id)a3
{
}

- (NSArray)iconClassLabels
{
  return self->_iconClassLabels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconClassLabels, 0);

  objc_storeStrong((id *)&self->_loggingName, 0);
}

- (void)mlModelClasses
{
  OUTLINED_FUNCTION_0_2(&dword_1B57D5000, a2, a3, "Could not find ml model classes, returning default: %@", a5, a6, a7, a8, 2u);
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)evaluate:(uint64_t)a3 metrics:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end