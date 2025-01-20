@interface VNDetectedObjectObservation
+ (BOOL)boundingBoxIsCalculatedProperty;
+ (BOOL)supportsSecureCoding;
+ (VNDetectedObjectObservation)observationWithBoundingBox:(CGRect)boundingBox;
+ (VNDetectedObjectObservation)observationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)providesBoundsNormalizedToROI;
- (CGRect)boundingBox;
- (CGRect)boundingBoxInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (NSUUID)groupId;
- (NSUUID)identifier;
- (VNDetectedObjectObservation)initWithCoder:(id)a3;
- (VNDetectedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4;
- (VNDetectedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 groupId:(id)a5;
- (VNDetectedObjectObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4;
- (VNPixelBufferObservation)globalSegmentationMask;
- (VNPixelBufferObservation)instanceSegmentationMask;
- (id)debugQuickLookObject;
- (id)description;
- (id)vn_cloneObject;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupId:(uint64_t)a1;
- (void)setIdentifier:(id)a3;
- (void)setInstanceSegmentationMask:(uint64_t)a1;
@end

@implementation VNDetectedObjectObservation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceSegmentationMask, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_globalSegmentationMask, 0);

  objc_storeStrong((id *)&self->_groupId, 0);
}

- (VNPixelBufferObservation)instanceSegmentationMask
{
  return self->_instanceSegmentationMask;
}

- (void)setIdentifier:(id)a3
{
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 144, 1);
}

- (VNPixelBufferObservation)globalSegmentationMask
{
  return self->_globalSegmentationMask;
}

- (NSUUID)groupId
{
  return self->_groupId;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)providesBoundsNormalizedToROI
{
  v2 = [(VNObservation *)self originatingRequestSpecifier];
  char v3 = [v2 observationProvidesBoundsNormalizedToROI];

  return v3;
}

- (id)debugQuickLookObject
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(VNDetectedObjectObservation *)self boundingBox];
  CGPathRef v3 = CGPathCreateWithRect(v13, MEMORY[0x1E4F1DAB8]);
  if (v3)
  {
    v4 = v3;
    v9.receiver = self;
    v9.super_class = (Class)VNDetectedObjectObservation;
    v5 = [(VNObservation *)&v9 debugQuickLookObject];
    if (v5)
    {
      v10[0] = xmmword_1A4125568;
      v10[1] = unk_1A4125578;
      v6 = (CGColor *)VNDebugColorFromValues((const CGFloat *)v10);
      VNDebugImageRenderNormalizedCGPathOnImage((uint64_t)v4, v5, v6);
    }
    else
    {
      VNDebugPathFromNormalizedCGPath((uint64_t)v4, 512.0, 512.0);
    v7 = };

    CGPathRelease(v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VNDetectedObjectObservation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VNDetectedObjectObservation;
    if ([(VNObservation *)&v10 isEqual:v4] && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v5 = v4;
      if (([(id)objc_opt_class() boundingBoxIsCalculatedProperty] & 1) != 0
        || CGRectEqualToRect(self->_boundingBox, v5[3]))
      {
        v6 = [(VNDetectedObjectObservation *)self groupId];
        v7 = [(CGRect *)v5 groupId];
        char v8 = VisionCoreEqualOrNilObjects();
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v18.receiver = self;
  v18.super_class = (Class)VNDetectedObjectObservation;
  id v3 = [(VNObservation *)&v18 hash];
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  char v8 = [(VNDetectedObjectObservation *)self groupId];
  uint64_t v9 = [v8 hash];
  double v10 = x;
  if (x == 0.0) {
    double v10 = 0.0;
  }
  double v11 = y;
  if (y == 0.0) {
    double v11 = 0.0;
  }
  uint64_t v12 = *(void *)&v11 ^ __ROR8__(*(void *)&v10, 51);
  double v13 = width;
  if (width == 0.0) {
    double v13 = 0.0;
  }
  uint64_t v14 = *(void *)&v13 ^ __ROR8__(v12, 51);
  double v15 = height;
  if (height == 0.0) {
    double v15 = 0.0;
  }
  unint64_t v16 = v9 ^ __ROR8__(*(void *)&v15 ^ __ROR8__(v14, 51) ^ __ROR8__(v3, 51), 51);

  return v16;
}

- (id)description
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)VNDetectedObjectObservation;
  v4 = [(VNObservation *)&v12 description];
  [(VNDetectedObjectObservation *)self boundingBox];
  uint64_t v9 = [NSString stringWithFormat:@"[%g, %g, %g, %g]", v5, v6, v7, v8];
  double v10 = (void *)[v3 initWithFormat:@"%@ boundingBox=%@", v4, v9];

  return v10;
}

- (id)vn_cloneObject
{
  v9.receiver = self;
  v9.super_class = (Class)VNDetectedObjectObservation;
  uint64_t v3 = [(VNObservation *)&v9 vn_cloneObject];
  v4 = (void *)v3;
  if (v3)
  {
    CGSize size = self->_boundingBox.size;
    *(CGPoint *)(v3 + 96) = self->_boundingBox.origin;
    *(CGSize *)(v3 + 112) = size;
    uint64_t v6 = [(NSUUID *)self->_groupId copy];
    uint64_t v7 = (void *)v4[16];
    v4[16] = v6;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNDetectedObjectObservation;
  [(VNObservation *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "vn_encodeCodingVersion:forKey:", 0, @"VNDetectedObjectObservation");
  if (([(id)objc_opt_class() boundingBoxIsCalculatedProperty] & 1) == 0)
  {
    [v4 encodeDouble:@"BBX" forKey:self->_boundingBox.origin.x];
    [v4 encodeDouble:@"BBY" forKey:self->_boundingBox.origin.y];
    [v4 encodeDouble:@"BBW" forKey:self->_boundingBox.size.width];
    [v4 encodeDouble:@"BBH" forKey:self->_boundingBox.size.height];
  }
  [v4 encodeObject:self->_groupId forKey:@"groupId"];
}

- (VNDetectedObjectObservation)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNDetectedObjectObservation;
  objc_super v5 = [(VNObservation *)&v15 initWithCoder:v4];
  if (v5 && !objc_msgSend(v4, "vn_decodeCodingVersionForKey:", @"VNDetectedObjectObservation"))
  {
    if ([(id)objc_opt_class() boundingBoxIsCalculatedProperty])
    {
      CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v5->_boundingBox.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v5->_boundingBox.CGSize size = v7;
    }
    else
    {
      [v4 decodeDoubleForKey:@"BBX"];
      v5->_boundingBox.origin.double x = v8;
      [v4 decodeDoubleForKey:@"BBY"];
      v5->_boundingBox.origin.double y = v9;
      [v4 decodeDoubleForKey:@"BBW"];
      v5->_boundingBox.size.double width = v10;
      [v4 decodeDoubleForKey:@"BBH"];
      v5->_boundingBox.size.double height = v11;
    }
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupId"];
    groupId = v5->_groupId;
    v5->_groupId = (NSUUID *)v12;

    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (VNDetectedObjectObservation)initWithRequestRevision:(unint64_t)a3 boundingBox:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = [(VNObservation *)self initWithRequestRevision:a3];
  CGFloat v9 = v8;
  if (v8)
  {
    v8->_boundingBox.origin.CGFloat x = x;
    v8->_boundingBox.origin.CGFloat y = y;
    v8->_boundingBox.size.CGFloat width = width;
    v8->_boundingBox.size.CGFloat height = height;
    groupId = v8->_groupId;
    v8->_groupId = 0;

    CGFloat v11 = v9;
  }

  return v9;
}

- (VNDetectedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4 groupId:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VNDetectedObjectObservation;
  double v13 = [(VNObservation *)&v17 initWithOriginatingRequestSpecifier:a3];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_boundingBox.origin.CGFloat x = x;
    v13->_boundingBox.origin.CGFloat y = y;
    v13->_boundingBox.size.CGFloat width = width;
    v13->_boundingBox.size.CGFloat height = height;
    objc_storeStrong((id *)&v13->_groupId, a5);
    objc_super v15 = v14;
  }

  return v14;
}

- (VNDetectedObjectObservation)initWithOriginatingRequestSpecifier:(id)a3 boundingBox:(CGRect)a4
{
  return -[VNDetectedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:groupId:](self, "initWithOriginatingRequestSpecifier:boundingBox:groupId:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (VNDetectedObjectObservation)observationWithRequestRevision:(NSUInteger)requestRevision boundingBox:(CGRect)boundingBox
{
  id v4 = objc_msgSend(objc_alloc((Class)a1), "initWithRequestRevision:boundingBox:", requestRevision, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height);

  return (VNDetectedObjectObservation *)v4;
}

+ (VNDetectedObjectObservation)observationWithBoundingBox:(CGRect)boundingBox
{
  return (VNDetectedObjectObservation *)objc_msgSend(a1, "observationWithRequestRevision:boundingBox:", 0, boundingBox.origin.x, boundingBox.origin.y, boundingBox.size.width, boundingBox.size.height);
}

+ (BOOL)boundingBoxIsCalculatedProperty
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return @"VNDetectRectanglesRequest";
}

- (void)setInstanceSegmentationMask:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (void)setGroupId:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (CGRect)boundingBoxInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  BOOL v5 = a3;
  [(VNDetectedObjectObservation *)self boundingBox];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  memset(&v15, 0, sizeof(v15));
  VNAffineTransformForVisionToTopLeftOriginOrientation(v5, a4, (uint64_t)&v15);
  CGAffineTransform v14 = v15;
  v16.origin.CGFloat x = v7;
  v16.origin.CGFloat y = v9;
  v16.size.CGFloat width = v11;
  v16.size.CGFloat height = v13;
  return CGRectApplyAffineTransform(v16, &v14);
}

@end