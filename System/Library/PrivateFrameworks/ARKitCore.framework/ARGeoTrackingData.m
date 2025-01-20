@interface ARGeoTrackingData
+ (BOOL)supportsSecureCoding;
- (ARGeoTrackingData)initWithCoder:(id)a3;
- (ARLocationData)enuOrigin;
- (__n128)initWithENUOrigin:(__n128)a3 vioFromENU:(__n128)a4;
- (__n128)vioFromENU;
- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARGeoTrackingData

- (__n128)initWithENUOrigin:(__n128)a3 vioFromENU:(__n128)a4
{
  id v9 = a7;
  v17.receiver = a1;
  v17.super_class = (Class)ARGeoTrackingData;
  v10 = [(ARGeoTrackingData *)&v17 init];
  v11 = (__n128 *)v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_enuOrigin, a7);
    v11[1] = a2;
    v11[2] = a3;
    v11[3] = a4;
    v11[4] = a5;
  }

  return v11;
}

- (id)anchorsForCameraWithTransform:(double)a3 referenceOriginTransform:(double)a4 existingAnchors:(double)a5 anchorsToRemove:(float32x4_t)a6
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  id v12 = a11;
  v13 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_67];
  v87 = v12;
  v14 = [v12 filteredArrayUsingPredicate:v13];

  v15 = _ARLogGeneral_24();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = (objc_class *)objc_opt_class();
    objc_super v17 = NSStringFromClass(v16);
    LODWORD(buf[0].f64[0]) = 138543874;
    *(void *)((char *)buf[0].f64 + 4) = v17;
    WORD2(buf[0].f64[1]) = 2048;
    *(void *)((char *)&buf[0].f64[1] + 6) = a1;
    HIWORD(buf[1].f64[0]) = 2048;
    *(void *)&buf[1].f64[1] = [v14 count];
    _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: VL geo anchors updated: %lu", (uint8_t *)buf, 0x20u);
  }
  v18 = _ARLogGeneral_24();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    simd_float4x4 v189 = __invert_f4(*(simd_float4x4 *)(a1 + 16));
    v21 = ARMatrix4x4Description(1, (__n128)v189.columns[0], (__n128)v189.columns[1], (__n128)v189.columns[2], (__n128)v189.columns[3]);
    LODWORD(buf[0].f64[0]) = 138543875;
    *(void *)((char *)buf[0].f64 + 4) = v20;
    WORD2(buf[0].f64[1]) = 2048;
    *(void *)((char *)&buf[0].f64[1] + 6) = a1;
    HIWORD(buf[1].f64[0]) = 2113;
    *(void *)&buf[1].f64[1] = v21;
    _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: enuFromVIO: %{private}@", (uint8_t *)buf, 0x20u);
  }
  long long v177 = 0u;
  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  id v22 = v14;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v174 objects:v179 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    id obj = v22;
    uint64_t v93 = *(void *)v175;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v175 != v93) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v174 + 1) + 8 * i);
        if ([v26 isAltitudeAvailable])
        {
          float64x2_t v173 = 0u;
          float64x2_t v172 = 0u;
          float64x2_t v171 = 0u;
          float64x2_t v170 = 0u;
          float64x2_t v169 = 0u;
          float64x2_t v168 = 0u;
          float64x2_t v167 = 0u;
          float64x2_t v166 = 0u;
          ARMatrix4x4FloatToDouble(&v166, (float32x4_t)_PromotedConst_3, unk_1B8A53370, (float32x4_t)xmmword_1B8A53380, unk_1B8A53390);
          float64x2_t v165 = 0u;
          float64x2_t v164 = 0u;
          float64x2_t v163 = 0u;
          float64x2_t v162 = 0u;
          float64x2_t v161 = 0u;
          float64x2_t v160 = 0u;
          float64x2_t v159 = 0u;
          float64x2_t v158 = 0u;
          *(double *)v27.i64 = ARVisionToRenderingCoordinateTransform();
          ARMatrix4x4FloatToDouble(&v158, v27, v28, v29, v30);
          float64x2_t v157 = 0u;
          float64x2_t v156 = 0u;
          float64x2_t v155 = 0u;
          float64x2_t v154 = 0u;
          float64x2_t v153 = 0u;
          float64x2_t v151 = 0u;
          float64x2_t v152 = 0u;
          float64x2_t v150 = 0u;
          v31 = *(void **)(a1 + 8);
          if (v31)
          {
            [v31 ecefFromlocation];
          }
          else
          {
            float64x2_t v148 = 0uLL;
            float64x2_t v149 = 0uLL;
            float64x2_t v146 = 0uLL;
            float64x2_t v147 = 0uLL;
            float64x2_t v144 = 0uLL;
            float64x2_t v145 = 0uLL;
            float64x2_t v142 = 0uLL;
            float64x2_t v143 = 0uLL;
          }
          float64x2_t v183 = v146;
          float64x2_t v184 = v147;
          float64x2_t v185 = v148;
          float64x2_t v186 = v149;
          buf[0] = v142;
          buf[1] = v143;
          float64x2_t v181 = v144;
          float64x2_t v182 = v145;
          __invert_d4();
          float64x2_t v185 = 0u;
          float64x2_t v186 = 0u;
          float64x2_t v183 = 0u;
          float64x2_t v184 = 0u;
          float64x2_t v181 = 0u;
          float64x2_t v182 = 0u;
          memset(buf, 0, sizeof(buf));
          ARMatrix4x4FloatToDouble(buf, *(float32x4_t *)(a1 + 16), *(float32x4_t *)(a1 + 32), *(float32x4_t *)(a1 + 48), *(float32x4_t *)(a1 + 64));
          float64x2_t v32 = 0uLL;
          float64x2_t v140 = 0u;
          float64x2_t v141 = 0u;
          float64x2_t v138 = 0u;
          float64x2_t v139 = 0u;
          float64x2_t v136 = 0u;
          float64x2_t v137 = 0u;
          float64x2_t v134 = 0u;
          float64x2_t v135 = 0u;
          float64x2_t v33 = 0uLL;
          if (v26)
          {
            [v26 ecefFromAnchor];
            float64x2_t v33 = 0uLL;
            float64x2_t v34 = v134;
            float64x2_t v35 = v135;
            float64x2_t v36 = v136;
            float64x2_t v37 = v137;
            float64x2_t v38 = v138;
            float64x2_t v39 = v139;
            float64x2_t v32 = v140;
            float64x2_t v40 = v141;
          }
          else
          {
            float64x2_t v40 = 0uLL;
            float64x2_t v38 = 0uLL;
            float64x2_t v39 = 0uLL;
            float64x2_t v36 = 0uLL;
            float64x2_t v37 = 0uLL;
            float64x2_t v34 = 0uLL;
            float64x2_t v35 = 0uLL;
          }
          uint64_t v41 = 0;
          float64x2_t v122 = v170;
          float64x2_t v123 = v171;
          float64x2_t v124 = v172;
          float64x2_t v125 = v173;
          float64x2_t v118 = v166;
          float64x2_t v119 = v167;
          float64x2_t v120 = v168;
          float64x2_t v121 = v169;
          float64x2_t v126 = v33;
          float64x2_t v127 = v33;
          float64x2_t v128 = v33;
          float64x2_t v129 = v33;
          float64x2_t v130 = v33;
          float64x2_t v131 = v33;
          float64x2_t v132 = v33;
          float64x2_t v133 = v33;
          do
          {
            float64x2_t v43 = *(float64x2_t *)((char *)&v118 + v41);
            float64x2_t v42 = *(float64x2_t *)((char *)&v118 + v41 + 16);
            v44 = (float64x2_t *)((char *)&v126 + v41);
            float64x2_t *v44 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v34, v43.f64[0]), v36, v43, 1), v38, v42.f64[0]), v32, v42, 1);
            v44[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v35, v43.f64[0]), v37, v43, 1), v39, v42.f64[0]), v40, v42, 1);
            v41 += 32;
          }
          while (v41 != 128);
          uint64_t v45 = 0;
          float64x2_t v47 = v150;
          float64x2_t v46 = v151;
          float64x2_t v48 = v153;
          float64x2_t v49 = v152;
          float64x2_t v50 = v155;
          float64x2_t v51 = v154;
          float64x2_t v52 = v157;
          float64x2_t v53 = v156;
          float64x2_t v114 = v130;
          float64x2_t v115 = v131;
          float64x2_t v116 = v132;
          float64x2_t v117 = v133;
          float64x2_t v110 = v126;
          float64x2_t v111 = v127;
          float64x2_t v112 = v128;
          float64x2_t v113 = v129;
          float64x2_t v124 = v33;
          float64x2_t v125 = v33;
          float64x2_t v122 = v33;
          float64x2_t v123 = v33;
          float64x2_t v120 = v33;
          float64x2_t v121 = v33;
          float64x2_t v118 = v33;
          float64x2_t v119 = v33;
          do
          {
            float64x2_t v55 = *(float64x2_t *)((char *)&v110 + v45);
            float64x2_t v54 = *(float64x2_t *)((char *)&v110 + v45 + 16);
            v56 = (float64x2_t *)((char *)&v118 + v45);
            float64x2_t *v56 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v47, v55.f64[0]), v49, v55, 1), v51, v54.f64[0]), v53, v54, 1);
            v56[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v46, v55.f64[0]), v48, v55, 1), v50, v54.f64[0]), v52, v54, 1);
            v45 += 32;
          }
          while (v45 != 128);
          uint64_t v57 = 0;
          float64x2_t v59 = buf[0];
          float64x2_t v58 = buf[1];
          float64x2_t v61 = v181;
          float64x2_t v60 = v182;
          float64x2_t v63 = v183;
          float64x2_t v62 = v184;
          float64x2_t v65 = v185;
          float64x2_t v64 = v186;
          float64x2_t v106 = v122;
          float64x2_t v107 = v123;
          float64x2_t v108 = v124;
          float64x2_t v109 = v125;
          float64x2_t v102 = v118;
          float64x2_t v103 = v119;
          float64x2_t v104 = v120;
          float64x2_t v105 = v121;
          float64x2_t v116 = v33;
          float64x2_t v117 = v33;
          float64x2_t v114 = v33;
          float64x2_t v115 = v33;
          float64x2_t v112 = v33;
          float64x2_t v113 = v33;
          float64x2_t v110 = v33;
          float64x2_t v111 = v33;
          do
          {
            float64x2_t v67 = *(float64x2_t *)((char *)&v102 + v57);
            float64x2_t v66 = *(float64x2_t *)((char *)&v102 + v57 + 16);
            v68 = (float64x2_t *)((char *)&v110 + v57);
            float64x2_t *v68 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v59, v67.f64[0]), v61, v67, 1), v63, v66.f64[0]), v65, v66, 1);
            v68[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v58, v67.f64[0]), v60, v67, 1), v62, v66.f64[0]), v64, v66, 1);
            v57 += 32;
          }
          while (v57 != 128);
          uint64_t v69 = 0;
          float64x2_t v70 = v159;
          float64x2_t v71 = v158;
          float64x2_t v72 = v161;
          float64x2_t v73 = v160;
          float64x2_t v74 = v163;
          float64x2_t v75 = v162;
          float64x2_t v76 = v165;
          float64x2_t v77 = v164;
          float64x2_t v98 = v114;
          float64x2_t v99 = v115;
          float64x2_t v100 = v116;
          float64x2_t v101 = v117;
          float64x2_t v94 = v110;
          float64x2_t v95 = v111;
          float64x2_t v96 = v112;
          float64x2_t v97 = v113;
          float64x2_t v108 = v33;
          float64x2_t v109 = v33;
          float64x2_t v106 = v33;
          float64x2_t v107 = v33;
          float64x2_t v104 = v33;
          float64x2_t v105 = v33;
          float64x2_t v102 = v33;
          float64x2_t v103 = v33;
          do
          {
            float64x2_t v79 = *(float64x2_t *)((char *)&v94 + v69);
            float64x2_t v78 = *(float64x2_t *)((char *)&v94 + v69 + 16);
            v80 = (float64x2_t *)((char *)&v102 + v69);
            float64x2_t *v80 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v71, v79.f64[0]), v73, v79, 1), v75, v78.f64[0]), v77, v78, 1);
            v80[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v70, v79.f64[0]), v72, v79, 1), v74, v78.f64[0]), v76, v78, 1);
            v69 += 32;
          }
          while (v69 != 128);
          float64x2_t v98 = v106;
          float64x2_t v99 = v107;
          float64x2_t v100 = v108;
          float64x2_t v101 = v109;
          float64x2_t v94 = v102;
          float64x2_t v95 = v103;
          float64x2_t v96 = v104;
          float64x2_t v97 = v105;
          *(double *)&long long v81 = ARMatrix4x4DoubleToFloat(&v94);
          uint64_t v82 = 0;
          v178[0] = v81;
          v178[1] = v83;
          v178[2] = v84;
          v178[3] = v85;
          float64x2_t v94 = 0u;
          float64x2_t v95 = 0u;
          float64x2_t v96 = 0u;
          float64x2_t v97 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v94 + v82 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a6, COERCE_FLOAT(v178[v82])), a7, *(float32x2_t *)&v178[v82], 1), a8, (float32x4_t)v178[v82], 2), a9, (float32x4_t)v178[v82], 3);
            ++v82;
          }
          while (v82 != 4);
          objc_msgSend(v26, "setTransform:", v94.f64[0], v95.f64[0], v96.f64[0], v97.f64[0]);
          [v26 setIsTracked:1];
        }
      }
      id v22 = obj;
      uint64_t v24 = [obj countByEnumeratingWithState:&v174 objects:v179 count:16];
    }
    while (v24);
  }

  return v22;
}

uint64_t __108__ARGeoTrackingData_anchorsForCameraWithTransform_referenceOriginTransform_existingAnchors_anchorsToRemove___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ARGeoTrackingData)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ARGeoTrackingData;
  v5 = [(ARGeoTrackingData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"enuOrigin"];
    enuOrigin = v5->_enuOrigin;
    v5->_enuOrigin = (ARLocationData *)v6;

    objc_msgSend(v4, "ar_decodeMatrix4x4ForKey:", @"vioFromENU");
    v5[1] = v8;
    v5[2] = v9;
    v5[3] = v10;
    v5[4] = v11;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  enuOrigin = self->_enuOrigin;
  id v5 = a3;
  [v5 encodeObject:enuOrigin forKey:@"enuOrigin"];
  objc_msgSend(v5, "ar_encodeMatrix4x4:forKey:", @"vioFromENU", *(double *)&self[1].super.isa, *(double *)&self[2].super.isa, *(double *)&self[3].super.isa, *(double *)&self[4].super.isa);
}

- (ARLocationData)enuOrigin
{
  return self->_enuOrigin;
}

- (__n128)vioFromENU
{
  return a1[1];
}

- (void).cxx_destruct
{
}

@end