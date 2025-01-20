@interface ARWorldTrackingReferenceAnchorData
+ (BOOL)supportsSecureCoding;
- (ARWorldTrackingReferenceAnchorData)initWithCoder:(id)a3;
- (ARWorldTrackingReferenceAnchorData)initWithUpdatedAnchors:(id)a3 addedAnchors:(id)a4 removedAnchors:(id)a5 externalAnchors:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSSet)addedAnchors;
- (NSSet)externalAnchors;
- (NSSet)receivedAnchors;
- (NSSet)removedAnchors;
- (NSSet)updatedAnchors;
- (double)timestamp;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
- (id)externalAnchorsWithReferenceOriginTransform:(float32x4_t)a3 existingAnchors:(float32x4_t)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setReceivedAnchors:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARWorldTrackingReferenceAnchorData

- (ARWorldTrackingReferenceAnchorData)initWithUpdatedAnchors:(id)a3 addedAnchors:(id)a4 removedAnchors:(id)a5 externalAnchors:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ARWorldTrackingReferenceAnchorData;
  v15 = [(ARWorldTrackingReferenceAnchorData *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_updatedAnchors, a3);
    objc_storeStrong((id *)&v16->_addedAnchors, a4);
    objc_storeStrong((id *)&v16->_removedAnchors, a5);
    objc_storeStrong((id *)&v16->_externalAnchors, a6);
    uint64_t v17 = [MEMORY[0x1E4F1CAD0] set];
    receivedAnchors = v16->_receivedAnchors;
    v16->_receivedAnchors = (NSSet *)v17;
  }
  return v16;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v14 = a11;
  id v80 = a12;
  v15 = [a1 updatedAnchors];
  [v15 count];
  v16 = [a1 addedAnchors];
  [v16 count];
  uint64_t v17 = [a1 removedAnchors];
  [v17 count];
  kdebug_trace();

  v81 = v14;
  v97 = ARDictionaryFromAnchors(v14);
  v96 = objc_opt_new();
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  v18 = [a1 updatedAnchors];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v106 objects:v116 count:16];
  v83 = a1;
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v107;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v107 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        v24 = [v23 identifier];
        v25 = [v97 objectForKey:v24];

        if (!v25)
        {
          v35 = _ARLogGeneral_37();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v43 = (objc_class *)objc_opt_class();
            v44 = NSStringFromClass(v43);
            v45 = [v23 identifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v44;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v45;
            _os_log_impl(&dword_1B88A2000, v35, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VIO returned an updated anchor that is not surfaced by ARSession: %{public}@", buf, 0x20u);

            a1 = v83;
          }
          goto LABEL_16;
        }
        [a1 timestamp];
        double v27 = v26;
        [v25 lastUpdateTimestamp];
        if (v27 > v28)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            [v25 referenceTransform];
            ARInnerScaleFromMatrix(v29, v30);
            ARMatrixFromScale();
            long long v92 = v32;
            long long v94 = v31;
            long long v88 = v34;
            long long v90 = v33;
            v35 = [v25 copy];
            [v23 transform];
            uint64_t v40 = 0;
            long long v110 = v94;
            long long v111 = v92;
            long long v112 = v90;
            long long v113 = v88;
            memset(buf, 0, sizeof(buf));
            long long v118 = 0u;
            *(_OWORD *)v119 = 0u;
            do
            {
              *(float32x4_t *)&buf[v40] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v36, COERCE_FLOAT(*(long long *)((char *)&v110 + v40))), v37, *(float32x2_t *)((char *)&v110 + v40), 1), v38, *(float32x4_t *)((char *)&v110 + v40), 2), v39, *(float32x4_t *)((char *)&v110 + v40), 3);
              v40 += 16;
            }
            while (v40 != 64);
            uint64_t v41 = 0;
            long long v110 = *(_OWORD *)buf;
            long long v111 = *(_OWORD *)&buf[16];
            long long v112 = v118;
            long long v113 = *(_OWORD *)v119;
            memset(buf, 0, sizeof(buf));
            long long v118 = 0u;
            *(_OWORD *)v119 = 0u;
            do
            {
              *(float32x4_t *)&buf[v41] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(long long *)((char *)&v110 + v41))), a7, *(float32x2_t *)((char *)&v110 + v41), 1), a8, *(float32x4_t *)((char *)&v110 + v41), 2), a9, *(float32x4_t *)((char *)&v110 + v41), 3);
              v41 += 16;
            }
            while (v41 != 64);
            -[NSObject setTransform:](v35, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v118, v119[0]);
            v42 = [v23 sessionIdentifier];
            [v35 setSessionIdentifier:v42];

            [v96 addObject:v35];
LABEL_16:
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v106 objects:v116 count:16];
    }
    while (v20);
  }

  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = [a1 addedAnchors];
  uint64_t v46 = [obj countByEnumeratingWithState:&v102 objects:v115 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v103;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v103 != v48) {
          objc_enumerationMutation(obj);
        }
        v50 = *(void **)(*((void *)&v102 + 1) + 8 * j);
        v51 = [a1[6] member:v50];
        v52 = v51;
        if (v51)
        {
          [v51 referenceTransform];
          ARInnerScaleFromMatrix(v53, v54);
          ARMatrixFromScale();
          long long v93 = v56;
          long long v95 = v55;
          long long v89 = v58;
          long long v91 = v57;
          v59 = [v52 copy];
          [v50 transform];
          uint64_t v64 = 0;
          long long v110 = v95;
          long long v111 = v93;
          long long v112 = v91;
          long long v113 = v89;
          memset(buf, 0, sizeof(buf));
          long long v118 = 0u;
          *(_OWORD *)v119 = 0u;
          do
          {
            *(float32x4_t *)&buf[v64] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v60, COERCE_FLOAT(*(long long *)((char *)&v110 + v64))), v61, *(float32x2_t *)((char *)&v110 + v64), 1), v62, *(float32x4_t *)((char *)&v110 + v64), 2), v63, *(float32x4_t *)((char *)&v110 + v64), 3);
            v64 += 16;
          }
          while (v64 != 64);
          uint64_t v65 = 0;
          long long v110 = *(_OWORD *)buf;
          long long v111 = *(_OWORD *)&buf[16];
          long long v112 = v118;
          long long v113 = *(_OWORD *)v119;
          memset(buf, 0, sizeof(buf));
          long long v118 = 0u;
          *(_OWORD *)v119 = 0u;
          do
          {
            *(float32x4_t *)&buf[v65] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(long long *)((char *)&v110 + v65))), a7, *(float32x2_t *)((char *)&v110 + v65), 1), a8, *(float32x4_t *)((char *)&v110 + v65), 2), a9, *(float32x4_t *)((char *)&v110 + v65), 3);
            v65 += 16;
          }
          while (v65 != 64);
          -[NSObject setTransform:](v59, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v118, v119[0]);
          v66 = [v50 sessionIdentifier];
          [v59 setSessionIdentifier:v66];

          [v96 addObject:v59];
        }
        else
        {
          v59 = _ARLogGeneral_37();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          {
            v67 = (objc_class *)objc_opt_class();
            v68 = NSStringFromClass(v67);
            v69 = [v50 identifier];
            *(_DWORD *)buf = 138543874;
            *(void *)&buf[4] = v68;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v83;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v69;
            _os_log_impl(&dword_1B88A2000, v59, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Ignoring locally added anchor: %{public}@", buf, 0x20u);

            a1 = v83;
          }
        }
      }
      uint64_t v47 = [obj countByEnumeratingWithState:&v102 objects:v115 count:16];
    }
    while (v47);
  }

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v70 = [a1 removedAnchors];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v98 objects:v114 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v99;
    do
    {
      for (uint64_t k = 0; k != v72; ++k)
      {
        if (*(void *)v99 != v73) {
          objc_enumerationMutation(v70);
        }
        v75 = *(void **)(*((void *)&v98 + 1) + 8 * k);
        v76 = [v75 identifier];
        v77 = [v97 objectForKey:v76];

        if ([v77 isMemberOfClass:objc_opt_class()])
        {
          [v96 removeObject:v75];
          [v80 addObject:v75];
        }
      }
      uint64_t v72 = [v70 countByEnumeratingWithState:&v98 objects:v114 count:16];
    }
    while (v72);
  }

  [v96 count];
  [v80 count];
  kdebug_trace();
  v78 = [v96 allObjects];

  return v78;
}

- (id)externalAnchorsWithReferenceOriginTransform:(float32x4_t)a3 existingAnchors:(float32x4_t)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a7;
  v9 = [a1 externalAnchors];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    id v11 = objc_opt_new();
    id v12 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    float32x4_t v39 = (id *)a1;
    obuint64_t j = [a1 externalAnchors];
    uint64_t v13 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (!v13) {
      goto LABEL_20;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v50;
    float32x4_t v38 = v12;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v50 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v49 + 1) + 8 * v16);
        v18 = [v12 member:v17];
        if (v18
          || ([v39[6] member:v17], (v18 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          [v18 referenceTransform];
          ARInnerScaleFromMatrix(v19, v20);
          ARMatrixFromScale();
          long long v47 = v22;
          long long v48 = v21;
          long long v45 = v24;
          long long v46 = v23;
          id v25 = [v18 copy];
          [v17 transform];
          uint64_t v30 = 0;
          long long v53 = v48;
          long long v54 = v47;
          long long v55 = v46;
          long long v56 = v45;
          memset(buf, 0, sizeof(buf));
          long long v59 = 0u;
          long long v60 = 0u;
          do
          {
            *(float32x4_t *)&buf[v30] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(long long *)((char *)&v53 + v30))), v27, *(float32x2_t *)((char *)&v53 + v30), 1), v28, *(float32x4_t *)((char *)&v53 + v30), 2), v29, *(float32x4_t *)((char *)&v53 + v30), 3);
            v30 += 16;
          }
          while (v30 != 64);
          uint64_t v31 = 0;
          long long v53 = *(_OWORD *)buf;
          long long v54 = *(_OWORD *)&buf[16];
          long long v55 = v59;
          long long v56 = v60;
          memset(buf, 0, sizeof(buf));
          long long v59 = 0u;
          long long v60 = 0u;
          do
          {
            *(float32x4_t *)&buf[v31] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(long long *)((char *)&v53 + v31))), a3, *(float32x2_t *)((char *)&v53 + v31), 1), a4, *(float32x4_t *)((char *)&v53 + v31), 2), a5, *(float32x4_t *)((char *)&v53 + v31), 3);
            v31 += 16;
          }
          while (v31 != 64);
          objc_msgSend(v25, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v59, *(double *)&v60);
          long long v32 = [v17 sessionIdentifier];
          [v25 setSessionIdentifier:v32];

          [v11 addObject:v25];
          goto LABEL_14;
        }
        v18 = _ARLogGeneral_37();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          long long v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          long long v34 = [v17 identifier];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v25;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v39;
          id v12 = v38;
          *(_WORD *)&buf[22] = 2114;
          *(void *)&buf[24] = v34;
          _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: External anchor was neither found in received list nor existing anchors: %{public}@", buf, 0x20u);

LABEL_14:
        }

        ++v16;
      }
      while (v16 != v14);
      uint64_t v35 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
      uint64_t v14 = v35;
      if (!v35)
      {
LABEL_20:

        float32x4_t v36 = [v11 allObjects];

        goto LABEL_22;
      }
    }
  }
  float32x4_t v36 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_22:

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeObject:self->_updatedAnchors forKey:@"updatedAnchors"];
  [v5 encodeObject:self->_addedAnchors forKey:@"addedAnchors"];
  [v5 encodeObject:self->_removedAnchors forKey:@"removedAnchors"];
  [v5 encodeObject:self->_externalAnchors forKey:@"externalAnchors"];
}

- (ARWorldTrackingReferenceAnchorData)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ARWorldTrackingReferenceAnchorData;
  id v5 = [(ARWorldTrackingReferenceAnchorData *)&v32 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_double timestamp = v6;
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"updatedAnchors"];
    updatedAnchors = v5->_updatedAnchors;
    v5->_updatedAnchors = (NSSet *)v11;

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"addedAnchors"];
    addedAnchors = v5->_addedAnchors;
    v5->_addedAnchors = (NSSet *)v17;

    float32x4_t v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    long long v22 = objc_msgSend(v19, "setWithObjects:", v20, v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"removedAnchors"];
    removedAnchors = v5->_removedAnchors;
    v5->_removedAnchors = (NSSet *)v23;

    id v25 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v26 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    float32x4_t v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"externalAnchors"];
    externalAnchors = v5->_externalAnchors;
    v5->_externalAnchors = (NSSet *)v29;
  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (double *)v4;
    BOOL v6 = vabdd_f64(self->_timestamp, v5[1]) < 2.22044605e-16
      && [(NSSet *)self->_updatedAnchors isEqualToSet:*((void *)v5 + 2)]
      && [(NSSet *)self->_addedAnchors isEqualToSet:*((void *)v5 + 3)]
      && [(NSSet *)self->_removedAnchors isEqualToSet:*((void *)v5 + 4)]
      && [(NSSet *)self->_externalAnchors isEqualToSet:*((void *)v5 + 5)];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (NSSet)updatedAnchors
{
  return self->_updatedAnchors;
}

- (NSSet)addedAnchors
{
  return self->_addedAnchors;
}

- (NSSet)removedAnchors
{
  return self->_removedAnchors;
}

- (NSSet)externalAnchors
{
  return self->_externalAnchors;
}

- (NSSet)receivedAnchors
{
  return self->_receivedAnchors;
}

- (void)setReceivedAnchors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedAnchors, 0);
  objc_storeStrong((id *)&self->_externalAnchors, 0);
  objc_storeStrong((id *)&self->_removedAnchors, 0);
  objc_storeStrong((id *)&self->_addedAnchors, 0);
  objc_storeStrong((id *)&self->_updatedAnchors, 0);
}

@end