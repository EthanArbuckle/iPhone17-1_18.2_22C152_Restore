@interface _GCDevicePhysicalInputStateTable
+ stateTableWithCopyOfStateTable:(uint64_t)a1;
+ stateTableWithMagic:(unsigned int)a3 primitiveSlotCount:(unsigned int)a4 objectSlotCount:;
- (BOOL)testAndSetObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5 compareObjects:(BOOL)a6 previous:(id *)a7;
- (BOOL)testAndSetPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4 previous:(unint64_t *)a5;
- (_GCDevicePhysicalInputStateTable)init;
- (id)copy;
- (id)objectValueAtIndex:(unsigned int)a3;
- (uint64_t)generation;
- (unint64_t)primitiveValueAtIndex:(unsigned int)a3;
- (unsigned)magic;
- (unsigned)objectSlotCount;
- (unsigned)primitiveSlotCount;
- (void)dealloc;
- (void)setObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5;
- (void)setPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4;
- (void)updateStateTableWithContentsOf:(uint64_t)a1;
@end

@implementation _GCDevicePhysicalInputStateTable

+ stateTableWithMagic:(unsigned int)a3 primitiveSlotCount:(unsigned int)a4 objectSlotCount:
{
  self;
  v7 = (objc_class *)objc_opt_class();
  Instance = class_createInstance(v7, 16 * a4 + 8 * a3);
  Instance[2] = 0;
  *((_WORD *)Instance + 6) = a2;
  *((void *)Instance + 2) = 1;
  Instance[8] = a3;
  *((void *)Instance + 5) = object_getIndexedIvars(Instance);
  *((void *)Instance + 3) = 1;
  Instance[9] = a4;
  *((void *)Instance + 6) = (char *)object_getIndexedIvars(Instance) + 8 * a3;

  return Instance;
}

+ stateTableWithCopyOfStateTable:(uint64_t)a1
{
  uint64_t v3 = self;
  if (!a2) {
    objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_stateTableWithCopyOfStateTable_, v3, @"_GCDevicePhysicalInputStorage.m", 124, @"Invalid parameter not satisfying: %s", "otherState != nil");
  }
  v4 = +[_GCDevicePhysicalInputStateTable stateTableWithMagic:primitiveSlotCount:objectSlotCount:]((uint64_t)_GCDevicePhysicalInputStateTable, *(_WORD *)(a2 + 12), *(_DWORD *)(a2 + 32), *(_DWORD *)(a2 + 36));
  -[_GCDevicePhysicalInputStateTable updateStateTableWithContentsOf:]((uint64_t)v4, a2);
  return v4;
}

- (void)updateStateTableWithContentsOf:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int16 *)(a1 + 12) != *(unsigned __int16 *)(a2 + 12)) {
      objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, @"_GCDevicePhysicalInputStorage.m", 163, @"#BUG: Updating state %p from state %p with different magic.", a1, a2);
    }
    os_unfair_lock_lock_with_options();
    os_unfair_lock_lock_with_options();
    unint64_t v4 = *(void *)(a2 + 16);
    unint64_t v5 = *(void *)(a1 + 16);
    if (v4 < v5)
    {
      objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, @"_GCDevicePhysicalInputStorage.m", 169, @"#BUG: Updating state %p from state %p with earlier generation.", a1, a2);
      unint64_t v4 = *(void *)(a2 + 16);
      unint64_t v5 = *(void *)(a1 + 16);
    }
    if (v4 > v5)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 32);
      if (v6 != *(_DWORD *)(a2 + 32))
      {
        objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, @"_GCDevicePhysicalInputStorage.m", 173, @"#BUG: Updating state %p from state %p with different primitive slot count.", a1, a2);
        unsigned int v6 = *(_DWORD *)(a1 + 32);
      }
      memcpy(*(void **)(a1 + 40), *(const void **)(a2 + 40), 8 * v6);
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
    }
    unint64_t v7 = *(void *)(a2 + 24);
    unint64_t v8 = *(void *)(a1 + 24);
    if (v7 < v8)
    {
      objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, @"_GCDevicePhysicalInputStorage.m", 180, @"#BUG: Updating state %p from state %p with earlier generation.", a1, a2);
      unint64_t v7 = *(void *)(a2 + 24);
      unint64_t v8 = *(void *)(a1 + 24);
    }
    if (v7 > v8)
    {
      unint64_t v9 = *(unsigned int *)(a1 + 36);
      if (v9 == *(_DWORD *)(a2 + 36))
      {
        if (*(_DWORD *)(a1 + 36))
        {
LABEL_15:
          uint64_t v10 = 0;
          unint64_t v11 = 0;
          uint64_t v12 = *(void *)(a1 + 48);
          uint64_t v13 = *(void *)(a2 + 48);
          while (1)
          {
            uint64_t v14 = v12 + v10;
            v15 = *(void **)(v12 + v10 + 8);
            if (v15 != *(void **)(v13 + v10 + 8)) {
              break;
            }
            uint64_t v16 = *(void *)(v12 + v10);
            if (v16 != *(void *)(v13 + v10)) {
              goto LABEL_19;
            }
LABEL_25:
            ++v11;
            v10 += 16;
            if (v11 >= v9) {
              goto LABEL_26;
            }
          }
          uint64_t v16 = *(void *)(v12 + v10);
LABEL_19:
          if (v16)
          {

            uint64_t v13 = *(void *)(a2 + 48);
          }
          *(void *)(v14 + 8) = 0;
          v17 = *(void **)(v13 + v10 + 8);
          if (*(void *)(v13 + v10))
          {
            id v18 = v17;
            uint64_t v12 = *(void *)(a1 + 48);
            *(void *)(v12 + v10 + 8) = v18;
            uint64_t v13 = *(void *)(a2 + 48);
          }
          else
          {
            uint64_t v12 = *(void *)(a1 + 48);
            *(void *)(v12 + v10 + 8) = v17;
          }
          *(void *)(v12 + v10) = *(void *)(v13 + v10);
          unint64_t v9 = *(unsigned int *)(a1 + 36);
          goto LABEL_25;
        }
      }
      else
      {
        objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel_updateStateTableWithContentsOf_, a1, @"_GCDevicePhysicalInputStorage.m", 184, @"#BUG: Updating state %p from state %p with different object slot count.", a1, a2);
        unint64_t v9 = *(unsigned int *)(a1 + 36);
        if (*(_DWORD *)(a1 + 36)) {
          goto LABEL_15;
        }
      }
LABEL_26:
      *(void *)(a1 + 24) = *(void *)(a2 + 24);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 8));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 8));
  }
}

- (_GCDevicePhysicalInputStateTable)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputStateTable;
  result = [(_GCDevicePhysicalInputStateTable *)&v3 init];
  result->_stateLock._os_unfair_lock_opaque = 0;
  result->_magic = -1;
  return result;
}

- (void)dealloc
{
  unint64_t objectSlotCount = self->_objectSlotCount;
  if (objectSlotCount)
  {
    uint64_t v4 = 0;
    for (unint64_t i = 0; i < objectSlotCount; ++i)
    {
      unsigned int v6 = &self->_objectState[v4];
      if (v6->var0)
      {

        unint64_t objectSlotCount = self->_objectSlotCount;
      }
      v6->var1 = 0;
      ++v4;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_GCDevicePhysicalInputStateTable;
  [(_GCDevicePhysicalInputStateTable *)&v7 dealloc];
}

- (id)copy
{
  return [(_GCDevicePhysicalInputStateTable *)self copyWithZone:0];
}

- (uint64_t)generation
{
  if (result)
  {
    if (*(void *)(result + 16) <= *(void *)(result + 24)) {
      return *(void *)(result + 24);
    }
    else {
      return *(void *)(result + 16);
    }
  }
  return result;
}

- (unint64_t)primitiveValueAtIndex:(unsigned int)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if (self->_primitiveSlotCount <= a3) {
    -[_GCDevicePhysicalInputStateTable primitiveValueAtIndex:]();
  }
  unint64_t var0 = self->_primitiveState[a3].var0;
  os_unfair_lock_unlock(p_stateLock);
  return var0;
}

- (void)setPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_primitiveSlotCount <= a4) {
    -[_GCDevicePhysicalInputStateTable setPrimitiveValue:atIndex:]();
  }
  self->_primitiveState[a4].unint64_t var0 = a3;
  ++self->_primitiveStateGeneration;

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)testAndSetPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4 previous:(unint64_t *)a5
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_primitiveSlotCount <= a4) {
    -[_GCDevicePhysicalInputStateTable testAndSetPrimitiveValue:atIndex:previous:]();
  }
  primitiveState = self->_primitiveState;
  unint64_t var0 = primitiveState[a4].var0;
  if (var0 != a3)
  {
    if (a5) {
      *a5 = var0;
    }
    primitiveState[a4].unint64_t var0 = a3;
    ++self->_primitiveStateGeneration;
  }
  BOOL v12 = var0 != a3;
  os_unfair_lock_unlock(p_stateLock);
  return v12;
}

- (id)objectValueAtIndex:(unsigned int)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock_with_options();
  if (self->_objectSlotCount <= a3) {
    -[_GCDevicePhysicalInputStateTable objectValueAtIndex:]();
  }
  id v6 = self->_objectState[a3].var1;
  os_unfair_lock_unlock(p_stateLock);

  return v6;
}

- (void)setObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_objectSlotCount <= a4) {
    -[_GCDevicePhysicalInputStateTable setObjectValue:atIndex:policy:]();
  }
  objectState = self->_objectState;
  uint64_t v11 = a4;
  BOOL v12 = &objectState[a4];
  unint64_t var0 = v12->var0;
  p_var1 = &v12->var1;
  if (var0)
  {

    objectState = self->_objectState;
  }
  id *p_var1 = 0;
  if ((uint64_t)a5 <= 2)
  {
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (a5 != 3 && a5 != 771)
  {
LABEL_9:
    id v15 = a3;
    goto LABEL_10;
  }
  id v15 = (id)[a3 copyWithZone:0];
LABEL_10:
  a3 = v15;
LABEL_11:
  objectState[v11].var1 = a3;
  self->_objectState[v11].unint64_t var0 = a5;
  ++self->_objectStateGeneration;

  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)testAndSetObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5 compareObjects:(BOOL)a6 previous:(id *)a7
{
  BOOL v8 = a6;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_objectSlotCount <= a4) {
    -[_GCDevicePhysicalInputStateTable testAndSetObjectValue:atIndex:policy:compareObjects:previous:]();
  }
  uint64_t v14 = &self->_objectState[a4];
  id var1 = v14->var1;
  if (v8)
  {
    if (var1 == a3 || ([a3 isEqual:v14->var1] & 1) != 0) {
      goto LABEL_5;
    }
LABEL_7:
    if (a7) {
      *a7 = var1;
    }
    objectState = self->_objectState;
    id v18 = &objectState[a4];
    unint64_t var0 = v18->var0;
    p_id var1 = &v18->var1;
    if (var0)
    {

      objectState = self->_objectState;
    }
    id *p_var1 = 0;
    if ((uint64_t)a5 <= 2)
    {
      if (!a5)
      {
LABEL_18:
        objectState[a4].id var1 = a3;
        self->_objectState[a4].unint64_t var0 = a5;
        ++self->_objectStateGeneration;
        BOOL v16 = 1;
        goto LABEL_19;
      }
    }
    else if (a5 == 3 || a5 == 771)
    {
      id v21 = (id)[a3 copyWithZone:0];
LABEL_17:
      a3 = v21;
      goto LABEL_18;
    }
    id v21 = a3;
    goto LABEL_17;
  }
  if (var1 != a3) {
    goto LABEL_7;
  }
LABEL_5:
  BOOL v16 = 0;
LABEL_19:
  os_unfair_lock_unlock(p_stateLock);
  return v16;
}

- (unsigned)magic
{
  return self->_magic;
}

- (unsigned)primitiveSlotCount
{
  return self->_primitiveSlotCount;
}

- (unsigned)objectSlotCount
{
  return self->_objectSlotCount;
}

- (void)primitiveValueAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, @"_GCDevicePhysicalInputStorage.m", 226, @"Index %u beyond bounds [0, %u."), v0, *v3);
  __break(1u);
}

- (void)setPrimitiveValue:atIndex:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, @"_GCDevicePhysicalInputStorage.m", 240, @"Index %u beyond bounds [0, %u."), v0, *v3);
  __break(1u);
}

- (void)testAndSetPrimitiveValue:atIndex:previous:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, @"_GCDevicePhysicalInputStorage.m", 255, @"Index %u beyond bounds [0, %u."), v0, *v3);
  __break(1u);
}

- (void)objectValueAtIndex:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, @"_GCDevicePhysicalInputStorage.m", 278, @"Index %u beyond bounds [0, %u."), v0, *v3);
  __break(1u);
}

- (void)setObjectValue:atIndex:policy:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, @"_GCDevicePhysicalInputStorage.m", 292, @"Index %u beyond bounds [0, %u."), v0, *v3);
  __break(1u);
}

- (void)testAndSetObjectValue:atIndex:policy:compareObjects:previous:.cold.1()
{
  OUTLINED_FUNCTION_0_6();
  objc_msgSend((id)unk_26D2B54B8(&off_26D2B5620, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v2, v1, @"_GCDevicePhysicalInputStorage.m", 309, @"Index %u beyond bounds [0, %u."), v0, *v3);
  __break(1u);
}

@end