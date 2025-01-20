@interface FaceCoreDetector
+ (CGPoint)_makeYFlippedPointFromCoord:(coord *)a3 image:(id)a4;
+ (CGRect)_makeYFlippedRectFromRect:(CGRect)a3 image:(id)a4;
+ (Face)_createFaceFromFCRFace:(SEL)a3 image:(id)a4;
+ (coord)_makeYFlippedCoordFromPoint:(CGPoint)a3 image:(id)a4;
+ (float)_interpretAsFloat:(id)a3 withDefault:(float)a4;
+ (id)_convertRectsToString:(id)a3;
+ (id)_createFCRFaceFromFace:(void *)a3 image:(id)a4;
+ (id)_parseNumericOrBoolValue:(id)a3;
+ (id)_parseOption:(id)a3 value:(id)a4;
+ (id)_parseRegionOfInterestParam:(id)a3;
+ (id)_transformROIs:(id)a3 image:(id)a4 usingBlock:(id)a5;
+ (id)faceDetector;
+ (id)faceDetectorWithOptions:(id)a3;
+ (id)fastFaceDetector;
+ (id)keypointTrackingDetector;
+ (id)preciseFaceDetector;
+ (id)standardTrackingDetector;
+ (image)_createImage:(id)a3;
+ (int)findProfileInParameters:(id)a3;
+ (void)_addLandmarkOfType:(id)a3 fromMesh:(void *)a4 indexes:(id)a5 to:(id)a6 image:(id)a7;
+ (void)_updateFCRFace:(id)a3 fromFace:(void *)a4 image:(id)a5;
- (FaceCoreDetector)initWithOptions:(id)a3;
- (FaceCoreDetector)initWithProfile:(int)a3 parameters:(id)a4;
- (id).cxx_construct;
- (id)detectFacesInImage:(id)a3 options:(id)a4 error:(id *)a5;
- (id)extractDetailsForFaces:(id)a3 inImage:(id)a4 options:(id)a5 error:(id *)a6;
- (id)version;
- (void)_createFaceCoreLightApiWithProfile:(int)a3 parameters:(id)a4;
- (void)_setParam:(id)a3 toValue:(id)a4 withDefaultValue:(id)a5;
- (void)_updateDetectionParamsValues:(id)a3;
- (void)_updateExtractionParamsValues:(id)a3;
@end

@implementation FaceCoreDetector

+ (id)faceDetectorWithOptions:(id)a3
{
  id v3 = a3;
  v4 = [[FaceCoreDetector alloc] initWithProfile:+[FaceCoreDetector findProfileInParameters:v3] parameters:v3];

  return v4;
}

+ (int)findProfileInParameters:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:@"FCRTrackingType"];
  v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (([v4 isEqualToString:@"FCRTrackingTypeStandard"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"FCRTrackingTypeKeypoints"])
    {
      int v6 = 4;
      goto LABEL_12;
    }
LABEL_6:
    v7 = [v3 objectForKey:@"FCRDetectorType"];
    v8 = v7;
    if (v7)
    {
      if ([v7 isEqualToString:@"FCRDetectorTypeFaceDetection"])
      {
        int v6 = 2;
LABEL_11:

        goto LABEL_12;
      }
      if (([v8 isEqualToString:@"FCRDetectorTypeFastFaceDetection"] & 1) == 0)
      {
        if ([v8 isEqualToString:@"FCRDetectorTypePreciseFaceDetection"])
        {
          int v6 = 0;
          goto LABEL_11;
        }
        if ([v8 isEqualToString:@"FCRDetectorTypePBM"])
        {
          int v6 = 1;
          goto LABEL_11;
        }
      }
    }
    int v6 = 3;
    goto LABEL_11;
  }
  int v6 = 5;
LABEL_12:

  return v6;
}

+ (id)faceDetector
{
  v2 = FCRFaceDetectionParameters();
  id v3 = +[FaceCoreDetector faceDetectorWithOptions:v2];

  return v3;
}

+ (id)fastFaceDetector
{
  v2 = FCRFastFaceDetectionParameters();
  id v3 = +[FaceCoreDetector faceDetectorWithOptions:v2];

  return v3;
}

+ (id)preciseFaceDetector
{
  v2 = FCRPreciseDetectionParameters();
  id v3 = +[FaceCoreDetector faceDetectorWithOptions:v2];

  return v3;
}

+ (id)standardTrackingDetector
{
  v2 = FCRStandardTrackingParameters();
  id v3 = +[FaceCoreDetector faceDetectorWithOptions:v2];

  return v3;
}

+ (id)keypointTrackingDetector
{
  v2 = FCRKeypointTrackingParameters();
  id v3 = +[FaceCoreDetector faceDetectorWithOptions:v2];

  return v3;
}

- (FaceCoreDetector)initWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [(FaceCoreDetector *)self initWithProfile:+[FaceCoreDetector findProfileInParameters:v4] parameters:v4];

  return v5;
}

- (FaceCoreDetector)initWithProfile:(int)a3 parameters:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FaceCoreDetector;
  v7 = [(FaceCoreDetector *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(FaceCoreDetector *)v7 _createFaceCoreLightApiWithProfile:v4 parameters:v6];
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)version
{
  v2 = NSString;
  apple::vision::libraries::facecore::FaceCoreAPI::version((apple::vision::libraries::facecore::FaceCoreAPI *)self->_api.__ptr_.__value_, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v4 = [v2 stringWithUTF8String:p_p];
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v4;
}

- (void)_updateDetectionParamsValues:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v12 = v4;
  v5 = [v4 objectForKey:@"initial_angle"];
  [(FaceCoreDetector *)self _setParam:@"initial_angle" toValue:v5 withDefaultValue:&unk_1F360E180];

  id v6 = [v12 objectForKey:@"eye_and_mouth"];
  [(FaceCoreDetector *)self _setParam:@"eye_and_mouth" toValue:v6 withDefaultValue:MEMORY[0x1E4F1CC28]];

  v7 = [v12 objectForKey:@"FCRDetectionRegion"];
  v8 = +[FaceCoreDetector _parseRegionOfInterestParam:v7];

  if ([v8 count])
  {
    if ((unint64_t)[v8 count] >= 0x65) {
      NSLog(&cfstr_ErrorLegacyfac.isa);
    }
    v9 = +[FaceCoreDetector _convertRectsToString:v8];
    [(FaceCoreDetector *)self _setParam:@"FCRDetectionRegion" toValue:v9 withDefaultValue:0];
  }
  v10 = [v12 objectForKey:@"FCRTrackingModeKeypoints"];
  [(FaceCoreDetector *)self _setParam:@"FCRTrackingModeKeypoints" toValue:v10 withDefaultValue:MEMORY[0x1E4F1CC28]];

  objc_super v11 = [v12 objectForKey:@"kalman_filter"];
  [(FaceCoreDetector *)self _setParam:@"kalman_filter" toValue:v11 withDefaultValue:&unk_1F360E768];
}

+ (id)_transformROIs:(id)a3 image:(id)a4 usingBlock:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (double (**)(id, id, double, double, double, double))a5;
  v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    v13 = (long long *)MEMORY[0x1E4F1DB28];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v16 = v13[1];
        long long v22 = *v13;
        long long v23 = v16;
        [v15 getValue:&v22];
        long long v20 = 0u;
        long long v21 = 0u;
        v31.origin.x = v9[2](v9, v8, *(double *)&v22, *((double *)&v22 + 1), *(double *)&v23, *((double *)&v23 + 1));
        *(CGFloat *)&long long v20 = v31.origin.x;
        *((void *)&v20 + 1) = *(void *)&v31.origin.y;
        *(CGFloat *)&long long v21 = v31.size.width;
        *((void *)&v21 + 1) = *(void *)&v31.size.height;
        if (CGRectIsEmpty(v31)) {
          [MEMORY[0x1E4F29238] valueWithBytes:v13 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        }
        else {
        v17 = [MEMORY[0x1E4F29238] valueWithBytes:&v20 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
        }
        [v10 addObject:v17];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v11);
  }

  return v10;
}

+ (id)_parseRegionOfInterestParam:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v3];
LABEL_7:
    v5 = v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_7;
  }
  NSLog(&cfstr_ErrorLegacyfac_0.isa);
  v5 = 0;
LABEL_9:

  return v5;
}

- (void)_updateExtractionParamsValues:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)MEMORY[0x1E4F1CC08];
  }
  id v13 = v4;
  v5 = [v4 objectForKey:@"initial_angle"];
  [(FaceCoreDetector *)self _setParam:@"initial_angle" toValue:v5 withDefaultValue:&unk_1F360E180];

  id v6 = [v13 objectForKey:@"FCRExtractFaceprint"];
  [(FaceCoreDetector *)self _setParam:@"FCRExtractFaceprint" toValue:v6 withDefaultValue:MEMORY[0x1E4F1CC28]];

  id v7 = [v13 objectForKey:@"FCRExtractLandmarkPoints"];
  [(FaceCoreDetector *)self _setParam:@"FCRExtractLandmarkPoints" toValue:v7 withDefaultValue:MEMORY[0x1E4F1CC28]];

  id v8 = [v13 objectForKey:@"FCRDetectBlink"];
  [(FaceCoreDetector *)self _setParam:@"FCRDetectBlink" toValue:v8 withDefaultValue:MEMORY[0x1E4F1CC28]];

  v9 = [v13 objectForKey:@"FCRDetectSmile"];
  [(FaceCoreDetector *)self _setParam:@"FCRDetectSmile" toValue:v9 withDefaultValue:MEMORY[0x1E4F1CC28]];

  v10 = [v13 objectForKey:@"eye_and_mouth"];
  [(FaceCoreDetector *)self _setParam:@"eye_and_mouth" toValue:v10 withDefaultValue:MEMORY[0x1E4F1CC28]];

  uint64_t v11 = [v13 objectForKey:@"FCRExtractNaturalSmileFeatures"];
  [(FaceCoreDetector *)self _setParam:@"FCRExtractNaturalSmileFeatures" toValue:v11 withDefaultValue:MEMORY[0x1E4F1CC28]];

  uint64_t v12 = [v13 objectForKey:@"kalman_filter"];
  [(FaceCoreDetector *)self _setParam:@"kalman_filter" toValue:v12 withDefaultValue:&unk_1F360E768];
}

- (id)detectFacesInImage:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v18.var0 = (char *)+[FaceCoreDetector _createImage:v7];
  *(void *)&v18.var1 = v9;
  [(FaceCoreDetector *)self _updateDetectionParamsValues:v8];
  apple::vision::libraries::facecore::FaceCoreAPI::detectFaces((apple::vision::libraries::facecore::FaceCoreContext ***)self->_api.__ptr_.__value_, &v18, (uint64_t)&v16);
  id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = (void *)[v10 initWithCapacity:0x8E38E38E38E38E39 * ((v17 - v16) >> 4)];
  uint64_t v12 = v16;
  uint64_t v13 = v17;
  while (v12 != v13)
  {
    v14 = +[FaceCoreDetector _createFCRFaceFromFace:v12 image:v7];
    [v11 addObject:v14];

    v12 += 144;
  }
  v19 = (void **)&v16;
  std::vector<apple::vision::libraries::facecore::Face>::__destroy_vector::operator()[abi:ne180100](&v19);

  return v11;
}

- (id)extractDetailsForFaces:(id)a3 inImage:(id)a4 options:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v24.var0 = (char *)+[FaceCoreDetector _createImage:v10];
  *(void *)&v24.var1 = v12;
  [(FaceCoreDetector *)self _updateExtractionParamsValues:v11];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        +[FaceCoreDetector _createFaceFromFCRFace:v17 image:v10];
        apple::vision::libraries::facecore::FaceCoreAPI::extractFaceDetails((apple::vision::libraries::facecore::FaceCoreContext ***)self->_api.__ptr_.__value_, &v24, (apple::vision::libraries::facecore::Face *)v19);
        +[FaceCoreDetector _updateFCRFace:v17 fromFace:v19 image:v10];
        apple::vision::libraries::facecore::Face::~Face((apple::vision::libraries::facecore::Face *)v19);
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v14);
  }

  return v13;
}

+ (image)_createImage:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 width];
  unsigned int v5 = [v3 height];
  uint64_t v6 = [v3 alignedImageData];

  id v7 = (char *)v6;
  unint64_t v8 = v4 | ((unint64_t)v5 << 32);
  result.var1 = v8;
  result.var2 = HIDWORD(v8);
  result.var0 = v7;
  return result;
}

+ (Face)_createFaceFromFCRFace:(SEL)a3 image:(id)a4
{
  id v7 = a4;
  id v8 = a5;
  *(void *)&retstr->var14 = 0;
  retstr->var17 = 0.0;
  retstr->var18 = 0;
  retstr->var19 = 0.0;
  retstr->var20 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2.var1 = 0u;
  *(_OWORD *)&retstr->var4.var1 = 0u;
  *(_OWORD *)&retstr->var8.var0 = 0u;
  *(_OWORD *)((char *)&retstr->var8.var1 + 4) = 0u;
  retstr->var10.var1 = 0;
  retstr->var10.var2.var0 = 0;
  retstr->var10.var0 = 0;
  *(coord **)((char *)&retstr->var10.var2.var0 + 6) = 0;
  retstr->var16 = 0;
  [v7 faceSize];
  retstr->var0 = (int)v9;
  [v7 faceAngle];
  retstr->var11 = (int)v10;
  if (v7)
  {
    [v7 face];
    double v12 = *((double *)&v47 + 1);
    double v11 = *(double *)&v47;
  }
  else
  {
    long long v51 = 0u;
    long long v55 = 0u;
    long long v47 = 0u;
    double v12 = 0.0;
    double v11 = 0.0;
  }
  retstr->var4 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v11, v12, v47, v51, v55);
  retstr->var7 = [v7 trackDuration];
  retstr->var6 = [v7 trackID];
  if (v7)
  {
    [v7 leftEye];
    double v14 = *((double *)&v48 + 1);
    double v13 = *(double *)&v48;
  }
  else
  {
    long long v52 = 0u;
    long long v56 = 0u;
    long long v48 = 0u;
    double v14 = 0.0;
    double v13 = 0.0;
  }
  retstr->var1 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v13, v14, v48, v52, v56);
  if (v7)
  {
    [v7 rightEye];
    double v16 = *((double *)&v49 + 1);
    double v15 = *(double *)&v49;
  }
  else
  {
    long long v53 = 0u;
    long long v57 = 0u;
    long long v49 = 0u;
    double v16 = 0.0;
    double v15 = 0.0;
  }
  retstr->var2 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v15, v16, v49, v53, v57);
  if (v7)
  {
    [v7 mouth];
    double v18 = *((double *)&v50 + 1);
    double v17 = *(double *)&v50;
  }
  else
  {
    long long v54 = 0u;
    long long v58 = 0u;
    long long v50 = 0u;
    double v18 = 0.0;
    double v17 = 0.0;
  }
  retstr->var3 = +[FaceCoreDetector _makeYFlippedCoordFromPoint:image:](FaceCoreDetector, "_makeYFlippedCoordFromPoint:image:", v8, v17, v18, v50, v54, v58);
  v19 = [v7 expressionFeatures];
  long long v20 = [v19 valueForKey:@"FCRFaceExpressionLeftEyeClosed"];
  retstr->var12 = v20 != 0;

  long long v21 = [v7 expressionFeatures];
  long long v22 = [v21 valueForKey:@"FCRFaceExpressionLeftEyeClosedScore"];
  +[FaceCoreDetector _interpretAsFloat:v22 withDefault:0.0];
  retstr->var14 = v23;

  image v24 = [v7 expressionFeatures];
  long long v25 = [v24 valueForKey:@"FCRFaceExpressionRightEyeClosed"];
  retstr->var13 = v25 != 0;

  uint64_t v26 = [v7 expressionFeatures];
  long long v27 = [v26 valueForKey:@"FCRFaceExpressionRightEyeClosedScore"];
  +[FaceCoreDetector _interpretAsFloat:v27 withDefault:0.0];
  retstr->var15 = v28;

  uint64_t v29 = [v7 expressionFeatures];
  v30 = [v29 valueForKey:@"FCRFaceExpressionSmile"];
  retstr->var16 = v30 != 0;

  CGRect v31 = [v7 expressionFeatures];
  v32 = [v31 valueForKey:@"FCRFaceExpressionSmileScore"];
  +[FaceCoreDetector _interpretAsFloat:v32 withDefault:0.0];
  retstr->var17 = v33;

  v34 = [v7 expressionFeatures];
  v35 = [v34 valueForKey:@"FCRFaceBlurred"];
  retstr->var18 = v35 != 0;

  v36 = [v7 expressionFeatures];
  v37 = [v36 valueForKey:@"FCRFaceBlurScore"];
  +[FaceCoreDetector _interpretAsFloat:v37 withDefault:0.0];
  retstr->var19 = v38;

  v39 = [v7 faceprint];
  if (v39)
  {
    v40 = [v7 faceprint];
    uint64_t v41 = [v40 length];

    if (v41)
    {
      std::vector<double>::resize((uint64_t)&retstr->var8, 0x254uLL);
      var0 = retstr->var8.var0;
      id v43 = [v7 faceprint];
      memcpy(var0, (const void *)[v43 bytes], 0x12A0uLL);
    }
  }
  int v44 = [v7 faceType];
  int v45 = v44 == 2;
  if (v44 == 1) {
    int v45 = 2;
  }
  retstr->var9 = v45;

  return result;
}

+ (id)_createFCRFaceFromFace:(void *)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(FaceCoreFace);
  [a1 _updateFCRFace:v7 fromFace:a3 image:v6];

  return v7;
}

+ (void)_updateFCRFace:(id)a3 fromFace:(void *)a4 image:(id)a5
{
  v68[11] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  [v8 setFaceSize:(double)*(int *)a4];
  [v8 setFaceAngle:(double)*((int *)a4 + 26)];
  [a1 _makeYFlippedPointFromCoord:(char *)a4 + 28 image:v9];
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  objc_msgSend(a1, "_makeYFlippedRectFromRect:image:", v9, (double)(*((_DWORD *)a4 + 7) - *(_DWORD *)a4), (double)(*((_DWORD *)a4 + 8) + *(_DWORD *)a4), (double)(2 * *(_DWORD *)a4), (double)(2 * *(_DWORD *)a4));
  v66[0] = v11;
  v66[1] = v13;
  v66[2] = v14;
  v66[3] = v15;
  v66[4] = v16;
  v66[5] = v17;
  [v8 setFace:v66];
  double v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:*((void *)a4 + 6) length:*((void *)a4 + 7) - *((void *)a4 + 6)];
  [v8 setFaceprint:v18];

  int v19 = *((_DWORD *)a4 + 18);
  if (v19 == 2) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = 2 * (v19 == 1);
  }
  [v8 setFaceType:v20];
  [v8 setTrackID:*((int *)a4 + 10)];
  [v8 setTrackDuration:*((int *)a4 + 11)];
  [a1 _makeYFlippedPointFromCoord:(char *)a4 + 4 image:v9];
  long long v65 = 0u;
  long long v64 = 0u;
  v63[0] = v21;
  v63[1] = v22;
  [v8 setLeftEye:v63];
  [a1 _makeYFlippedPointFromCoord:(char *)a4 + 12 image:v9];
  long long v62 = 0u;
  long long v61 = 0u;
  v60[0] = v23;
  v60[1] = v24;
  [v8 setRightEye:v60];
  [a1 _makeYFlippedPointFromCoord:(char *)a4 + 20 image:v9];
  long long v59 = 0u;
  long long v58 = 0u;
  v57[0] = v25;
  v57[1] = v26;
  [v8 setMouth:v57];
  if (*((void *)a4 + 10) != *((void *)a4 + 11))
  {
    v67[0] = @"FCRFaceLandmarkEyebrowLeft";
    v67[1] = @"FCRFaceLandmarkEyebrowRight";
    v68[0] = &unk_1F360E778;
    v68[1] = &unk_1F360E790;
    v67[2] = @"FCRFaceLandmarkEyeLeft";
    v67[3] = @"FCRFaceLandmarkEyeRight";
    v68[2] = &unk_1F360E7A8;
    v68[3] = &unk_1F360E7C0;
    v67[4] = @"FCRFaceLandmarkLipUpper";
    v67[5] = @"FCRFaceLandmarkLipLower";
    v68[4] = &unk_1F360E7D8;
    v68[5] = &unk_1F360E7F0;
    v67[6] = @"FCRFaceLandmarkMouth";
    v67[7] = @"FCRFaceLandmarkContour";
    v68[6] = &unk_1F360E808;
    v68[7] = &unk_1F360E820;
    v67[8] = @"FCRFaceLandmarkNose";
    v67[9] = @"FCRFaceLandmarkNoseCenter";
    v68[8] = &unk_1F360E838;
    v68[9] = &unk_1F360E850;
    v67[10] = @"FCRFaceLandmarkNoseTip";
    v68[10] = &unk_1F360E868;
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:11];
    uint64_t v51 = 0;
    long long v52 = &v51;
    uint64_t v53 = 0x3032000000;
    long long v54 = __Block_byref_object_copy__1;
    long long v55 = __Block_byref_object_dispose__1;
    id v56 = [MEMORY[0x1E4F1CA60] dictionary];
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __50__FaceCoreDetector__updateFCRFace_fromFace_image___block_invoke;
    v46[3] = &unk_1E6C29028;
    id v49 = a1;
    long long v50 = a4;
    long long v48 = &v51;
    id v47 = v9;
    [v27 enumerateKeysAndObjectsUsingBlock:v46];
    [v8 setFaceLandmarkPoints:v52[5]];

    _Block_object_dispose(&v51, 8);
  }
  float v28 = [MEMORY[0x1E4F1CA60] dictionary];
  v30 = v28;
  if (*((unsigned char *)a4 + 108)) {
    [v28 setValue:MEMORY[0x1E4F1CC38] forKey:@"FCRFaceExpressionLeftEyeClosed"];
  }
  LODWORD(v29) = *((_DWORD *)a4 + 28);
  CGRect v31 = [NSNumber numberWithFloat:v29];
  [v30 setValue:v31 forKey:@"FCRFaceExpressionLeftEyeClosedScore"];

  if (*((unsigned char *)a4 + 109)) {
    [v30 setValue:MEMORY[0x1E4F1CC38] forKey:@"FCRFaceExpressionRightEyeClosed"];
  }
  LODWORD(v32) = *((_DWORD *)a4 + 29);
  float v33 = [NSNumber numberWithFloat:v32];
  [v30 setValue:v33 forKey:@"FCRFaceExpressionRightEyeClosedScore"];

  if (*((unsigned char *)a4 + 120)) {
    [v30 setValue:MEMORY[0x1E4F1CC38] forKey:@"FCRFaceExpressionSmile"];
  }
  LODWORD(v34) = *((_DWORD *)a4 + 31);
  v35 = [NSNumber numberWithFloat:v34];
  [v30 setValue:v35 forKey:@"FCRFaceExpressionSmileScore"];

  if (*((unsigned char *)a4 + 128)) {
    [v30 setValue:MEMORY[0x1E4F1CC38] forKey:@"FCRFaceBlurred"];
  }
  LODWORD(v36) = *((_DWORD *)a4 + 33);
  v37 = [NSNumber numberWithFloat:v36];
  [v30 setValue:v37 forKey:@"FCRFaceBlurScore"];

  [v8 setExpressionFeatures:v30];
  if (*((void *)a4 + 17))
  {
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v39 = [v8 additionalInfo];
    if (v39) {
      [v38 setValuesForKeysWithDictionary:v39];
    }
    v40 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:**((void **)a4 + 17) length:*(void *)(*((void *)a4 + 17) + 8)];
    [v38 setObject:v40 forKey:@"FCRSmileAndBlinkFeatures"];
    uint64_t v41 = [NSNumber numberWithInt:*(unsigned int *)(*((void *)a4 + 17) + 16)];
    [v38 setObject:v41 forKey:@"FCRLeftEyeFeaturesOffset"];

    v42 = [NSNumber numberWithInt:*(unsigned int *)(*((void *)a4 + 17) + 20)];
    [v38 setObject:v42 forKey:@"FCRRightEyeFeaturesOffset"];

    id v43 = [NSNumber numberWithInt:*(unsigned int *)(*((void *)a4 + 17) + 32)];
    [v38 setObject:v43 forKey:@"FCRSmileFeaturesOffset"];

    int v44 = [NSNumber numberWithInt:*(unsigned int *)(*((void *)a4 + 17) + 24)];
    [v38 setObject:v44 forKey:@"FCRBlinkFeaturesSize"];

    int v45 = [NSNumber numberWithInt:*(unsigned int *)(*((void *)a4 + 17) + 28)];
    [v38 setObject:v45 forKey:@"FCRSmileFeaturesSize"];

    [v8 setAdditionalInfo:v38];
  }
}

uint64_t __50__FaceCoreDetector__updateFCRFace_fromFace_image___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 48) _addLandmarkOfType:a2 fromMesh:*(void *)(a1 + 56) + 80 indexes:a3 to:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) image:*(void *)(a1 + 32)];
}

+ (void)_addLandmarkOfType:(id)a3 fromMesh:(void *)a4 indexes:(id)a5 to:(id)a6 image:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v26 = a6;
  id v14 = a7;
  uint64_t v25 = v13;
  std::vector<CGPoint>::vector(__p, [v13 count]);
  uint64_t v15 = __p[0];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v25;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v27 = *(void *)(*(void *)a4
                        + 8 * [*(id *)(*((void *)&v28 + 1) + 8 * i) unsignedIntegerValue]);
        [a1 _makeYFlippedPointFromCoord:&v27 image:v14];
        uint64_t v20 = v15 + 2;
        void *v15 = v21;
        v15[1] = v22;
        v15 += 2;
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v15 = v20;
    }
    while (v17);
  }

  uint64_t v23 = [v16 count];
  uint64_t v24 = +[FaceCoreLandmark landmarkWithType:v12 pointCount:v23 points:__p[0]];
  [v26 setObject:v24 forKey:v12];

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

- (void)_createFaceCoreLightApiWithProfile:(int)a3 parameters:(id)a4
{
  if (a3 >= 6) {
    NSLog(&cfstr_ErrorLegacyfac_1.isa);
  }
  operator new();
}

+ (coord)_makeYFlippedCoordFromPoint:(CGPoint)a3 image:(id)a4
{
  return (coord)((int)a3.x | ((unint64_t)(int)((double)(unint64_t)([a4 height] - 1)
                                                                                - a3.y) << 32));
}

+ (CGPoint)_makeYFlippedPointFromCoord:(coord *)a3 image:(id)a4
{
  int var0 = a3->var0;
  uint64_t v6 = [a4 height];
  double v7 = (double)var0;
  double v8 = (double)(unint64_t)(v6 + ~a3->var1);
  result.y = v8;
  result.x = v7;
  return result;
}

+ (CGRect)_makeYFlippedRectFromRect:(CGRect)a3 image:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = a4;
  id v9 = v8;
  if (v8) {
    double y = (double)(unint64_t)([v8 height] - 1) - y;
  }

  double v10 = x;
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.double y = v11;
  result.origin.CGFloat x = v10;
  return result;
}

- (void)_setParam:(id)a3 toValue:(id)a4 withDefaultValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v9) {
    double v12 = v9;
  }
  else {
    double v12 = v10;
  }
  id v13 = v12;
  value = self->_api.__ptr_.__value_;
  id v15 = v8;
  std::string::basic_string[abi:ne180100]<0>(v19, (char *)[v15 UTF8String]);
  id v16 = +[FaceCoreDetector _parseOption:v15 value:v13];
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v16 UTF8String]);
  (**(void (***)(FaceCoreAPI *, void **, void **))value)(value, v19, __p);
  if (v18 < 0) {
    operator delete(__p[0]);
  }

  if (v20 < 0) {
    operator delete(v19[0]);
  }
}

+ (float)_interpretAsFloat:(id)a3 withDefault:(float)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 floatValue];
    a4 = v7;
  }

  return a4;
}

+ (id)_parseOption:(id)a3 value:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a1 _parseNumericOrBoolValue:v5];
LABEL_5:
    float v7 = v6;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    goto LABEL_5;
  }
  float v7 = 0;
LABEL_7:

  return v7;
}

+ (id)_parseNumericOrBoolValue:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int v6 = [v5 isEqualToString:@"__NSCFBoolean"];

  if (v6)
  {
    int v7 = [v3 BOOLValue];
    id v8 = @"false";
    if (v7) {
      id v8 = @"true";
    }
    id v9 = v8;
  }
  else
  {
    id v9 = [v3 stringValue];
  }
  id v10 = v9;

  return v10;
}

+ (id)_convertRectsToString:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    unsigned int v4 = [MEMORY[0x1E4F28E78] stringWithFormat:&stru_1F360D988];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      id v8 = (long long *)MEMORY[0x1E4F1DB28];
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          long long v11 = v8[1];
          long long v14 = *v8;
          long long v15 = v11;
          [v10 getValue:&v14];
          objc_msgSend(v4, "appendFormat:", @"%d,%d,%d,%d,", (int)*(double *)&v14, (int)*((double *)&v14 + 1), (int)*(double *)&v15, (int)*((double *)&v15 + 1));
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }

    objc_msgSend(v4, "substringWithRange:", 0, objc_msgSend(v4, "length") - 1);
    double v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v12 = @"0,0,0,0";
  }

  return v12;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end