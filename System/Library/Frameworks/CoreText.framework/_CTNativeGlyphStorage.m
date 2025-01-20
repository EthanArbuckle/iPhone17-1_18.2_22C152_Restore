@interface _CTNativeGlyphStorage
+ (id)newWithCount:(int64_t)a3 capacity:(int64_t)a4;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)implementsOrigins;
- (CGPoint)originAtIndex:(int64_t)a3;
- (_CTNativeGlyphStorage)initWithCount:(int64_t)a3 capacity:(int64_t)a4;
- (_CTNativeGlyphStorage)retain;
- (const)allocatedAdvances;
- (id)copyWithRange:(id)a3;
- (int64_t)attachmentCountAtIndex:(int64_t)a3;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)initGlyphStackWithCapacity:(int64_t)a3;
- (void)insertGlyphsAtRange:(id)a3;
- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4;
- (void)popGlyphAtIndex:(int64_t)a3;
- (void)puntStringIndicesInRange:(id)a3 by:(int64_t)a4;
- (void)pushGlyphAtIndex:(int64_t)a3;
- (void)release;
- (void)setAdvance:(CGSize)a3 atIndex:(int64_t)a4;
- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4;
- (void)setGlyph:(unsigned __int16)a3 atIndex:(int64_t)a4;
- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4;
- (void)setProps:(unsigned int)a3 atIndex:(int64_t)a4;
- (void)setStringIndex:(int64_t)a3 atIndex:(int64_t)a4;
- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4;
@end

@implementation _CTNativeGlyphStorage

- (void)release
{
  os_unfair_lock_lock_with_options();
  unint64_t retainCount = self->_retainCount;
  if (retainCount)
  {
    self->_unint64_t retainCount = retainCount - 1;
    os_unfair_lock_unlock((os_unfair_lock_t)&sRetainLock);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&sRetainLock);
    [(_CTNativeGlyphStorage *)self dealloc];
  }
}

- (void)setGlyph:(unsigned __int16)a3 atIndex:(int64_t)a4
{
  self->super._glyphs[a4] = a3;
}

- (void)setProps:(unsigned int)a3 atIndex:(int64_t)a4
{
  self->super._props[a4] = a3;
}

- (void)setAdvance:(CGSize)a3 atIndex:(int64_t)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  advances = self->super._advances;
  if (advances || a3.height != 0.0)
  {
    if (advances
      || ([(_CTNativeGlyphStorage *)self allocatedAdvances],
          (advances = self->super._advances) != 0))
    {
      p_CGFloat width = &advances[a4].width;
      *p_CGFloat width = width;
      p_width[1] = height;
    }
  }
  else
  {
    self->super._advanceWidths[a4] = a3.width;
  }
}

- (_CTNativeGlyphStorage)retain
{
  return self;
}

- (void)setStringIndex:(int64_t)a3 atIndex:(int64_t)a4
{
  self->super._stringIndices[a4] = a3;
}

- (void)puntStringIndicesInRange:(id)a3 by:(int64_t)a4
{
  if (a3.var1)
  {
    v4 = &self->super._stringIndices[a3.var0];
    int64_t v5 = 8 * a3.var1;
    do
    {
      *v4++ += a4;
      v5 -= 8;
    }
    while (v5);
  }
}

- (void)dealloc
{
  free(self->_stack);
  advanceWidths = (double *)self->super._advanceWidths;
  if (advanceWidths != self->_preallocatedStorage) {
    free(advanceWidths);
  }
  free((void *)self->super._advances);
  free((void *)self->_attachCounts);
  free((void *)self->_origins);
  if (!self->_preallocatedStorage) {
    goto LABEL_6;
  }
  os_unfair_lock_lock_with_options();
  if (qword_1EB2CDE68)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_13);
LABEL_6:
    v5.receiver = self;
    v5.super_class = (Class)_CTNativeGlyphStorage;
    [(_CTNativeGlyphStorage *)&v5 dealloc];
    return;
  }
  v4 = (objc_class *)objc_opt_class();
  objc_destructInstance(self);
  self->_stack = 0;
  self->super._advances = 0;
  self->_attachCounts = 0;
  self->_origins = 0;
  self->_unint64_t retainCount = 0;
  objc_constructInstance(v4, self);
  qword_1EB2CDE68 = (uint64_t)self;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_13);
}

- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4
{
  attachCounts = self->_attachCounts;
  if (a3 && !attachCounts)
  {
    attachCounts = (const int64_t *)malloc_type_calloc(self->_capacity, 8uLL, 0x100004000313F17uLL);
    self->_attachCounts = attachCounts;
  }
  if (attachCounts) {
    attachCounts[a4] = a3;
  }
}

- (id)copyWithRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  v6 = (void **)[(id)objc_opt_class() newWithCount:var1 capacity:var1];
  v7 = v6;
  if (v6)
  {
    if (var1)
    {
      memmove(v6[2], &self->super._glyphs[var0], 2 * var1);
      advances = self->super._advances;
      if (advances)
      {
        memmove((void *)[v7 allocatedAdvances], &advances[var0], 16 * var1);
        size_t v9 = 8 * var1;
      }
      else
      {
        size_t v9 = 8 * var1;
        memmove(v7[3], &self->super._advanceWidths[var0], 8 * var1);
      }
      memmove(v7[5], &self->super._props[var0], 4 * var1);
      memmove(v7[6], &self->super._stringIndices[var0], v9);
    }
    else if (self->super._advances)
    {
      [v6 allocatedAdvances];
    }
    if (self->_attachCounts)
    {
      unint64_t v10 = (unint64_t)v7[11];
      v11 = v10 >> 61 ? 0 : malloc_type_realloc(0, 8 * v10, 0xFE0C88B4uLL);
      v7[7] = v11;
      if (var1) {
        memmove(v11, &self->_attachCounts[var0], 8 * var1);
      }
    }
    if (self->_origins)
    {
      unint64_t v12 = (unint64_t)v7[11];
      if (v12 >> 60) {
        v13 = 0;
      }
      else {
        v13 = malloc_type_realloc(0, 16 * v12, 0xFE0C88B4uLL);
      }
      v7[8] = v13;
      if (var1) {
        memmove(v13, &self->_origins[var0], 16 * var1);
      }
    }
  }
  return v7;
}

+ (id)newWithCount:(int64_t)a3 capacity:(int64_t)a4
{
  if (a4 > 16)
  {
    id v11 = objc_alloc((Class)a1);
  }
  else
  {
    os_unfair_lock_lock_with_options();
    v7 = (void *)qword_1EB2CDE68;
    if (qword_1EB2CDE68)
    {
      qword_1EB2CDE68 = 0;
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_13);
      v7[1] = a3;
      v7[11] = 16;
      v8 = (_OWORD *)v7[12];
      v7[3] = v8;
      v8[20] = 0u;
      v8[21] = 0u;
      v8[18] = 0u;
      v8[19] = 0u;
      v8[16] = 0u;
      v8[17] = 0u;
      v8[14] = 0u;
      v8[15] = 0u;
      v8[12] = 0u;
      v8[13] = 0u;
      v8[10] = 0u;
      v8[11] = 0u;
      v8[8] = 0u;
      v8[9] = 0u;
      v8[6] = 0u;
      v8[7] = 0u;
      v8[4] = 0u;
      v8[5] = 0u;
      v8[2] = 0u;
      v8[3] = 0u;
      _OWORD *v8 = 0u;
      v8[1] = 0u;
      uint64_t v9 = v7[3];
      v7[5] = v9 + 256;
      v7[6] = v9 + 128;
      v7[2] = v9 + 320;
      return v7;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_13);
    Instance = class_createInstance((Class)a1, 0x160uLL);
    v13 = Instance;
    if (Instance) {
      Instance[12] = object_getIndexedIvars(Instance);
    }
    id v11 = v13;
  }

  return (id)[v11 initWithCount:a3 capacity:a4];
}

- (_CTNativeGlyphStorage)initWithCount:(int64_t)a3 capacity:(int64_t)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_CTNativeGlyphStorage;
  objc_super v5 = [(_CTGlyphStorage *)&v14 initWithCount:a3];
  v6 = v5;
  if (v5)
  {
    preallocatedStorage = (const double *)v5->_preallocatedStorage;
    if (preallocatedStorage)
    {
      v5->_capacity = 16;
      v5->super._advanceWidths = preallocatedStorage;
      *((_OWORD *)preallocatedStorage + 20) = 0u;
      *((_OWORD *)preallocatedStorage + 21) = 0u;
      *((_OWORD *)preallocatedStorage + 18) = 0u;
      *((_OWORD *)preallocatedStorage + 19) = 0u;
      *((_OWORD *)preallocatedStorage + 16) = 0u;
      *((_OWORD *)preallocatedStorage + 17) = 0u;
      *((_OWORD *)preallocatedStorage + 14) = 0u;
      *((_OWORD *)preallocatedStorage + 15) = 0u;
      *((_OWORD *)preallocatedStorage + 12) = 0u;
      *((_OWORD *)preallocatedStorage + 13) = 0u;
      *((_OWORD *)preallocatedStorage + 10) = 0u;
      *((_OWORD *)preallocatedStorage + 11) = 0u;
      *((_OWORD *)preallocatedStorage + 8) = 0u;
      *((_OWORD *)preallocatedStorage + 9) = 0u;
      *((_OWORD *)preallocatedStorage + 6) = 0u;
      *((_OWORD *)preallocatedStorage + 7) = 0u;
      *((_OWORD *)preallocatedStorage + 4) = 0u;
      *((_OWORD *)preallocatedStorage + 5) = 0u;
      *((_OWORD *)preallocatedStorage + 2) = 0u;
      *((_OWORD *)preallocatedStorage + 3) = 0u;
      *(_OWORD *)preallocatedStorage = 0u;
      *((_OWORD *)preallocatedStorage + 1) = 0u;
      advanceWidths = v5->super._advanceWidths;
      v5->super._props = (const unsigned int *)(advanceWidths + 32);
      v5->super._stringIndices = (const int64_t *)(advanceWidths + 16);
      uint64_t v9 = (const unsigned __int16 *)(advanceWidths + 40);
    }
    else
    {
      v5->_capacity = a4;
      unint64_t v10 = (const double *)malloc_type_calloc(1uLL, 22 * a4, 0x258C9D4BuLL);
      v6->super._advanceWidths = v10;
      if (!v10)
      {

        return 0;
      }
      id v11 = (const int64_t *)&v10[a4];
      unint64_t v12 = (const unsigned int *)&v11[a4];
      v6->super._props = v12;
      v6->super._stringIndices = v11;
      uint64_t v9 = (const unsigned __int16 *)&v12[a4];
    }
    v6->super._glyphs = v9;
  }
  return v6;
}

- (int64_t)attachmentCountAtIndex:(int64_t)a3
{
  attachCounts = self->_attachCounts;
  if (attachCounts) {
    return attachCounts[a3];
  }
  else {
    return 0;
  }
}

- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  memmove((void *)&self->super._glyphs[a4], &self->super._glyphs[a3.var0], 2 * a3.var1);
  advances = self->super._advances;
  if (advances)
  {
    uint64_t v9 = (CGSize *)&advances[a4];
    unint64_t v10 = &advances[var0];
    size_t v11 = 16 * var1;
  }
  else
  {
    advanceWidths = self->super._advanceWidths;
    uint64_t v9 = (CGSize *)&advanceWidths[a4];
    unint64_t v10 = (const CGSize *)&advanceWidths[var0];
    size_t v11 = 8 * var1;
  }
  memmove(v9, v10, v11);
  memmove((void *)&self->super._props[a4], &self->super._props[var0], 4 * var1);
  memmove((void *)&self->super._stringIndices[a4], &self->super._stringIndices[var0], 8 * var1);
  attachCounts = self->_attachCounts;
  if (attachCounts) {
    memmove((void *)&attachCounts[a4], &attachCounts[var0], 8 * var1);
  }
  origins = self->_origins;
  if (origins)
  {
    memmove((void *)&origins[a4], &origins[var0], 16 * var1);
  }
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (unint64_t)retainCount
{
  return self->_retainCount + 1;
}

- (const)allocatedAdvances
{
  result = self->super._advances;
  if (!result)
  {
    result = (const CGSize *)malloc_type_calloc(self->_capacity, 0x10uLL, 0x1000040451B5BE8uLL);
    self->super._advances = result;
    int64_t capacity = self->_capacity;
    if (capacity >= 1)
    {
      advanceWidths = self->super._advanceWidths;
      v6 = (CGSize *)result;
      do
      {
        CGFloat v7 = *advanceWidths++;
        v6->CGFloat width = v7;
        ++v6;
        --capacity;
      }
      while (capacity);
    }
  }
  return result;
}

- (BOOL)implementsOrigins
{
  return 1;
}

- (CGPoint)originAtIndex:(int64_t)a3
{
  origins = self->_origins;
  if (origins) {
    p_x = &origins[a3].x;
  }
  else {
    p_x = (double *)MEMORY[0x1E4F1DAD8];
  }
  double v5 = *p_x;
  double v6 = p_x[1];
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  origins = self->_origins;
  if (origins
    || (a3.x == *MEMORY[0x1E4F1DAD8] ? (BOOL v10 = a3.y == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) : (BOOL v10 = 0),
        !v10
     && (origins = (const CGPoint *)malloc_type_calloc(self->_capacity, 0x10uLL, 0x1000040451B5BE8uLL),
         (self->_origins = origins) != 0)))
  {
    p_CGFloat x = &origins[a4].x;
    CGFloat *p_x = x;
    p_x[1] = y;
  }
}

- (void)insertGlyphsAtRange:(id)a3
{
  int64_t var0 = a3.var0;
  int64_t count = self->super._count;
  int64_t var1 = a3.var1;
  int64_t v6 = count + a3.var1;
  int64_t capacity = self->_capacity;
  if (capacity >= count + a3.var1) {
    goto LABEL_34;
  }
  if (2 * capacity <= v6) {
    uint64_t v8 = count + a3.var1;
  }
  else {
    uint64_t v8 = 2 * capacity;
  }
  advanceWidths = self->super._advanceWidths;
  preallocatedStorage = (const double *)self->_preallocatedStorage;
  size_t v11 = malloc_good_size(22 * v8);
  if (v11 == 22 * v8) {
    unint64_t v12 = v8;
  }
  else {
    unint64_t v12 = v11 / 0x16;
  }
  if (advanceWidths == preallocatedStorage)
  {
    v31 = (double *)malloc_type_calloc(1uLL, v11, 0x67342C63uLL);
    v13 = v31;
    objc_super v14 = &v31[v12];
    v15 = &v14[v12];
    v23 = (const unsigned __int16 *)v15 + 2 * v12;
    if (!self->super._advances)
    {
      int64_t v32 = self->super._count;
      if (!v32) {
        goto LABEL_11;
      }
      memmove(v31, self->super._advanceWidths, 8 * v32);
    }
    int64_t v33 = self->super._count;
    if (!v33) {
      goto LABEL_11;
    }
    memmove(v14, self->super._stringIndices, 8 * v33);
    int64_t v34 = self->super._count;
    if (!v34) {
      goto LABEL_11;
    }
    memmove(&v14[v12], self->super._props, 4 * v34);
    int64_t v35 = self->super._count;
    if (!v35) {
      goto LABEL_11;
    }
    glyphs = self->super._glyphs;
    size_t v20 = 2 * v35;
    v21 = (double *)((char *)v15 + 4 * v12);
  }
  else
  {
    v13 = (const double *)reallocf((void *)self->super._advanceWidths, v11);
    objc_super v14 = (double *)&v13[v12];
    v15 = &v14[v12];
    int64_t v16 = self->_capacity;
    v17 = (const unsigned __int16 *)&v13[v16];
    v18 = &v17[4 * v16];
    int64_t v41 = var0;
    int64_t v19 = self->super._count;
    memmove((char *)v15 + 4 * v12, &v18[2 * v16], 2 * v19);
    memmove(v15, v18, 4 * v19);
    size_t v20 = 8 * v19;
    int64_t var0 = v41;
    v21 = v14;
    glyphs = v17;
    v23 = (const unsigned __int16 *)v15 + 2 * v12;
  }
  memmove(v21, glyphs, v20);
LABEL_11:
  self->super._glyphs = v23;
  self->super._advanceWidths = v13;
  self->super._props = (const unsigned int *)v15;
  self->super._stringIndices = (const int64_t *)v14;
  if (self->super._advances)
  {
    v24 = (CGSize *)malloc_type_calloc(v12, 0x10uLL, 0x1000040451B5BE8uLL);
    v25 = v24;
    int64_t v26 = self->super._count;
    if (v26) {
      memmove(v24, self->super._advances, 16 * v26);
    }
    free((void *)self->super._advances);
    self->super._advances = v25;
  }
  if (self->_attachCounts)
  {
    v27 = (int64_t *)malloc_type_calloc(v12, 8uLL, 0x100004000313F17uLL);
    v28 = v27;
    int64_t v29 = self->super._count;
    if (v29) {
      memmove(v27, self->_attachCounts, 8 * v29);
    }
    free((void *)self->_attachCounts);
    self->_attachCounts = v28;
  }
  origins = (CGPoint *)self->_origins;
  if (origins)
  {
    if (v12 >> 60)
    {
      self->_origins = 0;
    }
    else
    {
      v36 = (const CGPoint *)reallocf(origins, 16 * v12);
      self->_origins = v36;
      if (v36)
      {
        p_CGFloat x = (_OWORD *)&v36[self->super._count].x;
        uint64_t v38 = 16 * v12 - 16 * self->super._count;
        if (v38 >= 1)
        {
          unint64_t v39 = ((unint64_t)v38 >> 4) + 1;
          v40 = (_OWORD *)MEMORY[0x1E4F1DAD8];
          do
          {
            *p_x++ = *v40;
            --v39;
          }
          while (v39 > 1);
        }
      }
    }
  }
  self->_int64_t capacity = v12;
  int64_t count = self->super._count;
  int64_t v6 = count + var1;
LABEL_34:
  self->super._int64_t count = v6;
  if (count - var0 >= 1)
  {
    -[_CTNativeGlyphStorage moveGlyphsFromRange:toIndex:](self, "moveGlyphsFromRange:toIndex:", var0);
  }
}

- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4
{
  glyphs = self->super._glyphs;
  unsigned __int16 v5 = glyphs[a3];
  glyphs[a3] = glyphs[a4];
  glyphs[a4] = v5;
  advances = self->super._advances;
  if (advances)
  {
    CGSize v7 = advances[a3];
    advances[a3] = advances[a4];
    advances[a4] = v7;
  }
  else
  {
    advanceWidths = self->super._advanceWidths;
    double v9 = advanceWidths[a3];
    advanceWidths[a3] = advanceWidths[a4];
    advanceWidths[a4] = v9;
  }
  props = self->super._props;
  stringIndices = self->super._stringIndices;
  unsigned int v12 = props[a3];
  props[a3] = props[a4];
  props[a4] = v12;
  int64_t v13 = stringIndices[a3];
  stringIndices[a3] = stringIndices[a4];
  stringIndices[a4] = v13;
  attachCounts = self->_attachCounts;
  if (attachCounts)
  {
    int64_t v15 = attachCounts[a3];
    attachCounts[a3] = attachCounts[a4];
    attachCounts[a4] = v15;
  }
  origins = self->_origins;
  if (origins)
  {
    CGPoint v17 = origins[a3];
    origins[a3] = origins[a4];
    origins[a4] = v17;
  }
}

- (void)initGlyphStackWithCapacity:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >> 58 || (v4 = (a3 - 1) << 6, size_t v5 = v4 + 80, v4 >= 0xFFFFFFFFFFFFFFB0))
  {
    free(self->_stack);
    self->_stack = 0;
    return;
  }
  stack = self->_stack;
  if (!stack)
  {
    stack = (GlyphStack *)malloc_type_malloc(v5, 0xADC3A802uLL);
    goto LABEL_8;
  }
  if (stack->var0 < a3)
  {
    stack = (GlyphStack *)reallocf(stack, v5);
LABEL_8:
    self->_stack = stack;
    stack->int64_t var0 = a3;
  }
  stack->int64_t var1 = 0;
}

- (void)pushGlyphAtIndex:(int64_t)a3
{
  stack = self->_stack;
  if (stack)
  {
    int64_t var1 = stack->var1;
    if (var1 < stack->var0)
    {
      var2 = stack->var2;
      var2[var1].int64_t var0 = self->super._glyphs[a3];
      advances = self->super._advances;
      if (advances)
      {
        var2[var1].int64_t var1 = advances[a3];
      }
      else
      {
        double v9 = &var2[var1];
        v9->var1.CGFloat width = self->super._advanceWidths[a3];
        v9->var1.CGFloat height = 0.0;
      }
      stringIndices = self->super._stringIndices;
      size_t v11 = &var2[var1];
      v11->var2 = self->super._props[a3];
      v11->var3 = stringIndices[a3];
      v11->var4 = [(_CTNativeGlyphStorage *)self attachmentCountAtIndex:a3];
      [(_CTNativeGlyphStorage *)self originAtIndex:a3];
      v11->var5.CGFloat x = v12;
      v11->var5.CGFloat y = v13;
      ++self->_stack->var1;
    }
  }
}

- (void)popGlyphAtIndex:(int64_t)a3
{
  stack = self->_stack;
  if (stack)
  {
    uint64_t var1 = stack->var1;
    BOOL v5 = var1 < 1;
    int64_t v6 = var1 - 1;
    if (!v5)
    {
      double v9 = (char *)stack + 64 * v6;
      self->super._glyphs[a3] = *((_WORD *)v9 + 8);
      stringIndices = self->super._stringIndices;
      self->super._props[a3] = *((_DWORD *)v9 + 10);
      stack->uint64_t var1 = v6;
      stringIndices[a3] = *((void *)v9 + 6);
      [(_CTNativeGlyphStorage *)self setAdvance:*((double *)v9 + 3) atIndex:*((double *)v9 + 4)];
      [(_CTNativeGlyphStorage *)self setAttachmentCount:*((void *)v9 + 7) atIndex:a3];
      double v11 = *((double *)v9 + 8);
      double v12 = *((double *)v9 + 9);
      -[_CTNativeGlyphStorage setOrigin:atIndex:](self, "setOrigin:atIndex:", a3, v11, v12);
    }
  }
}

@end