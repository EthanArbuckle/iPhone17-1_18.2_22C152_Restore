@interface _NSConstantDictionary
+ (id)alloc;
- (id)allKeys;
- (id)allValues;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (id)keyEnumerator;
- (id)objectEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)capacity;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4;
@end

@implementation _NSConstantDictionary

- (id)objectForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  unsigned int isa = self[1].super.super.isa;
  if ((isa & 0xFFFFFF) == 0) {
    return 0;
  }
  int isa_high = HIDWORD(self[1].super.super.isa);
  int v7 = isa_high >= 0 ? HIDWORD(self[1].super.super.isa) : isa_high + 1;
  unint64_t v8 = _NSConstantDictionaryKeyHash(a3);
  uint64_t v9 = HIBYTE(isa) ? (uint64_t)(int)isa >> 24 : *(void *)&isa & 0xFFFFFFLL;
  if (!v9) {
    return 0;
  }
  unint64_t v10 = (uint64_t)v7 >> 1;
  unint64_t v11 = v8 % v10;
  while (1)
  {
    id result = self[2 * v11 + 2].super.super.isa;
    if (!result) {
      break;
    }
    if (result == a3 || [result isEqual:a3]) {
      return *(Class *)((char *)&self[2].super.super.isa + ((16 * v11) | 8));
    }
    if (v11 + 1 == v10) {
      unint64_t v11 = 0;
    }
    else {
      ++v11;
    }
    if (!--v9) {
      return 0;
    }
  }
  return result;
}

- (id)allKeys
{
  v3 = (void *)[MEMORY[0x263EFF980] array];
  int isa_high = HIDWORD(self[1].super.super.isa);
  if ((isa_high + 1) >= 3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t)self[1].super.super.isa & 0xFFFFFFLL;
    unsigned int v7 = isa_high / 2;
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = self + 2;
    do
    {
      if (v9->super.super.isa)
      {
        objc_msgSend(v3, "addObject:");
        if (++v5 == v6) {
          break;
        }
      }
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  return v3;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  int isa_high = HIDWORD(self[1].super.super.isa);
  if (isa_high >= 0) {
    int v7 = HIDWORD(self[1].super.super.isa);
  }
  else {
    int v7 = isa_high + 1;
  }
  unint64_t v8 = (v7 >> 1);
  unint64_t v9 = (uint64_t)self[1].super.super.isa & 0xFFFFFF;
  BOOL v11 = isa_high > 1 && v9 != 0;
  if ((a3 & 2) != 0)
  {
    if (v11)
    {
      unint64_t v16 = 0;
      unsigned int v17 = 2 * v8 - 1;
      do
      {
        Class isa = self[v17 + 1].super.super.isa;
        if (isa)
        {
          char v19 = 0;
          (*((void (**)(id, Class, Class, char *))a4 + 2))(a4, isa, self[v17 + 2].super.super.isa, &v19);
          if (v19) {
            return;
          }
          ++v16;
        }
        if (v8 < 2) {
          break;
        }
        v17 -= 2;
        --v8;
      }
      while (v16 < v9);
    }
  }
  else if (v11)
  {
    unint64_t v12 = 0;
    v13 = self + 3;
    uint64_t v14 = 1;
    do
    {
      Class v15 = v13[-1].super.super.isa;
      if (v15)
      {
        char v20 = 0;
        (*((void (**)(id, Class, Class, char *))a4 + 2))(a4, v15, v13->super.super.isa, &v20);
        if (v20) {
          return;
        }
        ++v12;
      }
      if (v14 >= (int)v8) {
        break;
      }
      v13 += 2;
      ++v14;
    }
    while (v12 < v9);
  }
}

- (unint64_t)retainCount
{
  return 1;
}

+ (id)alloc
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  v4 = (objc_class *)objc_opt_class();
  [v2 raise:v3, @"Calling Alloc on %@ is not allowed", NSStringFromClass(v4) format];
  return 0;
}

- (void)dealloc
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF488];
  v4 = (objc_class *)objc_opt_class();
  [v2 raise:v3, @"Calling Dealloc on %@ is not allowed", NSStringFromClass(v4) format];
}

- (id)keyEnumerator
{
  v2 = [[_NSConstantDictionaryEnumerator alloc] initWithFirstKeyPointer:&self[2] capacity:(uint64_t)(HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0)) >> 1];
  return v2;
}

- (id)objectEnumerator
{
  v2 = [[_NSConstantDictionaryEnumerator alloc] initWithFirstKeyPointer:&self[3] capacity:(uint64_t)(HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0)) >> 1];
  return v2;
}

- (id)allValues
{
  uint64_t v3 = (void *)[MEMORY[0x263EFF980] array];
  int isa_high = HIDWORD(self[1].super.super.isa);
  if ((isa_high + 1) >= 3)
  {
    uint64_t v5 = 0;
    uint64_t v6 = (uint64_t)self[1].super.super.isa & 0xFFFFFFLL;
    unsigned int v7 = isa_high / 2;
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    unint64_t v9 = self + 3;
    do
    {
      if (v9->super.super.isa)
      {
        objc_msgSend(v3, "addObject:");
        if (++v5 == v6) {
          break;
        }
      }
      v9 += 2;
      --v8;
    }
    while (v8);
  }
  return v3;
}

- (unint64_t)capacity
{
  return (uint64_t)(HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0)) >> 1;
}

- (unint64_t)count
{
  return (uint64_t)self[1].super.super.isa & 0xFFFFFFLL;
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
  if (a4)
  {
    unint64_t v8 = a4;
    do
    {
      [v7 appendString:@"\t"];
      --v8;
    }
    while (v8);
  }
  id v9 = (id)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@{\n", v7];
  id v10 = [(_NSConstantDictionary *)self allKeys];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54___NSConstantDictionary_descriptionWithLocale_indent___block_invoke;
  v12[3] = &unk_264265B20;
  v12[4] = self;
  v12[5] = a3;
  v12[7] = v7;
  v12[8] = a4;
  v12[6] = v9;
  [v10 enumerateObjectsUsingBlock:v12];
  [v9 appendFormat:@"%@}\n", v7];
  return v9;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  int isa_high = HIDWORD(self[1].super.super.isa);
  unint64_t v5 = (uint64_t)self[1].super.super.isa & 0xFFFFFF;
  if ((isa_high - 2) <= 0xFFFFFFFC && v5 != 0)
  {
    unint64_t v7 = 0;
    unint64_t v8 = (isa_high / 2);
    id v9 = self + 3;
    unint64_t v10 = 1;
    do
    {
      Class isa = v9[-1].super.super.isa;
      if (isa)
      {
        if (a4) {
          a4[v7] = isa;
        }
        if (a3) {
          a3[v7] = v9->super.super.isa;
        }
        ++v7;
      }
      if (v10 >= v8) {
        break;
      }
      v9 += 2;
      ++v10;
    }
    while (v7 < v5);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  int v5 = HIDWORD(self[1].super.super.isa) + (SHIDWORD(self[1].super.super.isa) < 0);
  unint64_t v6 = (uint64_t)self[1].super.super.isa & 0xFFFFFF;
  unint64_t var0 = a3->var0;
  if (!a3->var0)
  {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_0;
    a3->var3[0] = 0;
  }
  if (var0 >= v6) {
    return 0;
  }
  unsigned int v8 = v5 >> 1;
  a3->var1 = a4;
  unint64_t v9 = a3->var3[0];
  int v10 = v9;
  if (v8 <= v9 || a5 == 0)
  {
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v13 = 0;
    int v14 = 2 * v9;
    do
    {
      Class isa = self[v14 + 2].super.super.isa;
      if (isa)
      {
        unint64_t v12 = v13 + 1;
        a4[v13] = isa;
        unint64_t v16 = a3->var0 + 1;
        a3->unint64_t var0 = v16;
        if (v16 == v6) {
          break;
        }
      }
      else
      {
        unint64_t v12 = v13;
      }
      if (v8 <= ++v10) {
        break;
      }
      v14 += 2;
      unint64_t v13 = v12;
    }
    while (v12 < a5);
  }
  a3->var3[0] = v10;
  return v12;
}

@end