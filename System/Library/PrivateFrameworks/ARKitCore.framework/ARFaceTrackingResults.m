@interface ARFaceTrackingResults
+ (BOOL)supportsSecureCoding;
- (ARFaceTrackingResults)initWithCoder:(id)a3;
- (NSArray)trackedFaces;
- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(uint64_t)a6;
- (void)encodeWithCoder:(id)a3;
- (void)setTrackedFaces:(id)a3;
@end

@implementation ARFaceTrackingResults

- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(uint64_t)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v36 = a7;
  v41 = objc_opt_new();
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = v36;
  uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v41 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    }
    while (v8);
  }

  v45 = ARDictionaryFromAnchors(v41);
  id v44 = (id)objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v42 = [a1 trackedFaces];
  uint64_t v12 = [v42 countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v42);
        }
        v15 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        if ([v15 isValid])
        {
          v16 = [v15 identifier];
          v17 = [v45 objectForKeyedSubscript:v16];

          v18 = [ARFaceAnchor alloc];
          if (v17) {
            [v17 identifier];
          }
          else {
          v19 = [v15 identifier];
          }
          v20 = [(ARFaceAnchor *)v18 initWithIdentifier:v19 trackingData:v15];

          [(ARAnchor *)v20 transform];
          uint64_t v21 = 0;
          v58[0] = v22;
          v58[1] = v23;
          v58[2] = v24;
          v58[3] = v25;
          do
          {
            *(long long *)((char *)&v59 + v21 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(v58[v21])), a3, *(float32x2_t *)&v58[v21], 1), a4, (float32x4_t)v58[v21], 2), a5, (float32x4_t)v58[v21], 3);
            ++v21;
          }
          while (v21 != 4);
          -[ARAnchor setTransform:](v20, "setTransform:", *(double *)&v59, *(double *)&v60, *(double *)&v61, *(double *)&v62);
          v26 = [(ARAnchor *)v20 identifier];
          [v45 removeObjectForKey:v26];

          [v44 addObject:v20];
        }
      }
      uint64_t v12 = [v42 countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v12);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v27 = [v45 allValues];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = *(void **)(*((void *)&v46 + 1) + 8 * k);
        if ([v31 isTracked])
        {
          v32 = [ARFaceAnchor alloc];
          v33 = [v31 trackingError];
          v34 = [(ARFaceAnchor *)v32 initWithExistingFaceAnchor:v31 tracked:0 trackingError:v33];

          [v44 addObject:v34];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v46 objects:v63 count:16];
    }
    while (v28);
  }

  return v44;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(ARFaceTrackingResults *)self trackedFaces];
  [v5 encodeObject:v4 forKey:@"trackedFaces"];
}

- (ARFaceTrackingResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARFaceTrackingResults;
  id v5 = [(ARFaceTrackingResults *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"trackedFaces"];
    trackedFaces = v5->_trackedFaces;
    v5->_trackedFaces = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)trackedFaces
{
  return self->_trackedFaces;
}

- (void)setTrackedFaces:(id)a3
{
}

- (void).cxx_destruct
{
}

@end