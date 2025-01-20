@interface JFXFaceAnchor
+ (BOOL)supportsSecureCoding;
+ (JFXFaceAnchor)faceAnchorWithARFrame:(id)a3 captureInterfaceOrientation:(int64_t)a4 withFaceRectScaleFactor:(CGSize)a5;
+ (double)CFX_mirrorPoseTransformLeftRight:(int8x16_t)a1;
- (CGRect)faceRect;
- (CGRect)normalizedFaceRect;
- (CGSize)imageResolution;
- (JFXFaceAnchor)initWithCoder:(id)a3;
- (JFXFaceAnchor)initWithTransform:(__n128)a3 forFaceRect:(__n128)a4 needsMirroring:(__n128)a5 withFaceRectScaleFactor:(CGFloat)a6 frameImageResolution:(CGFloat)a7 captureInterfaceOrientation:(double)a8 preferredAnchorOrientation:(double)a9;
- (__n128)cameraTransform;
- (__n128)screenRelativePosition;
- (__n128)setCameraTransform:(__n128)a3;
- (__n128)setTransform:(__n128)a3;
- (__n128)transform;
- (double)focalLength;
- (double)focalLengthForViewport:(CGSize)a3;
- (double)rollAngle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (int64_t)captureInterfaceOrientation;
- (int64_t)preferredAnchorOrientation;
- (void)encodeWithCoder:(id)a3;
- (void)screenRelativePosition;
- (void)setCaptureInterfaceOrientation:(int64_t)a3;
- (void)setFaceRect:(CGRect)a3;
- (void)setFocalLength:(double)a3;
- (void)setImageResolution:(CGSize)a3;
- (void)setNormalizedFaceRect:(CGRect)a3;
- (void)setPreferredAnchorOrientation:(int64_t)a3;
@end

@implementation JFXFaceAnchor

+ (JFXFaceAnchor)faceAnchorWithARFrame:(id)a3 captureInterfaceOrientation:(int64_t)a4 withFaceRectScaleFactor:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if ([MEMORY[0x263EF8F50] isSupported])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v9 = [v8 anchors];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v47;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v47 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v14;
            if ([v15 isTracked])
            {
              v17 = [v15 geometry];
              [v17 vertices];
              v18 = [v15 geometry];
              [v18 vertices];

              v19 = [JFXFaceAnchor alloc];
              [v15 transform];
              double v44 = v21;
              double v45 = v20;
              double v42 = v23;
              double v43 = v22;
              double SquareWithSize = CGRectMakeSquareWithSize();
              double v26 = v25;
              double v28 = v27;
              double v30 = v29;
              v31 = [v8 camera];
              [v31 imageResolution];
              v16 = -[JFXFaceAnchor initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:](v19, "initWithTransform:forFaceRect:needsMirroring:withFaceRectScaleFactor:frameImageResolution:captureInterfaceOrientation:preferredAnchorOrientation:", 0, a4, 3, v45, v44, v43, v42, SquareWithSize, v26, v28, v30, *(void *)&width, *(void *)&height, v32, v33);

              [v15 transform];
              -[JFXFaceAnchor setTransform:](v16, "setTransform:");
              v34 = [v8 camera];
              [v34 transform];
              -[JFXFaceAnchor setCameraTransform:](v16, "setCameraTransform:");

              v35 = [v8 camera];
              [v35 intrinsics];
              pv_focal_length_from_intrinsics(v53);
              LODWORD(v45) = v36;

              [(JFXFaceAnchor *)v16 imageResolution];
              [(JFXFaceAnchor *)v16 setFocalLength:*(float *)&v45 / v37];
              [v15 normalizedFaceRect];
              -[JFXFaceAnchor setNormalizedFaceRect:](v16, "setNormalizedFaceRect:");
              v38 = JFXLog_DebugFaceAnchor();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
                +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:](v8);
              }

              v39 = JFXLog_DebugFaceAnchor();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
                +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:](v15);
              }

              v40 = JFXLog_DebugFaceAnchor();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
                +[JFXFaceAnchor faceAnchorWithARFrame:captureInterfaceOrientation:withFaceRectScaleFactor:](v16);
              }

              goto LABEL_21;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    v16 = 0;
LABEL_21:
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (JFXFaceAnchor)initWithTransform:(__n128)a3 forFaceRect:(__n128)a4 needsMirroring:(__n128)a5 withFaceRectScaleFactor:(CGFloat)a6 frameImageResolution:(CGFloat)a7 captureInterfaceOrientation:(double)a8 preferredAnchorOrientation:(double)a9
{
  v41.receiver = a1;
  v41.super_class = (Class)JFXFaceAnchor;
  double v27 = [(JFXFaceAnchor *)&v41 init];
  double v28 = v27;
  if (v27)
  {
    *(__n128 *)v27->_anon_70 = a2;
    *(__n128 *)&v27->_anon_70[16] = a3;
    *(__n128 *)&v27->_anon_70[32] = a4;
    *(__n128 *)&v27->_anon_70[48] = a5;
    if (a11)
    {
      +[JFXFaceAnchor CFX_mirrorPoseTransformLeftRight:](JFXFaceAnchor, "CFX_mirrorPoseTransformLeftRight:");
      *(_OWORD *)v28->_anon_70 = v29;
      *(_OWORD *)&v28->_anon_70[16] = v30;
      *(_OWORD *)&v28->_anon_70[32] = v31;
      *(_OWORD *)&v28->_anon_70[48] = v32;
    }
    *(_DWORD *)&v28->_anon_70[60] = 1065353216;
    v28->_imageResolution.CGFloat width = a16;
    v28->_imageResolution.CGFloat height = a17;
    v28->_faceRect.origin.x = a6;
    v28->_faceRect.origin.y = a7;
    v28->_faceRect.size.CGFloat width = a8 * a14;
    v28->_faceRect.size.CGFloat height = a9 * a15;
    v28->_captureInterfaceOrientation = a12;
    uint64_t v33 = MEMORY[0x263EF89A8];
    long long v34 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
    *(_OWORD *)&v28[1].super.isa = *MEMORY[0x263EF89A8];
    *(_OWORD *)&v28[1]._preferredAnchorOrientation = v34;
    CGPoint v35 = *(CGPoint *)(v33 + 48);
    v28[1]._imageResolution = *(CGSize *)(v33 + 32);
    v28[1]._faceRect.origin = v35;
    v28->_focalLength = 0.0;
    v28->_preferredAnchorOrientation = a13;
  }
  return v28;
}

- (double)focalLengthForViewport:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(JFXFaceAnchor *)self focalLength];
  if (width >= height) {
    double v6 = width;
  }
  else {
    double v6 = height;
  }
  return v6 * v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXFaceAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)JFXFaceAnchor;
  double v5 = [(JFXFaceAnchor *)&v20 init];
  if (v5)
  {
    double v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJTFaceAnchorTransformKey"];
    [v6 getBytes:v5->_anon_70 length:64];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJTFaceAnchorCameraTransformKey"];

    [v7 getBytes:&v5[1] length:64];
    [v4 decodeCGRectForKey:@"kJTFaceAnchorFaceRectKey"];
    v5->_faceRect.origin.x = v8;
    v5->_faceRect.origin.y = v9;
    v5->_faceRect.size.double width = v10;
    v5->_faceRect.size.double height = v11;
    [v4 decodeDoubleForKey:@"kJTFaceAnchorFocalLengthKey"];
    v5->_focalLength = v12;
    [v4 decodeCGRectForKey:@"kJFXFaceAnchorNormalizedFaceRectKey"];
    v5->_normalizedFaceRect.origin.x = v13;
    v5->_normalizedFaceRect.origin.y = v14;
    v5->_normalizedFaceRect.size.double width = v15;
    v5->_normalizedFaceRect.size.double height = v16;
    [v4 decodeCGSizeForKey:@"kJFXFaceAnchorImageResolutionKey"];
    v5->_imageResolution.double width = v17;
    v5->_imageResolution.double height = v18;
    v5->_captureInterfaceOrientation = [v4 decodeIntegerForKey:@"kJFXFaceAnchorCaptureInterfaceOrientationKey"];
    v5->_preferredAnchorOrientation = [v4 decodeIntegerForKey:@"kJFXFaceAnchorPreferredAnchorOrientationKey"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F8];
  anon_70 = self->_anon_70;
  id v8 = a3;
  double v6 = [v4 dataWithBytes:anon_70 length:64];
  [v8 encodeObject:v6 forKey:@"kJTFaceAnchorTransformKey"];

  v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&self[1] length:64];
  [v8 encodeObject:v7 forKey:@"kJTFaceAnchorCameraTransformKey"];

  objc_msgSend(v8, "encodeCGRect:forKey:", @"kJTFaceAnchorFaceRectKey", self->_faceRect.origin.x, self->_faceRect.origin.y, self->_faceRect.size.width, self->_faceRect.size.height);
  [v8 encodeDouble:@"kJTFaceAnchorFocalLengthKey" forKey:self->_focalLength];
  objc_msgSend(v8, "encodeCGRect:forKey:", @"kJFXFaceAnchorNormalizedFaceRectKey", self->_normalizedFaceRect.origin.x, self->_normalizedFaceRect.origin.y, self->_normalizedFaceRect.size.width, self->_normalizedFaceRect.size.height);
  objc_msgSend(v8, "encodeCGSize:forKey:", @"kJFXFaceAnchorImageResolutionKey", self->_imageResolution.width, self->_imageResolution.height);
  [v8 encodeInteger:self->_captureInterfaceOrientation forKey:@"kJFXFaceAnchorCaptureInterfaceOrientationKey"];
  [v8 encodeInteger:self->_preferredAnchorOrientation forKey:@"kJFXFaceAnchorPreferredAnchorOrientationKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  CGSize size = self->_faceRect.size;
  *((_OWORD *)result + 3) = self->_faceRect.origin;
  *((CGSize *)result + 4) = size;
  long long v7 = *(_OWORD *)&self->_anon_70[32];
  long long v6 = *(_OWORD *)&self->_anon_70[48];
  long long v8 = *(_OWORD *)&self->_anon_70[16];
  *((_OWORD *)result + 7) = *(_OWORD *)self->_anon_70;
  *((_OWORD *)result + 8) = v8;
  *((_OWORD *)result + 9) = v7;
  *((_OWORD *)result + 10) = v6;
  *((void *)result + 1) = *(void *)&self->_focalLength;
  CGSize v9 = self->_normalizedFaceRect.size;
  *((_OWORD *)result + 5) = self->_normalizedFaceRect.origin;
  *((CGSize *)result + 6) = v9;
  *((_OWORD *)result + 2) = self->_imageResolution;
  *((void *)result + 3) = self->_captureInterfaceOrientation;
  *((void *)result + 2) = self->_preferredAnchorOrientation;
  long long v10 = *(_OWORD *)&self[1].super.isa;
  long long v11 = *(_OWORD *)&self[1]._preferredAnchorOrientation;
  CGPoint origin = self[1]._faceRect.origin;
  *((_OWORD *)result + 13) = self[1]._imageResolution;
  *((CGPoint *)result + 14) = origin;
  *((_OWORD *)result + 11) = v10;
  *((_OWORD *)result + 12) = v11;
  return result;
}

- (__n128)screenRelativePosition
{
  [a1 transform];
  float32x4_t v15 = v2;
  [a1 cameraTransform];
  int32x4_t v5 = vzip1q_s32(v3, v4);
  int32x4_t v6 = vzip2q_s32(v3, v4);
  int32x4_t v9 = vzip1q_s32(v7, v8);
  int32x4_t v10 = vzip2q_s32(v7, v8);
  float32x4_t v14 = (float32x4_t)vzip2q_s32(v6, v10);
  float32x4_t v16 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)vzip1q_s32(v5, v9), v15.f32[0]), (float32x4_t)vzip2q_s32(v5, v9), *(float32x2_t *)v15.f32, 1), (float32x4_t)vzip1q_s32(v6, v10), v15, 2);
  long long v11 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[JFXFaceAnchor screenRelativePosition]();
  }
  float32x4_t v17 = vmlaq_laneq_f32(v16, v14, v15, 3);

  double v12 = JFXLog_DebugFaceAnchor();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[JFXFaceAnchor screenRelativePosition]();
  }

  return (__n128)v17;
}

- (double)rollAngle
{
  return 0.0;
}

- (id)debugDescription
{
  int32x4_t v3 = NSString;
  [(JFXFaceAnchor *)self screenRelativePosition];
  int32x4_t v4 = NSStringFromSIMDFloat3();
  [(JFXFaceAnchor *)self faceRect];
  int32x4_t v5 = NSStringFromSIMDFloat4();
  [(JFXFaceAnchor *)self focalLength];
  int32x4_t v7 = [v3 stringWithFormat:@"position = %@ faceRect = %@ focalLength = %.3f preferred orientation: %s capture orientation: %s", v4, v5, v6, PVInterfaceOrientationNames[-[JFXFaceAnchor preferredAnchorOrientation](self, "preferredAnchorOrientation")], PVInterfaceOrientationNames[-[JFXFaceAnchor captureInterfaceOrientation](self, "captureInterfaceOrientation")]];

  return v7;
}

+ (double)CFX_mirrorPoseTransformLeftRight:(int8x16_t)a1
{
  a1.i32[1] = vnegq_f32((float32x4_t)vextq_s8(a1, a1, 4uLL)).u32[0];
  return *(double *)a1.i64;
}

- (__n128)transform
{
  return a1[7];
}

- (__n128)setTransform:(__n128)a3
{
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  result[10] = a5;
  return result;
}

- (CGRect)faceRect
{
  double x = self->_faceRect.origin.x;
  double y = self->_faceRect.origin.y;
  double width = self->_faceRect.size.width;
  double height = self->_faceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFaceRect:(CGRect)a3
{
  self->_faceRect = a3;
}

- (CGRect)normalizedFaceRect
{
  double x = self->_normalizedFaceRect.origin.x;
  double y = self->_normalizedFaceRect.origin.y;
  double width = self->_normalizedFaceRect.size.width;
  double height = self->_normalizedFaceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNormalizedFaceRect:(CGRect)a3
{
  self->_normalizedFaceRect = a3;
}

- (double)focalLength
{
  return self->_focalLength;
}

- (void)setFocalLength:(double)a3
{
  self->_focalLength = a3;
}

- (__n128)cameraTransform
{
  return a1[11];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[11] = a2;
  result[12] = a3;
  result[13] = a4;
  result[14] = a5;
  return result;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageResolution:(CGSize)a3
{
  self->_imageResolution = a3;
}

- (int64_t)preferredAnchorOrientation
{
  return self->_preferredAnchorOrientation;
}

- (void)setPreferredAnchorOrientation:(int64_t)a3
{
  self->_preferredAnchorOrientation = a3;
}

- (int64_t)captureInterfaceOrientation
{
  return self->_captureInterfaceOrientation;
}

- (void)setCaptureInterfaceOrientation:(int64_t)a3
{
  self->_captureInterfaceOrientation = a3;
}

+ (void)faceAnchorWithARFrame:(void *)a1 captureInterfaceOrientation:withFaceRectScaleFactor:.cold.1(void *a1)
{
  v1 = [a1 debugDescription];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "from ARFrame %@", v4, v5, v6, v7, 2u);
}

+ (void)faceAnchorWithARFrame:(void *)a1 captureInterfaceOrientation:withFaceRectScaleFactor:.cold.2(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v2, v3, "ARFaceAnchor: %@", v4, v5, v6, v7, 2u);
}

+ (void)faceAnchorWithARFrame:(void *)a1 captureInterfaceOrientation:withFaceRectScaleFactor:.cold.3(void *a1)
{
  v1 = [a1 camera];
  uint64_t v2 = [v1 description];
  OUTLINED_FUNCTION_0_0(&dword_234C41000, v3, v4, "ARCamera: %@", v5, v6, v7, v8, 2u);
}

- (void)screenRelativePosition
{
  OUTLINED_FUNCTION_2_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_0_5(v0);
  _os_log_debug_impl(&dword_234C41000, v1, OS_LOG_TYPE_DEBUG, "transform.columns[3]: (%f,%f,%f,%f)", v2, 0x2Au);
}

@end