@interface _GCDevicePhysicalInputTouchedStateInput
+ (unsigned)updateContextSize;
- (BOOL)_setTouchedDidChangeHandler:(id)a3;
- (BOOL)_touched;
- (BOOL)isTouched;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (NSSet)sources;
- (NSString)description;
- (_GCDevicePhysicalInputTouchedStateInput)init;
- (_GCDevicePhysicalInputTouchedStateInput)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputTouchedStateInput)initWithTemplate:(id)a3 context:(id)a4;
- (double)_lastTouchedTimestamp;
- (double)lastTouchedStateLatency;
- (double)lastTouchedStateTimestamp;
- (id)_touchedDidChangeHandler;
- (uint64_t)__setLastTouchedTimestamp:(uint64_t)result;
- (uint64_t)__setTouched:(uint64_t)result;
- (uint64_t)_setLastTouchedTimestamp:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_setTouched:(uint64_t)result;
- (uint64_t)_sources;
- (uint64_t)isEqualToInput:(uint64_t)a1;
- (uint64_t)update:(unsigned int)a3 withValue:(double)a4 timestamp:;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
@end

@implementation _GCDevicePhysicalInputTouchedStateInput

- (_GCDevicePhysicalInputTouchedStateInput)init
{
  return self;
}

- (_GCDevicePhysicalInputTouchedStateInput)initWithParameters:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  v5 = [(_GCDevicePhysicalInputView *)&v9 initWithParameters:v4];
  v6 = v5;
  if (v4) {
    uint64_t v7 = v4[1];
  }
  else {
    uint64_t v7 = 0;
  }
  -[_GCDevicePhysicalInputTouchedStateInput _setSources:]((uint64_t)v5, v7);

  return v6;
}

- (uint64_t)_setSources:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      v4 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"_GCDevicePhysicalInputTouchedStateInput.m", 170, @"Invalid parameter not satisfying: %s", "newValue != nil");
    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 24, 771);
  }
  return result;
}

- (_GCDevicePhysicalInputTouchedStateInput)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputView *)&v10 initWithTemplate:v6 context:v5];
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3], v10.receiver, v10.super_class);
  v7->_touchedChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[4]];
  v7->_touchedSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[5]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[6]];

  v7->_touchedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputTouchedStateInput;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v24, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_1;
  if (MyUpdateContext_Offset_1 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_1 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 2) != 0)
  {
    v12 = (void *)-[_GCDevicePhysicalInputTouchedStateInput _sources]((uint64_t)a5);
    char v13 = -[_GCDevicePhysicalInputTouchedStateInput _setSources:]((uint64_t)self, (uint64_t)v12);
    *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFE | v13;
    v9 |= v13;

    if ((v6 & 4) == 0)
    {
LABEL_5:
      if ((v6 & 8) == 0) {
        return v9;
      }
LABEL_12:
      if (a5)
      {
        BOOL v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 40) != 0;
        if (self) {
          goto LABEL_14;
        }
      }
      else
      {
        BOOL v17 = 0;
        if (self)
        {
LABEL_14:
          int v18 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v17, (uint64_t)&self->_touchedSlot);
          if (v18) {
            char v19 = 4;
          }
          else {
            char v19 = 0;
          }
LABEL_17:
          *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFB | v19;
          if (a5)
          {
            uint64_t v20 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 48);
            if (self) {
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v20 = 0;
            if (self)
            {
LABEL_19:
              int v21 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v20, (uint64_t)&self->_touchedTimestampSlot);
              if (v21) {
                char v22 = 8;
              }
              else {
                char v22 = 0;
              }
              goto LABEL_22;
            }
          }
          LOBYTE(v21) = 0;
          char v22 = 0;
LABEL_22:
          *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xF7 | v22;
          return v9 | v21 | v18;
        }
      }
      LOBYTE(v18) = 0;
      char v19 = 0;
      goto LABEL_17;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_5;
  }
  v14 = [a5 _touchedDidChangeHandler];
  BOOL v15 = [(_GCDevicePhysicalInputTouchedStateInput *)self _setTouchedDidChangeHandler:v14];
  if (v15) {
    char v16 = 2;
  }
  else {
    char v16 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFD | v16;
  v9 |= v15;

  if ((v6 & 8) != 0) {
    goto LABEL_12;
  }
  return v9;
}

- (uint64_t)_sources
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 24);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (BOOL)_touched
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 40) != 0;
  }
  return result;
}

- (uint64_t)_setTouched:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 40);
  }
  return result;
}

- (double)_lastTouchedTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 48));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastTouchedTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 48);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  [(_GCDevicePhysicalInputView *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_1;
  if (MyUpdateContext_Offset_1 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_1 = v6;
  }
  char v7 = *((unsigned char *)a3 + v6);
  uint64_t v8 = v6;
  if (v7)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sources");
    char v7 = *((unsigned char *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"touchedDidChangeHandler");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"touched");
  if ((*((unsigned char *)a3 + v8) & 8) == 0) {
    return;
  }
LABEL_7:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastTouchedStateTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastTouchedStateLatency");
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputTouchedStateInput;
  -[_GCDevicePhysicalInputView postCommit:sender:](&v11, sel_postCommit_sender_);
  unsigned int v7 = MyUpdateContext_Offset_1;
  if (MyUpdateContext_Offset_1 == -1)
  {
    unsigned int v7 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_1 = v7;
  }
  char v8 = *((unsigned char *)a3 + v7);
  uint64_t v9 = v7;
  if (v8)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
    char v8 = *((unsigned char *)a3 + v9);
    if ((v8 & 2) == 0)
    {
LABEL_5:
      if ((v8 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + v7) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"touchedDidChangeHandler");
  char v8 = *((unsigned char *)a3 + v9);
  if ((v8 & 4) == 0)
  {
LABEL_6:
    if ((v8 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }
LABEL_11:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"touched");
  char v8 = *((unsigned char *)a3 + v9);
  if ((v8 & 8) == 0)
  {
LABEL_7:
    if ((v8 & 4) == 0) {
      return;
    }
    goto LABEL_13;
  }
LABEL_12:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastTouchedStateTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastTouchedStateLatency");
  if ((*((unsigned char *)a3 + v9) & 4) == 0) {
    return;
  }
LABEL_13:
  unsigned int v10 = [(_GCDevicePhysicalInputTouchedStateInput *)self touchedDidChangeHandler];
  if (v10) {
    ((void (**)(void, id, _GCDevicePhysicalInputTouchedStateInput *, BOOL))v10)[2](v10, a4, self, [(_GCDevicePhysicalInputTouchedStateInput *)self isTouched]);
  }
}

- (uint64_t)isEqualToInput:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = objc_opt_class();
      if (![v4 isEqual:objc_opt_class()]) {
        return 0;
      }
      id v5 = -[_GCDevicePhysicalInputView _objectValueForSlot:](v2, v2 + 24);
      unsigned int v6 = [a2 sources];
      uint64_t v2 = [v5 isEqual:v6];
    }
    else
    {
      id v5 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_isEqualToInput_, v2, @"_GCDevicePhysicalInputTouchedStateInput.m", 154, @"Invalid parameter not satisfying: %s", "[otherElement isKindOfClass:_GCDevicePhysicalInputTouchedStateInput.class]");
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (NSString)description
{
  BOOL v2 = [(_GCDevicePhysicalInputTouchedStateInput *)self isTouched];
  objc_super v3 = &stru_26D27BBB8;
  if (v2) {
    objc_super v3 = @" (touched)";
  }
  return +[NSString stringWithFormat:@"<TouchedStateInput; %@>", v3];
}

- (id)_touchedDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputView _objectValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedChangedHandlerSlot);
}

- (BOOL)_setTouchedDidChangeHandler:(id)a3
{
  v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  LOBYTE(self) = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v4, (uint64_t)&self->_touchedChangedHandlerSlot, 771);

  return (char)self;
}

- (uint64_t)__setTouched:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, a2, result + 40);
  }
  return result;
}

- (uint64_t)__setLastTouchedTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 48);
  }
  return result;
}

- (BOOL)isTouched
{
  if (self) {
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedSlot) != 0;
  }
  return (char)self;
}

- (double)lastTouchedStateTimestamp
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedTimestampSlot));
  }
  else {
    return 0.0;
  }
}

- (double)lastTouchedStateLatency
{
  if (!dword_267F28CA4) {
    mach_timebase_info((mach_timebase_info_t)&lastTouchedStateLatency_sTimebaseInfo);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_touchedTimestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time()
                * lastTouchedStateLatency_sTimebaseInfo
                / dword_267F28CA4)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  BOOL v2 = (void *)-[_GCDevicePhysicalInputTouchedStateInput _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (uint64_t)update:(unsigned int)a3 withValue:(double)a4 timestamp:
{
  if (result)
  {
    uint64_t v7 = result;
    unsigned int v8 = MyUpdateContext_Offset_1;
    if (MyUpdateContext_Offset_1 == -1)
    {
      unsigned int v8 = +[_GCDevicePhysicalInputView updateContextSize];
      MyUpdateContext_Offset_1 = v8;
    }
    if ((-[_GCDevicePhysicalInputView _primitiveValueForSlot:](v7, v7 + 40) != 0) == a3)
    {
      return 0;
    }
    else
    {
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, a3, v7 + 40);
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, *(uint64_t *)&a4, v7 + 48);
      *(unsigned char *)(a2 + v8) |= 0xCu;
      return 1;
    }
  }
  return result;
}

@end