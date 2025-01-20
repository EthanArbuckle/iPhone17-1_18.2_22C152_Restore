@interface CAPresentationModifierGroup
+ (id)groupWithCapacity:(unint64_t)a3;
- (BOOL)updatesAsynchronously;
- (CAPresentationModifierGroup)initWithCapacity:(unint64_t)a3;
- (unint64_t)capacity;
- (unint64_t)count;
- (unint64_t)nextSlotWithPayloadSize:(unint64_t)a3;
- (void)_renderShmem;
- (void)_setLocalContextId:(unsigned int)a3;
- (void)dealloc;
- (void)flush;
- (void)flushLocally;
- (void)flushLocallyWithTargetTime:(double)a3;
- (void)flushWithTargetTime:(double)a3;
- (void)flushWithTransaction;
- (void)flushWithTransactionAndTargetTime:(double)a3;
- (void)markWritten:(unint64_t)a3;
- (void)resetBitMask;
- (void)setUpdatesAsynchronously:(BOOL)a3;
- (void)shmem;
@end

@implementation CAPresentationModifierGroup

- (void)shmem
{
  return self->_shmem;
}

- (void)markWritten:(unint64_t)a3
{
  IndexedIvars = (char *)object_getIndexedIvars(self);
  *(_DWORD *)&IndexedIvars[(a3 >> 3) & 0x1FFFFFFFFFFFFFFCLL] |= 1 << a3;
}

- (unint64_t)nextSlotWithPayloadSize:(unint64_t)a3
{
  if (self->_count == self->_capacity) {
    [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifierGroup", @"%@: attempted to add modifier past group's capacity", self format];
  }
  unint64_t v5 = a3 + 8;
  unint64_t v6 = self->_totalSize + a3 + 8;
  shmem = self->_shmem;
  unint64_t v8 = *((void *)shmem + 2);
  if (v6 > v8)
  {
    if (v6 <= 2 * v8) {
      unint64_t v9 = 2 * v8;
    }
    else {
      unint64_t v9 = self->_totalSize + a3 + 8;
    }
    v10 = (void **)CA::Render::Shmem::new_shmem((CA::Render::Shmem *)((v9 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00]));
    if (!v10) {
      [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifierGroup", @"%@: failed to allocate memory (%zu)", self, v9 format];
    }
    unint64_t count = self->_count;
    size_t v12 = *((void *)shmem + 2) - 8 * count;
    memcpy(v10[3], *((const void **)shmem + 3), v12);
    memcpy((char *)v10[2] + (void)v10[3] + -8 * count, (const void *)(*((void *)shmem + 3) + v12), 8 * count);
    v13 = (atomic_uint *)self->_shmem;
    if (atomic_fetch_add(v13 + 2, 0xFFFFFFFF) == 1) {
      (*(void (**)(atomic_uint *))(*(void *)v13 + 16))(v13);
    }
    self->_shmem = v10;
    unint64_t v6 = self->_totalSize + v5;
  }
  unint64_t result = self->_count;
  self->_unint64_t count = result + 1;
  self->_totalSize = v6;
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  shmem = (atomic_uint *)self->_shmem;
  if (shmem && atomic_fetch_add(shmem + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *, SEL))(*(void *)shmem + 16))(shmem, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAPresentationModifierGroup;
  [(CAPresentationModifierGroup *)&v4 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void)flush
{
}

- (void)flushWithTransactionAndTargetTime:(double)a3
{
  localId = (CA::Context *)self->_localId;
  if (localId)
  {
    unint64_t v6 = CA::Context::retain_context_with_id(localId);
    if (v6)
    {
      unint64_t v8 = v6;
      uint64_t v9 = *((void *)self->_shmem + 3);
      *(_DWORD *)(v9 + 12) = self->_count;
      *(double *)(v9 + 8 * *(unsigned int *)(v9 + 4) + 16) = a3;
      CA::Transaction::add_command((CA::Transaction *)0x19, self->_localId, 0, self, v7);
      (**((void (***)(uint64_t))v8 + 27))((uint64_t)(v8 + 54));
    }
    [(CAPresentationModifierGroup *)self flushLocallyWithTargetTime:a3];
  }
  else
  {
    -[CAPresentationModifierGroup flushWithTargetTime:](self, "flushWithTargetTime:");
  }
}

- (void)setUpdatesAsynchronously:(BOOL)a3
{
  v3 = (atomic_uint *)*((void *)self->_shmem + 3);
  do
  {
    int v4 = *v3 & 0x7FFFFFFF;
    unsigned int v5 = *v3 & 0x3FFFFFFF;
    if (!a3) {
      unsigned int v5 = *v3 & 0x3FFFFFFF | 0x40000000;
    }
    int v6 = *v3 & 0x7FFFFFFF;
    atomic_compare_exchange_strong(v3, (unsigned int *)&v6, v5);
  }
  while (v6 != v4);
}

- (void)_setLocalContextId:(unsigned int)a3
{
  self->_localId = a3;
}

- (void)flushWithTargetTime:(double)a3
{
  [(CAPresentationModifierGroup *)self flushLocallyWithTargetTime:a3];
  int v4 = (atomic_uint *)*((void *)self->_shmem + 3);
  v4[3] = self->_count;
  v4[1] = v4[1] == 0;
  do
  {
    int v5 = *v4 & 0x7FFFFFFF;
    int v6 = v5;
    atomic_compare_exchange_strong(v4, (unsigned int *)&v6, *v4 & 0x7FFFFFFE | v4[1]);
  }
  while (v6 != v5);
}

- (void)resetBitMask
{
  IndexedIvars = object_getIndexedIvars(self);
  bzero(IndexedIvars, ((self->_count + 31) >> 3) & 0x1FFFFFFFFFFFFFFCLL);
  unint64_t count = self->_count;
  if ((count & 0x1F) != 0) {
    *((_DWORD *)IndexedIvars + ((count + 31) >> 5) - 1) = -1 << (count & 0x1F);
  }
}

- (void)flushLocallyWithTargetTime:(double)a3
{
  IndexedIvars = object_getIndexedIvars(self);
  shmem = self->_shmem;
  uint64_t v7 = shmem[3];
  uint64_t v8 = *(unsigned int *)(v7 + 4);
  *(double *)(v7 + 8 * v8 + 16) = a3;
  unint64_t v9 = self->_count + 31;
  if (v9 >= 0x20)
  {
    unint64_t v10 = 0;
    unsigned int v11 = 0;
    unint64_t v12 = v9 >> 5;
    do
    {
      unsigned int v13 = IndexedIvars[v10];
      if (v13 != -1)
      {
        for (uint64_t i = 0; i != 32; ++i)
        {
          if (((v13 >> i) & 1) == 0)
          {
            unint64_t v15 = shmem[2];
            unint64_t v16 = v15 - 40;
            if (v15 >= 0x28 && i + (unint64_t)v11 < v16 >> 3)
            {
              unint64_t v17 = v7 + v15 - 8 * (i + v11);
              uint64_t v18 = *(unsigned int *)(v17 - 8);
              if (v18)
              {
                uint64_t v19 = (16 * v18) | 8;
                unint64_t v20 = *(unsigned int *)(v17 - 4);
                if (v16 >= v20 && 3 * v19 + v20 <= v16)
                {
                  if (v8) {
                    uint64_t v22 = (16 * v18) | 8;
                  }
                  else {
                    uint64_t v22 = 0;
                  }
                  if (v8) {
                    uint64_t v19 = 0;
                  }
                  *(_WORD *)(v7 + 40 + v20 + v19) = *(_WORD *)(v7 + 40 + v20 + v22);
                  unint64_t v23 = 2 * v18;
                  if (v23 <= 1) {
                    unint64_t v23 = 1;
                  }
                  unint64_t v24 = v7 + 48 + v20;
                  v25 = (void *)(v24 + v19);
                  v26 = (uint64_t *)(v24 + v22);
                  do
                  {
                    uint64_t v27 = *v26++;
                    *v25++ = v27;
                    --v23;
                  }
                  while (v23);
                }
              }
            }
          }
        }
      }
      ++v10;
      v11 += 32;
    }
    while (v10 < v12);
  }

  [(CAPresentationModifierGroup *)self resetBitMask];
}

+ (id)groupWithCapacity:(unint64_t)a3
{
  size_t v4 = ((a3 + 31) >> 3) & 0x1FFFFFFFFFFFFFFCLL;
  int v5 = (objc_class *)objc_opt_class();
  int v6 = objc_msgSend(class_createInstance(v5, v4), "initWithCapacity:", a3);

  return v6;
}

- (CAPresentationModifierGroup)initWithCapacity:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)CAPresentationModifierGroup;
  size_t v4 = [(CAPresentationModifierGroup *)&v14 init];
  if (v4)
  {
    if (a3)
    {
      if (!is_mul_ok(a3, 0x3D8uLL)
        || !(984 * a3)
        || ((unint64_t v5 = 992 * a3, !__CFADD__(984 * a3, 8 * a3)) ? (v6 = 0) : (v6 = 1),
            (v7 = __CFADD__(v5, 40), unint64_t v8 = v5 + 40, !v7) ? (v9 = 0) : (v9 = 1),
            a3 >> 61 || (v6 & 1) != 0 || (v9 & 1) != 0 || !v8))
      {
        [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifierGroup", @"%@: group capacity (%zu) too large", v4, a3 format];
      }
      else
      {
        unint64_t v10 = CA::Render::Shmem::new_shmem((CA::Render::Shmem *)((v8 + *MEMORY[0x1E4F14B00] - 1) & -*MEMORY[0x1E4F14B00]));
        v4->_shmem = v10;
        v4->_capacity = a3;
        if (v10)
        {
          IndexedIvars = object_getIndexedIvars(v4);
          memset(IndexedIvars, 255, ((v4->_capacity + 31) >> 3) & 0x1FFFFFFFFFFFFFFCLL);
          return v4;
        }
      }
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:@"CAPresentationModifierGroup", @"%@: cannot create group with 0 capacity", v4, v13 format];
    }

    return 0;
  }
  return v4;
}

- (void)flushWithTransaction
{
}

- (void)_renderShmem
{
  return self->_shmem;
}

- (void)flushLocally
{
}

- (BOOL)updatesAsynchronously
{
  return (**((_DWORD **)self->_shmem + 3) & 0x40000000) == 0;
}

@end