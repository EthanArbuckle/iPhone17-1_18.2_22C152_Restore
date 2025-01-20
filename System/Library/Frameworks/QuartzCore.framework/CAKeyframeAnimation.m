@interface CAKeyframeAnimation
- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4;
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (CAAnimationCalculationMode)calculationMode;
- (CAAnimationRotationMode)rotationMode;
- (CGPathRef)path;
- (NSArray)biasValues;
- (NSArray)continuityValues;
- (NSArray)keyTimes;
- (NSArray)tensionValues;
- (NSArray)timingFunctions;
- (NSArray)values;
- (void)CA_prepareRenderValue;
- (void)_copyRenderAnimationForLayer:(id)a3;
- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5;
- (void)setBiasValues:(NSArray *)biasValues;
- (void)setCalculationMode:(CAAnimationCalculationMode)calculationMode;
- (void)setContinuityValues:(NSArray *)continuityValues;
- (void)setKeyTimes:(NSArray *)keyTimes;
- (void)setPath:(CGPathRef)path;
- (void)setRotationMode:(CAAnimationRotationMode)rotationMode;
- (void)setTensionValues:(NSArray *)tensionValues;
- (void)setTimingFunctions:(NSArray *)timingFunctions;
- (void)setValues:(NSArray *)values;
@end

@implementation CAKeyframeAnimation

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xB0uLL, 0x743898A5uLL);
  v7 = (atomic_uint *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((void *)v6 + 9) = 0;
    *((void *)v6 + 2) = 0;
    *((void *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((void *)v6 + 12) = 0;
    *((void *)v6 + 13) = 0;
    *((_DWORD *)v6 + 3) = 27;
    ++dword_1EB2ADE34;
    *(void *)v6 = &unk_1ED02E758;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    v6[144] = 1;
    *((void *)v6 + 20) = 0;
    *((void *)v6 + 21) = 0;
    *((void *)v6 + 19) = 0;
    if (![(CAKeyframeAnimation *)self _setCARenderAnimation:v6 layer:a3])
    {
      if (atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      return 0;
    }
  }
  else
  {
    [(CAKeyframeAnimation *)self _setCARenderAnimation:0 layer:a3];
  }
  return v7;
}

- (void)CA_prepareRenderValue
{
  v2 = [(CAKeyframeAnimation *)self values];
  if (v2)
  {
    v3 = v2;
    uint64_t v4 = [(NSArray *)v2 count];
    if (v4)
    {
      uint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "CA_prepareRenderValue");
    }
  }
}

- (void)setValues:(NSArray *)values
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = values;
  CAAnimation_setter((uint64_t)self, (const void *)0x24B, 3, (unsigned __int8 *)v3);
}

- (void)setCalculationMode:(CAAnimationCalculationMode)calculationMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = calculationMode;
  CAAnimation_setter((uint64_t)self, (const void *)0x50, 3, (unsigned __int8 *)v3);
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_12;
  }
  int v7 = CAInternAtom((const __CFString *)a4, 0);
  if (v7 <= 339)
  {
    if (v7 != 59 && v7 != 141) {
      goto LABEL_12;
    }
  }
  else if (v7 != 340 && v7 != 560 && v7 != 556)
  {
LABEL_12:
    v9.receiver = self;
    v9.super_class = (Class)CAKeyframeAnimation;
    return [&v9 CA_validateValue:a3 forKey:a4];
  }
  objc_opt_class();

  return CAObject_validateArrayOfClass(a3);
}

- (void)setKeyTimes:(NSArray *)keyTimes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = keyTimes;
  CAAnimation_setter((uint64_t)self, (const void *)0x154, 3, (unsigned __int8 *)v3);
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  uint64_t v5 = (objc_object *)a4;
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  double v111 = a3;
  if (![(CAAnimation *)self isEnabled]) {
    return;
  }
  int v7 = [(CAPropertyAnimation *)self keyPath];
  if (!v7) {
    return;
  }
  v8 = v7;
  unsigned int v110 = 0;
  if (!mapAnimationTime(&self->super.super, &v111, (int *)&v110)) {
    return;
  }
  objc_super v9 = [(CAKeyframeAnimation *)self path];
  if (v9) {
    v11 = CA::Render::Path::new_path(v9, v10);
  }
  else {
    v11 = 0;
  }
  long long v112 = 0u;
  long long v113 = 0u;
  int v12 = calcModeFromString((const __CFString *)[(CAKeyframeAnimation *)self calculationMode]);
  v13 = [(CAKeyframeAnimation *)self keyTimes];
  if (v13)
  {
    v14 = v13;
    int v15 = [(NSArray *)v13 count];
    uint64_t v16 = (v15 - 2);
    if (v15 >= 2)
    {
      v17 = v11;
      uint64_t v18 = 0;
      double v19 = v111;
      while (v16 != v18)
      {
        int v20 = v18++;
        objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", v18), "doubleValue");
        if (v21 > v19)
        {
          uint64_t v16 = v20;
          goto LABEL_19;
        }
      }
      int v20 = v15 - 2;
LABEL_19:
      objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", v16), "doubleValue");
      double v25 = v24;
      *((double *)&v112 + 1) = v24;
      objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", (v20 + 1)), "doubleValue");
      double v27 = v26;
      *(double *)&long long v113 = v26;
      v11 = v17;
      if (v20) {
        objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:", (v20 - 1)), "doubleValue");
      }
      else {
        double v28 = -(v26 + v25 * -2.0);
      }
      *(double *)&long long v112 = v28;
      if (v20 + 2 >= v15) {
        double v36 = -(v25 + v27 * -2.0);
      }
      else {
        objc_msgSend(-[NSArray objectAtIndex:](v14, "objectAtIndex:"), "doubleValue");
      }
      *((double *)&v113 + 1) = v36;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  if (v11)
  {
    LODWORD(v22) = v11[1].i32[0];
    if (v12 == 4 || v12 == 2)
    {
      v23 = CA::Render::Path::keyframe_lengths((CA::Render::Path *)v11);
      if (v23)
      {
        int v20 = paced_keyframe(v23, v22, v111, (double *)&v112);
        goto LABEL_41;
      }
    }
LABEL_26:
    if ((int)v22 > 0)
    {
LABEL_27:
      double v32 = 1.0;
      double v33 = 1.0 / (double)(int)v22;
      if (v111 <= 1.0) {
        double v32 = v111;
      }
      if (v32 < 0.0) {
        double v32 = 0.0;
      }
      double v111 = v32;
      double v34 = v32 * (double)(int)v22;
      double v35 = floor(v34);
      int v20 = vcvtmd_s64_f64(v34);
      *(double *)&long long v112 = v33 * v35 - v33;
      *((double *)&v112 + 1) = v33 * v35;
      *(double *)&long long v113 = v33 * v35 + v33;
      *((double *)&v113 + 1) = *(double *)&v113 + v33;
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  v29 = [(CAKeyframeAnimation *)self values];
  if (!v29) {
    goto LABEL_40;
  }
  v30 = v29;
  uint64_t v31 = [(NSArray *)v29 count];
  uint64_t v22 = (v31 - 1);
  if (v12 != 4 && v12 != 2)
  {
    if (!v12) {
      LODWORD(v22) = v31;
    }
    goto LABEL_26;
  }
  if ((int)v22 >= 1)
  {
    if (v22 > 0x200)
    {
      v38 = (char *)malloc_type_malloc(8 * (v31 - 1), 0x100004000313F17uLL);
      if (!v38) {
        goto LABEL_27;
      }
    }
    else
    {
      MEMORY[0x1F4188790](v31);
      v38 = (char *)&v95 - ((v37 + 15) & 0xFFFFFFFF0);
      bzero(v38, v37);
    }
    v96 = v5;
    id v84 = -[NSArray objectAtIndex:](v30, "objectAtIndex:", 0, 0);
    for (uint64_t i = 0; i != v22; ++i)
    {
      uint64_t v86 = [(NSArray *)v30 objectAtIndex:i + 1];
      objc_msgSend(v84, "CA_distanceToValue:", v86);
      *(void *)&v38[8 * i] = v87;
      id v84 = (id)v86;
    }
    int v20 = paced_keyframe((double *)v38, v22, v111, (double *)&v112);
    v11 = (int8x16_t *)v95;
    if (v22 >= 0x201) {
      free(v38);
    }
    uint64_t v5 = v96;
    goto LABEL_41;
  }
LABEL_40:
  int v20 = 0;
  long long v112 = 0uLL;
  __asm { FMOV            V0.2D, #1.0 }
  long long v113 = _Q0;
LABEL_41:
  int v44 = 0;
  v45 = 0;
  int v46 = 1;
  switch(calcModeFromString((const __CFString *)[(CAKeyframeAnimation *)self calculationMode]))
  {
    case 0u:
      int v44 = 0;
      int v46 = 0;
      double v111 = 0.0;
      double v47 = 0.0;
      goto LABEL_55;
    case 2u:
      goto LABEL_46;
    case 3u:
      int v44 = 1;
      goto LABEL_44;
    case 4u:
      v45 = 0;
      int v44 = 1;
      goto LABEL_46;
    default:
LABEL_44:
      v45 = [(CAKeyframeAnimation *)self timingFunctions];
      int v46 = 0;
LABEL_46:
      double v48 = (v111 - *((double *)&v112 + 1)) / (*(double *)&v113 - *((double *)&v112 + 1));
      if (v48 > 1.0) {
        double v48 = 1.0;
      }
      if (v48 >= 0.0) {
        double v47 = v48;
      }
      else {
        double v47 = 0.0;
      }
      double v111 = v47;
      if (v45)
      {
        int v49 = [(NSArray *)v45 count];
        if ((v20 & 0x80000000) == 0 && v20 < v49)
        {
          id v50 = [(NSArray *)v45 objectAtIndex:v20];
          *(float *)&double v51 = v47;
          [v50 _solveForInput:v51];
          double v47 = v52;
          double v111 = v52;
        }
      }
LABEL_55:
      if (v11)
      {
        float64x2_t v109 = 0uLL;
        int8x16_t v108 = 0uLL;
        int8x16_t v107 = 0uLL;
        double v106 = 0.0;
        v53 = [(CAKeyframeAnimation *)self rotationMode];
        v54 = v53;
        if (v53)
        {
          if ([(NSString *)v53 isEqualToString:@"auto"])
          {
            LODWORD(v54) = 0x10000;
          }
          else if ([(NSString *)v54 isEqualToString:@"autoReverse"])
          {
            LODWORD(v54) = 0x20000;
          }
          else
          {
            LODWORD(v54) = 0;
          }
        }
        if (v54) {
          v65 = &v106;
        }
        else {
          v65 = 0;
        }
        float v64 = v47;
        if (CA::Render::Path::interpolate((CA::Render::Path *)v11, v20, v46, &v109, (float64x2_t *)&v108, (float64x2_t *)&v107, v65, 0, v64, 0.0))
        {
          if ([(CAPropertyAnimation *)self isCumulative] && v110)
          {
            int32x2_t v66 = vdup_n_s32([(CAAnimation *)self autoreverses]);
            v67.i64[0] = v66.u32[0];
            v67.i64[1] = v66.u32[1];
            float64x2_t v109 = vmlaq_n_f64(v109, (float64x2_t)vbslq_s8((int8x16_t)vcltzq_s64(vshlq_n_s64(v67, 0x3FuLL)), v108, v107), (double)(int)v110);
          }
          v68 = [(CAPropertyAnimation *)self valueFunction];
          if (v68)
          {
            v69 = v68;
            unint64_t v70 = [(CAValueFunction *)v68 inputCount];
            unint64_t v71 = [(CAValueFunction *)v69 outputCount];
            if (v70 <= 2 && v71 <= 2)
            {
              *(void *)&v114.f64[0] = self;
              *(void *)&v114.f64[1] = v5;
              [(CAValueFunction *)v69 apply:&v109 result:&v109 parameterFunction:functionParam context:&v114];
            }
          }
          if ([(CAPropertyAnimation *)self isAdditive])
          {
            v72 = (void *)[(objc_object *)v5 valueForKeyPath:v8];
            v73 = (const char *)[v72 objCType];
            if (v73 && !strcmp(v73, "{CGPoint=dd}"))
            {
              [v72 pointValue];
            }
            else
            {
              double v74 = *MEMORY[0x1E4F28AD0];
              double v75 = *(double *)(MEMORY[0x1E4F28AD0] + 8);
            }
            double v76 = v109.f64[0] + v74;
            double v77 = v109.f64[1] + v75;
            v109.f64[0] = v76;
            v109.f64[1] = v77;
          }
          else
          {
            double v77 = v109.f64[1];
            double v76 = v109.f64[0];
          }
          -[objc_object setValue:forKeyPath:](v5, "setValue:forKeyPath:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", v76, v77), v8);
          if (v54)
          {
            if (v54 >= 0x20000) {
              double v106 = v106 + 3.14159265;
            }
            if (v5)
            {
              [(objc_object *)v5 transform];
            }
            else
            {
              long long v120 = 0u;
              long long v121 = 0u;
              long long v118 = 0u;
              long long v119 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              float64x2_t v114 = 0u;
              long long v115 = 0u;
            }
            long long v102 = v118;
            long long v103 = v119;
            long long v104 = v120;
            long long v105 = v121;
            float64x2_t v98 = v114;
            long long v99 = v115;
            long long v100 = v116;
            long long v101 = v117;
            long long v115 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v119 = xmmword_184997D50;
            long long v120 = 0u;
            long long v121 = xmmword_184997D60;
            __double2 v81 = __sincos_stret(v106);
            *(double *)v80.i64 = v81.__cosval;
            *(double *)v79.i64 = v81.__sinval;
            if (fabs(v81.__sinval) >= 0.0000001)
            {
              if (fabs(v81.__cosval) < 0.0000001)
              {
                v80.i64[0] = 1.0;
                v83.f64[0] = NAN;
                v83.f64[1] = NAN;
                v79.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v83), v80, v79).u64[0];
                v80.i64[0] = 0;
              }
            }
            else
            {
              v79.i64[0] = 1.0;
              v82.f64[0] = NAN;
              v82.f64[1] = NAN;
              v80.i64[0] = vbslq_s8((int8x16_t)vnegq_f64(v82), v79, v80).u64[0];
              v79.i64[0] = 0;
            }
            *(void *)&v114.f64[0] = v80.i64[0];
            *(void *)&v114.f64[1] = v79.i64[0];
            *(double *)&long long v116 = -*(double *)v79.i64;
            *((void *)&v116 + 1) = v80.i64[0];
            CA::Mat4Impl::mat4_concat(&v98, v114.f64, v98.f64, v78);
            v97[4] = v102;
            v97[5] = v103;
            v97[6] = v104;
            v97[7] = v105;
            v97[0] = v98;
            v97[1] = v99;
            v97[2] = v100;
            v97[3] = v101;
            [(objc_object *)v5 setTransform:v97];
          }
        }
        if (atomic_fetch_add(&v11->i32[2], 0xFFFFFFFF) == 1) {
          (*(void (**)(int8x16_t *))(v11->i64[0] + 16))(v11);
        }
        return;
      }
      v55 = [(CAKeyframeAnimation *)self values];
      if (!v55) {
        return;
      }
      v56 = v55;
      *(void *)&long long v121 = 0;
      long long v119 = 0u;
      long long v120 = 0u;
      long long v117 = 0u;
      long long v118 = 0u;
      long long v115 = 0u;
      long long v116 = 0u;
      float64x2_t v114 = (float64x2_t)*(unint64_t *)&v47;
      if (v44) {
        setupHermiteInterpolator(self, (CA::Render::ValueInterpolator *)&v114, v20, (const double *)&v112);
      }
      int v57 = [(NSArray *)v56 count];
      int v58 = v57;
      if (v57 < 2) {
        return;
      }
      uint64_t v59 = (v57 - 1);
      int v60 = v20 >= (int)v59 ? v57 - 1 : v20;
      v61 = [(NSArray *)v56 objectAtIndex:v60];
      int v62 = v20 + 1 < (int)v59 ? v20 + 1 : v59;
      uint64_t v63 = [(NSArray *)v56 objectAtIndex:v62];
      if (!v61 || !v63) {
        return;
      }
      v96 = (objc_object *)v63;
      if (v44)
      {
        if (v20 < 1) {
          uint64_t v95 = 0;
        }
        else {
          uint64_t v95 = [(NSArray *)v56 objectAtIndex:(v20 - 1)];
        }
        if (v20 + 2 < v58)
        {
          uint64_t v88 = [(NSArray *)v56 objectAtIndex:v20 + 2];
          goto LABEL_120;
        }
      }
      else
      {
        uint64_t v95 = 0;
      }
      uint64_t v88 = 0;
LABEL_120:
      uint64_t v89 = -[NSArray objectAtIndex:](v56, "objectAtIndex:", 0, v95);
      uint64_t v90 = [(NSArray *)v56 objectAtIndex:v59];
      HIDWORD(v91) = 1062232653;
      if (fabs(v47) >= 0.001)
      {
        if (fabs(v47 + -1.0) >= 0.001)
        {
          if (v95 | v88 && (v44 & 1) != 0)
          {
            uint64_t v92 = -[objc_object CA_interpolateValues:::interpolator:](v61, "CA_interpolateValues:::interpolator:");
          }
          else
          {
            *(float *)&double v91 = v47;
            uint64_t v92 = [(objc_object *)v61 CA_interpolateValue:v96 byFraction:v91];
          }
          v61 = (objc_object *)v92;
        }
        else
        {
          v61 = v96;
        }
      }
      if ([(CAPropertyAnimation *)self isCumulative] && v110)
      {
        if ([(CAAnimation *)self autoreverses]) {
          uint64_t v93 = v89;
        }
        else {
          uint64_t v93 = v90;
        }
        v61 = (objc_object *)[(objc_object *)v61 CA_addValue:v93 multipliedBy:v110];
      }
      v94 = [(CAPropertyAnimation *)self valueFunction];
      if (v94) {
        v61 = (objc_object *)applyValueFunction(v94, v61, &self->super, v5);
      }
      if ([(CAPropertyAnimation *)self isAdditive]) {
        v61 = (objc_object *)objc_msgSend((id)-[objc_object valueForKeyPath:](v5, "valueForKeyPath:", v8), "CA_addValue:multipliedBy:", v61, 1);
      }
      [(objc_object *)v5 setValue:v61 forKeyPath:v8];
      break;
  }
}

- (NSArray)values
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 587, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CAAnimationCalculationMode)calculationMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 80, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CAAnimationCalculationMode)v3[0];
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)CAKeyframeAnimation;
  BOOL v6 = [(CAPropertyAnimation *)&v70 _setCARenderAnimation:a3 layer:a4];
  if (v6)
  {
    *((unsigned char *)a3 + 144) = calcModeFromString((const __CFString *)[(CAKeyframeAnimation *)self calculationMode]);
    int v7 = [(CAKeyframeAnimation *)self path];
    if (v7)
    {
      objc_super v9 = CA::Render::Path::new_path(v7, v8);
      uint64_t v10 = (atomic_uint *)*((void *)a3 + 17);
      if (v10 != (atomic_uint *)v9)
      {
        if (v10 && atomic_fetch_add(v10 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v10 + 16))(v10);
        }
        if (v9)
        {
          v11 = v9;
          if (!atomic_fetch_add(&v9->i32[2], 1u))
          {
            v11 = 0;
            atomic_fetch_add(&v9->i32[2], 0xFFFFFFFF);
          }
        }
        else
        {
          v11 = 0;
        }
        *((void *)a3 + 17) = v11;
      }
      if (v9 && atomic_fetch_add(&v9->i32[2], 0xFFFFFFFF) == 1) {
        (*(void (**)(int8x16_t *))(v9->i64[0] + 16))(v9);
      }
    }
    else
    {
      int v12 = [(CAKeyframeAnimation *)self values];
      if (v12)
      {
        v13 = v12;
        uint64_t v14 = [(NSArray *)v12 count];
        if (v14)
        {
          int v15 = (CA::Render::Array *)v14;
          uint64_t AtomInKeyPath = CAInternFirstAtomInKeyPath((const __CFString *)[(CAPropertyAnimation *)self keyPath]);
          int v17 = AtomInKeyPath;
          int v18 = *((unsigned __int8 *)a3 + 144);
          unint64_t v19 = 8 * (void)v15;
          if ((unint64_t)(8 * (void)v15) > 0x1000)
          {
            int v20 = (char *)malloc_type_malloc(8 * (void)v15, 0x2004093837F09uLL);
          }
          else
          {
            MEMORY[0x1F4188790](AtomInKeyPath);
            int v20 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v20, 8 * (void)v15);
          }
          for (uint64_t i = 0; i != v15; uint64_t i = (CA::Render::Array *)((char *)i + 1))
          {
            uint64_t v22 = [(NSArray *)v13 objectAtIndexedSubscript:i];
            if (!v18)
            {
              if (v17 == 138)
              {
                id v68 = (id)NSNumber;
                uint64_t v25 = [(__CFString *)v22 isEqualToString:@"AAAA"];
                uint64_t v22 = (__CFString *)[v68 numberWithUnsignedChar:v25];
              }
              else if (v17 == 131)
              {
                id v68 = (id)NSNumber;
                uint64_t v24 = CA::Render::Layer::gravity_from_string(v22, v23);
                uint64_t v22 = (__CFString *)[v68 numberWithUnsignedInt:v24];
              }
            }
            *(void *)&v20[8 * (void)i] = [(__CFString *)v22 CA_copyRenderValue];
          }
          double v26 = CA::Render::Array::new_array(v15, v20, 0, 0);
          if (v26)
          {
            double v27 = v26;
            uint64_t v28 = v26[4];
            if (v28)
            {
              v29 = v26 + 6;
              uint64_t v30 = 8 * v28;
              while (*(void *)v29 && *(unsigned char *)(*(void *)v29 + 12))
              {
                v29 += 2;
                v30 -= 8;
                if (!v30) {
                  goto LABEL_34;
                }
              }
            }
            else
            {
LABEL_34:
              uint64_t v31 = (atomic_uint *)*((void *)a3 + 14);
              if (v31 != v27)
              {
                if (v31 && atomic_fetch_add(v31 + 2, 0xFFFFFFFF) == 1) {
                  (*(void (**)(atomic_uint *))(*(void *)v31 + 16))(v31);
                }
                double v32 = v27;
                if (!atomic_fetch_add(v27 + 2, 1u))
                {
                  double v32 = 0;
                  atomic_fetch_add(v27 + 2, 0xFFFFFFFF);
                }
                *((void *)a3 + 14) = v32;
              }
            }
            if (atomic_fetch_add(v27 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v27 + 16))(v27);
            }
          }
          if (v19 > 0x1000) {
            free(v20);
          }
        }
      }
    }
    int v33 = *((unsigned __int8 *)a3 + 144);
    if (v33 == 4 || v33 == 2)
    {
      CA::Render::KeyframeAnimation::update_paced_key_times((CA::Render::KeyframeAnimation *)a3);
    }
    else
    {
      v39 = [(CAKeyframeAnimation *)self keyTimes];
      if (v39)
      {
        BOOL v69 = 0;
        v40 = copyFloatVector(v39, &v69);
        v41 = (atomic_uint *)*((void *)a3 + 15);
        if (v41 != v40)
        {
          if (v41 && atomic_fetch_add(v41 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v41 + 16))(v41);
          }
          if (v40)
          {
            v42 = v40;
            if (!atomic_fetch_add(v40 + 2, 1u))
            {
              v42 = 0;
              atomic_fetch_add(v40 + 2, 0xFFFFFFFF);
            }
          }
          else
          {
            v42 = 0;
          }
          *((void *)a3 + 15) = v42;
        }
        if (v40 && atomic_fetch_add(v40 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v40 + 16))(v40);
        }
        if (v69) {
          *((_DWORD *)a3 + 3) |= 0x4000000u;
        }
      }
      v55 = [(CAKeyframeAnimation *)self timingFunctions];
      if (v55)
      {
        v56 = v55;
        uint64_t v57 = [(NSArray *)v55 count];
        if (v57)
        {
          uint64_t v58 = v57;
          size_t v59 = 32 * v57;
          if ((unint64_t)(32 * v57) > 0x1000)
          {
            int v60 = (char *)malloc_type_malloc(32 * v57, 0x100004000313F17uLL);
          }
          else
          {
            MEMORY[0x1F4188790](v57);
            int v60 = (char *)&v67 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
            bzero(v60, v59);
          }
          uint64_t v61 = 0;
          int v62 = v60;
          do
          {
            objc_msgSend(-[NSArray objectAtIndex:](v56, "objectAtIndex:", v61++), "_getPoints:", v62);
            v62 += 32;
          }
          while (v58 != v61);
          float v64 = CA::Render::Vector::new_vector((CA::Render::Vector *)(4 * v58), v60, v63);
          v65 = (atomic_uint *)*((void *)a3 + 16);
          if (v65 != v64)
          {
            if (v65 && atomic_fetch_add(v65 + 2, 0xFFFFFFFF) == 1) {
              (*(void (**)(atomic_uint *))(*(void *)v65 + 16))(v65);
            }
            if (v64)
            {
              int32x2_t v66 = v64;
              if (!atomic_fetch_add(v64 + 2, 1u))
              {
                int32x2_t v66 = 0;
                atomic_fetch_add(v64 + 2, 0xFFFFFFFF);
              }
            }
            else
            {
              int32x2_t v66 = 0;
            }
            *((void *)a3 + 16) = v66;
          }
          if (v64 && atomic_fetch_add(v64 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v64 + 16))(v64);
          }
          if (v59 > 0x1000) {
            free(v60);
          }
        }
      }
    }
    if (*((unsigned __int8 *)a3 + 144) - 3 <= 1)
    {
      double v35 = [(CAKeyframeAnimation *)self tensionValues];
      if (v35)
      {
        double v36 = copyFloatVector(v35, 0);
        size_t v37 = (atomic_uint *)*((void *)a3 + 19);
        if (v37 != v36)
        {
          if (v37 && atomic_fetch_add(v37 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v37 + 16))(v37);
          }
          if (v36)
          {
            v38 = v36;
            if (!atomic_fetch_add(v36 + 2, 1u))
            {
              v38 = 0;
              atomic_fetch_add(v36 + 2, 0xFFFFFFFF);
            }
          }
          else
          {
            v38 = 0;
          }
          *((void *)a3 + 19) = v38;
        }
        if (v36 && atomic_fetch_add(v36 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v36 + 16))(v36);
        }
      }
      v43 = [(CAKeyframeAnimation *)self continuityValues];
      if (v43)
      {
        int v44 = copyFloatVector(v43, 0);
        v45 = (atomic_uint *)*((void *)a3 + 20);
        if (v45 != v44)
        {
          if (v45 && atomic_fetch_add(v45 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v45 + 16))(v45);
          }
          if (v44)
          {
            int v46 = v44;
            if (!atomic_fetch_add(v44 + 2, 1u))
            {
              int v46 = 0;
              atomic_fetch_add(v44 + 2, 0xFFFFFFFF);
            }
          }
          else
          {
            int v46 = 0;
          }
          *((void *)a3 + 20) = v46;
        }
        if (v44 && atomic_fetch_add(v44 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v44 + 16))(v44);
        }
      }
      double v47 = [(CAKeyframeAnimation *)self biasValues];
      if (v47)
      {
        double v48 = copyFloatVector(v47, 0);
        int v49 = (atomic_uint *)*((void *)a3 + 21);
        if (v49 != v48)
        {
          if (v49 && atomic_fetch_add(v49 + 2, 0xFFFFFFFF) == 1) {
            (*(void (**)(atomic_uint *))(*(void *)v49 + 16))(v49);
          }
          if (v48)
          {
            id v50 = v48;
            if (!atomic_fetch_add(v48 + 2, 1u))
            {
              id v50 = 0;
              atomic_fetch_add(v48 + 2, 0xFFFFFFFF);
            }
          }
          else
          {
            id v50 = 0;
          }
          *((void *)a3 + 21) = v50;
        }
        if (v48 && atomic_fetch_add(v48 + 2, 0xFFFFFFFF) == 1) {
          (*(void (**)(atomic_uint *))(*(void *)v48 + 16))(v48);
        }
      }
    }
    double v51 = [(CAKeyframeAnimation *)self rotationMode];
    if (v51)
    {
      float v52 = v51;
      if ([(NSString *)v51 isEqualToString:@"auto"])
      {
        int v53 = 0x1000000;
LABEL_104:
        *((_DWORD *)a3 + 3) |= v53;
        return v6;
      }
      if ([(NSString *)v52 isEqualToString:@"autoReverse"])
      {
        int v53 = 0x2000000;
        goto LABEL_104;
      }
    }
  }
  return v6;
}

- (NSArray)keyTimes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 340, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CGPathRef)path
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 423, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CGPathRef)v3[0];
}

- (NSArray)timingFunctions
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 560, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (CAAnimationRotationMode)rotationMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 482, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CAAnimationRotationMode)v3[0];
}

- (NSArray)continuityValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 141, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (NSArray)tensionValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 556, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (NSArray)biasValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 60, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setRotationMode:(CAAnimationRotationMode)rotationMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = rotationMode;
  CAAnimation_setter((uint64_t)self, (const void *)0x1E2, 3, (unsigned __int8 *)v3);
}

- (void)setBiasValues:(NSArray *)biasValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = biasValues;
  CAAnimation_setter((uint64_t)self, (const void *)0x3C, 3, (unsigned __int8 *)v3);
}

- (void)setContinuityValues:(NSArray *)continuityValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = continuityValues;
  CAAnimation_setter((uint64_t)self, (const void *)0x8D, 3, (unsigned __int8 *)v3);
}

- (void)setTensionValues:(NSArray *)tensionValues
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = tensionValues;
  CAAnimation_setter((uint64_t)self, (const void *)0x22C, 3, (unsigned __int8 *)v3);
}

- (void)setPath:(CGPathRef)path
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = path;
  CAAnimation_setter((uint64_t)self, (const void *)0x1A7, 3, (unsigned __int8 *)v3);
}

- (void)setTimingFunctions:(NSArray *)timingFunctions
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = timingFunctions;
  CAAnimation_setter((uint64_t)self, (const void *)0x230, 3, (unsigned __int8 *)v3);
}

@end