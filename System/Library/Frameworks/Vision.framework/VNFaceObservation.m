@interface VNFaceObservation
+ (BOOL)_exifOrientationFromFaceRollAngle:(float)a3 exifOrientation:(int *)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (VNFaceObservation)faceObservationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox roll:(NSNumber *)roll yaw:(NSNumber *)yaw;
+ (VNFaceObservation)faceObservationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox roll:(NSNumber *)roll yaw:(NSNumber *)yaw pitch:(NSNumber *)pitch;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5 roll:(id)a6 yaw:(id)a7;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5 roll:(id)a6 yaw:(id)a7 pitch:(id)a8;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 andAlignedBoundingBox:(CGRect)a5;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 faceprint:(id)a5;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 roll:(id)a5 yaw:(id)a6 pitch:(id)a7 isBoundingBoxAligned:(BOOL)a8 alignedBoundingBox:(CGRect)a9 landmarks:(id)a10 landmarks65:(id)a11 landmarkScore:(float)a12 isBlinking:(BOOL)a13 blinkScore:(float)a14;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 roll:(id)a5 yaw:(id)a6 pitch:(id)a7 isBoundingBoxAligned:(BOOL)a8 alignedBoundingBox:(CGRect)a9 landmarks:(id)a10 landmarks65:(id)a11 landmarkScore:(float)a12 isBlinking:(BOOL)a13 blinkScore:(float)a14 faceOrientationIndex:(float)a15 faceJunkinessIndex:(float)a16;
+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 unalignedBoundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5;
+ (VNFaceObservation)observationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (uint64_t)computeYawPitchRollFromPoseMatrix:(__n128)a3 outputYaw:(__n128)a4 outputPitch:(uint64_t)a5 outputRoll:(uint64_t)a6;
- (BOOL)getComputedRectifyingTransform:(CGAffineTransform *)a3;
- (BOOL)getFaceEXIFOrientation:(int *)a3 error:(id *)a4;
- (BOOL)isBlinking;
- (BOOL)isBoundingBoxAligned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRevision1DetectedRectanglesCompatible;
- (CGRect)alignedBoundingBoxAsCGRect;
- (CGRect)unalignedBoundingBox;
- (NSArray)landmarkPrecisionEstimatesPerPoint;
- (NSData)alignedMeanShape;
- (NSData)landmarkPoints;
- (NSData)landmarkPoints3d;
- (NSData)landmarkPoints65;
- (NSData)poseData;
- (NSDictionary)expressionsAndConfidence;
- (NSNumber)faceCaptureQuality;
- (NSNumber)pitch;
- (NSNumber)roll;
- (NSNumber)yaw;
- (VNFaceAttributes)faceAttributes;
- (VNFaceGaze)gaze;
- (VNFaceLandmarks2D)landmarks;
- (VNFaceLandmarks2D)landmarks65;
- (VNFaceLandmarks3D)landmarks3d;
- (VNFaceLegacyFaceCore)legacyFaceCore;
- (VNFaceObservation)initWithCoder:(id)a3;
- (VNFaceObservation)initWithRequestRevision:(unint64_t)a3;
- (VNFaceRegionMap)faceRegionMap;
- (VNFaceScreenGaze)faceScreenGaze;
- (VNFaceSegments)faceSegments;
- (VNRequestSpecifier)faceCaptureQualityOriginatingRequestSpecifier;
- (VNRequestSpecifier)landmarks3DOriginatingRequestSpecifier;
- (VNRequestSpecifier)landmarksOriginatingRequestSpecifier;
- (VNRequestSpecifier)poseOriginatingRequestSpecifier;
- (_Geometry2D_rect2D_)alignedBoundingBox;
- (double)pose;
- (double)poseQuaternion;
- (float)alignedRotationAngle;
- (float)blinkScore;
- (float)faceIdConfidence;
- (float)faceJunkinessIndex;
- (float)faceOrientationIndex;
- (float)landmarkScore;
- (float)nameConfidence;
- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4;
- (id)VNPersonsModelFaceprintWithRequestRevision:(unint64_t)a3 error:(id *)a4;
- (id)debugQuickLookObject;
- (id)description;
- (id)expressionsAndDetections;
- (id)expressionsAndScores;
- (id)faceTorsoprint;
- (id)faceprint;
- (id)torsoprint;
- (id)vn_cloneObject;
- (unint64_t)faceId;
- (unint64_t)hash;
- (unint64_t)landmarksConstellation;
- (void)_addPointsOfNamedRegion:(id)a3 inLandmarks:(id)a4 toPath:(CGPath *)a5 applyingAffineTransform:(CGAffineTransform *)a6;
- (void)_initLocks;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignedBoundingBox:(_Geometry2D_rect2D_)a3;
- (void)setAlignedMeanShape:(id)a3;
- (void)setAlignedRotationAngle:(float)a3;
- (void)setBlinkScore:(float)a3;
- (void)setBoundingBoxAligned:(BOOL)a3;
- (void)setExpressionsAndScores:(id)a3;
- (void)setFaceAttributes:(id)a3;
- (void)setFaceCaptureQuality:(float)a3 originatingRequestSpecifier:(id)a4;
- (void)setFaceId:(unint64_t)a3;
- (void)setFaceIdConfidence:(float)a3;
- (void)setFaceJunkinessIndex:(float)a3;
- (void)setFaceOrientationIndex:(float)a3;
- (void)setFaceRegionMap:(id)a3;
- (void)setFaceScreenGaze:(id)a3;
- (void)setFaceSegments:(id)a3;
- (void)setFaceTorsoprint:(id)a3;
- (void)setFaceprint:(id)a3;
- (void)setGaze:(id)a3;
- (void)setIsBlinking:(BOOL)a3;
- (void)setLandmark3DPointsData:(id)a3 originatingRequestSpecifier:(id)a4;
- (void)setLandmarkPoints65Data:(id)a3 originatingRequestSpecifier:(id)a4;
- (void)setLandmarkPointsData:(id)a3 originatingRequestSpecifier:(id)a4;
- (void)setLandmarkPrecisionEstimatesPerPoint:(id)a3;
- (void)setLandmarkScore:(float)a3;
- (void)setLandmarksConstellation:(unint64_t)a3;
- (void)setLegacyFaceCore:(id)a3;
- (void)setPitch:(id)a3;
- (void)setPoseData:(id)a3 originatingRequestSpecifier:(id)a4;
- (void)setRoll:(id)a3;
- (void)setTorsoprint:(id)a3;
- (void)setUnalignedBoundingBox:(CGRect)a3;
- (void)setYaw:(id)a3;
- (void)updateFaceCaptureQuality:(id)a3;
@end

@implementation VNFaceObservation

- (id)VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 requestClassAndReturnError:a4];
  if (v7)
  {
    if (v7 == objc_opt_class())
    {
      v9 = [(VNFaceObservation *)self faceprint];
      if (!v9)
      {
        v10 = [(VNFaceObservation *)self faceTorsoprint];
        v9 = [v10 faceprint];
      }
      uint64_t v11 = _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, @"faceprint", v9, v6, a4);
    }
    else
    {
      if (v7 != objc_opt_class())
      {
        v13.receiver = self;
        v13.super_class = (Class)VNFaceObservation;
        v8 = [(VNObservation *)&v13 VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:v6 error:a4];
        goto LABEL_11;
      }
      v9 = [(VNFaceObservation *)self torsoprint];
      uint64_t v11 = _validatedEntityPrintOriginatingRequestSpecifierCompatibility(self, @"torsoprint", v9, v6, a4);
    }
    v8 = (void *)v11;
  }
  else
  {
    v8 = 0;
  }
LABEL_11:

  return v8;
}

- (id)VNPersonsModelFaceprintWithRequestRevision:(unint64_t)a3 error:(id *)a4
{
  id v7 = [(VNFaceObservation *)self faceprint];
  if (v7
    || ([(VNFaceObservation *)self faceTorsoprint],
        v8 = objc_claimAutoreleasedReturnValue(),
        [v8 faceprint],
        id v7 = (id)objc_claimAutoreleasedReturnValue(),
        v8,
        v7))
  {
    if (!a3 || [v7 requestRevision] == a3)
    {
      id v7 = v7;
      v9 = v7;
      goto LABEL_13;
    }
    if (a4)
    {
      id v10 = +[VNError errorWithCode:14 message:@"incompatible faceprint revision"];
LABEL_10:
      v9 = 0;
      *a4 = v10;
      goto LABEL_13;
    }
  }
  else
  {
    if (a4)
    {
      id v10 = +[VNError errorForInvalidOperationWithLocalizedDescription:@"faceprint is not available from the observation"];
      id v7 = 0;
      goto LABEL_10;
    }
    id v7 = 0;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceScreenGaze, 0);
  objc_storeStrong((id *)&self->_gaze, 0);
  objc_storeStrong((id *)&self->_legacyFaceCore, 0);
  objc_storeStrong((id *)&self->_landmarks3DOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_landmarksOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_faceCaptureQualityOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_faceCaptureQuality, 0);
  objc_storeStrong((id *)&self->_alignedMeanShape, 0);
  objc_storeStrong((id *)&self->_pitch, 0);
  objc_storeStrong((id *)&self->_yaw, 0);
  objc_storeStrong((id *)&self->_roll, 0);
  objc_storeStrong((id *)&self->_poseOriginatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_poseData, 0);
  objc_storeStrong((id *)&self->_landmarkPoints3d, 0);
  objc_storeStrong((id *)&self->_landmarkPrecisionEstimatesPerPoint, 0);
  objc_storeStrong((id *)&self->_landmarkPoints65, 0);
  objc_storeStrong((id *)&self->_landmarkPoints, 0);
  objc_storeStrong((id *)&self->_expressionsAndScores, 0);
  objc_storeStrong((id *)&self->_faceSegments, 0);
  objc_storeStrong((id *)&self->_faceTorsoprint, 0);
  objc_storeStrong((id *)&self->_torsoprint, 0);
  objc_storeStrong((id *)&self->_faceprint, 0);
  objc_storeStrong((id *)&self->_faceAttributes, 0);
  objc_storeStrong((id *)&self->_faceRegionMap, 0);
  objc_storeStrong((id *)&self->_cachedLandmarks3d, 0);
  objc_storeStrong((id *)&self->_cachedLandmarks65, 0);

  objc_storeStrong((id *)&self->_cachedLandmarks, 0);
}

- (BOOL)isBoundingBoxAligned
{
  return self->_boundingBoxAligned;
}

- (VNFaceScreenGaze)faceScreenGaze
{
  return self->_faceScreenGaze;
}

- (VNFaceGaze)gaze
{
  return self->_gaze;
}

- (VNRequestSpecifier)faceCaptureQualityOriginatingRequestSpecifier
{
  return self->_faceCaptureQualityOriginatingRequestSpecifier;
}

- (VNFaceSegments)faceSegments
{
  return self->_faceSegments;
}

- (void)setFaceId:(unint64_t)a3
{
  self->_faceId = a3;
}

- (unint64_t)faceId
{
  return self->_faceId;
}

- (VNRequestSpecifier)poseOriginatingRequestSpecifier
{
  return self->_poseOriginatingRequestSpecifier;
}

- (VNFaceLegacyFaceCore)legacyFaceCore
{
  return self->_legacyFaceCore;
}

- (VNFaceAttributes)faceAttributes
{
  return self->_faceAttributes;
}

- (VNFaceRegionMap)faceRegionMap
{
  return self->_faceRegionMap;
}

- (CGRect)unalignedBoundingBox
{
  double x = self->_unalignedBoundingBox.origin.x;
  double y = self->_unalignedBoundingBox.origin.y;
  double width = self->_unalignedBoundingBox.size.width;
  double height = self->_unalignedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (VNRequestSpecifier)landmarks3DOriginatingRequestSpecifier
{
  return self->_landmarks3DOriginatingRequestSpecifier;
}

- (VNRequestSpecifier)landmarksOriginatingRequestSpecifier
{
  return self->_landmarksOriginatingRequestSpecifier;
}

- (void)setAlignedMeanShape:(id)a3
{
}

- (NSData)alignedMeanShape
{
  return self->_alignedMeanShape;
}

- (void)setFaceIdConfidence:(float)a3
{
  self->_faceIdConfidence = a3;
}

- (float)faceIdConfidence
{
  return self->_faceIdConfidence;
}

- (NSData)poseData
{
  return self->_poseData;
}

- (NSData)landmarkPoints3d
{
  return self->_landmarkPoints3d;
}

- (void)setLandmarkPrecisionEstimatesPerPoint:(id)a3
{
}

- (NSArray)landmarkPrecisionEstimatesPerPoint
{
  return self->_landmarkPrecisionEstimatesPerPoint;
}

- (void)setLandmarksConstellation:(unint64_t)a3
{
  self->_landmarksConstellation = a3;
}

- (unint64_t)landmarksConstellation
{
  return self->_landmarksConstellation;
}

- (NSData)landmarkPoints65
{
  return self->_landmarkPoints65;
}

- (NSData)landmarkPoints
{
  return self->_landmarkPoints;
}

- (void)setAlignedRotationAngle:(float)a3
{
  self->_alignedRotationAngle = a3;
}

- (float)alignedRotationAngle
{
  return self->_alignedRotationAngle;
}

- (void)setAlignedBoundingBox:(_Geometry2D_rect2D_)a3
{
  self->_alignedBoundingBodouble x = a3;
}

- (_Geometry2D_rect2D_)alignedBoundingBox
{
  float x = self->_alignedBoundingBox.origin.x;
  float y = self->_alignedBoundingBox.origin.y;
  float height = self->_alignedBoundingBox.size.height;
  float width = self->_alignedBoundingBox.size.width;
  result.size.float width = width;
  result.size.float height = height;
  result.origin.float y = y;
  result.origin.float x = x;
  return result;
}

- (NSNumber)pitch
{
  return self->_pitch;
}

- (NSNumber)yaw
{
  return self->_yaw;
}

- (NSNumber)roll
{
  return self->_roll;
}

- (BOOL)isRevision1DetectedRectanglesCompatible
{
  v3 = [(VNFaceObservation *)self roll];
  [v3 doubleValue];
  double v5 = v4;

  if (fabs(v5) > 0.541052068) {
    return 0;
  }
  id v7 = [(VNFaceObservation *)self pitch];
  [v7 doubleValue];
  double v9 = v8;

  return fabs(v9) <= 0.436332313;
}

- (BOOL)getFaceEXIFOrientation:(int *)a3 error:(id *)a4
{
  id v6 = [(VNFaceObservation *)self roll];
  [v6 floatValue];
  *(float *)&double v8 = (float)(v7 * 180.0) / 3.1416;
  LOBYTE(a4) = +[VNFaceObservation _exifOrientationFromFaceRollAngle:a3 exifOrientation:a4 error:v8];

  return (char)a4;
}

- (void)setGaze:(id)a3
{
  id v6 = a3;
  double v4 = (VNFaceGaze *)[v6 copy];
  gaze = self->_gaze;
  self->_gaze = v4;
}

- (void)setFaceScreenGaze:(id)a3
{
  id v6 = a3;
  double v4 = (VNFaceScreenGaze *)[v6 copy];
  faceScreenGaze = self->_faceScreenGaze;
  self->_faceScreenGaze = v4;
}

- (void)setLegacyFaceCore:(id)a3
{
  id v6 = a3;
  double v4 = (VNFaceLegacyFaceCore *)[v6 copy];
  legacyFaceCore = self->_legacyFaceCore;
  self->_legacyFaceCore = v4;
}

- (void)setPitch:(id)a3
{
}

- (void)setYaw:(id)a3
{
}

- (void)setRoll:(id)a3
{
}

- (void)setUnalignedBoundingBox:(CGRect)a3
{
  self->_unalignedBoundingBofloat x = a3;
}

- (void)setFaceTorsoprint:(id)a3
{
}

- (id)faceTorsoprint
{
  return self->_faceTorsoprint;
}

- (void)setTorsoprint:(id)a3
{
}

- (id)torsoprint
{
  return self->_torsoprint;
}

- (void)setFaceprint:(id)a3
{
}

- (id)faceprint
{
  return self->_faceprint;
}

- (void)setFaceOrientationIndex:(float)a3
{
  self->_faceOrientationIndefloat x = a3;
}

- (void)setFaceJunkinessIndex:(float)a3
{
  self->_faceJunkinessIndefloat x = a3;
}

- (float)faceJunkinessIndex
{
  return self->_faceJunkinessIndex;
}

- (float)faceOrientationIndex
{
  return self->_faceOrientationIndex;
}

- (void)updateFaceCaptureQuality:(id)a3
{
}

- (NSNumber)faceCaptureQuality
{
  return self->_faceCaptureQuality;
}

- (void)setFaceSegments:(id)a3
{
}

- (void)setFaceAttributes:(id)a3
{
}

- (void)setFaceRegionMap:(id)a3
{
}

- (id)debugQuickLookObject
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  [(VNDetectedObjectObservation *)self boundingBox];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  Mutable = CGPathCreateMutable();
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v32 = *MEMORY[0x1E4F1DAB8];
  long long v33 = v12;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (-[VNFaceObservation debugQuickLookObject]::onceToken != -1) {
    dispatch_once(&-[VNFaceObservation debugQuickLookObject]::onceToken, &__block_literal_global_16133);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = (id)-[VNFaceObservation debugQuickLookObject]::regionNames;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        v18 = [(VNFaceObservation *)self landmarks];
        v27[0] = v32;
        v27[1] = v33;
        v27[2] = v34;
        [(VNFaceObservation *)self _addPointsOfNamedRegion:v17 inLandmarks:v18 toPath:Mutable applyingAffineTransform:v27];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v14);
  }

  v26.receiver = self;
  v26.super_class = (Class)VNFaceObservation;
  v19 = [(VNDetectedObjectObservation *)&v26 debugQuickLookObject];
  if (v19)
  {
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeTranslation(&v25, v4, v6);
    CGAffineTransform v24 = v25;
    CGAffineTransformScale(&v35, &v24, v8, v10);
    CGAffineTransform v25 = v35;
    v20 = (const CGPath *)MEMORY[0x1A62553C0](Mutable, &v25);
    *(_OWORD *)&v35.a = xmmword_1A4125588;
    *(_OWORD *)&v35.c = unk_1A4125598;
    v21 = (CGColor *)VNDebugColorFromValues(&v35.a);
    v22 = VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v20, v19, v21);
    CGPathRelease(v20);
  }
  else
  {
    v22 = VNDebugPathFromNormalizedCGPath((uint64_t)Mutable, 512.0, 512.0);
  }

  CGPathRelease(Mutable);

  return v22;
}

void __41__VNFaceObservation_debugQuickLookObject__block_invoke()
{
  v0 = (void *)-[VNFaceObservation debugQuickLookObject]::regionNames;
  -[VNFaceObservation debugQuickLookObject]::regionNames = (uint64_t)&unk_1EF7A7E08;
}

- (void)_addPointsOfNamedRegion:(id)a3 inLandmarks:(id)a4 toPath:(CGPath *)a5 applyingAffineTransform:(CGAffineTransform *)a6
{
  id v14 = [a4 valueForKey:a3];
  if (v14)
  {
    size_t v8 = [v14 pointCount];
    if (v8)
    {
      id v9 = v14;
      CGFloat v10 = (const CGPoint *)[v9 normalizedPoints];
      uint64_t v11 = [v9 pointsClassification];
      uint64_t v12 = v11;
      if ((unint64_t)(v11 - 1) >= 2)
      {
        if (!v11)
        {
          p_float y = &v10->y;
          do
          {
            CGPathMoveToPoint(a5, a6, *(p_y - 1), *p_y);
            CGPathAddLineToPoint(a5, a6, *(p_y - 1), *p_y);
            p_y += 2;
            --v8;
          }
          while (v8);
        }
      }
      else
      {
        CGPathMoveToPoint(a5, a6, v10->x, v10->y);
        CGPathAddLines(a5, a6, v10, v8);
        if (v12 == 2)
        {
          CGPathAddLineToPoint(a5, a6, v10->x, v10->y);
          CGPathCloseSubpath(a5);
        }
      }
    }
  }
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v13.receiver = self;
  v13.super_class = (Class)VNFaceObservation;
  CGFloat v4 = [(VNDetectedObjectObservation *)&v13 description];
  [v3 appendString:v4];

  unint64_t v5 = [(VNFaceObservation *)self faceId];
  if (v5) {
    objc_msgSend(v3, "appendFormat:", @" ID=%lu", v5);
  }
  CGFloat v6 = [(VNFaceObservation *)self landmarks];
  double v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 constellation];
    id v9 = @"VNRequestFaceLandmarksConstellationNotDefined";
    if (v8 == 1) {
      id v9 = @"VNRequestFaceLandmarksConstellation65Points";
    }
    if (v8 == 2) {
      id v9 = @"VNRequestFaceLandmarksConstellation76Points";
    }
    CGFloat v10 = v9;
    [v7 confidence];
    [v3 appendFormat:@" VNFaceLandmarks2D [%@, confidence=%f]", v10, v11];
  }

  return v3;
}

- (float)landmarkScore
{
  id v3 = [(VNFaceObservation *)self landmarkPoints];

  if (v3) {
    return self->_landmarkScore;
  }
  else {
    return -3.4028e38;
  }
}

- (void)setLandmarkScore:(float)a3
{
  self->_landmarkScore = a3;
}

- (void)setLandmark3DPointsData:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v10 = a3;
  CGFloat v6 = (VNRequestSpecifier *)a4;
  double v7 = (NSData *)[v10 copy];
  landmarkPoints3d = self->_landmarkPoints3d;
  self->_landmarkPoints3d = v7;

  landmarks3DOriginatingRequestSpecifier = self->_landmarks3DOriginatingRequestSpecifier;
  self->_landmarks3DOriginatingRequestSpecifier = v6;
}

- (void)setLandmarkPoints65Data:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v10 = a3;
  CGFloat v6 = (VNRequestSpecifier *)a4;
  double v7 = (NSData *)[v10 copy];
  landmarkPoints65 = self->_landmarkPoints65;
  self->_landmarkPoints65 = v7;

  objc_storeStrong((id *)&self->_landmarkPoints, self->_landmarkPoints65);
  landmarksOriginatingRequestSpecifier = self->_landmarksOriginatingRequestSpecifier;
  self->_landmarksOriginatingRequestSpecifier = v6;
}

- (void)setLandmarkPointsData:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v10 = a3;
  CGFloat v6 = (VNRequestSpecifier *)a4;
  double v7 = (NSData *)[v10 copy];
  landmarkPoints = self->_landmarkPoints;
  self->_landmarkPoints = v7;

  landmarksOriginatingRequestSpecifier = self->_landmarksOriginatingRequestSpecifier;
  self->_landmarksOriginatingRequestSpecifier = v6;
}

- (void)setFaceCaptureQuality:(float)a3 originatingRequestSpecifier:(id)a4
{
  CGFloat v6 = (VNRequestSpecifier *)a4;
  *(float *)&double v7 = a3;
  uint64_t v8 = [NSNumber numberWithFloat:v7];
  faceCaptureQualitfloat y = self->_faceCaptureQuality;
  self->_faceCaptureQualitfloat y = v8;

  faceCaptureQualityOriginatingRequestSpecifier = self->_faceCaptureQualityOriginatingRequestSpecifier;
  self->_faceCaptureQualityOriginatingRequestSpecifier = v6;
}

- (void)setBoundingBoxAligned:(BOOL)a3
{
  self->_boundingBoxAligned = a3;
}

- (id)expressionsAndDetections
{
  if (self->_expressionsAndScores)
  {
    v2 = +[VNFaceExpressionDetector createExpressionDetectionDictionaryFromScores:](VNFaceExpressionDetector, "createExpressionDetectionDictionaryFromScores:");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)expressionsAndScores
{
  return self->_expressionsAndScores;
}

- (void)setExpressionsAndScores:(id)a3
{
}

- (CGRect)alignedBoundingBoxAsCGRect
{
  double x = self->_alignedBoundingBox.origin.x;
  double y = self->_alignedBoundingBox.origin.y;
  double width = self->_alignedBoundingBox.size.width;
  double height = self->_alignedBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (float)blinkScore
{
  return self->_blinkScore;
}

- (BOOL)isBlinking
{
  return self->_isBlinking;
}

- (void)setBlinkScore:(float)a3
{
  self->_blinkScore = a3;
}

- (void)setIsBlinking:(BOOL)a3
{
  self->_isBlinking = a3;
}

- (BOOL)getComputedRectifyingTransform:(CGAffineTransform *)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  landmarkPoints65 = self->_landmarkPoints65;
  if (landmarkPoints65)
  {
    unint64_t v5 = landmarkPoints65;
    CGFloat v6 = v5;
    if (!a3)
    {
LABEL_42:

      return (char)a3;
    }
    uint64_t v7 = [(NSData *)v5 bytes];
    v38 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    Geometry2D_mallocCart2D(&v38, 63);
    uint64_t v8 = (char *)v38;
    id v9 = (char *)v39;
    int v10 = v40;
    if (v38 && v39 && (int)v40 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = (int *)(v7 + 4);
      do
      {
        *(_DWORD *)&v8[v11] = *(v12 - 1);
        int v13 = *v12;
        v12 += 2;
        *(_DWORD *)&v9[v11] = v13;
        v11 += 4;
      }
      while (v11 != 252);
    }
    else if (!v38)
    {
      goto LABEL_40;
    }
    if (v9 && v10 == 63)
    {
      __A[0] = 0;
      __A[1] = 0;
      vDSP_Length __N = 0;
      v44 = 0;
      v45 = 0;
      uint64_t v46 = 0;
      v41 = 0;
      v42 = 0;
      uint64_t v43 = 0;
      Geometry2D_mallocCart2D(__A, 63);
      id v14 = 0;
      BOOL v15 = 1;
      if (!__A[0] || !__A[1] || (int)__N < 1) {
        goto LABEL_39;
      }
      uint64_t v16 = 0;
      long long v76 = xmmword_1A410F0E0;
      long long v77 = unk_1A410F0F0;
      v78[0] = xmmword_1A410F100;
      *(_OWORD *)((char *)v78 + 12) = *(long long *)((char *)&xmmword_1A410F100 + 12);
      long long v72 = xmmword_1A410F0A0;
      long long v73 = unk_1A410F0B0;
      long long v74 = xmmword_1A410F0C0;
      long long v75 = unk_1A410F0D0;
      long long v68 = xmmword_1A410F060;
      long long v69 = unk_1A410F070;
      long long v70 = xmmword_1A410F080;
      long long v71 = unk_1A410F090;
      CGAffineTransform v66 = *(CGAffineTransform *)byte_1A410F020;
      long long v67 = unk_1A410F050;
      long long v63 = xmmword_1A410F1DC;
      long long v64 = unk_1A410F1EC;
      *(_OWORD *)v65 = xmmword_1A410F1FC;
      *(_OWORD *)&v65[12] = *(long long *)((char *)&xmmword_1A410F1FC + 12);
      long long v59 = xmmword_1A410F19C;
      long long v60 = unk_1A410F1AC;
      long long v61 = xmmword_1A410F1BC;
      long long v62 = unk_1A410F1CC;
      long long v55 = xmmword_1A410F15C;
      long long v56 = unk_1A410F16C;
      long long v57 = xmmword_1A410F17C;
      long long v58 = unk_1A410F18C;
      CGAffineTransform v53 = *(CGAffineTransform *)byte_1A410F11C;
      long long v54 = unk_1A410F14C;
      *(void *)&long long v51 = &v66;
      *((void *)&v51 + 1) = &v53;
      uint64_t v52 = 63;
      *(void *)&__B.a = &__C;
      *(void *)&__B.b = v81;
      *(void *)&v32.a = &v80;
      *(void *)&v32.b = &v79;
      *(void *)&__B.c = 2;
      *(void *)&v32.c = 2;
      float v17 = 0.0;
      float v18 = 0.0;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      do
      {
        uint64_t v19 = *(int *)((char *)&LandmarkDetector_faceMesh63Parts + v16 + 584);
        float v18 = v18 + *((float *)&v66.a + v19);
        float v17 = v17 + *((float *)&v53.a + v19);
        v16 += 4;
      }
      while (v16 != 32);
      uint64_t v20 = 0;
      float v21 = v18 * 0.125;
      float v22 = 0.0;
      float v23 = 0.0;
      do
      {
        uint64_t v24 = *(int *)((char *)&LandmarkDetector_faceMesh63Parts + v20 + 968);
        float v23 = v23 + *((float *)&v66.a + v24);
        float v22 = v22 + *((float *)&v53.a + v24);
        v20 += 4;
      }
      while (v20 != 32);
      *(float *)&__C.realp = v21;
      *((float *)&__C.realp + 1) = v23 * 0.125;
      v81[0] = v17 * 0.125;
      v81[1] = v22 * 0.125;
      int32x2_t v79 = vdup_n_s32(0x3EA8F5C3u);
      uint64_t v80 = 0x3F2B851E3EA8F5C3;
      unsigned __int8 v25 = Geometry2D_estimateRST((uint64_t)&__B, (uint64_t)&v32, (float *)&v49);
      if ((v25 & 0x80) != 0)
      {
        if (!__A[0] || !__A[1] || __N != 63) {
          goto LABEL_38;
        }
        if (fabsf(*(float *)&v49) > 0.00000011921
          || fabsf(*((float *)&v49 + 1) + -1.0) > 0.00000011921
          || fabsf(*(float *)&v50) > 0.00000011921
          || fabsf(*((float *)&v50 + 1)) > 0.00000011921)
        {
          float v26 = *((float *)&v49 + 1);
          __float2 v27 = __sincosf_stret(*(float *)&v49);
          v81[0] = v27.__cosval * v26;
          *(float *)&uint64_t v80 = v27.__sinval * v26;
          *(void *)&__B.a = v81;
          *(void *)&__B.b = &v80;
          *(_OWORD *)&v32.a = v51;
          DSPSplitComplex __C = *(DSPSplitComplex *)__A;
          vDSP_zvzsml((const DSPSplitComplex *)&v32, 1, (const DSPSplitComplex *)&__B, &__C, 1, 0x3FuLL);
          vDSP_vsadd(__A[0], 1, (const float *)&v50, __A[0], 1, (int)__N);
          vDSP_vsadd(__A[1], 1, (const float *)&v50 + 1, __A[1], 1, (int)__N);
LABEL_31:
          Geometry2D_cloneUsingIndicesCart2D((int *)&v44, (int *)&v38);
          id v14 = v44;
          BOOL v15 = 1;
          if (v44)
          {
            if (v45)
            {
              if ((int)v46 >= 1)
              {
                Geometry2D_cloneUsingIndicesCart2D((int *)&v41, (int *)__A);
                if (v41)
                {
                  if (v42 && (int)v43 >= 1)
                  {
                    char v28 = Geometry2D_estimateRST((uint64_t)&v41, (uint64_t)&v44, &v34);
                    id v14 = v44;
                    BOOL v15 = (v28 & 0x80) == 0;
                  }
                }
              }
            }
          }
LABEL_39:
          free(v14);
          v44 = 0;
          free(v45);
          v45 = 0;
          LODWORD(v46) = 0;
          free(v41);
          v41 = 0;
          free(v42);
          v42 = 0;
          LODWORD(v43) = 0;
          free(__A[0]);
          __A[0] = 0;
          free(__A[1]);
          uint64_t v8 = (char *)v38;
          if (!v15)
          {
            free(v38);
            v38 = 0;
            free(v39);
            v39 = 0;
            LODWORD(v40) = 0;
            CGAffineTransformMakeTranslation(&v66, (float)-v36, (float)-v37);
            CGAffineTransform __B = v66;
            CGAffineTransformScale(&v53, &__B, 1.0 / v35, 1.0 / v35);
            CGAffineTransform v66 = v53;
            CGAffineTransform v32 = v53;
            CGAffineTransformRotate(&v53, &v32, v34);
            long long v30 = *(_OWORD *)&v53.c;
            long long v29 = *(_OWORD *)&v53.tx;
            CGAffineTransform v66 = v53;
            *(_OWORD *)&a3->a = *(_OWORD *)&v53.a;
            *(_OWORD *)&a3->c = v30;
            *(_OWORD *)&a3->tdouble x = v29;
            LOBYTE(a3) = 1;
            goto LABEL_42;
          }
          goto LABEL_40;
        }
        unsigned __int8 v25 = Geometry2D_copyCart2D((uint64_t)&v51, (uint64_t)__A);
      }
      if (v25 != 128)
      {
LABEL_38:
        id v14 = 0;
        BOOL v15 = 1;
        goto LABEL_39;
      }
      goto LABEL_31;
    }
LABEL_40:
    free(v8);
    v38 = 0;
    free(v39);
    LOBYTE(a3) = 0;
    goto LABEL_42;
  }
  LOBYTE(a3) = 0;
  return (char)a3;
}

- (double)poseQuaternion
{
  if (a1[47])
  {
    [a1 pose];
    float v5 = v4 + (float)(*(float *)v1.i32 + *(float *)&v2.i32[1]);
    if (v5 >= 0.0)
    {
      float v14 = sqrtf(v5 + 1.0);
      float32x2_t v15 = vrecpe_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14));
      float32x2_t v16 = vmul_f32(v15, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14), v15));
      float32x2_t v26 = vmul_n_f32(vsub_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL), (int32x2_t)v3), (float32x2_t)vext_s8((int8x8_t)v3, (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL), 4uLL)), vmul_f32(v16, vrecps_f32((float32x2_t)COERCE_UNSIGNED_INT(v14 + v14), v16)).f32[0]);
    }
    else if (*(float *)v1.i32 < *(float *)&v2.i32[1] || *(float *)v1.i32 < v4)
    {
      float v7 = 1.0 - *(float *)v1.i32;
      if (*(float *)&v2.i32[1] >= v4)
      {
        float v27 = sqrtf(*(float *)&v2.i32[1] + (float)(v7 - v4));
        *(float *)&unsigned int v28 = v27 + v27;
        float32x2_t v29 = vrecpe_f32((float32x2_t)v28);
        float32x2_t v30 = vmul_f32(v29, vrecps_f32((float32x2_t)v28, v29));
        v31.i32[0] = vmul_f32(v30, vrecps_f32((float32x2_t)v28, v30)).u32[0];
        v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_lane_s32(*(int32x2_t *)v1.i8, 1), *(float32x2_t *)v2.i8).u32[0];
        v30.i32[1] = v28;
        v31.i32[1] = 0.25;
        float32x2_t v26 = vmul_f32(v30, v31);
      }
      else
      {
        float32x2_t v8 = (float32x2_t)__PAIR64__(v1.u32[1], COERCE_UNSIGNED_INT(sqrtf(v4 + (float)(v7 - *(float *)&v2.i32[1]))));
        float32x2_t v9 = vadd_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)), v3);
        float32x2_t v10 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 0);
        v10.i32[0] = 2.0;
        v10.i32[0] = vmul_f32(v8, v10).u32[0];
        float32x2_t v11 = vrecpe_f32((float32x2_t)v10.u32[0]);
        float32x2_t v12 = vmul_f32(v11, vrecps_f32((float32x2_t)v10.u32[0], v11));
        float32x2_t v26 = vmul_n_f32(v9, vmul_f32(v12, vrecps_f32((float32x2_t)v10.u32[0], v12)).f32[0]);
        __asm { FMOV            V2.2S, #0.25 }
      }
    }
    else
    {
      float32x2_t v17 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 0);
      float32x2_t v18 = vadd_f32(*(float32x2_t *)v1.i8, v17);
      v17.i32[0] = 2.0;
      v17.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v1.u32[1], COERCE_UNSIGNED_INT(sqrtf(*(float *)v1.i32 + (float)((float)(1.0- *(float *)&v2.i32[1])- v4)))), v17).u32[0];
      v17.i32[1] = v18.i32[1];
      float32x2_t v19 = vrecpe_f32((float32x2_t)v17.u32[0]);
      float32x2_t v20 = vmul_f32(v19, vrecps_f32((float32x2_t)v17.u32[0], v19));
      unsigned __int32 v21 = vmul_f32(v20, vrecps_f32((float32x2_t)v17.u32[0], v20)).u32[0];
      __asm { FMOV            V5.2S, #0.25 }
      _D5.i32[1] = v21;
      float32x2_t v26 = vmul_f32(v17, _D5);
    }
  }
  else
  {
    float32x2_t v26 = (float32x2_t)_PromotedConst;
  }
  return *(double *)&v26;
}

- (void)setPoseData:(id)a3 originatingRequestSpecifier:(id)a4
{
  id v10 = a3;
  CGFloat v6 = (VNRequestSpecifier *)a4;
  float v7 = (NSData *)[v10 copy];
  poseData = self->_poseData;
  self->_poseData = v7;

  poseOriginatingRequestSpecifier = self->_poseOriginatingRequestSpecifier;
  self->_poseOriginatingRequestSpecifier = v6;
}

- (double)pose
{
  long long v1 = *MEMORY[0x1E4F149A0];
  int8x16_t v2 = *(void **)(a1 + 376);
  if (v2) {
    *(void *)&long long v1 = *objc_msgSend(v2, "bytes", v1, *(_OWORD *)(MEMORY[0x1E4F149A0] + 16), *(_OWORD *)(MEMORY[0x1E4F149A0] + 32), *(void *)(MEMORY[0x1E4F149A0] + 48), *(void *)(MEMORY[0x1E4F149A0] + 56));
  }
  return *(double *)&v1;
}

- (VNFaceLandmarks3D)landmarks3d
{
  p_cachedLandmarks3dLock = &self->_cachedLandmarks3dLock;
  os_unfair_lock_lock(&self->_cachedLandmarks3dLock);
  if (!self->_cachedLandmarks3d)
  {
    float v4 = [(VNFaceObservation *)self landmarkPoints3d];
    if (v4)
    {
      float v5 = [VNFaceLandmarks3D alloc];
      CGFloat v6 = [(VNFaceObservation *)self landmarks3DOriginatingRequestSpecifier];
      [(VNDetectedObjectObservation *)self boundingBox];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [(VNFaceObservation *)self alignedBoundingBox];
      int v16 = v15;
      int v18 = v17;
      int v20 = v19;
      int v22 = v21;
      [(VNFaceObservation *)self landmarkScore];
      LODWORD(v32) = v23;
      LODWORD(v24) = v16;
      LODWORD(v25) = v18;
      LODWORD(v26) = v20;
      LODWORD(v27) = v22;
      unsigned int v28 = -[VNFaceLandmarks3D initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](v5, "initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:", v6, v4, 63, v8, v10, v12, v14, v24, v25, v26, v27, v32);
      cachedLandmarks3d = self->_cachedLandmarks3d;
      self->_cachedLandmarks3d = v28;
    }
  }
  os_unfair_lock_unlock(p_cachedLandmarks3dLock);
  float32x2_t v30 = self->_cachedLandmarks3d;

  return v30;
}

- (VNFaceLandmarks2D)landmarks65
{
  p_cachedLandmarks65Lock = &self->_cachedLandmarks65Lock;
  os_unfair_lock_lock(&self->_cachedLandmarks65Lock);
  if (!self->_cachedLandmarks65)
  {
    float v4 = [(VNFaceObservation *)self landmarkPoints65];
    if (v4)
    {
      float v5 = [VNFaceLandmarks2D alloc];
      CGFloat v6 = [(VNFaceObservation *)self landmarksOriginatingRequestSpecifier];
      unint64_t v7 = [v4 length];
      [(VNDetectedObjectObservation *)self boundingBox];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [(VNFaceObservation *)self alignedBoundingBox];
      int v17 = v16;
      int v19 = v18;
      int v21 = v20;
      int v23 = v22;
      [(VNFaceObservation *)self landmarkScore];
      LODWORD(v33) = v24;
      LODWORD(v25) = v17;
      LODWORD(v26) = v19;
      LODWORD(v27) = v21;
      LODWORD(v28) = v23;
      float32x2_t v29 = -[VNFaceLandmarks2D initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:](v5, "initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:", v6, v4, v7 >> 3, 1, 0, v9, v11, v13, v15, v25, v26, v27, v28, v33);
      cachedLandmarks65 = self->_cachedLandmarks65;
      self->_cachedLandmarks65 = v29;
    }
  }
  os_unfair_lock_unlock(p_cachedLandmarks65Lock);
  float32x2_t v31 = self->_cachedLandmarks65;

  return v31;
}

- (VNFaceLandmarks2D)landmarks
{
  p_cachedLandmarksLock = &self->_cachedLandmarksLock;
  os_unfair_lock_lock(&self->_cachedLandmarksLock);
  if (!self->_cachedLandmarks)
  {
    float v4 = [(VNFaceObservation *)self landmarkPoints];
    if (v4)
    {
      float v5 = [VNFaceLandmarks2D alloc];
      CGFloat v6 = [(VNFaceObservation *)self landmarksOriginatingRequestSpecifier];
      unint64_t v7 = [v4 length];
      unint64_t v8 = [(VNFaceObservation *)self landmarksConstellation];
      double v9 = [(VNFaceObservation *)self landmarkPrecisionEstimatesPerPoint];
      [(VNDetectedObjectObservation *)self boundingBox];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      [(VNFaceObservation *)self alignedBoundingBox];
      int v19 = v18;
      int v21 = v20;
      int v23 = v22;
      int v25 = v24;
      [(VNFaceObservation *)self landmarkScore];
      LODWORD(v35) = v26;
      LODWORD(v27) = v19;
      LODWORD(v28) = v21;
      LODWORD(v29) = v23;
      LODWORD(v30) = v25;
      float32x2_t v31 = -[VNFaceLandmarks2D initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:](v5, "initWithOriginatingRequestSpecifier:pointsData:pointCount:constellation:precisionEstimatesPerPoint:userFacingBBox:alignedBBox:landmarkScore:", v6, v4, v7 >> 3, v8, v9, v11, v13, v15, v17, v27, v28, v29, v30, v35);
      cachedLandmarks = self->_cachedLandmarks;
      self->_cachedLandmarks = v31;
    }
  }
  os_unfair_lock_unlock(p_cachedLandmarksLock);
  uint64_t v33 = self->_cachedLandmarks;

  return v33;
}

- (float)nameConfidence
{
  return self->_faceIdConfidence;
}

- (NSDictionary)expressionsAndConfidence
{
  if (self->_expressionsAndScores)
  {
    int8x16_t v2 = +[VNFaceExpressionDetector createExpressionAndConfidencesDictionaryFromScores:](VNFaceExpressionDetector, "createExpressionAndConfidencesDictionaryFromScores:");
  }
  else
  {
    int8x16_t v2 = 0;
  }

  return (NSDictionary *)v2;
}

- (id)vn_cloneObject
{
  v54.receiver = self;
  v54.super_class = (Class)VNFaceObservation;
  uint64_t v3 = [(VNDetectedObjectObservation *)&v54 vn_cloneObject];
  if (v3)
  {
    uint64_t v4 = [(NSData *)self->_alignedMeanShape copy];
    float v5 = *(void **)(v3 + 440);
    *(void *)(v3 + 440) = v4;

    uint64_t v6 = [(NSData *)self->_landmarkPoints copy];
    unint64_t v7 = *(void **)(v3 + 336);
    *(void *)(v3 + 336) = v6;

    uint64_t v8 = [(NSData *)self->_landmarkPoints65 copy];
    double v9 = *(void **)(v3 + 344);
    *(void *)(v3 + 344) = v8;

    *(void *)(v3 + 352) = self->_landmarksConstellation;
    uint64_t v10 = [(NSArray *)self->_landmarkPrecisionEstimatesPerPoint copy];
    double v11 = *(void **)(v3 + 360);
    *(void *)(v3 + 360) = v10;

    uint64_t v12 = [(NSData *)self->_landmarkPoints3d copy];
    double v13 = *(void **)(v3 + 368);
    *(void *)(v3 + 368) = v12;

    uint64_t v14 = [(NSData *)self->_poseData copy];
    double v15 = *(void **)(v3 + 376);
    *(void *)(v3 + 376) = v14;

    uint64_t v16 = [(VNRequestSpecifier *)self->_poseOriginatingRequestSpecifier copy];
    double v17 = *(void **)(v3 + 384);
    *(void *)(v3 + 384) = v16;

    uint64_t v18 = [(NSDictionary *)self->_expressionsAndScores copy];
    int v19 = *(void **)(v3 + 272);
    *(void *)(v3 + 272) = v18;

    uint64_t v20 = [(VNFaceprint *)self->_faceprint copy];
    int v21 = *(void **)(v3 + 224);
    *(void *)(v3 + 224) = v20;

    uint64_t v22 = [(VNTorsoprint *)self->_torsoprint copy];
    int v23 = *(void **)(v3 + 232);
    *(void *)(v3 + 232) = v22;

    uint64_t v24 = [(VNFaceTorsoprint *)self->_faceTorsoprint copy];
    int v25 = *(void **)(v3 + 240);
    *(void *)(v3 + 240) = v24;

    uint64_t v26 = [(VNFaceRegionMap *)self->_faceRegionMap copy];
    double v27 = *(void **)(v3 + 208);
    *(void *)(v3 + 208) = v26;

    uint64_t v28 = [(VNFaceSegments *)self->_faceSegments copy];
    double v29 = *(void **)(v3 + 248);
    *(void *)(v3 + 248) = v28;

    CGSize size = self->_unalignedBoundingBox.size;
    *(CGPoint *)(v3 + 304) = self->_unalignedBoundingBox.origin;
    *(CGSize *)(v3 + 320) = size;
    *(unsigned char *)(v3 + 408) = self->_boundingBoxAligned;
    *(_Geometry2D_rect2D_ *)(v3 + 288) = self->_alignedBoundingBox;
    *(float *)(v3 + 412) = self->_alignedRotationAngle;
    uint64_t v31 = [(NSNumber *)self->_roll copy];
    uint64_t v32 = *(void **)(v3 + 416);
    *(void *)(v3 + 416) = v31;

    uint64_t v33 = [(NSNumber *)self->_yaw copy];
    float v34 = *(void **)(v3 + 424);
    *(void *)(v3 + 424) = v33;

    uint64_t v35 = [(NSNumber *)self->_pitch copy];
    float v36 = *(void **)(v3 + 432);
    *(void *)(v3 + 432) = v35;

    *(float *)(v3 + 256) = self->_landmarkScore;
    *(unsigned char *)(v3 + 260) = self->_isBlinking;
    *(float *)(v3 + 264) = self->_blinkScore;
    *(void *)(v3 + 400) = self->_faceId;
    *(float *)(v3 + 392) = self->_faceIdConfidence;
    uint64_t v37 = [(NSNumber *)self->_faceCaptureQuality copy];
    v38 = *(void **)(v3 + 448);
    *(void *)(v3 + 448) = v37;

    uint64_t v39 = [(VNRequestSpecifier *)self->_faceCaptureQualityOriginatingRequestSpecifier copy];
    uint64_t v40 = *(void **)(v3 + 456);
    *(void *)(v3 + 456) = v39;

    *(float *)(v3 + 280) = self->_faceJunkinessIndex;
    *(float *)(v3 + 284) = self->_faceOrientationIndex;
    uint64_t v41 = [(VNRequestSpecifier *)self->_landmarksOriginatingRequestSpecifier copy];
    v42 = *(void **)(v3 + 464);
    *(void *)(v3 + 464) = v41;

    uint64_t v43 = [(VNRequestSpecifier *)self->_landmarks3DOriginatingRequestSpecifier copy];
    v44 = *(void **)(v3 + 472);
    *(void *)(v3 + 472) = v43;

    uint64_t v45 = [(VNFaceLegacyFaceCore *)self->_legacyFaceCore copy];
    uint64_t v46 = *(void **)(v3 + 480);
    *(void *)(v3 + 480) = v45;

    uint64_t v47 = [(VNFaceGaze *)self->_gaze copy];
    v48 = *(void **)(v3 + 488);
    *(void *)(v3 + 488) = v47;

    uint64_t v49 = [(VNFaceScreenGaze *)self->_faceScreenGaze copy];
    uint64_t v50 = *(void **)(v3 + 496);
    *(void *)(v3 + 496) = v49;

    uint64_t v51 = [(VNFaceAttributes *)self->_faceAttributes copy];
    uint64_t v52 = *(void **)(v3 + 216);
    *(void *)(v3 + 216) = v51;
  }

  return (id)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VNFaceObservation *)a3;
  if (self == v4)
  {
    char v18 = 1;
  }
  else
  {
    v98.receiver = self;
    v98.super_class = (Class)VNFaceObservation;
    if ([(VNDetectedObjectObservation *)&v98 isEqual:v4]
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      float v5 = v4;
      [(VNFaceObservation *)self alignedBoundingBox];
      float v7 = v6;
      float v9 = v8;
      float v11 = v10;
      float v13 = v12;
      [(VNFaceObservation *)v5 alignedBoundingBox];
      char v18 = 0;
      if (v7 == v14 && v9 == v15)
      {
        char v18 = 0;
        if (v13 == v17 && v11 == v16)
        {
          if (!CGRectEqualToRect(self->_unalignedBoundingBox, v5->_unalignedBoundingBox)) {
            goto LABEL_42;
          }
          int v19 = [(VNFaceObservation *)self landmarkPoints];
          uint64_t v20 = [(VNFaceObservation *)v5 landmarkPoints];
          char v21 = VisionCoreEqualOrNilObjects();

          if ((v21 & 1) == 0) {
            goto LABEL_42;
          }
          uint64_t v22 = [(VNFaceObservation *)self landmarkPoints65];
          int v23 = [(VNFaceObservation *)v5 landmarkPoints65];
          char v24 = VisionCoreEqualOrNilObjects();

          if ((v24 & 1) == 0) {
            goto LABEL_42;
          }
          unint64_t v25 = [(VNFaceObservation *)self landmarksConstellation];
          if (v25 != [(VNFaceObservation *)v5 landmarksConstellation]) {
            goto LABEL_42;
          }
          uint64_t v26 = [(VNFaceObservation *)self landmarkPrecisionEstimatesPerPoint];
          double v27 = [(VNFaceObservation *)v5 landmarkPrecisionEstimatesPerPoint];
          char v28 = VisionCoreEqualOrNilObjects();

          if ((v28 & 1) == 0) {
            goto LABEL_42;
          }
          double v29 = [(VNFaceObservation *)self landmarkPoints3d];
          double v30 = [(VNFaceObservation *)v5 landmarkPoints3d];
          char v31 = VisionCoreEqualOrNilObjects();

          if ((v31 & 1) == 0) {
            goto LABEL_42;
          }
          uint64_t v32 = [(VNFaceObservation *)self poseData];
          uint64_t v33 = [(VNFaceObservation *)v5 poseData];
          char v34 = VisionCoreEqualOrNilObjects();

          if ((v34 & 1) == 0) {
            goto LABEL_42;
          }
          uint64_t v35 = [(VNFaceObservation *)self poseOriginatingRequestSpecifier];
          float v36 = [(VNFaceObservation *)v5 poseOriginatingRequestSpecifier];
          char v37 = VisionCoreEqualOrNilObjects();

          if ((v37 & 1) == 0) {
            goto LABEL_42;
          }
          v38 = [(VNFaceObservation *)self expressionsAndScores];
          uint64_t v39 = [(VNFaceObservation *)v5 expressionsAndScores];
          char v40 = VisionCoreEqualOrNilObjects();

          if ((v40 & 1) == 0) {
            goto LABEL_42;
          }
          unint64_t v41 = [(VNFaceObservation *)self faceId];
          if (v41 != [(VNFaceObservation *)v5 faceId]) {
            goto LABEL_42;
          }
          [(VNFaceObservation *)self faceIdConfidence];
          float v43 = v42;
          [(VNFaceObservation *)v5 faceIdConfidence];
          if (v43 != v44) {
            goto LABEL_42;
          }
          uint64_t v45 = [(VNFaceObservation *)self faceprint];
          uint64_t v46 = [(VNFaceObservation *)v5 faceprint];
          char v47 = VisionCoreEqualOrNilObjects();

          if ((v47 & 1) == 0) {
            goto LABEL_42;
          }
          v48 = [(VNFaceObservation *)self torsoprint];
          uint64_t v49 = [(VNFaceObservation *)v5 torsoprint];
          char v50 = VisionCoreEqualOrNilObjects();

          if ((v50 & 1) == 0) {
            goto LABEL_42;
          }
          uint64_t v51 = [(VNFaceObservation *)self faceTorsoprint];
          uint64_t v52 = [(VNFaceObservation *)v5 faceTorsoprint];
          char v53 = VisionCoreEqualOrNilObjects();

          if ((v53 & 1) == 0) {
            goto LABEL_42;
          }
          BOOL v54 = [(VNFaceObservation *)self isBoundingBoxAligned];
          if (v54 != [(VNFaceObservation *)v5 isBoundingBoxAligned]) {
            goto LABEL_42;
          }
          [(VNFaceObservation *)self alignedRotationAngle];
          float v56 = v55;
          [(VNFaceObservation *)v5 alignedRotationAngle];
          if (v56 != v57) {
            goto LABEL_42;
          }
          long long v58 = [(VNFaceObservation *)self faceRegionMap];
          long long v59 = [(VNFaceObservation *)v5 faceRegionMap];
          char v60 = VisionCoreEqualOrNilObjects();

          if ((v60 & 1) == 0) {
            goto LABEL_42;
          }
          long long v61 = [(VNFaceObservation *)self faceAttributes];
          long long v62 = [(VNFaceObservation *)v5 faceAttributes];
          char v63 = VisionCoreEqualOrNilObjects();

          if ((v63 & 1) == 0) {
            goto LABEL_42;
          }
          long long v64 = [(VNFaceObservation *)self faceSegments];
          v65 = [(VNFaceObservation *)v5 faceSegments];
          char v66 = VisionCoreEqualOrNilObjects();

          if ((v66 & 1) == 0) {
            goto LABEL_42;
          }
          BOOL v67 = [(VNFaceObservation *)self isBlinking];
          if (v67 != [(VNFaceObservation *)v5 isBlinking]) {
            goto LABEL_42;
          }
          long long v68 = [(VNFaceObservation *)self alignedMeanShape];
          long long v69 = [(VNFaceObservation *)v5 alignedMeanShape];
          char v70 = VisionCoreEqualOrNilObjects();

          if ((v70 & 1) == 0) {
            goto LABEL_42;
          }
          [(VNFaceObservation *)self landmarkScore];
          float v72 = v71;
          [(VNFaceObservation *)v5 landmarkScore];
          if (v72 != v73) {
            goto LABEL_42;
          }
          [(VNFaceObservation *)self faceJunkinessIndex];
          float v75 = v74;
          [(VNFaceObservation *)v5 faceJunkinessIndex];
          if (v75 != v76) {
            goto LABEL_42;
          }
          [(VNFaceObservation *)self faceOrientationIndex];
          float v78 = v77;
          [(VNFaceObservation *)v5 faceOrientationIndex];
          if (v78 != v79) {
            goto LABEL_42;
          }
          uint64_t v80 = [(VNFaceObservation *)self faceCaptureQuality];
          v81 = [(VNFaceObservation *)v5 faceCaptureQuality];
          char v82 = VisionCoreEqualOrNilObjects();

          if ((v82 & 1) == 0) {
            goto LABEL_42;
          }
          uint64_t v83 = [(VNFaceObservation *)self faceCaptureQualityOriginatingRequestSpecifier];
          v84 = [(VNFaceObservation *)v5 faceCaptureQualityOriginatingRequestSpecifier];
          char v85 = VisionCoreEqualOrNilObjects();

          if ((v85 & 1) == 0) {
            goto LABEL_42;
          }
          v86 = [(VNFaceObservation *)self landmarksOriginatingRequestSpecifier];
          v87 = [(VNFaceObservation *)v5 landmarksOriginatingRequestSpecifier];
          char v88 = VisionCoreEqualOrNilObjects();

          if ((v88 & 1) == 0) {
            goto LABEL_42;
          }
          v89 = [(VNFaceObservation *)self landmarks3DOriginatingRequestSpecifier];
          v90 = [(VNFaceObservation *)v5 landmarks3DOriginatingRequestSpecifier];
          char v91 = VisionCoreEqualOrNilObjects();

          if ((v91 & 1) == 0) {
            goto LABEL_42;
          }
          v92 = [(VNFaceObservation *)self gaze];
          v93 = [(VNFaceObservation *)v5 gaze];
          char v94 = VisionCoreEqualOrNilObjects();

          if (v94)
          {
            v95 = [(VNFaceObservation *)self faceScreenGaze];
            v96 = [(VNFaceObservation *)v5 faceScreenGaze];
            char v18 = VisionCoreEqualOrNilObjects();
          }
          else
          {
LABEL_42:
            char v18 = 0;
          }
        }
      }
    }
    else
    {
      char v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  v85.receiver = self;
  v85.super_class = (Class)VNFaceObservation;
  id v3 = [(VNDetectedObjectObservation *)&v85 hash];
  [(VNFaceObservation *)self alignedBoundingBox];
  float v5 = v4;
  float v7 = v6;
  float v9 = v8;
  float v11 = v10;
  float v12 = [(VNFaceObservation *)self landmarkPoints];
  uint64_t v13 = [v12 hash];

  float v14 = [(VNFaceObservation *)self landmarkPoints65];
  uint64_t v15 = [v14 hash];

  unsigned int v16 = [(VNFaceObservation *)self landmarksConstellation];
  float v17 = [(VNFaceObservation *)self landmarkPrecisionEstimatesPerPoint];
  uint64_t v18 = [v17 hash];

  int v19 = [(VNFaceObservation *)self landmarkPoints3d];
  uint64_t v20 = [v19 hash];

  char v21 = [(VNFaceObservation *)self poseData];
  uint64_t v22 = [v21 hash];

  int v23 = [(VNFaceObservation *)self poseOriginatingRequestSpecifier];
  uint64_t v24 = [v23 hash];

  unint64_t v25 = [(VNFaceObservation *)self expressionsAndScores];
  uint64_t v84 = [v25 hash];

  unint64_t v83 = [(VNFaceObservation *)self faceId];
  [(VNFaceObservation *)self faceIdConfidence];
  float v27 = v26;
  char v28 = [(VNFaceObservation *)self faceprint];
  uint64_t v82 = [v28 hash];

  double v29 = [(VNFaceObservation *)self torsoprint];
  uint64_t v81 = [v29 hash];

  double v30 = [(VNFaceObservation *)self faceTorsoprint];
  uint64_t v80 = [v30 hash];

  BOOL v79 = [(VNFaceObservation *)self isBoundingBoxAligned];
  [(VNFaceObservation *)self alignedRotationAngle];
  float v32 = v31;
  uint64_t v33 = [(VNFaceObservation *)self faceRegionMap];
  uint64_t v78 = [v33 hash];

  char v34 = [(VNFaceObservation *)self faceAttributes];
  uint64_t v77 = [v34 hash];

  uint64_t v35 = [(VNFaceObservation *)self faceSegments];
  uint64_t v76 = [v35 hash];
  float v75 = v9;

  BOOL v74 = [(VNFaceObservation *)self isBlinking];
  float v36 = [(VNFaceObservation *)self alignedMeanShape];
  uint64_t v73 = [v36 hash];
  uint64_t v70 = v24;
  uint64_t v71 = v22;
  uint64_t v72 = v20;
  uint64_t v37 = v18;
  uint64_t v38 = v15;

  [(VNFaceObservation *)self landmarkScore];
  float v40 = v39;
  [(VNFaceObservation *)self faceJunkinessIndex];
  float v42 = v41;
  [(VNFaceObservation *)self faceOrientationIndex];
  float v44 = v43;
  uint64_t v45 = [(VNFaceObservation *)self landmarksOriginatingRequestSpecifier];
  uint64_t v46 = [v45 hash];
  uint64_t v47 = v13;

  v48 = [(VNFaceObservation *)self landmarks3DOriginatingRequestSpecifier];
  uint64_t v49 = [v48 hash];

  char v50 = [(VNFaceObservation *)self gaze];
  uint64_t v51 = [v50 hash];

  uint64_t v52 = [(VNFaceObservation *)self faceScreenGaze];
  uint64_t v53 = [v52 hash];
  uint64_t v54 = LODWORD(v44);
  if (v44 == 0.0) {
    uint64_t v54 = 0;
  }
  uint64_t v55 = LODWORD(v42);
  if (v42 == 0.0) {
    uint64_t v55 = 0;
  }
  uint64_t v56 = LODWORD(v40);
  if (v40 == 0.0) {
    uint64_t v56 = 0;
  }
  uint64_t v57 = LODWORD(v32);
  if (v32 == 0.0) {
    uint64_t v57 = 0;
  }
  uint64_t v58 = LODWORD(v27);
  if (v27 == 0.0) {
    uint64_t v58 = 0;
  }
  unint64_t v59 = (unint64_t)LODWORD(v5) << 13;
  if (v5 == 0.0) {
    unint64_t v59 = 0;
  }
  uint64_t v60 = LODWORD(v7);
  if (v7 == 0.0) {
    uint64_t v60 = 0;
  }
  unint64_t v61 = v59 ^ v60;
  uint64_t v62 = LODWORD(v11);
  if (v11 == 0.0) {
    uint64_t v62 = 0;
  }
  unint64_t v63 = v62 ^ (v61 << 13);
  uint64_t v64 = LODWORD(v75);
  if (v75 == 0.0) {
    uint64_t v64 = 0;
  }
  unint64_t v65 = __ROR8__(v80 ^ __ROR8__(v81 ^ __ROR8__(v82 ^ __ROR8__(v58 ^ __ROR8__(v83 ^ __ROR8__(v84 ^ __ROR8__(v70 ^ __ROR8__(v71 ^ __ROR8__(v72 ^ __ROR8__(v37 ^ __ROR8__(v16 ^ __ROR8__(v38 ^ __ROR8__(v47 ^ __ROR8__(v64 ^ __ROR8__(v63, 51) ^ __ROR8__(v3, 51), 51), 51), 51), 51), 51), 51), 51), 51), 51),
                                          51),
                                  51),
                          51),
                  51),
          51);
  *((void *)&v66 + 1) = v79 ^ v65;
  *(void *)&long long v66 = v65;
  unint64_t v67 = __ROR8__(v76 ^ __ROR8__(v77 ^ __ROR8__(v78 ^ __ROR8__((v66 >> 51) ^ v57, 51), 51), 51), 51);
  *((void *)&v66 + 1) = v74 ^ v67;
  *(void *)&long long v66 = v67;
  unint64_t v68 = v53 ^ __ROR8__(v51 ^ __ROR8__(v49 ^ __ROR8__(v46 ^ __ROR8__(v54 ^ __ROR8__(v55 ^ __ROR8__(v56 ^ __ROR8__((v66 >> 51) ^ v73, 51), 51), 51), 51), 51), 51), 51);

  return v68;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNFaceObservation;
  [(VNDetectedObjectObservation *)&v17 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNFaceObservation");
  *(float *)&double v5 = self->_alignedBoundingBox.origin.x;
  [v4 encodeFloat:@"alignedBBX" forKey:v5];
  *(float *)&double v6 = self->_alignedBoundingBox.origin.y;
  [v4 encodeFloat:@"alignedBBY" forKey:v6];
  *(float *)&double v7 = self->_alignedBoundingBox.size.width;
  [v4 encodeFloat:@"alignedBBW" forKey:v7];
  *(float *)&double v8 = self->_alignedBoundingBox.size.height;
  [v4 encodeFloat:@"alignedBBH" forKey:v8];
  [v4 encodeDouble:@"unalignedBBXAsDouble" forKey:self->_unalignedBoundingBox.origin.x];
  [v4 encodeDouble:@"unalignedBBYAsDouble" forKey:self->_unalignedBoundingBox.origin.y];
  [v4 encodeDouble:@"unalignedBBWAsDouble" forKey:self->_unalignedBoundingBox.size.width];
  [v4 encodeDouble:@"unalignedBBHAsDouble" forKey:self->_unalignedBoundingBox.size.height];
  [v4 encodeObject:self->_landmarkPoints forKey:@"landmarks"];
  float v9 = self->_landmarkPoints;
  char v10 = VisionCoreEqualOrNilObjects();

  if ((v10 & 1) == 0) {
    [v4 encodeObject:self->_landmarkPoints65 forKey:@"landmarks65"];
  }
  [v4 encodeObject:self->_landmarkPrecisionEstimatesPerPoint forKey:@"precisionEstimates"];
  [v4 encodeInteger:self->_landmarksConstellation forKey:@"landmarksConstellation"];
  [v4 encodeObject:self->_landmarkPoints3d forKey:@"landmarks3D"];
  [v4 encodeObject:self->_poseData forKey:@"pose"];
  [v4 encodeObject:self->_poseOriginatingRequestSpecifier forKey:@"poseOrigReq"];
  [v4 encodeObject:self->_expressionsAndScores forKey:@"expressions"];
  *(float *)&double v11 = self->_faceIdConfidence;
  [v4 encodeFloat:@"faceIDConfidence" forKey:v11];
  [v4 encodeInteger:self->_faceId forKey:@"faceID"];
  [v4 encodeObject:self->_faceprint forKey:@"faceprint"];
  [v4 encodeObject:self->_torsoprint forKey:@"torsoprint"];
  [v4 encodeObject:self->_faceTorsoprint forKey:@"faceTorsoprint"];
  [v4 encodeBool:self->_boundingBoxAligned forKey:@"hasAlignedBBox"];
  *(float *)&double v12 = self->_alignedRotationAngle;
  [v4 encodeFloat:@"alignedRotAngle" forKey:v12];
  [v4 encodeObject:self->_roll forKey:@"roll"];
  [v4 encodeObject:self->_yaw forKey:@"yaw"];
  [v4 encodeObject:self->_pitch forKey:@"pitch"];
  [v4 encodeObject:self->_faceRegionMap forKey:@"faceRegionMap"];
  [v4 encodeObject:self->_faceAttributes forKey:@"faceAttributes"];
  [v4 encodeObject:self->_faceSegments forKey:@"faceSmntcSegments"];
  [v4 encodeBool:self->_isBlinking forKey:@"blinking"];
  [v4 encodeObject:self->_alignedMeanShape forKey:@"alignedMeanShape"];
  *(float *)&double v13 = self->_blinkScore;
  [v4 encodeFloat:@"blinkScore" forKey:v13];
  *(float *)&double v14 = self->_landmarkScore;
  [v4 encodeFloat:@"landmarksScore" forKey:v14];
  [v4 encodeObject:self->_faceCaptureQuality forKey:@"faceCaptureQuality"];
  [v4 encodeObject:self->_faceCaptureQualityOriginatingRequestSpecifier forKey:@"faceCQOReq"];
  *(float *)&double v15 = self->_faceJunkinessIndex;
  [v4 encodeFloat:@"faceJunkinessIndex" forKey:v15];
  *(float *)&double v16 = self->_faceOrientationIndex;
  [v4 encodeFloat:@"faceOrientationIndex" forKey:v16];
  [v4 encodeObject:self->_landmarksOriginatingRequestSpecifier forKey:@"faceLMOReq"];
  [v4 encodeObject:self->_landmarks3DOriginatingRequestSpecifier forKey:@"faceLM3DOReq"];
  [v4 encodeObject:self->_gaze forKey:@"gaze"];
  [v4 encodeObject:self->_faceScreenGaze forKey:@"screengaze"];
}

- (VNFaceObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v104.receiver = self;
  v104.super_class = (Class)VNFaceObservation;
  double v5 = [(VNDetectedObjectObservation *)&v104 initWithCoder:v4];
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  if (objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNFaceObservation")) {
    goto LABEL_23;
  }
  [v4 decodeFloatForKey:@"alignedBBX"];
  v5->_alignedBoundingBox.origin.double x = v9;
  [v4 decodeFloatForKey:@"alignedBBY"];
  v5->_alignedBoundingBox.origin.double y = v10;
  [v4 decodeFloatForKey:@"alignedBBW"];
  v5->_alignedBoundingBox.size.double width = v11;
  [v4 decodeFloatForKey:@"alignedBBH"];
  v5->_alignedBoundingBox.size.double height = v12;
  if ([v4 containsValueForKey:@"unalignedBBX"]
    && [v4 containsValueForKey:@"unalignedBBY"]
    && [v4 containsValueForKey:@"unalignedBBW"])
  {
    int v13 = [v4 containsValueForKey:@"unalignedBBH"];
  }
  else
  {
    int v13 = 0;
  }
  int v14 = [v4 containsValueForKey:@"unalignedBBXAsDouble"];
  if (v14)
  {
    int v14 = [v4 containsValueForKey:@"unalignedBBYAsDouble"];
    if (v14)
    {
      int v14 = [v4 containsValueForKey:@"unalignedBBWAsDouble"];
      if (v14) {
        int v14 = [v4 containsValueForKey:@"unalignedBBHAsDouble"];
      }
    }
  }
  if (v13)
  {
    [v4 decodeFloatForKey:@"unalignedBBX"];
    p_unalignedBoundingBodouble x = &v5->_unalignedBoundingBox;
    v5->_unalignedBoundingBox.origin.double x = v21;
    [v4 decodeFloatForKey:@"unalignedBBY"];
    v5->_unalignedBoundingBox.origin.double y = v23;
    [v4 decodeFloatForKey:@"unalignedBBW"];
    v5->_unalignedBoundingBox.size.double width = v24;
    [v4 decodeFloatForKey:@"unalignedBBH"];
    double v26 = v25;
LABEL_16:
    p_unalignedBoundingBox->size.double height = v26;
    goto LABEL_18;
  }
  if (v14)
  {
    [v4 decodeDoubleForKey:@"unalignedBBXAsDouble"];
    p_unalignedBoundingBodouble x = &v5->_unalignedBoundingBox;
    v5->_unalignedBoundingBox.origin.double x = v27;
    [v4 decodeDoubleForKey:@"unalignedBBYAsDouble"];
    v5->_unalignedBoundingBox.origin.double y = v28;
    [v4 decodeDoubleForKey:@"unalignedBBWAsDouble"];
    v5->_unalignedBoundingBox.size.double width = v29;
    [v4 decodeDoubleForKey:@"unalignedBBHAsDouble"];
    goto LABEL_16;
  }
  VNValidatedLog(1, @"Unaligned face bounding box is not archived, initializing _unalignedBoundingBox with _boundingBox", v15, v16, v17, v18, v19, v20, v100);
  [(VNDetectedObjectObservation *)v5 boundingBox];
  v5->_unalignedBoundingBox.origin.double x = v30;
  v5->_unalignedBoundingBox.origin.double y = v31;
  v5->_unalignedBoundingBox.size.double width = v32;
  v5->_unalignedBoundingBox.size.double height = v33;
LABEL_18:
  uint64_t v34 = [v4 decodeObjectOfClass:v6 forKey:@"landmarks"];
  landmarkPoints = v5->_landmarkPoints;
  v5->_landmarkPoints = (NSData *)v34;

  uint64_t v36 = [v4 decodeObjectOfClass:v6 forKey:@"landmarks65"];
  landmarkPoints65 = v5->_landmarkPoints65;
  v5->_landmarkPoints65 = (NSData *)v36;

  if (!v5->_landmarkPoints65) {
    objc_storeStrong((id *)&v5->_landmarkPoints65, v5->_landmarkPoints);
  }
  uint64_t v38 = [v4 decodeArrayOfObjectsOfClass:v7 forKey:@"precisionEstimates"];
  landmarkPrecisionEstimatesPerPoint = v5->_landmarkPrecisionEstimatesPerPoint;
  v5->_landmarkPrecisionEstimatesPerPoint = (NSArray *)v38;

  unint64_t v40 = [v4 decodeIntegerForKey:@"landmarksConstellation"];
  v5->_landmarksConstellation = v40;
  if (v40 < 3)
  {
    uint64_t v45 = [v4 decodeObjectOfClass:v6 forKey:@"landmarks3D"];
    landmarkPoints3d = v5->_landmarkPoints3d;
    v5->_landmarkPoints3d = (NSData *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:v6 forKey:@"pose"];
    poseData = v5->_poseData;
    v5->_poseData = (NSData *)v47;

    uint64_t v49 = v5->_poseData;
    if (v49)
    {
      if ([(NSData *)v49 length] != 48) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"invalid pose data"];
      }
      if ([v4 containsValueForKey:@"poseOrigReq"])
      {
        uint64_t v50 = [v4 decodeObjectOfClass:v8 forKey:@"poseOrigReq"];
        poseOriginatingRequestSpecifier = v5->_poseOriginatingRequestSpecifier;
        v5->_poseOriginatingRequestSpecifier = (VNRequestSpecifier *)v50;

        if (!v5->_poseOriginatingRequestSpecifier) {
          goto LABEL_23;
        }
      }
      else
      {
        id v103 = 0;
        uint64_t v52 = +[VNRequestSpecifier specifierForRequestClass:objc_opt_class() revision:1 error:&v103];
        id v53 = v103;
        uint64_t v54 = v5->_poseOriginatingRequestSpecifier;
        v5->_poseOriginatingRequestSpecifier = (VNRequestSpecifier *)v52;

        if (!v5->_poseOriginatingRequestSpecifier)
        {
          [v4 failWithError:v53];

          goto LABEL_23;
        }
      }
    }
    uint64_t v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), v7, 0);
    uint64_t v58 = [v4 decodeObjectOfClasses:v57 forKey:@"expressions"];
    expressionsAndScores = v5->_expressionsAndScores;
    v5->_expressionsAndScores = (NSDictionary *)v58;

    [v4 decodeFloatForKey:@"faceIDConfidence"];
    v5->_faceIdConfidence = v60;
    v5->_faceId = [v4 decodeIntegerForKey:@"faceID"];
    uint64_t v61 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceprint"];
    faceprint = v5->_faceprint;
    v5->_faceprint = (VNFaceprint *)v61;

    uint64_t v63 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"torsoprint"];
    torsoprint = v5->_torsoprint;
    v5->_torsoprint = (VNTorsoprint *)v63;

    uint64_t v65 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceTorsoprint"];
    faceTorsoprint = v5->_faceTorsoprint;
    v5->_faceTorsoprint = (VNFaceTorsoprint *)v65;

    v5->_boundingBoxAligned = [v4 decodeBoolForKey:@"hasAlignedBBox"];
    [v4 decodeFloatForKey:@"alignedRotAngle"];
    v5->_alignedRotationAngle = v67;
    uint64_t v68 = [v4 decodeObjectOfClass:v7 forKey:@"roll"];
    roll = v5->_roll;
    v5->_roll = (NSNumber *)v68;

    uint64_t v70 = [v4 decodeObjectOfClass:v7 forKey:@"yaw"];
    yaw = v5->_yaw;
    v5->_yaw = (NSNumber *)v70;

    uint64_t v72 = [v4 decodeObjectOfClass:v7 forKey:@"pitch"];
    pitch = v5->_pitch;
    v5->_pitch = (NSNumber *)v72;

    uint64_t v74 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceRegionMap"];
    faceRegionMap = v5->_faceRegionMap;
    v5->_faceRegionMap = (VNFaceRegionMap *)v74;

    uint64_t v76 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceAttributes"];
    faceAttributes = v5->_faceAttributes;
    v5->_faceAttributes = (VNFaceAttributes *)v76;

    uint64_t v78 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceSmntcSegments"];
    faceSegments = v5->_faceSegments;
    v5->_faceSegments = (VNFaceSegments *)v78;

    v5->_isBlinking = [v4 decodeBoolForKey:@"blinking"];
    [v4 decodeFloatForKey:@"blinkScore"];
    v5->_blinkScore = v80;
    uint64_t v81 = [v4 decodeObjectOfClass:v6 forKey:@"alignedMeanShape"];
    alignedMeanShape = v5->_alignedMeanShape;
    v5->_alignedMeanShape = (NSData *)v81;

    [v4 decodeFloatForKey:@"landmarksScore"];
    v5->_landmarkScore = v83;
    [v4 decodeFloatForKey:@"faceJunkinessIndex"];
    v5->_faceJunkinessIndedouble x = v84;
    uint64_t v85 = [v4 decodeObjectOfClass:v7 forKey:@"faceCaptureQuality"];
    faceCaptureQualitdouble y = v5->_faceCaptureQuality;
    v5->_faceCaptureQualitdouble y = (NSNumber *)v85;

    uint64_t v87 = [v4 decodeObjectOfClass:v8 forKey:@"faceCQOReq"];
    faceCaptureQualityOriginatingRequestSpecifier = v5->_faceCaptureQualityOriginatingRequestSpecifier;
    v5->_faceCaptureQualityOriginatingRequestSpecifier = (VNRequestSpecifier *)v87;

    [v4 decodeFloatForKey:@"faceOrientationIndex"];
    v5->_faceOrientationIndedouble x = v89;
    if ([v4 containsValueForKey:@"faceLMOReq"])
    {
      uint64_t v90 = [v4 decodeObjectOfClass:v8 forKey:@"faceLMOReq"];
      landmarksOriginatingRequestSpecifier = v5->_landmarksOriginatingRequestSpecifier;
      v5->_landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v90;
    }
    else
    {
      if (![v4 containsValueForKey:@"faceLMRequestRev"]) {
        goto LABEL_38;
      }
      id v102 = 0;
      uint64_t v91 = +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), [v4 decodeIntegerForKey:@"faceLMRequestRev"], &v102);
      landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v102;
      v92 = v5->_landmarksOriginatingRequestSpecifier;
      v5->_landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v91;

      if (!v5->_landmarksOriginatingRequestSpecifier)
      {
        [v4 failWithError:landmarksOriginatingRequestSpecifier];
        goto LABEL_22;
      }
    }

LABEL_38:
    if ([v4 containsValueForKey:@"faceLM3DOReq"])
    {
      uint64_t v93 = [v4 decodeObjectOfClass:v8 forKey:@"faceLM3DOReq"];
      landmarksOriginatingRequestSpecifier = v5->_landmarks3DOriginatingRequestSpecifier;
      v5->_landmarks3DOriginatingRequestSpecifier = (VNRequestSpecifier *)v93;
    }
    else
    {
      if (![v4 containsValueForKey:@"faceLM3DRequestRev"])
      {
LABEL_43:
        uint64_t v96 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gaze"];
        gaze = v5->_gaze;
        v5->_gaze = (VNFaceGaze *)v96;

        uint64_t v98 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"screengaze"];
        faceScreenGaze = v5->_faceScreenGaze;
        v5->_faceScreenGaze = (VNFaceScreenGaze *)v98;

        [(VNFaceObservation *)v5 _initLocks];
        float v43 = v5;
        goto LABEL_24;
      }
      id v101 = 0;
      uint64_t v94 = +[VNRequestSpecifier specifierForRequestClass:revision:error:](VNRequestSpecifier, "specifierForRequestClass:revision:error:", objc_opt_class(), [v4 decodeIntegerForKey:@"faceLM3DRequestRev"], &v101);
      landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)v101;
      landmarks3DOriginatingRequestSpecifier = v5->_landmarks3DOriginatingRequestSpecifier;
      v5->_landmarks3DOriginatingRequestSpecifier = (VNRequestSpecifier *)v94;

      if (!v5->_landmarks3DOriginatingRequestSpecifier)
      {
        [v4 failWithError:landmarksOriginatingRequestSpecifier];
        goto LABEL_22;
      }
    }

    goto LABEL_43;
  }
  landmarksOriginatingRequestSpecifier = (VNRequestSpecifier *)objc_msgSend([NSString alloc], "initWithFormat:", @"Data integrity check failed when un-archiving landmarks constellation. Un-archived constellation is out of range: %lu", v5->_landmarksConstellation);
  float v42 = +[VNError errorForInternalErrorWithLocalizedDescription:landmarksOriginatingRequestSpecifier];
  [v4 failWithError:v42];

LABEL_22:
LABEL_23:
  float v43 = 0;
LABEL_24:

  return v43;
}

- (void)_initLocks
{
  self->_cachedLandmarksLock._os_unfair_lock_opaque = 0;
  self->_cachedLandmarks65Lock._os_unfair_lock_opaque = 0;
  self->_cachedLandmarks3dLock._os_unfair_lock_opaque = 0;
}

- (VNFaceObservation)initWithRequestRevision:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNFaceObservation;
  id v3 = [(VNObservation *)&v7 initWithRequestRevision:a3];
  id v4 = v3;
  if (v3)
  {
    [(VNFaceObservation *)v3 _initLocks];
    double v5 = v4;
  }

  return v4;
}

+ (uint64_t)computeYawPitchRollFromPoseMatrix:(__n128)a3 outputYaw:(__n128)a4 outputPitch:(uint64_t)a5 outputRoll:(uint64_t)a6
{
  unint64_t v12 = 0;
  float32x4_t v13 = *(float32x4_t *)MEMORY[0x1E4F149A0];
  float32x4_t v15 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 16);
  v13.i32[0] = 1.0;
  float32x4_t v16 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32);
  float32x4_t v14 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
  v15.i32[1] = -1.0;
  v16.i32[2] = -1.0;
  v26[0] = a1;
  v26[1] = a2;
  v26[2] = a3;
  v26[3] = a4;
  do
  {
    *(float32x4_t *)&v27[v12 / 4] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v13, COERCE_FLOAT(v26[v12 / 0x10])), v15, *(float32x2_t *)&v26[v12 / 0x10], 1), v16, (float32x4_t)v26[v12 / 0x10], 2), v14, (float32x4_t)v26[v12 / 0x10], 3);
    v12 += 16;
  }
  while (v12 != 64);
  if (fabsf(fabsf(*((float *)&v30 + 1)) + -1.0) <= 0.00000011921)
  {
    if (fabsf(*((float *)&v30 + 1) + -1.0) <= 0.00000011921)
    {
      float v21 = atan2f(v28, v27[0]);
      float v20 = 0.0;
      float v18 = 1.5708;
    }
    else
    {
      float v21 = atan2f(-v28, -v27[0]);
      float v20 = 0.0;
      float v18 = -1.5708;
    }
  }
  else
  {
    float v23 = v27[1];
    float v24 = v29;
    long long v25 = v30;
    float v17 = asinf(*((float *)&v30 + 1));
    float v18 = -v17;
    float v19 = cosf(v17);
    float v20 = atan2f(v23 / v19, v24 / v19);
    float v21 = atan2f(*(float *)&v25 / v19, *((float *)&v25 + 2) / v19);
  }
  *a7 = v21;
  *a8 = v18;
  *a9 = v20;
  return 1;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5 roll:(id)a6 yaw:(id)a7
{
  objc_super v7 = objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:alignedBoundingBox:roll:yaw:pitch:", a3, a6, a7, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);

  return (VNFaceObservation *)v7;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5 roll:(id)a6 yaw:(id)a7 pitch:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v14 = a4.size.height;
  double v15 = a4.size.width;
  double v16 = a4.origin.y;
  double v17 = a4.origin.x;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  uint64_t v22 = objc_msgSend((id)objc_opt_class(), "faceObservationWithRequestRevision:boundingBox:andAlignedBoundingBox:", a3, v17, v16, v15, v14, x, y, width, height);
  [v22 setRoll:v19];
  [v22 setYaw:v20];
  [v22 setPitch:v21];

  return (VNFaceObservation *)v22;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox roll:(NSNumber *)roll yaw:(NSNumber *)yaw
{
  uint64_t v6 = objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", requestRevision, roll, yaw, 0, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height);

  return (VNFaceObservation *)v6;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 roll:(id)a5 yaw:(id)a6 pitch:(id)a7 isBoundingBoxAligned:(BOOL)a8 alignedBoundingBox:(CGRect)a9 landmarks:(id)a10 landmarks65:(id)a11 landmarkScore:(float)a12 isBlinking:(BOOL)a13 blinkScore:(float)a14 faceOrientationIndex:(float)a15 faceJunkinessIndex:(float)a16
{
  BOOL v17 = a8;
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  double v24 = a4.size.height;
  double v25 = a4.size.width;
  double v26 = a4.origin.y;
  double v27 = a4.origin.x;
  id v30 = a5;
  id v31 = a6;
  id v32 = a7;
  id v33 = a10;
  id v34 = a11;
  if (v30)
  {
    [v30 floatValue];
    if (v35 >= -3.1416)
    {
      if (v35 < 3.1416) {
        goto LABEL_7;
      }
      uint64_t v36 = &unk_1EF7A81F0;
    }
    else
    {
      uint64_t v36 = &unk_1EF7A81E0;
    }

    id v30 = v36;
  }
LABEL_7:
  if (!v31) {
    goto LABEL_13;
  }
  [v31 floatValue];
  if (v37 <= -1.5708)
  {
    uint64_t v38 = &unk_1EF7A8200;
  }
  else
  {
    if (v37 < 1.5708) {
      goto LABEL_13;
    }
    uint64_t v38 = &unk_1EF7A8210;
  }

  id v31 = v38;
LABEL_13:
  if (!v32) {
    goto LABEL_19;
  }
  [v32 floatValue];
  if (v39 <= -1.5708)
  {
    unint64_t v40 = &unk_1EF7A8200;
  }
  else
  {
    if (v39 < 1.5708) {
      goto LABEL_19;
    }
    unint64_t v40 = &unk_1EF7A8210;
  }

  id v32 = v40;
LABEL_19:
  float v41 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, v27, v26, v25, v24);
  objc_msgSend(v41, "setUnalignedBoundingBox:", v27, v26, v25, v24);
  [v41 setRoll:v30];
  [v41 setYaw:v31];
  [v41 setPitch:v32];
  if (v17)
  {
    [v41 setBoundingBoxAligned:1];
    *(float *)&double v43 = x;
    *(float *)&double v44 = y;
    *(float *)&double v45 = height;
    *(float *)&double v46 = width;
    objc_msgSend(v41, "setAlignedBoundingBox:", v43, v44, v45, v46);
  }
  if (v34)
  {
    uint64_t v47 = [v34 pointsData];
    v48 = [v34 originatingRequestSpecifier];
    [v41 setLandmarkPoints65Data:v47 originatingRequestSpecifier:v48];
  }
  if (v33)
  {
    uint64_t v49 = [v33 pointsData];
    uint64_t v50 = [v33 originatingRequestSpecifier];
    [v41 setLandmarkPointsData:v49 originatingRequestSpecifier:v50];

    objc_msgSend(v41, "setLandmarksConstellation:", objc_msgSend(v33, "constellation"));
    uint64_t v51 = [v33 precisionEstimatesPerPoint];
    [v41 setLandmarkPrecisionEstimatesPerPoint:v51];
  }
  *(float *)&double v42 = a12;
  [v41 setLandmarkScore:v42];
  [v41 setIsBlinking:a13];
  *(float *)&double v52 = a14;
  [v41 setBlinkScore:v52];
  *(float *)&double v53 = a15;
  [v41 setFaceOrientationIndex:v53];
  *(float *)&double v54 = a16;
  [v41 setFaceJunkinessIndex:v54];

  return (VNFaceObservation *)v41;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 roll:(id)a5 yaw:(id)a6 pitch:(id)a7 isBoundingBoxAligned:(BOOL)a8 alignedBoundingBox:(CGRect)a9 landmarks:(id)a10 landmarks65:(id)a11 landmarkScore:(float)a12 isBlinking:(BOOL)a13 blinkScore:(float)a14
{
  LODWORD(v17) = 0;
  BYTE4(v16) = a13;
  *(float *)&uint64_t v16 = a12;
  objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:isBoundingBoxAligned:alignedBoundingBox:landmarks:landmarks65:landmarkScore:isBlinking:blinkScore:faceOrientationIndex:faceJunkinessIndex:", a3, a5, a6, a7, a8, a10, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a9.origin.x, a9.origin.y, a9.size.width, a9.size.height, a11, v16,
    LODWORD(a14),
  double v14 = v17);

  return (VNFaceObservation *)v14;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox roll:(NSNumber *)roll yaw:(NSNumber *)yaw pitch:(NSNumber *)pitch
{
  LODWORD(v10) = 0;
  BYTE4(v9) = 0;
  LODWORD(v9) = 0;
  objc_msgSend(a1, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:isBoundingBoxAligned:alignedBoundingBox:landmarks:landmarks65:landmarkScore:isBlinking:blinkScore:faceOrientationIndex:faceJunkinessIndex:", requestRevision, roll, yaw, pitch, 0, 0, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24), 0, v9,
    0,
  objc_super v7 = v10);

  return (VNFaceObservation *)v7;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 faceprint:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a5;
  unint64_t v12 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, x, y, width, height);
  objc_msgSend(v12, "setUnalignedBoundingBox:", x, y, width, height);
  [v12 setFaceprint:v11];

  return (VNFaceObservation *)v12;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 unalignedBoundingBox:(CGRect)a4 alignedBoundingBox:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  float32x4_t v13 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend(v13, "setUnalignedBoundingBox:", v12, v11, v10, v9);
  *(float *)&double v14 = x;
  *(float *)&double v15 = y;
  *(float *)&double v16 = width;
  *(float *)&double v17 = height;
  objc_msgSend(v13, "setAlignedBoundingBox:", v14, v15, v17, v16);
  [v13 setBoundingBoxAligned:1];

  return (VNFaceObservation *)v13;
}

+ (VNFaceObservation)faceObservationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4 andAlignedBoundingBox:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  float32x4_t v13 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  objc_msgSend(v13, "setUnalignedBoundingBox:", v12, v11, v10, v9);
  *(float *)&double v14 = x;
  *(float *)&double v15 = y;
  *(float *)&double v16 = width;
  *(float *)&double v17 = height;
  objc_msgSend(v13, "setAlignedBoundingBox:", v14, v15, v17, v16);
  [v13 setBoundingBoxAligned:1];

  return (VNFaceObservation *)v13;
}

+ (VNFaceObservation)observationWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___VNFaceObservation;
  id v4 = objc_msgSendSuper2(&v6, sel_observationWithRequestRevision_boundingBox_, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  [v4 boundingBox];
  objc_msgSend(v4, "setUnalignedBoundingBox:");

  return (VNFaceObservation *)v4;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectFaceRectanglesRequest";
}

+ (BOOL)_exifOrientationFromFaceRollAngle:(float)a3 exifOrientation:(int *)a4 error:(id *)a5
{
  if (a4)
  {
    if (a3 >= -45.0 && a3 < 45.0)
    {
      BOOL result = 1;
      *a4 = 1;
      return result;
    }
    if (a3 >= -135.0 && a3 < -45.0)
    {
      int v8 = 8;
      goto LABEL_19;
    }
    if (a3 < -135.0 && a3 >= -180.0 || a3 >= 135.0 && a3 < 180.0)
    {
      int v8 = 3;
LABEL_19:
      *a4 = v8;
      return 1;
    }
    if (a3 >= 45.0 && a3 < 135.0)
    {
      int v8 = 6;
      goto LABEL_19;
    }
    if (a5)
    {
      double v11 = objc_msgSend(NSNumber, "numberWithFloat:");
      *a5 = +[VNError errorForInvalidArgument:v11 named:@"face orientation"];
    }
  }
  else if (a5)
  {
    id v9 = +[VNError errorWithCode:14 message:@"exifOrientation cannot be null"];
    BOOL result = 0;
    *a5 = v9;
    return result;
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end