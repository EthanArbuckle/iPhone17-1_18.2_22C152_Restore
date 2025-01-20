@interface CAAnimation
+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3;
+ (BOOL)CA_encodesPropertyConditionally:(unsigned int)a3 type:(int)a4;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (BOOL)supportsSecureCoding;
+ (CAAnimation)animation;
+ (id)defaultValueForKey:(NSString *)key;
+ (void)CAMLParserStartElement:(id)a3;
+ (void)CA_getterForProperty:(const _CAPropertyInfo *)a3;
+ (void)CA_setterForProperty:(const _CAPropertyInfo *)a3;
- (BOOL)CAMLTypeSupportedForKey:(id)a3;
- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4;
- (BOOL)autoreverses;
- (BOOL)discretizesTime;
- (BOOL)isCompleteForTime:(double)a3;
- (BOOL)isEnabled;
- (BOOL)isRemovedOnCompletion;
- (BOOL)shouldArchiveValueForKey:(NSString *)key;
- (CAAnimation)initWithCoder:(id)a3;
- (CAFrameRateRange)preferredFrameRateRange;
- (CAMediaTimingFunction)timingFunction;
- (NSString)beginTimeMode;
- (NSString)fillMode;
- (Object)CA_copyRenderValue;
- (double)beginTime;
- (double)duration;
- (double)frameInterval;
- (double)repeatDuration;
- (double)timeOffset;
- (float)preferredFrameRateRangeMaximum;
- (float)preferredFrameRateRangeMinimum;
- (float)preferredFrameRateRangePreferred;
- (float)repeatCount;
- (float)speed;
- (id)CAMLTypeForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)delegate;
- (id)valueForKey:(id)a3;
- (id)valueForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)preferredFramesPerSecond;
- (unsigned)_propertyFlagsForLayer:(id)a3;
- (unsigned)highFrameRateReason;
- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5;
- (void)setAutoreverses:(BOOL)a3;
- (void)setBeginTime:(double)a3;
- (void)setBeginTimeMode:(id)a3;
- (void)setDefaultDuration:(double)a3;
- (void)setDelegate:(id)delegate;
- (void)setDiscretizesTime:(BOOL)a3;
- (void)setDuration:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFillMode:(id)a3;
- (void)setFrameInterval:(double)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange;
- (void)setPreferredFrameRateRangeMaximum:(float)a3;
- (void)setPreferredFrameRateRangeMinimum:(float)a3;
- (void)setPreferredFrameRateRangePreferred:(float)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion;
- (void)setRepeatCount:(float)a3;
- (void)setRepeatDuration:(double)a3;
- (void)setSpeed:(float)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTimingFunction:(CAMediaTimingFunction *)timingFunction;
- (void)setValue:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKeyPath:(id)a4;
- (void)setValue:(id)a3 forUndefinedKey:(id)a4;
@end

@implementation CAAnimation

- (NSString)beginTimeMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 58, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setBeginTimeMode:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x3A, 3, (unsigned __int8 *)v3);
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (self->_attr)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3) {
      v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    }
    int v4 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v4 + 1;
    if (!v4) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    attr = (CA::AttrList *)self->_attr;
    if (attr) {
      CA::AttrList::free(attr, a2);
    }
    self->_attr = 0;
    CA::Transaction::unlock(v3);
  }
  CAMediaTimingInvalidate((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)CAAnimation;
  [(CAAnimation *)&v6 dealloc];
}

+ (id)defaultValueForKey:(NSString *)key
{
  int v3 = CAInternAtom((const __CFString *)key, 1);
  if (v3 > 222)
  {
    if (v3 > 525)
    {
      if (v3 == 577) {
        return @"fade";
      }
      if (v3 == 526) {
        goto LABEL_15;
      }
    }
    else
    {
      if (v3 == 223) {
        return @"removed";
      }
      if (v3 == 466) {
        return (id)*MEMORY[0x1E4F1CFD0];
      }
    }
    return 0;
  }
  if (v3 > 211)
  {
    if (v3 != 212)
    {
      if (v3 != 216) {
        return 0;
      }
LABEL_15:
      id result = (id)+[CAAnimation defaultValueForKey:]::one;
      if (!+[CAAnimation defaultValueForKey:]::one)
      {
        id result = (id)[objc_alloc(NSNumber) initWithInt:1];
        +[CAAnimation defaultValueForKey:]::one = (uint64_t)result;
      }
      return result;
    }
    return (id)*MEMORY[0x1E4F1CFD0];
  }
  if (v3 != 58)
  {
    if (v3 == 80) {
      return @"linear";
    }
    return 0;
  }
  return @"non-zero";
}

+ (BOOL)CA_encodesPropertyConditionally:(unsigned int)a3 type:(int)a4
{
  BOOL v4 = a3 == 165;
  if (a4 == 4) {
    BOOL v4 = 1;
  }
  return a4 == 1 || v4;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  return (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && (Class)objc_opt_class() != a3
      && objc_opt_class() != (void)a3;
}

- (CAAnimation)initWithCoder:(id)a3
{
  return (CAAnimation *)CAObject_initWithCoder(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = (CA::Transaction *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v6 = v4;
  if (v4)
  {
    uint64_t v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v7) {
      uint64_t v7 = (CA::Transaction *)CA::Transaction::create(v4);
    }
    *((_DWORD *)v6 + 4) = 0;
    int v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8) {
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    }
    v9 = (CA::AttrList *)*((void *)v6 + 1);
    if (v9) {
      CA::AttrList::free(v9, v5);
    }
    attr = (CA::AttrList *)self->_attr;
    if (attr)
    {
      uint64_t v11 = *((void *)attr + 1) & 7;
      if (v11 == 7) {
        attr = (CA::AttrList *)CA::AttrList::copy_(attr);
      }
      else {
        *((void *)attr + 1) = *((void *)attr + 1) & 0xFFFFFFFFFFFFFFF8 | (v11 + 1);
      }
    }
    *((void *)v6 + 1) = attr;
    CA::Transaction::unlock(v7);
  }
  return v6;
}

- (void)runActionForKey:(id)a3 object:(id)a4 arguments:(id)a5
{
}

- (void)setTimingFunction:(CAMediaTimingFunction *)timingFunction
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = timingFunction;
  CAAnimation_setter((uint64_t)self, (const void *)0x22F, 2, (unsigned __int8 *)v3);
}

- (void)setFillMode:(id)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xDF, 3, (unsigned __int8 *)v3);
}

- (void)setDuration:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)int v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xBF, 18, (unsigned __int8 *)v3);
}

- (void)setBeginTime:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)int v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x39, 18, (unsigned __int8 *)v3);
}

- (double)beginTime
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 57, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (id)delegate
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 165, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (double)duration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 191, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (float)speed
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 526, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (float)repeatCount
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 469, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (BOOL)autoreverses
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 49, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (double)repeatDuration
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 470, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (double)timeOffset
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 558, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v3);
  return *(double *)v3;
}

- (NSString)fillMode
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 223, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

+ (CAAnimation)animation
{
  id v2 = objc_alloc_init((Class)a1);

  return (CAAnimation *)v2;
}

- (void)setRemovedOnCompletion:(BOOL)removedOnCompletion
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = removedOnCompletion;
  CAAnimation_setter((uint64_t)self, (const void *)0x1D2, 7, (unsigned __int8 *)&v3);
}

- (void)setRepeatCount:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1D5, 17, (unsigned __int8 *)&v3);
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  *((void *)a3 + 2) = self;
  objc_super v6 = (atomic_uint *)CAMediaTimingCopyRenderTiming((unint64_t)self);
  if (v6)
  {
    uint64_t v7 = (atomic_uint *)*((void *)a3 + 5);
    if (v7 != v6)
    {
      if (v7 && atomic_fetch_add(v7 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v7 + 16))(v7);
      }
      int v8 = v6;
      if (!atomic_fetch_add(v6 + 2, 1u))
      {
        int v8 = 0;
        atomic_fetch_add(v6 + 2, 0xFFFFFFFF);
      }
      *((void *)a3 + 5) = v8;
    }
  }
  BOOL v9 = [(CAAnimation *)self isEnabled];
  if ([(CAAnimation *)self isRemovedOnCompletion]) {
    int v10 = v9 | 8;
  }
  else {
    int v10 = v9;
  }
  uint64_t v11 = [(CAAnimation *)self timingFunction];
  if (v11)
  {
    [(CAMediaTimingFunction *)v11 _getPoints:&v23];
    v13 = CA::Render::Vector::new_vector((CA::Render::Vector *)4, &v23, v12);
    v14 = (atomic_uint *)*((void *)a3 + 6);
    if (v14 != v13)
    {
      if (v14 && atomic_fetch_add(v14 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v14 + 16))(v14);
      }
      if (v13)
      {
        v15 = v13;
        if (!atomic_fetch_add(v13 + 2, 1u))
        {
          v15 = 0;
          atomic_fetch_add(v13 + 2, 0xFFFFFFFF);
        }
      }
      else
      {
        v15 = 0;
      }
      *((void *)a3 + 6) = v15;
    }
    if (v13 && atomic_fetch_add(v13 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v13 + 16))(v13);
    }
  }
  [(CAAnimation *)self preferredFrameRateRange];
  *((_DWORD *)a3 + 6) = v16;
  *((_DWORD *)a3 + 7) = v17;
  *((_DWORD *)a3 + 8) = v18;
  if (CAHighFrameRateRestrictionEnabled(void)::once != -1) {
    dispatch_once(&CAHighFrameRateRestrictionEnabled(void)::once, &__block_literal_global_6);
  }
  if (CAHighFrameRateRestrictionEnabled(void)::enabled)
  {
    unsigned int v19 = [(CAAnimation *)self highFrameRateReason];
    v10 |= 0x8000u;
    if (!v19)
    {
      if (CADeviceDisableMinimumFrameDurationOnPhone::once != -1) {
        dispatch_once(&CADeviceDisableMinimumFrameDurationOnPhone::once, &__block_literal_global_147);
      }
      if (CADeviceDisableMinimumFrameDurationOnPhone::disabled) {
        unsigned int v19 = 65537;
      }
      else {
        unsigned int v19 = 0;
      }
    }
    *((_DWORD *)a3 + 22) = v19;
  }
  if (byte_1EB2ACC47)
  {
    *((int32x2_t *)a3 + 3) = vdup_n_s32(0x42F00000u);
    *((_DWORD *)a3 + 8) = 1123024896;
    if (!*((_DWORD *)a3 + 22)) {
      *((_DWORD *)a3 + 22) = 1;
    }
  }
  BOOL v20 = [(CAAnimation *)self discretizesTime];
  int v21 = v10 | 0x80;
  if (!v20) {
    int v21 = v10;
  }
  if (v21) {
    *((_DWORD *)a3 + 3) |= v21 << 8;
  }
  if (v6 && atomic_fetch_add(v6 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *))(*(void *)v6 + 16))(v6);
  }
  return 1;
}

- (unsigned)highFrameRateReason
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 259, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (CAMediaTimingFunction)timingFunction
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 559, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (CAMediaTimingFunction *)v3[0];
}

- (BOOL)isEnabled
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 212, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)isRemovedOnCompletion
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 466, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (BOOL)discretizesTime
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  char v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 182, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  [(CAAnimation *)self preferredFrameRateRangeMinimum];
  float v4 = v3;
  [(CAAnimation *)self preferredFrameRateRangeMaximum];
  float v6 = v5;
  [(CAAnimation *)self preferredFrameRateRangePreferred];
  float v8 = v7;
  float v9 = v4;
  float v10 = v6;
  result.preferred = v8;
  result.maximum = v10;
  result.minimum = v9;
  return result;
}

- (float)preferredFrameRateRangeMinimum
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 442, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (float)preferredFrameRateRangeMaximum
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 441, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (float)preferredFrameRateRangePreferred
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 443, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  unsigned int v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x103, 12, (unsigned __int8 *)&v3);
}

- (void)setPreferredFrameRateRangePreferred:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1BB, 17, (unsigned __int8 *)&v3);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange
{
  float preferred = preferredFrameRateRange.preferred;
  float maximum = preferredFrameRateRange.maximum;
  float minimum = preferredFrameRateRange.minimum;
  if (!CAFrameRateRangeIsValid(preferredFrameRateRange.minimum, preferredFrameRateRange.maximum, preferredFrameRateRange.preferred))
  {
    uint64_t v10 = [NSString stringWithFormat:@"invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)", minimum, maximum, preferred];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v10 userInfo:0]);
  }
  *(float *)&double v7 = minimum;
  [(CAAnimation *)self setPreferredFrameRateRangeMinimum:v7];
  *(float *)&double v8 = maximum;
  [(CAAnimation *)self setPreferredFrameRateRangeMaximum:v8];
  *(float *)&double v9 = preferred;

  [(CAAnimation *)self setPreferredFrameRateRangePreferred:v9];
}

- (void)setPreferredFrameRateRangeMinimum:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1BA, 17, (unsigned __int8 *)&v3);
}

- (void)setPreferredFrameRateRangeMaximum:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1B9, 17, (unsigned __int8 *)&v3);
}

- (void)setDelegate:(id)delegate
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = delegate;
  CAAnimation_setter((uint64_t)self, (const void *)0xA5, 2, (unsigned __int8 *)v3);
}

- (void)setSpeed:(float)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  float v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x20E, 17, (unsigned __int8 *)&v3);
}

- (id)CAMLTypeForKey:(id)a3
{
  return CAObject_CAMLTypeForKey((uint64_t)self, (const __CFString *)a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  double v7 = (objc_class *)+[CAAnimation superclass];

  CAObject_setValueForKey(self, v7, a3, (const __CFString *)a4);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::lock);
  id v5 = (id)-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys;
  if (!-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    -[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys = (uint64_t)v5;
  }
  if (([v5 containsObject:a3] & 1) == 0)
  {
    if (!CAObject_CAMLTypeSupportedForKey((uint64_t)self, (const __CFString *)a3))
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
    [(id)-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::keys addObject:a3];
  }
  BOOL v6 = 1;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&-[CAAnimation(CAAnimationPrivate) CAMLTypeSupportedForKey:]::lock);
  return v6;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
}

- (void)setDefaultDuration:(double)a3
{
  [(CAAnimation *)self duration];
  if (v5 <= 0.0)
  {
    [(CAAnimation *)self setDuration:a3];
  }
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4 = objc_alloc_init((Class)a1);
  [a3 setElementValue:v4];
}

+ (void)CA_setterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 0);
}

+ (void)CA_getterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 1);
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return CAObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (void)setFrameInterval:(double)a3
{
  double v5 = 0.0;
  if (a3 != 0.0)
  {
    double v3 = 1.0;
    double v5 = 1.0 / a3;
    a3 = round(1.0 / a3);
    LODWORD(v5) = 1.0;
    if (a3 >= 1.0) {
      *(float *)&double v5 = (float)(uint64_t)a3;
    }
  }
  LODWORD(a3) = LODWORD(v5);
  LODWORD(v3) = LODWORD(v5);
  -[CAAnimation setPreferredFrameRateRange:](self, "setPreferredFrameRateRange:", v5, a3, v3);
}

- (void)setAutoreverses:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x31, 7, (unsigned __int8 *)&v3);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v11[0] = a3;
  BOOL v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v6) {
    BOOL v6 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  double v7 = (const void *)CAInternAtom((const __CFString *)a4, 1);
  -[CAAnimation willChangeValueForKey:](self, "willChangeValueForKey:", a4, v11[0]);
  int v8 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v8 + 1;
  if (!v8) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  attr = (CA::AttrList *)self->_attr;
  if (!attr)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    attr = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
  }
  self->_attr = CA::AttrList::set(attr, v7, 2, (unsigned __int8 *)v11);
  CA::Transaction::unlock(v6);

  [(CAAnimation *)self didChangeValueForKey:a4];
}

- (id)valueForUndefinedKey:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  double v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    double v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = CAInternAtom((const __CFString *)a3, 1);
  int v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  attr = self->_attr;
  if (attr)
  {
    v11[0] = 0;
    int v9 = CA::AttrList::get((uint64_t)attr, v6, (const CGAffineTransform *)1, (CA::Mat4Impl *)v11);
    CA::Transaction::unlock(v5);
    if (v9) {
      return (id)v11[0];
    }
    else {
      return 0;
    }
  }
  else
  {
    CA::Transaction::unlock(v5);
    return 0;
  }
}

- (id)valueForKey:(id)a3
{
  double v5 = (objc_class *)+[CAAnimation superclass];

  return CAObject_valueForKey(self, v5, (const __CFString *)a3);
}

- (void)setRepeatDuration:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1D6, 18, (unsigned __int8 *)v3);
}

- (void)setTimeOffset:(double)a3
{
  v3[1] = *MEMORY[0x1E4F143B8];
  *(double *)BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x22E, 18, (unsigned __int8 *)v3);
}

- (id)debugDescription
{
  BOOL v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3) {
    BOOL v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  uint64_t v4 = (__CFString *)[MEMORY[0x1E4F28E78] string];
  double v5 = (objc_class *)objc_opt_class();
  [(__CFString *)v4 appendFormat:@"<%@:%p; ", NSStringFromClass(v5), self];
  int v6 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v6 + 1;
  if (!v6) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  attr = (CA::AttrList **)self->_attr;
  if (attr) {
    CA::AttrList::append_description(*attr, v4);
  }
  CA::Transaction::unlock(v3);
  [(__CFString *)v4 appendString:@">"];
  return v4;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)shouldArchiveValueForKey:(NSString *)key
{
  double v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5) {
    double v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  }
  int v6 = CAInternAtom((const __CFString *)key, 1);
  int v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7) {
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  }
  attr = self->_attr;
  if (attr)
  {
    while (1)
    {
      attr = *(_DWORD **)attr;
      BOOL v9 = attr != 0;
      if (!attr) {
        break;
      }
      if ((attr[2] & 0xFFFFFF) == v6)
      {
        BOOL v9 = 1;
        break;
      }
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  CA::Transaction::unlock(v5);
  return v9;
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  uint64_t v4 = (objc_class *)objc_opt_class();

  return CAObject_automaticallyNotifiesObserversForKey(v4, (const __CFString *)a3);
}

- (BOOL)isCompleteForTime:(double)a3
{
  v5[1] = *(double *)MEMORY[0x1E4F143B8];
  v5[0] = a3;
  int v4 = 0;
  return mapAnimationTime(self, v5, &v4) ^ 1;
}

- (void)setDiscretizesTime:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xB6, 7, (unsigned __int8 *)&v3);
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  BOOL v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0xD4, 7, (unsigned __int8 *)&v3);
}

- (int64_t)preferredFramesPerSecond
{
  [(CAAnimation *)self preferredFrameRateRangePreferred];
  return (uint64_t)v2;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  *(float *)&double v3 = (float)a3;
  *(float *)&double v4 = (float)a3;
  *(float *)&double v5 = (float)a3;
  -[CAAnimation setPreferredFrameRateRange:](self, "setPreferredFrameRateRange:", v3, v4, v5);
}

- (double)frameInterval
{
  [(CAAnimation *)self preferredFrameRateRangePreferred];
  if ((uint64_t)v2) {
    return 1.0 / (double)(uint64_t)v2;
  }
  else {
    return 0.0;
  }
}

- (void)encodeWithCAMLWriter:(id)a3
{
}

- (Object)CA_copyRenderValue
{
  return (Object *)[(CAAnimation *)self _copyRenderAnimationForLayer:0];
}

@end