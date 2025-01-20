@interface _CTMutableGlyphStorage
- (BOOL)hasCustomAdvances;
- (BOOL)implementsCustomAdvancesForIndexes;
- (BOOL)implementsOrigins;
- (CGPoint)originAtIndex:(int64_t)a3;
- (CGSize)customAdvanceForIndex:(int64_t)a3;
- (_CTMutableGlyphStorage)initWithInterface:(id)a3;
- (_CTMutableGlyphStorage)initWithInterface:(id)a3 options:(unsigned int)a4;
- (id)copyWithRange:(id)a3;
- (int64_t)attachmentCountAtIndex:(int64_t)a3;
- (void)disposeGlyphStack;
- (void)getCustomAdvances:(CGSize *)a3 forIndexes:(const int64_t *)a4 count:(int64_t)a5;
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
- (void)sync;
@end

@implementation _CTMutableGlyphStorage

- (BOOL)hasCustomAdvances
{
  return self->_hasCustomAdvances;
}

- (int64_t)attachmentCountAtIndex:(int64_t)a3
{
  absorbedCounts = self->_interface->_absorbedCounts;
  if (absorbedCounts) {
    return absorbedCounts[a3];
  }
  else {
    return 0;
  }
}

- (void)refCon
{
  return self->_interface;
}

- (void)sync
{
  int64_t count = self->super._count;
  self->super._int64_t count = self->_interface->_glyphCount;
  self->super._glyphs = self->_interface->_glyphs;
  self->super._advances = self->_interface->_advances;
  self->super._props = self->_interface->_props;
  self->super._stringIndices = self->_interface->_stringIndexes;
  if (!self->_implementsOrigins)
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      int64_t v5 = self->super._count;
      if (v5 > count)
      {
        [AssociatedObject setLength:16 * v5];
      }
    }
  }
}

- (void)resetOrigins:(id)a3
{
  if (!self->_implementsOrigins)
  {
    int64_t var1 = a3.var1;
    int64_t var0 = a3.var0;
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      uint64_t v6 = [AssociatedObject mutableBytes];
      if (var1 >= 1)
      {
        v7 = (_OWORD *)(v6 + 16 * var0);
        unint64_t v8 = var1 + 1;
        v9 = (_OWORD *)MEMORY[0x1E4F1DAD8];
        do
        {
          *v7++ = *v9;
          --v8;
        }
        while (v8 > 1);
      }
    }
  }
}

- (_CTMutableGlyphStorage)initWithInterface:(id)a3 options:(unsigned int)a4
{
  if (a3)
  {
    char v4 = a4;
    uint64_t v6 = *((void *)a3 + 1);
    v10.receiver = self;
    v10.super_class = (Class)_CTMutableGlyphStorage;
    v7 = [(_CTGlyphStorage *)&v10 initWithCount:v6];
    unint64_t v8 = v7;
    if (v7)
    {
      v7->_interface = (CTGlyphStorageInterface *)a3;
      v7->super._glyphs = (const unsigned __int16 *)*((void *)a3 + 2);
      v7->super._advances = (const CGSize *)*((void *)a3 + 3);
      v7->super._props = (const unsigned int *)*((void *)a3 + 4);
      v7->super._stringIndices = (const int64_t *)*((void *)a3 + 5);
      if (objc_opt_respondsToSelector()) {
        v8->_implementsOrigins = 1;
      }
      if (v4) {
        v8->_hasCustomAdvances = 1;
      }
      if (objc_opt_respondsToSelector()) {
        v8->_implementsCustomAdvancesForIndexes = 1;
      }
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

- (_CTMutableGlyphStorage)initWithInterface:(id)a3
{
  return [(_CTMutableGlyphStorage *)self initWithInterface:a3 options:0];
}

- (id)copyWithRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v6 = -[CTGlyphStorageInterface createCopy:](self->_interface, "createCopy:");
  if (!self->_implementsOrigins)
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      uint64_t v8 = [AssociatedObject bytes];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithBytes:v8 + 16 * var0 length:16 * var1];
      objc_setAssociatedObject(v6, (const void *)sOriginsAssociationKey, v9, (void *)0x301);
    }
  }
  return v6;
}

- (CGSize)customAdvanceForIndex:(int64_t)a3
{
  if ((__int16)self->super._glyphs[a3] == -1)
  {
    long long v5 = *MEMORY[0x1E4F1DB30];
  }
  else
  {
    *(void *)&long long v5 = -1;
    *((void *)&v5 + 1) = -1;
    [(CTGlyphStorageInterface *)self->_interface getCustomAdvance:&v5 forIndex:a3];
  }
  double v4 = *((double *)&v5 + 1);
  double v3 = *(double *)&v5;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)getCustomAdvances:(CGSize *)a3 forIndexes:(const int64_t *)a4 count:(int64_t)a5
{
  if (self->_implementsCustomAdvancesForIndexes) {
    [(CTGlyphStorageInterface *)self->_interface getCustomAdvances:a3 forIndexes:a4 count:a5];
  }
}

- (void)setAttachmentCount:(int64_t)a3 atIndex:(int64_t)a4
{
}

- (CGPoint)originAtIndex:(int64_t)a3
{
  if (self->_implementsOrigins)
  {
    origins = self->_interface->_origins;
    if (origins) {
      p_x = &origins[a3].x;
    }
    else {
      p_x = (double *)MEMORY[0x1E4F1DAD8];
    }
  }
  else
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject) {
      p_x = (double *)([AssociatedObject bytes] + 16 * a3);
    }
    else {
      p_x = (double *)MEMORY[0x1E4F1DAD8];
    }
  }
  double v7 = *p_x;
  double v8 = p_x[1];
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setOrigin:(CGPoint)a3 atIndex:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  if (self->_implementsOrigins)
  {
    interface = self->_interface;
    -[CTGlyphStorageInterface setOrigin:forIndex:](interface, "setOrigin:forIndex:");
  }
  else
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject
      || (x == *MEMORY[0x1E4F1DAD8] ? (BOOL v11 = y == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) : (BOOL v11 = 0),
          !v11
       && (id AssociatedObject = (id)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:16 * self->_interface->_glyphCount], objc_setAssociatedObject(self, (const void *)sOriginsAssociationKey, AssociatedObject, (void *)0x301), AssociatedObject, AssociatedObject)))
    {
      objc_super v10 = (double *)([AssociatedObject mutableBytes] + 16 * a4);
      *objc_super v10 = x;
      v10[1] = y;
    }
  }
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
  if (a4 && a3.var1 >= 1)
  {
    uint64_t v16 = v9;
    uint64_t v17 = v8;
    uint64_t v18 = v7;
    uint64_t v19 = v6;
    uint64_t v20 = v5;
    uint64_t v21 = v4;
    uint64_t v22 = v10;
    uint64_t v23 = v11;
    int64_t var0 = a3.var0;
    int64_t v15 = a3.var0 + a3.var1;
    do
    {
      -[CTGlyphStorageInterface setStringIndex:forIndex:](self->_interface, "setStringIndex:forIndex:", self->_interface->_stringIndexes[var0] + a4, var0, v16, v17, v18, v19, v20, v21, v22, v23);
      ++var0;
    }
    while (var0 < v15);
  }
}

- (void)insertGlyphsAtRange:(id)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  interface = self->_interface;
  int64_t glyphCount = interface->_glyphCount;
  [(CTGlyphStorageInterface *)interface insertGlyphs:a3.var0 - 1];
  if (!self->_implementsOrigins)
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      uint64_t v9 = AssociatedObject;
      [AssociatedObject setLength:16 * (glyphCount + var1)];
      uint64_t v10 = [v9 mutableBytes];
      if (glyphCount - var0 >= 1)
      {
        uint64_t v11 = (const void *)(v10 + 16 * var0);
        v12 = (void *)(v10 + 16 * (var0 + var1));
        memmove(v12, v11, 16 * (glyphCount - var0));
      }
    }
  }
}

- (void)swapGlyphsAtIndex:(int64_t)a3 withIndex:(int64_t)a4
{
  -[CTGlyphStorageInterface swapGlyph:withIndex:](self->_interface, "swapGlyph:withIndex:");
  if (!self->_implementsOrigins)
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      uint64_t v8 = [AssociatedObject mutableBytes];
      long long v9 = *(_OWORD *)(v8 + 16 * a3);
      *(_OWORD *)(v8 + 16 * a3) = *(_OWORD *)(v8 + 16 * a4);
      *(_OWORD *)(v8 + 16 * a4) = v9;
    }
  }
}

- (void)moveGlyphsFromRange:(id)a3 toIndex:(int64_t)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  -[CTGlyphStorageInterface moveGlyphsTo:from:](self->_interface, "moveGlyphsTo:from:", a4, a3.var0, a3.var1);
  if (!self->_implementsOrigins)
  {
    id AssociatedObject = objc_getAssociatedObject(self, (const void *)sOriginsAssociationKey);
    if (AssociatedObject)
    {
      uint64_t v9 = [AssociatedObject mutableBytes];
      uint64_t v10 = (const void *)(v9 + 16 * var0);
      uint64_t v11 = (void *)(v9 + 16 * a4);
      memmove(v11, v10, 16 * var1);
    }
  }
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

- (void)disposeGlyphStack
{
}

- (BOOL)implementsOrigins
{
  return self->_implementsOrigins;
}

- (BOOL)implementsCustomAdvancesForIndexes
{
  return self->_implementsCustomAdvancesForIndexes;
}

@end