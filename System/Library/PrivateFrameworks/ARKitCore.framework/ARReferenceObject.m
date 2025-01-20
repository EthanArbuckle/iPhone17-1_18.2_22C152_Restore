@interface ARReferenceObject
+ (BOOL)supportsSecureCoding;
+ (NSSet)referenceObjectsInGroupNamed:(NSString *)name bundle:(NSBundle *)bundle;
+ (id)referenceObjectsInGroupNamed:(id)a3 catalog:(id)a4;
+ (id)referenceObjectsInGroupNamed:(id)a3 catalogName:(id)a4 bundle:(id)a5;
+ (id)referenceObjectsInGroupNamed:(id)a3 catalogURL:(id)a4;
- (ARPointCloud)rawFeaturePoints;
- (ARReferenceObject)initWithArchive:(id)a3 name:(id)a4 error:(id *)a5;
- (ARReferenceObject)initWithArchiveData:(id)a3 name:(id)a4 error:(id *)a5;
- (ARReferenceObject)initWithArchiveURL:(NSURL *)url error:(NSError *)error;
- (ARReferenceObject)initWithCoder:(id)a3;
- (ARReferenceObject)initWithTrackingData:(__n128)a3 referenceOriginTransform:(__n128)a4;
- (ARReferenceObject)referenceObjectByApplyingTransform:(simd_float4x4)transform;
- (ARReferenceObject)referenceObjectByMergingObject:(ARReferenceObject *)object error:(NSError *)error;
- (BOOL)exportObjectToURL:(NSURL *)url previewImage:(UIImage *)previewImage error:(NSError *)error;
- (BOOL)isEqual:(id)a3;
- (NSData)trackingData;
- (NSSet)keyframes;
- (NSString)name;
- (NSString)resourceGroupName;
- (NSUUID)identifier;
- (__n128)referenceOriginTransform;
- (id)description;
- (id)exportObjectToMemoryWithPreviewImage:(id)a3 error:(id *)a4;
- (id)writeToArchiveWithPreviewImage:(id)a3 error:(id *)a4;
- (int64_t)version;
- (simd_float3)center;
- (simd_float3)extent;
- (simd_float3)scale;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(NSString *)name;
- (void)setResourceGroupName:(id)a3;
@end

@implementation ARReferenceObject

- (ARReferenceObject)initWithTrackingData:(__n128)a3 referenceOriginTransform:(__n128)a4
{
  id v8 = a7;
  v25.receiver = a1;
  v25.super_class = (Class)ARReferenceObject;
  v9 = [(ARReferenceObject *)&v25 init];
  v10 = v9;
  if (v9)
  {
    v9->_version = 1;
    uint64_t v11 = [v8 copy];
    trackingData = v10->_trackingData;
    v10->_trackingData = (NSData *)v11;

    *(__n128 *)&v10[1].super.isa = a2;
    *(__n128 *)&v10[1]._name = a3;
    *(__n128 *)&v10[1]._rawFeaturePoints = a4;
    *(__n128 *)&v10[1]._version = a5;
    uint64_t v13 = +[ARWorldMap featurePointsForTrackingData:referenceOriginTransform:](ARWorldMap, "featurePointsForTrackingData:referenceOriginTransform:", v8);
    rawFeaturePoints = v10->_rawFeaturePoints;
    v10->_rawFeaturePoints = (ARPointCloud *)v13;

    [(ARPointCloud *)v10->_rawFeaturePoints computeBounds];
    *(_OWORD *)v10->_center = v15;
    *(_OWORD *)v10->_extent = v16;
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithData:", v8);
    identifier = v10->_identifier;
    v10->_identifier = (NSUUID *)v17;

    resourceGroupName = v10->_resourceGroupName;
    v10->_resourceGroupName = 0;
  }
  return v10;
}

- (simd_float3)scale
{
  float32x4_t v2 = vmulq_f32(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&self[1].super.isa);
  float32x4_t v3 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v2, 2), vaddq_f32(v2, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v2.f32, 1)));
  float32x4_t v4 = vmulq_f32(*(float32x4_t *)&self[1]._name, *(float32x4_t *)&self[1]._name);
  float32x4_t v5 = vmulq_f32(*(float32x4_t *)&self[1]._rawFeaturePoints, *(float32x4_t *)&self[1]._rawFeaturePoints);
  v3.f32[0] = sqrtf(v3.f32[0]);
  v3.i32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1))).f32[0]);
  v3.i32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v5, 2), vaddq_f32(v5, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v5.f32, 1))).f32[0]);
  return (simd_float3)vmulq_laneq_f32(v3, *(float32x4_t *)&self[1]._version, 3);
}

- (ARReferenceObject)initWithArchiveData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[ARArchive alloc] initWithData:v9 error:a5];

  uint64_t v11 = [(ARReferenceObject *)self initWithArchive:v10 name:v8 error:a5];
  return v11;
}

- (ARReferenceObject)initWithArchiveURL:(NSURL *)url error:(NSError *)error
{
  v6 = url;
  v7 = [[ARArchive alloc] initWithContentsOfURL:v6 error:error];
  if (v7)
  {
    id v8 = [(NSURL *)v6 lastPathComponent];
    id v9 = [v8 stringByDeletingPathExtension];
    self = [(ARReferenceObject *)self initWithArchive:v7 name:v9 error:error];

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (ARReferenceObject)initWithArchive:(id)a3 name:(id)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [v8 dataForResourceAtPath:@"Info.plist"];
    if (v10)
    {
      uint64_t v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
      objc_opt_class();
      id v12 = 0;
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
    }
    else
    {
      id v12 = 0;
    }
    v14 = [v12 objectForKeyedSubscript:@"Version"];
    uint64_t v15 = [v14 integerValue];

    if (v15 < 2)
    {
      long long v16 = [v12 objectForKeyedSubscript:@"TrackingDataReference"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v8 dataForResourceAtPath:v16], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v20 = v19;
        v21 = [v12 objectForKeyedSubscript:@"ReferenceOrigin"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __n128 v22 = ARMatrix4x4FromDictionary(v21);
          +[ARWorldMap boundsForTrackingData:](ARWorldMap, "boundsForTrackingData:", v20, v27, v28, v25, v26, v23, v24, *(_OWORD *)&v22);
        }
        else
        {
          +[ARWorldMap boundsForTrackingData:](ARWorldMap, "boundsForTrackingData:", v20, *(void *)(MEMORY[0x1E4F149A0] + 48), *(void *)(MEMORY[0x1E4F149A0] + 56), *(void *)(MEMORY[0x1E4F149A0] + 32), *(void *)(MEMORY[0x1E4F149A0] + 40), *(void *)(MEMORY[0x1E4F149A0] + 16), *(void *)(MEMORY[0x1E4F149A0] + 24), *MEMORY[0x1E4F149A0], *(void *)(MEMORY[0x1E4F149A0] + 8));
        }
        ARMatrix4x4FromRotationAndTranslation();
        uint64_t v31 = 0;
        v43[0] = v32;
        v43[1] = v33;
        v43[2] = v34;
        v43[3] = v35;
        memset(buf, 0, sizeof(buf));
        long long v45 = 0u;
        long long v46 = 0u;
        do
        {
          *(float32x4_t *)&buf[v31 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(v43[v31])), v41, *(float32x2_t *)&v43[v31], 1), v40, (float32x4_t)v43[v31], 2), v39, (float32x4_t)v43[v31], 3);
          ++v31;
        }
        while (v31 != 4);
        v36 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](self, "initWithTrackingData:referenceOriginTransform:", v20, *(double *)buf, *(double *)&buf[16], *(double *)&v45, *(double *)&v46);
        v37 = v36;
        if (v36)
        {
          v36->_version = v15;
          objc_storeStrong((id *)&v36->_name, a4);
        }
        self = v37;

        uint64_t v13 = self;
      }
      else
      {
        if (a5)
        {
          ARErrorWithCodeAndUserInfo(301, 0);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        v20 = _ARLogGeneral_31();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = self;
          _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Malformed data", buf, 0x16u);
        }
        uint64_t v13 = 0;
      }
    }
    else
    {
      if (a5)
      {
        ARErrorWithCodeAndUserInfo(301, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      long long v16 = _ARLogGeneral_31();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v18;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&buf[24] = v15;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Unsupported object version (%ld)", buf, 0x20u);
      }
      uint64_t v13 = 0;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (BOOL)exportObjectToURL:(NSURL *)url previewImage:(UIImage *)previewImage error:(NSError *)error
{
  id v8 = url;
  id v9 = [(ARReferenceObject *)self writeToArchiveWithPreviewImage:previewImage error:error];
  LOBYTE(error) = [v9 writeToURL:v8 error:error];

  return (char)error;
}

- (id)exportObjectToMemoryWithPreviewImage:(id)a3 error:(id *)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  float32x4_t v5 = -[ARReferenceObject writeToArchiveWithPreviewImage:error:](self, "writeToArchiveWithPreviewImage:error:", a3);
  uint64_t v6 = [v5 dataRepresentation];
  v7 = (void *)v6;
  if (a4 && !v6)
  {
    uint64_t v12 = *MEMORY[0x1E4F28588];
    id v8 = ARKitCoreBundle();
    id v9 = [v8 localizedStringForKey:@"Unable to create archive." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    v13[0] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

    ARErrorWithCodeAndUserInfo(500, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)writeToArchiveWithPreviewImage:(id)a3 error:(id *)a4
{
  return 0;
}

- (ARReferenceObject)referenceObjectByApplyingTransform:(simd_float4x4)transform
{
  float32x4_t v4 = [ARReferenceObject alloc];
  float32x4_t v5 = [(ARReferenceObject *)self trackingData];
  simd_float4x4 v24 = __invert_f4(transform);
  float32x4_t v16 = (float32x4_t)v24.columns[1];
  float32x4_t v17 = (float32x4_t)v24.columns[0];
  float32x4_t v14 = (float32x4_t)v24.columns[3];
  float32x4_t v15 = (float32x4_t)v24.columns[2];
  [(ARReferenceObject *)self referenceOriginTransform];
  uint64_t v6 = 0;
  v18[0] = v7;
  v18[1] = v8;
  v18[2] = v9;
  v18[3] = v10;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  do
  {
    *(long long *)((char *)&v19 + v6 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(v18[v6])), v16, *(float32x2_t *)&v18[v6], 1), v15, (float32x4_t)v18[v6], 2), v14, (float32x4_t)v18[v6], 3);
    ++v6;
  }
  while (v6 != 4);
  uint64_t v11 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v4, "initWithTrackingData:referenceOriginTransform:", v5, *(double *)&v19, *(double *)&v20, *(double *)&v21, *(double *)&v22);

  return v11;
}

- (ARReferenceObject)referenceObjectByMergingObject:(ARReferenceObject *)object error:(NSError *)error
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = object;
  long long v7 = [(ARReferenceObject *)v6 trackingData];
  long long v8 = [(ARReferenceObject *)self trackingData];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    long long v10 = [ARReferenceObject alloc];
    uint64_t v11 = [(ARReferenceObject *)self trackingData];
    [(ARReferenceObject *)self referenceOriginTransform];
    error = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v10, "initWithTrackingData:referenceOriginTransform:", v11);

    uint64_t v12 = [(ARReferenceObject *)self name];
    [error setName:v12];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = [(ARReferenceObject *)self trackingData];
    float32x4_t v14 = [(ARReferenceObject *)v6 trackingData];
    int v15 = CV3DVIOAlignAndMergeMaps();

    if (v15 || ![v12 length])
    {
      float32x4_t v16 = _ARLogGeneral_31();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        float32x4_t v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        long long v19 = [(ARReferenceObject *)self description];
        long long v20 = [(ARReferenceObject *)v6 description];
        int v26 = 138544386;
        uint64_t v27 = v18;
        __int16 v28 = 2048;
        v29 = self;
        __int16 v30 = 2114;
        uint64_t v31 = v19;
        __int16 v32 = 2114;
        long long v33 = v20;
        __int16 v34 = 1024;
        int v35 = v15;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to merge reference object %{public}@ with %{public}@ (%u)", (uint8_t *)&v26, 0x30u);
      }
      if (error)
      {
        if (v15 == 19) {
          uint64_t v21 = 301;
        }
        else {
          uint64_t v21 = 401;
        }
        ARErrorWithCodeAndUserInfo(v21, 0);
        simd_float4x4 v24 = (NSError *) objc_claimAutoreleasedReturnValue();
        *error = v24;

        error = 0;
      }
    }
    else
    {
      long long v22 = [ARReferenceObject alloc];
      [(ARReferenceObject *)self referenceOriginTransform];
      error = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v22, "initWithTrackingData:referenceOriginTransform:", v12);
      uint64_t v23 = [(ARReferenceObject *)self name];
      [error setName:v23];
    }
  }

  return (ARReferenceObject *)error;
}

- (NSSet)keyframes
{
  keyframes = self->_keyframes;
  if (!keyframes)
  {
    float32x4_t v4 = [(ARReferenceObject *)self trackingData];
    rawFeaturePoints = self->_rawFeaturePoints;
    [(ARReferenceObject *)self referenceOriginTransform];
    +[ARWorldMap keyframesForTrackingData:withFeaturePoints:referenceOriginTransform:](ARWorldMap, "keyframesForTrackingData:withFeaturePoints:referenceOriginTransform:", v4, rawFeaturePoints);
    uint64_t v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    long long v7 = self->_keyframes;
    self->_keyframes = v6;

    keyframes = self->_keyframes;
  }
  return keyframes;
}

- (id)description
{
  float32x4_t v3 = [(ARReferenceObject *)self name];

  float32x4_t v4 = NSString;
  float32x4_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  if (v3)
  {
    long long v7 = [(ARReferenceObject *)self name];
    [(ARReferenceObject *)self center];
    int v9 = ARVector3Description(v8);
    [(ARReferenceObject *)self extent];
    uint64_t v11 = ARVector3Description(v10);
    uint64_t v12 = [v4 stringWithFormat:@"<%@: %p name=\"%@\" center=%@ extent=%@>", v6, self, v7, v9, v11];
  }
  else
  {
    [(ARReferenceObject *)self center];
    long long v7 = ARVector3Description(v13);
    [(ARReferenceObject *)self extent];
    int v9 = ARVector3Description(v14);
    uint64_t v12 = [v4 stringWithFormat:@"<%@: %p center=%@ extent=%@>", v6, self, v7, v9];
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(ARReferenceObject *)self referenceOriginTransform];
    float32x4_t v20 = v7;
    float32x4_t v21 = v6;
    float32x4_t v18 = v9;
    float32x4_t v19 = v8;
    [v5 referenceOriginTransform];
    if (AREqualTransforms(v21, v20, v19, v18, v10, v11, v12, v13))
    {
      __n128 v14 = [v5 trackingData];
      int v15 = [(ARReferenceObject *)self trackingData];
      char v16 = [v14 isEqual:v15];
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_identifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ARReferenceObject version](self, "version"), @"version");
  id v5 = [(ARReferenceObject *)self trackingData];
  [v4 encodeObject:v5 forKey:@"trackingData"];

  [(ARReferenceObject *)self referenceOriginTransform];
  objc_msgSend(v4, "ar_encodeMatrix4x4:forKey:", @"referenceOriginTransform");
  id v6 = [(ARReferenceObject *)self name];
  [v4 encodeObject:v6 forKey:@"name"];
}

- (ARReferenceObject)initWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"version"];
  if (v5 >= 2)
  {
    id v6 = ARErrorWithCodeAndUserInfo(301, 0);
    [v4 failWithError:v6];

    float32x4_t v7 = _ARLogGeneral_31();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      float32x4_t v8 = (objc_class *)objc_opt_class();
      float32x4_t v9 = NSStringFromClass(v8);
      int v20 = 138543874;
      float32x4_t v21 = v9;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      __int16 v24 = 2048;
      uint64_t v25 = v5;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Unsupported object version (%ld)", (uint8_t *)&v20, 0x20u);
    }
LABEL_11:
    __n128 v14 = 0;
    goto LABEL_12;
  }
  float32x4_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trackingData"];
  if (!v7)
  {
    int v15 = ARErrorWithCodeAndUserInfo(301, 0);
    [v4 failWithError:v15];

    char v16 = _ARLogGeneral_31();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      float32x4_t v17 = (objc_class *)objc_opt_class();
      float32x4_t v18 = NSStringFromClass(v17);
      int v20 = 138543618;
      float32x4_t v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object: Malformed data", (uint8_t *)&v20, 0x16u);
    }
    goto LABEL_11;
  }
  objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"referenceOriginTransform");
  float32x4_t v10 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](self, "initWithTrackingData:referenceOriginTransform:", v7);
  float32x4_t v11 = v10;
  if (v10)
  {
    v10->_version = v5;
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v11->_name;
    v11->_name = (NSString *)v12;
  }
  self = v11;
  __n128 v14 = self;
LABEL_12:

  return v14;
}

+ (id)referenceObjectsInGroupNamed:(id)a3 catalog:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  uint64_t v5 = objc_msgSend(a4, "namedRecognitionGroupWithName:");
  if (v5)
  {
    id v38 = (id)objc_opt_new();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v6 = [v5 namedRecognitionObjectObjectList];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (!v7) {
      goto LABEL_26;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v54;
    float32x4_t v40 = v5;
    uint64_t v50 = *(void *)v54;
    v51 = v6;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v52 = v8;
      do
      {
        if (*(void *)v54 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v53 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = v5;
          float32x4_t v13 = [v5 recognitionObjectWithName:v11];
          __n128 v14 = v13;
          if (v13
            && ([v13 objectData],
                int v15 = objc_claimAutoreleasedReturnValue(),
                v15,
                v15))
          {
            uint64_t v16 = [v14 version];
            if (v16 < 2)
            {
              uint64_t v23 = [v14 objectData];
              +[ARWorldMap boundsForTrackingData:v23];

              [v14 referenceOriginTransformation];
              float32x4_t v45 = v25;
              float32x4_t v47 = v24;
              float32x4_t v41 = v27;
              float32x4_t v42 = v26;
              ARMatrix4x4FromRotationAndTranslation();
              uint64_t v28 = 0;
              v57[0] = v29;
              v57[1] = v30;
              v57[2] = v31;
              v57[3] = v32;
              memset(buf, 0, sizeof(buf));
              long long v60 = 0u;
              *(_OWORD *)v61 = 0u;
              do
              {
                *(float32x4_t *)&buf[v28 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(v57[v28])), v45, *(float32x2_t *)&v57[v28], 1), v42, (float32x4_t)v57[v28], 2), v41, (float32x4_t)v57[v28], 3);
                ++v28;
              }
              while (v28 != 4);
              double v46 = *(double *)&v60;
              double v48 = v61[0];
              double v43 = *(double *)buf;
              double v44 = *(double *)&buf[16];
              long long v33 = [ARReferenceObject alloc];
              __int16 v34 = [v14 objectData];
              float32x4_t v18 = -[ARReferenceObject initWithTrackingData:referenceOriginTransform:](v33, "initWithTrackingData:referenceOriginTransform:", v34, v43, v44, v46, v48);

              [v18 setName:v11];
              [v18 setResourceGroupName:v39];
              [v38 addObject:v18];
              uint64_t v12 = v40;
              uint64_t v9 = v50;
              id v6 = v51;
            }
            else
            {
              uint64_t v17 = v16;
              float32x4_t v18 = _ARLogGeneral_31();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                float32x4_t v19 = (objc_class *)objc_opt_class();
                int v20 = NSStringFromClass(v19);
                *(_DWORD *)buf = 138544130;
                *(void *)&buf[4] = v20;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = a1;
                *(_WORD *)&buf[22] = 2114;
                *(void *)&buf[24] = v11;
                LOWORD(v60) = 2048;
                *(void *)((char *)&v60 + 2) = v17;
                _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error loading reference object %{public}@: Unsupported object version (%ld)", buf, 0x2Au);

                uint64_t v9 = v50;
                uint64_t v12 = v40;
              }
LABEL_15:
              id v6 = v51;
            }
          }
          else
          {
            float32x4_t v18 = _ARLogGeneral_31();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              float32x4_t v21 = (objc_class *)objc_opt_class();
              __int16 v22 = NSStringFromClass(v21);
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = a1;
              uint64_t v9 = v50;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v11;
              _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Invalid reference object in catalog: %{public}@", buf, 0x20u);

              goto LABEL_15;
            }
          }

          uint64_t v8 = v52;
          uint64_t v5 = v12;
        }
        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (!v8) {
        goto LABEL_26;
      }
    }
  }
  id v6 = _ARLogGeneral_31();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v35 = (objc_class *)objc_opt_class();
    uint64_t v36 = NSStringFromClass(v35);
    *(_DWORD *)buf = 138543874;
    *(void *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a1;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v39;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: No resource group with name \"%{public}@\" found", buf, 0x20u);
  }
  id v38 = 0;
LABEL_26:

  return v38;
}

- (void)setResourceGroupName:(id)a3
{
}

+ (NSSet)referenceObjectsInGroupNamed:(NSString *)name bundle:(NSBundle *)bundle
{
  uint64_t v5 = bundle;
  id v6 = name;
  uint64_t v7 = [(id)objc_opt_class() referenceObjectsInGroupNamed:v6 catalogName:@"Assets" bundle:v5];

  return (NSSet *)v7;
}

+ (id)referenceObjectsInGroupNamed:(id)a3 catalogName:(id)a4 bundle:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v18 = 0;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F5E048]) initWithName:v9 fromBundle:v10 error:&v18];
  id v12 = v18;
  if (v12)
  {
    float32x4_t v13 = _ARLogGeneral_31();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __n128 v14 = (objc_class *)objc_opt_class();
      int v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138544386;
      int v20 = v15;
      __int16 v21 = 2048;
      id v22 = a1;
      __int16 v23 = 2114;
      id v24 = v9;
      __int16 v25 = 2114;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v12;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error while opening catalog named \"%{public}@\" in bundle \"%{public}@\": %@", buf, 0x34u);
    }
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v16 = [(id)objc_opt_class() referenceObjectsInGroupNamed:v8 catalog:v11];
  }

  return v16;
}

+ (id)referenceObjectsInGroupNamed:(id)a3 catalogURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v15 = 0;
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F5E048]) initWithURL:v7 error:&v15];
  id v9 = v15;
  if (v9)
  {
    id v10 = _ARLogGeneral_31();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      id v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138544386;
      uint64_t v17 = v12;
      __int16 v18 = 2048;
      id v19 = a1;
      __int16 v20 = 2114;
      id v21 = v6;
      __int16 v22 = 2114;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error while opening catalog named \"%{public}@\" from URL \"%{public}@\": %@", buf, 0x34u);
    }
    float32x4_t v13 = 0;
  }
  else
  {
    float32x4_t v13 = [(id)objc_opt_class() referenceObjectsInGroupNamed:v6 catalog:v8];
  }

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (simd_float3)center
{
  return *(simd_float3 *)self->_center;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (NSString)resourceGroupName
{
  return self->_resourceGroupName;
}

- (ARPointCloud)rawFeaturePoints
{
  return self->_rawFeaturePoints;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)trackingData
{
  return self->_trackingData;
}

- (__n128)referenceOriginTransform
{
  return a1[6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_rawFeaturePoints, 0);
  objc_storeStrong((id *)&self->_resourceGroupName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_keyframes, 0);
}

@end