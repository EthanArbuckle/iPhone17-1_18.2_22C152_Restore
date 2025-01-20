@interface GCCursorElement
+ (unsigned)updateContextSize;
- (BOOL)_setPositionDidChangeHandler:(id)a3;
- (BOOL)update:(void *)a3 forMouseEvent:(id *)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (GCCursorElement)initWithTemplate:(id)a3 context:(id)a4;
- (double)_positionDelta;
- (id)_positionDidChangeHandler;
- (uint64_t)_setPositionDelta:(double)a3;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
@end

@implementation GCCursorElement

- (GCCursorElement)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GCCursorElement;
  id v5 = a4;
  v6 = a3;
  v7 = [(_GCDevicePhysicalInputElement *)&v10 initWithTemplate:v6 context:v5];
  v7->_positionChangedHandlerSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 2, v6, v6[7], v10.receiver, v10.super_class);
  v7->_xDeltaSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[8]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[9]];

  v7->_yDeltaSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___GCCursorElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)GCCursorElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v19, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_12 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 4) != 0)
  {
    v12 = -[GCCursorElement _positionDidChangeHandler](a5);
    BOOL v13 = [(GCCursorElement *)self _setPositionDidChangeHandler:v12];
    *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFE | v13;
    v9 |= v13;
  }
  if ((v6 & 8) != 0)
  {
    double v14 = -[GCCursorElement _positionDelta]((uint64_t)a5);
    int v16 = [(GCCursorElement *)(uint64_t)self _setPositionDelta:v15];
    if (v16) {
      char v17 = 2;
    }
    else {
      char v17 = 0;
    }
    *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFD | v17;
    v9 |= v16;
  }
  return v9;
}

- (id)_positionDidChangeHandler
{
  if (a1)
  {
    a1 = -[_GCDevicePhysicalInputView _objectValueForSlot:]((uint64_t)a1, (uint64_t)a1 + 56);
    uint64_t v1 = vars8;
  }
  return a1;
}

- (double)_positionDelta
{
  if (a1)
  {
    uint64_t v2 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64);
    -[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 72);
  }
  else
  {
    uint64_t v2 = 0;
  }
  return *(double *)&v2;
}

- (uint64_t)_setPositionDelta:(double)a3
{
  if (result)
  {
    uint64_t v4 = result;
    if (-[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 64))
    {
      return 1;
    }
    else
    {
      return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](v4, *(uint64_t *)&a3, v4 + 72);
    }
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)GCCursorElement;
  [(_GCDevicePhysicalInputElement *)&v8 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_12 = v6;
  }
  if (*((unsigned char *)a3 + v6))
  {
    uint64_t v7 = v6;
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"positionDidChangeHandler");
    if ((*((unsigned char *)a3 + v7) & 2) == 0) {
      return;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    return;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"delta");
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GCCursorElement;
  [(_GCDevicePhysicalInputElement *)&v10 postCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_12 = v6;
  }
  uint64_t v7 = v6;
  if (*((unsigned char *)a3 + v6))
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"positionDidChangeHandler");
    if ((*((unsigned char *)a3 + v7) & 2) == 0) {
      return;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    return;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"delta");
  if ((*((unsigned char *)a3 + v7) & 2) != 0)
  {
    -[GCCursorElement _positionDidChangeHandler](self);
    objc_super v8 = (void (**)(void, void, void, double))objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      double v9 = -[GCCursorElement _positionDelta]((uint64_t)self);
      ((void (**)(void, GCCursorElement *, GCCursorElement *, double))v8)[2](v8, self, self, v9);
    }
  }
}

- (BOOL)_setPositionDidChangeHandler:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  LOBYTE(self) = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v4, (uint64_t)&self->_positionChangedHandlerSlot, 771);

  return (char)self;
}

- (BOOL)update:(void *)a3 forMouseEvent:(id *)a4 withTimestamp:(double)a5
{
  v12.receiver = self;
  v12.super_class = (Class)GCCursorElement;
  $89480507B321505200A72293C7740D1B v11 = *a4;
  BOOL v8 = [(_GCDevicePhysicalInputElement *)&v12 update:a3 forMouseEvent:&v11 withTimestamp:a5];
  unsigned int v9 = MyUpdateContext_Offset_12;
  if (MyUpdateContext_Offset_12 == -1)
  {
    unsigned int v9 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_12 = v9;
  }
  if (a4->var1 == 1
    && [(GCCursorElement *)(uint64_t)self _setPositionDelta:a4->var2.var0.var1])
  {
    *((unsigned char *)a3 + v9) |= 2u;
    return 1;
  }
  return v8;
}

@end