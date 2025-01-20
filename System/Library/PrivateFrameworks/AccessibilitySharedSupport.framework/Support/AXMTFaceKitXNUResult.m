@interface AXMTFaceKitXNUResult
- (AXMTFaceKitXNUResult)initWithFaceKitTrackedFaceDictionary:(id)a3 semanticsDictionary:(id)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 expressions:(id)a6 referenceDimensionsValue:(id)a7;
- (CGPoint)projectedPoint;
- (CGRect)boundingBoxInImageCoordinates;
- (CGRect)boundingBoxNormalized;
- (CGSize)referenceDimensions;
- (NSArray)landmarkPointsInImageCoordinates;
- (NSDictionary)expressions;
- (__n128)pose;
- (__n128)poseTranslation;
- (__n128)setPose:(__n128)a3;
- (id)noseBaseCenterLandmarkVertex;
- (id)pointForLandmark:(id)a3;
- (id)semanticsDictionary;
- (void)setBoundingBoxInImageCoordinates:(CGRect)a3;
- (void)setBoundingBoxNormalized:(CGRect)a3;
- (void)setExpressions:(id)a3;
- (void)setLandmarkPointsInImageCoordinates:(id)a3;
- (void)setPoseTranslation:(AXMTFaceKitXNUResult *)self;
- (void)setReferenceDimensions:(CGSize)a3;
- (void)setSemanticsDictionary:(id)a3;
@end

@implementation AXMTFaceKitXNUResult

- (AXMTFaceKitXNUResult)initWithFaceKitTrackedFaceDictionary:(id)a3 semanticsDictionary:(id)a4 sampleBuffer:(opaqueCMSampleBuffer *)a5 expressions:(id)a6 referenceDimensionsValue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v52.receiver = self;
  v52.super_class = (Class)AXMTFaceKitXNUResult;
  v16 = [(AXMTFaceKitXNUResult *)&v52 init];
  if (v16)
  {
    id v17 = [v14 copy];
    v18 = (void *)*((void *)v16 + 6);
    *((void *)v16 + 6) = v17;

    if (v15)
    {
      [v15 sizeValue];
      *((void *)v16 + 10) = v19;
      *((void *)v16 + 11) = v20;
    }
    CFDictionaryRef v21 = [v12 objectForKeyedSubscript:sub_1000293E0()];
    CFDictionaryRef v22 = v21;
    if (v12)
    {
      CGSize size = NSZeroRect.size;
      rect.origin = NSZeroRect.origin;
      rect.CGSize size = size;
      if (!CGRectMakeWithDictionaryRepresentation(v21, &rect))
      {

        v48 = 0;
        goto LABEL_19;
      }
      CGSize v24 = rect.size;
      *((_OWORD *)v16 + 9) = rect.origin;
      *((CGSize *)v16 + 10) = v24;
      if (a5)
      {
        ImageBuffer = CMSampleBufferGetImageBuffer(a5);
        if (ImageBuffer)
        {
          v26 = ImageBuffer;
          size_t Width = CVPixelBufferGetWidth(ImageBuffer);
          double Height = (double)CVPixelBufferGetHeight(v26);
          objc_msgSend(v16, "setImageSize:", (double)Width, Height);
          rect.origin.x = rect.origin.x * (double)Width;
          rect.origin.y = (1.0 - rect.origin.y - rect.size.height) * Height;
          rect.size.width = rect.size.width * (double)Width;
          rect.size.height = rect.size.height * Height;
          objc_msgSend(v16, "setBoundingBoxInImageCoordinates:");
        }
      }
    }
    CFDictionaryRef v50 = v22;
    v29 = [v12 objectForKeyedSubscript:sub_100026524()];
    v30 = [v29 objectForKeyedSubscript:sub_10002A7C4()];

    v31 = [v30 objectForKeyedSubscript:sub_100028F08()];
    v32 = [v30 objectForKeyedSubscript:sub_100029000()];
    if (v32)
    {
      [(id)objc_opt_class() _poseTranslationMatrixFromArray:v32];
      *((_OWORD *)v16 + 4) = v33;
    }
    [v16 _calculatePoseWithRotation:v31 translation:v32];
    v34 = (double *)(v16 + 176);
    *((_OWORD *)v16 + 11) = v35;
    *((_OWORD *)v16 + 12) = v36;
    *((_OWORD *)v16 + 13) = v37;
    *((_OWORD *)v16 + 14) = v38;
    if (qword_100054F00 != -1) {
      dispatch_once(&qword_100054F00, &stru_1000491F0);
    }
    if (byte_100054EF8)
    {
      objc_msgSend(v16, "_mirrorPoseVertically:", *v34, *((double *)v16 + 24), *((double *)v16 + 26), *((double *)v16 + 28));
      *(_OWORD *)v34 = v39;
      *((_OWORD *)v16 + 12) = v40;
      *((_OWORD *)v16 + 13) = v41;
      *((_OWORD *)v16 + 14) = v42;
    }
    if (v13)
    {
      id v43 = [v13 copy];
      v44 = (void *)*((void *)v16 + 5);
      *((void *)v16 + 5) = v43;
    }
    v45 = [v12 objectForKeyedSubscript:sub_1000292E8()];
    objc_msgSend((id)objc_opt_class(), "_projectPoint:usingRGBCameraDictionary:pose:referenceDimensions:", v45, 0.0, *v34, *((double *)v16 + 24), *((double *)v16 + 26), *((double *)v16 + 28), CGSizeZero.width, CGSizeZero.height);
    *((void *)v16 + 12) = v46;
    *((void *)v16 + 13) = v47;
  }
  v48 = v16;
LABEL_19:

  return v48;
}

- (id)pointForLandmark:(id)a3
{
  id v4 = a3;
  v5 = [(AXMTFaceKitXNUResult *)self semanticsDictionary];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v6 = (void *)qword_100055088;
  uint64_t v20 = qword_100055088;
  if (!qword_100055088)
  {
    v7 = (void *)sub_10002B0FC();
    v18[3] = (uint64_t)dlsym(v7, "kCVAFaceTracking_LandmarkNames");
    qword_100055088 = v18[3];
    v6 = (void *)v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v6)
  {
    v16 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v17, 8);
    _Unwind_Resume(v16);
  }
  v8 = [v5 objectForKeyedSubscript:*v6];

  if ([v8 count]
    && [v8 containsObject:v4]
    && (id v9 = [v8 indexOfObject:v4], v9 != (id)0x7FFFFFFFFFFFFFFFLL)
    && (id v10 = v9,
        [(AXMTFaceKitXNUResult *)self landmarkPointsInImageCoordinates],
        v11 = objc_claimAutoreleasedReturnValue(),
        id v12 = [v11 count],
        v11,
        v10 < v12))
  {
    id v13 = [(AXMTFaceKitXNUResult *)self landmarkPointsInImageCoordinates];
    id v14 = [v13 objectAtIndexedSubscript:v10];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)noseBaseCenterLandmarkVertex
{
  return [(AXMTFaceKitXNUResult *)self pointForLandmark:@"NoseBaseCenter"];
}

- (CGRect)boundingBoxInImageCoordinates
{
  double x = self->_boundingBoxInImageCoordinates.origin.x;
  double y = self->_boundingBoxInImageCoordinates.origin.y;
  double width = self->_boundingBoxInImageCoordinates.size.width;
  double height = self->_boundingBoxInImageCoordinates.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBoxInImageCoordinates:(CGRect)a3
{
  self->_boundingBoxInImageCoordinates = a3;
}

- (CGRect)boundingBoxNormalized
{
  double x = self->_boundingBoxNormalized.origin.x;
  double y = self->_boundingBoxNormalized.origin.y;
  double width = self->_boundingBoxNormalized.size.width;
  double height = self->_boundingBoxNormalized.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBoundingBoxNormalized:(CGRect)a3
{
  self->_boundingBoxNormalized = a3;
}

- (NSArray)landmarkPointsInImageCoordinates
{
  return self->_landmarkPointsInImageCoordinates;
}

- (void)setLandmarkPointsInImageCoordinates:(id)a3
{
}

- (__n128)pose
{
  return a1[11];
}

- (__n128)setPose:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  result[14] = a5;
  return result;
}

- (__n128)poseTranslation
{
  return a1[4];
}

- (void)setPoseTranslation:(AXMTFaceKitXNUResult *)self
{
  *(_OWORD *)self->_poseTranslation = v2;
}

- (id)semanticsDictionary
{
  return self->_semanticsDictionary;
}

- (void)setSemanticsDictionary:(id)a3
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

- (NSDictionary)expressions
{
  return self->_expressions;
}

- (void)setExpressions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressions, 0);
  objc_storeStrong((id *)&self->_semanticsDictionary, 0);

  objc_storeStrong((id *)&self->_landmarkPointsInImageCoordinates, 0);
}

@end