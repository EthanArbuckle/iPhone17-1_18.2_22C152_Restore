@interface VNFaceLandmarks3D
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
+ (unint64_t)landmarkPointSizeInBytes;
- (VNFaceLandmarkRegion3D)allPoints;
- (VNFaceLandmarkRegion3D)faceContour;
- (VNFaceLandmarkRegion3D)innerLips;
- (VNFaceLandmarkRegion3D)leftEye;
- (VNFaceLandmarkRegion3D)leftEyebrow;
- (VNFaceLandmarkRegion3D)medianLine;
- (VNFaceLandmarkRegion3D)nose;
- (VNFaceLandmarkRegion3D)noseCrest;
- (VNFaceLandmarkRegion3D)outerLips;
- (VNFaceLandmarkRegion3D)rightEye;
- (VNFaceLandmarkRegion3D)rightEyebrow;
- (VNFaceLandmarks3D)initWithCoder:(id)a3;
- (VNFaceLandmarks3D)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 userFacingBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 landmarkScore:(float)a8;
- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4;
- (void)_initLocks;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceLandmarks3D

- (void).cxx_destruct
{
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

- (VNFaceLandmarkRegion3D)innerLips
{
  p_innerLipsLock = &self->_innerLipsLock;
  os_unfair_lock_lock(&self->_innerLipsLock);
  if (!self->_innerLips)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A41244A8 count:6];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 6);
    innerLips = self->_innerLips;
    self->_innerLips = v7;
  }
  os_unfair_lock_unlock(p_innerLipsLock);
  v9 = self->_innerLips;

  return v9;
}

- (VNFaceLandmarkRegion3D)outerLips
{
  p_outerLipsLock = &self->_outerLipsLock;
  os_unfair_lock_lock(&self->_outerLipsLock);
  if (!self->_outerLips)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4124448 count:10];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 10);
    outerLips = self->_outerLips;
    self->_outerLips = v7;
  }
  os_unfair_lock_unlock(p_outerLipsLock);
  v9 = self->_outerLips;

  return v9;
}

- (VNFaceLandmarkRegion3D)medianLine
{
  p_medianLineLock = &self->_medianLineLock;
  os_unfair_lock_lock(&self->_medianLineLock);
  if (!self->_medianLine)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4124508 count:9];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 9);
    medianLine = self->_medianLine;
    self->_medianLine = v7;
  }
  os_unfair_lock_unlock(p_medianLineLock);
  v9 = self->_medianLine;

  return v9;
}

- (VNFaceLandmarkRegion3D)noseCrest
{
  p_noseCrestLock = &self->_noseCrestLock;
  os_unfair_lock_lock(&self->_noseCrestLock);
  if (!self->_noseCrest)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4124028 count:3];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 3);
    noseCrest = self->_noseCrest;
    self->_noseCrest = v7;
  }
  os_unfair_lock_unlock(p_noseCrestLock);
  v9 = self->_noseCrest;

  return v9;
}

- (VNFaceLandmarkRegion3D)nose
{
  p_noseLock = &self->_noseLock;
  os_unfair_lock_lock(&self->_noseLock);
  if (!self->_nose)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4124088 count:9];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 9);
    nose = self->_nose;
    self->_nose = v7;
  }
  os_unfair_lock_unlock(p_noseLock);
  v9 = self->_nose;

  return v9;
}

- (VNFaceLandmarkRegion3D)rightEyebrow
{
  p_rightEyebrowLock = &self->_rightEyebrowLock;
  os_unfair_lock_lock(&self->_rightEyebrowLock);
  if (!self->_rightEyebrow)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A41242C8 count:4];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 4);
    rightEyebrow = self->_rightEyebrow;
    self->_rightEyebrow = v7;
  }
  os_unfair_lock_unlock(p_rightEyebrowLock);
  v9 = self->_rightEyebrow;

  return v9;
}

- (VNFaceLandmarkRegion3D)leftEyebrow
{
  p_leftEyebrowLock = &self->_leftEyebrowLock;
  os_unfair_lock_lock(&self->_leftEyebrowLock);
  if (!self->_leftEyebrow)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4124148 count:4];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 4);
    leftEyebrow = self->_leftEyebrow;
    self->_leftEyebrow = v7;
  }
  os_unfair_lock_unlock(p_leftEyebrowLock);
  v9 = self->_leftEyebrow;

  return v9;
}

- (VNFaceLandmarkRegion3D)rightEye
{
  p_rightEyeLock = &self->_rightEyeLock;
  os_unfair_lock_lock(&self->_rightEyeLock);
  if (!self->_rightEye)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4124328 count:8];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 8);
    rightEye = self->_rightEye;
    self->_rightEye = v7;
  }
  os_unfair_lock_unlock(p_rightEyeLock);
  v9 = self->_rightEye;

  return v9;
}

- (VNFaceLandmarkRegion3D)leftEye
{
  p_leftEyeLock = &self->_leftEyeLock;
  os_unfair_lock_lock(&self->_leftEyeLock);
  if (!self->_leftEye)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A41241A8 count:8];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 8);
    leftEye = self->_leftEye;
    self->_leftEye = v7;
  }
  os_unfair_lock_unlock(p_leftEyeLock);
  v9 = self->_leftEye;

  return v9;
}

- (VNFaceLandmarkRegion3D)faceContour
{
  p_faceContourLock = &self->_faceContourLock;
  os_unfair_lock_lock(&self->_faceContourLock);
  if (!self->_faceContour)
  {
    v4 = [(VNFaceLandmarks3D *)self _createPointArray:&unk_1A4123F68 count:11];
    v5 = [VNFaceLandmarkRegion3D alloc];
    v6 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v7 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v5, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v6, v4, 11);
    faceContour = self->_faceContour;
    self->_faceContour = v7;
  }
  os_unfair_lock_unlock(p_faceContourLock);
  v9 = self->_faceContour;

  return v9;
}

- (VNFaceLandmarkRegion3D)allPoints
{
  p_allPointsLock = &self->_allPointsLock;
  os_unfair_lock_lock(&self->_allPointsLock);
  if (self->_allPoints)
  {
LABEL_2:
    os_unfair_lock_unlock(p_allPointsLock);
    v4 = self->_allPoints;
    goto LABEL_3;
  }
  unint64_t v6 = [(VNFaceLandmarks *)self pointCount];
  v7 = +[VNFaceGeometryEstimator allLandmarksPointsIndexes];
  v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v14, (const void *)*v7, v7[1], (v7[1] - *v7) >> 2);
  v8 = v14;
  if (v6 == (v15 - (uint64_t)v14) >> 2)
  {
    v9 = [(VNFaceLandmarks3D *)self _createPointArray:v14 count:v6];
    v10 = [VNFaceLandmarkRegion3D alloc];
    v11 = [(VNFaceLandmarks *)self originatingRequestSpecifier];
    [(VNFaceLandmarks *)self userFacingBBox];
    v12 = -[VNFaceLandmarkRegion3D initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:](v10, "initWithOriginatingRequestSpecifier:faceBoundingBox:points:pointCount:", v11, v9, v6);
    allPoints = self->_allPoints;
    self->_allPoints = v12;

    if (v8) {
      operator delete(v8);
    }
    goto LABEL_2;
  }
  if (v14) {
    operator delete(v14);
  }
  os_unfair_lock_unlock(p_allPointsLock);
  v4 = 0;
LABEL_3:

  return v4;
}

- (void)_createPointArray:(const int *)a3 count:(unint64_t)a4
{
  v5 = a3;
  +[VNError VNAssert:a3 != 0 log:@"pointIndices must not be nullptr"];
  v7 = malloc_type_calloc(0x10uLL, a4, 0x6F0307D7uLL);
  id v8 = [(VNFaceLandmarks *)self pointsData];
  uint64_t v9 = [v8 bytes];

  unint64_t v10 = [(VNFaceLandmarks *)self pointCount];
  if (a4)
  {
    for (i = v7; ; i += 2)
    {
      unint64_t v13 = *v5++;
      int v12 = v13;
      if (v10 <= v13) {
        break;
      }
      v14 = (_DWORD *)(v9 + 12 * v12);
      uint64_t v15 = i[1];
      LODWORD(v16) = *v14;
      *(_DWORD *)i = *v14;
      HIDWORD(v16) = v14[1];
      *((_DWORD *)i + 2) = v15;
      void *i = v16;
      *((_DWORD *)i + 2) = v14[2];
      void *i = v16;
      if (!--a4) {
        return v7;
      }
    }
    free(v7);
    return 0;
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNFaceLandmarks3D;
  [(VNFaceLandmarks *)&v5 encodeWithCoder:v4];
  [v4 encodeInt32:0 forKey:@"VNFaceLandmarks3D"];
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
}

- (VNFaceLandmarks3D)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VNFaceLandmarks3D;
  objc_super v5 = [(VNFaceLandmarks *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeInt32ForKey:@"VNFaceLandmarks3D"];
    if (v6)
    {
      v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarks3D object due to coding version mismatch: Currently supported: %u; encoded: %u",
                     0,
                     v6);
      id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
      [v4 failWithError:v8];

      objc_super v5 = 0;
    }
    else
    {
      [(VNFaceLandmarks3D *)v5 _initLocks];
    }
  }

  return v5;
}

- (VNFaceLandmarks3D)initWithOriginatingRequestSpecifier:(id)a3 pointsData:(id)a4 pointCount:(unint64_t)a5 userFacingBBox:(CGRect)a6 alignedBBox:(_Geometry2D_rect2D_)a7 landmarkScore:(float)a8
{
  float width = a7.size.width;
  float height = a7.size.height;
  float y = a7.origin.y;
  float x = a7.origin.x;
  double v11 = a6.size.height;
  double v12 = a6.size.width;
  double v13 = a6.origin.y;
  double v14 = a6.origin.x;
  id v18 = a3;
  id v19 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VNFaceLandmarks3D;
  *(float *)&double v20 = x;
  *(float *)&double v21 = y;
  *(float *)&double v22 = height;
  *(float *)&double v23 = width;
  v24 = -[VNFaceLandmarks initWithOriginatingRequestSpecifier:pointsData:pointCount:userFacingBBox:alignedBBox:landmarkScore:](&v30, sel_initWithOriginatingRequestSpecifier_pointsData_pointCount_userFacingBBox_alignedBBox_landmarkScore_, v18, v19, a5, v14, v13, v12, v11, v20, v21, v22, v23, LODWORD(a8));
  v25 = v24;
  if (v24)
  {
    [(VNFaceLandmarks3D *)v24 _initLocks];
    v26 = v25;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectFace3DLandmarksRequest";
}

+ (unint64_t)landmarkPointSizeInBytes
{
  return 12;
}

@end