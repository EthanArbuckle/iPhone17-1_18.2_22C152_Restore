@interface NSRLEArray
- (NSRLEArray)init;
- (NSRLEArray)initWithRefCountedRunArray:(_NSRefCountedRunArray *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)objectAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 runIndex:(unint64_t *)a5;
- (id)objectAtRunIndex:(unint64_t)a3 length:(unint64_t *)a4;
- (unint64_t)count;
- (void)_makeNewListFrom:(_NSRefCountedRunArray *)a3;
- (void)dealloc;
@end

@implementation NSRLEArray

- (NSRLEArray)init
{
  return [(NSRLEArray *)self initWithRefCountedRunArray:0];
}

- (NSRLEArray)initWithRefCountedRunArray:(_NSRefCountedRunArray *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)NSRLEArray;
  v4 = [(NSRLEArray *)&v8 init];
  v5 = v4;
  if (a3)
  {
    v4->theList = a3;
    os_unfair_lock_lock(&a3->var0);
    p_var0 = &v5->theList->var0;
    ++p_var0[6]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(p_var0);
  }
  else
  {
    [(NSRLEArray *)v4 _makeNewListFrom:0];
  }
  return v5;
}

- (void)_makeNewListFrom:(_NSRefCountedRunArray *)a3
{
  if (a3) {
    unsigned int var4 = a3->var4;
  }
  else {
    unsigned int var4 = 2;
  }
  theList = (_NSRefCountedRunArray *)malloc_type_malloc(16 * var4 + 40, 0x928F93A3uLL);
  self->theList = theList;
  theList->var0._os_unfair_lock_opaque = 0;
  theList->var5 = var4;
  if (a3)
  {
    LODWORD(v7) = a3->var4;
    if (v7)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 0;
      do
      {
        id var1 = a3->var7[v8].var1;
        theList->var7[v8].var0 = a3->var7[v8].var0;
        id v11 = var1;
        theList = self->theList;
        theList->var7[v8].id var1 = v11;
        ++v9;
        unint64_t v7 = a3->var4;
        ++v8;
      }
      while (v9 < v7);
    }
    theList->unsigned int var4 = v7;
    os_unfair_lock_lock((os_unfair_lock_t)&__NSRLEArrayLock);
    v12 = self->theList;
    v12->var6 = a3->var6;
    v12->var2 = a3->var2;
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSRLEArrayLock);
    theList = self->theList;
    theList->id var1 = a3->var1;
    --a3->var3;
  }
  else
  {
    theList->var6 = 0;
    theList->unsigned int var4 = 0;
    theList->id var1 = 0;
    theList->var2 = 0;
  }
  theList->var3 = 1;
}

- (id)objectAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4 runIndex:(unint64_t *)a5
{
  theList = self->theList;
  if (theList->var1 <= a3)
  {
    id v11 = (objc_class *)objc_opt_class();
    v12 = _NSNameOfClass(v11);
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: Out of bounds", v12, sel_getName(a2)), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  unint64_t v8 = blockForLocation((uint64_t)theList, a3, &a4->location);
  if (a5) {
    *a5 = v8;
  }
  return self->theList->var7[v8].var1;
}

- (id)objectAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  theList = self->theList;
  if (theList->var1 <= a3)
  {
    unint64_t v7 = (objc_class *)objc_opt_class();
    unint64_t v8 = _NSNameOfClass(v7);
    unint64_t v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s %s: Out of bounds", v8, sel_getName(a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  return theList->var7[blockForLocation((uint64_t)self->theList, a3, &a4->location)].var1;
}

- (id)objectAtRunIndex:(unint64_t)a3 length:(unint64_t *)a4
{
  theList = self->theList;
  if (theList->var4 <= a3) {
    return 0;
  }
  if (a4) {
    *a4 = theList->var7[a3].var0;
  }
  return theList->var7[a3].var1;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[NSMutableRLEArray allocWithZone:a3];
  theList = self->theList;

  return [(NSRLEArray *)v4 initWithRefCountedRunArray:theList];
}

- (unint64_t)count
{
  return self->theList->var1;
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&self->theList->var0);
  theList = self->theList;
  unsigned int var3 = theList->var3;
  BOOL v5 = var3 != 0;
  unsigned int v6 = var3 - 1;
  if (v6 != 0 && v5)
  {
    theList->unsigned int var3 = v6;
    os_unfair_lock_unlock(&theList->var0);
  }
  else
  {
    os_unfair_lock_unlock(&theList->var0);
    unint64_t v7 = self->theList;
    if (v7->var4)
    {
      unint64_t v8 = 0;
      uint64_t v9 = 48;
      do
      {

        ++v8;
        unint64_t v7 = self->theList;
        v9 += 16;
      }
      while (v8 < v7->var4);
    }
    free(v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSRLEArray;
  [(NSRLEArray *)&v10 dealloc];
}

- (id)description
{
  v3 = +[NSMutableString stringWithCapacity:100];
  [(NSMutableString *)v3 appendFormat:@"Length %ld (%d blocks, %d used, block %d is at %ld)\n", self->theList->var1, self->theList->var5, self->theList->var4, self->theList->var6, self->theList->var2];
  theList = self->theList;
  if (theList->var4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      [(NSMutableString *)v3 appendFormat:@" %ld %p %@\n", theList->var7[v5].var0, theList->var7[v5].var1, theList->var7[v5].var1];
      ++v6;
      theList = self->theList;
      ++v5;
    }
    while (v6 < theList->var4);
  }
  return v3;
}

@end