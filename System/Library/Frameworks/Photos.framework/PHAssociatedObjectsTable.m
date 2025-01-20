@interface PHAssociatedObjectsTable
- (PHAssociatedObjectsTable)init;
- (id)_entryForObject:(id)a1;
- (id)_entryForObjectCreatingIfNecessary:(id)a1;
- (id)associatedObjectOnObject:(id)a3 forKey:(id)a4;
- (id)setAssociatedObjectIfNotSet:(id)a3 onObject:(id)a4 forKey:(id)a5;
- (int64_t)stripeCount;
- (void)_runWithLockedBucketForObject:(void *)a3 block:;
- (void)removeAllAssociatedObjectsOnObject:(id)a3;
- (void)removeAssociatedObjectOnObject:(id)a3 forKey:(id)a4;
- (void)setAssociatedObject:(id)a3 onObject:(id)a4 forKey:(id)a5;
@end

@implementation PHAssociatedObjectsTable

- (id)associatedObjectOnObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
    {
LABEL_3:
      -[PHAssociatedObjectsTable _entryForObject:](self, v7);
      v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = v9;
      goto LABEL_4;
    }
  }
  else
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 97, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 98, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  -[PHAssociatedObjectsTable _entryForObject:](self, v7);
  v10 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 0;
LABEL_4:
  v13 = -[PHAssociatedObjectsEntry associatedObjectForKey:](v10, v12);

  return v13;
}

- (id)_entryForObject:(id)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__29868;
    v13 = __Block_byref_object_dispose__29869;
    id v14 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__PHAssociatedObjectsTable__entryForObject___block_invoke;
    v6[3] = &unk_1E5846548;
    id v8 = &v9;
    id v7 = v3;
    -[PHAssociatedObjectsTable _runWithLockedBucketForObject:block:]((uint64_t)a1, v7, v6);
    a1 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

- (void)_runWithLockedBucketForObject:(void *)a3 block:
{
  id v5 = a2;
  if (a1)
  {
    uint64_t v6 = v5 >> 4;
    id v8 = v5;
    id v7 = a3;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 4 * v6 + 8));
    v7[2](v7, *(void *)(a1 + 8 * v6 + 72));

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4 * v6 + 8));
    id v5 = v8;
  }
}

void __44__PHAssociatedObjectsTable__entryForObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __63__PHAssociatedObjectsTable__entryForObjectCreatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = [v9 objectForKey:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v6 = objc_alloc_init(PHAssociatedObjectsEntry);
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [v9 setObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) forKey:*(void *)(a1 + 32)];
  }
}

- (id)setAssociatedObjectIfNotSet:(id)a3 onObject:(id)a4 forKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
LABEL_3:
      uint64_t v13 = -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v10);
      id v14 = (void *)v13;
      v15 = v9;
      v16 = v12;
      goto LABEL_4;
    }
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 114, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 115, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  uint64_t v13 = -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v10);
  id v14 = (void *)v13;
  v15 = v9;
  v16 = 0;
LABEL_4:
  v17 = -[PHAssociatedObjectsEntry setAssociatedObjectIfNotSet:forKey:](v13, v15, v16);

  return v17;
}

- (id)_entryForObjectCreatingIfNecessary:(id)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__29868;
    uint64_t v13 = __Block_byref_object_dispose__29869;
    id v14 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__PHAssociatedObjectsTable__entryForObjectCreatingIfNecessary___block_invoke;
    v6[3] = &unk_1E5846548;
    id v8 = &v9;
    id v7 = v3;
    -[PHAssociatedObjectsTable _runWithLockedBucketForObject:block:]((uint64_t)a1, v7, v6);
    a1 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }

  return a1;
}

uint64_t __63__PHAssociatedObjectsTable_removeAllAssociatedObjectsOnObject___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObjectForKey:*(void *)(a1 + 32)];
}

- (void)removeAllAssociatedObjectsOnObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 131, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__PHAssociatedObjectsTable_removeAllAssociatedObjectsOnObject___block_invoke;
  v8[3] = &unk_1E5846570;
  id v9 = v5;
  id v6 = v5;
  -[PHAssociatedObjectsTable _runWithLockedBucketForObject:block:]((uint64_t)self, v6, v8);
}

- (PHAssociatedObjectsTable)init
{
  v9.receiver = self;
  v9.super_class = (Class)PHAssociatedObjectsTable;
  v2 = [(PHAssociatedObjectsTable *)&v9 init];
  if (v2)
  {
    for (uint64_t i = 0; i != 16; ++i)
    {
      v2->_locks[i]._os_unfair_lock_opaque = 0;
      uint64_t v4 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:514 valueOptions:0];
      id v5 = &v2->super.isa + i;
      Class v6 = v5[9];
      v5[9] = (Class)v4;
    }
    id v7 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  for (uint64_t i = 192; i != 64; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

- (void)removeAssociatedObjectOnObject:(id)a3 forKey:(id)a4
{
  id v15 = a3;
  id v7 = a4;
  id v8 = v15;
  objc_super v9 = v7;
  if (v15)
  {
    if (v7)
    {
LABEL_3:
      uint64_t v10 = -[PHAssociatedObjectsTable _entryForObject:](self, v8);
      uint64_t v11 = (void *)v10;
      v12 = v9;
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 123, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];

    id v8 = 0;
    if (v9) {
      goto LABEL_3;
    }
  }
  id v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 124, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  uint64_t v10 = -[PHAssociatedObjectsTable _entryForObject:](self, v15);
  uint64_t v11 = (void *)v10;
  v12 = 0;
LABEL_4:
  -[PHAssociatedObjectsEntry setAssociatedObject:forKey:](v10, 0, v12);
}

- (void)setAssociatedObject:(id)a3 onObject:(id)a4 forKey:(id)a5
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v9)
  {
    if (v10)
    {
LABEL_3:
      uint64_t v12 = -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v9);
      uint64_t v13 = (void *)v12;
      id v14 = v18;
      id v15 = v11;
      goto LABEL_4;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 106, @"Invalid parameter not satisfying: %@", @"object != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"PHAssociatedObjectsTable.m", 107, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

  uint64_t v12 = -[PHAssociatedObjectsTable _entryForObjectCreatingIfNecessary:](self, v9);
  uint64_t v13 = (void *)v12;
  id v14 = v18;
  id v15 = 0;
LABEL_4:
  -[PHAssociatedObjectsEntry setAssociatedObject:forKey:](v12, v14, v15);
}

- (int64_t)stripeCount
{
  return 16;
}

@end