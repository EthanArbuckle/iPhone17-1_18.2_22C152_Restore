@interface _CTGlyphStorage
- (BOOL)implementsOrigins;
- (BOOL)isEqual:(id)a3;
- (CGPoint)originAtIndex:(int64_t)a3;
- (_CTGlyphStorage)initWithCount:(int64_t)a3;
- (const)allocatedAdvances;
- (id)copyWithRange:(id)a3;
- (int64_t)attachmentCountAtIndex:(int64_t)a3;
- (void)initGlyphStackWithCapacity:(int64_t)a3;
- (void)insertGlyphsAtRange:(id)a3;
- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4;
- (void)popGlyphAtIndex:(int64_t)a3;
- (void)puntStringIndicesInRange:(id)a3 by:(int64_t)a4;
- (void)pushGlyphAtIndex:(int64_t)a3;
- (void)refCon;
- (void)resetOrigins:(id)a3;
- (void)setAdvance:(CGSize)a3 atIndex:(int64_t)a4;
- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4;
- (void)setGlyph:(unsigned __int16)a3 atIndex:(int64_t)a4;
- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4;
- (void)setProps:(unsigned int)a3 atIndex:(int64_t)a4;
- (void)setStringIndex:(int64_t)a3 atIndex:(int64_t)a4;
- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4;
@end

@implementation _CTGlyphStorage

- (_CTGlyphStorage)initWithCount:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_CTGlyphStorage;
  result = [(_CTGlyphStorage *)&v5 init];
  if (result) {
    result->_count = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t count = self->_count;
    if (count == *((void *)a3 + 1))
    {
      if (count < 1) {
        return 1;
      }
      uint64_t v6 = 0;
      advanceWidths = self->_advanceWidths;
      advances = self->_advances;
      v10 = (double *)*((void *)a3 + 3);
      uint64_t v9 = *((void *)a3 + 4);
      glyphs = self->_glyphs;
      v12 = (unsigned __int16 *)*((void *)a3 + 2);
      v13 = (double *)(v9 + 8);
      for (i = &advances->height; ; i += 2)
      {
        double v15 = 0.0;
        double v16 = 0.0;
        p_width = (double *)advanceWidths;
        if (advances)
        {
          p_width = &advances[v6].width;
          double v16 = *i;
        }
        v18 = v10;
        if (v9)
        {
          v18 = (double *)(v9 + 16 * v6);
          double v15 = *v13;
        }
        BOOL v19 = *p_width == *v18 && v16 == v15;
        if (!v19 || *glyphs != *v12) {
          break;
        }
        ++v6;
        ++v12;
        ++glyphs;
        ++v10;
        v13 += 2;
        ++advanceWidths;
        if (!--count) {
          return 1;
        }
      }
    }
  }
  return 0;
}

- (id)copyWithRange:(id)a3
{
  return 0;
}

- (void)refCon
{
  return 0;
}

- (const)allocatedAdvances
{
  return 0;
}

- (int64_t)attachmentCountAtIndex:(int64_t)a3
{
  return 0;
}

- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4
{
}

- (BOOL)implementsOrigins
{
  return 0;
}

- (void)resetOrigins:(id)a3
{
}

- (CGPoint)originAtIndex:(int64_t)a3
{
  fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s called on non-concrete instance %p\n", "-[_CTGlyphStorage originAtIndex:]", self);
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4
{
}

- (void)setProps:(unsigned int)a3 atIndex:(int64_t)a4
{
}

- (void)setGlyph:(unsigned __int16)a3 atIndex:(int64_t)a4
{
}

- (void)setAdvance:(CGSize)a3 atIndex:(int64_t)a4
{
}

- (void)setStringIndex:(int64_t)a3 atIndex:(int64_t)a4
{
}

- (void)puntStringIndicesInRange:(id)a3 by:(int64_t)a4
{
}

- (void)insertGlyphsAtRange:(id)a3
{
}

- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4
{
}

- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4
{
}

- (void)initGlyphStackWithCapacity:(int64_t)a3
{
}

- (void)pushGlyphAtIndex:(int64_t)a3
{
}

- (void)popGlyphAtIndex:(int64_t)a3
{
}

@end