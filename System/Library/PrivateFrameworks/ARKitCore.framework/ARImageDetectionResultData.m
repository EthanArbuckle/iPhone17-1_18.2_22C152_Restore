@interface ARImageDetectionResultData
+ (id)tracingEntryFormat;
- (ARCamera)currentCamera;
- (BOOL)detectionOnly;
- (BOOL)isEqual:(id)a3;
- (BOOL)predicted;
- (BOOL)providesWorldTrackingCameraPose;
- (NSArray)detectedImages;
- (NSDictionary)tracingEntry;
- (NSString)description;
- (double)timestamp;
- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(float32x4_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCurrentCamera:(id)a3;
- (void)setDetectedImages:(id)a3;
- (void)setDetectionOnly:(BOOL)a3;
- (void)setPredicted:(BOOL)a3;
- (void)setProvidesWorldTrackingCameraPose:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ARImageDetectionResultData

- (id)anchorsForCameraWithTransform:(float32x4_t)a3 referenceOriginTransform:(float32x4_t)a4 existingAnchors:(float32x4_t)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  id v14 = a11;
  id v136 = a12;
  if (anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__onceToken != -1) {
    dispatch_once(&anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__onceToken, &__block_literal_global_107);
  }
  v153 = objc_opt_new();
  long long v188 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v191 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v188 objects:v194 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v189;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v189 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v188 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v21 = [v20 identifier];
          [v153 setObject:v20 forKey:v21];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v188 objects:v194 count:16];
    }
    while (v17);
  }
  id v135 = v15;

  v150 = objc_opt_new();
  long long v184 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v187 = 0u;
  obuint64_t j = [a1 detectedImages];
  v22 = v153;
  uint64_t v154 = [obj countByEnumeratingWithState:&v184 objects:v193 count:16];
  if (v154)
  {
    uint64_t v152 = *(void *)v185;
    long long v143 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    long long v144 = *MEMORY[0x1E4F149A0];
    long long v141 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
    long long v142 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
    do
    {
      for (uint64_t j = 0; j != v154; ++j)
      {
        if (*(void *)v185 != v152) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v184 + 1) + 8 * j);
        v25 = objc_msgSend(v24, "referenceImage", v135, v136);
        v26 = [v25 identifier];
        v27 = [v22 objectForKeyedSubscript:v26];

        if (v27)
        {
          v28 = (void *)[v27 copyWithTrackedState:1];
        }
        else
        {
          uint64_t v29 = [a1 detectionOnly];
          if (ARLinkedOnOrAfterAzulE())
          {
            v30 = off_1E6184000;
          }
          else
          {
            v30 = off_1E6184000;
            if ([a1 detectionOnly]) {
              uint64_t v29 = 1;
            }
            else {
              uint64_t v29 = [a1 providesWorldTrackingCameraPose];
            }
          }
          id v31 = objc_alloc(v30[2]);
          v32 = [v24 referenceImage];
          v28 = objc_msgSend(v31, "initWithReferenceImage:transform:detectionOnly:tracked:", v32, v29, 1, *(double *)&v144, *(double *)&v143, *(double *)&v142, *(double *)&v141);
        }
        v33 = [v28 identifier];
        [v22 removeObjectForKey:v33];

        *(double *)v34.i64 = ARVisionCameraToRenderingCoordinateTransform();
        float32x4_t v171 = v35;
        float32x4_t v176 = v34;
        float32x4_t v165 = v37;
        float32x4_t v168 = v36;
        [v24 visionTransform];
        uint64_t v38 = 0;
        *(_OWORD *)buf = v39;
        *(_OWORD *)&buf[16] = v40;
        long long v196 = v41;
        long long v197 = v42;
        float32x4_t v198 = 0u;
        float32x4_t v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v38) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v176, COERCE_FLOAT(*(_OWORD *)&buf[v38])), v171, *(float32x2_t *)&buf[v38], 1), v168, *(float32x4_t *)&buf[v38], 2), v165, *(float32x4_t *)&buf[v38], 3);
          v38 += 16;
        }
        while (v38 != 64);
        uint64_t v43 = 0;
        float32x4_t v44 = v198;
        float32x4_t v45 = v199;
        float32x4_t v46 = (float32x4_t)v200;
        float32x4_t v47 = (float32x4_t)v201;
        *(_OWORD *)buf = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_0;
        *(_OWORD *)&buf[16] = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_1;
        long long v196 = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_2;
        long long v197 = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_3;
        float32x4_t v198 = 0u;
        float32x4_t v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v43) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)&buf[v43])), v45, *(float32x2_t *)&buf[v43], 1), v46, *(float32x4_t *)&buf[v43], 2), v47, *(float32x4_t *)&buf[v43], 3);
          v43 += 16;
        }
        while (v43 != 64);
        float32x4_t v166 = v198;
        float32x4_t v169 = v199;
        long long v172 = v200;
        long long v177 = v201;
        int v48 = [a1 detectionOnly];
        if (!v27
          || !v48
          || (LODWORD(v49) = anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold,
              *(float *)&anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold <= 0.0))
        {
          if (objc_msgSend(a1, "providesWorldTrackingCameraPose", v49))
          {
            [v24 worldTrackingCameraTransformAtDetection];
            uint64_t v113 = 0;
            *(_OWORD *)buf = v114;
            *(_OWORD *)&buf[16] = v115;
            long long v196 = v116;
            long long v197 = v117;
            float32x4_t v198 = 0u;
            float32x4_t v199 = 0u;
            long long v200 = 0u;
            long long v201 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v198 + v113) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(_OWORD *)&buf[v113])), a7, *(float32x2_t *)&buf[v113], 1), a8, *(float32x4_t *)&buf[v113], 2), a9, *(float32x4_t *)&buf[v113], 3);
              v113 += 16;
            }
            while (v113 != 64);
            uint64_t v118 = 0;
            float32x4_t v119 = v198;
            float32x4_t v120 = v199;
            float32x4_t v121 = (float32x4_t)v200;
            float32x4_t v122 = (float32x4_t)v201;
            *(float32x4_t *)buf = v166;
            *(float32x4_t *)&buf[16] = v169;
            long long v196 = v172;
            long long v197 = v177;
            float32x4_t v198 = 0u;
            float32x4_t v199 = 0u;
            long long v200 = 0u;
            long long v201 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v198 + v118) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v119, COERCE_FLOAT(*(_OWORD *)&buf[v118])), v120, *(float32x2_t *)&buf[v118], 1), v121, *(float32x4_t *)&buf[v118], 2), v122, *(float32x4_t *)&buf[v118], 3);
              v118 += 16;
            }
            while (v118 != 64);
          }
          else
          {
            uint64_t v123 = 0;
            *(float32x4_t *)buf = v166;
            *(float32x4_t *)&buf[16] = v169;
            long long v196 = v172;
            long long v197 = v177;
            float32x4_t v198 = 0u;
            float32x4_t v199 = 0u;
            long long v200 = 0u;
            long long v201 = 0u;
            do
            {
              *(float32x4_t *)((char *)&v198 + v123) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)&buf[v123])), a3, *(float32x2_t *)&buf[v123], 1), a4, *(float32x4_t *)&buf[v123], 2), a5, *(float32x4_t *)&buf[v123], 3);
              v123 += 16;
            }
            while (v123 != 64);
          }
          double v109 = *(double *)v198.i64;
          double v110 = *(double *)v199.i64;
          double v111 = *(double *)&v200;
          double v112 = *(double *)&v201;
          v108 = v28;
LABEL_54:
          objc_msgSend(v108, "setTransform:", v109, v110, v111, v112);
          [v24 estimatedScaleFactor];
          objc_msgSend(v28, "setEstimatedScaleFactor:");
          [v150 addObject:v28];
          goto LABEL_58;
        }
        objc_msgSend(v24, "worldTrackingCameraTransformAtDetection", v49);
        uint64_t v50 = 0;
        *(_OWORD *)buf = v51;
        *(_OWORD *)&buf[16] = v52;
        long long v196 = v53;
        long long v197 = v54;
        float32x4_t v198 = 0u;
        float32x4_t v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v50) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(*(_OWORD *)&buf[v50])), a7, *(float32x2_t *)&buf[v50], 1), a8, *(float32x4_t *)&buf[v50], 2), a9, *(float32x4_t *)&buf[v50], 3);
          v50 += 16;
        }
        while (v50 != 64);
        float32x4_t v161 = v198;
        float32x4_t v163 = v199;
        float32x4_t v159 = (float32x4_t)v200;
        float32x4_t v151 = (float32x4_t)v201;
        [v27 transform];
        float32x4_t v157 = v56;
        float32x4_t v158 = v55;
        float32x4_t v155 = v58;
        float32x4_t v156 = v57;
        uint64_t v59 = 0;
        *(float32x4_t *)buf = v166;
        *(float32x4_t *)&buf[16] = v169;
        long long v196 = v172;
        long long v197 = v177;
        float32x4_t v198 = 0u;
        float32x4_t v199 = 0u;
        long long v200 = 0u;
        long long v201 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v198 + v59) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v161, COERCE_FLOAT(*(_OWORD *)&buf[v59])), v163, *(float32x2_t *)&buf[v59], 1), v159, *(float32x4_t *)&buf[v59], 2), v151, *(float32x4_t *)&buf[v59], 3);
          v59 += 16;
        }
        while (v59 != 64);
        float32x4_t v164 = v199;
        float32x4_t v167 = v198;
        float32x4_t v160 = (float32x4_t)v201;
        float32x4_t v162 = (float32x4_t)v200;
        v60 = [v27 referenceImage];
        [v60 physicalSize];
        double v62 = v61;

        v63 = [v27 referenceImage];
        [v63 physicalSize];
        double v65 = v64;

        uint64_t v66 = 0;
        float v67 = v62 * -0.5;
        long long v68 = xmmword_1B8A2B050;
        long long v69 = xmmword_1B8A2B050;
        *(float *)&long long v69 = v67;
        float v70 = v65 * -0.5;
        long long v71 = v69;
        *((float *)&v71 + 2) = v70;
        float v72 = v62 * 0.5;
        *(float *)&long long v68 = v72;
        long long v73 = v68;
        *((float *)&v73 + 2) = v70;
        float v74 = v65 * 0.5;
        *((float *)&v68 + 2) = v74;
        float32x4_t v198 = (float32x4_t)v71;
        float32x4_t v199 = (float32x4_t)v73;
        *((float *)&v69 + 2) = v74;
        long long v200 = v68;
        long long v201 = v69;
        float v75 = 0.0;
        do
        {
          float32x4_t v76 = *(float32x4_t *)((char *)&v198 + v66);
          float32x4_t v77 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v158, v76.f32[0]), v157, *(float32x2_t *)v76.f32, 1), v156, v76, 2), v155, v76, 3);
          unint64_t v78 = vdivq_f32(v77, (float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 3)).u64[0];
          float32x4_t v79 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v167, v76.f32[0]), v164, *(float32x2_t *)v76.f32, 1), v162, v76, 2), v160, v76, 3);
          double v173 = *(double *)&v78;
          *(void *)&double v178 = vdivq_f32(v79, (float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 3)).u64[0];
          v80 = [a1 currentCamera];
          v81 = [a1 currentCamera];
          [v81 imageResolution];
          objc_msgSend(v80, "projectPoint:orientation:viewportSize:", 3, v173, v82, v83);
          float64_t v170 = v85;
          float64_t v174 = v84;

          v86.f64[0] = v174;
          v86.f64[1] = v170;
          float32x2_t v87 = vcvt_f32_f64(v86);
          v88 = [a1 currentCamera];
          v89 = [a1 currentCamera];
          [v89 imageResolution];
          objc_msgSend(v88, "projectPoint:orientation:viewportSize:", 3, v178, v90, v91);
          float64_t v175 = v93;
          float64_t v179 = v92;

          v94.f64[0] = v179;
          v94.f64[1] = v175;
          *(float32x2_t *)&v94.f64[0] = vsub_f32(v87, vcvt_f32_f64(v94));
          float v75 = v75 + sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v94.f64[0], *(float32x2_t *)&v94.f64[0])));
          v66 += 16;
        }
        while (v66 != 64);
        v95 = [a1 currentCamera];
        [v95 imageResolution];
        double v97 = v96;

        v98 = [a1 currentCamera];
        [v98 imageResolution];
        double v100 = v99;

        if (v97 >= v100) {
          double v101 = v100;
        }
        else {
          double v101 = v97;
        }
        float v102 = v101;
        float v103 = *(float *)&anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold
             * v102;
        v104 = _ARLogGeneral_38();
        BOOL v105 = os_log_type_enabled(v104, OS_LOG_TYPE_DEBUG);
        v22 = v153;
        if (v75 > v103)
        {
          if (v105)
          {
            v106 = (objc_class *)objc_opt_class();
            v107 = NSStringFromClass(v106);
            *(_DWORD *)buf = 138544130;
            *(void *)&buf[4] = v107;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = a1;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&buf[24] = v75;
            LOWORD(v196) = 2048;
            *(double *)((char *)&v196 + 2) = v103;
            _os_log_impl(&dword_1B88A2000, v104, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Updated transform of image anchor as the sum of differences of image corners was greater than threshold. (%f > %f)", buf, 0x2Au);
          }
          v108 = v28;
          double v110 = *(double *)v164.i64;
          double v109 = *(double *)v167.i64;
          double v112 = *(double *)v160.i64;
          double v111 = *(double *)v162.i64;
          goto LABEL_54;
        }
        if (v105)
        {
          v124 = (objc_class *)objc_opt_class();
          v125 = NSStringFromClass(v124);
          *(_DWORD *)buf = 138543618;
          *(void *)&buf[4] = v125;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = a1;
          _os_log_impl(&dword_1B88A2000, v104, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Did not update transform of image anchor", buf, 0x16u);
        }
LABEL_58:
      }
      uint64_t v154 = [obj countByEnumeratingWithState:&v184 objects:v193 count:16];
    }
    while (v154);
  }

  long long v182 = 0u;
  long long v183 = 0u;
  long long v180 = 0u;
  long long v181 = 0u;
  v126 = [v22 allValues];
  uint64_t v127 = [v126 countByEnumeratingWithState:&v180 objects:v192 count:16];
  v128 = v135;
  if (v127)
  {
    uint64_t v129 = v127;
    uint64_t v130 = *(void *)v181;
    do
    {
      for (uint64_t k = 0; k != v129; ++k)
      {
        if (*(void *)v181 != v130) {
          objc_enumerationMutation(v126);
        }
        v132 = *(void **)(*((void *)&v180 + 1) + 8 * k);
        if (objc_msgSend(v132, "isTracked", v135))
        {
          v133 = (void *)[v132 copyWithTrackedState:0];
          [v150 addObject:v133];
        }
      }
      uint64_t v129 = [v126 countByEnumeratingWithState:&v180 objects:v192 count:16];
    }
    while (v129);
  }

  [v153 count];
  [v150 count];
  [v150 count];
  kdebug_trace();

  return v150;
}

float __117__ARImageDetectionResultData_anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke()
{
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_0 = xmmword_1B8A56620;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_1 = xmmword_1B8A56630;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_2 = xmmword_1B8A56640;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__renderingToImageCoordinateTransform_3 = xmmword_1B8A2B050;
  +[ARKitUserDefaults floatForKey:@"com.apple.arkit.imagedetection.percentageThresholdPixels"];
  float result = v0 / 100.0;
  anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove__s_percentThreshold = LODWORD(result);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [(id)objc_opt_class() allocWithZone:a3];
  v6 = [(ARImageDetectionResultData *)self detectedImages];
  uint64_t v7 = [v6 copyWithZone:a3];
  v8 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v7;

  *(unsigned char *)(v5 + 10) = [(ARImageDetectionResultData *)self providesWorldTrackingCameraPose];
  *(unsigned char *)(v5 + 8) = [(ARImageDetectionResultData *)self detectionOnly];
  v9 = [(ARImageDetectionResultData *)self currentCamera];
  uint64_t v10 = [v9 copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(unsigned char *)(v5 + 9) = self->_predicted;
  *(double *)(v5 + 16) = self->_timestamp;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    v6 = [v5 detectedImages];
    uint64_t v7 = [(ARImageDetectionResultData *)self detectedImages];
    if ([v6 isEqual:v7]
      && (int v8 = v5[8], v8 == [(ARImageDetectionResultData *)self detectionOnly])
      && (int v9 = v5[10],
          v9 == [(ARImageDetectionResultData *)self providesWorldTrackingCameraPose]))
    {
      uint64_t v10 = [v5 currentCamera];
      v11 = [(ARImageDetectionResultData *)self currentCamera];
      if ([v10 isEqual:v11]
        && self->_predicted == [v5 predicted])
      {
        [v5 timestamp];
        BOOL v13 = v12 == self->_timestamp;
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSString)description
{
  v2 = NSString;
  v3 = [(ARImageDetectionResultData *)self tracingEntry];
  id v4 = [v2 stringWithFormat:@"%@", v3];

  return (NSString *)v4;
}

+ (id)tracingEntryFormat
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (NSDictionary)tracingEntry
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v3 = ARQATraceableDefaultEntryForResultData(self);
  v33 = (void *)[v3 mutableCopy];

  float32x4_t v35 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(ARImageDetectionResultData *)self detectedImages];
  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int v9 = objc_opt_new();
        uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "odtObjectIdentifer"));
        [v9 setObject:v10 forKeyedSubscript:@"odtObjectIdentifer"];

        v11 = [v8 referenceImage];
        double v12 = [v11 identifier];
        BOOL v13 = [v12 UUIDString];
        [v9 setObject:v13 forKeyedSubscript:@"imageIdentifier"];

        [v8 visionTransform];
        id v14 = +[ARQAHelper arrayWithMatrix4x4:](ARQAHelper, "arrayWithMatrix4x4:");
        [v9 setObject:v14 forKeyedSubscript:@"transform"];

        [v8 visionTransform];
        v19 = ARMatrix4x4Description(0, v15, v16, v17, v18);
        [v9 setObject:v19 forKeyedSubscript:@"transformString"];

        v20 = [v8 referenceImage];
        v21 = [v20 name];
        [v9 setObject:v21 forKeyedSubscript:@"referenceImageName"];

        v22 = NSNumber;
        v23 = [v8 referenceImage];
        [v23 physicalSize];
        *(float *)&double v24 = v24;
        v25 = [v22 numberWithFloat:v24];
        v40[0] = v25;
        v26 = NSNumber;
        v27 = [v8 referenceImage];
        [v27 physicalSize];
        *(float *)&double v29 = v28;
        v30 = [v26 numberWithFloat:v29];
        v40[1] = v30;
        id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
        [v9 setObject:v31 forKeyedSubscript:@"referenceImageSize"];

        [v35 addObject:v9];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v5);
  }

  [v33 setObject:v35 forKeyedSubscript:@"detectedImages"];
  return (NSDictionary *)v33;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)detectionOnly
{
  return self->_detectionOnly;
}

- (void)setDetectionOnly:(BOOL)a3
{
  self->_detectionOnly = a3;
}

- (BOOL)predicted
{
  return self->_predicted;
}

- (void)setPredicted:(BOOL)a3
{
  self->_predicted = a3;
}

- (BOOL)providesWorldTrackingCameraPose
{
  return self->_providesWorldTrackingCameraPose;
}

- (void)setProvidesWorldTrackingCameraPose:(BOOL)a3
{
  self->_providesWorldTrackingCameraPose = a3;
}

- (ARCamera)currentCamera
{
  return self->_currentCamera;
}

- (void)setCurrentCamera:(id)a3
{
}

- (NSArray)detectedImages
{
  return self->_detectedImages;
}

- (void)setDetectedImages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedImages, 0);
  objc_storeStrong((id *)&self->_currentCamera, 0);
}

@end