@interface _GCDevicePhysicalInputClickableDirectionPadElement
+ (unsigned)updateContextSize;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (GCPressedStateInput)pressedInput;
- (GCTouchedStateInput)touchedInput;
- (NSString)description;
- (_GCDevicePhysicalInputClickableDirectionPadElement)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputClickableDirectionPadElement)initWithTemplate:(id)a3 context:(id)a4;
- (uint64_t)_pressedInput;
- (uint64_t)_pressedValueField;
- (uint64_t)_setPressedValueField:(uint64_t)result;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
@end

@implementation _GCDevicePhysicalInputClickableDirectionPadElement

- (_GCDevicePhysicalInputClickableDirectionPadElement)initWithParameters:(id)a3
{
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  v5 = [(_GCDevicePhysicalInputDirectionPadElement *)&v12 initWithParameters:v4];
  v6 = v5;
  if (!v4)
  {
    uint64_t v7 = 0;
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = v4[18];
  if (v5) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_pressedValueFieldSlot);
LABEL_4:
  v8 = objc_opt_new();
  -[_GCDevicePhysicalInputButtonInputParameters setAnalog:]((uint64_t)v8, 0);
  -[_GCDevicePhysicalInputButtonInputParameters setPressedThreshold:]((uint64_t)v8, 0.0);
  -[_GCDevicePhysicalInputClickableDirectionPadElementParameters pressedSources](v4);
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v8, v9);

  v10 = [[_GCDevicePhysicalInputButtonInput alloc] initWithParameters:v8];
  v6->_pressedInputSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v10];

  return v6;
}

- (uint64_t)_setPressedValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 144);
  }
  return result;
}

- (_GCDevicePhysicalInputClickableDirectionPadElement)initWithTemplate:(id)a3 context:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputDirectionPadElement *)&v11 initWithTemplate:v6 context:v5];
  v7->_pressedValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[18], v11.receiver, v11.super_class);
  v8 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)v6);

  uint64_t v9 = [v5 view:v7 makeReferenceToView:v8];
  v7->_pressedInputSlot = v9;

  return v7;
}

- (uint64_t)_pressedInput
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 152];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

+ (unsigned)updateContextSize
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputClickableDirectionPadElement;
  unsigned __int16 v2 = (unsigned __int16)objc_msgSendSuper2(&v4, sel_updateContextSize);
  return v2
       + +[_GCDevicePhysicalInputButtonInput updateContextSize]+ 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  v23.receiver = self;
  v23.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputDirectionPadElement update:forUsages:with:](&v23, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
    MyUpdateContext_Offset_3 = v10;
  }
  uint64_t v11 = v10;
  if ((a4 & 2) != 0)
  {
    if (a5)
    {
      uint64_t v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 144);
      if (self)
      {
LABEL_6:
        char v13 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v12, (uint64_t)&self->_pressedValueFieldSlot);
LABEL_7:
        *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFE | v13;
        v9 |= v13;
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v12 = 0;
      if (self) {
        goto LABEL_6;
      }
    }
    char v13 = 0;
    goto LABEL_7;
  }
LABEL_8:
  v14 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
  if ((pressedInputUpdateContext_Offset & 1) == 0) {
    pressedInputUpdateContext_Offset = 1;
  }
  unsigned int v15 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    unsigned int v15 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
    MyUpdateContext_Offset_3 = v15;
    uint64_t v16 = 0xFFFFFFFFLL;
    if (pressedInputUpdateContext_Offset) {
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  v17 = (char *)a3 + v15 + v16;
  v18 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)a5);
  int v19 = [v14 update:v17 forUsages:a4 with:v18];
  if (v19) {
    char v20 = 2;
  }
  else {
    char v20 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFD | v20;
  char v21 = v9 | v19;

  return v21;
}

- (uint64_t)_pressedValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 144);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  [(_GCDevicePhysicalInputDirectionPadElement *)&v10 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
    MyUpdateContext_Offset_3 = v6;
  }
  if ((*((unsigned char *)a3 + v6) & 2) != 0)
  {
    uint64_t v7 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
    if ((pressedInputUpdateContext_Offset & 1) == 0) {
      pressedInputUpdateContext_Offset = 1;
    }
    unsigned int v8 = MyUpdateContext_Offset_3;
    if (MyUpdateContext_Offset_3 == -1)
    {
      unsigned int v8 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
      MyUpdateContext_Offset_3 = v8;
      uint64_t v9 = 0xFFFFFFFFLL;
      if (pressedInputUpdateContext_Offset) {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
    [v7 preCommit:(char *)a3 + v8 + v9 sender:self];
  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  [(_GCDevicePhysicalInputDirectionPadElement *)&v10 postCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
    MyUpdateContext_Offset_3 = v6;
  }
  if ((*((unsigned char *)a3 + v6) & 2) != 0)
  {
    uint64_t v7 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
    if ((pressedInputUpdateContext_Offset & 1) == 0) {
      pressedInputUpdateContext_Offset = 1;
    }
    unsigned int v8 = MyUpdateContext_Offset_3;
    if (MyUpdateContext_Offset_3 == -1)
    {
      unsigned int v8 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
      MyUpdateContext_Offset_3 = v8;
      uint64_t v9 = 0xFFFFFFFFLL;
      if (pressedInputUpdateContext_Offset) {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = 1;
    }
    [v7 postCommit:(char *)a3 + v8 + v9 sender:self];
  }
}

- (BOOL)isEqualToElement:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  if (!-[_GCDevicePhysicalInputDirectionPadElement isEqualToElement:](&v11, sel_isEqualToElement_)) {
    return 0;
  }
  if (self)
  {
    uint64_t v5 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
    if (a3)
    {
LABEL_4:
      uint64_t v6 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 144);
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (a3) {
      goto LABEL_4;
    }
  }
  uint64_t v6 = 0;
LABEL_5:
  if (v5 != v6) {
    return 0;
  }
  uint64_t v7 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
  unsigned int v8 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)a3);
  BOOL v9 = -[_GCDevicePhysicalInputButtonInput isEqualToInput:]((BOOL)v7, v8);

  return v9;
}

- (NSString)description
{
  v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  objc_super v4 = [(_GCDevicePhysicalInputDirectionPadElement *)self up];
  [v4 value];
  double v6 = v5;
  uint64_t v7 = [(_GCDevicePhysicalInputDirectionPadElement *)self down];
  [v7 value];
  double v9 = v8;
  objc_super v10 = [(_GCDevicePhysicalInputDirectionPadElement *)self left];
  [v10 value];
  double v12 = v11;
  char v13 = [(_GCDevicePhysicalInputDirectionPadElement *)self right];
  [v13 value];
  double v15 = v14;
  uint64_t v16 = [(_GCDevicePhysicalInputClickableDirectionPadElement *)self pressedInput];
  [v16 value];
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Direction Pad '%@'; up = %f, down = %f, left = %f, right = %f, pressed = %f>",
    v3,
    *(void *)&v6,
    *(void *)&v9,
    *(void *)&v12,
    *(void *)&v15,
  v18 = v17);

  return (NSString *)v18;
}

- (GCPressedStateInput)pressedInput
{
  unsigned __int16 v2 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);

  return (GCPressedStateInput *)v2;
}

- (GCTouchedStateInput)touchedInput
{
  return 0;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  v19.receiver = self;
  v19.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputDirectionPadElement update:forGamepadEvent:withTimestamp:](&v19, sel_update_forGamepadEvent_withTimestamp_);
  unsigned int v10 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
    MyUpdateContext_Offset_3 = v10;
    if (self)
    {
LABEL_3:
      if (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot) == -1) {
        return v9;
      }
    }
  }
  else if (self)
  {
    goto LABEL_3;
  }
  objc_msgSend(a4, "floatValueForElement:");
  float v12 = v11;
  char v13 = (void *)-[_GCDevicePhysicalInputClickableDirectionPadElement _pressedInput]((uint64_t)self);
  if ((pressedInputUpdateContext_Offset & 1) == 0) {
    pressedInputUpdateContext_Offset = 1;
  }
  unsigned int v14 = MyUpdateContext_Offset_3;
  if (MyUpdateContext_Offset_3 == -1)
  {
    unsigned int v14 = +[_GCDevicePhysicalInputDirectionPadElement updateContextSize];
    MyUpdateContext_Offset_3 = v14;
    uint64_t v15 = 0xFFFFFFFFLL;
    if (pressedInputUpdateContext_Offset) {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }
  int v16 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v13, (uint64_t)a3 + v14 + v15, v12, a5);
  if (v16) {
    char v17 = 2;
  }
  else {
    char v17 = 0;
  }
  *((unsigned char *)a3 + v10) = *((unsigned char *)a3 + v10) & 0xFD | v17;
  v9 |= v16;

  return v9;
}

@end