uint64_t sub_1000050DC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_100005110(uint64_t a1)
{
  v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void createCubeFace(void **a1, int8x16_t **a2, __n128 **a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, __n128 a9, char a10, int a11)
{
  float32x4_t v14 = *(float32x4_t *)(a4 + 16 * a5);
  float32x4_t v158 = *(float32x4_t *)(a4 + 16 * a6);
  float32x4_t v160 = *(float32x4_t *)(a4 + 16 * a7);
  float32x4_t v162 = v14;
  float32x4_t v157 = *(float32x4_t *)(a4 + 16 * a8);
  if (a10) {
    unsigned int v15 = -1;
  }
  else {
    unsigned int v15 = 0;
  }
  uint64_t v17 = (uint64_t)(a1 + 2);
  unint64_t v16 = (unint64_t)a1[2];
  v18 = (float32x4_t *)a1[1];
  if ((unint64_t)v18 >= v16)
  {
    uint64_t v20 = ((char *)v18 - (unsigned char *)*a1) >> 4;
    if ((unint64_t)(v20 + 1) >> 60) {
      goto LABEL_180;
    }
    uint64_t v21 = v16 - (void)*a1;
    uint64_t v22 = v21 >> 3;
    if (v21 >> 3 <= (unint64_t)(v20 + 1)) {
      uint64_t v22 = v20 + 1;
    }
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v23 = v22;
    }
    if (v23)
    {
      v24 = (char *)sub_100005D6C((uint64_t)(a1 + 2), v23);
      float32x4_t v14 = v162;
    }
    else
    {
      v24 = 0;
    }
    v25 = (float32x4_t *)&v24[16 * v20];
    v26 = &v24[16 * v23];
    float32x4_t *v25 = v14;
    v19 = v25 + 1;
    v28 = (float32x4_t *)*a1;
    v27 = (float32x4_t *)a1[1];
    if (v27 != *a1)
    {
      do
      {
        float32x4_t v29 = v27[-1];
        --v27;
        v25[-1] = v29;
        --v25;
      }
      while (v27 != v28);
      v27 = (float32x4_t *)*a1;
    }
    *a1 = v25;
    a1[1] = v19;
    a1[2] = v26;
    if (v27)
    {
      operator delete(v27);
      float32x4_t v14 = v162;
    }
  }
  else
  {
    float32x4_t *v18 = v14;
    v19 = v18 + 1;
  }
  a1[1] = v19;
  unint64_t v30 = (unint64_t)a1[2];
  if ((unint64_t)v19 >= v30)
  {
    uint64_t v32 = ((char *)v19 - (unsigned char *)*a1) >> 4;
    if ((unint64_t)(v32 + 1) >> 60) {
      goto LABEL_180;
    }
    uint64_t v33 = v30 - (void)*a1;
    uint64_t v34 = v33 >> 3;
    if (v33 >> 3 <= (unint64_t)(v32 + 1)) {
      uint64_t v34 = v32 + 1;
    }
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v35 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v35 = v34;
    }
    if (v35) {
      v36 = (char *)sub_100005D6C(v17, v35);
    }
    else {
      v36 = 0;
    }
    v37 = (float32x4_t *)&v36[16 * v32];
    v38 = &v36[16 * v35];
    float32x4_t *v37 = v158;
    v31 = v37 + 1;
    v40 = (float32x4_t *)*a1;
    v39 = (float32x4_t *)a1[1];
    if (v39 != *a1)
    {
      do
      {
        float32x4_t v41 = v39[-1];
        --v39;
        v37[-1] = v41;
        --v37;
      }
      while (v39 != v40);
      v39 = (float32x4_t *)*a1;
    }
    *a1 = v37;
    a1[1] = v31;
    a1[2] = v38;
    if (v39) {
      operator delete(v39);
    }
    float32x4_t v14 = v162;
  }
  else
  {
    float32x4_t *v19 = v158;
    v31 = v19 + 1;
  }
  a1[1] = v31;
  unint64_t v42 = (unint64_t)a1[2];
  if ((unint64_t)v31 >= v42)
  {
    uint64_t v44 = ((char *)v31 - (unsigned char *)*a1) >> 4;
    if ((unint64_t)(v44 + 1) >> 60) {
      goto LABEL_180;
    }
    uint64_t v45 = v42 - (void)*a1;
    uint64_t v46 = v45 >> 3;
    if (v45 >> 3 <= (unint64_t)(v44 + 1)) {
      uint64_t v46 = v44 + 1;
    }
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v47 = v46;
    }
    if (v47) {
      v48 = (char *)sub_100005D6C(v17, v47);
    }
    else {
      v48 = 0;
    }
    v49 = (float32x4_t *)&v48[16 * v44];
    v50 = &v48[16 * v47];
    float32x4_t *v49 = v160;
    v43 = v49 + 1;
    v52 = (float32x4_t *)*a1;
    v51 = (float32x4_t *)a1[1];
    if (v51 != *a1)
    {
      do
      {
        float32x4_t v53 = v51[-1];
        --v51;
        v49[-1] = v53;
        --v49;
      }
      while (v51 != v52);
      v51 = (float32x4_t *)*a1;
    }
    *a1 = v49;
    a1[1] = v43;
    a1[2] = v50;
    if (v51) {
      operator delete(v51);
    }
    float32x4_t v14 = v162;
  }
  else
  {
    float32x4_t *v31 = v160;
    v43 = v31 + 1;
  }
  a1[1] = v43;
  unint64_t v54 = (unint64_t)a1[2];
  if ((unint64_t)v43 >= v54)
  {
    uint64_t v56 = ((char *)v43 - (unsigned char *)*a1) >> 4;
    if ((unint64_t)(v56 + 1) >> 60) {
      goto LABEL_180;
    }
    uint64_t v57 = v54 - (void)*a1;
    uint64_t v58 = v57 >> 3;
    if (v57 >> 3 <= (unint64_t)(v56 + 1)) {
      uint64_t v58 = v56 + 1;
    }
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v59 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v59 = v58;
    }
    if (v59)
    {
      v60 = (char *)sub_100005D6C(v17, v59);
      float32x4_t v14 = v162;
    }
    else
    {
      v60 = 0;
    }
    v61 = (float32x4_t *)&v60[16 * v56];
    v62 = &v60[16 * v59];
    float32x4_t *v61 = v14;
    v55 = v61 + 1;
    v64 = (float32x4_t *)*a1;
    v63 = (float32x4_t *)a1[1];
    if (v63 != *a1)
    {
      do
      {
        float32x4_t v65 = v63[-1];
        --v63;
        v61[-1] = v65;
        --v61;
      }
      while (v63 != v64);
      v63 = (float32x4_t *)*a1;
    }
    *a1 = v61;
    a1[1] = v55;
    a1[2] = v62;
    if (v63)
    {
      operator delete(v63);
      float32x4_t v14 = v162;
    }
  }
  else
  {
    float32x4_t *v43 = v14;
    v55 = v43 + 1;
  }
  a1[1] = v55;
  unint64_t v66 = (unint64_t)a1[2];
  if ((unint64_t)v55 >= v66)
  {
    uint64_t v68 = ((char *)v55 - (unsigned char *)*a1) >> 4;
    if ((unint64_t)(v68 + 1) >> 60) {
      goto LABEL_180;
    }
    uint64_t v69 = v66 - (void)*a1;
    uint64_t v70 = v69 >> 3;
    if (v69 >> 3 <= (unint64_t)(v68 + 1)) {
      uint64_t v70 = v68 + 1;
    }
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v71 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v71 = v70;
    }
    if (v71) {
      v72 = (char *)sub_100005D6C(v17, v71);
    }
    else {
      v72 = 0;
    }
    v73 = (float32x4_t *)&v72[16 * v68];
    v74 = &v72[16 * v71];
    float32x4_t *v73 = v160;
    v67 = v73 + 1;
    v76 = (float32x4_t *)*a1;
    v75 = (float32x4_t *)a1[1];
    if (v75 != *a1)
    {
      do
      {
        float32x4_t v77 = v75[-1];
        --v75;
        v73[-1] = v77;
        --v73;
      }
      while (v75 != v76);
      v75 = (float32x4_t *)*a1;
    }
    *a1 = v73;
    a1[1] = v67;
    a1[2] = v74;
    if (v75) {
      operator delete(v75);
    }
    float32x4_t v14 = v162;
  }
  else
  {
    float32x4_t *v55 = v160;
    v67 = v55 + 1;
  }
  a1[1] = v67;
  unint64_t v78 = (unint64_t)a1[2];
  if ((unint64_t)v67 >= v78)
  {
    uint64_t v81 = ((char *)v67 - (unsigned char *)*a1) >> 4;
    if (!((unint64_t)(v81 + 1) >> 60))
    {
      uint64_t v82 = v78 - (void)*a1;
      uint64_t v83 = v82 >> 3;
      if (v82 >> 3 <= (unint64_t)(v81 + 1)) {
        uint64_t v83 = v81 + 1;
      }
      if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v84 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v84 = v83;
      }
      if (v84) {
        v85 = (char *)sub_100005D6C(v17, v84);
      }
      else {
        v85 = 0;
      }
      v86 = (float32x4_t *)&v85[16 * v81];
      v87 = &v85[16 * v84];
      float32x4_t *v86 = v157;
      f32 = (_OWORD *)v86[1].f32;
      v89 = (char *)*a1;
      v88 = (float32x4_t *)a1[1];
      if (v88 != *a1)
      {
        do
        {
          float32x4_t v90 = v88[-1];
          --v88;
          v86[-1] = v90;
          --v86;
        }
        while (v88 != (float32x4_t *)v89);
        v88 = (float32x4_t *)*a1;
      }
      *a1 = v86;
      a1[1] = f32;
      a1[2] = v87;
      if (v88) {
        operator delete(v88);
      }
      float32x4_t v14 = v162;
      float32x4_t v79 = v157;
      goto LABEL_104;
    }
LABEL_180:
    sub_100005CC4();
  }
  float32x4_t v79 = v157;
  float32x4_t *v67 = v157;
  f32 = (_OWORD *)v67[1].f32;
LABEL_104:
  int v91 = 0;
  float32x4_t v92 = vsubq_f32(v158, v14);
  int32x4_t v93 = (int32x4_t)vmulq_f32(v92, v92);
  v93.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v93, 2), vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v93.i8, 1))).u32[0];
  float32x2_t v94 = vrsqrte_f32((float32x2_t)v93.u32[0]);
  float32x2_t v95 = vmul_f32(v94, vrsqrts_f32((float32x2_t)v93.u32[0], vmul_f32(v94, v94)));
  v93.i32[0] = vmul_f32(v95, vrsqrts_f32((float32x2_t)v93.u32[0], vmul_f32(v95, v95))).u32[0];
  float32x4_t v96 = vsubq_f32(v160, v14);
  int32x4_t v97 = (int32x4_t)vmulq_f32(v96, v96);
  v97.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v97, 2), vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v97.i8, 1))).u32[0];
  float32x4_t v98 = vmulq_n_f32(v92, *(float *)v93.i32);
  *(float32x2_t *)v93.i8 = vrsqrte_f32((float32x2_t)v97.u32[0]);
  *(float32x2_t *)v93.i8 = vmul_f32(*(float32x2_t *)v93.i8, vrsqrts_f32((float32x2_t)v97.u32[0], vmul_f32(*(float32x2_t *)v93.i8, *(float32x2_t *)v93.i8)));
  float32x4_t v99 = vmulq_n_f32(v96, vmul_f32(*(float32x2_t *)v93.i8, vrsqrts_f32((float32x2_t)v97.u32[0], vmul_f32(*(float32x2_t *)v93.i8, *(float32x2_t *)v93.i8))).f32[0]);
  float32x4_t v100 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v99, (int32x4_t)v99), (int8x16_t)v99, 0xCuLL);
  int32x4_t v101 = (int32x4_t)vmlaq_f32(vmulq_f32(v100, vnegq_f32(v98)), v99, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v98, (int32x4_t)v98), (int8x16_t)v98, 0xCuLL));
  float32x4_t v102 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v101, v101), (int8x16_t)v101, 0xCuLL);
  float32x4_t v103 = vsubq_f32(v79, v14);
  int32x4_t v104 = (int32x4_t)vmulq_f32(v103, v103);
  v104.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v104, 2), vadd_f32(*(float32x2_t *)v104.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v104.i8, 1))).u32[0];
  float32x2_t v105 = vrsqrte_f32((float32x2_t)v104.u32[0]);
  float32x2_t v106 = vmul_f32(v105, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v105, v105)));
  float32x4_t v107 = vmulq_n_f32(v103, vmul_f32(v106, vrsqrts_f32((float32x2_t)v104.u32[0], vmul_f32(v106, v106))).f32[0]);
  int32x4_t v108 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v107, (int32x4_t)v107), (int8x16_t)v107, 0xCuLL), vnegq_f32(v99)), v107, v100);
  float32x4_t v109 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v108, v108), (int8x16_t)v108, 0xCuLL);
  int8x16_t v110 = (int8x16_t)vdupq_n_s32(v15);
  int8x16_t v163 = vbslq_s8(v110, (int8x16_t)vnegq_f32(v102), (int8x16_t)v102);
  int8x16_t v161 = vbslq_s8(v110, (int8x16_t)vnegq_f32(v109), (int8x16_t)v109);
  a1[1] = f32;
  v111 = a2 + 2;
  v112 = a2[1];
  do
  {
    if ((unint64_t)v112 >= *v111)
    {
      uint64_t v113 = v112 - *a2;
      if ((unint64_t)(v113 + 1) >> 60) {
LABEL_177:
      }
        sub_100005CC4();
      uint64_t v114 = *v111 - (void)*a2;
      uint64_t v115 = v114 >> 3;
      if (v114 >> 3 <= (unint64_t)(v113 + 1)) {
        uint64_t v115 = v113 + 1;
      }
      if ((unint64_t)v114 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v116 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v116 = v115;
      }
      if (v116) {
        v117 = (char *)sub_100005D6C((uint64_t)(a2 + 2), v116);
      }
      else {
        v117 = 0;
      }
      v118 = (int8x16_t *)&v117[16 * v113];
      int8x16_t *v118 = v163;
      v112 = v118 + 1;
      v120 = (char *)*a2;
      v119 = (char *)a2[1];
      if (v119 != (char *)*a2)
      {
        do
        {
          int8x16_t v121 = *((int8x16_t *)v119 - 1);
          v119 -= 16;
          v118[-1] = v121;
          --v118;
        }
        while (v119 != v120);
        v119 = (char *)*a2;
      }
      *a2 = v118;
      a2[1] = v112;
      a2[2] = (int8x16_t *)&v117[16 * v116];
      if (v119) {
        operator delete(v119);
      }
    }
    else
    {
      *v112++ = v163;
    }
    a2[1] = v112;
    ++v91;
  }
  while (v91 != 3);
  for (int i = 0; i != 3; ++i)
  {
    if ((unint64_t)v112 >= *v111)
    {
      uint64_t v123 = v112 - *a2;
      if ((unint64_t)(v123 + 1) >> 60) {
        goto LABEL_177;
      }
      uint64_t v124 = *v111 - (void)*a2;
      uint64_t v125 = v124 >> 3;
      if (v124 >> 3 <= (unint64_t)(v123 + 1)) {
        uint64_t v125 = v123 + 1;
      }
      if ((unint64_t)v124 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v126 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v126 = v125;
      }
      if (v126) {
        v127 = (char *)sub_100005D6C((uint64_t)(a2 + 2), v126);
      }
      else {
        v127 = 0;
      }
      v128 = (int8x16_t *)&v127[16 * v123];
      int8x16_t *v128 = v161;
      v112 = v128 + 1;
      v130 = (char *)*a2;
      v129 = (char *)a2[1];
      if (v129 != (char *)*a2)
      {
        do
        {
          int8x16_t v131 = *((int8x16_t *)v129 - 1);
          v129 -= 16;
          v128[-1] = v131;
          --v128;
        }
        while (v129 != v130);
        v129 = (char *)*a2;
      }
      *a2 = v128;
      a2[1] = v112;
      a2[2] = (int8x16_t *)&v127[16 * v126];
      if (v129) {
        operator delete(v129);
      }
    }
    else
    {
      *v112++ = v161;
    }
    a2[1] = v112;
  }
  int v132 = 0;
  v133 = a3 + 2;
  v134 = a3[1];
  do
  {
    if ((unint64_t)v134 >= *v133)
    {
      uint64_t v135 = v134 - *a3;
      if ((unint64_t)(v135 + 1) >> 60) {
        sub_100005CC4();
      }
      uint64_t v136 = *v133 - (void)*a3;
      uint64_t v137 = v136 >> 3;
      if (v136 >> 3 <= (unint64_t)(v135 + 1)) {
        uint64_t v137 = v135 + 1;
      }
      if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v138 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v138 = v137;
      }
      if (v138) {
        v139 = (char *)sub_100005D6C((uint64_t)(a3 + 2), v138);
      }
      else {
        v139 = 0;
      }
      v140 = (__n128 *)&v139[16 * v135];
      __n128 *v140 = a9;
      v134 = v140 + 1;
      v142 = *a3;
      v141 = a3[1];
      if (v141 != *a3)
      {
        do
        {
          __n128 v143 = v141[-1];
          --v141;
          v140[-1] = v143;
          --v140;
        }
        while (v141 != v142);
        v141 = *a3;
      }
      *a3 = v140;
      a3[1] = v134;
      a3[2] = (__n128 *)&v139[16 * v138];
      if (v141) {
        operator delete(v141);
      }
    }
    else
    {
      *v134++ = a9;
    }
    a3[1] = v134;
    ++v132;
  }
  while (v132 != 6);
  v145 = (_DWORD *)qword_10001A790;
  unint64_t v144 = qword_10001A798;
  char v146 = 1;
  do
  {
    char v147 = v146;
    if ((unint64_t)v145 >= v144)
    {
      v149 = (_DWORD *)masks;
      uint64_t v150 = ((uint64_t)v145 - masks) >> 2;
      unint64_t v151 = v150 + 1;
      if ((unint64_t)(v150 + 1) >> 62) {
        sub_100005CC4();
      }
      uint64_t v152 = v144 - masks;
      if (v152 >> 1 > v151) {
        unint64_t v151 = v152 >> 1;
      }
      if ((unint64_t)v152 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v153 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v153 = v151;
      }
      if (v153)
      {
        v154 = (char *)sub_100005DD8((uint64_t)&qword_10001A798, v153);
        v149 = (_DWORD *)masks;
        v145 = (_DWORD *)qword_10001A790;
      }
      else
      {
        v154 = 0;
      }
      v155 = &v154[4 * v150];
      *(_DWORD *)v155 = a11;
      uint64_t v148 = (uint64_t)(v155 + 4);
      while (v145 != v149)
      {
        int v156 = *--v145;
        *((_DWORD *)v155 - 1) = v156;
        v155 -= 4;
      }
      unint64_t v144 = (unint64_t)&v154[4 * v153];
      masks = (uint64_t)v155;
      qword_10001A790 = v148;
      qword_10001A798 = v144;
      if (v149)
      {
        operator delete(v149);
        unint64_t v144 = qword_10001A798;
      }
    }
    else
    {
      _DWORD *v145 = a11;
      uint64_t v148 = (uint64_t)(v145 + 1);
    }
    char v146 = 0;
    qword_10001A790 = v148;
    v145 = (_DWORD *)v148;
  }
  while ((v147 & 1) != 0);
}

void createCube(char a1, char a2, int a3, __n128 a4, float32x4_t a5, float32x4_t a6, float32x4_t a7, float32x4_t a8)
{
  uint64_t v11 = 0;
  *(void *)&long long v12 = 0xBF000000BF000000;
  *((void *)&v12 + 1) = 0xBF000000BF000000;
  v14[0] = v12;
  v14[1] = xmmword_10000FF00;
  v14[2] = xmmword_10000FF10;
  v14[3] = xmmword_10000FF20;
  v14[4] = xmmword_10000FF30;
  v14[5] = xmmword_10000FF40;
  *(void *)&long long v12 = 0x3F0000003F000000;
  *((void *)&v12 + 1) = 0x3F0000003F000000;
  v14[6] = xmmword_10000FF50;
  v14[7] = v12;
  do
  {
    v14[v11] = vaddq_f32(a8, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a5, COERCE_FLOAT(v14[v11])), a6, *(float32x2_t *)&v14[v11], 1), a7, (float32x4_t)v14[v11], 2));
    ++v11;
  }
  while (v11 != 8);
  if (a1)
  {
    createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 0, 4u, 6u, 2u, a4, a2, a3);
    if ((a1 & 2) == 0)
    {
LABEL_5:
      if ((a1 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_5;
  }
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 1u, 3u, 7u, 5u, a4, a2, a3);
  if ((a1 & 4) == 0)
  {
LABEL_6:
    if ((a1 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 0, 1u, 5u, 4u, a4, a2, a3);
  if ((a1 & 8) == 0)
  {
LABEL_7:
    if ((a1 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 2u, 6u, 7u, 3u, a4, a2, a3);
  if ((a1 & 0x10) == 0)
  {
LABEL_8:
    if ((a1 & 0x20) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_15:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 0, 2u, 3u, 1u, a4, a2, a3);
  if ((a1 & 0x20) == 0) {
    return;
  }
LABEL_9:
  createCubeFace((void **)&vertices, (int8x16_t **)&normals, (__n128 **)&colors, (uint64_t)v14, 4u, 5u, 7u, 6u, a4, a2, a3);
}

void sub_100005CC4()
{
}

void sub_100005CDC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100005D38(exception, a1);
}

void sub_100005D24(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100005D38(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_100005D6C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100005DA4();
  }
  return operator new(16 * a2);
}

void sub_100005DA4()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100005DD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100005DA4();
  }
  return operator new(4 * a2);
}

void sub_100005E10()
{
  qword_10001A748 = 0;
  unk_10001A750 = 0;
  vertices = 0;
  __cxa_atexit((void (*)(void *))sub_1000050DC, &vertices, (void *)&_mh_execute_header);
  qword_10001A760 = 0;
  unk_10001A768 = 0;
  normals = 0;
  __cxa_atexit((void (*)(void *))sub_1000050DC, &normals, (void *)&_mh_execute_header);
  qword_10001A778 = 0;
  unk_10001A780 = 0;
  colors = 0;
  __cxa_atexit((void (*)(void *))sub_1000050DC, &colors, (void *)&_mh_execute_header);
  qword_10001A790 = 0;
  qword_10001A798 = 0;
  masks = 0;
  __cxa_atexit((void (*)(void *))sub_100005110, &masks, (void *)&_mh_execute_header);
}

uint64_t *initialize(uint64_t *result)
{
  uint64_t v1 = 42;
  uint64_t v2 = *result;
  do
  {
    uint64_t v3 = -12211 * (v2 / 53668) + 40014 * (v2 % 53668);
    uint64_t v2 = ((v3 >> 63) & 0x7FFFFFAB) + v3;
    if ((unint64_t)(v1 - 3) <= 0x1F) {
      result[v1] = v2;
    }
    --v1;
  }
  while (v1 != 2);
  std::logic_error *result = v2;
  result[2] = result[3];
  return result;
}

uint64_t next(uint64_t *a1)
{
  uint64_t v1 = -12211 * (*a1 / 53668) + 40014 * (*a1 % 53668);
  uint64_t v2 = ((v1 >> 63) & 0x7FFFFFAB) + v1;
  uint64_t v3 = -3791 * (a1[1] / 52774) + 40692 * (a1[1] % 52774);
  uint64_t v4 = ((v3 >> 63) & 0x7FFFFF07) + v3;
  *a1 = v2;
  a1[1] = v4;
  v5 = &a1[(int)a1[2] / 67108862];
  a1[2] = v5[3] - v4;
  v5[3] = v2;
  uint64_t v6 = a1[2];
  if (v6 < 0)
  {
    v6 += 2147483563;
    a1[2] = v6;
  }
  return v6;
}

uint64_t *ConstructRandom(uint64_t *a1, time_t a2)
{
  if (!a2) {
    a2 = time(0);
  }
  *a1 = a2;
  a1[1] = a2;

  return initialize(a1);
}

float UniformFloat(uint64_t *a1)
{
  float result = (double)next(a1) * 4.65661306e-10;
  if (result == 1.0) {
    return 0.0;
  }
  return result;
}

void sub_10000659C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000065CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000065DC(uint64_t a1)
{
}

void sub_1000065E4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10000748C(uint64_t a1, void *a2)
{
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recieved thermal notification from kernel.", v5, 2u);
  }

  return [a2 recievedThermalStateChangedNotification];
}

id sub_100007504(uint64_t a1, void *a2)
{
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Recieved shutdown notification!", v5, 2u);
  }

  return [a2 recievedShutdownNotification];
}

void sub_10000760C(uint64_t a1)
{
  int v2 = OSThermalNotificationCurrentLevel();
  uint64_t v3 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v30 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Device thermal level is now %d", buf, 8u);
  }

  if (v2 == 11)
  {
    if ([*(id *)(a1 + 32) isThermalBlocked]) {
      return;
    }
    id v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pausing drain operations due to high thermal state", buf, 2u);
    }

    [*(id *)(a1 + 32) setIsThermalBlocked:1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v5 = [*(id *)(a1 + 32) drainQueue];
    id v6 = [v5 operations];

    id v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (int i = 0; i != v8; int i = (char *)i + 1)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) pause];
        }
        id v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
    goto LABEL_19;
  }
  if (v2 >= 12)
  {
    uint64_t v11 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device is hot enough to trigger OS warning screen and process murdering. Aborting battery drain.", buf, 2u);
    }

    [*(id *)(a1 + 32) setIsThermalBlocked:1];
    id v22 = 0;
    +[BatteryDrainController setCode:-1 forError:&v22];
    id v6 = v22;
    [*(id *)(a1 + 32) failedToExecuteWithError:v6];
LABEL_19:

    return;
  }
  if (!v2 && [*(id *)(a1 + 32) isThermalBlocked])
  {
    long long v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Resuming drain operations due to lowered thermal state", buf, 2u);
    }

    [*(id *)(a1 + 32) setIsThermalBlocked:0];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v13 = [*(id *)(a1 + 32) drainQueue];
    id v6 = [v13 operations];

    id v14 = [v6 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * (void)j) resume];
        }
        id v15 = [v6 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v15);
    }
    goto LABEL_19;
  }
}

void sub_100008A5C(IONotificationPort **a1, io_iterator_t a2)
{
  kern_return_t v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11;
  unsigned char v12[15];
  uint8_t buf[16];

  v5 = *a1;
  io_object_t v6 = IOIteratorNext(a2);
  if (v6)
  {
    io_service_t v7 = v6;
    do
    {
      id v8 = IOServiceAddInterestNotification(v5, v7, "IOGeneralInterest", (IOServiceInterestCallback)sub_100009040, 0, (io_object_t *)&dword_10001A7A8);
      uint64_t v9 = DiagnosticLogHandleForCategory();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10000CD9C(&v11, v12, v10);
        }
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Added interest notification for battery", buf, 2u);
        }

        sub_10000905C(v7);
      }
      IOObjectRelease(v7);
      io_service_t v7 = IOIteratorNext(a2);
    }
    while (v7);
  }
}

void sub_100009040(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536723200) {
    sub_10000905C(a2);
  }
}

void sub_10000905C(io_registry_entry_t a1)
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  sub_100009478(a1, v3, @"CurrentCapacity");
  sub_100009478(a1, v3, @"MaxCapacity");
  sub_100009478(a1, v3, @"AtCriticalLevel");
  sub_100009478(a1, v3, @"Voltage");
  sub_100009478(a1, v3, @"FullyCharged");
  sub_100009478(a1, v3, @"IsCharging");
  sub_100009478(a1, v3, @"ExternalConnected");
  sub_100009478(a1, v3, @"ExternalChargeCapable");
  sub_100009478(a1, v3, @"AdapterInfo");
  sub_100009478(a1, v3, @"CapacityEstimated");
  sub_100009478(a1, v3, @"AdapterDetails");
  id v4 = [v3 count];
  v5 = DiagnosticLogHandleForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_WORD *)long long v26 = 0;
    io_service_t v7 = "Updating battery status with populated properties";
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    *(_WORD *)long long v26 = 0;
    io_service_t v7 = "Updating battery status properties, will be UIDeviceBatteryStateUnknown";
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, v26, 2u);
LABEL_7:

  id v8 = v3;
  uint64_t v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10000CEAC((uint64_t)v8, v9);
  }

  v10 = [v8 objectForKey:@"CurrentCapacity"];
  int v11 = [v10 intValue];

  long long v12 = [v8 objectForKey:@"MaxCapacity"];
  unsigned int v13 = [v12 intValue];

  if (v13) {
    int v14 = v13;
  }
  else {
    int v14 = 100;
  }
  float v15 = (float)v11 / (float)v14;
  if (v15 != *(float *)&dword_10001A5B8)
  {
    uint64_t v16 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v26 = 134218240;
      *(double *)&v26[4] = *(float *)&dword_10001A5B8;
      *(_WORD *)&v26[12] = 2048;
      double v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Battery level has changed from %f to %f. Sending notification", v26, 0x16u);
    }

    uint64_t v17 = +[NSNotificationCenter defaultCenter];
    *(float *)&double v18 = v15;
    long long v19 = +[NSNumber numberWithFloat:v18];
    [v17 postNotificationName:@"com.apple.Diagnostics.BatteryLevelChangedNotification" object:v19];

    dword_10001A5B8 = LODWORD(v15);
  }
  long long v20 = [v8 objectForKey:@"IsCharging"];
  unsigned int v21 = [v20 BOOLValue];

  id v22 = [v8 objectForKey:@"ExternalConnected"];
  unsigned int v23 = [v22 BOOLValue];

  if ((v21 & 1) != 0 || v23)
  {
    long long v24 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v26 = 67109376;
      *(_DWORD *)&v26[4] = v21;
      *(_WORD *)&v26[8] = 1024;
      *(_DWORD *)&v26[10] = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "The battery is either charging (%d) or connected to a charging source (%d). Sending notification", v26, 0xEu);
    }

    long long v25 = +[NSNotificationCenter defaultCenter];
    [v25 postNotificationName:@"com.apple.Diagnostics.BatteryConnectedToChargingNotification" object:0];
  }
}

void sub_100009478(io_registry_entry_t a1, void *a2, const __CFString *a3)
{
  id v7 = a2;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, a3, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    BOOL v6 = (void *)CFProperty;
    [v7 setObject:CFProperty forKey:a3];
  }
}

void sub_100009504(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009520(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100009954(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_100009CEC(id a1, id a2)
{
  id v2 = a2;
  BOOL v3 = [v2 length] && (unint64_t)[v2 length] < 0x33;

  return v3;
}

uint64_t GetPhysicalCPUs()
{
  int v4 = 0;
  size_t v3 = 4;
  int v0 = sysctlbyname("hw.physicalcpu_max", &v4, &v3, 0, 0);
  unsigned int v1 = v4;
  if (v4 <= 1) {
    unsigned int v1 = 1;
  }
  if (v0) {
    return 1;
  }
  else {
    return v1;
  }
}

uint64_t detect_cpu()
{
  unsigned int v2 = 0;
  size_t v1 = 4;
  if (sysctlbyname("hw.cpufamily", &v2, &v1, 0, 0)) {
    return 0;
  }
  else {
    return v2;
  }
}

size_t printBestThermalInfo()
{
  return fwrite("\nUse the following for maximum energy expenditure and battery discharge on: \nCortex-A7:             thermalA7Synthetic -n 0         \nSwift:                 thermalSwiftSynthetic -n 0      \nCyclone:               thermalCycloneSynthetic -n 0    \nTyphoon:               thermalTyphoonSynthetic -n 0    \nTwister:               thermalTwisterSynthetic -n 0    \nHurricane/Zephyr:      thermalHurricaneSynthetic -n 0  \nMonsoon/Mistral:       thermalMonsoonSynthetic -n 0    \nVortex/Tempest:        thermalVortexSynthetic -n 0        \nTempest:               thermalTempestSynthetic -n 0    \n\n", 0x249uLL, 1uLL, __stderrp);
}

double matrix4x4_translation(float a1, float a2, float a3)
{
  __asm { FMOV            V3.4S, #1.0 }
  *(void *)&double result = 1065353216;
  return result;
}

double matrix4x4_rotation(float a1, float32x4_t a2)
{
  int32x4_t v2 = (int32x4_t)vmulq_f32(a2, a2);
  v2.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v2, 2), vadd_f32(*(float32x2_t *)v2.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v2.i8, 1))).u32[0];
  float32x2_t v3 = vrsqrte_f32((float32x2_t)v2.u32[0]);
  float32x2_t v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v3, v3)));
  float32x4_t v8 = vmulq_n_f32(a2, vmul_f32(v4, vrsqrts_f32((float32x2_t)v2.u32[0], vmul_f32(v4, v4))).f32[0]);
  __float2 v5 = __sincosf_stret(a1);
  LODWORD(v6) = vmlas_n_f32(v5.__cosval, 1.0 - v5.__cosval, vmulq_f32(v8, v8).f32[0]);
  *((float *)&v6 + 1) = vmuls_lane_f32(v5.__sinval, v8, 2)
                      + (float)(vmuls_lane_f32(v8.f32[0], *(float32x2_t *)v8.f32, 1) * (float)(1.0 - v5.__cosval));
  return v6;
}

void sub_10000B830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)Renderer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000B934(void *a1)
{
}

void sub_10000BC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000CA54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

intptr_t sub_10000CA84(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 176));
}

void sub_10000CBD4(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to download asset: %@", buf, 0xCu);
}

void sub_10000CC34(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to save asset [%@]: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000CCBC(os_log_t log)
{
  *(_WORD *)size_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to restore USB charging.", v1, 2u);
}

void sub_10000CD00()
{
  sub_1000094F8();
  sub_100009504((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't create notification port", v2, v3, v4, v5, v6);
}

void sub_10000CD34()
{
  sub_1000094F8();
  sub_100009504((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't get run loop source", v2, v3, v4, v5, v6);
}

void sub_10000CD68()
{
  sub_1000094F8();
  sub_100009504((void *)&_mh_execute_header, v0, v1, "Failed to register for battery status changes: couldn't add matching notification", v2, v3, v4, v5, v6);
}

void sub_10000CD9C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to add interest notification for battery", buf, 2u);
}

void sub_10000CDDC()
{
  sub_1000094F8();
  sub_100009520((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: destroying notification port", v2, v3, v4, v5, v6);
}

void sub_10000CE10()
{
  sub_1000094F8();
  sub_100009504((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: no run loop source", v2, v3, v4, v5, v6);
}

void sub_10000CE44()
{
  sub_1000094F8();
  sub_100009520((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: removed run loop source", v2, v3, v4, v5, v6);
}

void sub_10000CE78()
{
  sub_1000094F8();
  sub_100009520((void *)&_mh_execute_header, v0, v1, "Unregistering for battery status changes: releasing matching notification", v2, v3, v4, v5, v6);
}

void sub_10000CEAC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Updating battery data based on properties: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CF24()
{
  id v0 = (id)objc_opt_class();
  sub_100009954((void *)&_mh_execute_header, v1, v2, "Starting [%@]", v3, v4, v5, v6, 2u);
}

void sub_10000CFAC()
{
  id v0 = (id)objc_opt_class();
  sub_100009954((void *)&_mh_execute_header, v1, v2, "Cancelling [%@]", v3, v4, v5, v6, 2u);
}

void sub_10000D034()
{
  id v0 = (id)objc_opt_class();
  sub_100009954((void *)&_mh_execute_header, v1, v2, "Finishing [%@]", v3, v4, v5, v6, 2u);
}

void sub_10000D0BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create metal renderer.", v1, 2u);
}

void sub_10000D100(uint64_t a1, NSObject *a2)
{
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Main returning for %@", (uint8_t *)&v4, 0xCu);
}

void sub_10000D198(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/Diagnostics/DiagnosticsService/Diagnostic-8187/CPUDrainOperation.m";
  __int16 v3 = 1024;
  int v4 = 133;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: %s:%d, unable to allocate memory.", (uint8_t *)&v1, 0x12u);
}

void sub_10000D22C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "This version of thermalSGEMMEnergy supports CYCLONE, TYPHOON, and TWISTER CPU families...", v1, 2u);
}

uint64_t BKSDisplayBrightnessGetCurrent()
{
  return _BKSDisplayBrightnessGetCurrent();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return _IORegistryEntrySetCFProperties(entry, properties);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return _OSThermalNotificationCurrentLevel();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return ___cxa_atexit(lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void cblas_sgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const float __alpha, const float *__A, const int __lda, const float *__B, const int __ldb, const float __beta, float *__C, const int __ldc)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int rand(void)
{
  return _rand();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_accessoryConnectDetector(void *a1, const char *a2, ...)
{
  return [a1 accessoryConnectDetector];
}

id objc_msgSend_accessoryDetectorModelNumbers(void *a1, const char *a2, ...)
{
  return [a1 accessoryDetectorModelNumbers];
}

id objc_msgSend_accessoryDisconnectDetector(void *a1, const char *a2, ...)
{
  return [a1 accessoryDisconnectDetector];
}

id objc_msgSend_audioFileURL(void *a1, const char *a2, ...)
{
  return [a1 audioFileURL];
}

id objc_msgSend_audioFilename(void *a1, const char *a2, ...)
{
  return [a1 audioFilename];
}

id objc_msgSend_audioPlayer(void *a1, const char *a2, ...)
{
  return [a1 audioPlayer];
}

id objc_msgSend_audioVolume(void *a1, const char *a2, ...)
{
  return [a1 audioVolume];
}

id objc_msgSend_autoBrightnessOff(void *a1, const char *a2, ...)
{
  return [a1 autoBrightnessOff];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brightnessSystemClient(void *a1, const char *a2, ...)
{
  return [a1 brightnessSystemClient];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorAttachments(void *a1, const char *a2, ...)
{
  return [a1 colorAttachments];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return [a1 connectedAccessories];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cpuDrainIterationDelay(void *a1, const char *a2, ...)
{
  return [a1 cpuDrainIterationDelay];
}

id objc_msgSend_cpuDrainMatrixLength(void *a1, const char *a2, ...)
{
  return [a1 cpuDrainMatrixLength];
}

id objc_msgSend_createBuffers(void *a1, const char *a2, ...)
{
  return [a1 createBuffers];
}

id objc_msgSend_createIntersector(void *a1, const char *a2, ...)
{
  return [a1 createIntersector];
}

id objc_msgSend_createPipelines(void *a1, const char *a2, ...)
{
  return [a1 createPipelines];
}

id objc_msgSend_createScene(void *a1, const char *a2, ...)
{
  return [a1 createScene];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableUSBCharging(void *a1, const char *a2, ...)
{
  return [a1 disableUSBCharging];
}

id objc_msgSend_displayBrightness(void *a1, const char *a2, ...)
{
  return [a1 displayBrightness];
}

id objc_msgSend_drainAudio(void *a1, const char *a2, ...)
{
  return [a1 drainAudio];
}

id objc_msgSend_drainCPU(void *a1, const char *a2, ...)
{
  return [a1 drainCPU];
}

id objc_msgSend_drainDisplay(void *a1, const char *a2, ...)
{
  return [a1 drainDisplay];
}

id objc_msgSend_drainGPU(void *a1, const char *a2, ...)
{
  return [a1 drainGPU];
}

id objc_msgSend_drainQueue(void *a1, const char *a2, ...)
{
  return [a1 drainQueue];
}

id objc_msgSend_enableUSBCharging(void *a1, const char *a2, ...)
{
  return [a1 enableUSBCharging];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_ensureAnalyticsFreeEnvironment(void *a1, const char *a2, ...)
{
  return [a1 ensureAnalyticsFreeEnvironment];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getPowerMode(void *a1, const char *a2, ...)
{
  return [a1 getPowerMode];
}

id objc_msgSend_gpuDrainIterationDelay(void *a1, const char *a2, ...)
{
  return [a1 gpuDrainIterationDelay];
}

id objc_msgSend_hasRenderDevice(void *a1, const char *a2, ...)
{
  return [a1 hasRenderDevice];
}

id objc_msgSend_initOperations(void *a1, const char *a2, ...)
{
  return [a1 initOperations];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAccessoryDetectorActive(void *a1, const char *a2, ...)
{
  return [a1 isAccessoryDetectorActive];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDeviceConnectedToRequiredAccessory(void *a1, const char *a2, ...)
{
  return [a1 isDeviceConnectedToRequiredAccessory];
}

id objc_msgSend_isDeviceConnectedToUnexpectedAccessory(void *a1, const char *a2, ...)
{
  return [a1 isDeviceConnectedToUnexpectedAccessory];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isThermalBlocked(void *a1, const char *a2, ...)
{
  return [a1 isThermalBlocked];
}

id objc_msgSend_iterationDelay(void *a1, const char *a2, ...)
{
  return [a1 iterationDelay];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadMetal(void *a1, const char *a2, ...)
{
  return [a1 loadMetal];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lowPowerModeOff(void *a1, const char *a2, ...)
{
  return [a1 lowPowerModeOff];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return [a1 main];
}

id objc_msgSend_matrixLength(void *a1, const char *a2, ...)
{
  return [a1 matrixLength];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_modelNumbers(void *a1, const char *a2, ...)
{
  return [a1 modelNumbers];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 newCommandQueue];
}

id objc_msgSend_newDefaultLibrary(void *a1, const char *a2, ...)
{
  return [a1 newDefaultLibrary];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_originalPowerMode(void *a1, const char *a2, ...)
{
  return [a1 originalPowerMode];
}

id objc_msgSend_originalPowerModeSet(void *a1, const char *a2, ...)
{
  return [a1 originalPowerModeSet];
}

id objc_msgSend_originalScreenBrightness(void *a1, const char *a2, ...)
{
  return [a1 originalScreenBrightness];
}

id objc_msgSend_originalVolume(void *a1, const char *a2, ...)
{
  return [a1 originalVolume];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_pauseLock(void *a1, const char *a2, ...)
{
  return [a1 pauseLock];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_recievedShutdownNotification(void *a1, const char *a2, ...)
{
  return [a1 recievedShutdownNotification];
}

id objc_msgSend_recievedThermalStateChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 recievedThermalStateChangedNotification];
}

id objc_msgSend_registerForBatteryEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForBatteryEvents];
}

id objc_msgSend_registerForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLocalNotifications];
}

id objc_msgSend_render(void *a1, const char *a2, ...)
{
  return [a1 render];
}

id objc_msgSend_requestedBrightness(void *a1, const char *a2, ...)
{
  return [a1 requestedBrightness];
}

id objc_msgSend_requestedVolume(void *a1, const char *a2, ...)
{
  return [a1 requestedVolume];
}

id objc_msgSend_responder(void *a1, const char *a2, ...)
{
  return [a1 responder];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_setupNotifications(void *a1, const char *a2, ...)
{
  return [a1 setupNotifications];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAccessoryManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startingBatteryPercentage(void *a1, const char *a2, ...)
{
  return [a1 startingBatteryPercentage];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_targetBatteryPercentage(void *a1, const char *a2, ...)
{
  return [a1 targetBatteryPercentage];
}

id objc_msgSend_thermalSGEMMEnergyObjC(void *a1, const char *a2, ...)
{
  return [a1 thermalSGEMMEnergyObjC];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unregisterForBatteryEvents(void *a1, const char *a2, ...)
{
  return [a1 unregisterForBatteryEvents];
}

id objc_msgSend_unregisterForLocalNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForLocalNotifications];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateUniforms(void *a1, const char *a2, ...)
{
  return [a1 updateUniforms];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_waitForSafeThermalState(void *a1, const char *a2, ...)
{
  return [a1 waitForSafeThermalState];
}

id objc_msgSend_waitIfPaused(void *a1, const char *a2, ...)
{
  return [a1 waitIfPaused];
}

id objc_msgSend_wasAutoBrightnessEnabled(void *a1, const char *a2, ...)
{
  return [a1 wasAutoBrightnessEnabled];
}

id objc_msgSend_wasChargingDisabledDuringTest(void *a1, const char *a2, ...)
{
  return [a1 wasChargingDisabledDuringTest];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:options:error:];
}