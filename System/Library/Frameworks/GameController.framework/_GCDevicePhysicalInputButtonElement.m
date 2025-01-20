@interface _GCDevicePhysicalInputButtonElement
+ (unsigned)updateContextSize;
- (BOOL)_isAnalog;
- (BOOL)canWrap;
- (BOOL)isAnalog;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)isPressed;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (GCTouchedStateInput)touchedInput;
- (NSSet)sources;
- (NSString)debugDescription;
- (NSString)description;
- (_GCDevicePhysicalInputButtonElement)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputButtonElement)initWithTemplate:(id)a3 context:(id)a4;
- (__n64)_pressedThreshold;
- (__n64)_value;
- (double)_lastPressedTimestamp;
- (double)_lastValueTimestamp;
- (double)lastPressedStateLatency;
- (double)lastPressedStateTimestamp;
- (double)lastValueLatency;
- (double)lastValueTimestamp;
- (float)value;
- (id)pressedDidChangeHandler;
- (id)valueDidChangeHandler;
- (uint64_t)_pressedDidChangeHandler;
- (uint64_t)_pressedValueField;
- (uint64_t)_setAnalog:(uint64_t)result;
- (uint64_t)_setLastPressedTimestamp:(uint64_t)result;
- (uint64_t)_setLastValueTimestamp:(uint64_t)result;
- (uint64_t)_setPressedDidChangeHandler:(uint64_t)result;
- (uint64_t)_setPressedThreshold:(uint64_t)result;
- (uint64_t)_setPressedValueField:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_setValue:(uint64_t)result;
- (uint64_t)_setValueDidChangeHandler:(uint64_t)result;
- (uint64_t)_sources;
- (uint64_t)_valueDidChangeHandler;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
- (void)setPressedDidChangeHandler:(id)a3;
- (void)setValueDidChangeHandler:(id)a3;
@end

@implementation _GCDevicePhysicalInputButtonElement

- (_GCDevicePhysicalInputButtonElement)initWithParameters:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  v5 = [(_GCDevicePhysicalInputElement *)&v11 initWithParameters:v4];
  v6 = -[_GCDevicePhysicalInputButtonElementParameters sources](v4);
  -[_GCDevicePhysicalInputButtonElement _setSources:]((uint64_t)v5, (uint64_t)v6);

  if (v4)
  {
    uint64_t v7 = v4[40];
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (v5) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_isAnalogSlot);
LABEL_4:
  if (v4)
  {
    double v8 = *((float *)v4 + 11);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  double v8 = 0.0;
  if (v5) {
LABEL_6:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, *(uint64_t *)&v8, (uint64_t)&v5->_pressedThresholdSlot);
LABEL_7:
  if (!v4)
  {
    uint64_t v9 = 0;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v9 = *((void *)v4 + 7);
  if (v5) {
LABEL_9:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v9, (uint64_t)&v5->_pressedValueFieldSlot);
LABEL_10:

  return v5;
}

- (uint64_t)_setSources:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      v4 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"_GCDevicePhysicalInputButtonElement.m", 232, @"Invalid parameter not satisfying: %s", "newValue != nil");
    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 56, 771);
  }
  return result;
}

- (uint64_t)_setAnalog:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 64);
  }
  return result;
}

- (uint64_t)_setPressedThreshold:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 72);
  }
  return result;
}

- (uint64_t)_setPressedValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  }
  return result;
}

- (_GCDevicePhysicalInputButtonElement)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputElement *)&v10 initWithTemplate:v6 context:v5];
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v10.receiver, v10.super_class);
  v7->_isAnalogSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[8]];
  v7->_pressedThresholdSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[9]];
  v7->_pressedValueFieldSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[10]];
  v7->_valueChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[11]];
  v7->_pressedChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[12]];
  v7->_valueSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[13]];
  v7->_valueTimestampSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[14]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[15]];

  v7->_pressedTimestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputButtonElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v42, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_11 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
  v12 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)a5);
  __int16 v13 = -[_GCDevicePhysicalInputButtonElement _setSources:]((uint64_t)self, (uint64_t)v12);
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFE | v13;

  if (a5)
  {
    BOOL v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64) != 0;
    if (self) {
      goto LABEL_9;
    }
LABEL_50:
    LOBYTE(v15) = 0;
    __int16 v16 = 0;
    goto LABEL_12;
  }
  BOOL v14 = 0;
  if (!self) {
    goto LABEL_50;
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
    float v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72));
    double v18 = v17;
    if (self) {
      goto LABEL_14;
    }
  }
  else
  {
    double v18 = 0.0;
    if (self)
    {
LABEL_14:
      int v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v18, (uint64_t)&self->_pressedThresholdSlot);
      if (v19) {
        __int16 v20 = 4;
      }
      else {
        __int16 v20 = 0;
      }
      goto LABEL_17;
    }
  }
  LOBYTE(v19) = 0;
  __int16 v20 = 0;
LABEL_17:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFB | v20;
  if (a5) {
    uint64_t v21 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
  }
  else {
    uint64_t v21 = 0;
  }
  char v22 = v15 | v19;
  if (self)
  {
    int v23 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v21, (uint64_t)&self->_pressedValueFieldSlot);
    if (v23) {
      __int16 v24 = 8;
    }
    else {
      __int16 v24 = 0;
    }
  }
  else
  {
    LOBYTE(v23) = 0;
    __int16 v24 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFF7 | v24;
  v9 |= v13 | v22 | v23;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      return v9;
    }
LABEL_31:
    if (a5)
    {
      float v31 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 104));
      double v32 = v31;
      if (self) {
        goto LABEL_33;
      }
    }
    else
    {
      double v32 = 0.0;
      if (self)
      {
LABEL_33:
        int v33 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v32, (uint64_t)&self->_valueSlot);
        if (v33) {
          __int16 v34 = 64;
        }
        else {
          __int16 v34 = 0;
        }
LABEL_36:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFBF | v34;
        if (a5)
        {
          uint64_t v35 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
          if (self) {
            goto LABEL_38;
          }
        }
        else
        {
          uint64_t v35 = 0;
          if (self)
          {
LABEL_38:
            int v36 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v35, (uint64_t)&self->_valueTimestampSlot);
            if (v36) {
              __int16 v37 = 128;
            }
            else {
              __int16 v37 = 0;
            }
LABEL_41:
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFF7F | v37;
            if (a5) {
              uint64_t v38 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 120);
            }
            else {
              uint64_t v38 = 0;
            }
            if (self)
            {
              int v39 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v38, (uint64_t)&self->_pressedTimestampSlot);
              if (v39) {
                __int16 v40 = 512;
              }
              else {
                __int16 v40 = 0;
              }
            }
            else
            {
              LOBYTE(v39) = 0;
              __int16 v40 = 0;
            }
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFDFF | v40;
            return v9 | v39 | v33 | v36;
          }
        }
        LOBYTE(v36) = 0;
        __int16 v37 = 0;
        goto LABEL_41;
      }
    }
    LOBYTE(v33) = 0;
    __int16 v34 = 0;
    goto LABEL_36;
  }
LABEL_24:
  v25 = (void *)-[_GCDevicePhysicalInputButtonElement _valueDidChangeHandler]((uint64_t)a5);
  int v26 = -[_GCDevicePhysicalInputButtonElement _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v25);
  if (v26) {
    __int16 v27 = 16;
  }
  else {
    __int16 v27 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFEF | v27;

  v28 = (void *)-[_GCDevicePhysicalInputButtonElement _pressedDidChangeHandler]((uint64_t)a5);
  int v29 = -[_GCDevicePhysicalInputButtonElement _setPressedDidChangeHandler:]((uint64_t)self, (uint64_t)v28);
  if (v29) {
    __int16 v30 = 32;
  }
  else {
    __int16 v30 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFDF | v30;
  v9 |= v26 | v29;

  if ((v6 & 8) != 0) {
    goto LABEL_31;
  }
  return v9;
}

- (uint64_t)_sources
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 56);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (BOOL)_isAnalog
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 64) != 0;
  }
  return result;
}

- (__n64)_pressedThreshold
{
  if (a1)
  {
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 72));
    result.n64_u32[1] = HIDWORD(v1);
    result.n64_f32[0] = v1;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uint64_t)_pressedValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  }
  return result;
}

- (uint64_t)_valueDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 88);
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
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 88, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_pressedDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 96);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setPressedDidChangeHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (void *)MEMORY[0x223C6E420](a2);
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 96, 771);

    return v4;
  }
  return result;
}

- (__n64)_value
{
  if (a1)
  {
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 104));
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
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 104);
  }
  return result;
}

- (double)_lastValueTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 112));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastValueTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 112);
  }
  return result;
}

- (double)_lastPressedTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 120));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastPressedTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 120);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  [(_GCDevicePhysicalInputElement *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_11 = v6;
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
      if ((v7 & 0x10) == 0) {
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
  if ((v7 & 0x10) == 0)
  {
LABEL_6:
    if ((v7 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_7:
    if ((v7 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"pressedDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_8:
    if ((v7 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"value");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"pressed");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueLatency");
  if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x200) == 0) {
    return;
  }
LABEL_11:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastPressedStateTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastPressedStateLatency");
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  [(_GCDevicePhysicalInputElement *)&v11 postCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_11 = v6;
  }
  __int16 v7 = *(_WORD *)((char *)a3 + v6);
  uint64_t v8 = v6;
  if (v7)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_16;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"analog");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_6:
    if ((v7 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_7:
    if ((v7 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"pressedDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_8:
    if ((v7 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"value");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"pressed");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueLatency");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x200) == 0)
  {
LABEL_11:
    if ((v7 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPressedStateTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPressedStateLatency");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_22:
  objc_super v9 = (void (**)(void, void, void))-[_GCDevicePhysicalInputButtonElement _valueDidChangeHandler]((uint64_t)self);
  if (v9)
  {
    [(_GCDevicePhysicalInputButtonElement *)self value];
    ((void (**)(void, _GCDevicePhysicalInputButtonElement *, _GCDevicePhysicalInputButtonElement *))v9)[2](v9, self, self);
  }

  if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x100) != 0)
  {
LABEL_25:
    unsigned int v10 = (void (**)(void, void, void, void))-[_GCDevicePhysicalInputButtonElement _pressedDidChangeHandler]((uint64_t)self);
    if (v10) {
      ((void (**)(void, _GCDevicePhysicalInputButtonElement *, _GCDevicePhysicalInputButtonElement *, BOOL))v10)[2](v10, self, self, [(_GCDevicePhysicalInputButtonElement *)self isPressed]);
    }
  }
}

- (GCTouchedStateInput)touchedInput
{
  return 0;
}

- (BOOL)isEqualToElement:(id)a3
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  if ([(_GCDevicePhysicalInputElement *)&v18 isEqualToElement:v6])
  {
    __int16 v7 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)self);
    uint64_t v8 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)v6);
    if (v7 != v8)
    {
      objc_super v3 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)self);
      uint64_t v4 = [v6 sources];
      if (![v3 isEqual:v4])
      {
        BOOL v9 = 0;
        goto LABEL_22;
      }
    }
    if (self)
    {
      uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isAnalogSlot);
      BOOL v12 = v11 != 0;
      if (!v6)
      {
        if (v11) {
          goto LABEL_20;
        }
        char v13 = 1;
LABEL_11:
        float v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedThresholdSlot));
        if ((v13 & 1) == 0) {
          goto LABEL_12;
        }
        if (v14 != 0.0) {
          goto LABEL_20;
        }
        self = (_GCDevicePhysicalInputButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
LABEL_27:
        __int16 v16 = 0;
LABEL_16:
        BOOL v9 = self == v16;
        BOOL v10 = self == v16;
        goto LABEL_21;
      }
    }
    else
    {
      if (!v6)
      {
        self = 0;
        goto LABEL_27;
      }
      BOOL v12 = 0;
    }
    if ((v12 ^ (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 64) != 0))) {
      goto LABEL_20;
    }
    if (!self)
    {
      float v14 = 0.0;
LABEL_12:
      float v15 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 72));
      if (v14 == v15)
      {
        if (self) {
          self = (_GCDevicePhysicalInputButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
        }
        __int16 v16 = (_GCDevicePhysicalInputButtonElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 80);
        goto LABEL_16;
      }
LABEL_20:
      BOOL v9 = 0;
      BOOL v10 = 0;
LABEL_21:
      if (v7 == v8)
      {
LABEL_23:

        goto LABEL_24;
      }
LABEL_22:

      BOOL v10 = v9;
      goto LABEL_23;
    }
    char v13 = 0;
    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_24:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  [(_GCDevicePhysicalInputButtonElement *)self value];
  double v5 = v4;
  BOOL v6 = [(_GCDevicePhysicalInputButtonElement *)self isPressed];
  __int16 v7 = &stru_26D27BBB8;
  if (v6) {
    __int16 v7 = @" (pressed)";
  }
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Button '%@'; value = %f%@>",
    v3,
    *(void *)&v5,
  uint64_t v8 = v7);

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  objc_super v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  float v4 = [(_GCDevicePhysicalInputElement *)self localizedName];
  double v5 = [(_GCDevicePhysicalInputElement *)self sfSymbolsName];
  BOOL v6 = [(_GCDevicePhysicalInputButtonElement *)self isAnalog];
  if (self) {
    uint64_t v7 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
  }
  else {
    uint64_t v7 = 0;
  }
  if (v6) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  [(_GCDevicePhysicalInputButtonElement *)self value];
  double v10 = v9;
  BOOL v11 = [(_GCDevicePhysicalInputButtonElement *)self isPressed];
  BOOL v12 = &stru_26D27BBB8;
  if (v11) {
    BOOL v12 = @" (pressed)";
  }
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Button %p '%@'; name = '%@', symbol = '%@', analog = %s, source = %zi, value = %f%@>",
    self,
    v3,
    v4,
    v5,
    v8,
    v7,
    *(void *)&v10,
  char v13 = v12);

  return (NSString *)v13;
}

- (id)valueDidChangeHandler
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputButtonElement _valueDidChangeHandler]((uint64_t)self);

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
  if (!dword_267F2901C) {
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo_3);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueTimestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_3 / dword_267F2901C)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputButtonElement _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (id)pressedDidChangeHandler
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputButtonElement _pressedDidChangeHandler]((uint64_t)self);

  return v2;
}

- (void)setPressedDidChangeHandler:(id)a3
{
}

- (BOOL)isPressed
{
  if (self)
  {
    uint64_t v2 = self;
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
  if (!dword_267F29024) {
    mach_timebase_info((mach_timebase_info_t)&lastPressedStateLatency_sTimebaseInfo_0);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedTimestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time()
                * lastPressedStateLatency_sTimebaseInfo_0
                / dword_267F29024)
       / 1000000000.0
       - v3;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  v24.receiver = self;
  v24.super_class = (Class)_GCDevicePhysicalInputButtonElement;
  BOOL v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v24, sel_update_forGamepadEvent_withTimestamp_);
  unsigned int v10 = MyUpdateContext_Offset_11;
  if (MyUpdateContext_Offset_11 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_11 = v10;
  }
  uint64_t v11 = v10;
  if (!self)
  {
    [a4 floatValueForElement:0];
    if (v23 == 0.0)
    {
      if (v23 <= 0.00000011921) {
        return v9;
      }
    }
    else
    {
      *(_WORD *)((char *)a3 + v11) |= 0xC0u;
      if (v23 <= 0.00000011921) {
        return 1;
      }
    }
    goto LABEL_10;
  }
  uint64_t v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedValueFieldSlot);
  if (v12 != -1)
  {
    uint64_t v13 = v12;
    float v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
    [a4 floatValueForElement:v13];
    float v16 = v15;
    float v17 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_pressedThresholdSlot));
    float v18 = v14 - v17;
    float v19 = v16 - v17;
    if (v16 != v14)
    {
      BOOL v20 = v19 > 0.00000011921;
      BOOL v21 = v18 > 0.00000011921;
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v16), (uint64_t)&self->_valueSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_valueTimestampSlot);
      *(_WORD *)((char *)a3 + v11) |= 0xC0u;
      if (((v20 ^ v21) & 1) == 0) {
        return 1;
      }
      goto LABEL_9;
    }
    if (v19 > 0.00000011921 != v18 > 0.00000011921)
    {
LABEL_9:
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_pressedTimestampSlot);
LABEL_10:
      *(_WORD *)((char *)a3 + v11) |= 0x300u;
      return 1;
    }
  }
  return v9;
}

@end