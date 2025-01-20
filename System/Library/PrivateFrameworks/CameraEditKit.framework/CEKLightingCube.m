@interface CEKLightingCube
- (CEKLightingCube)initWithRotationAngle:(double)a3;
- (CGPath)centerPathWithSize:(CGSize)a3;
- (CGPath)centerShadowPathWithSize:(CGSize)a3 width:(double)a4;
- (CGPath)pathForOutlineWithSize:(CGSize)a3 cornerRadius:(double)a4;
- (CGPath)pathForPlane:(int64_t)a3 size:(CGSize)a4;
- (double)intensityForPlane:(int64_t)a3;
- (void)points:(CEKLightingCube *)self forPlane:(SEL)a2 size:(CGPoint *)(a3;
- (void)points:(CGPoint *)(a3 forOutlineWithSize:;
@end

@implementation CEKLightingCube

- (CEKLightingCube)initWithRotationAngle:(double)a3
{
  v80.receiver = self;
  v80.super_class = (Class)CEKLightingCube;
  v4 = [(CEKLightingCube *)&v80 init];
  if (v4)
  {
    float v5 = a3;
    *(double *)v6.i64 = Rotation(v5, 0.0, 1.0);
    float32x4_t v78 = v7;
    float32x4_t v79 = v6;
    float32x4_t v76 = v9;
    float32x4_t v77 = v8;
    float32x4_t v75 = *(float32x4_t *)MEMORY[0x1E4F149A0];
    float32x4_t v10 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 16);
    float32x4_t v72 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
    float32x4_t v73 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32);
    v10.i32[1] = -1088581612;
    float32x4_t v74 = v10;
    *(double *)v11.i64 = Rotation(0.61548, 1.0, 0.0);
    float32x4_t v70 = v12;
    float32x4_t v71 = v11;
    float32x4_t v68 = v14;
    float32x4_t v69 = v13;
    *(double *)v15.i64 = Rotation(0.7854, 0.0, 1.0);
    unint64_t v16 = 0;
    float32x4_t v81 = v15;
    float32x4_t v82 = v17;
    float32x4_t v83 = v18;
    float32x4_t v84 = v19;
    float32x4_t v85 = 0u;
    float32x4_t v86 = 0u;
    float32x4_t v87 = 0u;
    float32x4_t v88 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v85 + v16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v16))), v70, *(float32x2_t *)&v81.f32[v16 / 4], 1), v69, *(float32x4_t *)((char *)&v81 + v16), 2), v68, *(float32x4_t *)((char *)&v81 + v16), 3);
      v16 += 16;
    }
    while (v16 != 64);
    unint64_t v20 = 0;
    float32x4_t v21 = v75;
    v21.i32[0] = 1058902036;
    float32x4_t v22 = v73;
    v22.i32[2] = 1058902036;
    float32x4_t v81 = v85;
    float32x4_t v82 = v86;
    float32x4_t v83 = v87;
    float32x4_t v84 = v88;
    float32x4_t v85 = 0u;
    float32x4_t v86 = 0u;
    float32x4_t v87 = 0u;
    float32x4_t v88 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v85 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v20))), v74, *(float32x2_t *)&v81.f32[v20 / 4], 1), v22, *(float32x4_t *)((char *)&v81 + v20), 2), v72, *(float32x4_t *)((char *)&v81 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    unint64_t v23 = 0;
    float32x4_t v24 = v85;
    float32x4_t v25 = v86;
    float32x4_t v26 = v87;
    float32x4_t v27 = v88;
    float32x4_t v81 = v79;
    float32x4_t v82 = v78;
    float32x4_t v83 = v77;
    float32x4_t v84 = v76;
    float32x4_t v85 = 0u;
    float32x4_t v86 = 0u;
    float32x4_t v87 = 0u;
    float32x4_t v88 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v85 + v23) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(*(_OWORD *)((char *)&v81 + v23))), v25, *(float32x2_t *)&v81.f32[v23 / 4], 1), v26, *(float32x4_t *)((char *)&v81 + v23), 2), v27, *(float32x4_t *)((char *)&v81 + v23), 3);
      v23 += 16;
    }
    while (v23 != 64);
    uint64_t v28 = 0;
    float32x4_t v29 = v85;
    float32x4_t v30 = v86;
    normals = v4->_normals;
    float32x4_t v32 = v87;
    float32x4_t v33 = v88;
    do
    {
      int32x4_t v34 = (int32x4_t)vaddq_f32(v33, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(initWithRotationAngle__CEKLightingCubePlaneNormals[v28])), v30, *(float32x2_t *)&initWithRotationAngle__CEKLightingCubePlaneNormals[v28], 1), v32, (float32x4_t)initWithRotationAngle__CEKLightingCubePlaneNormals[v28], 2));
      float32x2_t v35 = (float32x2_t)vextq_s8((int8x16_t)v34, (int8x16_t)v34, 8uLL).u64[0];
      int8x16_t v36 = (int8x16_t)vdupq_laneq_s32(v34, 3);
      *(float32x2_t *)v34.i8 = vdiv_f32(*(float32x2_t *)v34.i8, *(float32x2_t *)v36.i8);
      v34.u64[1] = (unint64_t)vdiv_f32(v35, (float32x2_t)*(_OWORD *)&vextq_s8(v36, v36, 8uLL));
      *(int32x4_t *)&normals[v28 * 16] = v34;
      ++v28;
    }
    while (v28 != 6);
    uint64_t v37 = 0;
    world = v4->_world;
    do
    {
      int32x4_t v39 = (int32x4_t)vaddq_f32(v33, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(initWithRotationAngle__CubePoints[v37])), v30, *(float32x2_t *)&initWithRotationAngle__CubePoints[v37], 1), v32, (float32x4_t)initWithRotationAngle__CubePoints[v37], 2));
      float32x2_t v40 = (float32x2_t)vextq_s8((int8x16_t)v39, (int8x16_t)v39, 8uLL).u64[0];
      int8x16_t v41 = (int8x16_t)vdupq_laneq_s32(v39, 3);
      *(float32x2_t *)v39.i8 = vdiv_f32(*(float32x2_t *)v39.i8, *(float32x2_t *)v41.i8);
      v39.u64[1] = (unint64_t)vdiv_f32(v40, (float32x2_t)*(_OWORD *)&vextq_s8(v41, v41, 8uLL));
      *(int32x4_t *)&world[v37 * 16] = v39;
      ++v37;
    }
    while (v37 != 8);
    for (uint64_t i = 0; i != 8; ++i)
    {
      int32x4_t v43 = (int32x4_t)vaddq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1BEE74400, COERCE_FLOAT(*(_OWORD *)&v4->_world[i * 16])), (float32x4_t)xmmword_1BEE74410, *(float32x2_t *)&v4->_world[i * 16], 1), (float32x4_t)xmmword_1BEE74420, *(float32x4_t *)&v4->_world[i * 16], 2), (float32x4_t)xmmword_1BEE74430);
      v4->_screen[i] = (CGPoint)vcvtq_f64_f32(vdiv_f32(*(float32x2_t *)v43.i8, (float32x2_t)vdup_laneq_s32(v43, 3)));
    }
    int64_t v44 = 0;
    points = v4->_points;
    do
    {
      points[v44] = v44;
      ++v44;
    }
    while (v44 != 9);
    int64_t v46 = 0;
    int64_t v47 = v4->_points[0];
    int64_t v48 = v4->_points[1];
    v49 = &v4->_world[8];
    v50 = v4->_world;
    int64_t v51 = v4->_points[2];
    int64_t v52 = v4->_points[3];
    do
    {
      long long v53 = *(_OWORD *)v50;
      if (COERCE_FLOAT(*(_OWORD *)v50) <= *(float *)&world[16 * v47])
      {
        int64_t *points = v46;
        int64_t v47 = v46;
      }
      if (*((float *)&v53 + 2) >= *(float *)&v49[16 * v48])
      {
        v4->_points[1] = v46;
        int64_t v48 = v46;
      }
      long long v54 = *(_OWORD *)v50;
      if (COERCE_FLOAT(*(_OWORD *)v50) >= *(float *)&world[16 * v51])
      {
        v4->_points[2] = v46;
        int64_t v51 = v46;
      }
      if (*((float *)&v54 + 2) <= *(float *)&v49[16 * v52])
      {
        v4->_points[3] = v46;
        int64_t v52 = v46;
      }
      ++v46;
      v50 += 16;
    }
    while (v46 != 4);
    uint64_t v55 = v4->_points[4];
    uint64_t v56 = v4->_points[5];
    v57 = &v4->_world[64];
    uint64_t v58 = 4;
    uint64_t v59 = v4->_points[6];
    uint64_t v60 = v4->_points[7];
    do
    {
      long long v61 = *(_OWORD *)v57;
      if (COERCE_FLOAT(*(_OWORD *)v57) <= *(float *)&world[16 * v55])
      {
        v4->_points[4] = v58;
        uint64_t v55 = v58;
      }
      if (*((float *)&v61 + 2) >= *(float *)&v49[16 * v56])
      {
        v4->_points[5] = v58;
        uint64_t v56 = v58;
      }
      long long v62 = *(_OWORD *)v57;
      if (COERCE_FLOAT(*(_OWORD *)v57) >= *(float *)&world[16 * v59])
      {
        v4->_points[6] = v58;
        uint64_t v59 = v58;
      }
      if (*((float *)&v62 + 2) <= *(float *)&v49[16 * v60])
      {
        v4->_points[7] = v58;
        uint64_t v60 = v58;
      }
      ++v58;
      v57 += 16;
    }
    while (v58 != 8);
    v4->_planes[0] = 0;
    v4->_planes[5] = 5;
    v63 = &v4->_normals[16];
    for (uint64_t j = 1; j != 5; ++j)
    {
      long long v65 = *(_OWORD *)v63;
      float v66 = COERCE_FLOAT(*((void *)v63 + 1));
      if (v66 <= 0.0 && *(float *)&v65 <= *(float *)&normals[16 * v4->_planes[1]])
      {
        v4->_planes[1] = j;
        long long v65 = *(_OWORD *)v63;
        LODWORD(v66) = *((void *)v63 + 1);
      }
      if (v66 <= 0.0 && *(float *)&v65 >= *(float *)&normals[16 * v4->_planes[2]])
      {
        v4->_planes[2] = j;
        long long v65 = *(_OWORD *)v63;
        LODWORD(v66) = *((void *)v63 + 1);
      }
      if (v66 >= 0.0 && *(float *)&v65 <= *(float *)&normals[16 * v4->_planes[3]])
      {
        v4->_planes[3] = j;
        long long v65 = *(_OWORD *)v63;
        LODWORD(v66) = *((void *)v63 + 1);
      }
      if (v66 >= 0.0 && *(float *)&v65 >= *(float *)&normals[16 * v4->_planes[4]]) {
        v4->_planes[4] = j;
      }
      v63 += 16;
    }
  }
  return v4;
}

- (void)points:(CGPoint *)(a3 forOutlineWithSize:
{
}

- (CGPath)pathForOutlineWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  v7[12] = *(double *)MEMORY[0x1E4F143B8];
  -[CEKLightingCube points:forOutlineWithSize:](self, "points:forOutlineWithSize:", v7, a3.width, a3.height);
  RoundedPathForConvexPolygon = CreateRoundedPathForConvexPolygon(v7, 6, a4);
  return (CGPath *)CFAutorelease(RoundedPathForConvexPolygon);
}

- (CGPath)centerShadowPathWithSize:(CGSize)a3 width:(double)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v7 = a4 / a3.width;
  Mutable = CGPathCreateMutable();
  screen = self->_screen;
  float32x4_t v10 = &self->_screen[self->_points[3]];
  CGPathMoveToPoint(Mutable, 0, v10->x, v10->y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[0]].x, screen[self->_points[0]].y);
  float32x4_t v11 = &self->_screen[self->_points[4]];
  float32x4_t v12 = &self->_screen[self->_points[0]];
  double y = v11->y;
  double v14 = v12->x - v11->x;
  double v15 = v12->y - y;
  double v16 = sqrt(v15 * v15 + v14 * v14);
  double v17 = v14 / v16;
  BOOL v18 = v16 == 0.0;
  if (v16 == 0.0) {
    double v17 = 0.0;
  }
  double v19 = v15 / v16;
  if (v18) {
    double v19 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, 0, v11->x + v14 - v7 * v17, y + v15 - v7 * v19);
  p_x = &screen[self->_points[7]].x;
  float32x4_t v21 = &screen[self->_points[3]].x;
  double v22 = p_x[1];
  double v23 = *v21 - *p_x;
  double v24 = v21[1] - v22;
  double v25 = sqrt(v24 * v24 + v23 * v23);
  double v26 = v23 / v25;
  BOOL v27 = v25 == 0.0;
  if (v25 == 0.0) {
    double v26 = 0.0;
  }
  double v28 = v24 / v25;
  if (v27) {
    double v28 = 0.0;
  }
  double v29 = *p_x + v23 - v7 * v26;
  double v30 = v22 + v24 - v7 * v28;
  CGPathAddLineToPoint(Mutable, 0, v29, v30);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[7]].x, screen[self->_points[7]].y);
  v31 = &screen[self->_points[6]].x;
  float32x4_t v32 = &screen[self->_points[7]].x;
  double v33 = v31[1];
  double v34 = *v32 - *v31;
  double v35 = v32[1] - v33;
  double v36 = sqrt(v35 * v35 + v34 * v34);
  double v37 = v34 / v36;
  BOOL v38 = v36 == 0.0;
  if (v36 == 0.0) {
    double v37 = 0.0;
  }
  double v39 = v35 / v36;
  if (v38) {
    double v39 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, 0, *v31 + v34 - v7 * v37, v33 + v35 - v7 * v39);
  float32x2_t v40 = &screen[self->_points[2]].x;
  int8x16_t v41 = &screen[self->_points[3]].x;
  double v42 = v40[1];
  double v43 = v41[1];
  double v44 = *v41 - *v40;
  double v45 = v43 - v42;
  double v46 = sqrt(v45 * v45 + v44 * v44);
  double v47 = v44 / v46;
  BOOL v48 = v46 == 0.0;
  if (v46 == 0.0) {
    double v47 = 0.0;
  }
  double v49 = v45 / v46;
  if (v48) {
    double v49 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, 0, v29 - *v41 + *v41 + *v40 + v44 - v7 * v47 - *v41, v30 - v43 + v43 + v42 + v45 - v7 * v49 - v43);
  v50 = &screen[self->_points[6]].x;
  int64_t v51 = &screen[self->_points[2]].x;
  double v52 = v50[1];
  double v53 = *v51 - *v50;
  double v54 = v51[1] - v52;
  double v55 = sqrt(v54 * v54 + v53 * v53);
  double v56 = v53 / v55;
  BOOL v57 = v55 == 0.0;
  if (v55 == 0.0) {
    double v56 = 0.0;
  }
  double v58 = v54 / v55;
  if (v57) {
    double v58 = 0.0;
  }
  CGPathAddLineToPoint(Mutable, 0, *v50 + v53 - v7 * v56, v52 + v54 - v7 * v58);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[2]].x, screen[self->_points[2]].y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[3]].x, screen[self->_points[3]].y);
  CGPathCloseSubpath(Mutable);
  memset(&v61, 0, sizeof(v61));
  CGAffineTransformMakeScale(&v61, width, height);
  uint64_t v59 = (const void *)MEMORY[0x1C189DBD0](Mutable, &v61);
  CGPathRelease(Mutable);
  return (CGPath *)CFAutorelease(v59);
}

- (CGPath)centerPathWithSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  Mutable = CGPathCreateMutable();
  screen = self->_screen;
  float32x4_t v8 = &self->_screen[self->_points[3]];
  CGPathMoveToPoint(Mutable, 0, v8->x, v8->y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[7]].x, screen[self->_points[7]].y);
  CGPathMoveToPoint(Mutable, 0, screen[self->_points[3]].x, screen[self->_points[3]].y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[2]].x, screen[self->_points[2]].y);
  CGPathMoveToPoint(Mutable, 0, screen[self->_points[3]].x, screen[self->_points[3]].y);
  CGPathAddLineToPoint(Mutable, 0, screen[self->_points[0]].x, screen[self->_points[0]].y);
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, width, height);
  float32x4_t v9 = (const void *)MEMORY[0x1C189DBD0](Mutable, &v11);
  CGPathRelease(Mutable);
  return (CGPath *)CFAutorelease(v9);
}

- (void)points:(CEKLightingCube *)self forPlane:(SEL)a2 size:(CGPoint *)(a3
{
}

- (CGPath)pathForPlane:(int64_t)a3 size:(CGSize)a4
{
  v6[8] = *(double *)MEMORY[0x1E4F143B8];
  -[CEKLightingCube points:forPlane:size:](self, "points:forPlane:size:", v6, a3, a4.width, a4.height);
  RoundedPathForConvexPolygon = CreateRoundedPathForConvexPolygon(v6, 4, 0.0);
  return (CGPath *)CFAutorelease(RoundedPathForConvexPolygon);
}

- (double)intensityForPlane:(int64_t)a3
{
  float32x2_t v3 = vrsqrte_f32((float32x2_t)1068373115);
  float32x2_t v4 = vmul_f32(v3, vrsqrts_f32((float32x2_t)1068373115, vmul_f32(v3, v3)));
  float32x4_t v5 = vmulq_n_f32((float32x4_t)xmmword_1BEE74450, vmul_f32(v4, vrsqrts_f32((float32x2_t)1068373115, vmul_f32(v4, v4))).f32[0]);
  float32x4_t v6 = *(float32x4_t *)&self->_normals[16 * self->_planes[a3]];
  int32x4_t v7 = (int32x4_t)vmulq_f32(v6, v6);
  v7.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v7, 2), vadd_f32(*(float32x2_t *)v7.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v7.i8, 1))).u32[0];
  float32x2_t v8 = vrsqrte_f32((float32x2_t)v7.u32[0]);
  float32x2_t v9 = vmul_f32(v8, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v8, v8)));
  float32x4_t v10 = vmulq_f32(v5, vmulq_n_f32(v6, vmul_f32(v9, vrsqrts_f32((float32x2_t)v7.u32[0], vmul_f32(v9, v9))).f32[0]));
  return fabsf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))).f32[0]);
}

@end