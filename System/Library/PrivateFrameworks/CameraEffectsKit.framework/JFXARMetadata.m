@interface JFXARMetadata
+ (BOOL)supportsSecureCoding;
- (ARFrame)arFrame;
- (BOOL)hasTrackedFace;
- (CGSize)imageResolution;
- (JFXARMetadata)initWithARFrame:(id)a3 faceAnchor:(id)a4;
- (JFXARMetadata)initWithCoder:(id)a3;
- (JFXFaceAnchor)faceAnchor;
- (NSDictionary)animojiPhysicsBlendShapes;
- (__n128)anchorTransform;
- (__n128)cameraIntrinsics;
- (__n128)cameraTransform;
- (double)initWithAnchorTransform:(__n128)a3 cameraTransform:(__n128)a4 cameraIntrinsics:(__n128)a5 cameraImageResolution:(__n128)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)pvTransformOrientation;
- (uint64_t)cameraProjectionForOutputSize:(float64_t)a3 interfaceOrientation:(double)a4 zNear:(double)a5 zFar:(uint64_t)a6;
- (uint64_t)cameraTransformForInterfaceOrientation:(uint64_t)a3;
- (uint64_t)initWithFaceAnchor:(__n128)a3 cameraIntrinsics:(__n128)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAnimojiPhysicsBlendShapes:(id)a3;
@end

@implementation JFXARMetadata

- (BOOL)hasTrackedFace
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(JFXARMetadata *)self faceAnchor];

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(JFXARMetadata *)self arFrame];
    v6 = [v5 anchors];

    uint64_t v4 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v6);
          }
          v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 && ([v9 isTracked])
          {
            LOBYTE(v4) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v4 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXARMetadata)initWithCoder:(id)a3
{
  v33[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v31 = 0u;
  *(_OWORD *)v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJFXAnchorTransformKey"];
  [v5 getBytes:&v29 length:64];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJFXCameraTransformKey"];

  [v6 getBytes:&v25 length:64];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJFXCameraIntrinsicsKey"];

  [v7 getBytes:&v22 length:48];
  [v4 decodeCGSizeForKey:@"kJFXImageResolutionKey"];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  long long v12 = (void *)MEMORY[0x263EFFA08];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  v33[2] = objc_opt_class();
  v33[3] = objc_opt_class();
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  long long v14 = [v12 setWithArray:v13];
  v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kJFXAnimojiPhysicsBlendShapesKey"];

  uint64_t v16 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](self, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", *(double *)&v29, *(double *)&v30, *(double *)&v31, v32[0], *(double *)&v25, *(double *)&v26, *(double *)&v27, *(double *)&v28, v22, v23, v24, v9, v11);
  if (v16)
  {
    v16->_pvTransformOrientation = [v4 decodeIntegerForKey:@"kJFXTransformOrientationKey"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJFXARFrameKey"];
    arFrame = v16->_arFrame;
    v16->_arFrame = (ARFrame *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kJFXFaceAnchorKey"];
    faceAnchor = v16->_faceAnchor;
    v16->_faceAnchor = (JFXFaceAnchor *)v19;

    objc_storeStrong((id *)&v16->_animojiPhysicsBlendShapes, v15);
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(JFXARMetadata *)self arFrame];
  [v4 encodeObject:v5 forKey:@"kJFXARFrameKey"];

  v6 = [(JFXARMetadata *)self faceAnchor];
  [v4 encodeObject:v6 forKey:@"kJFXFaceAnchorKey"];

  uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:self->_anon_70 length:64];
  [v4 encodeObject:v7 forKey:@"kJFXAnchorTransformKey"];

  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&self[1] length:64];
  [v4 encodeObject:v8 forKey:@"kJFXCameraTransformKey"];

  uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:self->_anon_40 length:48];
  [v4 encodeObject:v9 forKey:@"kJFXCameraIntrinsicsKey"];

  objc_msgSend(v4, "encodeCGSize:forKey:", @"kJFXImageResolutionKey", self->_imageResolution.width, self->_imageResolution.height);
  [v4 encodeInteger:self->_pvTransformOrientation forKey:@"kJFXTransformOrientationKey"];
  id v10 = [(JFXARMetadata *)self animojiPhysicsBlendShapes];
  [v4 encodeObject:v10 forKey:@"kJFXAnimojiPhysicsBlendShapesKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = self;
  v10.receiver = v3;
  v10.super_class = (Class)JFXARMetadata;
  id v4 = [(JFXARMetadata *)&v10 init];
  uint64_t v5 = [(JFXARMetadata *)v3 arFrame];
  arFrame = v4->_arFrame;
  v4->_arFrame = (ARFrame *)v5;

  uint64_t v7 = [(JFXARMetadata *)v3 faceAnchor];
  faceAnchor = v4->_faceAnchor;
  v4->_faceAnchor = (JFXFaceAnchor *)v7;

  return v4;
}

- (double)initWithAnchorTransform:(__n128)a3 cameraTransform:(__n128)a4 cameraIntrinsics:(__n128)a5 cameraImageResolution:(__n128)a6
{
  v31.receiver = a1;
  v31.super_class = (Class)JFXARMetadata;
  v21 = [(JFXARMetadata *)&v31 init];
  if (v21)
  {
    double result = a21;
    *(__n128 *)&v21->_anon_70[16] = a3;
    *(__n128 *)&v21->_anon_70[32] = a4;
    *(__n128 *)&v21->_anon_70[48] = a5;
    *(__n128 *)&v21[1].super.isa = a6;
    *(__n128 *)&v21[1]._faceAnchor = a7;
    *(__n128 *)&v21[1]._pvTransformOrientation = a8;
    *(__n128 *)&v21[1]._imageResolution.height = a9;
    *(_OWORD *)v21->_anon_40 = a17;
    *(_OWORD *)&v21->_anon_40[16] = a18;
    *(_OWORD *)&v21->_anon_40[32] = a19;
    *(__n128 *)v21->_anon_70 = a2;
    v21->_imageResolution.width = a20;
    v21->_imageResolution.height = a21;
    v21->_pvTransformOrientation = 3;
  }
  return result;
}

- (JFXARMetadata)initWithARFrame:(id)a3 faceAnchor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 anchors];
  objc_super v10 = [v9 firstObject];
  [v10 transform];
  double v38 = v12;
  double v39 = v11;
  double v36 = v14;
  double v37 = v13;
  v15 = [v7 camera];
  [v15 transform];
  double v34 = v17;
  double v35 = v16;
  double v32 = v19;
  double v33 = v18;
  v20 = [v7 camera];
  [v20 intrinsics];
  long long v30 = v22;
  long long v31 = v21;
  long long v29 = v23;
  long long v24 = [v7 camera];
  [v24 imageResolution];
  long long v27 = -[JFXARMetadata initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:](self, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, v29, v25, v26);

  if (v27)
  {
    objc_storeStrong((id *)&v27->_arFrame, a3);
    objc_storeStrong((id *)&v27->_faceAnchor, a4);
    v27->_pvTransformOrientation = 3;
  }

  return v27;
}

- (uint64_t)initWithFaceAnchor:(__n128)a3 cameraIntrinsics:(__n128)a4
{
  id v8 = a6;
  [v8 transform];
  double v28 = v10;
  double v29 = v9;
  double v27 = v11;
  double v26 = v12;
  [v8 cameraTransform];
  double v24 = v14;
  double v25 = v13;
  double v22 = v16;
  double v23 = v15;
  [v8 imageResolution];
  uint64_t v19 = objc_msgSend(a1, "initWithAnchorTransform:cameraTransform:cameraIntrinsics:cameraImageResolution:", v29, v28, v27, v26, v25, v24, v23, v22, *(_OWORD *)&a2, *(_OWORD *)&a3, *(_OWORD *)&a4, v17, v18);
  uint64_t v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 16), a6);
    *(void *)(v20 + 32) = [v8 preferredAnchorOrientation];
  }

  return v20;
}

- (uint64_t)cameraProjectionForOutputSize:(float64_t)a3 interfaceOrientation:(double)a4 zNear:(double)a5 zFar:(uint64_t)a6
{
  uint64_t v11 = [a1 pvTransformOrientation];
  [a1 cameraIntrinsics];
  __n128 v24 = v13;
  __n128 v25 = v12;
  __n128 v23 = v14;
  [a1 imageResolution];
  v18.f64[1] = v17;
  v19.n128_u64[0] = (unint64_t)vcvt_f32_f64(v18);
  v20.f64[0] = a2;
  v20.f64[1] = a3;
  v21.n128_u64[0] = (unint64_t)vcvt_f32_f64(v20);
  v15.n128_f32[0] = a4;
  v16.n128_f32[0] = a5;
  return MEMORY[0x270F57550](v11, a7, 1, 1, v25, v24, v23, v19, v21, v15, v16);
}

- (uint64_t)cameraTransformForInterfaceOrientation:(uint64_t)a3
{
  uint64_t v5 = [a1 pvTransformOrientation];
  [a1 cameraTransform];
  return MEMORY[0x270F57538](v5, a3, 1);
}

- (ARFrame)arFrame
{
  return self->_arFrame;
}

- (JFXFaceAnchor)faceAnchor
{
  return self->_faceAnchor;
}

- (__n128)anchorTransform
{
  return a1[7];
}

- (NSDictionary)animojiPhysicsBlendShapes
{
  return self->_animojiPhysicsBlendShapes;
}

- (void)setAnimojiPhysicsBlendShapes:(id)a3
{
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__n128)cameraTransform
{
  return a1[11];
}

- (__n128)cameraIntrinsics
{
  return a1[4];
}

- (int64_t)pvTransformOrientation
{
  return self->_pvTransformOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animojiPhysicsBlendShapes, 0);
  objc_storeStrong((id *)&self->_faceAnchor, 0);
  objc_storeStrong((id *)&self->_arFrame, 0);
}

@end