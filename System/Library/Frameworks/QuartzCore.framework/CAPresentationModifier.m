@interface CAPresentationModifier
- (BOOL)additive;
- (BOOL)isEnabled;
- (CAPresentationModifier)init;
- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 additive:(BOOL)a5;
- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 additive:(BOOL)a5 group:(id)a6;
- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 initialVelocity:(id)a5 additive:(BOOL)a6 preferredFrameRateRangeMaximum:(int)a7 group:(id)a8;
- (CAPresentationModifierGroup)group;
- (NSString)keyPath;
- (Object)CA_copyRenderValue;
- (id)debugDescription;
- (id)value;
- (void)dealloc;
- (void)setEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)setValue:(id)a3 velocity:(id)a4;
- (void)write;
@end

@implementation CAPresentationModifier

- (id)value
{
  p_l = (os_unfair_lock_s *)&self->_l;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_l);
  id v4 = self->_value;
  os_unfair_lock_unlock(p_l);
  return v4;
}

- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 initialVelocity:(id)a5 additive:(BOOL)a6 preferredFrameRateRangeMaximum:(int)a7 group:(id)a8
{
  BOOL v10 = a6;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v49.receiver = self;
  v49.super_class = (Class)CAPresentationModifier;
  v14 = [(CAPresentationModifier *)&v49 init];
  if (!v14) {
    return v14;
  }
  uint64_t v15 = objc_msgSend(a4, "CA_numericValueCount");
  unint64_t v16 = (16 * v15) | 8;
  if ((unint64_t)(v15 - 0x1000000000000000) < 0xF000000000000001) {
    unint64_t v16 = 0;
  }
  if (is_mul_ok(v16, 3uLL)) {
    unint64_t v17 = 3 * v16;
  }
  else {
    unint64_t v17 = 0;
  }
  if ((unint64_t)(v15 - 0x1000000000000000) < 0xF000000000000001 || !v17)
  {
    [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifier", @"%@: too large count (%zu) for value (%@)", v14, v15, a4 format];
    goto LABEL_50;
  }
  if (a8)
  {
    uint64_t v18 = objc_msgSend(a8, "nextSlotWithPayloadSize:");
    uint64_t v19 = [a8 shmem];
    v20 = (_DWORD *)v19;
    if (v19 && !atomic_fetch_add((atomic_uint *volatile)(v19 + 8), 1u))
    {
      v20 = 0;
      atomic_fetch_add((atomic_uint *volatile)(v19 + 8), 0xFFFFFFFF);
    }
    id v46 = a5;
    uint64_t v21 = *((void *)v20 + 3) + *((void *)v20 + 2);
    v22 = (_DWORD *)(v21 - 8 * v18);
    *(v22 - 2) = v15;
    int v47 = a7;
    if (v18)
    {
      BOOL v23 = v10;
      int v24 = *(_DWORD *)(v21 - 8 * v18 + 4);
      if (*v22) {
        int v25 = 48 * *v22 + 24;
      }
      else {
        int v25 = 0;
      }
      int v26 = v24 + v25;
    }
    else
    {
      BOOL v23 = v10;
      int v26 = 0;
    }
  }
  else
  {
    BOOL v27 = v17 >= 0xFFFFFFFFFFFFFFF8;
    if (v17 + 8 >= 0xFFFFFFFFFFFFFFD8) {
      BOOL v27 = 1;
    }
    if (v27) {
      v28 = 0;
    }
    else {
      v28 = (CA::Render::Shmem *)(v17 + 48);
    }
    v29 = CA::Render::Shmem::new_shmem(v28);
    if (!v29) {
      goto LABEL_50;
    }
    v20 = v29;
    id v46 = a5;
    BOOL v23 = v10;
    int v47 = a7;
    int v26 = 0;
    uint64_t v18 = 0;
    uint64_t v30 = *((void *)v29 + 3);
    *(_DWORD *)(v30 + 12) = 1;
    v22 = (_DWORD *)(v30 + *((void *)v29 + 2));
    *(v22 - 2) = v15;
  }
  *(v22 - 1) = v26;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v32 = (CA::Render **)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x30uLL, 0x743898A5uLL);
  if (!v32)
  {
LABEL_50:

    return 0;
  }
  v34 = v32;
  *((_DWORD *)v32 + 2) = 1;
  *((_DWORD *)v32 + 3) = 42;
  ++dword_1EB2ADE70;
  *v32 = (CA::Render *)&unk_1ED02ED30;
  v32[2] = (CA::Render *)v20;
  v32[3] = (CA::Render *)v18;
  v32[4] = 0;
  unint64_t v48 = 0;
  CA::Render::key_path_set((CA::Render *)&v48, (CFStringRef)a3, v33);
  unint64_t v36 = v48;
  if (!v48) {
    goto LABEL_31;
  }
  if (v48)
  {
    unint64_t v37 = v48 >> 1;
    goto LABEL_33;
  }
  if (*(_DWORD *)v48) {
    LODWORD(v37) = *(_DWORD *)(v48 + 4);
  }
  else {
LABEL_31:
  }
    LODWORD(v37) = 0;
LABEL_33:
  CA::Render::key_path_free(v34[4], v35);
  v34[4] = (CA::Render *)v36;
  if (v23) {
    int v38 = 256;
  }
  else {
    int v38 = 0;
  }
  unsigned int v39 = *((_DWORD *)v34 + 3) & 0xFFFFF8FF | v38;
  if (v46)
  {
    uint64_t v40 = 0;
    while (v37 != (unsigned __int16)-[CAPresentationModifier initWithKeyPath:initialValue:initialVelocity:additive:preferredFrameRateRangeMaximum:group:]::velocity_atoms[v40])
    {
      if (++v40 == 7) {
        goto LABEL_40;
      }
    }
    int v41 = 512;
  }
  else
  {
LABEL_40:
    int v41 = 0;
  }
  BOOL v42 = v37 == 409 || v37 == 257;
  int v43 = v39 | v41;
  if (v42) {
    int v44 = 1024;
  }
  else {
    int v44 = 0;
  }
  *((_DWORD *)v34 + 3) = v43 | v44;
  *((_DWORD *)v34 + 10) = v47;
  v14->_impl = v34;
  v14->_keyPath = (id)[a3 copy];
  v14->_group = (CAPresentationModifierGroup *)a8;
  v14->_value_count = v15;
  v14->_f = 1;
  [(CAPresentationModifier *)v14 setValue:a4 velocity:v46];
  return v14;
}

- (void)setValue:(id)a3 velocity:(id)a4
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifier", @"%@: value can't be nil", self format];
  }
  if (self->_value != a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&self->_l);

    self->_value = a3;
    self->_velocity = a4;
    os_unfair_lock_unlock((os_unfair_lock_t)&self->_l);
    [(CAPresentationModifier *)self write];
    if (BYTE9(xmmword_1EB2ACC10))
    {
      kdebug_trace();
    }
  }
}

- (void)write
{
  v37[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(self->_value, "CA_numericValueCount");
  uint64_t v4 = objc_msgSend(self->_velocity, "CA_numericValueCount");
  uint64_t v5 = v4;
  unint64_t value_count = self->_value_count;
  if (v3 != value_count) {
    uint64_t v4 = [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifier", @"%@: value has more elements (%zu) than initial value (%zu)", self, v3, value_count format];
  }
  if (v5) {
    BOOL v7 = v5 == v3;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7) {
    uint64_t v4 = [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifier", @"%@: velocity value has more elements (%zu) than value (%zu)", self, v5, v3 format];
  }
  unint64_t v8 = 16 * v3;
  if ((unint64_t)(16 * v3) > 0x1000)
  {
    v9 = (char *)malloc_type_malloc(16 * v3, 0xB6B4A175uLL);
  }
  else
  {
    MEMORY[0x1F4188790](v4);
    v9 = (char *)v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v9, 16 * v3);
  }
  unint64_t v10 = objc_msgSend(self->_value, "CA_copyNumericValue:", v9);
  unint64_t v11 = objc_msgSend(self->_velocity, "CA_copyNumericValue:", &v9[8 * v3]);
  unint64_t v12 = v11;
  unint64_t v13 = self->_value_count;
  if (v10 <= v13 && v11 <= v13)
  {
    if (v11) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifier", @"%@: copied value count (%zu) doesn't match the initial count (%zu)", self, v10, v13 format];
  if (!v12) {
LABEL_16:
  }
    bzero(&v9[8 * self->_value_count], v8 >> 1);
LABEL_17:
  unsigned int f = self->_f;
  impl = self->_impl;
  uint64_t v17 = impl[3];
  group = self->_group;
  if (group) {
    uint64_t v19 = [(CAPresentationModifierGroup *)group shmem];
  }
  else {
    uint64_t v19 = impl[2];
  }
  unint64_t v21 = *(void *)(v19 + 16);
  v20 = *(atomic_uint **)(v19 + 24);
  unint64_t v22 = v21 - 40;
  if (v21 >= 0x28 && v17 < v22 >> 3)
  {
    uint64_t v23 = (uint64_t)v20 + v21 + -8 * v17;
    uint64_t v24 = *(unsigned int *)(v23 - 8);
    if (v24)
    {
      uint64_t v25 = 2 * v3;
      uint64_t v26 = (16 * v24) | 8;
      unint64_t v27 = *(unsigned int *)(v23 - 4);
      uint64_t v28 = 2 * v24;
      BOOL v29 = v22 < v27 || 3 * v26 + v27 > v22;
      if (!v29 && v28 == v25)
      {
        if (v20[1]) {
          uint64_t v26 = 0;
        }
        *(_WORD *)((char *)v20 + v27 + v26 + 40) = f & 1;
        v31 = (void *)((char *)v20 + v27 + v26 + 48);
        v32 = v9;
        do
        {
          uint64_t v33 = *(void *)v32;
          v32 += 8;
          *v31++ = v33;
          --v25;
        }
        while (v25);
      }
    }
  }
  v34 = self->_group;
  if (v34)
  {
    [(CAPresentationModifierGroup *)v34 markWritten:v17];
  }
  else
  {
    v20[1] = v20[1] == 0;
    do
    {
      int v35 = *v20 & 0x7FFFFFFF;
      int v36 = v35;
      atomic_compare_exchange_strong(v20, (unsigned int *)&v36, *v20 & 0x7FFFFFFE | v20[1]);
    }
    while (v36 != v35);
  }
  if (v8 > 0x1000) {
    free(v9);
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = (atomic_uint *)self->_impl;
  if (impl && atomic_fetch_add(impl + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *, SEL))(*(void *)impl + 16))(impl, a2);
  }

  v4.receiver = self;
  v4.super_class = (Class)CAPresentationModifier;
  [(CAPresentationModifier *)&v4 dealloc];
}

- (Object)CA_copyRenderValue
{
  group = self->_group;
  if (group)
  {
    uint64_t v4 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (v4)
    {
      uint64_t v5 = *(void *)(v4 + 40);
      if (v5)
      {
        if (*(void *)(v5 + 208)) {
          [(CAPresentationModifierGroup *)group _setLocalContextId:(*(uint64_t (**)(void))(*(void *)(v5 + 216) + 16))()];
        }
      }
    }
    impl = self->_impl;
    uint64_t v7 = [(CAPresentationModifierGroup *)group shmem];
    unint64_t v8 = (atomic_uint *)*((void *)impl + 2);
    if (v8 != (atomic_uint *)v7)
    {
      if (v8 && atomic_fetch_add(v8 + 2, 0xFFFFFFFF) == 1) {
        (*(void (**)(atomic_uint *))(*(void *)v8 + 16))(v8);
      }
      if (v7)
      {
        v9 = (atomic_uint *)(v7 + 8);
        if (!atomic_fetch_add((atomic_uint *volatile)(v7 + 8), 1u))
        {
          uint64_t v7 = 0;
          atomic_fetch_add(v9, 0xFFFFFFFF);
        }
      }
      *((void *)impl + 2) = v7;
    }
  }
  result = (Object *)self->_impl;
  if (result)
  {
    p_var1 = &result->var1;
    if (!atomic_fetch_add(&result->var1.var0.var0, 1u))
    {
      result = 0;
      atomic_fetch_add(&p_var1->var0.var0, 0xFFFFFFFF);
    }
  }
  return result;
}

- (CAPresentationModifierGroup)group
{
  return self->_group;
}

- (void)setValue:(id)a3
{
}

- (NSString)keyPath
{
  return (NSString *)self->_keyPath;
}

- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 additive:(BOOL)a5 group:(id)a6
{
  return [(CAPresentationModifier *)self initWithKeyPath:a3 initialValue:a4 initialVelocity:0 additive:a5 preferredFrameRateRangeMaximum:0 group:a6];
}

- (BOOL)isEnabled
{
  return self->_f & 1;
}

- (void)setEnabled:(BOOL)a3
{
  self->_unsigned int f = self->_f & 0xFFFFFFFE | a3;
  [(CAPresentationModifier *)self write];
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; keyPath = %@; additive = %d>",
               NSStringFromClass(v4),
               self,
               [(CAPresentationModifier *)self keyPath],
               [(CAPresentationModifier *)self additive]);
}

- (BOOL)additive
{
  return *((unsigned char *)self->_impl + 13) & 1;
}

- (CAPresentationModifier)init
{
  return 0;
}

- (CAPresentationModifier)initWithKeyPath:(id)a3 initialValue:(id)a4 additive:(BOOL)a5
{
  return [(CAPresentationModifier *)self initWithKeyPath:a3 initialValue:a4 initialVelocity:0 additive:a5 preferredFrameRateRangeMaximum:0 group:0];
}

@end