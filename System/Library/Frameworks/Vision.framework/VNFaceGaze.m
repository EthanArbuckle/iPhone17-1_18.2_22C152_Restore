@interface VNFaceGaze
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (CGPoint)location;
- (CGPoint)locationInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (CGRect)locationBounds;
- (NSUUID)faceObservationUUID;
- (NSUUID)lookedAtFaceObservationUUID;
- (VNFaceGaze)initWithCoder:(id)a3;
- (VNFaceGaze)initWithFaceObservationUUID:(id)a3 direction:(int64_t)a4 location:(CGPoint)a5 bounds:(CGRect)a6 horizontalAngle:(float)a7 lookedAtFaceObservationUUID:(id)a8 gazeMask:(id)a9 originatingRequestSpecifier:(id)a10;
- (VNPixelBufferObservation)gazeMask;
- (VNRequestSpecifier)originatingRequestSpecifier;
- (float)horizontalAngle;
- (id)description;
- (int64_t)direction;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNFaceGaze

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingRequestSpecifier, 0);
  objc_storeStrong((id *)&self->_gazeMask, 0);
  objc_storeStrong((id *)&self->_lookedAtFaceObservationUUID, 0);

  objc_storeStrong((id *)&self->_faceObservationUUID, 0);
}

- (CGRect)locationBounds
{
  double x = self->_locationBounds.origin.x;
  double y = self->_locationBounds.origin.y;
  double width = self->_locationBounds.size.width;
  double height = self->_locationBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (VNPixelBufferObservation)gazeMask
{
  return self->_gazeMask;
}

- (NSUUID)lookedAtFaceObservationUUID
{
  return self->_lookedAtFaceObservationUUID;
}

- (float)horizontalAngle
{
  return self->_horizontalAngle;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (NSUUID)faceObservationUUID
{
  return self->_faceObservationUUID;
}

- (VNRequestSpecifier)originatingRequestSpecifier
{
  return self->_originatingRequestSpecifier;
}

- (VNFaceGaze)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"face"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"direction"];
  [v4 decodeDoubleForKey:@"locX"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"locY"];
  double v10 = v9;
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lookFace"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gazeMask"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"oreq"];
  if (v13)
  {
    if ([v4 containsValueForKey:@"locBounds"])
    {
      objc_msgSend(v4, "vn_decodeRectForKey:", @"locBounds");
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
    }
    else
    {
      double v15 = *MEMORY[0x1E4F1DB20];
      double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    if ([v4 containsValueForKey:@"horizAngle"])
    {
      [v4 decodeFloatForKey:@"horizAngle"];
      LODWORD(v23) = v24;
    }
    else
    {
      LODWORD(v23) = 2143289344;
    }
    self = -[VNFaceGaze initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:](self, "initWithFaceObservationUUID:direction:location:bounds:horizontalAngle:lookedAtFaceObservationUUID:gazeMask:originatingRequestSpecifier:", v5, v6, v11, v12, v13, v8, v10, v15, v17, v19, v21, v23);
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  faceObservationUUID = self->_faceObservationUUID;
  id v6 = a3;
  [v6 encodeObject:faceObservationUUID forKey:@"face"];
  [v6 encodeInteger:self->_direction forKey:@"direction"];
  [v6 encodeDouble:@"locX" forKey:self->_location.x];
  [v6 encodeDouble:@"locY" forKey:self->_location.y];
  [v6 encodeObject:self->_lookedAtFaceObservationUUID forKey:@"lookFace"];
  [v6 encodeObject:self->_gazeMask forKey:@"gazeMask"];
  [v6 encodeObject:self->_originatingRequestSpecifier forKey:@"oreq"];
  objc_msgSend(v6, "vn_encodeRect:forKey:", @"locBounds", self->_locationBounds.origin.x, self->_locationBounds.origin.y, self->_locationBounds.size.width, self->_locationBounds.size.height);
  *(float *)&double v5 = self->_horizontalAngle;
  [v6 encodeFloat:@"horizAngle" forKey:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNFaceGaze *)a3;
  if (self == v4)
  {
    BOOL v20 = 1;
    goto LABEL_14;
  }
  v43.receiver = self;
  v43.super_class = (Class)VNFaceGaze;
  if (![(VNFaceGaze *)&v43 isEqual:v4] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    BOOL v20 = 0;
    goto LABEL_14;
  }
  double v5 = v4;
  id v6 = [(VNFaceGaze *)self faceObservationUUID];
  double v7 = [(VNFaceGaze *)v5 faceObservationUUID];
  int v8 = [v6 isEqual:v7];

  if (!v8) {
    goto LABEL_10;
  }
  double v9 = [(VNFaceGaze *)self originatingRequestSpecifier];
  double v10 = [(VNFaceGaze *)v5 originatingRequestSpecifier];
  int v11 = [v9 isEqual:v10];

  if (!v11) {
    goto LABEL_10;
  }
  int64_t v12 = [(VNFaceGaze *)self direction];
  if (v12 != [(VNFaceGaze *)v5 direction]) {
    goto LABEL_10;
  }
  v13 = [(VNFaceGaze *)self lookedAtFaceObservationUUID];
  double v14 = [(VNFaceGaze *)v5 lookedAtFaceObservationUUID];
  int v15 = VisionCoreEqualOrNilObjects();

  if (!v15) {
    goto LABEL_10;
  }
  double v16 = [(VNFaceGaze *)self gazeMask];
  double v17 = [(VNFaceGaze *)v5 gazeMask];
  int v18 = VisionCoreEqualOrNilObjects();

  if (!v18) {
    goto LABEL_10;
  }
  BOOL v19 = [(VNFaceGaze *)self hasLocation];
  if (v19 != [(VNFaceGaze *)v5 hasLocation]) {
    goto LABEL_10;
  }
  if (!v19) {
    goto LABEL_20;
  }
  [(VNFaceGaze *)self location];
  double v23 = v22;
  double v25 = v24;
  [(VNFaceGaze *)v5 location];
  BOOL v20 = 0;
  if (v23 != v27 || v25 != v26) {
    goto LABEL_11;
  }
  [(VNFaceGaze *)self locationBounds];
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  [(VNFaceGaze *)v5 locationBounds];
  v45.origin.double x = v36;
  v45.origin.double y = v37;
  v45.size.double width = v38;
  v45.size.double height = v39;
  v44.origin.double x = v29;
  v44.origin.double y = v31;
  v44.size.double width = v33;
  v44.size.double height = v35;
  if (!CGRectEqualToRect(v44, v45)) {
    goto LABEL_10;
  }
  [(VNFaceGaze *)self horizontalAngle];
  float v41 = v40;
  [(VNFaceGaze *)v5 horizontalAngle];
  if (v41 == v42) {
LABEL_20:
  }
    BOOL v20 = 1;
  else {
LABEL_10:
  }
    BOOL v20 = 0;
LABEL_11:

LABEL_14:
  return v20;
}

- (unint64_t)hash
{
  return [(VNPixelBufferObservation *)self->_gazeMask hash] ^ __ROR8__([(NSUUID *)self->_lookedAtFaceObservationUUID hash] ^ __ROR8__([(VNRequestSpecifier *)self->_originatingRequestSpecifier hash] ^ __ROR8__([(NSUUID *)self->_faceObservationUUID hash] ^ __ROR8__(self->_direction, 51), 51), 51), 51);
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v17.receiver = self;
  v17.super_class = (Class)VNFaceGaze;
  id v4 = [(VNFaceGaze *)&v17 description];
  double v5 = [(VNFaceGaze *)self originatingRequestSpecifier];
  id v6 = [(VNFaceGaze *)self faceObservationUUID];
  double v7 = [v6 UUIDString];
  unint64_t v8 = [(VNFaceGaze *)self direction];
  unint64_t v9 = v8;
  if (v8 >= 6)
  {
    id v11 = [NSString alloc];
    int64_t v12 = [NSNumber numberWithInteger:v9];
    double v10 = (__CFString *)[v11 initWithFormat:@"VNFaceGazeDirection%@", v12];
  }
  else
  {
    double v10 = off_1E5B1F508[v8];
  }
  [v3 appendFormat:@"%@ %@ face %@ %@", v4, v5, v7, v10];

  v13 = [(VNFaceGaze *)self lookedAtFaceObservationUUID];
  double v14 = v13;
  if (v13)
  {
    int v15 = [v13 UUIDString];
    [v3 appendFormat:@", looking at %@", v15];
  }

  return v3;
}

- (BOOL)hasLocation
{
  v3.origin.double x = 0.0;
  v3.origin.double y = 0.0;
  v3.size.double width = 1.0;
  v3.size.double height = 1.0;
  return CGRectContainsPoint(v3, self->_location);
}

- (VNFaceGaze)initWithFaceObservationUUID:(id)a3 direction:(int64_t)a4 location:(CGPoint)a5 bounds:(CGRect)a6 horizontalAngle:(float)a7 lookedAtFaceObservationUUID:(id)a8 gazeMask:(id)a9 originatingRequestSpecifier:(id)a10
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v18 = a5.y;
  CGFloat v19 = a5.x;
  id v23 = a3;
  id v24 = a8;
  id v25 = a9;
  id v26 = a10;
  v32.receiver = self;
  v32.super_class = (Class)VNFaceGaze;
  double v27 = [(VNFaceGaze *)&v32 init];
  double v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_faceObservationUUID, a3);
    v28->_direction = a4;
    v28->_location.CGFloat x = v19;
    v28->_location.CGFloat y = v18;
    v28->_locationBounds.origin.CGFloat x = x;
    v28->_locationBounds.origin.CGFloat y = y;
    v28->_locationBounds.size.CGFloat width = width;
    v28->_locationBounds.size.CGFloat height = height;
    v28->_horizontalAngle = a7;
    objc_storeStrong((id *)&v28->_lookedAtFaceObservationUUID, a8);
    uint64_t v29 = [v25 copy];
    gazeMask = v28->_gazeMask;
    v28->_gazeMask = (VNPixelBufferObservation *)v29;

    objc_storeStrong((id *)&v28->_originatingRequestSpecifier, a10);
  }

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGPoint)locationInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  float64x2_t v9 = 0u;
  float64x2_t v10 = 0u;
  float64x2_t v8 = 0u;
  [(VNFaceGaze *)self location];
  float64x2_t v6 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v4), v8, v5));
  double v7 = v6.f64[1];
  result.CGFloat x = v6.f64[0];
  result.CGFloat y = v7;
  return result;
}

@end