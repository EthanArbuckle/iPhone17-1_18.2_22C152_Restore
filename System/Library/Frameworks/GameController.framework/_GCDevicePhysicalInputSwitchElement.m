@interface _GCDevicePhysicalInputSwitchElement
+ (unsigned)updateContextSize;
- (BOOL)_canWrap;
- (BOOL)_isSequential;
- (BOOL)canWrap;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)isSequential;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (NSSet)sources;
- (NSString)description;
- (_GCDevicePhysicalInputSwitchElement)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputSwitchElement)initWithTemplate:(id)a3 context:(id)a4;
- (_NSRange)positionRange;
- (double)_lastPositionTimestamp;
- (double)lastPositionLatency;
- (double)lastPositionTimestamp;
- (id)positionDidChangeHandler;
- (int64_t)position;
- (uint64_t)_position;
- (uint64_t)_positionDidChangeHandler;
- (uint64_t)_positionField;
- (uint64_t)_positionMax;
- (uint64_t)_positionMin;
- (uint64_t)_setCanWrap:(uint64_t)result;
- (uint64_t)_setLastPositionTimestamp:(uint64_t)result;
- (uint64_t)_setPosition:(uint64_t)result;
- (uint64_t)_setPositionDidChangeHandler:(uint64_t)result;
- (uint64_t)_setPositionField:(uint64_t)result;
- (uint64_t)_setPositionMax:(uint64_t)result;
- (uint64_t)_setPositionMin:(uint64_t)result;
- (uint64_t)_setSequential:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_sources;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
- (void)setPositionDidChangeHandler:(id)a3;
@end

@implementation _GCDevicePhysicalInputSwitchElement

- (_GCDevicePhysicalInputSwitchElement)initWithParameters:(id)a3
{
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  v5 = [(_GCDevicePhysicalInputElement *)&v14 initWithParameters:v4];
  v6 = -[_GCDevicePhysicalInputSwitchElementParameters sources](v4);
  -[_GCDevicePhysicalInputSwitchElement _setSources:]((uint64_t)v5, (uint64_t)v6);

  if (v4)
  {
    uint64_t v7 = *((unsigned __int8 *)v4 + 41);
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (v5) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_canWrapSlot);
LABEL_4:
  if (v4)
  {
    uint64_t v8 = *((unsigned __int8 *)v4 + 40);
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  if (v5) {
LABEL_6:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v8, (uint64_t)&v5->_isSequentialSlot);
LABEL_7:
  if (v4)
  {
    uint64_t v9 = v4[8];
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  if (v5) {
LABEL_9:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v9, (uint64_t)&v5->_positionMinSlot);
LABEL_10:
  if (v4)
  {
    uint64_t v10 = v4[8];
    uint64_t v11 = v4[9];
    if (!v5) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (v5) {
LABEL_12:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v11 + v10, (uint64_t)&v5->_positionMaxSlot);
LABEL_13:
  if (!v4)
  {
    uint64_t v12 = 0;
    if (!v5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v12 = v4[7];
  if (v5) {
LABEL_15:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v12, (uint64_t)&v5->_positionFieldSlot);
LABEL_16:

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"_GCDevicePhysicalInputSwitchElement.m", 211, @"Invalid parameter not satisfying: %s", "newValue != nil");
    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 56, 771);
  }
  return result;
}

- (uint64_t)_setCanWrap:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 64);
  }
  return result;
}

- (uint64_t)_setSequential:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  }
  return result;
}

- (uint64_t)_setPositionMin:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  }
  return result;
}

- (uint64_t)_setPositionMax:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 88);
  }
  return result;
}

- (uint64_t)_setPositionField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 96);
  }
  return result;
}

- (_GCDevicePhysicalInputSwitchElement)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputElement *)&v10 initWithTemplate:v6 context:v5];
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocateObjectSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v10.receiver, v10.super_class);
  v7->_canWrapSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[8]];
  v7->_isSequentialSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[9]];
  v7->_positionMinSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[10]];
  v7->_positionMaxSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[11]];
  v7->_positionFieldSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[12]];
  v7->_positionChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[13]];
  v7->_positionSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[14]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[15]];

  v7->_timestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputSwitchElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v42.receiver = self;
  v42.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v42, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_2 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
  uint64_t v12 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)a5);
  __int16 v41 = -[_GCDevicePhysicalInputSwitchElement _setSources:]((uint64_t)self, (uint64_t)v12);
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFE | v41;

  if (a5)
  {
    BOOL v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64) != 0;
    if (self) {
      goto LABEL_9;
    }
LABEL_52:
    LOBYTE(v14) = 0;
    __int16 v15 = 0;
    goto LABEL_12;
  }
  BOOL v13 = 0;
  if (!self) {
    goto LABEL_52;
  }
LABEL_9:
  int v14 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v13, (uint64_t)&self->_canWrapSlot);
  if (v14) {
    __int16 v15 = 2;
  }
  else {
    __int16 v15 = 0;
  }
LABEL_12:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFD | v15;
  if (a5)
  {
    BOOL v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72) != 0;
    if (self) {
      goto LABEL_14;
    }
LABEL_54:
    LOBYTE(v17) = 0;
    __int16 v18 = 0;
    goto LABEL_17;
  }
  BOOL v16 = 0;
  if (!self) {
    goto LABEL_54;
  }
LABEL_14:
  int v17 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v16, (uint64_t)&self->_isSequentialSlot);
  if (v17) {
    __int16 v18 = 4;
  }
  else {
    __int16 v18 = 0;
  }
LABEL_17:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFB | v18;
  if (a5)
  {
    uint64_t v19 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
    if (self) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (self)
    {
LABEL_19:
      int v20 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v19, (uint64_t)&self->_positionMinSlot);
      if (v20) {
        __int16 v21 = 8;
      }
      else {
        __int16 v21 = 0;
      }
      goto LABEL_22;
    }
  }
  LOBYTE(v20) = 0;
  __int16 v21 = 0;
LABEL_22:
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFF7 | v21;
  if (a5) {
    uint64_t v22 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 88);
  }
  else {
    uint64_t v22 = 0;
  }
  char v23 = v14 | v17;
  if (self)
  {
    int v24 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v22, (uint64_t)&self->_positionMaxSlot);
    if (v24) {
      __int16 v25 = 16;
    }
    else {
      __int16 v25 = 0;
    }
  }
  else
  {
    LOBYTE(v24) = 0;
    __int16 v25 = 0;
  }
  char v26 = v23 | v20;
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFEF | v25;
  if (a5) {
    uint64_t v27 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 96);
  }
  else {
    uint64_t v27 = 0;
  }
  char v28 = v26 | v24;
  if (self)
  {
    int v29 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v27, (uint64_t)&self->_positionFieldSlot);
    if (v29) {
      __int16 v30 = 32;
    }
    else {
      __int16 v30 = 0;
    }
  }
  else
  {
    LOBYTE(v29) = 0;
    __int16 v30 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFDF | v30;
  v9 |= v41 | v29 | v28;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      return v9;
    }
LABEL_39:
    if (a5)
    {
      uint64_t v34 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
      if (self) {
        goto LABEL_41;
      }
    }
    else
    {
      uint64_t v34 = 0;
      if (self)
      {
LABEL_41:
        int v35 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v34, (uint64_t)&self->_positionSlot);
        if (v35) {
          __int16 v36 = 128;
        }
        else {
          __int16 v36 = 0;
        }
LABEL_44:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFF7F | v36;
        if (a5)
        {
          uint64_t v37 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 120);
          if (self) {
            goto LABEL_46;
          }
        }
        else
        {
          uint64_t v37 = 0;
          if (self)
          {
LABEL_46:
            int v38 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v37, (uint64_t)&self->_timestampSlot);
            if (v38) {
              __int16 v39 = 256;
            }
            else {
              __int16 v39 = 0;
            }
            goto LABEL_49;
          }
        }
        LOBYTE(v38) = 0;
        __int16 v39 = 0;
LABEL_49:
        *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFEFF | v39;
        return v9 | v38 | v35;
      }
    }
    LOBYTE(v35) = 0;
    __int16 v36 = 0;
    goto LABEL_44;
  }
LABEL_35:
  v31 = (void *)-[_GCDevicePhysicalInputSwitchElement _positionDidChangeHandler]((uint64_t)a5);
  int v32 = -[_GCDevicePhysicalInputSwitchElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)v31);
  if (v32) {
    __int16 v33 = 64;
  }
  else {
    __int16 v33 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFBF | v33;
  v9 |= v32;

  if ((v6 & 8) != 0) {
    goto LABEL_39;
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

- (BOOL)_canWrap
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 64) != 0;
  }
  return result;
}

- (BOOL)_isSequential
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72) != 0;
  }
  return result;
}

- (uint64_t)_positionMin
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  }
  return result;
}

- (uint64_t)_positionMax
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 88);
  }
  return result;
}

- (uint64_t)_positionField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 96);
  }
  return result;
}

- (uint64_t)_positionDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 104);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setPositionDidChangeHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (void *)MEMORY[0x223C6E420](a2);
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 104, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_position
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 112);
  }
  return result;
}

- (uint64_t)_setPosition:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 112);
  }
  return result;
}

- (double)_lastPositionTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 120));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastPositionTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 120);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  [(_GCDevicePhysicalInputElement *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_2 = v6;
  }
  __int16 v7 = *(_WORD *)((char *)a3 + v6);
  uint64_t v8 = v6;
  if ((v7 & 1) == 0)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_5;
    }
LABEL_13:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"canWrap");
    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sources");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 2) != 0) {
    goto LABEL_13;
  }
LABEL_5:
  if ((v7 & 4) == 0) {
    goto LABEL_6;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sequential");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
LABEL_6:
  if ((v7 & 0x18) != 0)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"positionRange");
    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x40) == 0)
    {
LABEL_8:
      if ((v7 & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"positionDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_9:
    if ((v7 & 0x100) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"position");
  if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x100) == 0) {
    return;
  }
LABEL_10:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastPositionTimestamp");
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastPositionLatency");
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  [(_GCDevicePhysicalInputElement *)&v11 postCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_2 = v6;
  }
  __int16 v7 = *(_WORD *)((char *)a3 + v6);
  uint64_t v8 = v6;
  if ((v7 & 1) == 0)
  {
    if ((v7 & 2) == 0) {
      goto LABEL_5;
    }
LABEL_13:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"canWrap");
    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 2) != 0) {
    goto LABEL_13;
  }
LABEL_5:
  if ((v7 & 4) == 0) {
    goto LABEL_6;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sequential");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
LABEL_6:
  if ((v7 & 0x18) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"positionRange");
    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x40) == 0)
    {
LABEL_8:
      if ((v7 & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"positionDidChangeHandler");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_9:
    if ((v7 & 0x100) == 0) {
      goto LABEL_10;
    }
LABEL_18:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPositionTimestamp");
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPositionLatency");
    if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x80) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"position");
  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) != 0) {
    goto LABEL_18;
  }
LABEL_10:
  if ((v7 & 0x80) == 0) {
    return;
  }
LABEL_19:
  objc_super v9 = (void (**)(void, void, void, void))-[_GCDevicePhysicalInputSwitchElement _positionDidChangeHandler]((uint64_t)self);
  if (v9)
  {
    if (self) {
      uint64_t v10 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionSlot);
    }
    else {
      uint64_t v10 = 0;
    }
    ((void (**)(void, _GCDevicePhysicalInputSwitchElement *, _GCDevicePhysicalInputSwitchElement *, uint64_t))v9)[2](v9, self, self, v10);
  }
}

- (BOOL)isEqualToElement:(id)a3
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  if ([(_GCDevicePhysicalInputElement *)&v19 isEqualToElement:v6])
  {
    __int16 v7 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)self);
    uint64_t v8 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)v6);
    if (v7 != v8)
    {
      objc_super v3 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)self);
      uint64_t v4 = [v6 sources];
      if (![v3 isEqual:v4])
      {
        BOOL v9 = 0;
        goto LABEL_23;
      }
    }
    if (self)
    {
      uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_canWrapSlot);
      BOOL v12 = v11 != 0;
      if (v6)
      {
LABEL_8:
        if (((v12 ^ (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 64) != 0)) & 1) == 0)
        {
          BOOL v13 = self
             && -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isSequentialSlot) != 0;
          if (((v13 ^ (-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 72) != 0)) & 1) == 0)
          {
            if (self)
            {
              uint64_t v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMinSlot);
              if (v14 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 80))
              {
                uint64_t v15 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMaxSlot);
                if (v15 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 88))
                {
                  uint64_t v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionFieldSlot);
LABEL_16:
                  uint64_t v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 96);
LABEL_17:
                  BOOL v9 = v16 == v17;
                  BOOL v10 = v16 == v17;
                  goto LABEL_22;
                }
              }
            }
            else if (!-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 80) {
                   && !-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 88))
            }
            {
              uint64_t v16 = 0;
              goto LABEL_16;
            }
          }
        }
LABEL_21:
        BOOL v9 = 0;
        BOOL v10 = 0;
LABEL_22:
        if (v7 == v8)
        {
LABEL_24:

          goto LABEL_25;
        }
LABEL_23:

        BOOL v10 = v9;
        goto LABEL_24;
      }
      if (v11
        || -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isSequentialSlot)
        || -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMinSlot)
        || -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMaxSlot))
      {
        goto LABEL_21;
      }
      uint64_t v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionFieldSlot);
    }
    else
    {
      if (v6)
      {
        BOOL v12 = 0;
        goto LABEL_8;
      }
      uint64_t v16 = 0;
    }
    uint64_t v17 = 0;
    goto LABEL_17;
  }
  BOOL v10 = 0;
LABEL_25:

  return v10;
}

- (NSString)description
{
  objc_super v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Switch '%@'; position = %zd>",
    v3,
  uint64_t v4 = [(_GCDevicePhysicalInputSwitchElement *)self position]);

  return (NSString *)v4;
}

- (id)positionDidChangeHandler
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputSwitchElement _positionDidChangeHandler]((uint64_t)self);

  return v2;
}

- (void)setPositionDidChangeHandler:(id)a3
{
}

- (int64_t)position
{
  if (self) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](self, self + 112);
  }
  return self;
}

- (_NSRange)positionRange
{
  if (self)
  {
    uint64_t v2 = self;
    uint64_t v3 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionMinSlot);
    self = (_GCDevicePhysicalInputSwitchElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v2, (uint64_t)&v2->_positionMaxSlot);
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (char *)self - v3;
  NSUInteger v5 = v3;
  result.length = (NSUInteger)v4;
  result.location = v5;
  return result;
}

- (BOOL)isSequential
{
  if (self) {
    LOBYTE(self) = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_isSequentialSlot) != 0;
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

- (double)lastPositionTimestamp
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  }
  else {
    return 0.0;
  }
}

- (double)lastPositionLatency
{
  if (!dword_267F28D54) {
    mach_timebase_info((mach_timebase_info_t)&lastPositionLatency_sTimebaseInfo_0);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time()
                * lastPositionLatency_sTimebaseInfo_0
                / dword_267F28D54)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  uint64_t v2 = (void *)-[_GCDevicePhysicalInputSwitchElement _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  v17.receiver = self;
  v17.super_class = (Class)_GCDevicePhysicalInputSwitchElement;
  BOOL v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v17, sel_update_forGamepadEvent_withTimestamp_);
  unsigned int v10 = MyUpdateContext_Offset_2;
  if (MyUpdateContext_Offset_2 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_2 = v10;
    if (self) {
      goto LABEL_3;
    }
LABEL_11:
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    goto LABEL_5;
  }
  if (!self) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionFieldSlot);
  if (v11 == -1) {
    return v9;
  }
  uint64_t v12 = v11;
  uint64_t v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_positionSlot);
LABEL_5:
  [a4 floatValueForElement:v12];
  uint64_t v15 = (uint64_t)rintf(v14);
  if (v13 != v15)
  {
    if (self)
    {
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v15, (uint64_t)&self->_positionSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_timestampSlot);
    }
    *(_WORD *)((char *)a3 + v10) |= 0x180u;
    return 1;
  }
  return v9;
}

@end