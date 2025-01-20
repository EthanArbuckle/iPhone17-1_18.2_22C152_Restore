@interface ARCameraAlignmentData
+ (BOOL)supportsSecureCoding;
- (ARCameraAlignmentData)init;
- (ARCameraAlignmentData)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (__n128)cameraTransform;
- (__n128)setCameraTransform:(__n128)a3;
- (double)timestamp;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARCameraAlignmentData

- (ARCameraAlignmentData)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARCameraAlignmentData;
  result = [(ARCameraAlignmentData *)&v6 init];
  if (result)
  {
    v3 = (ARCameraAlignmentData *)MEMORY[0x1E4F149A0];
    ARCameraAlignmentData v4 = *(ARCameraAlignmentData *)(MEMORY[0x1E4F149A0] + 16);
    result[1] = *(ARCameraAlignmentData *)MEMORY[0x1E4F149A0];
    result[2] = v4;
    ARCameraAlignmentData v5 = v3[3];
    result[3] = v3[2];
    result[4] = v5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARCameraAlignmentData)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARCameraAlignmentData;
  ARCameraAlignmentData v5 = [(ARCameraAlignmentData *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"cameraTransform");
    v5[1] = v7;
    v5[2] = v8;
    v5[3] = v9;
    v5[4] = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"cameraTransform", *(double *)&self[1].super.isa, *(double *)&self[2].super.isa, *(double *)&self[3].super.isa, *(double *)&self[4].super.isa);
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && vabdd_f64(self->_timestamp, *((double *)v4 + 1)) < 2.22044605e-16) {
    char v5 = AREqualTransforms((float32x4_t)self[1], (float32x4_t)self[2], (float32x4_t)self[3], (float32x4_t)self[4], *((float32x4_t *)v4 + 1), *((float32x4_t *)v4 + 2), *((float32x4_t *)v4 + 3), *((float32x4_t *)v4 + 4));
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (__n128)cameraTransform
{
  return a1[1];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

@end