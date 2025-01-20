@interface _GCDevicePhysicalInputAxisInput
+ (unsigned)updateContextSize;
- (BOOL)_canWrap;
- (BOOL)_isAnalog;
- (BOOL)canWrap;
- (BOOL)isAnalog;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (NSSet)sources;
- (_GCDevicePhysicalInputAxisInput)init;
- (_GCDevicePhysicalInputAxisInput)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputAxisInput)initWithTemplate:(id)a3 context:(id)a4;
- (__n64)_value;
- (double)_lastValueTimestamp;
- (double)lastValueLatency;
- (double)lastValueTimestamp;
- (float)value;
- (id)valueDidChangeHandler;
- (uint64_t)__setLastValueTimestamp:(uint64_t)result;
- (uint64_t)__setValue:(uint64_t)result;
- (uint64_t)_setAnalog:(uint64_t)result;
- (uint64_t)_setCanWrap:(uint64_t)result;
- (uint64_t)_setLastValueTimestamp:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_setValue:(uint64_t)result;
- (uint64_t)_setValueDidChangeHandler:(uint64_t)result;
- (uint64_t)_sources;
- (uint64_t)_valueDidChangeHandler;
- (uint64_t)isEqualToInput:(uint64_t)a1;
- (uint64_t)update:(float)a3 withValue:(double)a4 timestamp:;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
- (void)setValueDidChangeHandler:(id)a3;
@end

@implementation _GCDevicePhysicalInputAxisInput

- (_GCDevicePhysicalInputAxisInput)init
{
  return self;
}

- (_GCDevicePhysicalInputAxisInput)initWithParameters:(id)a3
{
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  v5 = [(_GCDevicePhysicalInputView *)&v10 initWithParameters:v4];
  v6 = v5;
  if (v4)
  {
    -[_GCDevicePhysicalInputAxisInput _setSources:]((uint64_t)v5, v4[2]);
    uint64_t v7 = *((unsigned __int8 *)v4 + 8);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  -[_GCDevicePhysicalInputAxisInput _setSources:]((uint64_t)v5, 0);
  uint64_t v7 = 0;
  if (v6) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v7, (uint64_t)&v6->_isAnalogSlot);
LABEL_4:
  if (!v4)
  {
    uint64_t v8 = 0;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v8 = *((unsigned __int8 *)v4 + 9);
  if (v6) {
LABEL_6:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v8, (uint64_t)&v6->_canWrapSlot);
LABEL_7:

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"_GCDevicePhysicalInputAxisInput.m", 181, @"Invalid parameter not satisfying: %s", "newValue != nil");
    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 24, 771);
  }
  return result;
}

- (uint64_t)_setAnalog:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 32);
  }
  return result;
}

- (uint64_t)_setCanWrap:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 40);
  }
  return result;
}

- (_GCDevicePhysicalInputAxisInput)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputView *)&v10 initWithTemplate:v6 context:v5];
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3], v10.receiver, v10.super_class);
  v7->_isAnalogSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[4]];
  v7->_canWrapSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[5]];
  v7->_valueChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[6]];
  v7->_valueSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[7]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[8]];

  v7->_valueTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputAxisInput;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v31.receiver = self;
  v31.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v31, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_4;
  if (MyUpdateContext_Offset_4 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_4 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  v12 = (void *)-[_GCDevicePhysicalInputAxisInput _sources]((uint64_t)a5);
  char v13 = -[_GCDevicePhysicalInputAxisInput _setSources:]((uint64_t)self, (uint64_t)v12);
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFE | v13;

  if (a5)
  {
    BOOL v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 32) != 0;
    if (self) {
      goto LABEL_9;
    }
LABEL_35:
    LOBYTE(v15) = 0;
    char v16 = 0;
    goto LABEL_12;
  }
  BOOL v14 = 0;
  if (!self) {
    goto LABEL_35;
  }
LABEL_9:
  int v15 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v14, (uint64_t)&self->_isAnalogSlot);
  if (v15) {
    char v16 = 2;
  }
  else {
    char v16 = 0;
  }
LABEL_12:
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFD | v16;
  if (a5)
  {
    BOOL v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 40) != 0;
    if (self) {
      goto LABEL_14;
    }
LABEL_37:
    LOBYTE(v18) = 0;
    char v19 = 0;
    goto LABEL_17;
  }
  BOOL v17 = 0;
  if (!self) {
    goto LABEL_37;
  }
LABEL_14:
  int v18 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v17, (uint64_t)&self->_canWrapSlot);
  if (v18) {
    char v19 = 4;
  }
  else {
    char v19 = 0;
  }
LABEL_17:
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFB | v19;
  v9 |= v13 | v15 | v18;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      return v9;
    }
LABEL_22:
    if (a5)
    {
      float v23 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 56));
      double v24 = v23;
      if (self) {
        goto LABEL_24;
      }
    }
    else
    {
      double v24 = 0.0;
      if (self)
      {
LABEL_24:
        int v25 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v24, (uint64_t)&self->_valueSlot);
        if (v25) {
          char v26 = 16;
        }
        else {
          char v26 = 0;
        }
LABEL_27:
        *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xEF | v26;
        if (a5)
        {
          uint64_t v27 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64);
          if (self) {
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v27 = 0;
          if (self)
          {
LABEL_29:
            int v28 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v27, (uint64_t)&self->_valueTimestampSlot);
            if (v28) {
              char v29 = 32;
            }
            else {
              char v29 = 0;
            }
            goto LABEL_32;
          }
        }
        LOBYTE(v28) = 0;
        char v29 = 0;
LABEL_32:
        *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xDF | v29;
        return v9 | v28 | v25;
      }
    }
    LOBYTE(v25) = 0;
    char v26 = 0;
    goto LABEL_27;
  }
LABEL_18:
  v20 = (void *)-[_GCDevicePhysicalInputAxisInput _valueDidChangeHandler]((uint64_t)a5);
  int v21 = -[_GCDevicePhysicalInputAxisInput _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v20);
  if (v21) {
    char v22 = 8;
  }
  else {
    char v22 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xF7 | v22;
  v9 |= v21;

  if ((v6 & 8) != 0) {
    goto LABEL_22;
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

- (BOOL)_isAnalog
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 32) != 0;
  }
  return result;
}

- (BOOL)_canWrap
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 40) != 0;
  }
  return result;
}

- (uint64_t)_valueDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 48);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setValueDidChangeHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (void *)MEMORY[0x223C6E420](a2);
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 48, 771);

    return v4;
  }
  return result;
}

- (__n64)_value
{
  if (a1)
  {
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 56));
    result.n64_u32[1] = HIDWORD(v1);
    result.n64_f32[0] = v1;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uint64_t)_setValue:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 56);
  }
  return result;
}

- (double)_lastValueTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastValueTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 64);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  [(_GCDevicePhysicalInputView *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_4;
  if (MyUpdateContext_Offset_4 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_4 = v6;
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
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"analog");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 4) == 0)
  {
LABEL_6:
    if ((v7 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"canWrap");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_7:
    if ((v7 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_8:
    if ((v7 & 0x20) == 0) {
      return;
    }
    goto LABEL_9;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"value");
  if ((*((unsigned char *)a3 + v8) & 0x20) == 0) {
    return;
  }
LABEL_9:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueLatency");
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)_GCDevicePhysicalInputAxisInput;
  -[_GCDevicePhysicalInputView preCommit:sender:](&v13, sel_preCommit_sender_);
  unsigned int v7 = MyUpdateContext_Offset_4;
  if (MyUpdateContext_Offset_4 == -1)
  {
    unsigned int v7 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_4 = v7;
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
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + v7) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"analog");
  char v8 = *((unsigned char *)a3 + v9);
  if ((v8 & 4) == 0)
  {
LABEL_6:
    if ((v8 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"canWrap");
  char v8 = *((unsigned char *)a3 + v9);
  if ((v8 & 8) == 0)
  {
LABEL_7:
    if ((v8 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  char v8 = *((unsigned char *)a3 + v9);
  if ((v8 & 0x10) == 0)
  {
LABEL_8:
    if ((v8 & 0x20) == 0) {
      goto LABEL_9;
    }
LABEL_16:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueLatency");
    if ((*((unsigned char *)a3 + v9) & 0x10) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"value");
  char v8 = *((unsigned char *)a3 + v9);
  if ((v8 & 0x20) != 0) {
    goto LABEL_16;
  }
LABEL_9:
  if ((v8 & 0x10) == 0) {
    return;
  }
LABEL_17:
  unsigned int v10 = (void (**)(void, void, void, __n128))-[_GCDevicePhysicalInputAxisInput _valueDidChangeHandler]((uint64_t)self);
  if (v10)
  {
    if (self)
    {
      double v12 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
      v11.n128_u32[1] = HIDWORD(v12);
      v11.n128_f32[0] = v12;
    }
    else
    {
      v11.n128_u64[0] = 0;
    }
    ((void (**)(void, id, _GCDevicePhysicalInputAxisInput *, __n128))v10)[2](v10, a4, self, v11);
  }
}

- (uint64_t)isEqualToInput:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_isEqualToInput_, v2, @"_GCDevicePhysicalInputAxisInput.m", 168, @"Invalid parameter not satisfying: %s", "[otherElement isKindOfClass:_GCDevicePhysicalInputAxisInput.class]");
      uint64_t v2 = 0;
      goto LABEL_12;
    }
    uint64_t v4 = objc_opt_class();
    if ([v4 isEqual:objc_opt_class()])
    {
      id v5 = -[_GCDevicePhysicalInputView _objectValueForSlot:](v2, v2 + 24);
      unsigned int v6 = [a2 sources];
      if ([v5 isEqual:v6])
      {
        uint64_t v7 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 32);
        if (a2)
        {
          if ((v7 != 0) != (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 32) != 0)) {
            goto LABEL_7;
          }
          uint64_t v8 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 40);
          BOOL v9 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 40) != 0;
        }
        else
        {
          if (v7) {
            goto LABEL_7;
          }
          uint64_t v8 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 40);
          BOOL v9 = 0;
        }
        uint64_t v2 = (v8 == 0) ^ v9;
        goto LABEL_11;
      }
LABEL_7:
      uint64_t v2 = 0;
LABEL_11:

LABEL_12:
      return v2;
    }
    return 0;
  }
  return v2;
}

- (uint64_t)__setValue:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 56);
  }
  return result;
}

- (uint64_t)__setLastValueTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 64);
  }
  return result;
}

- (id)valueDidChangeHandler
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputAxisInput _valueDidChangeHandler]((uint64_t)self);

  return v2;
}

- (void)setValueDidChangeHandler:(id)a3
{
}

- (float)value
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
  }
  else {
    return 0.0;
  }
}

- (BOOL)isAnalog
{
  if (self) {
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isAnalogSlot) != 0;
  }
  return (char)self;
}

- (BOOL)canWrap
{
  if (self) {
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_canWrapSlot) != 0;
  }
  return (char)self;
}

- (double)lastValueTimestamp
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  }
  else {
    return 0.0;
  }
}

- (double)lastValueLatency
{
  if (!dword_267F28D7C)
  {
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo_0);
    if (self) {
      goto LABEL_3;
    }
LABEL_6:
    double v3 = 0.0;
    return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_0 / dword_267F28D7C)
         / 1000000000.0
         - v3;
  }
  if (!self) {
    goto LABEL_6;
  }
LABEL_3:
  double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_0 / dword_267F28D7C)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputAxisInput _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (uint64_t)update:(float)a3 withValue:(double)a4 timestamp:
{
  if (result)
  {
    uint64_t v7 = result;
    unsigned int v8 = MyUpdateContext_Offset_4;
    if (MyUpdateContext_Offset_4 == -1)
    {
      unsigned int v8 = +[_GCDevicePhysicalInputView updateContextSize];
      MyUpdateContext_Offset_4 = v8;
    }
    float v9 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](v7, v7 + 56));
    if (v9 == a3)
    {
      return 0;
    }
    else
    {
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, COERCE__INT64(a3), v7 + 56);
      -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](v7, *(uint64_t *)&a4, v7 + 64);
      *(unsigned char *)(a2 + v8) |= 0x30u;
      return 1;
    }
  }
  return result;
}

@end