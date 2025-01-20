@interface MDLTransformRotateOp
- (BOOL)IsInverseOp;
- (BOOL)inverse;
- (MDLAnimatedVector3)animatedValue;
- (MDLTransformRotateOp)initWithName:(id)a3 inverse:(BOOL)a4 order:(unint64_t)a5 data:(id)a6;
- (NSString)name;
- (unint64_t)order;
- (void)double4x4AtTime:(uint64_t)a3@<X2>;
- (void)float4x4AtTime:(uint64_t)a3;
- (void)setInverse:(BOOL)a3;
- (void)setOrder:(unint64_t)a3;
@end

@implementation MDLTransformRotateOp

- (MDLTransformRotateOp)initWithName:(id)a3 inverse:(BOOL)a4 order:(unint64_t)a5 data:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)MDLTransformRotateOp;
  v13 = [(MDLTransformRotateOp *)&v17 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_animatedValue, a6);
    objc_storeStrong((id *)&v14->_name, a3);
    v14->_order = a5;
    v14->_inverse = a4;
    v15 = v14;
  }

  return v14;
}

- (BOOL)IsInverseOp
{
  return self->_inverse;
}

- (void)float4x4AtTime:(uint64_t)a3
{
  objc_msgSend_float3AtTime_(*(void **)(a1 + 24), a2, a3);
  long long v245 = v42;
  *(_OWORD *)&STACK[0x5F0] = 0u;
  *(_OWORD *)&STACK[0x600] = 0u;
  *(_OWORD *)&STACK[0x5D0] = 0u;
  *(_OWORD *)&STACK[0x5E0] = 0u;
  *(_OWORD *)&STACK[0x5B0] = 0u;
  *(_OWORD *)&STACK[0x5C0] = 0u;
  *(_OWORD *)&STACK[0x590] = 0u;
  *(_OWORD *)&STACK[0x5A0] = 0u;
  v43.f64[0] = 0.0;
  sub_20B0D3E20((uint64_t)&STACK[0x590], *(float *)&v42 * 0.0174532925, (float64x2_t)COERCE_UNSIGNED_INT64(1.0), 0.0, v43);
  a41 = 0u;
  *(_OWORD *)&STACK[0x580] = 0u;
  a39 = 0u;
  a40 = 0u;
  a37 = 0u;
  a38 = 0u;
  a35 = 0u;
  a36 = 0u;
  v44.f64[0] = 0.0;
  v45.f64[0] = 0.0;
  sub_20B0D3E20((uint64_t)&a35, *((float *)&v245 + 1) * 0.0174532925, v44, 1.0, v45);
  a33 = 0u;
  a34 = 0u;
  a31 = 0u;
  a32 = 0u;
  a29 = 0u;
  a30 = 0u;
  a27 = 0u;
  a28 = 0u;
  v46.f64[0] = 0.0;
  v47.f64[0] = 1.0;
  sub_20B0D3E20((uint64_t)&a27, *((float *)&v245 + 2) * 0.0174532925, v46, 0.0, v47);
  a25 = 0u;
  a26 = 0u;
  a23 = 0u;
  a24 = 0u;
  a21 = 0u;
  a22 = 0u;
  a19 = 0u;
  a20 = 0u;
  switch(*(void *)(a1 + 32))
  {
    case 1:
      uint64_t v48 = 0;
      float64x2_t v50 = a27;
      float64x2_t v49 = a28;
      float64x2_t v52 = a29;
      float64x2_t v51 = a30;
      float64x2_t v54 = a31;
      float64x2_t v53 = a32;
      float64x2_t v56 = a33;
      float64x2_t v55 = a34;
      float64x2_t v57 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v57;
      long long v58 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v58;
      float64x2_t v59 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v59;
      float64x2_t v60 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v60;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v62 = *(float64x2_t *)((char *)&STACK[0x610] + v48);
        float64x2_t v61 = *(float64x2_t *)((char *)&STACK[0x610] + v48 + 16);
        v63 = (float64x2_t *)((char *)&a11 + v48);
        float64x2_t *v63 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v50, v62.f64[0]), v52, v62, 1), v54, v61.f64[0]), v56, v61, 1);
        v63[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v49, v62.f64[0]), v51, v62, 1), v53, v61.f64[0]), v55, v61, 1);
        v48 += 32;
      }
      while (v48 != 128);
      uint64_t v64 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      float64x2_t v66 = a11;
      float64x2_t v65 = a12;
      float64x2_t v68 = a13;
      float64x2_t v67 = a14;
      float64x2_t v70 = a15;
      float64x2_t v69 = a16;
      float64x2_t v72 = a17;
      float64x2_t v71 = a18;
      long long v73 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v73;
      long long v74 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v74;
      long long v75 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v75;
      long long v76 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v76;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v78 = *(float64x2_t *)((char *)&STACK[0x610] + v64);
        float64x2_t v77 = *(float64x2_t *)((char *)&STACK[0x610] + v64 + 16);
        v79 = (float64x2_t *)((char *)&a11 + v64);
        float64x2_t *v79 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v66, v78.f64[0]), v68, v78, 1), v70, v77.f64[0]), v72, v77, 1);
        v79[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v65, v78.f64[0]), v67, v78, 1), v69, v77.f64[0]), v71, v77, 1);
        v64 += 32;
      }
      while (v64 != 128);
      goto LABEL_31;
    case 2:
      uint64_t v80 = 0;
      float64x2_t v82 = a35;
      float64x2_t v81 = a36;
      float64x2_t v84 = a37;
      float64x2_t v83 = a38;
      float64x2_t v86 = a39;
      float64x2_t v85 = a40;
      float64x2_t v88 = a41;
      float64x2_t v87 = *(float64x2_t *)&STACK[0x580];
      float64x2_t v89 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v89;
      float64x2_t v90 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v90;
      float64x2_t v91 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v91;
      float64x2_t v92 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v92;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v94 = *(float64x2_t *)((char *)&STACK[0x610] + v80);
        float64x2_t v93 = *(float64x2_t *)((char *)&STACK[0x610] + v80 + 16);
        v95 = (float64x2_t *)((char *)&a11 + v80);
        float64x2_t *v95 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v82, v94.f64[0]), v84, v94, 1), v86, v93.f64[0]), v88, v93, 1);
        v95[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v81, v94.f64[0]), v83, v94, 1), v85, v93.f64[0]), v87, v93, 1);
        v80 += 32;
      }
      while (v80 != 128);
      uint64_t v96 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      float64x2_t v98 = a11;
      float64x2_t v97 = a12;
      float64x2_t v100 = a13;
      float64x2_t v99 = a14;
      float64x2_t v102 = a15;
      float64x2_t v101 = a16;
      float64x2_t v104 = a17;
      float64x2_t v103 = a18;
      long long v105 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v105;
      long long v106 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v106;
      long long v107 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v107;
      long long v108 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v108;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v110 = *(float64x2_t *)((char *)&STACK[0x610] + v96);
        float64x2_t v109 = *(float64x2_t *)((char *)&STACK[0x610] + v96 + 16);
        v111 = (float64x2_t *)((char *)&a11 + v96);
        float64x2_t *v111 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v98, v110.f64[0]), v100, v110, 1), v102, v109.f64[0]), v104, v109, 1);
        v111[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v97, v110.f64[0]), v99, v110, 1), v101, v109.f64[0]), v103, v109, 1);
        v96 += 32;
      }
      while (v96 != 128);
      goto LABEL_31;
    case 3:
      uint64_t v112 = 0;
      float64x2_t v114 = a27;
      float64x2_t v113 = a28;
      float64x2_t v116 = a29;
      float64x2_t v115 = a30;
      float64x2_t v118 = a31;
      float64x2_t v117 = a32;
      float64x2_t v120 = a33;
      float64x2_t v119 = a34;
      long long v121 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v121;
      long long v122 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v122;
      long long v123 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v123;
      long long v124 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v124;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v126 = *(float64x2_t *)((char *)&STACK[0x610] + v112);
        float64x2_t v125 = *(float64x2_t *)((char *)&STACK[0x610] + v112 + 16);
        v127 = (float64x2_t *)((char *)&a11 + v112);
        float64x2_t *v127 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v114, v126.f64[0]), v116, v126, 1), v118, v125.f64[0]), v120, v125, 1);
        v127[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v113, v126.f64[0]), v115, v126, 1), v117, v125.f64[0]), v119, v125, 1);
        v112 += 32;
      }
      while (v112 != 128);
      uint64_t v128 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      float64x2_t v130 = a11;
      float64x2_t v129 = a12;
      float64x2_t v132 = a13;
      float64x2_t v131 = a14;
      float64x2_t v134 = a15;
      float64x2_t v133 = a16;
      float64x2_t v136 = a17;
      float64x2_t v135 = a18;
      float64x2_t v137 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v137;
      long long v138 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v138;
      float64x2_t v139 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v139;
      float64x2_t v140 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v140;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v142 = *(float64x2_t *)((char *)&STACK[0x610] + v128);
        float64x2_t v141 = *(float64x2_t *)((char *)&STACK[0x610] + v128 + 16);
        v143 = (float64x2_t *)((char *)&a11 + v128);
        float64x2_t *v143 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v130, v142.f64[0]), v132, v142, 1), v134, v141.f64[0]), v136, v141, 1);
        v143[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v129, v142.f64[0]), v131, v142, 1), v133, v141.f64[0]), v135, v141, 1);
        v128 += 32;
      }
      while (v128 != 128);
      goto LABEL_31;
    case 4:
      uint64_t v144 = 0;
      float64x2_t v146 = *(float64x2_t *)&STACK[0x590];
      float64x2_t v145 = *(float64x2_t *)&STACK[0x5A0];
      float64x2_t v148 = *(float64x2_t *)&STACK[0x5B0];
      float64x2_t v147 = *(float64x2_t *)&STACK[0x5C0];
      float64x2_t v150 = *(float64x2_t *)&STACK[0x5D0];
      float64x2_t v149 = *(float64x2_t *)&STACK[0x5E0];
      float64x2_t v152 = *(float64x2_t *)&STACK[0x5F0];
      float64x2_t v151 = *(float64x2_t *)&STACK[0x600];
      float64x2_t v153 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v153;
      float64x2_t v154 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v154;
      float64x2_t v155 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v155;
      float64x2_t v156 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v156;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v158 = *(float64x2_t *)((char *)&STACK[0x610] + v144);
        float64x2_t v157 = *(float64x2_t *)((char *)&STACK[0x610] + v144 + 16);
        v159 = (float64x2_t *)((char *)&a11 + v144);
        float64x2_t *v159 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v146, v158.f64[0]), v148, v158, 1), v150, v157.f64[0]), v152, v157, 1);
        v159[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v145, v158.f64[0]), v147, v158, 1), v149, v157.f64[0]), v151, v157, 1);
        v144 += 32;
      }
      while (v144 != 128);
      uint64_t v160 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      float64x2_t v162 = a11;
      float64x2_t v161 = a12;
      float64x2_t v164 = a13;
      float64x2_t v163 = a14;
      float64x2_t v166 = a15;
      float64x2_t v165 = a16;
      float64x2_t v168 = a17;
      float64x2_t v167 = a18;
      float64x2_t v169 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v169;
      long long v170 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v170;
      float64x2_t v171 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v171;
      float64x2_t v172 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v172;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v174 = *(float64x2_t *)((char *)&STACK[0x610] + v160);
        float64x2_t v173 = *(float64x2_t *)((char *)&STACK[0x610] + v160 + 16);
        v175 = (float64x2_t *)((char *)&a11 + v160);
        float64x2_t *v175 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v162, v174.f64[0]), v164, v174, 1), v166, v173.f64[0]), v168, v173, 1);
        v175[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v161, v174.f64[0]), v163, v174, 1), v165, v173.f64[0]), v167, v173, 1);
        v160 += 32;
      }
      while (v160 != 128);
      goto LABEL_31;
    case 5:
      uint64_t v176 = 0;
      float64x2_t v178 = a35;
      float64x2_t v177 = a36;
      float64x2_t v180 = a37;
      float64x2_t v179 = a38;
      float64x2_t v182 = a39;
      float64x2_t v181 = a40;
      float64x2_t v184 = a41;
      float64x2_t v183 = *(float64x2_t *)&STACK[0x580];
      long long v185 = *(_OWORD *)&STACK[0x5E0];
      *(_OWORD *)&STACK[0x650] = *(_OWORD *)&STACK[0x5D0];
      *(_OWORD *)&STACK[0x660] = v185;
      long long v186 = *(_OWORD *)&STACK[0x600];
      *(_OWORD *)&STACK[0x670] = *(_OWORD *)&STACK[0x5F0];
      *(_OWORD *)&STACK[0x680] = v186;
      long long v187 = *(_OWORD *)&STACK[0x5A0];
      *(_OWORD *)&STACK[0x610] = *(_OWORD *)&STACK[0x590];
      *(_OWORD *)&STACK[0x620] = v187;
      long long v188 = *(_OWORD *)&STACK[0x5C0];
      *(_OWORD *)&STACK[0x630] = *(_OWORD *)&STACK[0x5B0];
      *(_OWORD *)&STACK[0x640] = v188;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v190 = *(float64x2_t *)((char *)&STACK[0x610] + v176);
        float64x2_t v189 = *(float64x2_t *)((char *)&STACK[0x610] + v176 + 16);
        v191 = (float64x2_t *)((char *)&a11 + v176);
        float64x2_t *v191 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v178, v190.f64[0]), v180, v190, 1), v182, v189.f64[0]), v184, v189, 1);
        v191[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v177, v190.f64[0]), v179, v190, 1), v181, v189.f64[0]), v183, v189, 1);
        v176 += 32;
      }
      while (v176 != 128);
      uint64_t v192 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      float64x2_t v194 = a11;
      float64x2_t v193 = a12;
      float64x2_t v196 = a13;
      float64x2_t v195 = a14;
      float64x2_t v198 = a15;
      float64x2_t v197 = a16;
      float64x2_t v200 = a17;
      float64x2_t v199 = a18;
      float64x2_t v201 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v201;
      float64x2_t v202 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v202;
      float64x2_t v203 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v203;
      float64x2_t v204 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v204;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v206 = *(float64x2_t *)((char *)&STACK[0x610] + v192);
        float64x2_t v205 = *(float64x2_t *)((char *)&STACK[0x610] + v192 + 16);
        v207 = (float64x2_t *)((char *)&a11 + v192);
        float64x2_t *v207 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v194, v206.f64[0]), v196, v206, 1), v198, v205.f64[0]), v200, v205, 1);
        v207[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v193, v206.f64[0]), v195, v206, 1), v197, v205.f64[0]), v199, v205, 1);
        v192 += 32;
      }
      while (v192 != 128);
      goto LABEL_31;
    case 6:
      uint64_t v208 = 0;
      float64x2_t v210 = *(float64x2_t *)&STACK[0x590];
      float64x2_t v209 = *(float64x2_t *)&STACK[0x5A0];
      float64x2_t v212 = *(float64x2_t *)&STACK[0x5B0];
      float64x2_t v211 = *(float64x2_t *)&STACK[0x5C0];
      float64x2_t v214 = *(float64x2_t *)&STACK[0x5D0];
      float64x2_t v213 = *(float64x2_t *)&STACK[0x5E0];
      float64x2_t v216 = *(float64x2_t *)&STACK[0x5F0];
      float64x2_t v215 = *(float64x2_t *)&STACK[0x600];
      float64x2_t v217 = a40;
      *(float64x2_t *)&STACK[0x650] = a39;
      *(float64x2_t *)&STACK[0x660] = v217;
      long long v218 = *(_OWORD *)&STACK[0x580];
      *(float64x2_t *)&STACK[0x670] = a41;
      *(_OWORD *)&STACK[0x680] = v218;
      float64x2_t v219 = a36;
      *(float64x2_t *)&STACK[0x610] = a35;
      *(float64x2_t *)&STACK[0x620] = v219;
      float64x2_t v220 = a38;
      *(float64x2_t *)&STACK[0x630] = a37;
      *(float64x2_t *)&STACK[0x640] = v220;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v222 = *(float64x2_t *)((char *)&STACK[0x610] + v208);
        float64x2_t v221 = *(float64x2_t *)((char *)&STACK[0x610] + v208 + 16);
        v223 = (float64x2_t *)((char *)&a11 + v208);
        float64x2_t *v223 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v210, v222.f64[0]), v212, v222, 1), v214, v221.f64[0]), v216, v221, 1);
        v223[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v209, v222.f64[0]), v211, v222, 1), v213, v221.f64[0]), v215, v221, 1);
        v208 += 32;
      }
      while (v208 != 128);
      uint64_t v224 = 0;
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      float64x2_t v226 = a11;
      float64x2_t v225 = a12;
      float64x2_t v228 = a13;
      float64x2_t v227 = a14;
      float64x2_t v230 = a15;
      float64x2_t v229 = a16;
      float64x2_t v232 = a17;
      float64x2_t v231 = a18;
      float64x2_t v233 = a32;
      *(float64x2_t *)&STACK[0x650] = a31;
      *(float64x2_t *)&STACK[0x660] = v233;
      float64x2_t v234 = a34;
      *(float64x2_t *)&STACK[0x670] = a33;
      *(float64x2_t *)&STACK[0x680] = v234;
      float64x2_t v235 = a28;
      *(float64x2_t *)&STACK[0x610] = a27;
      *(float64x2_t *)&STACK[0x620] = v235;
      float64x2_t v236 = a30;
      *(float64x2_t *)&STACK[0x630] = a29;
      *(float64x2_t *)&STACK[0x640] = v236;
      a17 = 0u;
      a18 = 0u;
      a15 = 0u;
      a16 = 0u;
      a13 = 0u;
      a14 = 0u;
      a11 = 0u;
      a12 = 0u;
      do
      {
        float64x2_t v238 = *(float64x2_t *)((char *)&STACK[0x610] + v224);
        float64x2_t v237 = *(float64x2_t *)((char *)&STACK[0x610] + v224 + 16);
        v239 = (float64x2_t *)((char *)&a11 + v224);
        float64x2_t *v239 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v226, v238.f64[0]), v228, v238, 1), v230, v237.f64[0]), v232, v237, 1);
        v239[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v225, v238.f64[0]), v227, v238, 1), v229, v237.f64[0]), v231, v237, 1);
        v224 += 32;
      }
      while (v224 != 128);
LABEL_31:
      a23 = a15;
      a24 = a16;
      a25 = a17;
      a26 = a18;
      a19 = a11;
      a20 = a12;
      a21 = a13;
      a22 = a14;
      break;
    default:
      break;
  }
  uint64_t v240 = 0;
  *(_OWORD *)&STACK[0x630] = 0uLL;
  *(_OWORD *)&STACK[0x640] = 0uLL;
  *(_OWORD *)&STACK[0x610] = 0uLL;
  *(_OWORD *)&STACK[0x620] = 0uLL;
  do
  {
    int v241 = 0;
    long long v242 = *((_OWORD *)&a19 + 2 * v240);
    long long v243 = *((_OWORD *)&STACK[0x610] + v240);
    do
    {
      long long vars0 = v242;
      float v244 = *((double *)&vars0 + (v241 & 3));
      long long v246 = v243;
      *(float *)((unint64_t)&v246 & 0xFFFFFFFFFFFFFFF3 | (4 * (v241 & 3))) = v244;
      long long v243 = v246;
      ++v241;
    }
    while (v241 != 4);
    *((_OWORD *)&STACK[0x610] + v240++) = v246;
  }
  while (v240 != 4);
  if (*(unsigned char *)(a1 + 8))
  {
    v248.columns[0] = *(simd_float4 *)&STACK[0x610];
    v248.columns[1] = *(simd_float4 *)&STACK[0x620];
    v248.columns[2] = *(simd_float4 *)&STACK[0x630];
    v248.columns[3] = *(simd_float4 *)&STACK[0x640];
    __invert_f4(v248);
  }
}

- (void)double4x4AtTime:(uint64_t)a3@<X2>
{
  float64x2_t v45 = *(void **)(a1 + 24);
  if (v45)
  {
    objc_msgSend_double3AtTime_(v45, a2, a3);
    int8x16_t v46 = a42;
    *(void *)&double v214 = vextq_s8(v46, v46, 8uLL).u64[0];
    double v47 = a43;
  }
  else
  {
    v46.i64[0] = 0;
    double v214 = 0.0;
    double v47 = 0.0;
  }
  a40 = 0u;
  a41 = 0u;
  a38 = 0u;
  a39 = 0u;
  a36 = 0u;
  a37 = 0u;
  a34 = 0u;
  a35 = 0u;
  a5.f64[0] = 0.0;
  sub_20B0D3E20((uint64_t)&a34, *(double *)v46.i64 * 0.0174532925, (float64x2_t)COERCE_UNSIGNED_INT64(1.0), 0.0, a5);
  a32 = 0u;
  a33 = 0u;
  a30 = 0u;
  a31 = 0u;
  a28 = 0u;
  a29 = 0u;
  a26 = 0u;
  a27 = 0u;
  v48.f64[0] = 0.0;
  sub_20B0D3E20((uint64_t)&a26, v214 * 0.0174532925, (float64x2_t)0, 1.0, v48);
  a24 = 0u;
  a25 = 0u;
  a22 = 0u;
  a23 = 0u;
  a20 = 0u;
  a21 = 0u;
  a18 = 0u;
  a19 = 0u;
  v49.f64[0] = 1.0;
  sub_20B0D3E20((uint64_t)&a18, v47 * 0.0174532925, (float64x2_t)0, 0.0, v49);
  switch(*(void *)(a1 + 32))
  {
    case 1:
      uint64_t v50 = 0;
      float64x2_t v52 = a18;
      float64x2_t v51 = a19;
      float64x2_t v54 = a20;
      float64x2_t v53 = a21;
      float64x2_t v56 = a22;
      float64x2_t v55 = a23;
      float64x2_t v58 = a24;
      float64x2_t v57 = a25;
      float64x2_t v59 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v59;
      float64x2_t v60 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v60;
      float64x2_t v61 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v61;
      float64x2_t v62 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v62;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      do
      {
        float64x2_t v64 = *(float64x2_t *)((char *)&STACK[0x500] + v50);
        float64x2_t v63 = *(float64x2_t *)((char *)&STACK[0x500] + v50 + 16);
        float64x2_t v65 = (float64x2_t *)((char *)&v215 + v50);
        *float64x2_t v65 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v52, v64.f64[0]), v54, v64, 1), v56, v63.f64[0]), v58, v63, 1);
        v65[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v51, v64.f64[0]), v53, v64, 1), v55, v63.f64[0]), v57, v63, 1);
        v50 += 32;
      }
      while (v50 != 128);
      uint64_t v66 = 0;
      float64x2_t v68 = v215;
      float64x2_t v67 = vars0;
      float64x2_t v69 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v69;
      float64x2_t v70 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v70;
      float64x2_t v71 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v71;
      float64x2_t v72 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v72;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v217 = 0u;
      float64x2_t v218 = 0u;
      float64x2_t v219 = 0u;
      float64x2_t v220 = 0u;
      float64x2_t v221 = 0u;
      float64x2_t v222 = 0u;
      do
      {
        float64x2_t v74 = *(float64x2_t *)((char *)&STACK[0x500] + v66);
        float64x2_t v73 = *(float64x2_t *)((char *)&STACK[0x500] + v66 + 16);
        long long v75 = (float64x2_t *)((char *)&v215 + v66);
        *long long v75 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v68, v74.f64[0]), (float64x2_t)0, v74, 1), (float64x2_t)0, v73.f64[0]), (float64x2_t)0, v73, 1);
        v75[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v67, v74.f64[0]), (float64x2_t)0, v74, 1), (float64x2_t)0, v73.f64[0]), (float64x2_t)0, v73, 1);
        v66 += 32;
      }
      while (v66 != 128);
      goto LABEL_35;
    case 2:
      uint64_t v84 = 0;
      float64x2_t v86 = a26;
      float64x2_t v85 = a27;
      float64x2_t v88 = a28;
      float64x2_t v87 = a29;
      float64x2_t v90 = a30;
      float64x2_t v89 = a31;
      float64x2_t v92 = a32;
      float64x2_t v91 = a33;
      float64x2_t v93 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v93;
      float64x2_t v94 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v94;
      float64x2_t v95 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v95;
      float64x2_t v96 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v96;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      do
      {
        float64x2_t v98 = *(float64x2_t *)((char *)&STACK[0x500] + v84);
        float64x2_t v97 = *(float64x2_t *)((char *)&STACK[0x500] + v84 + 16);
        float64x2_t v99 = (float64x2_t *)((char *)&v215 + v84);
        *float64x2_t v99 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v86, v98.f64[0]), v88, v98, 1), v90, v97.f64[0]), v92, v97, 1);
        v99[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v85, v98.f64[0]), v87, v98, 1), v89, v97.f64[0]), v91, v97, 1);
        v84 += 32;
      }
      while (v84 != 128);
      uint64_t v100 = 0;
      float64x2_t v102 = v215;
      float64x2_t v101 = vars0;
      float64x2_t v103 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v103;
      float64x2_t v104 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v104;
      float64x2_t v105 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v105;
      float64x2_t v106 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v106;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v217 = 0u;
      float64x2_t v218 = 0u;
      float64x2_t v219 = 0u;
      float64x2_t v220 = 0u;
      float64x2_t v221 = 0u;
      float64x2_t v222 = 0u;
      do
      {
        float64x2_t v108 = *(float64x2_t *)((char *)&STACK[0x500] + v100);
        float64x2_t v107 = *(float64x2_t *)((char *)&STACK[0x500] + v100 + 16);
        float64x2_t v109 = (float64x2_t *)((char *)&v215 + v100);
        *float64x2_t v109 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v102, v108.f64[0]), (float64x2_t)0, v108, 1), (float64x2_t)0, v107.f64[0]), (float64x2_t)0, v107, 1);
        v109[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v101, v108.f64[0]), (float64x2_t)0, v108, 1), (float64x2_t)0, v107.f64[0]), (float64x2_t)0, v107, 1);
        v100 += 32;
      }
      while (v100 != 128);
      goto LABEL_35;
    case 3:
      uint64_t v110 = 0;
      float64x2_t v112 = a18;
      float64x2_t v111 = a19;
      float64x2_t v114 = a20;
      float64x2_t v113 = a21;
      float64x2_t v116 = a22;
      float64x2_t v115 = a23;
      float64x2_t v118 = a24;
      float64x2_t v117 = a25;
      float64x2_t v119 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v119;
      float64x2_t v120 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v120;
      float64x2_t v121 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v121;
      float64x2_t v122 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v122;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      do
      {
        float64x2_t v124 = *(float64x2_t *)((char *)&STACK[0x500] + v110);
        float64x2_t v123 = *(float64x2_t *)((char *)&STACK[0x500] + v110 + 16);
        float64x2_t v125 = (float64x2_t *)((char *)&v215 + v110);
        *float64x2_t v125 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v112, v124.f64[0]), v114, v124, 1), v116, v123.f64[0]), v118, v123, 1);
        v125[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v111, v124.f64[0]), v113, v124, 1), v115, v123.f64[0]), v117, v123, 1);
        v110 += 32;
      }
      while (v110 != 128);
      uint64_t v126 = 0;
      float64x2_t v128 = v215;
      float64x2_t v127 = vars0;
      float64x2_t v129 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v129;
      float64x2_t v130 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v130;
      float64x2_t v131 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v131;
      float64x2_t v132 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v132;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v217 = 0u;
      float64x2_t v218 = 0u;
      float64x2_t v219 = 0u;
      float64x2_t v220 = 0u;
      float64x2_t v221 = 0u;
      float64x2_t v222 = 0u;
      do
      {
        float64x2_t v134 = *(float64x2_t *)((char *)&STACK[0x500] + v126);
        float64x2_t v133 = *(float64x2_t *)((char *)&STACK[0x500] + v126 + 16);
        float64x2_t v135 = (float64x2_t *)((char *)&v215 + v126);
        *float64x2_t v135 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v128, v134.f64[0]), (float64x2_t)0, v134, 1), (float64x2_t)0, v133.f64[0]), (float64x2_t)0, v133, 1);
        v135[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v127, v134.f64[0]), (float64x2_t)0, v134, 1), (float64x2_t)0, v133.f64[0]), (float64x2_t)0, v133, 1);
        v126 += 32;
      }
      while (v126 != 128);
      goto LABEL_35;
    case 4:
      uint64_t v136 = 0;
      float64x2_t v138 = a34;
      float64x2_t v137 = a35;
      float64x2_t v140 = a36;
      float64x2_t v139 = a37;
      float64x2_t v142 = a38;
      float64x2_t v141 = a39;
      float64x2_t v144 = a40;
      float64x2_t v143 = a41;
      float64x2_t v145 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v145;
      float64x2_t v146 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v146;
      float64x2_t v147 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v147;
      float64x2_t v148 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v148;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      do
      {
        float64x2_t v150 = *(float64x2_t *)((char *)&STACK[0x500] + v136);
        float64x2_t v149 = *(float64x2_t *)((char *)&STACK[0x500] + v136 + 16);
        float64x2_t v151 = (float64x2_t *)((char *)&v215 + v136);
        *float64x2_t v151 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v138, v150.f64[0]), v140, v150, 1), v142, v149.f64[0]), v144, v149, 1);
        v151[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v137, v150.f64[0]), v139, v150, 1), v141, v149.f64[0]), v143, v149, 1);
        v136 += 32;
      }
      while (v136 != 128);
      uint64_t v152 = 0;
      float64x2_t v154 = v215;
      float64x2_t v153 = vars0;
      float64x2_t v155 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v155;
      float64x2_t v156 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v156;
      float64x2_t v157 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v157;
      float64x2_t v158 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v158;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v217 = 0u;
      float64x2_t v218 = 0u;
      float64x2_t v219 = 0u;
      float64x2_t v220 = 0u;
      float64x2_t v221 = 0u;
      float64x2_t v222 = 0u;
      do
      {
        float64x2_t v160 = *(float64x2_t *)((char *)&STACK[0x500] + v152);
        float64x2_t v159 = *(float64x2_t *)((char *)&STACK[0x500] + v152 + 16);
        float64x2_t v161 = (float64x2_t *)((char *)&v215 + v152);
        *float64x2_t v161 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v154, v160.f64[0]), (float64x2_t)0, v160, 1), (float64x2_t)0, v159.f64[0]), (float64x2_t)0, v159, 1);
        v161[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v153, v160.f64[0]), (float64x2_t)0, v160, 1), (float64x2_t)0, v159.f64[0]), (float64x2_t)0, v159, 1);
        v152 += 32;
      }
      while (v152 != 128);
      goto LABEL_35;
    case 5:
      uint64_t v162 = 0;
      float64x2_t v164 = a26;
      float64x2_t v163 = a27;
      float64x2_t v166 = a28;
      float64x2_t v165 = a29;
      float64x2_t v168 = a30;
      float64x2_t v167 = a31;
      float64x2_t v170 = a32;
      float64x2_t v169 = a33;
      float64x2_t v171 = a39;
      *(float64x2_t *)&STACK[0x540] = a38;
      *(float64x2_t *)&STACK[0x550] = v171;
      float64x2_t v172 = a41;
      *(float64x2_t *)&STACK[0x560] = a40;
      *(float64x2_t *)&STACK[0x570] = v172;
      float64x2_t v173 = a35;
      *(float64x2_t *)&STACK[0x500] = a34;
      *(float64x2_t *)&STACK[0x510] = v173;
      float64x2_t v174 = a37;
      *(float64x2_t *)&STACK[0x520] = a36;
      *(float64x2_t *)&STACK[0x530] = v174;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      do
      {
        float64x2_t v176 = *(float64x2_t *)((char *)&STACK[0x500] + v162);
        float64x2_t v175 = *(float64x2_t *)((char *)&STACK[0x500] + v162 + 16);
        float64x2_t v177 = (float64x2_t *)((char *)&v215 + v162);
        *float64x2_t v177 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v164, v176.f64[0]), v166, v176, 1), v168, v175.f64[0]), v170, v175, 1);
        v177[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v163, v176.f64[0]), v165, v176, 1), v167, v175.f64[0]), v169, v175, 1);
        v162 += 32;
      }
      while (v162 != 128);
      uint64_t v178 = 0;
      float64x2_t v180 = v215;
      float64x2_t v179 = vars0;
      float64x2_t v181 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v181;
      float64x2_t v182 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v182;
      float64x2_t v183 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v183;
      float64x2_t v184 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v184;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v217 = 0u;
      float64x2_t v218 = 0u;
      float64x2_t v219 = 0u;
      float64x2_t v220 = 0u;
      float64x2_t v221 = 0u;
      float64x2_t v222 = 0u;
      do
      {
        float64x2_t v186 = *(float64x2_t *)((char *)&STACK[0x500] + v178);
        float64x2_t v185 = *(float64x2_t *)((char *)&STACK[0x500] + v178 + 16);
        long long v187 = (float64x2_t *)((char *)&v215 + v178);
        *long long v187 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v180, v186.f64[0]), (float64x2_t)0, v186, 1), (float64x2_t)0, v185.f64[0]), (float64x2_t)0, v185, 1);
        v187[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v179, v186.f64[0]), (float64x2_t)0, v186, 1), (float64x2_t)0, v185.f64[0]), (float64x2_t)0, v185, 1);
        v178 += 32;
      }
      while (v178 != 128);
      goto LABEL_35;
    case 6:
      uint64_t v188 = 0;
      float64x2_t v190 = a34;
      float64x2_t v189 = a35;
      float64x2_t v192 = a36;
      float64x2_t v191 = a37;
      float64x2_t v194 = a38;
      float64x2_t v193 = a39;
      float64x2_t v196 = a40;
      float64x2_t v195 = a41;
      float64x2_t v197 = a31;
      *(float64x2_t *)&STACK[0x540] = a30;
      *(float64x2_t *)&STACK[0x550] = v197;
      float64x2_t v198 = a33;
      *(float64x2_t *)&STACK[0x560] = a32;
      *(float64x2_t *)&STACK[0x570] = v198;
      float64x2_t v199 = a27;
      *(float64x2_t *)&STACK[0x500] = a26;
      *(float64x2_t *)&STACK[0x510] = v199;
      float64x2_t v200 = a29;
      *(float64x2_t *)&STACK[0x520] = a28;
      *(float64x2_t *)&STACK[0x530] = v200;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      do
      {
        float64x2_t v202 = *(float64x2_t *)((char *)&STACK[0x500] + v188);
        float64x2_t v201 = *(float64x2_t *)((char *)&STACK[0x500] + v188 + 16);
        float64x2_t v203 = (float64x2_t *)((char *)&v215 + v188);
        *float64x2_t v203 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v190, v202.f64[0]), v192, v202, 1), v194, v201.f64[0]), v196, v201, 1);
        v203[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v189, v202.f64[0]), v191, v202, 1), v193, v201.f64[0]), v195, v201, 1);
        v188 += 32;
      }
      while (v188 != 128);
      uint64_t v204 = 0;
      float64x2_t v206 = v215;
      float64x2_t v205 = vars0;
      float64x2_t v207 = a23;
      *(float64x2_t *)&STACK[0x540] = a22;
      *(float64x2_t *)&STACK[0x550] = v207;
      float64x2_t v208 = a25;
      *(float64x2_t *)&STACK[0x560] = a24;
      *(float64x2_t *)&STACK[0x570] = v208;
      float64x2_t v209 = a19;
      *(float64x2_t *)&STACK[0x500] = a18;
      *(float64x2_t *)&STACK[0x510] = v209;
      float64x2_t v210 = a21;
      *(float64x2_t *)&STACK[0x520] = a20;
      *(float64x2_t *)&STACK[0x530] = v210;
      float64x2_t v215 = 0u;
      float64x2_t vars0 = 0u;
      float64x2_t v217 = 0u;
      float64x2_t v218 = 0u;
      float64x2_t v219 = 0u;
      float64x2_t v220 = 0u;
      float64x2_t v221 = 0u;
      float64x2_t v222 = 0u;
      do
      {
        float64x2_t v212 = *(float64x2_t *)((char *)&STACK[0x500] + v204);
        float64x2_t v211 = *(float64x2_t *)((char *)&STACK[0x500] + v204 + 16);
        float64x2_t v213 = (float64x2_t *)((char *)&v215 + v204);
        *float64x2_t v213 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v206, v212.f64[0]), (float64x2_t)0, v212, 1), (float64x2_t)0, v211.f64[0]), (float64x2_t)0, v211, 1);
        v213[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v205, v212.f64[0]), (float64x2_t)0, v212, 1), (float64x2_t)0, v211.f64[0]), (float64x2_t)0, v211, 1);
        v204 += 32;
      }
      while (v204 != 128);
LABEL_35:
      float64x2_t v77 = v215;
      float64x2_t v76 = vars0;
      float64x2_t v79 = v217;
      float64x2_t v78 = v218;
      float64x2_t v81 = v219;
      float64x2_t v80 = v220;
      float64x2_t v83 = v221;
      float64x2_t v82 = v222;
      break;
    default:
      float64x2_t v77 = *(float64x2_t *)MEMORY[0x263EF8990];
      float64x2_t v76 = *(float64x2_t *)(MEMORY[0x263EF8990] + 16);
      float64x2_t v79 = *(float64x2_t *)(MEMORY[0x263EF8990] + 32);
      float64x2_t v78 = *(float64x2_t *)(MEMORY[0x263EF8990] + 48);
      float64x2_t v81 = *(float64x2_t *)(MEMORY[0x263EF8990] + 64);
      float64x2_t v80 = *(float64x2_t *)(MEMORY[0x263EF8990] + 80);
      float64x2_t v83 = *(float64x2_t *)(MEMORY[0x263EF8990] + 96);
      float64x2_t v82 = *(float64x2_t *)(MEMORY[0x263EF8990] + 112);
      break;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    *(float64x2_t *)&STACK[0x500] = v77;
    *(float64x2_t *)&STACK[0x510] = v76;
    *(float64x2_t *)&STACK[0x520] = v79;
    *(float64x2_t *)&STACK[0x530] = v78;
    *(float64x2_t *)&STACK[0x540] = v81;
    *(float64x2_t *)&STACK[0x550] = v80;
    *(float64x2_t *)&STACK[0x560] = v83;
    *(float64x2_t *)&STACK[0x570] = v82;
    __invert_d4();
  }
  else
  {
    *a4 = v77;
    a4[1] = v76;
    a4[2] = v79;
    a4[3] = v78;
    a4[4] = v81;
    a4[5] = v80;
    a4[6] = v83;
    a4[7] = v82;
  }
}

- (NSString)name
{
  return self->_name;
}

- (MDLAnimatedVector3)animatedValue
{
  return self->_animatedValue;
}

- (BOOL)inverse
{
  return self->_inverse;
}

- (void)setInverse:(BOOL)a3
{
  self->_inverse = a3;
}

- (unint64_t)order
{
  return self->_order;
}

- (void)setOrder:(unint64_t)a3
{
  self->_order = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedValue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end