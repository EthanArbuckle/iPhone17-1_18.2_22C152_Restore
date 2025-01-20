@interface BSAnimationSettings
+ (BOOL)supportsSecureCoding;
+ (id)settingsWithDuration:(double)a3;
+ (id)settingsWithDuration:(double)a3 delay:(double)a4;
+ (id)settingsWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5;
+ (id)settingsWithDuration:(double)a3 timingFunction:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSpringAnimation;
- (BSAnimationSettings)init;
- (BSAnimationSettings)initWithCoder:(id)a3;
- (BSAnimationSettings)initWithXPCDictionary:(id)a3;
- (CAFrameRateRange)preferredFrameRateRange;
- (CAMediaTimingFunction)timingFunction;
- (NSString)description;
- (double)_lock_duration;
- (double)damping;
- (double)delay;
- (double)duration;
- (double)epsilon;
- (double)frameInterval;
- (double)initialVelocity;
- (double)mass;
- (double)progressAtTime:(double)a3;
- (double)stiffness;
- (float)speed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (uint64_t)_initWithStoredDuration:(int)a3 storedDurationIsDirty:(void *)a4 delay:(int)a5 frameInterval:(double)a6 frameRange:(double)a7 highFrameRateReason:(double)a8 timingFunction:(float)a9 speed:(float)a10 mass:(float)a11 stiffness:(float)a12 damping:(double)a13 epsilon:(uint64_t)a14 initialVelocity:(uint64_t)a15 isSpring:(uint64_t)a16;
- (unint64_t)hash;
- (unsigned)highFrameRateReason;
- (void)_lock_applyToCAAnimation:(uint64_t)a1;
- (void)_setEpsilon:(uint64_t)a1;
- (void)_setFrameInterval:(uint64_t)a1;
- (void)_setFrameRange:(float)a3;
- (void)_setSpeed:(uint64_t)a1;
- (void)_setTimingFunction:(uint64_t)a1;
- (void)applyToCAAnimation:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation BSAnimationSettings

- (void).cxx_destruct
{
}

- (BOOL)isSpringAnimation
{
  return self->_isSpring;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  float minimum = self->_lock_frameRange.minimum;
  float maximum = self->_lock_frameRange.maximum;
  float preferred = self->_lock_frameRange.preferred;
  os_unfair_lock_unlock(p_lock);
  float v7 = minimum;
  float v8 = maximum;
  float v9 = preferred;
  result.float preferred = v9;
  result.float maximum = v8;
  result.float minimum = v7;
  return result;
}

- (unsigned)highFrameRateReason
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_lock_highFrameRateReason;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (double)delay
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_delay = self->_lock_delay;
  os_unfair_lock_unlock(p_lock);
  return lock_delay;
}

- (float)speed
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  float lock_speed = self->_lock_speed;
  os_unfair_lock_unlock(p_lock);
  return lock_speed;
}

- (double)frameInterval
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double lock_frameInterval = self->_lock_frameInterval;
  os_unfair_lock_unlock(p_lock);
  return lock_frameInterval;
}

- (CAMediaTimingFunction)timingFunction
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_lock_timingFunction;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

+ (id)settingsWithDuration:(double)a3 timingFunction:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  v11 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v7, 0, 0, v6, 0, a3, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v8, v9, v10, 0, 0, 0.0,
                  0);

  return v11;
}

- (BSAnimationSettings)initWithXPCDictionary:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v68 = 0;
  v65 = v4;
  if (v4)
  {
    v64 = self;
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __45__BSAnimationSettings_initWithXPCDictionary___block_invoke;
    v66[3] = &unk_1E5446318;
    id v8 = v4;
    id v67 = v8;
    uint64_t v9 = (double (**)(void, void, void, double))MEMORY[0x18C125630](v66);
    double v10 = ((double (**)(void, const char *, char *, double))v9)[2](v9, "l", (char *)&v68 + 1, 0.0);
    double v11 = ((double (**)(void, const char *, void, double))v9)[2](v9, "w", 0, 0.0);
    double v12 = ((double (**)(void, const char *, void, double))v9)[2](v9, "f", 0, 0.0);
    v13 = xpc_dictionary_get_value(v8, "r");
    v14 = v13;
    double v62 = v11;
    double v63 = v10;
    double v61 = v12;
    if (v13)
    {
      LODWORD(v70) = 0;
      uint64_t v69 = 0;
      if (object_getClass(v13) == (Class)MEMORY[0x1E4F14568] && xpc_array_get_count(v14) == 3)
      {
        size_t v15 = 0;
        char v16 = 1;
        v17 = (objc_class *)MEMORY[0x1E4F145C0];
        do
        {
          v18 = xpc_array_get_value(v14, v15);
          if (object_getClass(v18) == v17)
          {
            int64_t value = xpc_int64_get_value(v18);
            if (value <= (uint64_t)0xFFFFFFFF80000000) {
              uint64_t v20 = 0xFFFFFFFF80000000;
            }
            else {
              uint64_t v20 = value;
            }
            if (v20 >= 0x7FFFFFFF) {
              LODWORD(v20) = 0x7FFFFFFF;
            }
            *((_DWORD *)&v69 + v15) = v20;
          }
          else
          {
            char v16 = 0;
          }

          ++v15;
        }
        while (v15 != 3);
        if (v16)
        {
          float v24 = (float)(int)v69;
          float v23 = (float)SHIDWORD(v69);
          float v22 = (float)(int)v70;
LABEL_20:
          v25 = xpc_dictionary_get_value(v8, "x");
          v26 = v25;
          float v60 = v22;
          if (v25)
          {
            if (object_getClass(v25) == (Class)MEMORY[0x1E4F145C0])
            {
              int v28 = xpc_int64_get_value(v26);
LABEL_28:
              v42 = xpc_dictionary_get_value(v8, "t");
              v43 = v42;
              if (v42)
              {
                uint64_t v69 = 0;
                uint64_t v70 = 0;
                if (object_getClass(v42) == (Class)MEMORY[0x1E4F14568] && xpc_array_get_count(v43) == 4)
                {
                  size_t v44 = 0;
                  char v45 = 1;
                  v46 = (objc_class *)MEMORY[0x1E4F14598];
                  do
                  {
                    v47 = xpc_array_get_value(v43, v44);
                    if (object_getClass(v47) != v46
                      || ((double v48 = xpc_double_get_value(v47), v48 >= 0.0) ? (v49 = v48 > 1.0) : (v49 = 1), v49))
                    {
                      char v45 = 0;
                    }
                    else
                    {
                      float v50 = v48;
                      *((float *)&v69 + v44) = v50;
                    }

                    ++v44;
                  }
                  while (v44 != 4);
                  if (v45)
                  {
                    id CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
                    LODWORD(v57) = HIDWORD(v69);
                    LODWORD(v56) = v69;
                    LODWORD(v59) = HIDWORD(v70);
                    LODWORD(v58) = v70;
                    v30 = [CAMediaTimingFunctionClass functionWithControlPoints:v56 :v57 :v58 :v59];
                    goto LABEL_45;
                  }
                }
                v51 = BSLogCommon();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v72 = "-[BSAnimationSettings initWithXPCDictionary:]";
                  __int16 v73 = 2114;
                  v74 = (const char *)v43;
                  _os_log_error_impl(&dword_18AAA8000, v51, OS_LOG_TYPE_ERROR, "%s the encoded timingFunction format is unknown -> %{public}@", buf, 0x16u);
                }
              }
              v30 = 0;
LABEL_45:
              double v52 = ((double (**)(void, const char *, void, double))v9)[2](v9, "p", 0, 1.0);
              double v38 = ((double (**)(void, const char *, __int16 *, double))v9)[2](v9, "m", &v68, 0.0);
              uint64_t v37 = ((double (**)(void, const char *, __int16 *, double))v9)[2](v9, "s", &v68, 0.0);
              uint64_t v33 = ((double (**)(void, const char *, __int16 *, double))v9)[2](v9, "d", &v68, 0.0);
              double v34 = ((double (**)(void, const char *, __int16 *, double))v9)[2](v9, "e", &v68, 0.0);
              uint64_t v36 = ((double (**)(void, const char *, __int16 *, double))v9)[2](v9, "v", &v68, 0.0);

              float v32 = v52;
              char v35 = HIBYTE(v68) == 0;
              BOOL v29 = v68 != 0;
              self = v64;
              double v40 = v62;
              double v41 = v63;
              double v39 = v61;
              float v31 = v60;
              goto LABEL_46;
            }
            v27 = BSLogCommon();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v72 = "-[BSAnimationSettings initWithXPCDictionary:]";
              __int16 v73 = 2080;
              v74 = "x";
              __int16 v75 = 2112;
              v76 = v26;
              _os_log_error_impl(&dword_18AAA8000, v27, OS_LOG_TYPE_ERROR, "%{public}s the encoded format for %s is unknown -> %@", buf, 0x20u);
            }
          }
          int v28 = 0;
          goto LABEL_28;
        }
      }
      v21 = BSLogCommon();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v72 = "-[BSAnimationSettings initWithXPCDictionary:]";
        __int16 v73 = 2114;
        v74 = (const char *)v14;
        _os_log_error_impl(&dword_18AAA8000, v21, OS_LOG_TYPE_ERROR, "%s the encoded frameRange format is unknown -> %{public}@", buf, 0x16u);
      }
    }
    float v22 = 0.0;
    float v23 = 0.0;
    float v24 = 0.0;
    goto LABEL_20;
  }
  BOOL v29 = 0;
  v30 = 0;
  int v28 = 0;
  float v31 = 0.0;
  float v32 = 1.0;
  uint64_t v33 = 0;
  double v34 = 0.0;
  char v35 = 1;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  double v38 = 0.0;
  float v23 = 0.0;
  float v24 = 0.0;
  double v39 = 0.0;
  double v40 = 0.0;
  double v41 = 0.0;
LABEL_46:
  v53 = (BSAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, v35, v28, v30, v29, v41, v40, v39, v24, v23, v31, v32, v38, v5, v6, v7, v37, v33, v34,
                                 v36);

  return v53;
}

double __45__BSAnimationSettings_initWithXPCDictionary___block_invoke(uint64_t a1, const char *a2, unsigned char *a3, double value)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  id v8 = v7;
  if (v7)
  {
    if (object_getClass(v7) == (Class)MEMORY[0x1E4F14598])
    {
      if (a3) {
        *a3 = 1;
      }
      int64_t value = xpc_double_get_value(v8);
    }
    else
    {
      uint64_t v9 = BSLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136446722;
        double v12 = "-[BSAnimationSettings initWithXPCDictionary:]_block_invoke";
        __int16 v13 = 2080;
        v14 = a2;
        __int16 v15 = 2112;
        char v16 = v8;
        _os_log_error_impl(&dword_18AAA8000, v9, OS_LOG_TYPE_ERROR, "%{public}s the encoded format for %s is unknown -> %@", (uint8_t *)&v11, 0x20u);
      }
    }
  }

  return value;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = off_1E5444F80;
  if (self->_isSpring) {
    uint64_t v6 = off_1E5444FC8;
  }
  uint64_t v7 = [(__objc2_class *)*v6 allocWithZone:a3];
  int v11 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v7, self->_lock_storedDurationIsDirty, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_isSpring, self->_lock_storedDuration, self->_lock_delay, self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_speed, self->_lock_mass, v8, v9, v10, *(void *)&self->_lock_stiffness, *(void *)&self->_lock_damping, self->_lock_epsilon,
                  *(void *)&self->_lock_initialVelocity);

  os_unfair_lock_unlock(p_lock);
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (self->_mutable)
  {
    os_unfair_lock_lock(p_lock);
    uint64_t v5 = off_1E5444E60;
    if (self->_isSpring) {
      uint64_t v5 = off_1E5445078;
    }
    uint64_t v6 = [(__objc2_class *)*v5 allocWithZone:a3];
    uint64_t v10 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v6, self->_lock_storedDurationIsDirty, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_isSpring, self->_lock_storedDuration, self->_lock_delay, self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_speed, self->_lock_mass, v7, v8, v9, *(void *)&self->_lock_stiffness, *(void *)&self->_lock_damping, self->_lock_epsilon,
                    *(void *)&self->_lock_initialVelocity);

    os_unfair_lock_unlock(p_lock);
    return v10;
  }
  else
  {
    return self;
  }
}

+ (id)settingsWithDuration:(double)a3
{
  id v4 = objc_alloc((Class)a1);
  uint64_t v8 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v4, 0, 0, 0, 0, a3, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v5, v6, v7, 0, 0, 0.0,
                 0);
  return v8;
}

+ (id)settingsWithDuration:(double)a3 delay:(double)a4 timingFunction:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc((Class)a1);
  __int16 v13 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v9, 0, 0, v8, 0, a3, a4, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v10, v11, v12, 0, 0, 0.0,
                  0);

  return v13;
}

- (uint64_t)_initWithStoredDuration:(int)a3 storedDurationIsDirty:(void *)a4 delay:(int)a5 frameInterval:(double)a6 frameRange:(double)a7 highFrameRateReason:(double)a8 timingFunction:(float)a9 speed:(float)a10 mass:(float)a11 stiffness:(float)a12 damping:(double)a13 epsilon:(uint64_t)a14 initialVelocity:(uint64_t)a15 isSpring:(uint64_t)a16
{
  id v33 = a4;
  if (!a1)
  {
    uint64_t v38 = 0;
    goto LABEL_13;
  }
  uint64_t v34 = objc_opt_class();
  if (a5)
  {
    if (v34 != objc_opt_class())
    {
      if (v34 != objc_opt_class())
      {
        char v35 = [MEMORY[0x1E4F28B00] currentHandler];
        [v35 handleFailureInMethod:sel__initWithStoredDuration_storedDurationIsDirty_delay_frameInterval_frameRange_highFrameRateReason_timingFunction_speed_mass_stiffness_damping_epsilon_initialVelocity_isSpring_, a1, @"BSAnimationSettings.m", 83, @"invalid class type: %@", v34 object file lineNumber description];
LABEL_15:

        goto LABEL_8;
      }
      goto LABEL_8;
    }
LABEL_9:
    char v36 = 1;
    goto LABEL_10;
  }
  if (v34 == objc_opt_class()) {
    goto LABEL_9;
  }
  if (v34 != objc_opt_class())
  {
    char v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:sel__initWithStoredDuration_storedDurationIsDirty_delay_frameInterval_frameRange_highFrameRateReason_timingFunction_speed_mass_stiffness_damping_epsilon_initialVelocity_isSpring_, a1, @"BSAnimationSettings.m", 89, @"invalid class type: %@", v34 object file lineNumber description];
    goto LABEL_15;
  }
LABEL_8:
  char v36 = 0;
LABEL_10:
  v40.receiver = a1;
  v40.super_class = (Class)BSAnimationSettings;
  id v37 = objc_msgSendSuper2(&v40, sel_init);
  uint64_t v38 = (uint64_t)v37;
  if (v37)
  {
    *((_DWORD *)v37 + 2) = 0;
    *((unsigned char *)v37 + 105) = v36;
    *((unsigned char *)v37 + 106) = a5;
    *((unsigned char *)v37 + 104) = a2;
    *((double *)v37 + 2) = a6;
    *((double *)v37 + 3) = a7;
    *((double *)v37 + 4) = a8;
    *((float *)v37 + 10) = a9;
    *((float *)v37 + 11) = a10;
    *((float *)v37 + 12) = a11;
    *((_DWORD *)v37 + 13) = a3;
    objc_storeStrong((id *)v37 + 7, a4);
    -[BSAnimationSettings _setTimingFunction:](v38, *(void **)(v38 + 56));
    *(float *)(v38 + 12) = a12;
    if (*(unsigned char *)(v38 + 106))
    {
      *(double *)(v38 + 64) = a13;
      *(void *)(v38 + 72) = a17;
      *(void *)(v38 + 80) = a18;
      *(double *)(v38 + 88) = a19;
      -[BSAnimationSettings _setEpsilon:](v38, a19);
      *(void *)(v38 + 96) = a20;
    }
  }
LABEL_13:

  return v38;
}

- (void)_setTimingFunction:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (!v3 && *(unsigned char *)(a1 + 106))
    {
      id CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
      uint64_t v17 = 0;
      v18 = &v17;
      uint64_t v19 = 0x2020000000;
      uint64_t v6 = (id *)getkCAMediaTimingFunctionLinearSymbolLoc_ptr;
      uint64_t v20 = getkCAMediaTimingFunctionLinearSymbolLoc_ptr;
      if (!getkCAMediaTimingFunctionLinearSymbolLoc_ptr)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __getkCAMediaTimingFunctionLinearSymbolLoc_block_invoke;
        v15[3] = &unk_1E54455A0;
        char v16 = &v17;
        uint64_t v7 = QuartzCoreLibrary();
        v18[3] = (uint64_t)dlsym(v7, "kCAMediaTimingFunctionLinear");
        getkCAMediaTimingFunctionLinearSymbolLoc_ptr = *(void *)(v16[1] + 24);
        uint64_t v6 = (id *)v18[3];
      }
      _Block_object_dispose(&v17, 8);
      if (!v6)
      {
        __int16 v13 = [MEMORY[0x1E4F28B00] currentHandler];
        v14 = [NSString stringWithUTF8String:"NSString *getkCAMediaTimingFunctionLinear(void)"];
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"BSAnimationSettings.m", 24, @"%s", dlerror());

        __break(1u);
      }
      id v8 = *v6;
      id v4 = [CAMediaTimingFunctionClass functionWithName:v8];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    id v9 = *(void **)(a1 + 56);
    if (v9 != v4)
    {
      if (v9 && v4)
      {
        char v10 = 0;
        uint64_t v11 = 1;
        while (1)
        {
          char v12 = v10;
          v15[0] = 0;
          uint64_t v17 = 0;
          [*(id *)(a1 + 56) getControlPointAtIndex:v11 values:v15];
          [v4 getControlPointAtIndex:v11 values:&v17];
          if (vabds_f32(*(float *)v15, *(float *)&v17) >= 0.00000011921
            || vabds_f32(*((float *)v15 + 1), *((float *)&v17 + 1)) >= 0.00000011921)
          {
            break;
          }
          char v10 = 1;
          uint64_t v11 = 2;
          if (v12) {
            goto LABEL_17;
          }
        }
      }
      objc_storeStrong((id *)(a1 + 56), v4);
      *(unsigned char *)(a1 + 104) = 1;
    }
LABEL_17:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (void)_setEpsilon:(uint64_t)a1
{
  if (a1)
  {
    double v3 = fabs(a2);
    double v4 = fmin(fmax(a2, 0.0001), 0.5);
    if (v3 >= 2.22044605e-16) {
      double v5 = v4;
    }
    else {
      double v5 = 0.001;
    }
    uint64_t v6 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (vabdd_f64(*(double *)(a1 + 88), v5) >= 2.22044605e-16)
    {
      *(double *)(a1 + 88) = v5;
      *(unsigned char *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v6);
  }
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL isSpring = self->_isSpring;
  double v5 = NSString;
  uint64_t v6 = objc_opt_class();
  if (isSpring)
  {
    double lock_mass = self->_lock_mass;
    double lock_stiffness = self->_lock_stiffness;
    double lock_damping = self->_lock_damping;
    double lock_epsilon = self->_lock_epsilon;
    double lock_initialVelocity = self->_lock_initialVelocity;
    BOOL lock_storedDurationIsDirty = self->_lock_storedDurationIsDirty;
    if (self->_lock_storedDurationIsDirty)
    {
      __int16 v13 = &stru_1ED76E928;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @" (duration=%f)", -[BSAnimationSettings _lock_duration]((uint64_t)self));
      __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v14 = [v5 stringWithFormat:@"<%@:%p mass=%f stiffness=%f damping=%f epsilon=%f initialVelocity=%f %@delay=%f interval=%f range={%f,%f,%f} reason=%i timing=%@ speed=%f>", v6, self, *(void *)&lock_mass, *(void *)&lock_stiffness, *(void *)&lock_damping, *(void *)&lock_epsilon, *(void *)&lock_initialVelocity, v13, *(void *)&self->_lock_delay, *(void *)&self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_lock_speed];
    if (!lock_storedDurationIsDirty) {
  }
    }
  else
  {
    v14 = [v5 stringWithFormat:@"<%@:%p duration=%f delay=%f interval=%f range={%f,%f,%f} reason=%i timing=%@ speed=%f>", v6, self, -[BSAnimationSettings _lock_duration]((uint64_t)self), *(void *)&self->_lock_delay, *(void *)&self->_lock_frameInterval, self->_lock_frameRange.minimum, self->_lock_frameRange.maximum, self->_lock_frameRange.preferred, self->_lock_highFrameRateReason, self->_lock_timingFunction, self->_lock_speed];
  }
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v14;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    if (!self->_isSpring || !self->_lock_storedDurationIsDirty)
    {
      double v5 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
      xpc_dictionary_set_double(v4, "l", v5);
    }
    double lock_delay = self->_lock_delay;
    if (lock_delay != 0.0) {
      xpc_dictionary_set_double(v4, "w", lock_delay);
    }
    double lock_frameInterval = self->_lock_frameInterval;
    if (lock_frameInterval != 0.0) {
      xpc_dictionary_set_double(v4, "f", lock_frameInterval);
    }
    if (self->_lock_frameRange.minimum != 0.0
      || self->_lock_frameRange.maximum != 0.0
      || self->_lock_frameRange.preferred != 0.0)
    {
      xpc_object_t v8 = xpc_array_create(0, 0);
      xpc_object_t v9 = xpc_int64_create((uint64_t)self->_lock_frameRange.minimum);
      xpc_array_append_value(v8, v9);

      xpc_object_t v10 = xpc_int64_create((uint64_t)self->_lock_frameRange.maximum);
      xpc_array_append_value(v8, v10);

      xpc_object_t v11 = xpc_int64_create((uint64_t)self->_lock_frameRange.preferred);
      xpc_array_append_value(v8, v11);

      xpc_dictionary_set_value(v4, "r", v8);
    }
    int64_t lock_highFrameRateReason = self->_lock_highFrameRateReason;
    if (lock_highFrameRateReason) {
      xpc_dictionary_set_int64(v4, "x", lock_highFrameRateReason);
    }
    lock_timingFunction = self->_lock_timingFunction;
    if (lock_timingFunction)
    {
      uint64_t v22 = 0;
      v23[0] = 0;
      [(CAMediaTimingFunction *)lock_timingFunction getControlPointAtIndex:1 values:&v22];
      [(CAMediaTimingFunction *)self->_lock_timingFunction getControlPointAtIndex:2 values:v23];
      xpc_object_t v14 = xpc_array_create(0, 0);
      for (uint64_t i = 0; i != 16; i += 4)
      {
        xpc_object_t v16 = xpc_double_create(*(float *)((char *)&v23[-1] + i));
        xpc_array_append_value(v14, v16);
      }
      xpc_dictionary_set_value(v4, "t", v14);
    }
    float lock_speed = self->_lock_speed;
    if (lock_speed != 1.0) {
      xpc_dictionary_set_double(v4, "p", lock_speed);
    }
    if (self->_isSpring)
    {
      double lock_mass = self->_lock_mass;
      if (lock_mass != 0.0) {
        xpc_dictionary_set_double(v4, "m", lock_mass);
      }
      double lock_stiffness = self->_lock_stiffness;
      if (lock_stiffness != 0.0) {
        xpc_dictionary_set_double(v4, "s", lock_stiffness);
      }
      double lock_damping = self->_lock_damping;
      if (lock_damping != 0.0) {
        xpc_dictionary_set_double(v4, "d", lock_damping);
      }
      xpc_dictionary_set_double(v4, "e", self->_lock_epsilon);
      double lock_initialVelocity = self->_lock_initialVelocity;
      if (lock_initialVelocity != 0.0) {
        xpc_dictionary_set_double(v4, "v", lock_initialVelocity);
      }
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)_lock_applyToCAAnimation:(uint64_t)a1
{
  id v7 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
    if (v7)
    {
      if (*(void *)(a1 + 56)) {
        objc_msgSend(v7, "setTimingFunction:");
      }
      if (*(double *)(a1 + 32) != 0.0) {
        objc_msgSend(v7, "setFrameInterval:");
      }
      if (*(float *)(a1 + 40) != 0.0 || *(float *)(a1 + 44) != 0.0 || *(float *)(a1 + 48) != 0.0) {
        objc_msgSend(v7, "setPreferredFrameRateRange:");
      }
      if (*(_DWORD *)(a1 + 52) | [v7 highFrameRateReason]) {
        objc_msgSend(v7, "setHighFrameRateReason:");
      }
      if (*(unsigned char *)(a1 + 106) && (getCASpringAnimationClass(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v4 = v7;
        LODWORD(v5) = *(_DWORD *)(a1 + 12);
        [v4 setSpeed:v5];
        [v4 setMass:*(double *)(a1 + 64)];
        [v4 setStiffness:*(double *)(a1 + 72)];
        [v4 setDamping:*(double *)(a1 + 80)];
        [v4 setInitialVelocity:*(double *)(a1 + 96)];
        if (*(unsigned char *)(a1 + 104))
        {
          [v4 durationForEpsilon:*(double *)(a1 + 88)];
          *(void *)(a1 + 16) = v6;
          *(unsigned char *)(a1 + 104) = 0;
        }
        -[BSAnimationSettings _lock_duration](a1);
        objc_msgSend(v4, "setDuration:");
      }
      else
      {
        LODWORD(v3) = *(_DWORD *)(a1 + 12);
        [v7 setSpeed:v3];
        -[BSAnimationSettings _lock_duration](a1);
        objc_msgSend(v7, "setDuration:");
      }
    }
  }
}

- (double)duration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (double)_lock_duration
{
  if (!a1) {
    return 0.0;
  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 8));
  if (*(unsigned char *)(a1 + 106) && *(unsigned char *)(a1 + 104))
  {
    v2 = (void *)MEMORY[0x18C125360]();
    id CATransactionClass = getCATransactionClass();
    char v4 = [MEMORY[0x1E4F29060] isMainThread];
    if (v4)
    {
      uint64_t v5 = [CATransactionClass activate];
    }
    else
    {
      [CATransactionClass begin];
      uint64_t v5 = [CATransactionClass activateBackground:1];
    }
    uint64_t v6 = (void *)MEMORY[0x18C125360](v5);
    id v7 = [getCASpringAnimationClass() animation];
    -[BSAnimationSettings _lock_applyToCAAnimation:](a1, v7);

    if ((v4 & 1) == 0) {
      [CATransactionClass commit];
    }
  }
  return *(double *)(a1 + 16);
}

- (BOOL)isEqual:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  char v4 = (BSAnimationSettings *)a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v4;
      id v7 = v6;
      if (self->_isSpring != v6->_isSpring)
      {
        BOOL v9 = 0;
LABEL_40:

        goto LABEL_41;
      }
      if (self >= v6)
      {
        os_unfair_lock_lock(&v6->_lock);
        xpc_object_t v8 = &self->_lock;
      }
      else
      {
        os_unfair_lock_lock(&self->_lock);
        xpc_object_t v8 = &v7->_lock;
      }
      os_unfair_lock_lock(v8);
      xpc_object_t v10 = v7;
      os_unfair_lock_assert_owner(&self->_lock);
      os_unfair_lock_assert_owner(&v10->_lock);
      if (!self->_isSpring)
      {
        double v11 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
        if (vabdd_f64(v11, -[BSAnimationSettings _lock_duration]((uint64_t)v10)) >= 2.22044605e-16) {
          goto LABEL_33;
        }
      }
      if (vabdd_f64(self->_lock_delay, v10->_lock_delay) >= 2.22044605e-16
        || vabdd_f64(self->_lock_frameInterval, v10->_lock_frameInterval) >= 2.22044605e-16)
      {
        goto LABEL_33;
      }
      BOOL v9 = 0;
      if (self->_lock_frameRange.minimum != v10->_lock_frameRange.minimum
        || self->_lock_frameRange.maximum != v10->_lock_frameRange.maximum
        || self->_lock_frameRange.preferred != v10->_lock_frameRange.preferred)
      {
        goto LABEL_34;
      }
      if (self->_lock_highFrameRateReason == v10->_lock_highFrameRateReason)
      {
        lock_timingFunction = self->_lock_timingFunction;
        __int16 v13 = v10->_lock_timingFunction;
        if (lock_timingFunction != v13)
        {
          BOOL v9 = 0;
          if (lock_timingFunction && v13)
          {
            char v14 = 0;
            uint64_t v15 = 1;
            while (1)
            {
              char v16 = v14;
              uint64_t v20 = 0;
              v21[0] = 0;
              [(CAMediaTimingFunction *)self->_lock_timingFunction getControlPointAtIndex:v15 values:v21];
              [(CAMediaTimingFunction *)v10->_lock_timingFunction getControlPointAtIndex:v15 values:&v20];
              if (vabds_f32(*(float *)v21, *(float *)&v20) >= 0.00000011921
                || vabds_f32(*((float *)v21 + 1), *((float *)&v20 + 1)) >= 0.00000011921)
              {
                goto LABEL_33;
              }
              char v14 = 1;
              uint64_t v15 = 2;
              if (v16) {
                goto LABEL_25;
              }
            }
          }
LABEL_34:
          BOOL v17 = self < v7;

          if (v17) {
            v18 = &v10->_lock;
          }
          else {
            v18 = p_lock;
          }
          if (!v17) {
            p_lock = &v10->_lock;
          }
          os_unfair_lock_unlock(v18);
          os_unfair_lock_unlock(p_lock);
          goto LABEL_40;
        }
LABEL_25:
        if (vabds_f32(self->_lock_speed, v10->_lock_speed) < 0.00000011921
          && (!self->_isSpring
           || vabdd_f64(self->_lock_mass, v10->_lock_mass) < 2.22044605e-16
           && vabdd_f64(self->_lock_stiffness, v10->_lock_stiffness) < 2.22044605e-16
           && vabdd_f64(self->_lock_damping, v10->_lock_damping) < 2.22044605e-16
           && vabdd_f64(self->_lock_epsilon, v10->_lock_epsilon) < 2.22044605e-16
           && vabdd_f64(self->_lock_initialVelocity, v10->_lock_initialVelocity) < 2.22044605e-16))
        {
          BOOL v9 = 1;
          goto LABEL_34;
        }
      }
LABEL_33:
      BOOL v9 = 0;
      goto LABEL_34;
    }
    BOOL v9 = 0;
  }
LABEL_41:

  return v9;
}

- (BSAnimationSettings)init
{
  return (BSAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v2, v3, v4, 0, 0, 0.0,
                                  0);
}

+ (id)settingsWithDuration:(double)a3 delay:(double)a4
{
  id v6 = objc_alloc((Class)a1);
  xpc_object_t v10 = (void *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](v6, 0, 0, 0, 0, a3, a4, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, v7, v8, v9, 0, 0, 0.0,
                  0);
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isSpring || !self->_lock_storedDurationIsDirty) {
    [v4 encodeDouble:@"l" forKey:-[BSAnimationSettings _lock_duration]((uint64_t)self)];
  }
  if (self->_lock_delay != 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"w");
  }
  if (self->_lock_frameInterval != 0.0) {
    objc_msgSend(v4, "encodeDouble:forKey:", @"f");
  }
  float minimum = self->_lock_frameRange.minimum;
  if (minimum != 0.0 || self->_lock_frameRange.maximum != 0.0 || self->_lock_frameRange.preferred != 0.0)
  {
    [v4 encodeInt:(int)minimum forKey:@"fl"];
    [v4 encodeInt:(int)self->_lock_frameRange.maximum forKey:@"fh"];
    [v4 encodeInt:(int)self->_lock_frameRange.preferred forKey:@"fp"];
  }
  uint64_t lock_highFrameRateReason = self->_lock_highFrameRateReason;
  if (lock_highFrameRateReason) {
    [v4 encodeInt32:lock_highFrameRateReason forKey:@"fr"];
  }
  lock_timingFunction = self->_lock_timingFunction;
  if (lock_timingFunction)
  {
    uint64_t v11 = 0;
    v12[0] = 0;
    [(CAMediaTimingFunction *)lock_timingFunction getControlPointAtIndex:1 values:&v11];
    [(CAMediaTimingFunction *)self->_lock_timingFunction getControlPointAtIndex:2 values:v12];
    for (uint64_t i = 0; i != 4; ++i)
    {
      LODWORD(v8) = *((_DWORD *)&v12[-1] + i);
      [v4 encodeFloat:kBSAnimationSettingsTimingPointsStrings[i] forKey:v8];
    }
  }
  float lock_speed = self->_lock_speed;
  if (lock_speed != 1.0) {
    [v4 encodeDouble:@"p" forKey:lock_speed];
  }
  if (self->_isSpring)
  {
    if (self->_lock_mass != 0.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"m");
    }
    if (self->_lock_stiffness != 0.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"s");
    }
    if (self->_lock_damping != 0.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"d");
    }
    [v4 encodeDouble:@"e" forKey:self->_lock_epsilon];
    if (self->_lock_initialVelocity != 0.0) {
      objc_msgSend(v4, "encodeDouble:forKey:", @"v");
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BSAnimationSettings)initWithCoder:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v8 = v4;
  __int16 v52 = 0;
  if (v4)
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __37__BSAnimationSettings_initWithCoder___block_invoke;
    v50[3] = &unk_1E54462F0;
    id v9 = v4;
    id v51 = v9;
    xpc_object_t v10 = (double (**)(void, void, void, double))MEMORY[0x18C125630](v50);
    double v11 = ((double (**)(void, __CFString *, char *, double))v10)[2](v10, @"l", (char *)&v52 + 1, 0.0);
    double v12 = ((double (**)(void, __CFString *, void, double))v10)[2](v10, @"w", 0, 0.0);
    double v13 = ((double (**)(void, __CFString *, void, double))v10)[2](v10, @"f", 0, 0.0);
    int v14 = [v9 decodeIntForKey:@"fl"];
    int v15 = [v9 decodeIntForKey:@"fh"];
    int v16 = [v9 decodeIntForKey:@"fp"];
    int v17 = [v9 decodeInt32ForKey:@"fr"];
    uint64_t v18 = 0;
    float v19 = (float)v15;
    int v20 = 1;
    do
      v20 &= [v9 containsValueForKey:kBSAnimationSettingsTimingPointsStrings[v18++]];
    while (v18 != 4);
    double v49 = v13;
    float v48 = v19;
    if (v20)
    {
      uint64_t v21 = 0;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      do
      {
        [v9 decodeFloatForKey:kBSAnimationSettingsTimingPointsStrings[v21]];
        *((_DWORD *)&v53 + v21++) = v22;
      }
      while (v21 != 4);
      id CAMediaTimingFunctionClass = getCAMediaTimingFunctionClass();
      LODWORD(v25) = HIDWORD(v53);
      LODWORD(v24) = v53;
      LODWORD(v27) = HIDWORD(v54);
      LODWORD(v26) = v54;
      int v28 = [CAMediaTimingFunctionClass functionWithControlPoints:v24 :v25 :v26 :v27];
      double v29 = v12;
      double v30 = v11;
    }
    else
    {
      double v29 = v12;
      double v30 = v11;
      int v28 = 0;
    }
    double v45 = ((double (**)(void, __CFString *, void, double))v10)[2](v10, @"p", 0, 1.0);
    double v40 = ((double (**)(void, __CFString *, __int16 *, double))v10)[2](v10, @"m", &v52, 0.0);
    uint64_t v41 = ((double (**)(void, __CFString *, __int16 *, double))v10)[2](v10, @"s", &v52, 0.0);
    uint64_t v42 = ((double (**)(void, __CFString *, __int16 *, double))v10)[2](v10, @"d", &v52, 0.0);
    double v43 = ((double (**)(void, __CFString *, __int16 *, double))v10)[2](v10, @"e", &v52, 0.0);
    uint64_t v44 = ((double (**)(void, __CFString *, __int16 *, double))v10)[2](v10, @"v", &v52, 0.0);

    float v32 = v45;
    char v36 = HIBYTE(v52) == 0;
    BOOL v31 = v52 != 0;
    double v34 = v30;
    double v35 = v29;
    double v37 = v49;
    float v38 = v48;
    float v33 = (float)v14;
    float v39 = (float)v16;
  }
  else
  {
    BOOL v31 = 0;
    int v17 = 0;
    int v28 = 0;
    float v32 = 1.0;
    float v33 = 0.0;
    double v34 = 0.0;
    double v35 = 0.0;
    char v36 = 1;
    double v37 = 0.0;
    float v38 = 0.0;
    float v39 = 0.0;
    double v40 = 0.0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    double v43 = 0.0;
    uint64_t v44 = 0;
  }
  v46 = (BSAnimationSettings *)-[BSAnimationSettings _initWithStoredDuration:storedDurationIsDirty:delay:frameInterval:frameRange:highFrameRateReason:timingFunction:speed:mass:stiffness:damping:epsilon:initialVelocity:isSpring:](self, v36, v17, v28, v31, v34, v35, v37, v33, v38, v39, v32, v40, v5, v6, v7, v41, v42, v43,
                                 v44);

  return v46;
}

double __37__BSAnimationSettings_initWithCoder___block_invoke(uint64_t a1, void *a2, unsigned char *a3, double a4)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) containsValueForKey:v7])
  {
    if (a3) {
      *a3 = 1;
    }
    [*(id *)(a1 + 32) decodeDoubleForKey:v7];
    a4 = v8;
  }

  return a4;
}

- (void)_setFrameInterval:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (vabdd_f64(*(double *)(a1 + 32), a2) >= 2.22044605e-16)
    {
      *(double *)(a1 + 32) = a2;
      *(unsigned char *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)_setFrameRange:(float)a3
{
  if (a1)
  {
    double v8 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (*(float *)(a1 + 40) != a2 || *(float *)(a1 + 44) != a3 || *(float *)(a1 + 48) != a4)
    {
      *(float *)(a1 + 40) = a2;
      *(float *)(a1 + 44) = a3;
      *(float *)(a1 + 48) = a4;
      *(unsigned char *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v8);
  }
}

- (void)_setSpeed:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    if (vabds_f32(*(float *)(a1 + 12), a2) >= 0.00000011921)
    {
      *(float *)(a1 + 12) = a2;
      *(unsigned char *)(a1 + 104) = 1;
    }
    os_unfair_lock_unlock(v4);
  }
}

- (double)mass
{
  if (!self->_isSpring)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BSAnimationSettings.m" lineNumber:712 description:@"cannot call mass if not a spring animation"];
  }
  os_unfair_lock_lock(&self->_lock);
  double lock_mass = self->_lock_mass;
  os_unfair_lock_unlock(&self->_lock);
  return lock_mass;
}

- (double)stiffness
{
  if (!self->_isSpring)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BSAnimationSettings.m" lineNumber:720 description:@"cannot call stiffness if not a spring animation"];
  }
  os_unfair_lock_lock(&self->_lock);
  double lock_stiffness = self->_lock_stiffness;
  os_unfair_lock_unlock(&self->_lock);
  return lock_stiffness;
}

- (double)damping
{
  if (!self->_isSpring)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BSAnimationSettings.m" lineNumber:728 description:@"cannot call damping if not a spring animation"];
  }
  os_unfair_lock_lock(&self->_lock);
  double lock_damping = self->_lock_damping;
  os_unfair_lock_unlock(&self->_lock);
  return lock_damping;
}

- (double)epsilon
{
  if (!self->_isSpring)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BSAnimationSettings.m" lineNumber:736 description:@"cannot call epsilon if not a spring animation"];
  }
  os_unfair_lock_lock(&self->_lock);
  double lock_epsilon = self->_lock_epsilon;
  os_unfair_lock_unlock(&self->_lock);
  return lock_epsilon;
}

- (double)initialVelocity
{
  if (!self->_isSpring)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"BSAnimationSettings.m" lineNumber:744 description:@"cannot call initialVelocity if not a spring animation"];
  }
  os_unfair_lock_lock(&self->_lock);
  double lock_initialVelocity = self->_lock_initialVelocity;
  os_unfair_lock_unlock(&self->_lock);
  return lock_initialVelocity;
}

- (void)applyToCAAnimation:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[BSAnimationSettings _lock_applyToCAAnimation:]((uint64_t)self, v5);

  os_unfair_lock_unlock(p_lock);
}

- (double)progressAtTime:(double)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v6 = 0.0;
  if (self->_lock_delay <= a3)
  {
    id v7 = (void *)MEMORY[0x18C125360]();
    if (self->_isSpring)
    {
      id CATransactionClass = getCATransactionClass();
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        [CATransactionClass activate];
        id CATransactionClass = 0;
      }
      else
      {
        [CATransactionClass begin];
        [CATransactionClass activateBackground:1];
      }
      id v9 = [getCASpringAnimationClass() animation];
      -[BSAnimationSettings _lock_applyToCAAnimation:]((uint64_t)self, v9);
    }
    else
    {
      id v9 = 0;
      id CATransactionClass = 0;
    }
    double v10 = -[BSAnimationSettings _lock_duration]((uint64_t)self);
    double lock_delay = self->_lock_delay;
    double v6 = 1.0;
    if (v10 + lock_delay > a3)
    {
      double v6 = 0.0;
      if (v10 > 0.0)
      {
        double v12 = fmax((a3 - lock_delay) / v10, 0.0);
        double v6 = fmin(v12, 1.0);
        lock_timingFunction = self->_lock_timingFunction;
        if (lock_timingFunction)
        {
          *(float *)&double v12 = v6;
          [(CAMediaTimingFunction *)lock_timingFunction _solveForInput:v12];
          double v12 = fmax(v14, 0.0);
          double v6 = fmin(v12, 1.0);
        }
        if (v9)
        {
          *(float *)&double v12 = v6;
          [v9 _solveForInput:v12];
          double v6 = v15;
        }
      }
    }
    if (CATransactionClass) {
      [CATransactionClass commit];
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (unint64_t)hash
{
  v27[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[BSHashBuilder builder];
  os_unfair_lock_lock(&self->_lock);
  if (!self->_isSpring) {
    id v4 = (id)[v3 appendDouble:-[BSAnimationSettings _lock_duration]((uint64_t)self)];
  }
  id v5 = (id)[v3 appendDouble:self->_lock_delay];
  id v6 = (id)[v3 appendDouble:self->_lock_frameInterval];
  id v7 = (id)[v3 appendInt64:(uint64_t)self->_lock_frameRange.minimum];
  id v8 = (id)[v3 appendInt64:(uint64_t)self->_lock_frameRange.maximum];
  id v9 = (id)[v3 appendInt64:(uint64_t)self->_lock_frameRange.preferred];
  id v10 = (id)[v3 appendInt64:self->_lock_highFrameRateReason];
  char v11 = 0;
  uint64_t v12 = 1;
  do
  {
    char v13 = v11;
    v27[0] = 0;
    [(CAMediaTimingFunction *)self->_lock_timingFunction getControlPointAtIndex:v12 values:v27];
    LODWORD(v14) = v27[0];
    float v15 = [v3 appendFloat:v14];
    LODWORD(v16) = HIDWORD(v27[0]);
    id v17 = (id)[v15 appendFloat:v16];

    char v11 = 1;
    uint64_t v12 = 2;
  }
  while ((v13 & 1) == 0);
  *(float *)&double v18 = self->_lock_speed;
  id v19 = (id)objc_msgSend(v3, "appendFloat:", 2, v18);
  if (self->_isSpring)
  {
    id v20 = (id)[v3 appendCGFloat:self->_lock_mass];
    id v21 = (id)[v3 appendCGFloat:self->_lock_stiffness];
    id v22 = (id)[v3 appendCGFloat:self->_lock_damping];
    id v23 = (id)[v3 appendCGFloat:self->_lock_epsilon];
    id v24 = (id)[v3 appendCGFloat:self->_lock_initialVelocity];
  }
  os_unfair_lock_unlock(&self->_lock);
  unint64_t v25 = [v3 hash];

  return v25;
}

@end