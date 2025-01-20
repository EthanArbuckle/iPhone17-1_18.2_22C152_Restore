@interface VNFaceLandmarks2D
+ (BOOL)supportsSecureCoding;
+ (id)_createNSArrayFrom:(id)a3 withPointIndices:(const int *)a4 andPointCount:(unint64_t)a5;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (unint64_t)landmarkPointSizeInBytes;
- (BOOL)isEqual:(id)a3;
- (NSArray)precisionEstimatesPerPoint;
- (VNFaceLandmarkRegion2D)allPoints;
- (VNFaceLandmarkRegion2D)faceContour;
- (VNFaceLandmarkRegion2D)innerLips;
- (VNFaceLandmarkRegion2D)leftEye;
- (VNFaceLandmarkRegion2D)leftEyebrow;
- (VNFaceLandmarkRegion2D)leftPupil;
- (VNFaceLandmarkRegion2D)medianLine;
- (VNFaceLandmarkRegion2D)nose;
- (VNFaceLandmarkRegion2D)noseCrest;
- (VNFaceLandmarkRegion2D)outerLips;
- (VNFaceLandmarkRegion2D)rightEye;
- (VNFaceLandmarkRegion2D)rightEyebrow;
- (VNFaceLandmarkRegion2D)rightPupil;
- (VNFaceLandmarks2D)initWithCoder:(id)a3;
- (VNFaceLandmarks2D)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 constellation:(unint64_t)a6 precisionEstimatesPerPoint:(id)a7 userFacingBBox:(CGRect)a8 alignedBBox:(_Geometry2D_rect2D_)a9 landmarkScore:(float)a10;
- (id)_createFaceLandmarks2DRegionOfPoints:(int64_t)a3 fromPointIndexes:(const int *)a4 andPointCount:(unint64_t)a5;
- (unint64_t)constellation;
- (unint64_t)hash;
- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4;
- (void)_initLocks;
- (void)encodeWithCoder:(id)a3;
- (void)setPrecisionEstimatesPerPoint:(id)a3;
@end

@implementation VNFaceLandmarks2D

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precisionEstimatesPerPoint, 0);
  objc_storeStrong((id *)&self->_rightPupil, 0);
  objc_storeStrong((id *)&self->_leftPupil, 0);
  objc_storeStrong((id *)&self->_innerLips, 0);
  objc_storeStrong((id *)&self->_outerLips, 0);
  objc_storeStrong((id *)&self->_medianLine, 0);
  objc_storeStrong((id *)&self->_noseCrest, 0);
  objc_storeStrong((id *)&self->_nose, 0);
  objc_storeStrong((id *)&self->_rightEyebrow, 0);
  objc_storeStrong((id *)&self->_leftEyebrow, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);
  objc_storeStrong((id *)&self->_leftEye, 0);
  objc_storeStrong((id *)&self->_faceContour, 0);

  objc_storeStrong((id *)&self->_allPoints, 0);
}

- (void)setPrecisionEstimatesPerPoint:(id)a3
{
}

- (NSArray)precisionEstimatesPerPoint
{
  return (NSArray *)objc_getProperty(self, a2, 304, 1);
}

- (unint64_t)constellation
{
  return self->_constellation;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNFaceLandmarks2D *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)VNFaceLandmarks2D;
    if ([(VNFaceLandmarks *)&v11 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      unint64_t v6 = [(VNFaceLandmarks2D *)self constellation];
      if (v6 == [(VNFaceLandmarks2D *)v5 constellation])
      {
        v7 = [(VNFaceLandmarks2D *)self precisionEstimatesPerPoint];
        v8 = [(VNFaceLandmarks2D *)v5 precisionEstimatesPerPoint];
        char v9 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (VNFaceLandmarkRegion2D)rightPupil
{
  p_rightPupilLock = &self->_rightPupilLock;
  os_unfair_lock_lock(&self->_rightPupilLock);
  if (!self->_rightPupil)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var24 andPointCount:v4->var23];
    rightPupil = self->_rightPupil;
    self->_rightPupil = v5;
  }
  os_unfair_lock_unlock(p_rightPupilLock);
  v7 = self->_rightPupil;

  return v7;
}

- (VNFaceLandmarkRegion2D)leftPupil
{
  p_leftPupilLock = &self->_leftPupilLock;
  os_unfair_lock_lock(&self->_leftPupilLock);
  if (!self->_leftPupil)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var16 andPointCount:v4->var15];
    leftPupil = self->_leftPupil;
    self->_leftPupil = v5;
  }
  os_unfair_lock_unlock(p_leftPupilLock);
  v7 = self->_leftPupil;

  return v7;
}

- (VNFaceLandmarkRegion2D)innerLips
{
  p_innerLipsLock = &self->_innerLipsLock;
  os_unfair_lock_lock(&self->_innerLipsLock);
  if (!self->_innerLips)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var30 andPointCount:v4->var29];
    innerLips = self->_innerLips;
    self->_innerLips = v5;
  }
  os_unfair_lock_unlock(p_innerLipsLock);
  v7 = self->_innerLips;

  return v7;
}

- (VNFaceLandmarkRegion2D)outerLips
{
  p_outerLipsLock = &self->_outerLipsLock;
  os_unfair_lock_lock(&self->_outerLipsLock);
  if (!self->_outerLips)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var28 andPointCount:v4->var27];
    outerLips = self->_outerLips;
    self->_outerLips = v5;
  }
  os_unfair_lock_unlock(p_outerLipsLock);
  v7 = self->_outerLips;

  return v7;
}

- (VNFaceLandmarkRegion2D)medianLine
{
  p_medianLineLock = &self->_medianLineLock;
  os_unfair_lock_lock(&self->_medianLineLock);
  if (!self->_medianLine)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:1 fromPointIndexes:v4->var32 andPointCount:v4->var31];
    medianLine = self->_medianLine;
    self->_medianLine = v5;
  }
  os_unfair_lock_unlock(p_medianLineLock);
  v7 = self->_medianLine;

  return v7;
}

- (VNFaceLandmarkRegion2D)noseCrest
{
  p_noseCrestLock = &self->_noseCrestLock;
  os_unfair_lock_lock(&self->_noseCrestLock);
  if (!self->_noseCrest)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:1 fromPointIndexes:v4->var6 andPointCount:v4->var5];
    noseCrest = self->_noseCrest;
    self->_noseCrest = v5;
  }
  os_unfair_lock_unlock(p_noseCrestLock);
  v7 = self->_noseCrest;

  return v7;
}

- (VNFaceLandmarkRegion2D)nose
{
  p_noseLock = &self->_noseLock;
  os_unfair_lock_lock(&self->_noseLock);
  if (!self->_nose)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var8 andPointCount:v4->var7];
    nose = self->_nose;
    self->_nose = v5;
  }
  os_unfair_lock_unlock(p_noseLock);
  v7 = self->_nose;

  return v7;
}

- (VNFaceLandmarkRegion2D)rightEyebrow
{
  p_rightEyebrowLock = &self->_rightEyebrowLock;
  os_unfair_lock_lock(&self->_rightEyebrowLock);
  if (!self->_rightEyebrow)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:1 fromPointIndexes:v4->var20 andPointCount:v4->var19];
    rightEyebrow = self->_rightEyebrow;
    self->_rightEyebrow = v5;
  }
  os_unfair_lock_unlock(p_rightEyebrowLock);
  v7 = self->_rightEyebrow;

  return v7;
}

- (VNFaceLandmarkRegion2D)leftEyebrow
{
  p_leftEyebrowLock = &self->_leftEyebrowLock;
  os_unfair_lock_lock(&self->_leftEyebrowLock);
  if (!self->_leftEyebrow)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:1 fromPointIndexes:v4->var12 andPointCount:v4->var11];
    leftEyebrow = self->_leftEyebrow;
    self->_leftEyebrow = v5;
  }
  os_unfair_lock_unlock(p_leftEyebrowLock);
  v7 = self->_leftEyebrow;

  return v7;
}

- (VNFaceLandmarkRegion2D)rightEye
{
  p_rightEyeLock = &self->_rightEyeLock;
  os_unfair_lock_lock(&self->_rightEyeLock);
  if (!self->_rightEye)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var22 andPointCount:v4->var21];
    rightEye = self->_rightEye;
    self->_rightEye = v5;
  }
  os_unfair_lock_unlock(p_rightEyeLock);
  v7 = self->_rightEye;

  return v7;
}

- (VNFaceLandmarkRegion2D)leftEye
{
  p_leftEyeLock = &self->_leftEyeLock;
  os_unfair_lock_lock(&self->_leftEyeLock);
  if (!self->_leftEye)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createFaceLandmarks2DRegionOfPoints:2 fromPointIndexes:v4->var14 andPointCount:v4->var13];
    leftEye = self->_leftEye;
    self->_leftEye = v5;
  }
  os_unfair_lock_unlock(p_leftEyeLock);
  v7 = self->_leftEye;

  return v7;
}

- (id)_createFaceLandmarks2DRegionOfPoints:(int64_t)a3 fromPointIndexes:(const int *)a4 andPointCount:(unint64_t)a5
{
  char v9 = objc_opt_class();
  v10 = [(VNFaceLandmarks2D *)self precisionEstimatesPerPoint];
  objc_super v11 = [v9 _createNSArrayFrom:v10 withPointIndices:a4 andPointCount:a5];

  v12 = [(VNFaceLandmarks2D *)self _createPointArray:a4 count:a5];
  v13 = [VNFaceLandmarkRegion2D alloc];
  v14 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
  [(VNFaceLandmarks *)self userFacingBBox];
  v15 = -[VNFaceLandmarkRegion2D initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:](v13, "initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:", v14, a3, v12, a5, v11);

  return v15;
}

- (VNFaceLandmarkRegion2D)faceContour
{
  p_faceContourLock = &self->_faceContourLock;
  os_unfair_lock_lock(&self->_faceContourLock);
  if (!self->_faceContour)
  {
    v4 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:[(VNFaceLandmarks2D *)self constellation]];
    v5 = [(VNFaceLandmarks2D *)self _createPointArray:v4->var2 count:v4->var1];
    unint64_t v6 = objc_opt_class();
    v7 = [(VNFaceLandmarks2D *)self precisionEstimatesPerPoint];
    v8 = [v6 _createNSArrayFrom:v7 withPointIndices:v4->var2 andPointCount:v4->var1];

    char v9 = [VNFaceLandmarkRegion2D alloc];
    v10 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    objc_super v11 = -[VNFaceLandmarkRegion2D initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:](v9, "initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:", v10, 1, v5, v4->var1, v8);
    faceContour = self->_faceContour;
    self->_faceContour = v11;
  }
  os_unfair_lock_unlock(p_faceContourLock);
  v13 = self->_faceContour;

  return v13;
}

- (VNFaceLandmarkRegion2D)allPoints
{
  p_allPointsLock = &self->_allPointsLock;
  os_unfair_lock_lock(&self->_allPointsLock);
  if (self->_allPoints) {
    goto LABEL_4;
  }
  unint64_t v4 = [(VNFaceLandmarks *)self pointCount];
  v5 = +[VNFaceLandmarkDetector allLandmarksPointsIndexesForConstellation:[(VNFaceLandmarks2D *)self constellation]];
  if (v4 == (uint64_t)(v5[1] - *v5) >> 2)
  {
    unint64_t v6 = -[VNFaceLandmarks2D _createPointArray:count:](self, "_createPointArray:count:");
    v7 = [VNFaceLandmarkRegion2D alloc];
    v8 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17 = [(VNFaceLandmarks2D *)self precisionEstimatesPerPoint];
    v18 = -[VNFaceLandmarkRegion2D initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:](v7, "initWithOriginatingRequestSpecifier:faceBoundingBox:pointsClassification:points:pointCount:precisionEstimatesPerPoint:", v8, 0, v6, v4, v17, v10, v12, v14, v16);
    allPoints = self->_allPoints;
    self->_allPoints = v18;

LABEL_4:
    os_unfair_lock_unlock(p_allPointsLock);
    v20 = self->_allPoints;
    goto LABEL_5;
  }
  os_unfair_lock_unlock(p_allPointsLock);
  v20 = 0;
LABEL_5:

  return v20;
}

- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4
{
  v5 = a3;
  +[VNError VNAssert:a3 != 0 log:@"pointIndices must not be nullptr"];
  v7 = malloc_type_calloc(8uLL, a4, 0x10C097uLL);
  id v8 = [(VNFaceLandmarks *)self pointsData];
  uint64_t v9 = [v8 bytes];

  if ([(VNFaceLandmarks *)self isUserFacingBBoxEquivalentToAlignedBBox])
  {
    double v10 = 1.0;
    double v11 = 0.0;
    double v12 = 1.0;
    double v13 = 0.0;
  }
  else
  {
    [(VNFaceLandmarks *)self alignedBBox];
    double v15 = v14;
    [(VNFaceLandmarks *)self userFacingBBox];
    double v10 = v15 / v16;
    [(VNFaceLandmarks *)self alignedBBox];
    double v18 = v17;
    [(VNFaceLandmarks *)self userFacingBBox];
    double v12 = v18 / v19;
    [(VNFaceLandmarks *)self alignedBBox];
    double v21 = v20;
    [(VNFaceLandmarks *)self userFacingBBox];
    double v23 = v21 - v22;
    [(VNFaceLandmarks *)self userFacingBBox];
    double v11 = v23 / v24;
    [(VNFaceLandmarks *)self alignedBBox];
    double v26 = v25;
    [(VNFaceLandmarks *)self userFacingBBox];
    double v28 = v26 - v27;
    [(VNFaceLandmarks *)self userFacingBBox];
    double v13 = v28 / v29;
  }
  unint64_t v30 = [(VNFaceLandmarks *)self pointCount];
  if (a4)
  {
    for (i = v7; ; i += 2)
    {
      unint64_t v33 = *v5++;
      unint64_t v32 = v33;
      if (v30 <= v33) {
        break;
      }
      v34 = (float *)(v9 + 8 * v32);
      *(float *)&uint64_t v35 = v11 + *v34 * v10;
      _DWORD *i = v35;
      float v36 = v13 + v34[1] * v12;
      *((float *)&v35 + 1) = v36;
      *(void *)i = v35;
      if (!--a4) {
        return v7;
      }
    }
    free(v7);
    return 0;
  }
  return v7;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)VNFaceLandmarks2D;
  return [(NSArray *)self->_precisionEstimatesPerPoint hash] ^ __ROR8__(LODWORD(self->_constellation) ^ __ROR8__([(VNFaceLandmarks *)&v3 hash], 51), 51);
}

- (void)_initLocks
{
  self->_allPointsLock._os_unfair_lock_opaque = 0;
  self->_faceContourLock._os_unfair_lock_opaque = 0;
  self->_leftEyeLock._os_unfair_lock_opaque = 0;
  self->_rightEyeLock._os_unfair_lock_opaque = 0;
  self->_leftEyebrowLock._os_unfair_lock_opaque = 0;
  self->_rightEyebrowLock._os_unfair_lock_opaque = 0;
  self->_noseLock._os_unfair_lock_opaque = 0;
  self->_noseCrestLock._os_unfair_lock_opaque = 0;
  self->_medianLineLock._os_unfair_lock_opaque = 0;
  self->_outerLipsLock._os_unfair_lock_opaque = 0;
  self->_innerLipsLock._os_unfair_lock_opaque = 0;
  self->_leftPupilLock._os_unfair_lock_opaque = 0;
  self->_rightPupilLock._os_unfair_lock_opaque = 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNFaceLandmarks2D;
  [(VNFaceLandmarks *)&v5 encodeWithCoder:v4];
  [v4 encodeInt32:0 forKey:@"VNFaceLandmarks2D"];
  [v4 encodeInteger:self->_constellation forKey:@"FLMs2D_CType"];
  [v4 encodeObject:self->_precisionEstimatesPerPoint forKey:@"FLMs2D_PtsAE"];
}

- (VNFaceLandmarks2D)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VNFaceLandmarks2D;
  objc_super v5 = [(VNFaceLandmarks *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeInt32ForKey:@"VNFaceLandmarks2D"];
    if (v6)
    {
      v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarks2D object due to coding version mismatch:Currently supported: %u; encoded: %u",
                     0,
                     v6);
      id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
      [v4 failWithError:v8];
    }
    else
    {
      if ([v4 containsValueForKey:@"FLMs2D_CType"]) {
        uint64_t v9 = [v4 decodeIntegerForKey:@"FLMs2D_CType"];
      }
      else {
        uint64_t v9 = 1;
      }
      v5->_constellation = v9;
      double v10 = +[VNFaceLandmarkDetector landmarksMeshPartsForConstellation:](VNFaceLandmarkDetector, "landmarksMeshPartsForConstellation:");
      if (v5->_constellation == 1) {
        uint64_t var0 = v10->var0 + 2;
      }
      else {
        uint64_t var0 = v10->var0;
      }
      uint64_t v12 = [(VNFaceLandmarks *)v5 pointCount];
      if (v12 == var0)
      {
        double v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = objc_opt_class();
        double v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
        uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"FLMs2D_PtsAE"];
        precisionEstimatesPerPoint = v5->_precisionEstimatesPerPoint;
        v5->_precisionEstimatesPerPoint = (NSArray *)v16;

        [(VNFaceLandmarks2D *)v5 _initLocks];
LABEL_14:

        goto LABEL_15;
      }
      v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Unexpected number of landmark points: %lu; expected: %lu",
                     v12,
                     var0);
      id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
      [v4 failWithError:v8];
    }

    double v15 = v5;
    objc_super v5 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (VNFaceLandmarks2D)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 constellation:(unint64_t)a6 precisionEstimatesPerPoint:(id)a7 userFacingBBox:(CGRect)a8 alignedBBox:(_Geometry2D_rect2D_)a9 landmarkScore:(float)a10
{
  float width = a9.size.width;
  float height = a9.size.height;
  float y = a9.origin.y;
  float x = a9.origin.x;
  double v17 = a8.size.height;
  double v18 = a8.size.width;
  double v19 = a8.origin.y;
  double v20 = a8.origin.x;
  id v22 = a3;
  id v23 = a4;
  id v24 = a7;
  v35.receiver = self;
  v35.super_class = (Class)VNFaceLandmarks2D;
  *(float *)&double v25 = x;
  *(float *)&double v26 = y;
  *(float *)&double v27 = height;
  *(float *)&double v28 = width;
  double v29 = -[VNFaceLandmarks initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](&v35, sel_initWithOriginatingRequestSpecifier_pointsData_pointCount_userFacingBBox_alignedBBox_landmarkScore_, v22, v23, a5, v20, v19, v18, v17, v25, v26, v27, v28, LODWORD(a10));
  unint64_t v30 = v29;
  if (v29)
  {
    v29->_constellation = a6;
    objc_storeStrong((id *)&v29->_precisionEstimatesPerPoint, a7);
    [(VNFaceLandmarks2D *)v30 _initLocks];
    v31 = v30;
  }

  return v30;
}

+ (id)_createNSArrayFrom:(id)a3 withPointIndices:(const int *)a4 andPointCount:(unint64_t)a5
{
  id v7 = a3;
  if (v7)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a5];
    if (a5)
    {
      uint64_t v9 = 0;
      do
      {
        double v10 = [v7 objectAtIndexedSubscript:a4[v9]];
        [v8 setObject:v10 atIndexedSubscript:v9];

        ++v9;
      }
      while (a5 != v9);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectFaceLandmarksRequest";
}

+ (unint64_t)landmarkPointSizeInBytes
{
  return 8;
}

@end