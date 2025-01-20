@interface VNFaceLandmarkRegion
+ (BOOL)supportsSecureCoding;
+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)faceBoundingBox;
- (NSUInteger)pointCount;
- (VNFaceLandmarkRegion)initWithCoder:(id)a3;
- (VNFaceLandmarkRegion)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointCount:(unint64_t)a5;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceLandmarkRegion

- (void).cxx_destruct
{
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return (VNRequestSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (NSUInteger)pointCount
{
  return self->_pointCount;
}

- (CGRect)faceBoundingBox
{
  objc_copyStruct(v6, &self->_faceBoundingBox, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (VNFaceLandmarkRegion *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      [(VNFaceLandmarkRegion *)self faceBoundingBox];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      [(VNFaceLandmarkRegion *)v5 faceBoundingBox];
      v24.origin.x = v14;
      v24.origin.y = v15;
      v24.size.width = v16;
      v24.size.height = v17;
      v23.origin.x = v7;
      v23.origin.y = v9;
      v23.size.width = v11;
      v23.size.height = v13;
      if (CGRectEqualToRect(v23, v24)
        && (NSUInteger v18 = [(VNFaceLandmarkRegion *)self pointCount],
            v18 == [(VNFaceLandmarkRegion *)v5 pointCount]))
      {
        v19 = [(VNFaceLandmarkRegion *)self originatingRequestSpecifier];
        v20 = [(VNFaceLandmarkRegion *)v5 originatingRequestSpecifier];
        char v21 = [v19 isEqual:v20];
      }
      else
      {
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(VNFaceLandmarkRegion *)self pointCount];
  double x = self->_faceBoundingBox.origin.x;
  if (x == 0.0) {
    double x = 0.0;
  }
  double y = self->_faceBoundingBox.origin.y;
  if (y == 0.0) {
    double y = 0.0;
  }
  uint64_t v6 = *(void *)&y ^ __ROR8__(*(void *)&x, 51);
  double width = self->_faceBoundingBox.size.width;
  if (width == 0.0) {
    double width = 0.0;
  }
  uint64_t v8 = *(void *)&width ^ __ROR8__(v6, 51);
  double height = self->_faceBoundingBox.size.height;
  if (height == 0.0) {
    double height = 0.0;
  }
  uint64_t v10 = *(void *)&height ^ __ROR8__(v8, 51) ^ __ROR8__(v3, 51);
  return [(VNRequestSpecifier *)self->_originatingRequestSpecifier hash] ^ __ROR8__(self->_pointCount ^ __ROR8__(v10, 51), 51);
}

- (id)description
{
  id v3 = [NSString alloc];
  v12.receiver = self;
  v12.super_class = (Class)VNFaceLandmarkRegion;
  double v4 = [(VNFaceLandmarkRegion *)&v12 description];
  [(VNFaceLandmarkRegion *)self faceBoundingBox];
  CGFloat v9 = [NSString stringWithFormat:@"[%g, %g, %g, %g]", v5, v6, v7, v8];
  uint64_t v10 = (void *)[v3 initWithFormat:@"%@ faceBoundingBox=%@ pointCount=%lu requestRevision=%lu", v4, v9, -[VNFaceLandmarkRegion pointCount](self, "pointCount"), -[VNFaceLandmarkRegion requestRevision](self, "requestRevision")];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt32:0 forKey:@"VNFaceLandmarkRegion"];
  [v4 encodeDouble:@"FLMReg_BBX" forKey:self->_faceBoundingBox.origin.x];
  [v4 encodeDouble:@"FLMReg_BBY" forKey:self->_faceBoundingBox.origin.y];
  [v4 encodeDouble:@"FLMReg_BBW" forKey:self->_faceBoundingBox.size.width];
  [v4 encodeDouble:@"FLMReg_BBH" forKey:self->_faceBoundingBox.size.height];
  [v4 encodeInteger:self->_pointCount forKey:@"FLMReg_PtCnt"];
  [v4 encodeObject:self->_originatingRequestSpecifier forKey:@"FLMReg_OReq"];
}

- (VNFaceLandmarkRegion)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)VNFaceLandmarkRegion;
  uint64_t v5 = [(VNFaceLandmarkRegion *)&v26 init];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [v4 decodeInt32ForKey:@"VNFaceLandmarkRegion"];
  if (!v6)
  {
    [v4 decodeDoubleForKey:@"FLMReg_BBX"];
    v5->_faceBoundingBox.origin.double x = v11;
    [v4 decodeDoubleForKey:@"FLMReg_BBY"];
    v5->_faceBoundingBox.origin.double y = v12;
    [v4 decodeDoubleForKey:@"FLMReg_BBW"];
    v5->_faceBoundingBox.size.double width = v13;
    [v4 decodeDoubleForKey:@"FLMReg_BBH"];
    v5->_faceBoundingBox.size.double height = v14;
    v5->_pointCount = [v4 decodeIntegerForKey:@"FLMReg_PtCnt"];
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FLMReg_OReq"];
    originatingRequestSpecifier = v5->_originatingRequestSpecifier;
    v5->_originatingRequestSpecifier = (VNRequestSpecifier *)v15;

    if (!v5->_originatingRequestSpecifier)
    {
      if (([v4 containsValueForKey:@"FLMReg_Rev"] & 1) == 0)
      {
        uint64_t v7 = +[VNError errorWithCode:6 message:@"could not decode originating request"];
        [v4 failWithError:v7];
        goto LABEL_5;
      }
      uint64_t v17 = [v4 decodeIntegerForKey:@"FLMReg_Rev"];
      uint64_t v7 = [(id)objc_opt_class() defaultOriginatingRequestClassNameForRequestRevision:v17];
      if (!v7)
      {
        v20 = NSString;
        char v21 = (objc_class *)objc_opt_class();
        v22 = NSStringFromClass(v21);
        CGRect v23 = [v20 stringWithFormat:@"%@ does not provide a default originating request class", v22];

        CGRect v24 = +[VNError errorForInternalErrorWithLocalizedDescription:v23];
        [v4 failWithError:v24];

        goto LABEL_6;
      }
      id v25 = 0;
      uint64_t v18 = +[VNRequestSpecifier specifierForRequestClassName:v7 revision:v17 error:&v25];
      id v8 = v25;
      v19 = v5->_originatingRequestSpecifier;
      v5->_originatingRequestSpecifier = (VNRequestSpecifier *)v18;

      if (!v5->_originatingRequestSpecifier)
      {
        [v4 failWithError:v8];
        goto LABEL_4;
      }
    }
    CGFloat v9 = v5;
    goto LABEL_7;
  }
  uint64_t v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Failed to unarchive VNFaceLandmarkRegion object due to coding version mismatch: Currently supported: %u; encoded: %u",
                 0,
                 v6);
  id v8 = +[VNError errorForInternalErrorWithLocalizedDescription:v7];
  [v4 failWithError:v8];
LABEL_4:

LABEL_5:
LABEL_6:
  CGFloat v9 = 0;
LABEL_7:

  return v9;
}

- (VNFaceLandmarkRegion)initWithOriginatingRequestSpecifier:(id)a3 faceBoundingBox:(CGRect)a4 pointCount:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNFaceLandmarkRegion;
  CGFloat v13 = [(VNFaceLandmarkRegion *)&v17 init];
  CGFloat v14 = v13;
  if (v13)
  {
    v13->_faceBoundingBox.origin.CGFloat x = x;
    v13->_faceBoundingBox.origin.CGFloat y = y;
    v13->_faceBoundingBox.size.CGFloat width = width;
    v13->_faceBoundingBox.size.CGFloat height = height;
    v13->_pointCount = a5;
    objc_storeStrong((id *)&v13->_originatingRequestSpecifier, a3);
    uint64_t v15 = v14;
  }

  return v14;
}

- (unint64_t)requestRevision
{
  double v2 = [(VNFaceLandmarkRegion *)self originatingRequestSpecifier];
  unint64_t v3 = [v2 requestRevision];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return 0;
}

@end