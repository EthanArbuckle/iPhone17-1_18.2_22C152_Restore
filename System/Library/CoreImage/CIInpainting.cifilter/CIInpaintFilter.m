@interface CIInpaintFilter
+ (BOOL)dumpInpaintImages;
+ (NSNumber)defaultMaskDilateSize;
+ (NSNumber)defaultMaskToSurroundRatio;
+ (NSNumber)defaultRefinementMultipass;
+ (double)getMaskMarginFactor;
+ (double)getRefineQualityBar;
+ (double)smallBlurSize;
+ (id)customAttributes;
+ (id)defaultExcludeMaskSurroundMultiplier;
+ (id)defaultFeatherAmount;
+ (id)defaultRefinementModel;
+ (id)loadModel:(id)a3;
+ (id)loadModelConfig;
+ (id)loadRefinementModel:(id)a3;
+ (id)refine:(id)a3 hires:(id)a4 mask:(id)a5 colorSpace:(CGColorSpace *)a6 orientation:(int)a7 hint:(id)a8 scale:(float)a9 dumpImageIndex:(int)a10;
+ (id)repairTile:(id)a3 mask:(id)a4 colorSpace:(CGColorSpace *)a5 orientation:(int)a6 hint:(id)a7 version:(int)a8 scale:(float)a9 dumpImageIndex:(int)a10 dumpTileIndex:(int)a11;
+ (id)userDefaults;
+ (int)modelDimensionForVersion:(int)a3 hint:(id)a4;
- (CGRect)outputMaskSurroundExtent;
- (CIImage)inputExcludeMask;
- (CIImage)inputImage;
- (CIImage)inputMaskImage;
- (NSNumber)inputExcludeMaskSurroundMultiplier;
- (NSNumber)inputFeatherAmount;
- (NSNumber)inputMaskCoverage;
- (NSNumber)inputMaskDilateSize;
- (NSNumber)inputMaskToSurroundRatio;
- (NSNumber)inputMultipass;
- (NSNumber)inputRefinementMultipass;
- (NSNumber)inputShowSurround;
- (NSNumber)inputTileProgressive;
- (NSNumber)inputVersion;
- (NSObject)inputModel;
- (NSObject)inputRefinementModel;
- (double)maskCoverage;
- (double)maskToSurroundRatio;
- (float)dilateSize;
- (float)estimateFinalQuality;
- (float)featherAmount;
- (id)blendBack:(id)a3 mask:(id)a4;
- (id)inputColorSpace;
- (id)outputImage;
- (id)outputImageAndRect:(CGRect *)a3 strategy:(id *)a4 allowDump:(BOOL)a5;
- (id)outputStrategy;
- (void)setInputColorSpace:(id)a3;
- (void)setInputExcludeMask:(id)a3;
- (void)setInputExcludeMaskSurroundMultiplier:(id)a3;
- (void)setInputFeatherAmount:(id)a3;
- (void)setInputImage:(id)a3;
- (void)setInputMaskCoverage:(id)a3;
- (void)setInputMaskDilateSize:(id)a3;
- (void)setInputMaskImage:(id)a3;
- (void)setInputMaskToSurroundRatio:(id)a3;
- (void)setInputModel:(id)a3;
- (void)setInputMultipass:(id)a3;
- (void)setInputRefinementModel:(id)a3;
- (void)setInputRefinementMultipass:(id)a3;
- (void)setInputShowSurround:(id)a3;
- (void)setInputTileProgressive:(id)a3;
- (void)setInputVersion:(id)a3;
@end

@implementation CIInpaintFilter

+ (id)userDefaults
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_18D50, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_18D50))
  {
    qword_18D48 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.coreimage"];
    __cxa_guard_release(&qword_18D50);
  }
  v2 = (void *)qword_18D48;
  return v2;
}

+ (double)smallBlurSize
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_18D60, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_18D60))
  {
    qword_18D58 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.coreimage"];
    __cxa_guard_release(&qword_18D60);
  }
  v2 = [(id)qword_18D58 dictionaryRepresentation];
  v3 = [v2 objectForKeyedSubscript:@"CIInpaintFilter.smallBlurSize"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), double v4 = 2.0, (objc_opt_isKindOfClass()))
  {
    [v3 doubleValue];
    double v6 = v5;
    v7 = sub_AB60();
    double v4 = fmin(fmax(v6, 0.0), 10.0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(id)objc_opt_class() description];
      int v10 = 138543618;
      v11 = v8;
      __int16 v12 = 2048;
      double v13 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.smallBlurSize default set to %g.", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4;
}

+ (NSNumber)defaultRefinementMultipass
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"CIInpaintFilter.inputRefinementMultipass"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    double v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 BOOLValue]);

    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() description];
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 1024;
      unsigned int v13 = [v5 BOOLValue];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.inputRefinementMultipass default set to %d.", (uint8_t *)&v10, 0x12u);
    }
    id v4 = v5;
    v8 = v4;
  }
  else
  {
    v8 = 0;
  }

  return (NSNumber *)v8;
}

+ (NSNumber)defaultMaskDilateSize
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"CIInpaintFilter.inputMaskDilateSize"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    double v5 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v4 intValue]);

    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() description];
      int v10 = 138543618;
      v11 = v7;
      __int16 v12 = 1024;
      unsigned int v13 = [v5 intValue];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.inputMaskDilateSize default set to %d.", (uint8_t *)&v10, 0x12u);
    }
    id v4 = v5;
    v8 = v4;
  }
  else
  {
    v8 = 0;
  }

  return (NSNumber *)v8;
}

+ (id)defaultFeatherAmount
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"CIInpaintFilter.inputFeatherAmount"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [v4 floatValue];
    double v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() description];
      [v5 floatValue];
      int v11 = 138543618;
      __int16 v12 = v7;
      __int16 v13 = 2048;
      double v14 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.inputFeatherAmount default set to %f.", (uint8_t *)&v11, 0x16u);
    }
    id v4 = v5;
    v9 = v4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (NSNumber)defaultMaskToSurroundRatio
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"CIInpaintFilter.inputMaskToSurroundRatio"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [v4 floatValue];
    double v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() description];
      [v5 floatValue];
      int v11 = 138543618;
      __int16 v12 = v7;
      __int16 v13 = 2048;
      double v14 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.inputMaskToSurroundRatio default set to %f.", (uint8_t *)&v11, 0x16u);
    }
    id v4 = v5;
    v9 = v4;
  }
  else
  {
    v9 = 0;
  }

  return (NSNumber *)v9;
}

+ (id)defaultExcludeMaskSurroundMultiplier
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"CIInpaintFilter.inputExcludeMaskSurroundMultiplier"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    [v4 floatValue];
    double v5 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() description];
      [v5 floatValue];
      int v11 = 138543618;
      __int16 v12 = v7;
      __int16 v13 = 2048;
      double v14 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.inputExcludeMaskSurroundMultiplier default set to %f.", (uint8_t *)&v11, 0x16u);
    }
    id v4 = v5;
    v9 = v4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)defaultRefinementModel
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"CIInpaintFilter.inputRefinementModel"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    double v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 BOOLValue]);

    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(id)objc_opt_class() description];
      int v10 = 138543618;
      int v11 = v7;
      __int16 v12 = 1024;
      unsigned int v13 = [v5 BOOLValue];
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.inputRefinementModel default set to %d.", (uint8_t *)&v10, 0x12u);
    }
    id v4 = v5;
    float v8 = v4;
  }
  else
  {
    float v8 = 0;
  }

  return v8;
}

+ (BOOL)dumpInpaintImages
{
  v2 = [a1 userDefaults];
  v3 = [v2 dictionaryRepresentation];

  id v4 = [v3 objectForKeyedSubscript:@"dumpInpaintImages"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v4 hasPrefix:@"/"] & 1) != 0
    || ([v4 isEqual:&__kCFBooleanTrue] & 1) != 0
    || ([v4 isEqual:&off_15338] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqual:@"1"];
  }

  return v5;
}

+ (double)getRefineQualityBar
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_18D70, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_18D70))
  {
    qword_18D68 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.coreimage"];
    __cxa_guard_release(&qword_18D70);
  }
  v2 = [(id)qword_18D68 dictionaryRepresentation];
  v3 = [v2 objectForKeyedSubscript:@"refineQualityBar"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), double v4 = 0.75, (objc_opt_isKindOfClass()))
  {
    [v3 doubleValue];
    double v6 = v5;
    v7 = sub_AB60();
    double v4 = fmin(fmax(v6, 0.5), 1.0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      float v8 = [(id)objc_opt_class() description];
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2048;
      double v13 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.refineQualityBar default set to %g.", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4;
}

+ (double)getMaskMarginFactor
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_18D80, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_18D80))
  {
    qword_18D78 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.coreimage"];
    __cxa_guard_release(&qword_18D80);
  }
  v2 = [(id)qword_18D78 dictionaryRepresentation];
  v3 = [v2 objectForKeyedSubscript:@"maskMarginFactor"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v3 doubleValue];
    double v5 = v4;
    double v6 = sub_AB60();
    double v7 = fmin(fmax(v5, 1.0), 1.5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      float v8 = [(id)objc_opt_class() description];
      int v10 = 138543618;
      int v11 = v8;
      __int16 v12 = 2048;
      double v13 = v7;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintModel.maskMarginFactor default set to %g.", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    double v7 = 1.05;
  }

  return v7;
}

+ (id)customAttributes
{
  v53[0] = @"inputVersion";
  v51[0] = kCIAttributeType;
  v51[1] = kCIAttributeMin;
  v52[0] = kCIAttributeTypeInteger;
  v52[1] = &off_15350;
  v51[2] = kCIAttributeMax;
  v51[3] = kCIAttributeDefault;
  v52[2] = &off_15338;
  v52[3] = &off_15338;
  v32 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
  v54[0] = v32;
  v53[1] = @"inputMaskToSurroundRatio";
  v49[0] = kCIAttributeType;
  v49[1] = kCIAttributeMin;
  v50[0] = kCIAttributeTypeScalar;
  v50[1] = &off_153E0;
  v50[2] = &off_153F0;
  v49[2] = kCIAttributeMax;
  v49[3] = kCIAttributeDefault;
  uint64_t v3 = [a1 defaultMaskToSurroundRatio];
  double v4 = &off_15400;
  v31 = (void *)v3;
  if (v3) {
    double v4 = (_UNKNOWN **)v3;
  }
  v50[3] = v4;
  v30 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
  v54[1] = v30;
  v53[2] = @"inputMaskCoverage";
  v47[0] = kCIAttributeType;
  v47[1] = kCIAttributeMin;
  v48[0] = kCIAttributeTypeScalar;
  v48[1] = &off_15410;
  v47[2] = kCIAttributeMax;
  v47[3] = kCIAttributeDefault;
  v48[2] = &off_153F0;
  v48[3] = &off_153F0;
  v29 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
  v54[2] = v29;
  v53[3] = @"inputExcludeMaskSurroundMultiplier";
  v45[0] = kCIAttributeType;
  v45[1] = kCIAttributeMin;
  v46[0] = kCIAttributeTypeScalar;
  v46[1] = &off_153F0;
  v46[2] = &off_15420;
  v45[2] = kCIAttributeMax;
  v45[3] = kCIAttributeDefault;
  uint64_t v5 = [a1 defaultExcludeMaskSurroundMultiplier];
  double v6 = &off_15430;
  v28 = (void *)v5;
  if (v5) {
    double v6 = (_UNKNOWN **)v5;
  }
  v46[3] = v6;
  v27 = +[NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:4];
  v54[3] = v27;
  v53[4] = @"inputMultipass";
  v43[0] = kCIAttributeType;
  v43[1] = kCIAttributeMin;
  v44[0] = kCIAttributeTypeInteger;
  v44[1] = &off_15350;
  v43[2] = kCIAttributeMax;
  v43[3] = kCIAttributeDefault;
  v44[2] = &off_15368;
  v44[3] = &off_15350;
  v26 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:4];
  v54[4] = v26;
  v53[5] = @"inputMaskDilateSize";
  v41[0] = kCIAttributeType;
  v41[1] = kCIAttributeMin;
  v42[0] = kCIAttributeTypeInteger;
  v42[1] = &off_15350;
  v42[2] = &off_15380;
  v41[2] = kCIAttributeMax;
  v41[3] = kCIAttributeDefault;
  uint64_t v7 = +[CIInpaintFilter defaultMaskDilateSize];
  v25 = (void *)v7;
  if (v7) {
    float v8 = (_UNKNOWN **)v7;
  }
  else {
    float v8 = &off_15350;
  }
  v42[3] = v8;
  v24 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:4];
  v54[5] = v24;
  v53[6] = @"inputTileProgressive";
  v39[0] = kCIAttributeType;
  v39[1] = kCIAttributeMin;
  v40[0] = kCIAttributeTypeBoolean;
  v40[1] = &__kCFBooleanFalse;
  v39[2] = kCIAttributeMax;
  v39[3] = kCIAttributeDefault;
  v40[2] = &__kCFBooleanTrue;
  v40[3] = &__kCFBooleanFalse;
  v23 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:4];
  v54[6] = v23;
  v53[7] = @"inputRefinementModel";
  v37 = kCIAttributeDefault;
  uint64_t v9 = [a1 defaultRefinementModel];
  v22 = (void *)v9;
  if (v9) {
    int v10 = (void *)v9;
  }
  else {
    int v10 = &__kCFBooleanTrue;
  }
  v38 = v10;
  v21 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  v54[7] = v21;
  v53[8] = @"inputRefinementMultipass";
  v35[0] = kCIAttributeType;
  v35[1] = kCIAttributeMin;
  v36[0] = kCIAttributeTypeBoolean;
  v36[1] = &__kCFBooleanFalse;
  v36[2] = &__kCFBooleanTrue;
  v35[2] = kCIAttributeMax;
  v35[3] = kCIAttributeDefault;
  uint64_t v11 = [a1 defaultRefinementMultipass];
  __int16 v12 = (void *)v11;
  if (v11) {
    double v13 = (void *)v11;
  }
  else {
    double v13 = &__kCFBooleanTrue;
  }
  v36[3] = v13;
  double v14 = +[NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:4];
  v54[8] = v14;
  v53[9] = @"inputFeatherAmount";
  v33[0] = kCIAttributeType;
  v33[1] = kCIAttributeMin;
  v34[0] = kCIAttributeTypeScalar;
  v34[1] = &off_15410;
  v34[2] = &off_15440;
  v33[2] = kCIAttributeMax;
  v33[3] = kCIAttributeDefault;
  uint64_t v15 = [a1 defaultFeatherAmount];
  v16 = (void *)v15;
  v17 = &off_15398;
  if (v15) {
    v17 = (_UNKNOWN **)v15;
  }
  v34[3] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
  v54[9] = v18;
  v19 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:10];

  return v19;
}

+ (id)loadModelConfig
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_46E4;
  block[3] = &unk_144E0;
  block[4] = a1;
  if (qword_18D88 != -1) {
    dispatch_once(&qword_18D88, block);
  }
  v2 = (void *)qword_18D90;
  return v2;
}

+ (id)loadModel:(id)a3
{
  id v4 = a3;
  sub_4C48();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_14:
    int v10 = v5;
    goto LABEL_18;
  }
  if (v4)
  {
    double v6 = sub_AB60();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      sub_C3BC();
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_4D2C;
    v19[3] = &unk_144E0;
    v19[4] = a1;
    if (qword_18DA0 != -1) {
      dispatch_once(&qword_18DA0, v19);
    }
    id v5 = (id)qword_18D98;
    goto LABEL_14;
  }
  id v7 = v4;
  id v8 = sub_4C48();
  uint64_t v9 = [a1 loadModelConfig];
  id v20 = 0;
  int v10 = [v8 modelWithContentsOfURL:v7 configuration:v9 error:&v20];
  id v11 = v20;

  __int16 v12 = [v10 valueForKeyPath:@"modelDescription.metadata.MLModelDescriptionKey"];
  if (v10)
  {
    double v13 = sub_AB60();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = [(id)objc_opt_class() description];
      uint64_t v15 = [v7 path];
      *(_DWORD *)buf = 138543874;
      v22 = v14;
      __int16 v23 = 2114;
      v24 = v12;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: CIInpaintFilter using inpaint model \"%{public}@\" at path: %{public}@.", buf, 0x20u);
    }
  }
  else
  {
    double v13 = sub_AB60();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = [(id)objc_opt_class() description];
      v17 = [v7 path];
      sub_C34C(v16, v17, buf, v13);
    }
  }

LABEL_18:
  return v10;
}

+ (id)loadRefinementModel:(id)a3
{
  id v4 = (_UNKNOWN **)a3;
  sub_4C48();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v6 = v4;
  if (isKindOfClass)
  {
LABEL_7:
    id v7 = v6;
    goto LABEL_8;
  }
  id v7 = 0;
  if (v4 != (_UNKNOWN **)&__kCFBooleanFalse && v4 != &off_15350)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_51E4;
    block[3] = &unk_144E0;
    block[4] = a1;
    if (qword_18DB0 != -1) {
      dispatch_once(&qword_18DB0, block);
    }
    double v6 = (void *)qword_18DA8;
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (double)maskToSurroundRatio
{
  inputMaskToSurroundRatio = self->inputMaskToSurroundRatio;
  if (inputMaskToSurroundRatio) {
    [(NSNumber *)inputMaskToSurroundRatio doubleValue];
  }
  else {
    double v3 = 0.25;
  }
  return fmin(fmax(v3, 0.1), 1.0);
}

- (double)maskCoverage
{
  inputMaskCoverage = self->inputMaskCoverage;
  double v3 = 1.0;
  if (inputMaskCoverage) {
    [(NSNumber *)inputMaskCoverage doubleValue];
  }
  return fmin(fmax(v3, 0.0), 1.0);
}

- (float)featherAmount
{
  inputFeatherAmount = self->inputFeatherAmount;
  if (inputFeatherAmount) {
    [(NSNumber *)inputFeatherAmount floatValue];
  }
  else {
    float v3 = 2.0;
  }
  return fminf(fmaxf(v3, 0.0), 10.0);
}

- (float)dilateSize
{
  inputMaskDilateSize = self->inputMaskDilateSize;
  float v3 = 0.0;
  if (inputMaskDilateSize) {
    [(NSNumber *)inputMaskDilateSize floatValue];
  }
  return fminf(fmaxf(v3, 0.0), 500.0);
}

+ (int)modelDimensionForVersion:(int)a3 hint:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    if (a3 == 1)
    {
      double v6 = +[CIInpaintFilter loadModel:v5];
      int v7 = sub_5720(v6);
    }
    else
    {
      int v7 = 0;
    }
  }
  else
  {
    int v7 = 512;
  }

  return v7;
}

+ (id)repairTile:(id)a3 mask:(id)a4 colorSpace:(CGColorSpace *)a5 orientation:(int)a6 hint:(id)a7 version:(int)a8 scale:(float)a9 dumpImageIndex:(int)a10 dumpTileIndex:(int)a11
{
  uint64_t v12 = *(void *)&a8;
  id v85 = a3;
  id v16 = a4;
  id v17 = a7;
  v82 = v17;
  CGColorSpaceRef v18 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
  space = v18;
  if (a5) {
    v19 = a5;
  }
  else {
    v19 = v18;
  }
  v84 = v19;
  uint64_t v20 = +[CIInpaintFilter modelDimensionForVersion:v12 hint:v17];
  v21 = [v16 imageByApplyingFilter:@"CIColorThreshold" withInputParameters:&off_15470];

  if (v12 != 1)
  {
    if (v12)
    {
      __int16 v25 = [v85 imageByInsertingIntermediate];
      if (!a10) {
        goto LABEL_15;
      }
    }
    else
    {
      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      __int16 v23 = [v22 pathForResource:@"inp_gen_eds2_00_q16.espresso" ofType:@"net"];
      v24 = +[CIIF_EspressoWrapper cachedEspressoWrapper:v23];
      __int16 v25 = +[ApplyOldInpaintModel apply:v85 mask:v21 tileSize:v20 model:v24];

      if (!a10) {
        goto LABEL_15;
      }
    }
LABEL_11:
    v50 = sub_6080(a10, a11, (uint64_t)"inpaint");
    LODWORD(v17) = llroundf(a9 * 100.0);
    v51 = +[NSString stringWithFormat:@"%@_inrgb_scale%d.png", v50, v17];
    v52 = sub_6180(v21);
    id v53 = v85;
    id v54 = v52;
    [v53 extent];
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    CGFloat v62 = v61;
    [v54 extent];
    v96.origin.double x = v63;
    v96.origin.double y = v64;
    v96.size.double width = v65;
    v96.size.double height = v66;
    v94.origin.double x = v56;
    v94.origin.double y = v58;
    v94.size.double width = v60;
    v94.size.double height = v62;
    CGRect v95 = CGRectIntersection(v94, v96);
    double x = v95.origin.x;
    double y = v95.origin.y;
    double width = v95.size.width;
    double height = v95.size.height;
    if (CGRectIsEmpty(v95))
    {
      v71 = +[CIImage emptyImage];
    }
    else
    {
      v72 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_timesMask (__sample a, __sample b) { return a * b.r; }"];
      v92[0] = v53;
      v92[1] = v54;
      v73 = +[NSArray arrayWithObjects:v92 count:2];
      v71 = objc_msgSend(v72, "applyWithExtent:arguments:", v73, x, y, width, height);
    }
    sub_62B0(v71, v84, v51, a6);
    v74 = +[NSString stringWithFormat:@"%@_inmask_scale%d.png", v50, v17];

    sub_650C(v21, v74, a6);
    v86[0] = kCIInputBackgroundImageKey;
    v86[1] = kCIInputMaskImageKey;
    v87[0] = v53;
    v87[1] = v21;
    v75 = +[NSDictionary dictionaryWithObjects:v87 forKeys:v86 count:2];
    v76 = [v25 imageByApplyingFilter:@"CIBlendWithRedMask" withInputParameters:v75];

    v77 = +[NSString stringWithFormat:@"%@_outblend_scale%d.png", v50, v17];

    sub_62B0(v76, v84, v77, a6);
    goto LABEL_15;
  }
  v79 = +[CIInpaintFilter loadModel:v17];
  v26 = [v85 imageByColorMatchingWorkingSpaceToColorSpace:v84];
  v80 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_pre (__sample s, __sample mask) { float m = (mask.r > 0.01) ? 1.0 : 0.0 return vec4(0.5 - m, (clamp(s.rgb, 0.0, 1.0)*2.0 - 1.0)*(1.0 - m)); }"];;
  [v26 extent];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v91[0] = v26;
  v91[1] = v21;
  v35 = +[NSArray arrayWithObjects:v91 count:2];
  v36 = objc_msgSend(v80, "applyWithExtent:arguments:", v35, v28, v30, v32, v34);

  v89[0] = @"inputModel";
  v89[1] = @"_logName";
  v90[0] = v79;
  v90[1] = @"CIInpaintRepair";
  v37 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
  v38 = [v36 imageByApplyingFilter:@"CICoreMLModelFilter" withInputParameters:v37];

  v39 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_post (__sample s) __attribute__(preserves_opacity) { return vec4((s.rgb+1.0)/2.0,s.a); }"];
  [v38 extent];
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  double v47 = v46;
  v88 = v38;
  v48 = +[NSArray arrayWithObjects:&v88 count:1];
  v49 = objc_msgSend(v39, "applyWithExtent:arguments:", v48, v41, v43, v45, v47);

  __int16 v25 = [v49 imageByColorMatchingColorSpaceToWorkingSpace:v84];

  if (a10) {
    goto LABEL_11;
  }
LABEL_15:
  CGColorSpaceRelease(space);

  return v25;
}

+ (id)refine:(id)a3 hires:(id)a4 mask:(id)a5 colorSpace:(CGColorSpace *)a6 orientation:(int)a7 hint:(id)a8 scale:(float)a9 dumpImageIndex:(int)a10
{
  id v14 = a3;
  id v15 = a4;
  id v174 = a5;
  id v170 = a8;
  CGColorSpaceRef v16 = CGColorSpaceCreateWithName(kCGColorSpaceDisplayP3);
  space = v16;
  if (a6) {
    id v17 = a6;
  }
  else {
    id v17 = v16;
  }
  uint64_t v18 = sub_78E8(v14, (uint64_t)v17);

  v177 = sub_78E8(v15, (uint64_t)v17);
  v176 = (void *)v18;

  v167 = +[CIInpaintFilter loadRefinementModel:v170];
  int v178 = sub_5720(v167);
  v183 = +[CIFilter filterWithName:@"CICoreMLModelFilter"];
  [v183 setValue:v167 forKey:@"inputModel"];
  [v183 setValue:@"CIInpaintRefine" forKey:@"_logName"];
  v19 = +[CIImage imageYCC444:v18 matrix:601 fullRange:1 precision:8 colorSpace:0];
  uint64_t v20 = +[CIImage imageYCC444:v177 matrix:601 fullRange:1 precision:8 colorSpace:0];
  v21 = sub_7954(v19);

  v172 = sub_7954(v20);
  v175 = v21;

  +[CIInpaintFilter smallBlurSize];
  double v23 = v22;
  sub_7A90(v21);
  id v168 = (id)objc_claimAutoreleasedReturnValue();
  [v168 extent];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v32 = [v168 imageByClampingToExtent];

  double v33 = +[CIVector vectorWithValues:&unk_E790 count:25];
  v195 = v17;
  *(void *)&v201.a = @"inputWeights";
  *(void *)&v202.a = v33;
  double v34 = +[NSDictionary dictionaryWithObjects:&v202 forKeys:&v201 count:1];
  v35 = [v32 imageByApplyingFilter:@"CIConvolution5X5" withInputParameters:v34];

  v173 = objc_msgSend(v35, "imageByCroppingToRect:", v25, v27, v29, v31);

  [v177 extent];
  double v36 = (double)v178;
  int v184 = llround(v37 / (double)v178);
  v38 = v17;
  uint64_t v39 = a10;
  double v40 = 0;
  if (v184 >= 1)
  {
    int v41 = 0;
    int v179 = 1;
    uint64_t v190 = llroundf(a9 * 100.0);
    do
    {
      int v42 = 0;
      int v194 = 0;
      int v171 = v41;
      double v43 = (double)(v41 * v178);
      do
      {
        int v181 = v42;
        double v44 = (double)v42;
        v186 = sub_7BCC(v176, (double)v42, v43, v36, v36);
        v185 = v40;
        v193 = sub_7BCC(v177, v44, v43, v36, v36);
        v192 = sub_7BCC(v174, v44, v43, v36, v36);
        double v45 = sub_7CB0(v192, 0.125);
        if (v39)
        {
          if (v184 == 1) {
            uint64_t v46 = 0;
          }
          else {
            uint64_t v46 = (v179 + v194);
          }
          double v47 = sub_6080(v39, v46, (uint64_t)"refine");
          v48 = +[NSString stringWithFormat:@"%@_inlr_scale%d.png", v47, v190, space, v167];
          v49 = sub_7D54(v186, (uint64_t)v38);
          sub_62B0(v49, v38, v48, a7);

          v50 = +[NSString stringWithFormat:@"%@_inhr_scale%d.png", v47, v190];

          v51 = sub_7D54(v193, (uint64_t)v195);
          sub_62B0(v51, v195, v50, a7);

          v52 = +[NSString stringWithFormat:@"%@_inmask_scale%d.png", v47, v190];

          sub_650C(v192, v52, a7);
        }
        v189 = sub_7BCC(v175, v44, v43, v36, v36);
        v182 = sub_7BCC(v173, v44, v43, v36, v36);
        v188 = sub_7BCC(v172, v44, v43, v36, v36);
        id v53 = v45;
        id v54 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_threshNegInf (__sample s) __attribute__((outputFormat(kCIFormatRh))) { float negInf = -1.0E20 float v = (s.r>0.01) ? negInf : 0.0; return vec4(v,0,0,1); }"];;
        [v53 extent];
        double v56 = v55;
        double v58 = v57;
        double v60 = v59;
        double v62 = v61;
        *(void *)&v202.a = v53;
        CGFloat v63 = +[NSArray arrayWithObjects:&v202 count:1];
        v187 = objc_msgSend(v54, "applyWithExtent:arguments:", v63, v56, v58, v60, v62);

        v199[0] = @"in_img_1";
        v199[1] = @"in_img_2";
        v200[0] = v189;
        v200[1] = v188;
        v199[2] = @"in_attn_mask";
        v200[2] = v187;
        CGFloat v64 = +[NSDictionary dictionaryWithObjects:v200 forKeys:v199 count:3];
        [v183 setValue:v64 forKey:@"inputImage"];

        CGFloat v65 = [v183 outputImage];
        CGFloat v66 = sub_7A90(v65);

        id v196 = v66;
        [v196 extent];
        double v68 = v67;
        double v70 = v69;
        double v72 = v71;
        double v74 = v73;
        v75 = [v196 imageByClampingToExtent];

        v76 = [v75 imageByApplyingGaussianBlurWithSigma:v23];

        v77 = objc_msgSend(v76, "imageByCroppingToRect:", v68, v70, v72, v74);

        id v78 = v196;
        id v79 = v77;
        v80 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_y_diff (__sample a, __sample b) __attribute__((outputFormat(kCIFormatRh))) { return vec4(a.r - b.r, 0.0, 0.0, 1.0); }"];
        [v78 extent];
        double v82 = v81;
        double v84 = v83;
        double v86 = v85;
        double v88 = v87;
        *(void *)&v202.a = v78;
        *(void *)&v202.b = v79;
        v89 = +[NSArray arrayWithObjects:&v202 count:2];
        v90 = objc_msgSend(v80, "applyWithExtent:arguments:", v89, v82, v84, v86, v88);
        v180 = v78;

        id v91 = v182;
        id v92 = v90;
        v93 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_y_plus_y (__sample a, __sample b) __attribute__((outputFormat(kCIFormatRh))) { return vec4(a.r + b.r, 0.0, 0.0, 1.0); }"];
        [v91 extent];
        CGFloat v95 = v94;
        CGFloat v97 = v96;
        CGFloat v99 = v98;
        CGFloat v101 = v100;
        [v92 extent];
        v206.origin.double x = v102;
        v206.origin.double y = v103;
        v206.size.double width = v104;
        v206.size.double height = v105;
        v204.origin.double x = v95;
        v204.origin.double y = v97;
        v204.size.double width = v99;
        v204.size.double height = v101;
        CGRect v205 = CGRectUnion(v204, v206);
        double x = v205.origin.x;
        double y = v205.origin.y;
        double width = v205.size.width;
        double height = v205.size.height;
        *(void *)&v202.a = v91;
        *(void *)&v202.b = v92;
        v110 = +[NSArray arrayWithObjects:&v202 count:2];
        v111 = objc_msgSend(v93, "applyWithExtent:arguments:", v110, x, y, width, height);

        id v112 = v111;
        v113 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_y_clamp_m1p1 (__sample a) __attribute__((outputFormat(kCIFormatRh))) { float Y = clamp(a.r, -1.0, 1.0) return vec4(Y, 0.0, 0.0, 1.0); }"];;
        [v112 extent];
        double v115 = v114;
        double v117 = v116;
        double v119 = v118;
        double v121 = v120;
        *(void *)&v202.a = v112;
        v122 = +[NSArray arrayWithObjects:&v202 count:1];
        v123 = objc_msgSend(v113, "applyWithExtent:arguments:", v122, v115, v117, v119, v121);

        id v124 = v189;
        id v125 = v123;
        v126 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_replace_y (__sample a, __sample b) __attribute__(preserves_opacity) { return vec4(b.r * a.a, a.gb, a.a); }"];
        [v124 extent];
        double v128 = v127;
        double v130 = v129;
        double v132 = v131;
        double v134 = v133;
        *(void *)&v202.a = v124;
        *(void *)&v202.b = v125;
        v135 = +[NSArray arrayWithObjects:&v202 count:2];
        v136 = objc_msgSend(v126, "applyWithExtent:arguments:", v135, v128, v130, v132, v134);

        id v137 = v136;
        v138 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_ycc_neg1pos1_to_01 (__sample s) __attribute__(preserves_opacity) { s.rgb = (s.rgb + 1.0) / 2.0 s.rgb = clamp(s.rgb, 0.0, s.a); return s; }"];;
        [v137 extent];
        double v140 = v139;
        double v142 = v141;
        double v144 = v143;
        double v146 = v145;
        *(void *)&v202.a = v137;
        v147 = +[NSArray arrayWithObjects:&v202 count:1];
        v148 = objc_msgSend(v138, "applyWithExtent:arguments:", v147, v140, v142, v144, v146);

        v149 = +[CIImage imageWithYCCImage:v148 matrix:601 fullRange:1 precision:8 colorSpace:0];

        if (a10)
        {
          if (v184 == 1) {
            uint64_t v150 = 0;
          }
          else {
            uint64_t v150 = (v179 + v194);
          }
          v151 = sub_6080(a10, v150, (uint64_t)"refine");
          v152 = +[NSString stringWithFormat:@"%@_out_scale%d.png", v151, v190];
          v153 = sub_7D54(v149, (uint64_t)v195);
          sub_62B0(v153, v195, v152, a7);

          v197[0] = kCIInputBackgroundImageKey;
          v197[1] = kCIInputMaskImageKey;
          v198[0] = v193;
          v198[1] = v192;
          v154 = +[NSDictionary dictionaryWithObjects:v198 forKeys:v197 count:2];
          v155 = [v149 imageByApplyingFilter:@"CIBlendWithRedMask" withInputParameters:v154];

          v156 = +[NSString stringWithFormat:@"%@_outblend_scale%d.png", v151, v190];

          v157 = sub_7D54(v155, (uint64_t)v195);
          sub_62B0(v157, v195, v156, a7);
        }
        id v158 = v149;
        memset(&v202, 0, sizeof(v202));
        CGAffineTransformMakeTranslation(&v202, v44, v43);
        CGAffineTransform v201 = v202;
        v159 = [v158 imageByApplyingTransform:&v201];

        if (v185)
        {
          objc_msgSend(v159, "imageByCompositingOverImage:");
          id v160 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v160 = v159;
        }

        int v42 = v181 + v178;
        ++v194;
        double v40 = v160;
        v38 = v195;
        uint64_t v39 = a10;
      }
      while (v184 != v194);
      int v41 = v171 + 1;
      v179 += 2;
    }
    while (v171 + 1 != v184);
  }
  if (v39)
  {
    v161 = sub_6080(v39, 0, (uint64_t)"refine");
    v162 = +[NSString stringWithFormat:@"%@_result_scale%d.png", v161, llroundf(a9 * 200.0)];
    v163 = sub_7D54(v40, (uint64_t)v38);
    sub_62B0(v163, v38, v162, a7);

    v38 = v195;
  }
  v164 = sub_7D54(v40, (uint64_t)v38);

  CGColorSpaceRelease(space);
  return v164;
}

- (id)blendBack:(id)a3 mask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CIImage *)self->inputImage extent];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGColorSpaceRef v16 = -[CIImage imageByCroppingToRect:](self->inputExcludeMask, "imageByCroppingToRect:");
  [v16 extent];
  if (CGRectIsEmpty(v48))
  {
    id v17 = v7;
  }
  else
  {
    uint64_t v18 = sub_6180(self->inputExcludeMask);
    id v19 = v7;
    id v20 = v18;
    [v19 extent];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    [v20 extent];
    v51.origin.double x = v29;
    v51.origin.double y = v30;
    v51.size.double width = v31;
    v51.size.double height = v32;
    v49.origin.double x = v22;
    v49.origin.double y = v24;
    v49.size.double width = v26;
    v49.size.double height = v28;
    CGRect v50 = CGRectIntersection(v49, v51);
    double x = v50.origin.x;
    double y = v50.origin.y;
    double width = v50.size.width;
    double height = v50.size.height;
    if (CGRectIsEmpty(v50))
    {
      id v17 = +[CIImage emptyImage];
    }
    else
    {
      double v37 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_andMasks (__sample a, __sample b) __attribute__((outputFormat(kCIFormatRh))) { return vec4(clamp(a.x,0.0,1.0) * clamp(b.x,0.0,1.0), 0.0, 0.0, 1.0); }"];
      v46[0] = v19;
      v46[1] = v20;
      v38 = +[NSArray arrayWithObjects:v46 count:2];
      id v17 = objc_msgSend(v37, "applyWithExtent:arguments:", v38, x, y, width, height);
    }
  }
  inputImage = self->inputImage;
  v44[0] = kCIInputBackgroundImageKey;
  v44[1] = kCIInputMaskImageKey;
  v45[0] = inputImage;
  v45[1] = v17;
  double v40 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
  int v41 = [v6 imageByApplyingFilter:@"CIBlendWithRedMask" withInputParameters:v40];

  int v42 = objc_msgSend(v41, "imageByCroppingToRect:", v9, v11, v13, v15);

  return v42;
}

- (float)estimateFinalQuality
{
  [(CIImage *)self->inputImage extent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = self->inputMaskImage;
  CGFloat v47 = v6;
  CGFloat v48 = v4;
  double v46 = v8;
  double r2 = v10;
  double v12 = -[CIImage imageByCroppingToRect:](v11, "imageByCroppingToRect:", v4, v6, v8, v10);

  [v12 extent];
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  float v17 = 0.0;
  if (!CGRectIsEmpty(v51))
  {
    uint64_t v18 = -[CIImage imageByCroppingToRect:](self->inputExcludeMask, "imageByCroppingToRect:", v4, v6, v8, r2);
    [v18 extent];
    CGFloat v19 = v52.origin.x;
    CGFloat v20 = v52.origin.y;
    CGFloat v21 = v52.size.width;
    CGFloat v45 = v52.size.height;
    IsEmptCGFloat y = CGRectIsEmpty(v52);
    inputVersion = self->inputVersion;
    if (inputVersion) {
      uint64_t v24 = [(NSNumber *)inputVersion intValue];
    }
    else {
      uint64_t v24 = 1;
    }
    CGFloat v44 = v19;
    signed int v25 = +[CIInpaintFilter modelDimensionForVersion:v24 hint:self->inputModel];
    float v17 = 0.0;
    if (v25)
    {
      [(CIInpaintFilter *)self maskToSurroundRatio];
      double v43 = v26;
      [(CIInpaintFilter *)self maskCoverage];
      double v42 = v27;
      CGFloat v28 = [(CIInpaintFilter *)self inputExcludeMaskSurroundMultiplier];
      [v28 doubleValue];
      double v30 = v29;

      char v31 = v30 <= 1.0 || IsEmpty;
      if ((v31 & 1) == 0)
      {
        double v32 = fmin(width, height);
        CGFloat v33 = -(v32 - 1.0 / sqrt(v43) * v32) * -0.5;
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.size.double width = width;
        v53.size.double height = height;
        CGRect v54 = CGRectInset(v53, v33, v33);
        v58.origin.CGFloat x = v44;
        v58.size.double height = v45;
        v58.origin.CGFloat y = v20;
        v58.size.double width = v21;
        if (CGRectIntersectsRect(v54, v58))
        {
          v55.origin.CGFloat x = sub_A948(x, y, width, height, ceil(width * v30));
          v59.origin.CGFloat y = v47;
          v59.origin.CGFloat x = v48;
          v59.size.double width = v46;
          v59.size.double height = r2;
          CGRect v56 = CGRectIntersection(v55, v59);
          CGFloat x = v56.origin.x;
          CGFloat y = v56.origin.y;
          double width = v56.size.width;
          double height = v56.size.height;
        }
      }
      v57.origin.CGFloat x = x;
      v57.origin.CGFloat y = y;
      v57.size.double width = width;
      v57.size.double height = height;
      if (!CGRectIsEmpty(v57))
      {
        unsigned int v34 = [(NSNumber *)self->inputRefinementMultipass BOOLValue];
        v35 = [(CIInpaintFilter *)self inputRefinementModel];
        double v36 = +[CIInpaintFilter loadRefinementModel:v35];

        +[CIInpaintFilter getRefineQualityBar];
        double v38 = v37;
        memset(v50, 0, sizeof(v50));
        sub_848C(v25, (uint64_t)v50, x, y, width, height, v48, v47, v46, r2, v43, v42);
        double v39 = *(double *)v50;
        if (*(double *)v50 <= v38 && v36)
        {
          double v39 = fmin(*(double *)v50 + *(double *)v50, 1.0);
          if (v39 <= v38) {
            unsigned int v40 = v34;
          }
          else {
            unsigned int v40 = 0;
          }
          if (v40 == 1) {
            double v39 = fmin(v39 + v39, 1.0);
          }
        }
        float v17 = v39;
      }
    }
  }
  return v17;
}

- (id)outputImageAndRect:(CGRect *)a3 strategy:(id *)a4 allowDump:(BOOL)a5
{
  BOOL v150 = a5;
  [(CIImage *)self->inputImage extent];
  double v157 = v7;
  double v158 = v6;
  double v155 = v9;
  double v156 = v8;
  [(CIInpaintFilter *)self estimateFinalQuality];
  float v11 = v10;
  [(CIInpaintFilter *)self featherAmount];
  float v13 = v12 / v11;
  if (v11 == 0.0) {
    float v13 = 0.0;
  }
  float v14 = roundf(v13);
  if (v13 >= 3.0) {
    float v15 = v14;
  }
  else {
    float v15 = 0.0;
  }
  [(CIInpaintFilter *)self dilateSize];
  float v17 = fmaxf(v15, v16);
  uint64_t v18 = self->inputMaskImage;
  if (v17 == 0.0)
  {
    v154 = 0;
  }
  else
  {
    CFStringRef v163 = @"inputMaximumDistance";
    *(float *)&double v19 = v17;
    CGFloat v20 = +[NSNumber numberWithFloat:v19];
    v164 = v20;
    CGFloat v21 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
    CGFloat v22 = [(CIImage *)v18 imageByApplyingFilter:@"CIDistanceGradientFromRedMask" withInputParameters:v21];

    [(CIImage *)v18 extent];
    CGRect v167 = CGRectInset(v166, (float)-v17, (float)-v17);
    CGRect v168 = CGRectIntegral(v167);
    double x = v168.origin.x;
    double y = v168.origin.y;
    double width = v168.size.width;
    double height = v168.size.height;
    double v27 = sub_6180(v22);
    objc_msgSend(v27, "imageByCroppingToRect:", x, y, width, height);
    v154 = (CIImage *)objc_claimAutoreleasedReturnValue();

    uint64_t v28 = [(CIImage *)v154 imageByApplyingFilter:@"CIColorThreshold" withInputParameters:&off_15470];

    uint64_t v18 = (CIImage *)v28;
  }
  -[CIImage imageByCroppingToRect:](v18, "imageByCroppingToRect:", v158, v157, v156, v155);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  [v29 extent];
  CGFloat v30 = v169.origin.x;
  CGFloat v31 = v169.origin.y;
  double v32 = v169.size.width;
  double v33 = v169.size.height;
  if (CGRectIsEmpty(v169))
  {
    unsigned int v34 = self->inputImage;
    goto LABEL_70;
  }
  v148 = -[CIImage imageByCroppingToRect:](self->inputExcludeMask, "imageByCroppingToRect:", v158, v157, v156, v155);
  [v148 extent];
  CGFloat v144 = v170.origin.y;
  CGFloat v146 = v170.origin.x;
  CGFloat v139 = v170.size.height;
  CGFloat v142 = v170.size.width;
  IsEmptdouble y = CGRectIsEmpty(v170);
  double v36 = +[CIImage blackImage];
  double v37 = [v29 imageByCompositingOverImage:v36];
  double v38 = objc_msgSend(v37, "imageByCroppingToRect:", v158, v157, v156, v155);

  id v29 = v38;
  v152 = v29;
  if (!IsEmpty)
  {
    double v39 = [(CIInpaintFilter *)self inputExcludeMask];
    id v40 = v29;
    id v41 = v39;
    v153 = v40;
    [v40 extent];
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    [v41 extent];
    v183.origin.double x = v50;
    v183.origin.double y = v51;
    v183.size.double width = v52;
    v183.size.double height = v53;
    v171.origin.double x = v43;
    v171.origin.double y = v45;
    v171.size.double width = v47;
    v171.size.double height = v49;
    CGRect v172 = CGRectUnion(v171, v183);
    double v54 = v172.origin.x;
    double v55 = v172.origin.y;
    double v56 = v172.size.width;
    double v57 = v172.size.height;
    if (CGRectIsEmpty(v172))
    {
      id v58 = +[CIImage emptyImage];
    }
    else
    {
      [v40 extent];
      if (CGRectIsEmpty(v173))
      {
        id v58 = v41;
      }
      else
      {
        [v41 extent];
        if (!CGRectIsEmpty(v174))
        {
          double v132 = +[CIColorKernel cachedKernelWithString:@"kernel vec4 CIIP_orMasks (__sample a, __sample b) __attribute__((outputFormat(kCIFormatRh))) { return vec4(1.0 - clamp(1.0-a.x,0.0,1.0) * clamp(1.0-b.x,0.0,1.0), 0.0, 0.0, 1.0); }"];
          *(void *)buf = v40;
          *(void *)&buf[8] = v41;
          double v133 = +[NSArray arrayWithObjects:buf count:2];
          CGRect v59 = objc_msgSend(v132, "applyWithExtent:arguments:", v133, v54, v55, v56, v57);

          goto LABEL_19;
        }
        id v58 = v40;
      }
    }
    CGRect v59 = v58;
LABEL_19:

    uint64_t v60 = sub_9998(v59);

    v152 = (void *)v60;
  }
  inputVersion = self->inputVersion;
  if (inputVersion) {
    uint64_t v62 = [(NSNumber *)inputVersion intValue];
  }
  else {
    uint64_t v62 = 1;
  }
  signed int v63 = +[CIInpaintFilter modelDimensionForVersion:v62 hint:self->inputModel];
  if (!v63)
  {
    CGSize size = CGRectNull.size;
    a3->origin = CGRectNull.origin;
    a3->CGSize size = size;
    v75 = sub_AB60();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      [(id)objc_opt_class() description];
      objc_claimAutoreleasedReturnValue();
      sub_C488();
    }

    unsigned int v34 = 0;
    goto LABEL_69;
  }
  [(CIInpaintFilter *)self maskToSurroundRatio];
  double v65 = v64;
  [(CIInpaintFilter *)self maskCoverage];
  double v67 = v66;
  double v68 = [(CIInpaintFilter *)self inputExcludeMaskSurroundMultiplier];
  [v68 doubleValue];
  double v70 = v69;

  char v71 = v70 <= 1.0 || IsEmpty;
  if ((v71 & 1) == 0)
  {
    double v72 = fmin(v32, v33);
    CGFloat v73 = -(v72 - 1.0 / sqrt(v65) * v72) * -0.5;
    v175.origin.double x = v30;
    v175.origin.double y = v31;
    v175.size.double width = v32;
    v175.size.double height = v33;
    CGRect v176 = CGRectInset(v175, v73, v73);
    v184.origin.double y = v144;
    v184.origin.double x = v146;
    v184.size.double height = v139;
    v184.size.double width = v142;
    if (CGRectIntersectsRect(v176, v184))
    {
      v177.origin.double x = sub_A948(v30, v31, v32, v33, ceil(v32 * v70));
      v185.origin.double y = v157;
      v185.origin.double x = v158;
      v185.size.double height = v155;
      v185.size.double width = v156;
      CGRect v178 = CGRectIntersection(v177, v185);
      CGFloat v30 = v178.origin.x;
      CGFloat v31 = v178.origin.y;
      double v32 = v178.size.width;
      double v33 = v178.size.height;
    }
  }
  v179.origin.double x = v30;
  v179.origin.double y = v31;
  v179.size.double width = v32;
  v179.size.double height = v33;
  if (!CGRectIsEmpty(v179))
  {
    id inputColorSpace = self->inputColorSpace;
    id v77 = +[NSNull null];
    if (inputColorSpace == v77)
    {
    }
    else
    {
      id v78 = (CGColorSpace *)self->inputColorSpace;

      if (!v78
        || (CFTypeID v79 = CFGetTypeID(v78), v79 == CGColorSpaceGetTypeID())
        && CGColorSpaceGetModel(v78) == kCGColorSpaceModelRGB)
      {
LABEL_42:
        v80 = [(CIImage *)self->inputImage properties];
        double v81 = [v80 objectForKeyedSubscript:@"Orientation"];
        unsigned int v147 = [v81 intValue];

        LODWORD(v81) = [(NSNumber *)self->inputRefinementMultipass BOOLValue];
        double v82 = [(CIInpaintFilter *)self inputRefinementModel];
        int v140 = (int)v81;
        double v83 = +[CIInpaintFilter loadRefinementModel:v82];

        if (+[CIInpaintFilter dumpInpaintImages] && v150) {
          uint64_t v84 = ++dword_18DF0;
        }
        else {
          uint64_t v84 = 0;
        }
        +[CIInpaintFilter getRefineQualityBar];
        double v86 = v85;
        long long v162 = 0u;
        memset(buf, 0, sizeof(buf));
        sub_848C(v63, (uint64_t)buf, v30, v31, v32, v33, v158, v157, v156, v155, v65, v67);
        long long v87 = *(_OWORD *)&buf[16];
        CGFloat v88 = *(double *)&v162;
        double v90 = *(double *)buf;
        CGFloat v89 = *(double *)&buf[8];
        unint64_t v91 = *((void *)&v162 + 1);
        double v145 = sub_9B34(self->inputImage, *((unint64_t *)&v162 + 1), 1, *(CGFloat *)&buf[8], *(CGFloat *)&buf[16], *(CGFloat *)&buf[24], *(CGFloat *)&v162, *(double *)buf);
        uint64_t v92 = sub_9B34(v152, v91, 0, v89, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), v88, v90);
        float v93 = v90;
        *(float *)&double v94 = v93;
        double v143 = (void *)v92;
        CGFloat v95 = +[CIInpaintFilter repairTile:mask:colorSpace:orientation:hint:version:scale:dumpImageIndex:dumpTileIndex:](CIInpaintFilter, "repairTile:mask:colorSpace:orientation:hint:version:scale:dumpImageIndex:dumpTileIndex:", v145, v92, v78, v147, self->inputModel, v62, v94, v84);
        double v96 = v95;
        if (v90 <= v86 && v83)
        {
          double v97 = v90 + v90;
          v138 = sub_9B34(self->inputImage, 2 * v91, 1, v89, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), v88, v90 + v90);
          id v137 = sub_9B34(v152, 2 * v91, 1, v89, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), v88, v90 + v90);
          sub_7CB0(v96, 2.0);
          v136 = LODWORD(v134) = v84;
          *(float *)&double v98 = v90;
          CGFloat v99 = +[CIInpaintFilter refine:hires:mask:colorSpace:orientation:hint:scale:dumpImageIndex:](CIInpaintFilter, "refine:hires:mask:colorSpace:orientation:hint:scale:dumpImageIndex:", v98, v134);

          double v100 = fmin(v90 + v90, 1.0);
          int v101 = v140;
          if (v100 > v86) {
            int v101 = 0;
          }
          if (v101 == 1)
          {
            double v102 = v90 * 4.0;
            double v141 = sub_9B34(self->inputImage, 4 * v91, 1, v89, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), v88, v102);
            uint64_t v103 = sub_9B34(v152, 4 * v91, 1, v89, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), v88, v102);
            CGFloat v104 = sub_7CB0(v99, 2.0);
            *(float *)&double v105 = v97;
            LODWORD(v135) = v84;
            v106 = (void *)v103;
            double v96 = +[CIInpaintFilter refine:v104 hires:v141 mask:v103 colorSpace:v78 orientation:v147 hint:self->inputRefinementModel scale:v105 dumpImageIndex:v135];

            v107 = sub_9CB4(v96, v89, *(CGFloat *)&v87, *((double *)&v87 + 1), v88, 1.0 / v102);
            *a4 = +[NSString stringWithFormat:@"One Tile, Refined4, Scale %.3f", fmin(v100 + v100, 1.0)];
          }
          else
          {
            v107 = sub_9CB4(v99, v89, *(CGFloat *)&v87, *((double *)&v87 + 1), v88, 1.0 / v97);
            *a4 = +[NSString stringWithFormat:@"One Tile, Refined, Scale %.3f", *(void *)&v100];
            double v96 = v99;
          }
        }
        else
        {
          v107 = sub_9CB4(v95, v89, *(CGFloat *)&v87, *((double *)&v87 + 1), v88, 1.0 / v90);
          *a4 = +[NSString stringWithFormat:@"One Tile, Scale %.3f", *(void *)&v90];
        }
        inputMaskImage = v154;
        if (!v154) {
          inputMaskImage = self->inputMaskImage;
        }
        unsigned int v34 = [(CIInpaintFilter *)self blendBack:v107 mask:inputMaskImage];
        double v109 = *(double *)&buf[8];
        long long v111 = *(_OWORD *)&buf[16];
        double v110 = *(double *)&v162;

        if (v84)
        {
          id v112 = -[CIImage imageByCroppingToRect:](self->inputImage, "imageByCroppingToRect:", v109, v111, v110);
          v180.origin.double y = v157;
          v180.origin.double x = v158;
          v180.size.double height = v155;
          v180.size.double width = v156;
          v186.origin.double x = v109;
          *(_OWORD *)&v186.origin.double y = v111;
          v186.size.double height = v110;
          if (!CGRectContainsRect(v180, v186))
          {
            v113 = sub_9DDC(self->inputImage, v158, v157, v156, v155);
            uint64_t v114 = objc_msgSend(v113, "imageByCroppingToRect:", v109, v111, v110);

            id v112 = (void *)v114;
          }
          double v115 = sub_6080(v84, 0, (uint64_t)"inpaint");
          double v116 = +[NSString stringWithFormat:@"%@_in_full.png", v115];
          sub_62B0(v112, v78, v116, v147);
          double v117 = objc_msgSend(v152, "imageByCroppingToRect:", v109, v111, v110);
          v181.origin.double y = v157;
          v181.origin.double x = v158;
          v181.size.double height = v155;
          v181.size.double width = v156;
          v187.origin.double x = v109;
          *(_OWORD *)&v187.origin.double y = v111;
          v187.size.double height = v110;
          if (!CGRectContainsRect(v181, v187))
          {
            double v118 = sub_9DDC(v117, v158, v157, v156, v155);
            uint64_t v119 = objc_msgSend(v118, "imageByCroppingToRect:", v109, v111, v110);

            double v117 = (void *)v119;
          }
          double v120 = +[NSString stringWithFormat:@"%@_mask_full.png", v115];

          sub_650C(v117, v120, v147);
        }
        if ([(NSNumber *)self->inputShowSurround BOOLValue])
        {
          v182.origin.double x = v109;
          *(_OWORD *)&v182.origin.double y = v111;
          v182.size.double height = v110;
          if (!CGRectIsEmpty(v182))
          {
            v159[0] = kCIInputExtentKey;
            double v121 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", v109, v111, v110);
            v160[0] = v121;
            v160[1] = &off_153B0;
            v159[1] = kCIInputRadiusKey;
            v159[2] = kCIInputColorKey;
            v122 = +[CIColor redColor];
            v159[3] = kCIInputWidthKey;
            v160[2] = v122;
            v160[3] = &off_153C8;
            v123 = +[NSDictionary dictionaryWithObjects:v160 forKeys:v159 count:4];
            id v124 = +[CIFilter filterWithName:@"CIRoundedRectangleStrokeGenerator" withInputParameters:v123];
            id v125 = [v124 outputImage];

            v126 = [v125 imageByCompositingOverImage:v34];

            double v127 = [(CIInpaintFilter *)self inputImage];
            [v127 extent];
            objc_msgSend(v126, "imageByCroppingToRect:");
            unsigned int v34 = (CIImage *)objc_claimAutoreleasedReturnValue();
          }
        }
        a3->origin.double x = v109;
        *(_OWORD *)&a3->origin.double y = v111;
        a3->size.double height = v110;
        if (v150)
        {
          double v128 = sub_AB60();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            double v129 = [(id)objc_opt_class() description];
            id v130 = *a4;
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v129;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v130;
            _os_log_impl(&dword_0, v128, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@\n", buf, 0x16u);
          }
        }
        goto LABEL_69;
      }
    }
    id v78 = 0;
    goto LABEL_42;
  }
  unsigned int v34 = self->inputImage;
LABEL_69:

LABEL_70:
  return v34;
}

- (id)outputImage
{
  memset(v5, 0, sizeof(v5));
  uint64_t v4 = 0;
  v2 = [(CIInpaintFilter *)self outputImageAndRect:v5 strategy:&v4 allowDump:1];
  return v2;
}

- (id)outputStrategy
{
  memset(v6, 0, sizeof(v6));
  id v5 = 0;
  id v2 = [(CIInpaintFilter *)self outputImageAndRect:v6 strategy:&v5 allowDump:0];
  id v3 = v5;
  return v3;
}

- (CGRect)outputMaskSurroundExtent
{
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v7 = 0;
  id v2 = [(CIInpaintFilter *)self outputImageAndRect:&v8 strategy:&v7 allowDump:0];
  double v4 = *((double *)&v8 + 1);
  double v3 = *(double *)&v8;
  double v6 = *((double *)&v9 + 1);
  double v5 = *(double *)&v9;
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CIImage)inputImage
{
  return (CIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInputImage:(id)a3
{
}

- (CIImage)inputMaskImage
{
  return (CIImage *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInputMaskImage:(id)a3
{
}

- (NSNumber)inputMaskCoverage
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setInputMaskCoverage:(id)a3
{
}

- (CIImage)inputExcludeMask
{
  return (CIImage *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInputExcludeMask:(id)a3
{
}

- (NSNumber)inputMaskDilateSize
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInputMaskDilateSize:(id)a3
{
}

- (NSNumber)inputMaskToSurroundRatio
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setInputMaskToSurroundRatio:(id)a3
{
}

- (NSNumber)inputExcludeMaskSurroundMultiplier
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInputExcludeMaskSurroundMultiplier:(id)a3
{
}

- (NSNumber)inputMultipass
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInputMultipass:(id)a3
{
}

- (NSNumber)inputTileProgressive
{
  return (NSNumber *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInputTileProgressive:(id)a3
{
}

- (NSNumber)inputShowSurround
{
  return (NSNumber *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInputShowSurround:(id)a3
{
}

- (id)inputColorSpace
{
  return objc_getProperty(self, a2, 152, 1);
}

- (void)setInputColorSpace:(id)a3
{
}

- (NSObject)inputModel
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setInputModel:(id)a3
{
}

- (NSObject)inputRefinementModel
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setInputRefinementModel:(id)a3
{
}

- (NSNumber)inputRefinementMultipass
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setInputRefinementMultipass:(id)a3
{
}

- (NSNumber)inputFeatherAmount
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setInputFeatherAmount:(id)a3
{
}

- (NSNumber)inputVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setInputVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputVersion, 0);
  objc_storeStrong((id *)&self->inputFeatherAmount, 0);
  objc_storeStrong((id *)&self->inputRefinementMultipass, 0);
  objc_storeStrong((id *)&self->inputRefinementModel, 0);
  objc_storeStrong((id *)&self->inputModel, 0);
  objc_storeStrong(&self->inputColorSpace, 0);
  objc_storeStrong((id *)&self->inputShowSurround, 0);
  objc_storeStrong((id *)&self->inputTileProgressive, 0);
  objc_storeStrong((id *)&self->inputMultipass, 0);
  objc_storeStrong((id *)&self->inputExcludeMaskSurroundMultiplier, 0);
  objc_storeStrong((id *)&self->inputMaskToSurroundRatio, 0);
  objc_storeStrong((id *)&self->inputMaskDilateSize, 0);
  objc_storeStrong((id *)&self->inputExcludeMask, 0);
  objc_storeStrong((id *)&self->inputMaskCoverage, 0);
  objc_storeStrong((id *)&self->inputMaskImage, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end