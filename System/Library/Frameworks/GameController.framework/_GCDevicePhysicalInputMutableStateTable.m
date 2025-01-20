@interface _GCDevicePhysicalInputMutableStateTable
- (BOOL)testAndSetObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5 compareObjects:(BOOL)a6 previous:(id *)a7;
- (BOOL)testAndSetPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4 previous:(unint64_t *)a5;
- (_GCDevicePhysicalInputMutableStateTable)init;
- (_WORD)initWithMagic:(void *)a1;
- (id)allocatePrimitiveSlot;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectValueAtIndex:(unsigned int)a3;
- (uint64_t)allocateObjectSlot;
- (unint64_t)primitiveValueAtIndex:(unsigned int)a3;
- (unsigned)magic;
- (unsigned)objectSlotCount;
- (unsigned)primitiveSlotCount;
- (void)allocateObjectSlot;
- (void)dealloc;
- (void)setObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5;
- (void)setPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4;
@end

@implementation _GCDevicePhysicalInputMutableStateTable

- (_WORD)initWithMagic:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)_GCDevicePhysicalInputMutableStateTable;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  v3[4] = a2;
  *((void *)v3 + 2) = [objc_alloc((Class)&off_26D2C00B0) initWithOptions:2];
  *((void *)v3 + 3) = [objc_alloc((Class)&off_26D2C00B0) initWithOptions:2];
  *((void *)v3 + 4) = [objc_alloc((Class)&off_26D2C00B0) initWithOptions:2];
  return v3;
}

- (_GCDevicePhysicalInputMutableStateTable)init
{
  return (_GCDevicePhysicalInputMutableStateTable *)-[_GCDevicePhysicalInputMutableStateTable initWithMagic:](self, atomic_fetch_add_explicit(init_Magic, 1u, memory_order_relaxed) ^ (unsigned __int16)self);
}

- (void)dealloc
{
  if ([(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount])
  {
    uint64_t v3 = 0;
    do
    {
      [(_GCDevicePhysicalInputMutableStateTable *)self setObjectValue:0 atIndex:v3 policy:0];
      uint64_t v3 = (v3 + 1);
    }
    while (v3 < [(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount]);
  }

  v4.receiver = self;
  v4.super_class = (Class)_GCDevicePhysicalInputMutableStateTable;
  [(_GCDevicePhysicalInputMutableStateTable *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[_GCDevicePhysicalInputStateTable stateTableWithMagic:primitiveSlotCount:objectSlotCount:]((uint64_t)_GCDevicePhysicalInputStateTable, self->_magic, [(_GCDevicePhysicalInputMutableStateTable *)self primitiveSlotCount], [(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount]);
  if ([(_GCDevicePhysicalInputMutableStateTable *)self primitiveSlotCount])
  {
    uint64_t v5 = 0;
    do
    {
      objc_msgSend(v4, "setPrimitiveValue:atIndex:", -[_GCDevicePhysicalInputMutableStateTable primitiveValueAtIndex:](self, "primitiveValueAtIndex:", v5), v5);
      uint64_t v5 = (v5 + 1);
    }
    while (v5 < [(_GCDevicePhysicalInputMutableStateTable *)self primitiveSlotCount]);
  }
  if ([(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount])
  {
    unint64_t v6 = 0;
    do
    {
      objc_msgSend(v4, "setObjectValue:atIndex:policy:", -[_GCDevicePhysicalInputMutableStateTable objectValueAtIndex:](self, "objectValueAtIndex:", v6), v6, -[NSPointerArray pointerAtIndex:](self->_objectPolicyState, "pointerAtIndex:", v6));
      ++v6;
    }
    while (v6 < [(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount]);
  }
  return v4;
}

- (id)copy
{
  return [(_GCDevicePhysicalInputMutableStateTable *)self copyWithZone:0];
}

- (unsigned)primitiveSlotCount
{
  return [(NSPointerArray *)self->_primitiveState count];
}

- (unsigned)objectSlotCount
{
  return [(NSPointerArray *)self->_objectState count];
}

- (id)allocatePrimitiveSlot
{
  if (result)
  {
    v1 = result;
    uint64_t v2 = [result primitiveSlotCount];
    [v1[2] addPointer:0];
    return (id *)v2;
  }
  return result;
}

- (unint64_t)primitiveValueAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(_GCDevicePhysicalInputMutableStateTable *)self primitiveSlotCount] <= a3) {
    [(_GCDevicePhysicalInputMutableStateTable *)self primitiveValueAtIndex:v3];
  }
  primitiveState = self->_primitiveState;

  return (unint64_t)[(NSPointerArray *)primitiveState pointerAtIndex:v3];
}

- (void)setPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(_GCDevicePhysicalInputMutableStateTable *)self primitiveSlotCount] <= a4) {
    -[_GCDevicePhysicalInputMutableStateTable setPrimitiveValue:atIndex:](self, (uint64_t)a2, v4);
  }
  primitiveState = self->_primitiveState;

  [(NSPointerArray *)primitiveState replacePointerAtIndex:v4 withPointer:a3];
}

- (BOOL)testAndSetPrimitiveValue:(unint64_t)a3 atIndex:(unsigned int)a4 previous:(unint64_t *)a5
{
  uint64_t v6 = *(void *)&a4;
  if ([(_GCDevicePhysicalInputMutableStateTable *)self primitiveSlotCount] <= a4) {
    -[_GCDevicePhysicalInputMutableStateTable testAndSetPrimitiveValue:atIndex:previous:](self, (uint64_t)a2, v6);
  }
  v10 = [(NSPointerArray *)self->_primitiveState pointerAtIndex:v6];
  v11 = v10;
  if (v10 != (void *)a3)
  {
    if (a5) {
      *a5 = (unint64_t)v10;
    }
    [(_GCDevicePhysicalInputMutableStateTable *)self setPrimitiveValue:a3 atIndex:v6];
  }
  return v11 != (void *)a3;
}

- (uint64_t)allocateObjectSlot
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [a1 objectSlotCount];
  if (v2 == -1) {
    [(_GCDevicePhysicalInputMutableStateTable *)(uint64_t)sel_allocateObjectSlot allocateObjectSlot];
  }
  uint64_t v3 = v2;
  [a1[4] addPointer:0];
  [a1[3] addPointer:0];
  return v3;
}

- (id)objectValueAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount] <= a3) {
    [(_GCDevicePhysicalInputMutableStateTable *)self objectValueAtIndex:v3];
  }
  objectState = self->_objectState;

  return [(NSPointerArray *)objectState pointerAtIndex:v3];
}

- (void)setObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  if ([(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount] <= a4) {
    -[_GCDevicePhysicalInputMutableStateTable setObjectValue:atIndex:policy:](self, (uint64_t)a2, v6);
  }
  v10 = [(NSPointerArray *)self->_objectPolicyState pointerAtIndex:v6];
  objectState = self->_objectState;
  if (v10)
  {

    objectState = self->_objectState;
  }
  [(NSPointerArray *)objectState replacePointerAtIndex:v6 withPointer:0];
  if ((uint64_t)a5 <= 2)
  {
    if (!a5)
    {
      v13 = self->_objectState;
      uint64_t v14 = v6;
      id v12 = a3;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (a5 == 769)
  {
LABEL_9:
    v15 = self->_objectState;
    id v12 = a3;
    v13 = v15;
    goto LABEL_10;
  }
  id v12 = (id)[a3 copyWithZone:0];
  v13 = self->_objectState;
LABEL_10:
  uint64_t v14 = v6;
LABEL_11:
  [(NSPointerArray *)v13 replacePointerAtIndex:v14 withPointer:v12];
  objectPolicyState = self->_objectPolicyState;

  [(NSPointerArray *)objectPolicyState replacePointerAtIndex:v6 withPointer:a5];
}

- (BOOL)testAndSetObjectValue:(id)a3 atIndex:(unsigned int)a4 policy:(unint64_t)a5 compareObjects:(BOOL)a6 previous:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  if ([(_GCDevicePhysicalInputMutableStateTable *)self objectSlotCount] <= a4) {
    -[_GCDevicePhysicalInputMutableStateTable testAndSetObjectValue:atIndex:policy:compareObjects:previous:](self, (uint64_t)a2, v10);
  }
  id v14 = [(NSPointerArray *)self->_objectState pointerAtIndex:v10];
  v15 = v14;
  if (v8)
  {
    if (v14 == a3 || ([a3 isEqual:v14] & 1) != 0) {
      return 0;
    }
  }
  else if (v14 == a3)
  {
    return 0;
  }
  if (a7) {
    *a7 = v15;
  }
  [(_GCDevicePhysicalInputMutableStateTable *)self setObjectValue:a3 atIndex:v10 policy:a5];
  return 1;
}

- (unsigned)magic
{
  return self->_magic;
}

- (void)primitiveValueAtIndex:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
}

- (void)setPrimitiveValue:(uint64_t)a3 atIndex:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
}

- (void)testAndSetPrimitiveValue:(void *)a1 atIndex:(uint64_t)a2 previous:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
}

- (void)allocateObjectSlot
{
}

- (void)objectValueAtIndex:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
}

- (void)setObjectValue:(void *)a1 atIndex:(uint64_t)a2 policy:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
}

- (void)testAndSetObjectValue:(uint64_t)a3 atIndex:policy:compareObjects:previous:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
}

@end