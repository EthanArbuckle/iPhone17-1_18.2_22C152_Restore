@interface GCSteeringWheelElement
+ (unsigned)updateContextSize;
- (BOOL)canWrap;
- (BOOL)isAnalog;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (GCSteeringWheelElement)initWithParameters:(id)a3;
- (GCSteeringWheelElement)initWithTemplate:(id)a3 context:(id)a4;
- (NSSet)sources;
- (NSString)debugDescription;
- (NSString)description;
- (__n64)_delta;
- (__n64)_maximumDegreesOfRotation;
- (__n64)_value;
- (double)_lastTimestamp;
- (double)lastDeltaTimestamp;
- (double)lastValueLatency;
- (double)lastValueTimestamp;
- (float)delta;
- (float)maximumDegreesOfRotation;
- (float)value;
- (id)deltaDidChangeHandler;
- (id)valueDidChangeHandler;
- (uint64_t)_deltaDidChangeHandler;
- (uint64_t)_rotationValueField;
- (uint64_t)_setDelta:(uint64_t)result;
- (uint64_t)_setDeltaDidChangeHandler:(uint64_t)result;
- (uint64_t)_setLastTimestamp:(uint64_t)result;
- (uint64_t)_setMaximumDegreesOfRotation:(uint64_t)result;
- (uint64_t)_setRotationValueField:(uint64_t)result;
- (uint64_t)_setSources:(uint64_t)result;
- (uint64_t)_setValue:(uint64_t)result;
- (uint64_t)_setValueDidChangeHandler:(uint64_t)result;
- (uint64_t)_sources;
- (uint64_t)_valueDidChangeHandler;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
- (void)setDeltaDidChangeHandler:(id)a3;
- (void)setValueDidChangeHandler:(id)a3;
@end

@implementation GCSteeringWheelElement

- (GCSteeringWheelElement)initWithParameters:(id)a3
{
  v4 = (float *)a3;
  v10.receiver = self;
  v10.super_class = (Class)GCSteeringWheelElement;
  v5 = [(_GCDevicePhysicalInputElement *)&v10 initWithParameters:v4];
  v6 = -[_GCSteeringWheelElementParameters sources](v4);
  -[GCSteeringWheelElement _setSources:]((uint64_t)v5, (uint64_t)v6);

  if (v4)
  {
    double v7 = v4[10];
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v7 = 0.0;
  if (v5) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, *(uint64_t *)&v7, (uint64_t)&v5->_maximumDegreesOfRotationSlot);
LABEL_4:
  if (!v4)
  {
    uint64_t v8 = 0;
    if (!v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v8 = *((void *)v4 + 7);
  if (v5) {
LABEL_6:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v8, (uint64_t)&v5->_rotationValueFieldSlot);
LABEL_7:

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
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setSources_, v3, @"GCSteeringWheelElement.m", 217, @"Invalid parameter not satisfying: %s", "newValue != nil");
    }
    return -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v3, a2, v3 + 56, 771);
  }
  return result;
}

- (uint64_t)_setMaximumDegreesOfRotation:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 64);
  }
  return result;
}

- (uint64_t)_setRotationValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  }
  return result;
}

- (GCSteeringWheelElement)initWithTemplate:(id)a3 context:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)GCSteeringWheelElement;
  id v5 = a4;
  v6 = a3;
  double v7 = [(_GCDevicePhysicalInputElement *)&v10 initWithTemplate:v6 context:v5];
  v7->_sourcesSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v10.receiver, v10.super_class);
  v7->_maximumDegreesOfRotationSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[8]];
  v7->_rotationValueFieldSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[9]];
  v7->_valueChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[10]];
  v7->_deltaChangedHandlerSlot = [v5 view:v7 allocateObjectSlot:2 withCopyOfValueFromView:v6 slot:v6[11]];
  v7->_valueSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[12]];
  v7->_deltaSlot = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[13]];
  uint64_t v8 = [v5 view:v7 allocatePrimitiveSlot:3 withCopyOfValueFromView:v6 slot:v6[14]];

  v7->_timestampSlot = v8;
  return v7;
}

+ (unsigned)updateContextSize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___GCSteeringWheelElement;
  return (unsigned __int16)objc_msgSendSuper2(&v3, sel_updateContextSize) + 1;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  char v6 = a4;
  v39.receiver = self;
  v39.super_class = (Class)GCSteeringWheelElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v39, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_6 = v10;
  }
  uint64_t v11 = v10;
  if ((v6 & 2) == 0)
  {
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  v12 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)a5);
  char v13 = -[GCSteeringWheelElement _setSources:]((uint64_t)self, (uint64_t)v12);
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFE | v13;

  if (a5)
  {
    float v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64));
    double v15 = v14;
    if (self) {
      goto LABEL_9;
    }
LABEL_44:
    LOBYTE(v16) = 0;
    char v17 = 0;
    goto LABEL_12;
  }
  double v15 = 0.0;
  if (!self) {
    goto LABEL_44;
  }
LABEL_9:
  int v16 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v15, (uint64_t)&self->_maximumDegreesOfRotationSlot);
  if (v16) {
    char v17 = 2;
  }
  else {
    char v17 = 0;
  }
LABEL_12:
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFD | v17;
  if (a5)
  {
    uint64_t v18 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
    if (self) {
      goto LABEL_14;
    }
LABEL_46:
    LOBYTE(v19) = 0;
    char v20 = 0;
    goto LABEL_17;
  }
  uint64_t v18 = 0;
  if (!self) {
    goto LABEL_46;
  }
LABEL_14:
  int v19 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v18, (uint64_t)&self->_rotationValueFieldSlot);
  if (v19) {
    char v20 = 4;
  }
  else {
    char v20 = 0;
  }
LABEL_17:
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xFB | v20;
  v9 |= v13 | v16 | v19;
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 8) == 0) {
      return v9;
    }
LABEL_25:
    if (a5)
    {
      float v27 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 96));
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
          char v30 = 32;
        }
        else {
          char v30 = 0;
        }
LABEL_30:
        *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xDF | v30;
        if (a5)
        {
          float v31 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 104));
          double v32 = v31;
          if (self) {
            goto LABEL_32;
          }
        }
        else
        {
          double v32 = 0.0;
          if (self)
          {
LABEL_32:
            int v33 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&v32, (uint64_t)&self->_deltaSlot);
            if (v33) {
              char v34 = 64;
            }
            else {
              char v34 = 0;
            }
LABEL_35:
            *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xBF | v34;
            if (a5) {
              uint64_t v35 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 112);
            }
            else {
              uint64_t v35 = 0;
            }
            if (self)
            {
              int v36 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v35, (uint64_t)&self->_timestampSlot);
              if (v36) {
                char v37 = 0x80;
              }
              else {
                char v37 = 0;
              }
            }
            else
            {
              LOBYTE(v36) = 0;
              char v37 = 0;
            }
            *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0x7F | v37;
            return v9 | v36 | v29 | v33;
          }
        }
        LOBYTE(v33) = 0;
        char v34 = 0;
        goto LABEL_35;
      }
    }
    LOBYTE(v29) = 0;
    char v30 = 0;
    goto LABEL_30;
  }
LABEL_18:
  v21 = (void *)-[GCSteeringWheelElement _valueDidChangeHandler]((uint64_t)a5);
  int v22 = -[GCSteeringWheelElement _setValueDidChangeHandler:]((uint64_t)self, (uint64_t)v21);
  if (v22) {
    char v23 = 8;
  }
  else {
    char v23 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xF7 | v23;

  v24 = (void *)-[GCSteeringWheelElement _deltaDidChangeHandler]((uint64_t)a5);
  int v25 = -[GCSteeringWheelElement _setDeltaDidChangeHandler:]((uint64_t)self, (uint64_t)v24);
  if (v25) {
    char v26 = 16;
  }
  else {
    char v26 = 0;
  }
  *((unsigned char *)a3 + v11) = *((unsigned char *)a3 + v11) & 0xEF | v26;
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
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 56);
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (__n64)_maximumDegreesOfRotation
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

- (uint64_t)_rotationValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72);
  }
  return result;
}

- (uint64_t)_valueDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 80);
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
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 80, 771);

    return v4;
  }
  return result;
}

- (uint64_t)_deltaDidChangeHandler
{
  if (result)
  {
    -[_GCDevicePhysicalInputView _objectValueForSlot:](result, result + 88);
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
    uint64_t v4 = -[_GCDevicePhysicalInputView _testAndSetObjectValue:forSlot:policy:](v2, (uint64_t)v3, v2 + 88, 771);

    return v4;
  }
  return result;
}

- (__n64)_value
{
  if (a1)
  {
    double v1 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 96));
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
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 96);
  }
  return result;
}

- (__n64)_delta
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

- (uint64_t)_setDelta:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, COERCE__INT64(a2), result + 104);
  }
  return result;
}

- (double)_lastTimestamp
{
  if (a1) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:](a1, a1 + 112));
  }
  else {
    return 0.0;
  }
}

- (uint64_t)_setLastTimestamp:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, *(uint64_t *)&a2, result + 112);
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GCSteeringWheelElement;
  [(_GCDevicePhysicalInputElement *)&v9 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_6 = v6;
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
      if ((v7 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"maximumDegreesOfRotation");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_14:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"deltaDidChangeHandler");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_8:
    if ((v7 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"value");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0) {
      return;
    }
LABEL_17:
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastDeltaTimestamp");
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastValueLatency");
    -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"lastDeltaLatency");
    return;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _willChangeValueForKey:](self, (const char *)@"delta");
  if ((*((unsigned char *)a3 + v8) & 0x80) != 0) {
    goto LABEL_17;
  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)GCSteeringWheelElement;
  [(_GCDevicePhysicalInputElement *)&v15 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_6 = v6;
  }
  char v7 = *((unsigned char *)a3 + v6);
  uint64_t v8 = v6;
  if (v7)
  {
    -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"sources");
    char v7 = *((unsigned char *)a3 + v8);
    if ((v7 & 2) == 0)
    {
LABEL_5:
      if ((v7 & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)a3 + v6) & 2) == 0)
  {
    goto LABEL_5;
  }
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"maximumDegreesOfRotation");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 8) == 0)
  {
LABEL_6:
    if ((v7 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"valueDidChangeHandler");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x10) == 0)
  {
LABEL_7:
    if ((v7 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"deltaDidChangeHandler");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_8:
    if ((v7 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"value");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_9:
    if ((v7 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"delta");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_10:
    if ((v7 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastDeltaTimestamp");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastValueLatency");
  -[_GCDevicePhysicalInputView _didChangeValueForKey:](self, (const char *)@"lastDeltaLatency");
  char v7 = *((unsigned char *)a3 + v8);
  if ((v7 & 0x20) == 0)
  {
LABEL_11:
    if ((v7 & 0x40) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_20:
  objc_super v9 = (void (**)(void, void, void, __n128))-[GCSteeringWheelElement _valueDidChangeHandler]((uint64_t)self);
  if (v9)
  {
    if (self)
    {
      double v11 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
      v10.n128_u32[1] = HIDWORD(v11);
      v10.n128_f32[0] = v11;
    }
    else
    {
      v10.n128_u64[0] = 0;
    }
    ((void (**)(void, GCSteeringWheelElement *, GCSteeringWheelElement *, __n128))v9)[2](v9, self, self, v10);
  }

  if ((*((unsigned char *)a3 + v8) & 0x40) != 0)
  {
LABEL_25:
    v12 = (void (**)(void, void, void, __n128))-[GCSteeringWheelElement _deltaDidChangeHandler]((uint64_t)self);
    if (v12)
    {
      if (self)
      {
        double v14 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_deltaSlot));
        v13.n128_u32[1] = HIDWORD(v14);
        v13.n128_f32[0] = v14;
      }
      else
      {
        v13.n128_u64[0] = 0;
      }
      ((void (**)(void, GCSteeringWheelElement *, GCSteeringWheelElement *, __n128))v12)[2](v12, self, self, v13);
    }
  }
}

- (BOOL)isEqualToElement:(id)a3
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GCSteeringWheelElement;
  if ([(_GCDevicePhysicalInputElement *)&v14 isEqualToElement:v6])
  {
    char v7 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)self);
    uint64_t v8 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)v6);
    if (v7 == v8
      || (objc_super v3 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)self),
          [v6 sources],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqual:v4]))
    {
      float v10 = 0.0;
      float v11 = 0.0;
      if (self) {
        float v11 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_maximumDegreesOfRotationSlot));
      }
      if (v6) {
        float v10 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 64));
      }
      if (v11 == v10)
      {
        if (self) {
          self = (GCSteeringWheelElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rotationValueFieldSlot);
        }
        if (v6) {
          v12 = (GCSteeringWheelElement *)-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)v6, (uint64_t)v6 + 72);
        }
        else {
          v12 = 0;
        }
        BOOL v9 = self == v12;
      }
      else
      {
        BOOL v9 = 0;
      }
      if (v7 == v8) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v9 = 0;
    }

LABEL_19:
    goto LABEL_20;
  }
  BOOL v9 = 0;
LABEL_20:

  return v9;
}

- (NSString)description
{
  objc_super v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  [(GCSteeringWheelElement *)self value];
  id v5 = +[NSString stringWithFormat:@"<Steering Wheel '%@' value = %f>", v3, v4];;

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  objc_super v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  float v4 = [(_GCDevicePhysicalInputElement *)self localizedName];
  id v5 = [(_GCDevicePhysicalInputElement *)self sfSymbolsName];
  if (self) {
    uint64_t v6 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rotationValueFieldSlot);
  }
  else {
    uint64_t v6 = 0;
  }
  [(GCSteeringWheelElement *)self value];
  double v8 = v7;
  [(GCSteeringWheelElement *)self delta];
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Steering Wheel %p '%@'; name = '%@', symbol = '%@', source = %zi, value = %f (%f)>",
    self,
    v3,
    v4,
    v5,
    v6,
    *(void *)&v8,
  float v10 = v9);

  return (NSString *)v10;
}

- (float)maximumDegreesOfRotation
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_maximumDegreesOfRotationSlot));
  }
  else {
    return 0.0;
  }
}

- (id)valueDidChangeHandler
{
  uint64_t v2 = (void *)-[GCSteeringWheelElement _valueDidChangeHandler]((uint64_t)self);

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
  return 1;
}

- (BOOL)canWrap
{
  return 0;
}

- (double)lastValueTimestamp
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  }
  else {
    return 0.0;
  }
}

- (double)lastValueLatency
{
  if (!dword_267F28E64) {
    mach_timebase_info((mach_timebase_info_t)&lastValueLatency_sTimebaseInfo_2);
  }
  if (self) {
    double v3 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  }
  else {
    double v3 = 0.0;
  }
  return (double)(mach_absolute_time() * lastValueLatency_sTimebaseInfo_2 / dword_267F28E64)
       / 1000000000.0
       - v3;
}

- (NSSet)sources
{
  uint64_t v2 = (void *)-[GCSteeringWheelElement _sources]((uint64_t)self);

  return (NSSet *)v2;
}

- (id)deltaDidChangeHandler
{
  uint64_t v2 = (void *)-[GCSteeringWheelElement _deltaDidChangeHandler]((uint64_t)self);

  return v2;
}

- (void)setDeltaDidChangeHandler:(id)a3
{
}

- (float)delta
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_deltaSlot));
  }
  else {
    return 0.0;
  }
}

- (double)lastDeltaTimestamp
{
  if (self) {
    return COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_timestampSlot));
  }
  else {
    return 0.0;
  }
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  v18.receiver = self;
  v18.super_class = (Class)GCSteeringWheelElement;
  BOOL v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v18, sel_update_forGamepadEvent_withTimestamp_);
  unsigned int v10 = MyUpdateContext_Offset_6;
  if (MyUpdateContext_Offset_6 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_6 = v10;
    if (self) {
      goto LABEL_3;
    }
LABEL_9:
    [a4 floatValueForElement:0];
    if (v17 == 0.0) {
      return v9;
    }
    goto LABEL_6;
  }
  if (!self) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rotationValueFieldSlot);
  if (v11 != -1)
  {
    uint64_t v12 = v11;
    float v13 = COERCE_DOUBLE(-[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_valueSlot));
    [a4 floatValueForElement:v12];
    if (v14 != v13)
    {
      float v15 = v14 - v13;
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v14), (uint64_t)&self->_valueSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, COERCE__INT64(v15), (uint64_t)&self->_deltaSlot);
      -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, *(uint64_t *)&a5, (uint64_t)&self->_timestampSlot);
LABEL_6:
      *((unsigned char *)a3 + v10) |= 0xE0u;
      return 1;
    }
  }
  return v9;
}

@end