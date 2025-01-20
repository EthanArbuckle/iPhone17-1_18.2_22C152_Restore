@interface _CUIThemeFacetCacheKey
- (BOOL)isEqual:(id)a3;
- (_CUIThemeFacetCacheKey)initWithKeyList:(const _renditionkeytoken *)a3 themeIndex:(int64_t)a4;
- (unint64_t)hash;
- (unint64_t)hash64;
@end

@implementation _CUIThemeFacetCacheKey

- (unint64_t)hash64
{
  uint64_t value_low = LOBYTE(self->keyList[0].value);
  int value = self->keyList[1].value;
  int identifier = self->keyList[1].identifier;
  if (identifier | value)
  {
    unint64_t v5 = 0;
    p_int value = &self->keyList[2].value;
    do
    {
      BOOL v7 = identifier == 2;
      unint64_t v8 = (unint64_t)(value & 0xF) << (4 * identifier + 4);
      unint64_t v9 = (unint64_t)value << 8;
      if (v7) {
        unint64_t v8 = v9;
      }
      value_low += v8;
      int value = *p_value;
      int identifier = *(p_value - 1);
      if (identifier | value) {
        BOOL v10 = v5 >= 0x14;
      }
      else {
        BOOL v10 = 1;
      }
      ++v5;
      p_value += 2;
    }
    while (!v10);
  }
  return value_low + (self->themeIndex << 56);
}

- (_CUIThemeFacetCacheKey)initWithKeyList:(const _renditionkeytoken *)a3 themeIndex:(int64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_CUIThemeFacetCacheKey;
  v6 = [(_CUIThemeFacetCacheKey *)&v11 init];
  BOOL v7 = v6;
  if (v6)
  {
    v6->themeIndex = a4;
    unint64_t v8 = CUISystemThemeRenditionKeyFormat();
    CUIRenditionKeyStandardize(v7->keyList, &a3->identifier, (uint64_t)v8);
    int v9 = CUIRenditionKeyValueForAttribute(&a3->identifier, 12);
    CUIRenditionKeySetValueForAttribute(&v7->keyList[0].identifier, 12, v9, 0x16u);
    v7->hashPrecalc = [(_CUIThemeFacetCacheKey *)v7 hash64];
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    return 1;
  }
  else if (self->themeIndex == *((void *)a3 + 12) && self->keyList[0].value == *((unsigned __int16 *)a3 + 5))
  {
    BOOL v3 = 0;
    unint64_t v4 = 0;
    unint64_t v5 = (unsigned __int16 *)((char *)a3 + 14);
    p_int value = &self->keyList[1].value;
    do
    {
      if (*(p_value - 3) != *(v5 - 3)) {
        break;
      }
      BOOL v3 = v4 > 0x13;
      if (v4 == 20) {
        break;
      }
      int v8 = *p_value;
      p_value += 2;
      int v7 = v8;
      int v9 = *v5;
      v5 += 2;
      ++v4;
    }
    while (v7 == v9);
  }
  else
  {
    return 0;
  }
  return v3;
}

- (unint64_t)hash
{
  return self->hashPrecalc;
}

@end