@interface _GCDevicePhysicalInputButtonInput
+ (unsigned)updateContextSize;
- (BOOL)_isAnalog;
- (BOOL)_setPressedDidChangeHandler:(id)a3;
- (BOOL)canWrap;
- (BOOL)isAnalog;
- (BOOL)isEqualToInput:(BOOL)a1;
- (BOOL)isPressed;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (NSSet)sources;
- (NSString)description;
- (_GCDevicePhysicalInputButtonInput)init;
- (_GCDevicePhysicalInputButtonInput)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputButtonInput)initWithTemplate:(id)a3 context:(id)a4;
- (__n64)_pressedThreshold;
- (__n64)_value;
- (double)_lastPressedTimestamp;
- (double)_lastValueTimestamp;
- (double)lastPressedStateLatency;
- (double)lastPressedStateTimestamp;
- (double)lastValueLatency;
- (double)lastValueTimestamp;
- (float)value;
- (id)_pressedDidChangeHandler;
- (id)valueDidChangeHandler;
- (uint64_t)__setLastPressedTimestamp:(uint64_t)result;
- (uint64_t)__setLastValueTimestamp:(uint64_t)result;
- (uint64_t)__setValue:(uint64_t)result;
- (uint64_t)_setAnalog:(uint64_t)result;
- (uint64_t)_setLastPressedTimestamp:(uint64_t)result;
- (uint64_t)_setLastValueTimestamp:(uint64_t)result;
- (uint64_t)_setPressedThreshold:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_setValue:(uint64_t)result;
- (uint64_t)_setValueDidChangeHandler:(uint64_t)result;
- (uint64_t)_sources;
- (uint64_t)_valueDidChangeHandler;
- (uint64_t)update:(float)a3 withValue:(double)a4 timestamp:;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
- (void)setValueDidChangeHandler:(id)a3;
@end

@implementation _GCDevicePhysicalInputButtonInput

- (_GCDevicePhysicalInputButtonInput)init
{
  return self;
}

- (_GCDevicePhysicalInputButtonInput)initWithParameters:(id)a3
{
  v4 = (float *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  v5 = [(_GCDevicePhysicalInputView *)&v10 initWithParameters:v4];
  v6 = v5;
  if (v4)
  {
    -[_GCDevicePhysicalInputButtonInput _setSources:]((uint64_t)v5, *((void *)v4 + 2));
    uint64_t v7 = *((unsigned __int8 *)v4 + 8);
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  -[_GCDevicePhysicalInputButtonInput _setSources:]((uint64_t)v5, 0);
  uint64_t v7 = 0;
  if (v6) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v7, (uint64_t)&v6->_isAnalogSlot);
LABEL_4:
  if (!v4)
  {
    double v8 = 0.0;
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  double v8 = v4[3];
  if (v6) {
LABEL_6:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, *(uint64_t *)&v8, (uint64_t)&v6->_pressedThresholdSlot);
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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"_GCDevicePhysicalInputButtonInput.m", 214, @"Invalid parameter not satisfying: %s", "newValue != nil");
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

- (uint64_t)_setPressedThreshold:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 40);
  }
  return result;
}

- (_GCDevicePhysicalInputButtonInput)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputView *)&v10 initWithTemplate:v6 context:v5];
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[3], v10.receiver, v10.super_class);
  v7->_isAnalogSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[4]];
  v7->_pressedThresholdSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[5]];
  v7->_valueChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[6]];
  v7->_pressedChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[7]];
  v7->_valueSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[8]];
  v7->_valueTimestampSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[9]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[10]];

  v7->_pressedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputButtonInput;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputView update:forUsages:with:](&v38, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_0 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  v12 = (void *)-[_GCDevicePhysicalInputButtonInput _sources]((uint64_t)a5);
  __int16 v13 = -[_GCDevicePhysicalInputButtonInput _setSources:]((uint64_t)self, (uint64_t)v12);
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFE | v13;

  if (a5)
  {
    BOOL v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 32) != 0;
    if (self) {
      goto LABEL_9;
    }
LABEL_44:
    LOBYTE(v15) = 0;
    __int16 v16 = 0;
    goto LABEL_12;
  }
  BOOL v14 = 0;
  if (!self) {
    goto LABEL_44;
  }
LABEL_9:
  int v15 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v14, (uint64_t)&self->_isAnalogSlot);
  if (v15) {
    __int16 v16 = 2;
  }
  else {
    __int16 v16 = 0;
  }
LABEL_12:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFD | v16;
  if (a5)
  {
    float v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 40));
    double v18 = v17;
    if (self) {
      goto LABEL_14;
    }
LABEL_46:
    LOBYTE(v19) = 0;
    __int16 v20 = 0;
    goto LABEL_17;
  }
  double v18 = 0.0;
  if (!self) {
    goto LABEL_46;
  }
LABEL_14:
  int v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v18, (uint64_t)&self->_pressedThresholdSlot);
  if (v19) {
    __int16 v20 = 4;
  }
  else {
    __int16 v20 = 0;
  }
LABEL_17:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFB | v20;
  v9 |= v13 | v15 | v19;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      return v9;
    }
LABEL_25:
    if (a5)
    {
      float v27 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64));
      double v28 = v27;
      if (self) {
        goto LABEL_27;
      }
    }
    else
    {
      double v28 = 0.0;
      if (self)
      {
LABEL_27:
        int v29 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v28, (uint64_t)&self->_valueSlot);
        if (v29) {
          __int16 v30 = 32;
        }
        else {
          __int16 v30 = 0;
        }
LABEL_30:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFDF | v30;
        if (a5)
        {
          uint64_t v31 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
          if (self) {
            goto LABEL_32;
          }
        }
        else
        {
          uint64_t v31 = 0;
          if (self)
          {
LABEL_32:
            int v32 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v31, (uint64_t)&self->_valueTimestampSlot);
            if (v32) {
              __int16 v33 = 64;
            }
            else {
              __int16 v33 = 0;
            }
LABEL_35:
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFBF | v33;
            if (a5) {
              uint64_t v34 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
            }
            else {
              uint64_t v34 = 0;
            }
            if (self)
            {
              int v35 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v34, (uint64_t)&self->_pressedTimestampSlot);
              if (v35) {
                __int16 v36 = 256;
              }
              else {
                __int16 v36 = 0;
              }
            }
            else
            {
              LOBYTE(v35) = 0;
              __int16 v36 = 0;
            }
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFEFF | v36;
            return v9 | v35 | v29 | v32;
          }
        }
        LOBYTE(v32) = 0;
        __int16 v33 = 0;
        goto LABEL_35;
      }
    }
    LOBYTE(v29) = 0;
    __int16 v30 = 0;
    goto LABEL_30;
  }
LABEL_18:
  v21 = (void *)-[_GCDevicePhysicalInputButtonInput _valueDidChangeHandler]((uint64_t)a5);
  int v22 = -[_GCDevicePhysicalInputButtonInput _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v21);
  if (v22) {
    __int16 v23 = 8;
  }
  else {
    __int16 v23 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFF7 | v23;

  v24 = [a5 pressedDidChangeHandler];
  BOOL v25 = [(_GCDevicePhysicalInputButtonInput *)self _setPressedDidChangeHandler:v24];
  if (v25) {
    __int16 v26 = 16;
  }
  else {
    __int16 v26 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFEF | v26;
  v9 |= v22 | v25;

  if ((v6 & 8) != 0) {
    goto LABEL_25;
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

- (__n64)_pressedThreshold
{
  if (a1)
  {
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 40));
    result.n64_u32[1] = HIDWORD(v1);
    result.n64_f32[0] = v1;
  }
  else
  {
    return 0;
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
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
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
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 64);
  }
  return result;
}

- (double)_lastValueTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 72));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastValueTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 72);
  }
  return result;
}

- (double)_lastPressedTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 80));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastPressedTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 80);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  [(_GCDevicePhysicalInputView *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_0 = v6;
  }
  __int16 v7 = *(_WORD *)((char *)a3 + v6);
  uint64_t v8 = v6;
  if (v7)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sources");
    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"analog");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"pressedDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_8:
    if ((v7 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"value");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueLatency");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x100) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"pressed");
  if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x100) == 0) {
    return;
  }
LABEL_11:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastPressedStateTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastPressedStateLatency");
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)_GCDevicePhysicalInputButtonInput;
  -[_GCDevicePhysicalInputView postCommit:sender:](&v12, sel_postCommit_sender_);
  unsigned int v7 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    unsigned int v7 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_0 = v7;
  }
  __int16 v8 = *(_WORD *)((char *)a3 + v7);
  uint64_t v9 = v7;
  if (v8)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
    __int16 v8 = *(_WORD *)((char *)a3 + v9);
    if ((v8 & 2) == 0)
    {
LABEL_5:
      if ((v8 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"analog");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 8) == 0)
  {
LABEL_6:
    if ((v8 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x10) == 0)
  {
LABEL_7:
    if ((v8 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"pressedDidChangeHandler");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x20) == 0)
  {
LABEL_8:
    if ((v8 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"value");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x40) == 0)
  {
LABEL_9:
    if ((v8 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueLatency");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x80) == 0)
  {
LABEL_10:
    if ((v8 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"pressed");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x100) == 0)
  {
LABEL_11:
    if ((v8 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPressedStateTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPressedStateLatency");
  __int16 v8 = *(_WORD *)((char *)a3 + v9);
  if ((v8 & 0x20) == 0)
  {
LABEL_12:
    if ((v8 & 0x80) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_22:
  unsigned int v10 = [(_GCDevicePhysicalInputButtonInput *)self valueDidChangeHandler];
  if (v10)
  {
    [(_GCDevicePhysicalInputButtonInput *)self value];
    ((void (**)(void, id, _GCDevicePhysicalInputButtonInput *))v10)[2](v10, a4, self);
  }

  if ((*(_WORD *)((unsigned char *)a3 + v9) & 0x80) != 0)
  {
LABEL_25:
    uint64_t v11 = [(_GCDevicePhysicalInputButtonInput *)self pressedDidChangeHandler];
    if (v11) {
      ((void (**)(void, id, _GCDevicePhysicalInputButtonInput *, BOOL))v11)[2](v11, a4, self, [(_GCDevicePhysicalInputButtonInput *)self isPressed]);
    }
  }
}

- (BOOL)isEqualToInput:(BOOL)a1
{
  BOOL v2 = a1;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_isEqualToInput_, v2, @"_GCDevicePhysicalInputButtonInput.m", 196, @"Invalid parameter not satisfying: %s", "[otherElement isKindOfClass:_GCDevicePhysicalInputButtonInput.class]");
      BOOL v2 = 0;
LABEL_15:

      return v2;
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
          if ((v7 != 0) == (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 32) != 0))
          {
LABEL_7:
            float v8 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](v2, v2 + 40));
            if (a2) {
              float v9 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a2, (uint64_t)a2 + 40));
            }
            else {
              float v9 = 0.0;
            }
            BOOL v2 = v9 == v8;
            goto LABEL_14;
          }
        }
        else if (!v7)
        {
          goto LABEL_7;
        }
      }
      BOOL v2 = 0;
LABEL_14:

      goto LABEL_15;
    }
    return 0;
  }
  return v2;
}

- (NSString)description
{
  [(_GCDevicePhysicalInputButtonInput *)self value];
  double v4 = v3;
  BOOL v5 = [(_GCDevicePhysicalInputButtonInput *)self isPressed];
  unsigned int v6 = &stru_26D27BBB8;
  if (v5) {
    unsigned int v6 = @" (pressed)";
  }
  return +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<ButtonInput; value = %f%@>",
           *(void *)&v4,
           v6);
}

- (id)_pressedDidChangeHandler
{
  return (id)-[_GCDevicePhysicalInputView _objectValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedChangedHandlerSlot);
}

- (BOOL)_setPressedDidChangeHandler:(id)a3
{
  double v4 = (void *)MEMORY[0x223C6E420](a3, a2);
  LOBYTE(self) = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:]((uint64_t)self, (uint64_t)v4, (uint64_t)&self->_pressedChangedHandlerSlot, 771);

  return (char)self;
}

- (uint64_t)__setValue:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 64);
  }
  return result;
}

- (uint64_t)__setLastValueTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 72);
  }
  return result;
}

- (uint64_t)__setLastPressedTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 80);
  }
  return result;
}

- (id)valueDidChangeHandler
{
  BOOL v2 = (void *)-[_GCDevicePhysicalInputButtonInput _valueDidChangeHandler]((uint64_t)self);

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
  return 0;
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
  if (!dword_267F28C94) {
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo / dword_267F28C94)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  BOOL v2 = (void *)-[_GCDevicePhysicalInputButtonInput _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (BOOL)isPressed
{
  if (self)
  {
    BOOL v2 = self;
    float v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
    float v4 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v2, (uint64_t)&v2->_pressedThresholdSlot));
    LOBYTE(self) = (float)(v3 - v4) > 0.00000011921;
  }
  return (char)self;
}

- (double)lastPressedStateTimestamp
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedTimestampSlot));
  }
  else {
    return 0.0;
  }
}

- (double)lastPressedStateLatency
{
  if (!dword_267F28C9C) {
    mach_timebase_info((mach_timebase_info_t)&lastPressedStateLatency_sTimebaseInfo);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedTimestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time()
                * lastPressedStateLatency_sTimebaseInfo
                / dword_267F28C9C)
       / 1000000000.0
       - v3;
}

- (uint64_t)update:(float)a3 withValue:(double)a4 timestamp:
{
  if (!a1) {
    return 0;
  }
  unsigned int v8 = MyUpdateContext_Offset_0;
  if (MyUpdateContext_Offset_0 == -1)
  {
    unsigned int v8 = +[_GCDevicePhysicalInputView updateContextSize];
    MyUpdateContext_Offset_0 = v8;
  }
  uint64_t v9 = v8;
  float v10 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 64));
  float v11 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 40));
  float v12 = v10 - v11;
  float v13 = a3 - v11;
  BOOL v14 = v10 != a3;
  if (v10 != a3)
  {
    -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](a1, COERCE__INT64(a3), a1 + 64);
    -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](a1, *(uint64_t *)&a4, a1 + 72);
    *(_WORD *)(a2 + v9) |= 0x60u;
  }
  if (v13 > 0.00000011921 != v12 > 0.00000011921)
  {
    -[_GCDevicePhysicalInputView _setPrimitiveValue:forSlot:](a1, *(uint64_t *)&a4, a1 + 80);
    *(_WORD *)(a2 + v9) |= 0x180u;
    return 1;
  }
  return v14;
}

@end