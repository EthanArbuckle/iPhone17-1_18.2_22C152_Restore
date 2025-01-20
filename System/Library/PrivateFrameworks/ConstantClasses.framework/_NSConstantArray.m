@interface _NSConstantArray
+ (id)alloc;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
@end

@implementation _NSConstantArray

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

- (unint64_t)count
{
  return LODWORD(self[1].super.super.isa);
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([(_NSConstantArray *)self count] > a3) {
    return self[a3 + 2].super.super.isa;
  }
  objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF488], @"Bounds of array exceeded. Accessed index %d in %d elements array", a3, -[_NSConstantArray count](self, "count"));
  return 0;
}

- (id)objectEnumerator
{
  v2 = [[_NSConstantArrayEnumerator alloc] initWithArray:&self[2] capacity:LODWORD(self[1].super.super.isa)];
  return v2;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  if (a3->var0) {
    return 0;
  }
  a3->var0 = -1;
  a3->var1 = (id *)&self[2].super.super.isa;
  a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu;
  return LODWORD(self[1].super.super.isa);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v6 = self + 1;
  uint64_t isa_low = LODWORD(self[1].super.super.isa);
  if ((a3 & 2) != 0)
  {
    do
    {
      if ((int)isa_low < 1) {
        break;
      }
      uint64_t v11 = isa_low - 1;
      char v12 = 0;
      (*((void (**)(id, Class, uint64_t, char *))a4 + 2))(a4, v6[isa_low].super.super.isa, isa_low - 1, &v12);
      uint64_t isa_low = v11;
    }
    while (!v12);
  }
  else if ((int)isa_low >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = isa_low - 1;
    v9 = self + 2;
    do
    {
      char v13 = 0;
      (*((void (**)(id, Class, uint64_t, char *))a4 + 2))(a4, v9[v7].super.super.isa, v7, &v13);
      if (v13) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v8 == v7;
      }
      ++v7;
    }
    while (!v10);
  }
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  char v6 = a4;
  int v9 = [a3 count];
  BOOL v10 = (uint64_t *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  [a3 getIndexes:v10 maxCount:v9 inIndexRange:0];
  if ((v6 & 2) != 0)
  {
    for (uint64_t i = v9; (int)i >= 1; uint64_t i = v16)
    {
      uint64_t v16 = i - 1;
      (*((void (**)(id, Class))a5 + 2))(a5, self[v10[i - 1] + 2].super.super.isa);
    }
  }
  else if (v9 >= 1)
  {
    uint64_t v11 = v9 - 1;
    char v12 = v10;
    do
    {
      uint64_t v13 = *v12++;
      (*((void (**)(id, Class))a5 + 2))(a5, self[v13 + 2].super.super.isa);
    }
    while (v11-- != 0);
  }
  free(v10);
}

@end