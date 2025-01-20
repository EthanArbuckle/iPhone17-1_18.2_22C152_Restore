@interface __NSSetI
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
- (BOOL)containsObject:(id)a3;
- (double)clumpingFactor;
- (double)clumpingInterestingThreshold;
- (id)member:(id)a3;
- (id)objectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)countForObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 count:(unint64_t)a4;
@end

@implementation __NSSetI

- (BOOL)containsObject:(id)a3
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  unsigned int v3 = self->_used[7];
  v14 = off_1ECE0A5A0;
  uint64_t v15 = 3221225472;
  v16 = __27____NSSetI_containsObject___block_invoke;
  v17 = &unk_1ECDB07B8;
  v18 = &v19;
  if (v3 >= 4)
  {
    unint64_t v5 = *(void *)((char *)&__NSSetSizes + ((2 * v3) & 0x1F8));
    v6 = (char *)self + 16;
    unint64_t v7 = objc_msgSend(a3, "hash", v14, v15) % v5;
    if (v5 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v5;
    }
    while (1)
    {
      id v9 = *(id *)&v6[8 * v7];
      BOOL v10 = !v9 || v9 == a3;
      if (v10 || ([v9 isEqual:a3] & 1) != 0) {
        break;
      }
      if (v7 + 1 >= v5) {
        unint64_t v11 = v5;
      }
      else {
        unint64_t v11 = 0;
      }
      unint64_t v7 = v7 + 1 - v11;
      if (!--v8) {
        goto LABEL_17;
      }
    }
    if (v7 < v5) {
      v16((uint64_t)&v14, *(void *)&v6[8 * v7]);
    }
  }
LABEL_17:
  char v12 = *((unsigned char *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  return v12;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v19[1] = *(void *)off_1ECE0A5B0;
  if (!a4 && a5)
  {
    uint64_t v12 = _os_log_pack_size();
    v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v14 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v14 = 136315394;
    *(void *)(v14 + 4) = "-[__NSSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v14 + 12) = 2048;
    *(void *)(v14 + 14) = a5;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSetI countByEnumeratingWithState:objects:count:]", a5);
    goto LABEL_18;
  }
  if (a5 >> 61)
  {
    uint64_t v12 = _os_log_pack_size();
    v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v17 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v17 = 136315394;
    *(void *)(v17 + 4) = "-[__NSSetI countByEnumeratingWithState:objects:count:]";
    *(_WORD *)(v17 + 12) = 2048;
    *(void *)(v17 + 14) = a5;
    CFStringRef v15 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSetI countByEnumeratingWithState:objects:count:]", a5);
LABEL_18:
    v18 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v15) userInfo:0 osLogPack:v13 size:v12];
    objc_exception_throw(v18);
  }
  unint64_t v6 = *(void *)((char *)__NSSetSizes + ((2 * self->_used[7]) & 0x1F8));
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_3;
  }
  if (v6 <= var0) {
    return 0;
  }
  a3->var1 = a4;
  if (!a5) {
    return 0;
  }
  unint64_t result = 0;
  id v9 = (char *)self + 16;
  do
  {
    BOOL v10 = *(void **)&v9[8 * var0++];
    a3->unint64_t var0 = var0;
    if (v10)
    {
      a4[result++] = v10;
      unint64_t var0 = a3->var0;
    }
  }
  while (var0 < v6 && result < a5);
  return result;
}

- (unint64_t)count
{
  return *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
}

- (unint64_t)countForObject:(id)a3
{
  uint64_t v23 = *(void *)off_1ECE0A5B0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  unsigned int v3 = self->_used[7];
  uint64_t v14 = off_1ECE0A5A0;
  uint64_t v15 = 3221225472;
  v16 = __27____NSSetI_countForObject___block_invoke;
  uint64_t v17 = &unk_1ECDB07B8;
  v18 = &v19;
  if (v3 >= 4)
  {
    unint64_t v5 = *(void *)((char *)__NSSetSizes + ((2 * v3) & 0x1F8));
    unint64_t v6 = (char *)self + 16;
    unint64_t v7 = objc_msgSend(a3, "hash", v14, v15) % v5;
    if (v5 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v5;
    }
    while (1)
    {
      id v9 = *(id *)&v6[8 * v7];
      BOOL v10 = !v9 || v9 == a3;
      if (v10 || ([v9 isEqual:a3] & 1) != 0) {
        break;
      }
      if (v7 + 1 >= v5) {
        unint64_t v11 = v5;
      }
      else {
        unint64_t v11 = 0;
      }
      unint64_t v7 = v7 + 1 - v11;
      if (!--v8) {
        goto LABEL_17;
      }
    }
    if (v7 < v5) {
      v16((uint64_t)&v14, *(void *)&v6[8 * v7]);
    }
  }
LABEL_17:
  unint64_t v12 = v20[3];
  _Block_object_dispose(&v19, 8);
  return v12;
}

- (void)getObjects:(id *)a3 count:(unint64_t)a4
{
  v18[1] = *(void *)off_1ECE0A5B0;
  if (!a3 && a4)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v13 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v13 = 136315394;
    *(void *)(v13 + 4) = "-[__NSSetI getObjects:count:]";
    *(_WORD *)(v13 + 12) = 2048;
    *(void *)(v13 + 14) = a4;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: pointer to objects array is NULL but length is %lu", "-[__NSSetI getObjects:count:]", a4);
    goto LABEL_18;
  }
  if (a4 >> 61)
  {
    uint64_t v11 = _os_log_pack_size();
    unint64_t v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136315394;
    *(void *)(v16 + 4) = "-[__NSSetI getObjects:count:]";
    *(_WORD *)(v16 + 12) = 2048;
    *(void *)(v16 + 14) = a4;
    CFStringRef v14 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: count (%lu) of objects array is ridiculous", "-[__NSSetI getObjects:count:]", a4);
LABEL_18:
    uint64_t v17 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v14) userInfo:0 osLogPack:v12 size:v11];
    objc_exception_throw(v17);
  }
  unsigned int v4 = self->_used[7];
  unint64_t v5 = *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
  if (v5 >= a4) {
    unint64_t v5 = a4;
  }
  if (v4 >= 4 && v5 != 0)
  {
    unint64_t v7 = 0;
    unint64_t v8 = *(void *)((char *)__NSSetSizes + ((2 * v4) & 0x1F8));
    do
    {
      id v9 = *(void **)&self->_used[8 * v7 + 8];
      if (v9)
      {
        *a3++ = v9;
        --v5;
      }
      ++v7;
    }
    while (v7 < v8 && v5);
  }
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v18 = *(void *)off_1ECE0A5B0;
  if (!a4)
  {
    uint64_t v11 = _os_log_pack_size();
    uint64_t v12 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v12 = 136315138;
    *(void *)(v12 + 4) = "-[__NSSetI enumerateObjectsWithOptions:usingBlock:]";
    CFStringRef v13 = CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, @"*** %s: block cannot be nil", "-[__NSSetI enumerateObjectsWithOptions:usingBlock:]");
    CFStringRef v14 = +[NSException exceptionWithName:@"NSInvalidArgumentException" reason:_CFAutoreleasePoolAddObject(0, (uint64_t)v13) userInfo:0 osLogPack:(char *)block - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0) size:v11];
    objc_exception_throw(v14);
  }
  char v5 = a3;
  unsigned int v7 = self->_used[7];
  size_t v8 = *(void *)((char *)__NSSetSizes + ((2 * v7) & 0x1F8));
  if ((a3 & 1) != 0 && __CFActiveProcessorCount() < 2) {
    char v5 = 0;
  }
  if (v5)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    char v17 = 0;
    block[0] = off_1ECE0A5A0;
    block[1] = 3221225472;
    block[2] = __51____NSSetI_enumerateObjectsWithOptions_usingBlock___block_invoke;
    block[3] = &unk_1ECDB07E0;
    block[5] = a4;
    block[6] = v16;
    block[4] = self;
    dispatch_apply(v8, 0, block);
    _Block_object_dispose(v16, 8);
  }
  else
  {
    LOBYTE(v16[0]) = 0;
    if (v7 >= 4)
    {
      size_t v9 = 0;
      do
      {
        if (*(void *)&self->_used[8 * v9 + 8])
        {
          BOOL v10 = (void *)_CFAutoreleasePoolPush();
          __NSSET_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v10);
        }
        ++v9;
      }
      while (v9 < v8);
    }
  }
}

- (id)member:(id)a3
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3052000000;
  uint64_t v22 = __Block_byref_object_copy_;
  uint64_t v23 = __Block_byref_object_dispose_;
  uint64_t v24 = 0;
  unsigned int v3 = self->_used[7];
  CFStringRef v14 = off_1ECE0A5A0;
  uint64_t v15 = 3221225472;
  uint64_t v16 = __19____NSSetI_member___block_invoke;
  char v17 = &unk_1ECDB07B8;
  uint64_t v18 = &v19;
  if (v3 >= 4)
  {
    unint64_t v5 = *(void *)((char *)__NSSetSizes + ((2 * v3) & 0x1F8));
    unint64_t v6 = (char *)self + 16;
    unint64_t v7 = objc_msgSend(a3, "hash", v14, v15) % v5;
    if (v5 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v5;
    }
    while (1)
    {
      id v9 = *(id *)&v6[8 * v7];
      BOOL v10 = !v9 || v9 == a3;
      if (v10 || ([v9 isEqual:a3] & 1) != 0) {
        break;
      }
      if (v7 + 1 >= v5) {
        unint64_t v11 = v5;
      }
      else {
        unint64_t v11 = 0;
      }
      unint64_t v7 = v7 + 1 - v11;
      if (!--v8) {
        goto LABEL_17;
      }
    }
    if (v7 < v5) {
      v16((uint64_t)&v14, *(void *)&v6[8 * v7]);
    }
  }
LABEL_17:
  uint64_t v12 = (void *)v20[5];
  _Block_object_dispose(&v19, 8);
  return v12;
}

- (void)dealloc
{
  uint64_t v8 = *(void *)off_1ECE0A5B0;
  if ((__NSSetI *)__NSSet0__ == self) {
    __break(1u);
  }
  unsigned int v3 = self->_used[7];
  unint64_t v4 = *(void *)((char *)__NSSetSizes + ((2 * v3) & 0x1F8));
  self->_used[7] = v3 & 3;
  *(void *)self->_used &= 0xFC00000000000000;
  if (v3 >= 4)
  {
    unint64_t v5 = (id *)((char *)self + 16);
    if (v4 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v4;
    }
    do
    {
      if ((uint64_t)*v5 >= 1) {

      }
      ++v5;
      --v6;
    }
    while (v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)__NSSetI;
  [(__NSSetI *)&v7 dealloc];
}

- (id)objectEnumerator
{
  v2 = (void *)[objc_allocWithZone((Class)__NSFastEnumerationEnumerator) initWithObject:self];

  return v2;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (double)clumpingFactor
{
  uint64_t v25 = *(void *)off_1ECE0A5B0;
  uint64_t v3 = *(void *)self->_used;
  if ((v3 & 0x3FFFFFFFFFFFFFELL) != 0) {
    uint64_t v4 = v3 & 0x3FFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v4 = 1;
  }
  unint64_t v5 = MEMORY[0x1F4188790](v4, a2);
  uint64_t v8 = (char *)&v24 - v7;
  size_t v24 = 0;
  if (v6 >= 0x101)
  {
    uint64_t v8 = (char *)_CFCreateArrayStorage(v5, 0, &v24);
    unint64_t v6 = *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  -[__NSSetI getObjects:count:](self, "getObjects:count:", v8, v6, v24, v25);
  size_t v10 = *(void *)self->_used & 0x3FFFFFFFFFFFFFFLL;
  double v11 = 0.0;
  if (v10 >= 2)
  {
    unint64_t v12 = *(void *)((char *)__NSSetSizes + ((2 * self->_used[7]) & 0x1F8));
    uint64_t v13 = 8 * v10;
    CFStringRef v14 = (uint64_t *)malloc_type_malloc(8 * v10 + 8, 0xDD117B67uLL);
    unint64_t v15 = 0;
    do
    {
      v14[v15 / 8] = [*(id *)&v8[v15] hash] % v12;
      v15 += 8;
    }
    while (v13 != v15);
    qsort(v14, v10, 8uLL, (int (__cdecl *)(const void *, const void *))_compare_clumpiness_0);
    unint64_t v16 = 0;
    uint64_t v17 = *v14;
    v14[v10] = *v14 + v12;
    double v18 = (double)v12 / (double)v10;
    double v19 = 0.0;
    do
    {
      uint64_t v20 = v14[v16 / 8 + 1];
      unint64_t v21 = v20 - v17;
      if (v18 <= (double)v21) {
        double v22 = 0.0;
      }
      else {
        double v22 = v18 - (double)v21;
      }
      double v19 = v19 + v22 * v22;
      v16 += 8;
      uint64_t v17 = v20;
    }
    while (v13 != v16);
    free(v14);
    double v11 = v19 * (double)v10 * (double)v10 / ((double)v12 * (double)v12) / ((double)v10 + -1.0);
  }
  free(v9);
  return v11;
}

- (double)clumpingInterestingThreshold
{
  double v2 = (double)*(unint64_t *)((char *)&__NSSetSizes + ((2 * self->_used[7]) & 0x1F8));
  return 1.0
       - ((double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL) + (double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL))
       / v2
       + (double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL)
       * (double)(*(void *)self->_used & 0x3FFFFFFFFFFFFFFLL)
       / v2
       / v2;
}

@end