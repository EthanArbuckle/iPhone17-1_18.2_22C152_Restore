@interface BuddyCursiveTextPath
- (BuddyCursiveTextPath)initWithURL:(id)a3;
- (BuddyCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4;
- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5;
- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4;
- (CGPath)pathForTime:(double)a3;
- (double)duration;
- (id).cxx_construct;
@end

@implementation BuddyCursiveTextPath

- (BuddyCursiveTextPath)initWithURL:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  id v7 = [v3 initWithURL:location[0] resolution:40];
  v4 = (BuddyCursiveTextPath *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (BuddyCursiveTextPath)initWithURL:(id)a3 resolution:(int64_t)a4
{
  id v62 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v60 = a4;
  id v5 = v62;
  id v62 = 0;
  v59.receiver = v5;
  v59.super_class = (Class)BuddyCursiveTextPath;
  id v62 = [(BuddyCursiveTextPath *)&v59 init];
  objc_storeStrong(&v62, v62);
  if (!v62) {
    goto LABEL_27;
  }
  *((void *)v62 + 1) = 0x3FE4CCCCC0000000;
  *((void *)v62 + 2) = 0x3FF0000000000000;
  *((void *)v62 + 3) = 0x3FD0000000000000;
  id v58 = +[NSData dataWithContentsOfURL:location[0]];
  if (v58)
  {
    id v56 = 0;
    obunint64_t j = 0;
    id v6 = +[NSPropertyListSerialization propertyListWithData:v58 options:0 format:0 error:&obj];
    objc_storeStrong(&v56, obj);
    id v55 = v6;
    if (v6)
    {
      id v7 = [v55 objectForKeyedSubscript:@"unitsPerEm"];
      [v7 floatValue];
      *((double *)v62 + 10) = v8;

      id v9 = [v55 objectForKeyedSubscript:@"ascender"];
      [v9 floatValue];
      *((double *)v62 + 11) = v10;

      id v11 = [v55 objectForKeyedSubscript:@"descender"];
      [v11 floatValue];
      *((double *)v62 + 12) = v12;

      float32x4_t v53 = 0uLL;
      id v13 = [v55 objectForKeyedSubscript:@"scale"];
      id v65 = 0;
      objc_storeStrong(&v65, v13);
      if (v65 && [v65 count] == (id)4)
      {
        id v14 = [v65 objectAtIndexedSubscript:0];
        [v14 floatValue];
        unsigned int v16 = v15;
        id v17 = [v65 objectAtIndexedSubscript:1];
        [v17 floatValue];
        unsigned int v19 = v18;
        id v20 = [v65 objectAtIndexedSubscript:2];
        [v20 floatValue];
        unsigned int v22 = v21;
        id v23 = [v65 objectAtIndexedSubscript:3];
        [v23 floatValue];
        unsigned int v82 = v16;
        unsigned int v81 = v19;
        unsigned int v80 = v22;
        unsigned int v79 = v24;
        v78.i64[0] = __PAIR64__(v19, v16);
        v78.i64[1] = __PAIR64__(v24, v22);
        float32x4_t v66 = v78;

        int v64 = 1;
      }
      else
      {
        int v77 = 0;
        int v76 = 0;
        int v75 = 0;
        int v74 = 0;
        int v70 = 0;
        int v71 = 0;
        int v72 = 0;
        int v73 = 0;
        float32x4_t v66 = 0u;
        int v64 = 1;
      }
      objc_storeStrong(&v65, 0);
      float32x4_t v37 = v66;

      float32x4_t v53 = v37;
      id v52 = [v55 objectForKeyedSubscript:@"strokes"];
      sub_1001A31B0((uint64_t *)v62 + 13, (unint64_t)[v52 count]);
      long long v50 = 0u;
      long long v49 = 0u;
      long long v48 = 0u;
      long long v47 = 0u;
      id v25 = v52;
      id v26 = [v25 countByEnumeratingWithState:&v47 objects:v92 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v48;
        do
        {
          for (unint64_t i = 0; i < (unint64_t)v26; ++i)
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(v25);
            }
            id v51 = *(id *)(*((void *)&v47 + 1) + 8 * i);
            sub_1001A327C(v46);
            sub_1001A32B4(v46, (unint64_t)[v51 count]);
            long long v44 = 0u;
            long long v43 = 0u;
            long long v42 = 0u;
            long long v41 = 0u;
            id v29 = v51;
            id v30 = [v29 countByEnumeratingWithState:&v41 objects:v91 count:16];
            if (v30)
            {
              uint64_t v31 = *(void *)v42;
              do
              {
                for (unint64_t j = 0; j < (unint64_t)v30; ++j)
                {
                  if (*(void *)v42 != v31) {
                    objc_enumerationMutation(v29);
                  }
                  v45 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                  sub_1001A3380(v46, &v45, &v53);
                }
                id v30 = [v29 countByEnumeratingWithState:&v41 objects:v91 count:16];
              }
              while (v30);
            }

            sub_1001A3410((uint64_t *)v62 + 13, v46);
            sub_1001A3494(v46);
          }
          id v26 = [v25 countByEnumeratingWithState:&v47 objects:v92 count:16];
        }
        while (v26);
      }

      *((void *)v62 + 16) = v60;
      path = (const CGPath *)[v62 pathForFraction:1 calculateLength:0.0];
      CGRect PathBoundingBox = CGPathGetPathBoundingBox(path);
      *(CGFloat *)&long long v38 = PathBoundingBox.origin.x;
      *((void *)&v38 + 1) = *(void *)&PathBoundingBox.origin.y;
      *(CGFloat *)&long long v39 = PathBoundingBox.size.width;
      *((void *)&v39 + 1) = *(void *)&PathBoundingBox.size.height;
      v33 = v62;
      *((_OWORD *)v62 + 4) = v39;
      v33[3] = v38;
      CGPathRelease(path);
      *((double *)v62 + 5) = *((double *)v62 + 4) / 300.0;
      float v34 = *((double *)v62 + 5);
      float v69 = v34;
      int v68 = 0;
      int v67 = 1092616192;
      float v86 = v34;
      int v85 = 0;
      float v90 = v34;
      int v89 = 0;
      float v84 = fmaxf(v34, 0.0);
      int v83 = 1092616192;
      float v88 = v84;
      int v87 = 1092616192;
      float v35 = sub_1001A34E0((float)(fminf(v84, 10.0) / 10.0) - 1.0);
      *((double *)v62 + 5) = (float)((float)(v35 + 1.0) * 5.0);
      objc_storeStrong(&v52, 0);
      int v57 = 0;
    }
    else
    {
      v63 = 0;
      int v57 = 1;
    }
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v56, 0);
  }
  else
  {
    v63 = 0;
    int v57 = 1;
  }
  objc_storeStrong(&v58, 0);
  if (!v57)
  {
LABEL_27:
    v63 = (BuddyCursiveTextPath *)v62;
    int v57 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v62, 0);
  return v63;
}

- (CGAffineTransform)transformForRect:(SEL)a3 pointSize:(CGRect)a4 flipped:(double)a5
{
  *(CGFloat *)&long long v52 = a4.origin.x;
  *((void *)&v52 + 1) = *(void *)&a4.origin.y;
  *(CGFloat *)&long long v53 = a4.size.width;
  *((void *)&v53 + 1) = *(void *)&a4.size.height;
  id v51 = self;
  SEL v50 = a3;
  double v49 = a5;
  BOOL v48 = a6;
  double v47 = 0.0;
  double v47 = v51->_ascender - v51->_descender;
  double v46 = 0.0;
  double v46 = -self->_descender / v47;
  double v45 = 0.0;
  double v45 = v47 / self->_unitsPerM * a5;
  long long v43 = v53;
  long long v42 = v52;
  double v44 = (CGRectGetHeight(a4) - v45) * 0.5;
  double v41 = 0.0;
  if (v48) {
    double v7 = 1.0 - v46;
  }
  else {
    double v7 = v46;
  }
  double v41 = v44 + v7 * v45;
  CGPoint origin = v51->_boundingBoxOfPath.origin;
  v40.size = v51->_boundingBoxOfPath.size;
  v40.CGPoint origin = origin;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGRect v39 = v40;
  CGFloat height = v40.size.height;
  CGFloat width = v40.size.width;
  CGFloat y = v40.origin.y;
  origin.x = v40.origin.x;
  CGFloat v12 = -CGRectGetMinX(*(CGRect *)&origin.x);
  CGRect rect = v40;
  CGFloat v13 = CGRectGetWidth(v40);
  CGAffineTransformMakeTranslation(retstr, v12 + -v13 * 0.5, 0.0);
  CGFloat sx = 0.0;
  CGFloat sx = v49 / v51->_unitsPerM;
  double v36 = v40.size.width * sx;
  if (v40.size.width * sx > *(double *)&v53 && v36 > 0.0 && *(double *)&v53 > 0.0)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v34 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      id v14 = oslog;
      os_log_type_t v15 = v34;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v14, v15, "Scaling cursive text transform to fit within available width", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    CGFloat sx = sx * (*(double *)&v53 / v36);
  }
  long long v16 = *(_OWORD *)&retstr->a;
  long long v17 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  *(_OWORD *)&t1.c = v17;
  *(_OWORD *)&t1.a = v16;
  double v18 = 1.0;
  if (v48) {
    double v18 = -1.0;
  }
  CGAffineTransformMakeScale(&t2, sx, sx * v18);
  CGAffineTransformConcat(&v32, &t1, &t2);
  long long v19 = *(_OWORD *)&v32.a;
  long long v20 = *(_OWORD *)&v32.c;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v32.tx;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->a = v19;
  long long v21 = *(_OWORD *)&retstr->a;
  long long v22 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v28.tx = *(_OWORD *)&retstr->tx;
  *(_OWORD *)&v28.c = v22;
  *(_OWORD *)&v28.a = v21;
  *(void *)&long long v21 = v52;
  uint64_t v23 = *((void *)&v53 + 1);
  uint64_t v24 = v53;
  *(void *)&long long v22 = *((void *)&v52 + 1);
  CGFloat v25 = CGRectGetWidth(*(CGRect *)&v21);
  CGAffineTransformMakeTranslation(&v27, v25 * 0.5, v41);
  CGAffineTransformConcat(&__src, &v28, &v27);
  return (CGAffineTransform *)memcpy(retstr, &__src, sizeof(CGAffineTransform));
}

- (double)duration
{
  return self->_duration;
}

- (CGPath)pathForTime:(double)a3
{
  return [(BuddyCursiveTextPath *)self pathForFraction:0 calculateLength:a3 / self->_duration];
}

- (CGPath)pathForFraction:(double)a3 calculateLength:(BOOL)a4
{
  float v69 = self;
  SEL v68 = a2;
  double v67 = a3;
  BOOL v66 = a4;
  double v65 = 0.0;
  double v65 = self->_rampTime / self->_duration;
  double v64 = -(v65 - (v65 + 1.0) * a3);
  sub_1001A4348(v63);
  double v62 = 0.0;
  int v77 = 0;
  int v76 = 0;
  int v75 = 0;
  v74.i64[0] = 0;
  v74.i32[2] = 0;
  float32x4_t v61 = v74;
  char v60 = 0;
  char v59 = 0;
  p_bezierArrays = &v69->_bezierArrays;
  uint64_t v57 = sub_1001A4380((uint64_t *)&v69->_bezierArrays);
  uint64_t v56 = sub_1001A43B4((uint64_t)p_bezierArrays);
  while (sub_1001A43E8((uint64_t)&v57, (uint64_t)&v56))
  {
    id v55 = (uint64_t *)sub_1001A4420((uint64_t)&v57);
    sub_1001A4438(v54);
    long long v53 = v55;
    uint64_t v52 = sub_1001A4470(v55);
    uint64_t v51 = sub_1001A44A4((uint64_t)v53);
    while (sub_1001A44D8((uint64_t)&v52, (uint64_t)&v51))
    {
      SEL v50 = (float32x4_t *)sub_1001A4510((uint64_t)&v52);
      uint64_t v49 = 0;
      float32x4_t v4 = v50[3];
      float32x4_t v79 = *v50;
      float32x4_t v78 = v4;
      uint32x4_t v107 = (uint32x4_t)vceqq_f32(v79, v4);
      uint32x4_t v109 = v107;
      unsigned int v108 = vminvq_u32(v107);
      if ((v108 & 0x80000000) != 0) {
        int64_t resolution = 0;
      }
      else {
        int64_t resolution = v69->_resolution;
      }
      uint64_t v49 = resolution;
      for (uint64_t i = 0; i <= v49; ++i)
      {
        double v47 = 0.0;
        double v47 = 1.0 / (double)v69->_resolution * (double)i;
        float32x4_t v46 = 0uLL;
        float v6 = v47;
        *(double *)v7.i64 = sub_1001A4528(v50, v6);
        float32x4_t v46 = v7;
        float32x4_t v45 = v7;
        long long v44 = 0uLL;
        v7.f32[0] = v47;
        *(double *)&long long v8 = sub_1001A4600(v50, v7.f32[0]);
        long long v44 = v8;
        int v89 = DWORD1(v8);
        float v88 = -*(float *)&v8;
        v87.i32[0] = DWORD1(v8);
        v87.f32[1] = -*(float *)&v8;
        float32x2_t v80 = v87;
        float32x2_t v110 = v87;
        float32x2_t v113 = v87;
        float32x2_t v129 = v87;
        float32x2_t v128 = v87;
        float32x2_t v130 = vmul_f32(v87, v87);
        float v112 = vaddv_f32(v130);
        float v117 = v112;
        uint64_t v116 = LODWORD(v112);
        uint64_t v115 = LODWORD(v112);
        uint64_t v119 = LODWORD(v112);
        uint64_t v127 = LODWORD(v112);
        float32x2_t v126 = vrsqrte_f32((float32x2_t)LODWORD(v112));
        float32x2_t v118 = v126;
        uint64_t v122 = LODWORD(v112);
        float32x2_t v121 = vmul_f32(v126, v126);
        float32x2_t v120 = vrsqrts_f32((float32x2_t)LODWORD(v112), v121);
        float32x2_t v114 = vmul_f32(v126, v120);
        uint64_t v125 = LODWORD(v112);
        float32x2_t v124 = vmul_f32(v114, v114);
        float32x2_t v123 = vrsqrts_f32((float32x2_t)LODWORD(v112), v124);
        float32x2_t v111 = vmul_f32(v114, v123);
        float32x2_t v43 = vmul_n_f32(v87, v111.f32[0]);
        if (sub_1001A4724() & 1) != 0 || (sub_1001A4724())
        {
          int v86 = 0;
          int v85 = 1065353216;
          uint64_t v84 = 0x3F80000000000000;
          float32x2_t v43 = (float32x2_t)0x3F80000000000000;
        }
        if (v60)
        {
          float32x4_t v42 = v45;
          float32x4_t v41 = v61;
          float32x4_t v95 = v45;
          float32x4_t v94 = v61;
          float32x4_t v93 = v45;
          float32x4_t v92 = v61;
          float32x4_t v91 = v45;
          float32x4_t v90 = v61;
          float32x4_t v135 = v45;
          float32x4_t v134 = v61;
          float32x4_t v133 = v45;
          float32x4_t v132 = v61;
          float32x4_t v131 = vsubq_f32(v45, v61);
          float32x4_t v138 = v131;
          float32x4_t v137 = v131;
          float32x4_t v136 = v131;
          float32x4_t v142 = v131;
          float32x4_t v141 = v131;
          float32x4_t v140 = v131;
          float32x4_t v139 = v131;
          float32x4_t v147 = v131;
          float32x4_t v146 = v131;
          float32x4_t v145 = v131;
          float32x4_t v144 = v131;
          float32x4_t v143 = vmulq_f32(v131, v131);
          float32x4_t v149 = v143;
          float32x4_t v148 = v143;
          double v9 = sqrtf(vaddv_f32(*(float32x2_t *)v143.f32) + v143.f32[2]);
          double v10 = 0.5;
          if ((v59 & 1) == 0) {
            double v10 = 1.0;
          }
          double v62 = v62 + v9 * v10;
          char v59 = 0;
        }
        float32x4_t v61 = v45;
        char v60 = 1;
        double v40 = 0.0;
        double v40 = v62 / v69->_length;
        float v11 = v40;
        float v12 = v64;
        float v13 = v11 - v12;
        float v14 = v65;
        float v73 = v13 / v14;
        int v72 = 0;
        int v71 = 1065353216;
        float v102 = v13 / v14;
        int v101 = 0;
        float v106 = v13 / v14;
        int v105 = 0;
        float v100 = fmaxf(v13 / v14, 0.0);
        int v99 = 1065353216;
        float v104 = v100;
        int v103 = 1065353216;
        float v39 = 1.0 - fminf(v100, 1.0);
        double v38 = 0.0;
        float initialWeight = v69->_initialWeight;
        float finalWeight = v69->_finalWeight;
        float v17 = powf(v39 - 1.0, 3.0);
        float v98 = initialWeight;
        float v97 = finalWeight;
        float v96 = v17 + 1.0;
        double v38 = (float)((float)(initialWeight + (float)((float)(v17 + 1.0) * (float)(finalWeight - initialWeight)))
                    * v46.f32[3]);
        if (!v66 && v40 > v64 + v65)
        {
          sub_1001A4744(v63, v54);
          int v36 = 9;
          goto LABEL_23;
        }
        __int32 v82 = v45.i32[1];
        __int32 v83 = v45.i32[0];
        uint64_t v81 = v45.i64[0];
        uint64_t v37 = v45.i64[0];
        sub_1001A47C8(v54, (double *)&v37, (double *)&v43, &v38, &v62);
      }
      char v59 = 1;
      sub_1001A4870(&v52);
    }
    sub_1001A4744(v63, v54);
    int v36 = 0;
LABEL_23:
    sub_1001A4890(v54);
    if (v36) {
      break;
    }
    sub_1001A48C8(&v57);
  }
  if (v66) {
    v69->_length = v62;
  }
  CGMutablePathRef path = CGPathCreateMutable();
  v34[1] = v63;
  v34[0] = sub_1001A48E8(v63);
  uint64_t v33 = sub_1001A491C((uint64_t)v63);
  while (sub_1001A4950((uint64_t)v34, (uint64_t)&v33))
  {
    CGAffineTransform v32 = (void *)sub_1001A4988((uint64_t)v34);
    if (!sub_1001A49A0(v32))
    {
      uint64_t v31 = (float32x2_t *)sub_1001A49C8((uint64_t)v32);
      uint64_t v30 = sub_1001A49E0((uint64_t)v32);
      float32x2_t v29 = vmla_n_f32(*v31, v31[1], v31[2].f32[0]);
      CGPathMoveToPoint(path, 0, v29.f32[0], v29.f32[1]);
      unint64_t v28 = 1;
      unint64_t v27 = sub_1001A49FC(v32) - 1;
      while (v28 < v27)
      {
        id v26 = (float32x2_t *)sub_1001A4A24(v32, v28);
        float32x2_t v25 = vmla_n_f32(*v26, v26[1], v26[2].f32[0]);
        CGPathAddLineToPoint(path, 0, v25.f32[0], v25.f32[1]);
        ++v28;
      }
      float v18 = sub_1001A4A4C(COERCE_FLOAT(HIDWORD(*(void *)(v30 + 8))), COERCE_FLOAT(*(void *)(v30 + 8)));
      CGPathAddArc(path, 0, COERCE_FLOAT(*(void *)v30), COERCE_FLOAT(HIDWORD(*(void *)v30)), *(float *)(v30 + 16), v18, v18 + 3.14159265, 0);
      for (uint64_t j = sub_1001A49FC(v32) - 2; j >= 1; --j)
      {
        uint64_t v23 = (float32x2_t *)sub_1001A4A24(v32, j);
        v19.i32[0] = v23[2].i32[0];
        float32x2_t v22 = vmls_lane_f32(*v23, v23[1], v19, 0);
        CGPathAddLineToPoint(path, 0, v22.f32[0], v22.f32[1]);
      }
      float v20 = sub_1001A4A4C(-COERCE_FLOAT(HIDWORD(*(void *)&v31[1])), -COERCE_FLOAT(*(void *)&v31[1]));
      CGPathAddArc(path, 0, COERCE_FLOAT(*v31), COERCE_FLOAT(HIDWORD(*(unint64_t *)v31)), v31[2].f32[0], v20, v20 + 3.14159265, 0);
    }
    sub_1001A4A7C(v34);
  }
  int v70 = path;
  int v36 = 1;
  sub_1001A4A9C(v63);
  return v70;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end