@interface AXMTFaceKitExclavesResult
- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)expressions;
- (AXMTFaceKitExclavesResult)initWithFaceKitLiteSharedDataDictionary:(id)a3 expressions:(id *)a4 noseBaseCenter:(id)a5 referenceDimensionsValue:(id)a6;
- (CGPoint)projectedPoint;
- (CGSize)referenceDimensions;
- (NSValue)noseBaseCenterLandmarkVertex;
- (__n128)pose;
- (__n128)poseTranslation;
- (__n128)setPose:(__n128)a3;
- (void)setNoseBaseCenterLandmarkVertex:(id)a3;
- (void)setPoseTranslation:(AXMTFaceKitExclavesResult *)self;
- (void)setReferenceDimensions:(CGSize)a3;
@end

@implementation AXMTFaceKitExclavesResult

- (AXMTFaceKitExclavesResult)initWithFaceKitLiteSharedDataDictionary:(id)a3 expressions:(id *)a4 noseBaseCenter:(id)a5 referenceDimensionsValue:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v54.receiver = self;
  v54.super_class = (Class)AXMTFaceKitExclavesResult;
  v13 = [(AXMTFaceKitExclavesResult *)&v54 init];
  v14 = v13;
  if (v13)
  {
    *((_OWORD *)v13 + 10) = *(_OWORD *)&a4->var0;
    long long v16 = *(_OWORD *)&a4->var4;
    long long v15 = *(_OWORD *)&a4->var6;
    long long v17 = *(_OWORD *)&a4->var2;
    *((void *)v13 + 28) = a4->var8;
    *((_OWORD *)v13 + 12) = v16;
    *((_OWORD *)v13 + 13) = v15;
    *((_OWORD *)v13 + 11) = v17;
    if (v12)
    {
      v18 = v13 + 64;
      [v12 sizeValue];
      void *v18 = v19;
      v18[1] = v20;
    }
    v21 = [v10 objectForKeyedSubscript:sub_10002642C()];
    v22 = [v21 firstObject];
    v23 = [v22 objectForKeyedSubscript:sub_100026524()];
    if (v23)
    {
      v53 = v21;
      v24 = [v23 objectForKeyedSubscript:sub_10002A7C4()];
      uint64_t v25 = [v24 objectForKeyedSubscript:sub_100028F08()];
      v26 = [v24 objectForKeyedSubscript:sub_100029000()];
      if (v26)
      {
        [(id)objc_opt_class() _poseTranslationMatrixFromArray:v26];
        *((_OWORD *)v14 + 3) = v27;
      }
      objc_msgSend(v14, "_calculatePoseWithRotation:translation:", v25, v26, v25);
      v28 = (double *)(v14 + 96);
      *((_OWORD *)v14 + 6) = v29;
      *((_OWORD *)v14 + 7) = v30;
      *((_OWORD *)v14 + 8) = v31;
      *((_OWORD *)v14 + 9) = v32;
      [v14 setNoseBaseCenterLandmarkVertex:v11];
      if (qword_100054F10 != -1) {
        dispatch_once(&qword_100054F10, &stru_100049210);
      }
      if (byte_100054F08)
      {
        objc_msgSend(v14, "_mirrorPoseVertically:", *v28, *((double *)v14 + 14), *((double *)v14 + 16), *((double *)v14 + 18));
        *(_OWORD *)v28 = v33;
        *((_OWORD *)v14 + 7) = v34;
        *((_OWORD *)v14 + 8) = v35;
        *((_OWORD *)v14 + 9) = v36;
      }
      v37 = [v10 objectForKeyedSubscript:sub_1000292E8()];
      double v38 = *((double *)v14 + 8);
      double v39 = *((double *)v14 + 9);
      v40 = &CGSizeZero;
      p_height = &CGSizeZero.height;
      if ((v38 != 1440.0 || v39 != 1080.0) && (v38 != 1920.0 || v39 != 1440.0))
      {
        v40 = (const CGSize *)(v14 + 64);
        p_height = (CGFloat *)(v14 + 72);
      }
      objc_msgSend((id)objc_opt_class(), "_projectPoint:usingRGBCameraDictionary:pose:referenceDimensions:", v37, 0.0, *v28, *((double *)v14 + 14), *((double *)v14 + 16), *((double *)v14 + 18), v40->width, *p_height);
      *((void *)v14 + 10) = v42;
      *((void *)v14 + 11) = v43;

      v21 = v53;
    }
    else
    {
      v24 = AXSSLogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10002C5B8(v24, v44, v45, v46, v47, v48, v49, v50);
      }
    }
  }
  return (AXMTFaceKitExclavesResult *)v14;
}

- (__n128)pose
{
  return a1[6];
}

- (__n128)setPose:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  result[9] = a5;
  return result;
}

- (__n128)poseTranslation
{
  return a1[3];
}

- (void)setPoseTranslation:(AXMTFaceKitExclavesResult *)self
{
  *(_OWORD *)self->_poseTranslation = v2;
}

- (NSValue)noseBaseCenterLandmarkVertex
{
  return self->_noseBaseCenterLandmarkVertex;
}

- (void)setNoseBaseCenterLandmarkVertex:(id)a3
{
}

- (CGSize)referenceDimensions
{
  double width = self->_referenceDimensions.width;
  double height = self->_referenceDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setReferenceDimensions:(CGSize)a3
{
  self->_referenceDimensions = a3;
}

- (CGPoint)projectedPoint
{
  double x = self->_projectedPoint.x;
  double y = self->_projectedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)expressions
{
  long long v3 = *(_OWORD *)&self[2].var8;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[2].var6;
  *(_OWORD *)&retstr->var6 = v3;
  retstr->var8 = self[3].var1;
  long long v4 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var2;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (void).cxx_destruct
{
}

@end