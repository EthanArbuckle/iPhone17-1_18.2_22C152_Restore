@interface ARAppClipCodeResultData
+ (BOOL)supportsSecureCoding;
- (ARAppClipCodeResultData)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)trackedAppClipCodes;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setTrackedAppClipCodes:(id)a3;
@end

@implementation ARAppClipCodeResultData

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v13 = a11;
  id v76 = a12;
  v14 = objc_opt_new();
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v104 objects:v115 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v105;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v105 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v104 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v20;
          v22 = [v21 instanceID];
          [v14 setObject:v21 forKey:v22];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v104 objects:v115 count:16];
    }
    while (v17);
  }
  v74 = v15;

  id v85 = (id)objc_opt_new();
  long long v100 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  uint64_t v23 = a1;
  obuint64_t j = [*(id *)(a1 + 8) allKeys];
  uint64_t v24 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
  v79 = v14;
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v80 = *(void *)v101;
    do
    {
      uint64_t v26 = 0;
      uint64_t v77 = v25;
      do
      {
        if (*(void *)v101 != v80) {
          objc_enumerationMutation(obj);
        }
        uint64_t v27 = *(void *)(*((void *)&v100 + 1) + 8 * v26);
        v28 = [*(id *)(v23 + 8) objectForKeyedSubscript:v27];
        v29 = [v14 objectForKeyedSubscript:v27];
        v30 = v29;
        if (v29)
        {
          uint64_t v31 = [v29 url];
          if (v31)
          {
            v32 = (void *)v31;
            uint64_t v33 = [v28 url];
            if (v33)
            {
              v34 = (void *)v33;
              v35 = [v30 url];
              v36 = [v28 url];

              BOOL v37 = v35 == v36;
              uint64_t v23 = a1;
              v14 = v79;
              uint64_t v25 = v77;
              if (!v37)
              {
                if (_ARLogGeneral_onceToken_40 != -1) {
                  dispatch_once(&_ARLogGeneral_onceToken_40, &__block_literal_global_94);
                }
                v38 = (void *)_ARLogGeneral_logObj_40;
                if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_40, OS_LOG_TYPE_ERROR))
                {
                  v39 = v38;
                  v40 = [v30 url];
                  v41 = [v28 url];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v40;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v41;
                  _os_log_impl(&dword_1B88A2000, v39, OS_LOG_TYPE_ERROR, "ARAppClipCodeResultData: URL of app clip code instance changed from %@ to %@. This should not happen.", buf, 0x16u);

                  uint64_t v23 = a1;
                  uint64_t v25 = v77;
                }
              }
            }
            else
            {

              uint64_t v25 = v77;
            }
          }
          v42 = (ARAppClipCodeAnchor *)[v30 copyWithAppClipCodeResult:v28 isTracked:1];
        }
        else
        {
          v42 = [[ARAppClipCodeAnchor alloc] initWithAppClipCodeResult:v28 instanceID:v27];
        }
        v43 = v42;
        [v28 codeToWorldVisionTransform];
        uint64_t v48 = 0;
        long long v108 = xmmword_1B8A56620;
        long long v109 = xmmword_1B8A56630;
        long long v110 = xmmword_1B8A56640;
        long long v111 = xmmword_1B8A2B050;
        memset(buf, 0, sizeof(buf));
        float32x4_t v117 = 0u;
        float32x4_t v118 = 0u;
        do
        {
          *(float32x4_t *)&buf[v48] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(long long *)((char *)&v108 + v48))), v45, *(float32x2_t *)((char *)&v108 + v48), 1), v46, *(float32x4_t *)((char *)&v108 + v48), 2), v47, *(float32x4_t *)((char *)&v108 + v48), 3);
          v48 += 16;
        }
        while (v48 != 64);
        *(_OWORD *)v88 = *(_OWORD *)&buf[16];
        long long v90 = *(_OWORD *)buf;
        long long v86 = (__int128)v118;
        long long v87 = (__int128)v117;
        *(double *)&long long v49 = ARVisionToRenderingCoordinateTransform();
        uint64_t v50 = 0;
        long long v108 = v49;
        long long v109 = v51;
        long long v110 = v52;
        long long v111 = v53;
        memset(buf, 0, sizeof(buf));
        float32x4_t v117 = 0u;
        float32x4_t v118 = 0u;
        do
        {
          *(float32x4_t *)&buf[v50] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(long long *)((char *)&v108 + v50))), a7, *(float32x2_t *)((char *)&v108 + v50), 1), a8, *(float32x4_t *)((char *)&v108 + v50), 2), a9, *(float32x4_t *)((char *)&v108 + v50), 3);
          v50 += 16;
        }
        while (v50 != 64);
        uint64_t v54 = 0;
        float32x4_t v55 = *(float32x4_t *)buf;
        float32x4_t v56 = *(float32x4_t *)&buf[16];
        float32x4_t v57 = v117;
        float32x4_t v58 = v118;
        long long v108 = v90;
        long long v109 = *(_OWORD *)v88;
        long long v110 = v87;
        long long v111 = v86;
        memset(buf, 0, sizeof(buf));
        float32x4_t v117 = 0u;
        float32x4_t v118 = 0u;
        do
        {
          *(float32x4_t *)&buf[v54] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v55, COERCE_FLOAT(*(long long *)((char *)&v108 + v54))), v56, *(float32x2_t *)((char *)&v108 + v54), 1), v57, *(float32x4_t *)((char *)&v108 + v54), 2), v58, *(float32x4_t *)((char *)&v108 + v54), 3);
          v54 += 16;
        }
        while (v54 != 64);
        -[ARAnchor setTransform:](v43, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)v117.i64, *(double *)v118.i64);
        if (v43)
        {
          [v85 addObject:v43];
          [v14 removeObjectForKey:v27];
        }

        ++v26;
      }
      while (v26 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v100 objects:v114 count:16];
    }
    while (v25);
  }

  v91 = (void *)[v85 copy];
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  v89 = [v14 allValues];
  uint64_t v59 = [v89 countByEnumeratingWithState:&v96 objects:v113 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v97 != v61) {
          objc_enumerationMutation(v89);
        }
        v63 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        v64 = [v63 url];

        if (v64)
        {
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id v65 = v91;
          uint64_t v66 = [v65 countByEnumeratingWithState:&v92 objects:v112 count:16];
          if (v66)
          {
            uint64_t v67 = v66;
            uint64_t v68 = *(void *)v93;
            while (2)
            {
              for (uint64_t k = 0; k != v67; ++k)
              {
                if (*(void *)v93 != v68) {
                  objc_enumerationMutation(v65);
                }
                v70 = [*(id *)(*((void *)&v92 + 1) + 8 * k) url];
                v71 = [v63 url];

                if (v70 == v71)
                {

                  [v76 addObject:v63];
                  v14 = v79;
                  goto LABEL_53;
                }
              }
              uint64_t v67 = [v65 countByEnumeratingWithState:&v92 objects:v112 count:16];
              if (v67) {
                continue;
              }
              break;
            }
          }

          v14 = v79;
        }
        v72 = (void *)[v63 copyWithTrackedState:0];
        [v85 addObject:v72];

LABEL_53:
        ;
      }
      uint64_t v60 = [v89 countByEnumeratingWithState:&v96 objects:v113 count:16];
    }
    while (v60);
  }

  return v85;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ARAppClipCodeResultData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARAppClipCodeResultData;
  v5 = [(ARAppClipCodeResultData *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"trackedAppClipCodes"];
    trackedAppClipCodes = v5->_trackedAppClipCodes;
    v5->_trackedAppClipCodes = (NSDictionary *)v10;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSDictionary *)self->_trackedAppClipCodes copyWithZone:a3];
  uint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 trackedAppClipCodes];
    uint64_t v6 = [(ARAppClipCodeResultData *)self trackedAppClipCodes];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDictionary)trackedAppClipCodes
{
  return self->_trackedAppClipCodes;
}

- (void)setTrackedAppClipCodes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end