id NTKAkitaGetMorphConfigString(unint64_t a1)
{
  _OWORD *v2;
  long long v3;
  long long v4;
  void *v5;
  _OWORD v7[4];
  uint64_t vars8;

  if (qword_154A0 != -1) {
    dispatch_once(&qword_154A0, &stru_10318);
  }
  v2 = (_OWORD *)((char *)&unk_154A8 + 64 * (a1 % 0x13));
  v3 = v2[1];
  v7[0] = *v2;
  v7[1] = v3;
  v4 = v2[3];
  v7[2] = v2[2];
  v7[3] = v4;
  v5 = sub_4A58(v7);

  return v5;
}

id sub_4A58(void *a1)
{
  v15[0] = @"backgroundColor";
  v2 = +[NSNumber numberWithUnsignedInteger:*a1];
  v16[0] = v2;
  v15[1] = @"hairColor";
  v3 = +[NSNumber numberWithUnsignedInteger:a1[1]];
  v16[1] = v3;
  v15[2] = @"skinColor";
  v4 = +[NSNumber numberWithUnsignedInteger:a1[2]];
  v16[2] = v4;
  v15[3] = @"shirtColor";
  v5 = +[NSNumber numberWithUnsignedInteger:a1[3]];
  v16[3] = v5;
  v15[4] = @"hairPathIndex";
  v6 = +[NSNumber numberWithUnsignedInteger:a1[4]];
  v16[4] = v6;
  v15[5] = @"bodyPathIndex";
  v7 = +[NSNumber numberWithUnsignedInteger:a1[5]];
  v16[5] = v7;
  v15[6] = @"nosePathIndex";
  v8 = +[NSNumber numberWithUnsignedInteger:a1[6]];
  v16[6] = v8;
  v15[7] = @"lipsPathIndex";
  v9 = +[NSNumber numberWithUnsignedInteger:a1[7]];
  v16[7] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:8];

  uint64_t v14 = 0;
  v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:&v14];
  id v12 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4];

  return v12;
}

uint64_t sub_4E18@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)(a3 + 56) = 0;
  *(_OWORD *)(a3 + 40) = 0u;
  *(_OWORD *)(a3 + 24) = 0u;
  *(_OWORD *)(a3 + 8) = 0u;
  *(void *)a3 = a1;
  uint64_t v6 = arc4random_uniform(8u) + 6;
  *(void *)(a3 + 16) = v6;
  int v8 = 20;
  do
  {
    if (v6 != a1 && v6 != a2[2])
    {
      double SRGBf = NTKAkitaColorGetSRGBf(v6, 0, v7);
      NTKAkitaColorGetSRGBf(a1, 0, *(uint8x8_t *)&SRGBf);
      CLKUIConvertToRGBfFromSRGBf_fast();
      float32x4_t v94 = v10;
      CLKUIConvertToRGBfFromSRGBf_fast();
      float32x4_t v12 = vsubq_f32(v94, v11);
      float32x4_t v13 = vmulq_f32(v12, v12);
      uint8x8_t v14 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))).u64[0];
      if (*(float *)v14.i32 >= 0.01)
      {
        double v15 = NTKAkitaColorGetSRGBf(v6, 1, v14);
        NTKAkitaColorGetSRGBf(a1, 0, *(uint8x8_t *)&v15);
        CLKUIConvertToRGBfFromSRGBf_fast();
        float32x4_t v95 = v16;
        CLKUIConvertToRGBfFromSRGBf_fast();
        float32x4_t v18 = vsubq_f32(v95, v17);
        float32x4_t v19 = vmulq_f32(v18, v18);
        if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v19, 2), vaddq_f32(v19, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v19.f32, 1))).f32[0] >= 0.01)break; {
      }
        }
    }
    uint64_t v6 = arc4random_uniform(8u) + 6;
    *(void *)(a3 + 16) = v6;
    --v8;
  }
  while (v8);
  uint32_t v20 = arc4random_uniform(2u);
  uint32_t v21 = arc4random_uniform(0x12u);
  uint64_t v23 = v21 + 1;
  if (v20)
  {
    *(void *)(a3 + 24) = v23;
    int v24 = 20;
    do
    {
      if (v23 != a1)
      {
        if (v23)
        {
          if (v6 != v23 && a2[3] != v23)
          {
            double v25 = NTKAkitaColorGetSRGBf(v23, 0, v22);
            NTKAkitaColorGetSRGBf(a1, 0, *(uint8x8_t *)&v25);
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v96 = v26;
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v28 = vsubq_f32(v96, v27);
            float32x4_t v29 = vmulq_f32(v28, v28);
            uint8x8_t v30 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v29, 2), vaddq_f32(v29, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v29.f32, 1))).u64[0];
            if (*(float *)v30.i32 >= 0.01)
            {
              double v31 = NTKAkitaColorGetSRGBf(v23, 0, v30);
              NTKAkitaColorGetSRGBf(v6, 1, *(uint8x8_t *)&v31);
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v97 = v32;
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v34 = vsubq_f32(v97, v33);
              float32x4_t v35 = vmulq_f32(v34, v34);
              if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v35, 2), vaddq_f32(v35, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v35.f32, 1))).f32[0] >= 0.01)break; {
            }
              }
          }
        }
      }
      uint32_t v21 = arc4random_uniform(0x12u);
      uint64_t v23 = v21 + 1;
      *(void *)(a3 + 24) = v23;
      --v24;
    }
    while (v24);
    uint32_t v36 = arc4random_uniform(0x12u);
    uint64_t v38 = v36 + 1;
    *(void *)(a3 + 8) = v38;
    int v39 = 20;
    do
    {
      if (v38 != a1 && v6 != v38 && v21 != v36)
      {
        if (v38)
        {
          if (a2[1] != v38)
          {
            double v40 = NTKAkitaColorGetSRGBf(v38, 0, v37);
            NTKAkitaColorGetSRGBf(a1, 0, *(uint8x8_t *)&v40);
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v98 = v41;
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v43 = vsubq_f32(v98, v42);
            float32x4_t v44 = vmulq_f32(v43, v43);
            uint8x8_t v45 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v44, 2), vaddq_f32(v44, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v44.f32, 1))).u64[0];
            if (*(float *)v45.i32 >= 0.01)
            {
              double v46 = NTKAkitaColorGetSRGBf(v38, 0, v45);
              NTKAkitaColorGetSRGBf(v6, 1, *(uint8x8_t *)&v46);
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v99 = v47;
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v49 = vsubq_f32(v99, v48);
              float32x4_t v50 = vmulq_f32(v49, v49);
              uint8x8_t v51 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2), vaddq_f32(v50, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 1))).u64[0];
              if (*(float *)v51.i32 >= 0.01)
              {
                double v52 = NTKAkitaColorGetSRGBf(v23, 0, v51);
                NTKAkitaColorGetSRGBf(v38, 0, *(uint8x8_t *)&v52);
                CLKUIConvertToRGBfFromSRGBf_fast();
                float32x4_t v100 = v53;
                CLKUIConvertToRGBfFromSRGBf_fast();
                float32x4_t v55 = vsubq_f32(v100, v54);
                float32x4_t v56 = vmulq_f32(v55, v55);
                if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))).f32[0] >= 0.01)break; {
              }
                }
            }
          }
        }
      }
      uint32_t v36 = arc4random_uniform(0x12u);
      uint64_t v38 = v36 + 1;
      *(void *)(a3 + 8) = v38;
      --v39;
    }
    while (v39);
  }
  else
  {
    *(void *)(a3 + 8) = v23;
    int v57 = 20;
    do
    {
      if (v23 != a1)
      {
        if (v23)
        {
          if (v6 != v23 && a2[1] != v23)
          {
            double v58 = NTKAkitaColorGetSRGBf(v23, 0, v22);
            NTKAkitaColorGetSRGBf(a1, 0, *(uint8x8_t *)&v58);
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v101 = v59;
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v61 = vsubq_f32(v101, v60);
            float32x4_t v62 = vmulq_f32(v61, v61);
            uint8x8_t v63 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v62, 2), vaddq_f32(v62, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v62.f32, 1))).u64[0];
            if (*(float *)v63.i32 >= 0.01)
            {
              double v64 = NTKAkitaColorGetSRGBf(v23, 0, v63);
              NTKAkitaColorGetSRGBf(v6, 1, *(uint8x8_t *)&v64);
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v102 = v65;
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v67 = vsubq_f32(v102, v66);
              float32x4_t v68 = vmulq_f32(v67, v67);
              if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v68, 2), vaddq_f32(v68, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v68.f32, 1))).f32[0] >= 0.01)break; {
            }
              }
          }
        }
      }
      uint32_t v21 = arc4random_uniform(0x12u);
      uint64_t v23 = v21 + 1;
      *(void *)(a3 + 8) = v23;
      --v57;
    }
    while (v57);
    uint32_t v69 = arc4random_uniform(0x12u);
    uint64_t v71 = v69 + 1;
    *(void *)(a3 + 24) = v71;
    int v72 = 20;
    do
    {
      if (v71 != a1 && v6 != v71 && v21 != v69)
      {
        if (v71)
        {
          if (a2[3] != v71)
          {
            double v73 = NTKAkitaColorGetSRGBf(v71, 0, v70);
            NTKAkitaColorGetSRGBf(a1, 0, *(uint8x8_t *)&v73);
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v103 = v74;
            CLKUIConvertToRGBfFromSRGBf_fast();
            float32x4_t v76 = vsubq_f32(v103, v75);
            float32x4_t v77 = vmulq_f32(v76, v76);
            uint8x8_t v78 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))).u64[0];
            if (*(float *)v78.i32 >= 0.01)
            {
              double v79 = NTKAkitaColorGetSRGBf(v71, 0, v78);
              NTKAkitaColorGetSRGBf(v6, 1, *(uint8x8_t *)&v79);
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v104 = v80;
              CLKUIConvertToRGBfFromSRGBf_fast();
              float32x4_t v82 = vsubq_f32(v104, v81);
              float32x4_t v83 = vmulq_f32(v82, v82);
              uint8x8_t v84 = (uint8x8_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v83, 2), vaddq_f32(v83, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v83.f32, 1))).u64[0];
              if (*(float *)v84.i32 >= 0.01)
              {
                double v85 = NTKAkitaColorGetSRGBf(v71, 0, v84);
                NTKAkitaColorGetSRGBf(v23, 0, *(uint8x8_t *)&v85);
                CLKUIConvertToRGBfFromSRGBf_fast();
                float32x4_t v105 = v86;
                CLKUIConvertToRGBfFromSRGBf_fast();
                float32x4_t v88 = vsubq_f32(v105, v87);
                float32x4_t v89 = vmulq_f32(v88, v88);
                if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v89, 2), vaddq_f32(v89, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v89.f32, 1))).f32[0] >= 0.01)break; {
              }
                }
            }
          }
        }
      }
      uint32_t v69 = arc4random_uniform(0x12u);
      uint64_t v71 = v69 + 1;
      *(void *)(a3 + 24) = v71;
      --v72;
    }
    while (v72);
  }
  do
  {
    uint32_t v90 = arc4random_uniform(0xCu);
    *(void *)(a3 + 32) = v90;
  }
  while (a2[4] == v90);
  do
  {
    uint32_t v91 = arc4random_uniform(0xAu);
    *(void *)(a3 + 40) = v91;
  }
  while (a2[5] == v91);
  do
  {
    uint32_t v92 = arc4random_uniform(6u);
    *(void *)(a3 + 48) = v92;
  }
  while (a2[6] == v92);
  do
  {
    uint64_t result = arc4random_uniform(9u);
    *(void *)(a3 + 56) = result;
  }
  while (a2[7] == result);
  return result;
}

void sub_5B30(id a1)
{
  unint64_t v1 = 0;
  uint64_t v2 = -1;
  uint64_t v3 = -1;
  uint64_t v4 = -1;
  do
  {
    char v5 = v1;
    do
    {
      uint64_t v6 = v5 & 7;
      uint64_t v7 = v6 + 6;
      char v5 = v6 + 7;
    }
    while (v7 == v1 || v7 == v3);
    uint64_t v3 = v7;
    unint64_t v9 = v1 + 3;
    do
    {
      unint64_t v10 = v9 % 0x12;
      unint64_t v11 = v9 % 0x12 + 1;
      unint64_t v9 = v9 % 0x12 + 2;
    }
    while (v10 + 1 == v4 || v11 == v1 || v11 == v7);
    uint64_t v4 = v10 + 1;
    unint64_t v14 = v10 + 4;
    do
    {
      unint64_t v15 = v14 % 0x12;
      unint64_t v16 = v14 % 0x12 + 1;
      unint64_t v14 = v14 % 0x12 + 2;
    }
    while (v15 + 1 == v2 || v15 == v10 || v16 == v1 || v16 == v7);
    v20.i64[0] = vdupq_n_s64(v1 % 0xA).u64[0];
    v20.i64[1] = v1 & 0xF;
    v21.i64[0] = v1 % 0xC;
    v21.i64[1] = v1 % 0xA;
    uint8x8_t v22 = (int8x16_t *)((char *)&unk_154A8 + 64 * v1);
    v22->i64[0] = v1;
    v22->i64[1] = v4;
    v22[1].i64[0] = v7;
    v22[1].i64[1] = v16;
    v22[2] = v21;
    v22[3] = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)xmmword_CD80, v20), (int8x16_t)v20, (int8x16_t)vsubq_s64((int64x2_t)xmmword_CD90, (int64x2_t)v20));
    ++v1;
    uint64_t v2 = v15 + 1;
  }
  while (v1 != 19);
}

uint64_t sub_5C58(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = objc_msgSend(a2, "objectForKeyedSubscript:");
  uint64_t v7 = v6;
  if (v6 && (signed int v8 = [v6 intValue], v8 < a4))
  {
    *a1 = v8;
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

id sub_6004(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained
    && ((uint64_t v3 = (void *)*((void *)WeakRetained + 5)) != 0 || (uint64_t v3 = (void *)*((void *)WeakRetained + 6)) != 0))
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NTKDate faceDate];
  }
  char v5 = v4;

  return v5;
}

void sub_67FC(uint64_t a1, void *a2)
{
  id v3 = [a2 artistFacesForDevice:*(void *)(a1 + 32)];
  if ([v3 count]) {
    [*(id *)(a1 + 40) addObjectsFromArray:v3];
  }
}

uint64_t sub_6860(uint64_t a1, void *a2)
{
  id v3 = [a2 face];
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    id v3 = [*(id *)(a1 + 32) addObject:v3];
    id v4 = v6;
  }

  return _objc_release_x1(v3, v4);
}

id sub_6C30()
{
  if (qword_15970 != -1) {
    dispatch_once(&qword_15970, &stru_107D0);
  }
  v0 = (void *)qword_15968;

  return v0;
}

CGPath *sub_6EAC(uint64_t a1, uint64_t a2, float64_t a3, float64_t a4)
{
  if (*(int *)(a1 + 4) < 1) {
    return 0;
  }
  Mutable = CGPathCreateMutable();
  if (*(int *)(a1 + 4) >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    v9.f64[0] = a3;
    v9.f64[1] = a4;
    float32x2_t v10 = vcvt_f32_f64(v9);
    do
    {
      unint64_t v11 = *(float32x2_t **)(a1 + 8);
      float32x2_t v12 = v11[v7 + 1];
      float32x2_t v13 = v11[v7 + 2];
      float32x2_t v14 = v11[v7 + 3];
      if (!(v7 * 8))
      {
        float32x2_t v15 = vmul_f32(*v11, v10);
        CGPathMoveToPoint(Mutable, 0, v15.f32[0], v15.f32[1]);
      }
      float32x2_t v16 = vmul_f32(v13, v10);
      float32x2_t v17 = vmul_f32(v14, v10);
      float32x2_t v18 = vmul_f32(v12, v10);
      CGPathAddCurveToPoint(Mutable, 0, v16.f32[0], v16.f32[1], v17.f32[0], v17.f32[1], v18.f32[0], v18.f32[1]);
      ++v8;
      uint64_t v19 = *(int *)(a1 + 4);
      v7 += 4;
    }
    while (v8 < v19);
    if (a2 == 1 && (int)v19 > 0) {
      CGPathCloseSubpath(Mutable);
    }
  }
  return Mutable;
}

id sub_80EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v11 = a6;
  id v12 = a5;
  float32x2_t v13 = objc_opt_new();
  float32x2_t v14 = sub_8244(a1, a2, v11);
  v18[0] = v14;
  float32x2_t v15 = sub_84E4(a3, a4, v12, v11);

  v18[1] = v15;
  float32x2_t v16 = +[NSArray arrayWithObjects:v18 count:2];
  [v13 setAnimations:v16];

  [v13 setDuration:1.0];
  [v13 setFillMode:kCAFillModeForwards];
  [v13 setRemovedOnCompletion:0];

  return v13;
}

id sub_8244(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = objc_opt_new();
  [v6 setKeyPath:@"path"];
  [v6 setFromValue:a1];
  [v6 setToValue:a2];
  [v6 setDuration:1.0];
  [v6 setTimingFunction:v5];

  [v6 setFillMode:kCAFillModeForwards];
  [v6 setRemovedOnCompletion:0];

  return v6;
}

id sub_8300(void *a1, uint64_t a2, int a3, uint64_t a4, int a5, CGColor *a6, void *a7)
{
  id v13 = a7;
  if (a3 && a5)
  {
    float32x2_t v14 = sub_8244(a2, a4, v13);
  }
  else
  {
    [a1 setPath:a2];
    float32x2_t v15 = sub_8244(a2, a4, v13);
    float32x2_t v16 = objc_opt_new();
    [v16 setKeyPath:@"strokeColor"];
    CGColorRef CopyWithAlpha = CGColorCreateCopyWithAlpha(a6, 0.0);
    float32x2_t v18 = CopyWithAlpha;
    if (a3) {
      uint64_t v19 = a6;
    }
    else {
      uint64_t v19 = CopyWithAlpha;
    }
    if (a3) {
      a6 = CopyWithAlpha;
    }
    [v16 setFromValue:v19];
    [v16 setToValue:a6];
    CGColorRelease(v18);
    [v16 setDuration:1.0];
    [v16 setTimingFunction:v13];
    [v16 setFillMode:kCAFillModeForwards];
    [v16 setRemovedOnCompletion:0];
    float32x2_t v14 = objc_opt_new();
    v22[0] = v16;
    v22[1] = v15;
    uint64x2_t v20 = +[NSArray arrayWithObjects:v22 count:2];
    [v14 setAnimations:v20];

    [v14 setDuration:1.0];
    [v14 setFillMode:kCAFillModeForwards];
    [v14 setRemovedOnCompletion:0];
  }

  return v14;
}

id sub_84E4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  float64x2_t v9 = objc_opt_new();
  [v9 setKeyPath:v8];

  [v9 setFromValue:a1];
  [v9 setToValue:a2];
  [v9 setDuration:1.0];
  [v9 setTimingFunction:v7];

  [v9 setFillMode:kCAFillModeForwards];
  [v9 setRemovedOnCompletion:0];

  return v9;
}

void sub_98E0(id a1)
{
  unint64_t v1 = +[NSNull null];
  v4[0] = @"instanceTransform";
  v4[1] = @"contentsMultiplyColor";
  v5[0] = v1;
  v5[1] = v1;
  v4[2] = @"transform";
  v4[3] = @"hidden";
  v5[2] = v1;
  v5[3] = v1;
  v4[4] = @"position";
  v4[5] = @"opacity";
  v5[4] = v1;
  v5[5] = v1;
  v4[6] = @"instanceCount";
  v4[7] = @"instanceDelay";
  v5[6] = v1;
  v5[7] = v1;
  v4[8] = @"backgroundColor";
  v4[9] = @"path";
  v5[8] = v1;
  v5[9] = v1;
  v4[10] = @"contents";
  v4[11] = @"sublayers";
  v5[10] = v1;
  v5[11] = v1;
  v4[12] = @"string";
  v4[13] = @"fillColor";
  v5[12] = v1;
  v5[13] = v1;
  v4[14] = @"strokeColor";
  v5[14] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:15];
  id v3 = (void *)qword_15968;
  qword_15968 = v2;
}

id NTKAkitaColorGetPlatform(unint64_t a1, char a2)
{
  if (qword_15978 != -1) {
    dispatch_once(&qword_15978, &stru_107F0);
  }
  id v4 = (void *)qword_15980[2 * (a1 % 0x13) + (a2 & 1)];

  return v4;
}

void sub_9ABC(id a1)
{
  uint64_t v5 = 0;
  char v6 = 1;
  double v7 = 0.00392156863;
  do
  {
    uint64_t v8 = 0;
    char v9 = v6;
    float32x2_t v10 = &byte_FE3F;
    id v11 = &qword_15980[v5];
    do
    {
      LOBYTE(v1) = *(v10 - 3);
      LOBYTE(v2) = *(v10 - 2);
      LOBYTE(v3) = *(v10 - 1);
      LOBYTE(v4) = *v10;
      uint64_t v12 = +[UIColor colorWithRed:v7 * (double)v1 green:v7 * (double)v2 blue:v7 * (double)v3 alpha:(double)v4 * 0.00392156863];
      id v13 = (void *)v11[v8];
      v11[v8] = v12;

      v10 += 4;
      v8 += 2;
    }
    while (v8 != 38);
    char v6 = 0;
    double v7 = 0.00352941176;
    uint64_t v5 = 1;
  }
  while ((v9 & 1) != 0);
}

id NTKAkitaColorGetCGColor(unint64_t a1, char a2)
{
  NTKAkitaColorGetPlatform(a1, a2);
  id v2 = objc_claimAutoreleasedReturnValue();
  id v3 = [v2 CGColor];

  return v3;
}

double NTKAkitaColorGetSRGBf(uint64_t a1, uint64_t a2, uint8x8_t a3)
{
  a3.i32[0] = *((_DWORD *)&unk_FE3C + a1);
  id v3 = (const float *)&unk_FE38;
  int32x4_t v4 = (int32x4_t)vld1q_dup_f32(v3);
  v4.i32[0] = dword_FE30[a2 == 1];
  float32x4_t v5 = (float32x4_t)vzip1q_s32(v4, v4);
  v5.i32[2] = dword_FE30[a2 == 1];
  *(void *)&double result = vmulq_f32(v5, vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(a3)))).u64[0];
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DMakeTranslation(retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DScale(retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return _CATransform3DTranslate(retstr, t, tx, ty, tz);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return _CGColorCreateCopyWithAlpha(color, alpha);
}

void CGColorRelease(CGColorRef color)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

uint64_t CLKUIConvertToRGBfFromSRGBf_fast()
{
  return _CLKUIConvertToRGBfFromSRGBf_fast();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend__faceDescriptionKey(void *a1, const char *a2, ...)
{
  return [a1 _faceDescriptionKey];
}

id objc_msgSend__loadMorphConfig(void *a1, const char *a2, ...)
{
  return [a1 _loadMorphConfig];
}

id objc_msgSend__pauseContentViewIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _pauseContentViewIfNecessary];
}

id objc_msgSend__startTimer(void *a1, const char *a2, ...)
{
  return [a1 _startTimer];
}

id objc_msgSend__stopTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopTimer];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_analyticsIdentifier(void *a1, const char *a2, ...)
{
  return [a1 analyticsIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoupdatingCurrentCalendar(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentCalendar];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataMode(void *a1, const char *a2, ...)
{
  return [a1 dataMode];
}

id objc_msgSend_dateProvider(void *a1, const char *a2, ...)
{
  return [a1 dateProvider];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return [a1 descender];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceDate(void *a1, const char *a2, ...)
{
  return [a1 faceDate];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return [a1 isFrozen];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return [a1 pointSize];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_screenScale(void *a1, const char *a2, ...)
{
  return [a1 screenScale];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return [a1 updateDate];
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithBytes:objCType:");
}