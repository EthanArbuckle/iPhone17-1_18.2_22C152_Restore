@interface GCGearShifterElement
+ (unsigned)updateContextSize;
- (BOOL)canWrap;
- (BOOL)isAnalog;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)isSequential;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (GCGearShifterElement)initWithParameters:(id)a3;
- (GCGearShifterElement)initWithTemplate:(id)a3 context:(id)a4;
- (NSSet)sources;
- (NSString)description;
- (_NSRange)positionRange;
- (__n64)_delta;
- (double)_lastDeltaTimestamp;
- (double)_lastPositionTimestamp;
- (double)lastDeltaLatency;
- (double)lastDeltaTimestamp;
- (double)lastPositionLatency;
- (double)lastPositionTimestamp;
- (float)delta;
- (id)deltaDidChangeHandler;
- (id)patternInput;
- (id)positionDidChangeHandler;
- (id)sequentialInput;
- (int64_t)position;
- (uint64_t)_deltaDidChangeHandler;
- (uint64_t)_position;
- (uint64_t)_positionDidChangeHandler;
- (uint64_t)_positionField;
- (uint64_t)_positionMax;
- (uint64_t)_positionMin;
- (uint64_t)_setDelta:(uint64_t)result;
- (uint64_t)_setDeltaDidChangeHandler:(uint64_t)result;
- (uint64_t)_setLastDeltaTimestamp:(uint64_t)result;
- (uint64_t)_setLastPositionTimestamp:(uint64_t)result;
- (uint64_t)_setPosition:(uint64_t)result;
- (uint64_t)_setPositionDidChangeHandler:(uint64_t)result;
- (uint64_t)_setPositionField:(uint64_t)result;
- (uint64_t)_setPositionMax:(uint64_t)result;
- (uint64_t)_setPositionMin:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_sources;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
- (void)setDeltaDidChangeHandler:(id)a3;
- (void)setPositionDidChangeHandler:(id)a3;
@end

@implementation GCGearShifterElement

- (GCGearShifterElement)initWithParameters:(id)a3
{
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCGearShifterElement;
  v5 = [(_GCDevicePhysicalInputElement *)&v11 initWithParameters:v4];
  v6 = v5;
  if (v4) {
    BOOL v7 = *((unsigned char *)v4 + 40) != 0;
  }
  else {
    BOOL v7 = 0;
  }
  v5->_isPatternShifter = v7;
  v8 = -[_GCGearShifterElementParameters sources](v4);
  -[GCGearShifterElement _setSources:]((uint64_t)v6, (uint64_t)v8);

  if (v6->_isPatternShifter)
  {
    if (v4)
    {
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v4[8], (uint64_t)&v6->_impl.pattern.positionMinSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v4[9] + v4[8], (uint64_t)&v6->_impl.pattern.positionMaxSlot);
      uint64_t v9 = v4[7];
    }
    else
    {
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, 0, (uint64_t)&v6->_impl.pattern.positionMinSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, 0, (uint64_t)&v6->_impl.pattern.positionMaxSlot);
      uint64_t v9 = 0;
    }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v9, (uint64_t)&v6->_impl.pattern.positionFieldSlot);
  }

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"GCGearShifterElement.m", 320, @"Invalid parameter not satisfying: %s", "newValue != nil");
    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 64, 771);
  }
  return result;
}

- (uint64_t)_setPositionMin:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  }
  return result;
}

- (uint64_t)_setPositionMax:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  }
  return result;
}

- (uint64_t)_setPositionField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 88);
  }
  return result;
}

- (GCGearShifterElement)initWithTemplate:(id)a3 context:(id)a4
{
  v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GCGearShifterElement;
  v8 = [(_GCDevicePhysicalInputElement *)&v11 initWithTemplate:v6 context:v7];
  int v9 = *((unsigned __int8 *)v6 + 56);
  v8->_isPatternShifter = v9;
  v8->_impl.pattern.sourcesSlot = [v7 view:v8 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[8]];
  if (v9)
  {
    v8->_impl.pattern.positionMinSlot = [v7 view:v8 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[9]];
    v8->_impl.pattern.positionMaxSlot = [v7 view:v8 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[10]];
    v8->_impl.pattern.positionFieldSlot = [v7 view:v8 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[11]];
  }
  if (v8->_isPatternShifter) {
    v8->_impl.pattern.positionChangedHandlerSlot = [v7 view:v8 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[12]];
  }
  else {
    v8->_impl.pattern.positionMinSlot = [v7 view:v8 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[9]];
  }
  if (v8->_isPatternShifter)
  {
    v8->_impl.pattern.positionSlot = [v7 view:v8 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[13]];
    v8->_impl.pattern.timestampSlot = [v7 view:v8 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[14]];
  }
  else
  {
    v8->_impl.pattern.positionMaxSlot = [v7 view:v8 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[10]];
    v8->_impl.pattern.positionMaxSlot = [v7 view:v8 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[10]];
  }

  return v8;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___GCGearShifterElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v48.receiver = self;
  v48.super_class = (Class)GCGearShifterElement;
  unsigned __int8 v10 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v48, sel_update_forUsages_with_);
  if (self->_isPatternShifter != *((unsigned __int8 *)a5 + 56))
  {
    v47 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v47 handleFailureInMethod:a2 object:self file:@"GCGearShifterElement.m" lineNumber:150 description:@"Assertion failed: _isPatternShifter == other->_isPatternShifter"];
  }
  unsigned int v11 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    unsigned int v11 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset = v11;
  }
  uint64_t v12 = v11;
  if (!self->_isPatternShifter)
  {
    if ((v6 & 2) != 0)
    {
      v35 = (void *)-[GCGearShifterElement _sources]((uint64_t)a5);
      char v36 = -[GCGearShifterElement _setSources:]((uint64_t)self, (uint64_t)v35);
      *((unsigned char *)a3 + v12) = *((unsigned char *)a3 + v12) & 0xFE | v36;
      v10 |= v36;

      if ((v6 & 4) == 0)
      {
LABEL_12:
        if ((v6 & 8) == 0) {
          return v10;
        }
        goto LABEL_40;
      }
    }
    else if ((v6 & 4) == 0)
    {
      goto LABEL_12;
    }
    v37 = (void *)-[GCGearShifterElement _deltaDidChangeHandler]((uint64_t)a5);
    int v38 = -[GCGearShifterElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)v37);
    if (v38) {
      char v39 = 2;
    }
    else {
      char v39 = 0;
    }
    *((unsigned char *)a3 + v12) = *((unsigned char *)a3 + v12) & 0xFD | v39;
    v10 |= v38;

    if ((v6 & 8) == 0) {
      return v10;
    }
LABEL_40:
    float v40 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80));
    int v41 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v40), (uint64_t)&self->_impl.pattern.positionMaxSlot);
    if (v41) {
      char v42 = 4;
    }
    else {
      char v42 = 0;
    }
    *((unsigned char *)a3 + v12) = *((unsigned char *)a3 + v12) & 0xFB | v42;
    uint64_t v43 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 88);
    int v44 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v43, (uint64_t)&self->_impl.pattern.positionFieldSlot);
    if (v44) {
      __int16 v45 = 256;
    }
    else {
      __int16 v45 = 0;
    }
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFEFF | v45;
    return v10 | v44 | v41;
  }
  if ((v6 & 2) != 0)
  {
    v13 = (void *)-[GCGearShifterElement _sources]((uint64_t)a5);
    __int16 v14 = -[GCGearShifterElement _setSources:]((uint64_t)self, (uint64_t)v13);
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFFFE | v14;
    char v15 = v10 | v14;

    uint64_t v16 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
    int v17 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v16, (uint64_t)&self->_impl.pattern.positionMinSlot);
    if (v17) {
      __int16 v18 = 8;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFFF7 | v18;
    char v19 = v15 | v17;
    uint64_t v20 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
    int v21 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v20, (uint64_t)&self->_impl.pattern.positionMaxSlot);
    if (v21) {
      __int16 v22 = 16;
    }
    else {
      __int16 v22 = 0;
    }
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFFEF | v22;
    uint64_t v23 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 88);
    int v24 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v23, (uint64_t)&self->_impl.pattern.positionFieldSlot);
    if (v24) {
      __int16 v25 = 32;
    }
    else {
      __int16 v25 = 0;
    }
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFFDF | v25;
    unsigned __int8 v10 = v19 | v21 | v24;
    if ((v6 & 4) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0) {
        return v10;
      }
      goto LABEL_28;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_8;
  }
  v26 = (void *)-[GCGearShifterElement _positionDidChangeHandler]((uint64_t)a5);
  int v27 = -[GCGearShifterElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)v26);
  if (v27) {
    __int16 v28 = 64;
  }
  else {
    __int16 v28 = 0;
  }
  *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFFBF | v28;
  v10 |= v27;

  if ((v6 & 8) != 0)
  {
LABEL_28:
    uint64_t v29 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 104);
    int v30 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v29, (uint64_t)&self->_impl.pattern.positionSlot);
    if (v30) {
      __int16 v31 = 128;
    }
    else {
      __int16 v31 = 0;
    }
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFF7F | v31;
    uint64_t v32 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
    int v33 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v32, (uint64_t)&self->_impl.pattern.timestampSlot);
    if (v33) {
      __int16 v34 = 256;
    }
    else {
      __int16 v34 = 0;
    }
    *(_WORD *)((char *)a3 + v12) = *(_WORD *)((unsigned char *)a3 + v12) & 0xFEFF | v34;
    v10 |= v30 | v33;
  }
  return v10;
}

- (uint64_t)_sources
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 64);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_positionMin
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72);
  }
  return result;
}

- (uint64_t)_positionMax
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  }
  return result;
}

- (uint64_t)_positionField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 88);
  }
  return result;
}

- (uint64_t)_positionDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 96);
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
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 96, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_position
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 104);
  }
  return result;
}

- (uint64_t)_setPosition:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 104);
  }
  return result;
}

- (double)_lastPositionTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 112));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastPositionTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 112);
  }
  return result;
}

- (uint64_t)_deltaDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 72);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_setDeltaDidChangeHandler:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = (void *)MEMORY[0x223C6E420](a2);
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 72, 771);

    return v4;
  }
  return result;
}

- (__n64)_delta
{
  if (a1)
  {
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 80));
    result.n64_u32[1] = HIDWORD(v1);
    result.n64_f32[0] = v1;
  }
  else
  {
    return 0;
  }
  return result;
}

- (uint64_t)_setDelta:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 80);
  }
  return result;
}

- (double)_lastDeltaTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 88));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastDeltaTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 88);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)GCGearShifterElement;
  [(_GCDevicePhysicalInputElement *)&v12 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset = v6;
  }
  uint64_t v7 = v6;
  if (self->_isPatternShifter)
  {
    __int16 v8 = *(_WORD *)((char *)a3 + v6);
    if (v8)
    {
      -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sources");
      __int16 v8 = *(_WORD *)((char *)a3 + v7);
    }
    if ((v8 & 0x18) != 0)
    {
      -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"positionRange");
      __int16 v8 = *(_WORD *)((char *)a3 + v7);
      if ((v8 & 0x40) == 0)
      {
LABEL_8:
        if ((v8 & 0x80) == 0) {
          goto LABEL_9;
        }
        goto LABEL_18;
      }
    }
    else if ((v8 & 0x40) == 0)
    {
      goto LABEL_8;
    }
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"positionDidChangeHandler");
    __int16 v8 = *(_WORD *)((char *)a3 + v7);
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x100) == 0) {
        return;
      }
      goto LABEL_19;
    }
LABEL_18:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"position");
    if ((*(_WORD *)((unsigned char *)a3 + v7) & 0x100) == 0) {
      return;
    }
LABEL_19:
    unsigned __int8 v10 = @"lastPositionLatency";
    unsigned int v11 = @"lastPositionTimestamp";
LABEL_24:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)v11);
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)v10);
    return;
  }
  char v9 = *((unsigned char *)a3 + v6);
  if (v9)
  {
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"sources");
    char v9 = *((unsigned char *)a3 + v7);
    if ((v9 & 2) == 0)
    {
LABEL_13:
      if ((v9 & 4) == 0) {
        goto LABEL_14;
      }
LABEL_22:
      -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"delta");
      if ((*((unsigned char *)a3 + v7) & 8) == 0) {
        return;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    goto LABEL_13;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"deltaDidChangeHandler");
  char v9 = *((unsigned char *)a3 + v7);
  if ((v9 & 4) != 0) {
    goto LABEL_22;
  }
LABEL_14:
  if ((v9 & 8) != 0)
  {
LABEL_23:
    unsigned __int8 v10 = @"lastDeltaLatency";
    unsigned int v11 = @"lastDeltaTimestamp";
    goto LABEL_24;
  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)GCGearShifterElement;
  [(_GCDevicePhysicalInputElement *)&v12 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset = v6;
  }
  uint64_t v7 = v6;
  if (!self->_isPatternShifter)
  {
    char v9 = *((unsigned char *)a3 + v6);
    if (v9)
    {
      -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
      char v9 = *((unsigned char *)a3 + v7);
      if ((v9 & 2) == 0)
      {
LABEL_14:
        if ((v9 & 4) == 0) {
          goto LABEL_15;
        }
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + v6) & 2) == 0)
    {
      goto LABEL_14;
    }
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"deltaDidChangeHandler");
    char v9 = *((unsigned char *)a3 + v7);
    if ((v9 & 4) == 0)
    {
LABEL_15:
      if ((v9 & 8) == 0) {
        return;
      }
LABEL_27:
      -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastDeltaTimestamp");
      -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastDeltaLatency");
      return;
    }
LABEL_26:
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"delta");
    if ((*((unsigned char *)a3 + v7) & 8) == 0) {
      return;
    }
    goto LABEL_27;
  }
  __int16 v8 = *(_WORD *)((char *)a3 + v6);
  if (v8)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
    __int16 v8 = *(_WORD *)((char *)a3 + v7);
  }
  if ((v8 & 0x18) != 0)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"positionRange");
    __int16 v8 = *(_WORD *)((char *)a3 + v7);
    if ((v8 & 0x40) == 0)
    {
LABEL_8:
      if ((v8 & 0x80) == 0) {
        goto LABEL_9;
      }
      goto LABEL_19;
    }
  }
  else if ((v8 & 0x40) == 0)
  {
    goto LABEL_8;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"positionDidChangeHandler");
  __int16 v8 = *(_WORD *)((char *)a3 + v7);
  if ((v8 & 0x80) == 0)
  {
LABEL_9:
    if ((v8 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"position");
  __int16 v8 = *(_WORD *)((char *)a3 + v7);
  if ((v8 & 0x100) == 0)
  {
LABEL_10:
    if ((v8 & 0x80) == 0) {
      return;
    }
    goto LABEL_21;
  }
LABEL_20:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPositionTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastPositionLatency");
  if ((*(_WORD *)((unsigned char *)a3 + v7) & 0x80) == 0) {
    return;
  }
LABEL_21:
  unsigned __int8 v10 = (void (**)(void, void, void, void))-[GCGearShifterElement _positionDidChangeHandler]((uint64_t)self);
  if (v10)
  {
    uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionSlot);
    ((void (**)(void, GCGearShifterElement *, GCGearShifterElement *, uint64_t))v10)[2](v10, self, self, v11);
  }
}

- (BOOL)isEqualToElement:(id)a3
{
  unsigned int v6 = (unsigned __int8 *)a3;
  v22.receiver = self;
  v22.super_class = (Class)GCGearShifterElement;
  if (![(_GCDevicePhysicalInputElement *)&v22 isEqualToElement:v6]
    || (int isPatternShifter = self->_isPatternShifter, isPatternShifter != v6[56]))
  {
    char v10 = 0;
    goto LABEL_8;
  }
  if (self->_isPatternShifter)
  {
    objc_super v3 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);
    uint64_t v4 = (void *)-[GCGearShifterElement _sources]((uint64_t)v6);
    BOOL v8 = v3 != v4;
    if (v3 == v4
      || (char v9 = (void *)-[GCGearShifterElement _sources]((uint64_t)self),
          uint64_t v20 = (void *)-[GCGearShifterElement _sources]((uint64_t)v6),
          int v21 = v9,
          [v9 isEqual:v20]))
    {
      uint64_t v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMinSlot);
      if (v12 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)(v6 + 72)))
      {
        uint64_t v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMaxSlot);
        if (v13 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)(v6 + 80)))
        {
          uint64_t v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot);
          if (v14 == -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)(v6 + 88)))
          {
            if (v3 == v4)
            {
              char v10 = 1;
              uint64_t v4 = v3;
            }
            else
            {

              char v10 = 1;
            }
            goto LABEL_19;
          }
        }
      }
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  char v15 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);
  uint64_t v16 = -[GCGearShifterElement _sources]((uint64_t)v6);
  if (v15 != (void *)v16)
  {
    int v17 = (void *)v16;
    __int16 v18 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);
    char v19 = (void *)-[GCGearShifterElement _sources]((uint64_t)v6);
    char v10 = [v18 isEqual:v19];

    if (!v8) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }

  char v10 = 1;
  if (v8)
  {
LABEL_17:
  }
LABEL_18:
  if (isPatternShifter)
  {
LABEL_19:
  }
LABEL_8:

  return v10;
}

- (id)patternInput
{
  if (!self->_isPatternShifter) {
    self = 0;
  }
  return self;
}

- (id)sequentialInput
{
  if (self->_isPatternShifter) {
    self = 0;
  }
  return self;
}

- (NSString)description
{
  BOOL isPatternShifter = self->_isPatternShifter;
  uint64_t v4 = [(_GCDevicePhysicalInputElement *)self identifier];
  if (isPatternShifter)
  {
    +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Pattern Shifter '%@'; position = %zd>",
      v4,
      [(GCGearShifterElement *)self position]);
  }
  else
  {
    [(GCGearShifterElement *)self delta];
    +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Sequential Shifter '%@'; delta = %f>",
      v4,
      v5);
  unsigned int v6 = };

  return (NSString *)v6;
}

- (id)positionDidChangeHandler
{
  if (self->_isPatternShifter)
  {
    uint64_t v2 = (void *)-[GCGearShifterElement _positionDidChangeHandler]((uint64_t)self);
  }
  else
  {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
    uint64_t v2 = 0;
  }

  return v2;
}

- (void)setPositionDidChangeHandler:(id)a3
{
  if (self->_isPatternShifter) {
    -[GCGearShifterElement _setPositionDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
  }
  else {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  }
}

- (int64_t)position
{
  if (self->_isPatternShifter)
  {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionSlot);
  }
  else
  {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
    return 0;
  }
}

- (_NSRange)positionRange
{
  if (self->_isPatternShifter)
  {
    uint64_t v3 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMinSlot);
    NSUInteger v4 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMaxSlot)- v3;
  }
  else
  {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
    uint64_t v3 = 0;
    NSUInteger v4 = 0;
  }
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (BOOL)isSequential
{
  if (!self->_isPatternShifter) {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (BOOL)canWrap
{
  if (!self->_isPatternShifter) {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  }
  return 1;
}

- (double)lastPositionTimestamp
{
  if (self->_isPatternShifter) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.timestampSlot));
  }
  [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  return 0.0;
}

- (double)lastPositionLatency
{
  if (self->_isPatternShifter)
  {
    if (!dword_267F28C5C) {
      mach_timebase_info((mach_timebase_info_t)&lastPositionLatency_sTimebaseInfo);
    }
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.timestampSlot));
    return (double)(mach_absolute_time()
                  * lastPositionLatency_sTimebaseInfo
                  / dword_267F28C5C)
         / 1000000000.0
         - v3;
  }
  else
  {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
    return 0.0;
  }
}

- (NSSet)sources
{
  uint64_t v2 = (void *)-[GCGearShifterElement _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (id)deltaDidChangeHandler
{
  if (self->_isPatternShifter)
  {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
    uint64_t v2 = 0;
  }
  else
  {
    uint64_t v2 = (void *)-[GCGearShifterElement _deltaDidChangeHandler]((uint64_t)self);
  }

  return v2;
}

- (void)setDeltaDidChangeHandler:(id)a3
{
  if (self->_isPatternShifter) {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  }
  else {
    -[GCGearShifterElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)a3);
  }
}

- (float)delta
{
  if (!self->_isPatternShifter) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionMaxSlot));
  }
  [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  return 0.0;
}

- (BOOL)isAnalog
{
  if (self->_isPatternShifter) {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  }
  return 0;
}

- (double)lastDeltaTimestamp
{
  if (!self->_isPatternShifter) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot));
  }
  [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
  return 0.0;
}

- (double)lastDeltaLatency
{
  if (self->_isPatternShifter)
  {
    [(GCGearShifterElement *)self doesNotRecognizeSelector:a2];
    return 0.0;
  }
  else
  {
    if (!dword_267F28C64) {
      mach_timebase_info((mach_timebase_info_t)&lastDeltaLatency_sTimebaseInfo);
    }
    double v4 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot));
    return (double)(mach_absolute_time() * lastDeltaLatency_sTimebaseInfo / dword_267F28C64)
         / 1000000000.0
         - v4;
  }
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  v17.receiver = self;
  v17.super_class = (Class)GCGearShifterElement;
  BOOL v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v17, sel_update_forGamepadEvent_withTimestamp_);
  unsigned int v10 = MyUpdateContext_Offset;
  if (MyUpdateContext_Offset == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset = v10;
  }
  if (self->_isPatternShifter)
  {
    uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionFieldSlot);
    if (v11 != -1)
    {
      uint64_t v12 = v11;
      uint64_t v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_impl.pattern.positionSlot);
      [a4 floatValueForElement:v12];
      uint64_t v15 = (uint64_t)rintf(v14);
      if (v13 != v15)
      {
        -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v15, (uint64_t)&self->_impl.pattern.positionSlot);
        -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_impl.pattern.timestampSlot);
        *(_WORD *)((char *)a3 + v10) |= 0x180u;
        return 1;
      }
    }
  }
  return v9;
}

@end