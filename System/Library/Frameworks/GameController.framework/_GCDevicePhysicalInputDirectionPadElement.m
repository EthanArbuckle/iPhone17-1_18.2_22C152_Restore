@interface _GCDevicePhysicalInputDirectionPadElement
+ (unsigned)updateContextSize;
- (BOOL)isEqualToElement:(id)a3;
- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5;
- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5;
- (GCAxis2DInput)xyAxes;
- (GCAxisInput)xAxis;
- (GCAxisInput)yAxis;
- (GCLinearInput)down;
- (GCLinearInput)left;
- (GCLinearInput)right;
- (GCLinearInput)up;
- (NSString)description;
- (_GCDevicePhysicalInputDirectionPadElement)initWithParameters:(id)a3;
- (_GCDevicePhysicalInputDirectionPadElement)initWithTemplate:(id)a3 context:(id)a4;
- (uint64_t)_down;
- (uint64_t)_downValueField;
- (uint64_t)_left;
- (uint64_t)_leftValueField;
- (uint64_t)_right;
- (uint64_t)_rightValueField;
- (uint64_t)_setDownValueField:(uint64_t)result;
- (uint64_t)_setLeftValueField:(uint64_t)result;
- (uint64_t)_setRightValueField:(uint64_t)result;
- (uint64_t)_setUpValueField:(uint64_t)result;
- (uint64_t)_up;
- (uint64_t)_upValueField;
- (uint64_t)_x;
- (uint64_t)_xy;
- (uint64_t)_y;
- (void)postCommit:(const void *)a3 sender:(id)a4;
- (void)preCommit:(const void *)a3 sender:(id)a4;
@end

@implementation _GCDevicePhysicalInputDirectionPadElement

- (_GCDevicePhysicalInputDirectionPadElement)initWithParameters:(id)a3
{
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  v5 = [(_GCDevicePhysicalInputElement *)&v35 initWithParameters:v4];
  v6 = v5;
  if (v4)
  {
    uint64_t v7 = v4[13];
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v7 = 0;
  if (v5) {
LABEL_3:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v5, v7, (uint64_t)&v5->_upValueFieldSlot);
LABEL_4:
  if (v4)
  {
    uint64_t v8 = v4[14];
    if (!v6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  if (v6) {
LABEL_6:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v8, (uint64_t)&v6->_downValueFieldSlot);
LABEL_7:
  if (v4)
  {
    uint64_t v9 = v4[15];
    if (!v6) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t v9 = 0;
  if (v6) {
LABEL_9:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v9, (uint64_t)&v6->_leftValueFieldSlot);
LABEL_10:
  if (v4)
  {
    uint64_t v10 = v4[16];
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  uint64_t v10 = 0;
  if (v6) {
LABEL_12:
  }
    -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)v6, v10, (uint64_t)&v6->_rightValueFieldSlot);
LABEL_13:
  uint64_t v11 = objc_opt_new();
  v12 = (void *)v11;
  if (v4) {
    char v13 = *((unsigned char *)v4 + 40) != 0;
  }
  else {
    char v13 = 0;
  }
  -[_GCDevicePhysicalInputAxis2DInputParameters setAnalog:](v11, v13);
  -[_GCDevicePhysicalInputAxis2DInputParameters setCanWrap:]((uint64_t)v12, 0);
  uint64_t v14 = objc_opt_new();
  v15 = (void *)v14;
  if (v4) {
    char v16 = *((unsigned char *)v4 + 40) != 0;
  }
  else {
    char v16 = 0;
  }
  -[_GCDevicePhysicalInputAxisInputParameters setAnalog:](v14, v16);
  -[_GCDevicePhysicalInputAxisInputParameters setCanWrap:]((uint64_t)v15, 0);
  uint64_t v17 = objc_opt_new();
  v18 = (void *)v17;
  if (v4) {
    char v19 = *((unsigned char *)v4 + 40) != 0;
  }
  else {
    char v19 = 0;
  }
  -[_GCDevicePhysicalInputButtonInputParameters setAnalog:](v17, v19);
  -[_GCDevicePhysicalInputButtonInputParameters setPressedThreshold:]((uint64_t)v18, 0.0);
  -[_GCDevicePhysicalInputDirectionPadElementParameters xySources](v4);
  v20 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputAxis2DInputParameters setSources:](v12, v20);

  v34 = [[_GCDevicePhysicalInputAxis2DInput alloc] initWithParameters:v12];
  v6->_xyAxesSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v34];
  -[_GCDevicePhysicalInputDirectionPadElementParameters xSources](v4);
  v21 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputAxisInputParameters setSources:](v15, v21);

  v33 = [[_GCDevicePhysicalInputAxisInput alloc] initWithParameters:v15];
  v6->_xAxisSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v33];
  -[_GCDevicePhysicalInputDirectionPadElementParameters ySources](v4);
  v22 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputAxisInputParameters setSources:](v15, v22);

  v32 = [[_GCDevicePhysicalInputAxisInput alloc] initWithParameters:v15];
  v6->_yAxisSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v32];
  -[_GCDevicePhysicalInputDirectionPadElementParameters upSources](v4);
  v23 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v23);

  v24 = [[_GCDevicePhysicalInputButtonInput alloc] initWithParameters:v18];
  v6->_upInputSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v24];
  -[_GCDevicePhysicalInputDirectionPadElementParameters downSources](v4);
  v25 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v25);

  v26 = [[_GCDevicePhysicalInputButtonInput alloc] initWithParameters:v18];
  v6->_downInputSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v26];
  -[_GCDevicePhysicalInputDirectionPadElementParameters leftSources](v4);
  v27 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v27);

  v28 = [[_GCDevicePhysicalInputButtonInput alloc] initWithParameters:v18];
  v6->_leftInputSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v28];
  -[_GCDevicePhysicalInputDirectionPadElementParameters rightSources](v4);
  v29 = (char *)objc_claimAutoreleasedReturnValue();
  -[_GCDevicePhysicalInputButtonInputParameters setSources:](v18, v29);

  v30 = [[_GCDevicePhysicalInputButtonInput alloc] initWithParameters:v18];
  v6->_rightInputSlot = [(_GCDevicePhysicalInputView *)v6 view:v6 makeReferenceToView:v30];

  return v6;
}

- (uint64_t)_setUpValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 56);
  }
  return result;
}

- (uint64_t)_setDownValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 64);
  }
  return result;
}

- (uint64_t)_setLeftValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 72);
  }
  return result;
}

- (uint64_t)_setRightValueField:(uint64_t)result
{
  if (result) {
    return -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:](result, a2, result + 80);
  }
  return result;
}

- (_GCDevicePhysicalInputDirectionPadElement)initWithTemplate:(id)a3 context:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  id v5 = a4;
  v6 = a3;
  uint64_t v7 = [(_GCDevicePhysicalInputElement *)&v17 initWithTemplate:v6 context:v5];
  v7->_upValueFieldSlot = objc_msgSend(v5, "view:allocatePrimitiveSlot:withCopyOfValueFromView:slot:", v7, 1, v6, v6[7], v17.receiver, v17.super_class);
  v7->_downValueFieldSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[8]];
  v7->_leftValueFieldSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[9]];
  v7->_rightValueFieldSlot = [v5 view:v7 allocatePrimitiveSlot:1 withCopyOfValueFromView:v6 slot:v6[10]];
  uint64_t v8 = [v6 xyAxes];
  v7->_xyAxesSlot = [v5 view:v7 makeReferenceToView:v8];

  uint64_t v9 = [v6 xAxis];
  v7->_xAxisSlot = [v5 view:v7 makeReferenceToView:v9];

  uint64_t v10 = [v6 yAxis];
  v7->_yAxisSlot = [v5 view:v7 makeReferenceToView:v10];

  uint64_t v11 = [v6 up];
  v7->_upInputSlot = [v5 view:v7 makeReferenceToView:v11];

  v12 = [v6 down];
  v7->_downInputSlot = [v5 view:v7 makeReferenceToView:v12];

  char v13 = [v6 left];
  v7->_leftInputSlot = [v5 view:v7 makeReferenceToView:v13];

  uint64_t v14 = [v6 right];

  uint64_t v15 = [v5 view:v7 makeReferenceToView:v14];
  v7->_rightInputSlot = v15;

  return v7;
}

+ (unsigned)updateContextSize
{
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____GCDevicePhysicalInputDirectionPadElement;
  unsigned int v2 = objc_msgSendSuper2(&v10, sel_updateContextSize);
  unsigned int v3 = v2
     + +[_GCDevicePhysicalInputAxis2DInput updateContextSize];
  int v4 = +[_GCDevicePhysicalInputAxisInput updateContextSize];
  unsigned int v5 = v3
     + v4
     + +[_GCDevicePhysicalInputAxisInput updateContextSize];
  int v6 = +[_GCDevicePhysicalInputButtonInput updateContextSize];
  int v7 = v6
     + +[_GCDevicePhysicalInputButtonInput updateContextSize];
  unsigned int v8 = v5
     + v7
     + +[_GCDevicePhysicalInputButtonInput updateContextSize];
  return v8
       + +[_GCDevicePhysicalInputButtonInput updateContextSize]+ 2;
}

- (BOOL)update:(void *)a3 forUsages:(unint64_t)a4 with:(id)a5
{
  v68.receiver = self;
  v68.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputElement update:forUsages:with:](&v68, sel_update_forUsages_with_);
  unsigned int v10 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v10;
  }
  uint64_t v11 = v10;
  if ((a4 & 2) != 0)
  {
    if (a5)
    {
      uint64_t v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 56);
      if (self)
      {
LABEL_6:
        __int16 v13 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v12, (uint64_t)&self->_upValueFieldSlot);
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v12 = 0;
      if (self) {
        goto LABEL_6;
      }
    }
    __int16 v13 = 0;
LABEL_7:
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFE | v13;
    if (a5)
    {
      uint64_t v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 64);
      if (self) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v14 = 0;
      if (self)
      {
LABEL_9:
        int v15 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v14, (uint64_t)&self->_downValueFieldSlot);
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
          uint64_t v17 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 72);
          if (self) {
            goto LABEL_14;
          }
        }
        else
        {
          uint64_t v17 = 0;
          if (self)
          {
LABEL_14:
            int v18 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v17, (uint64_t)&self->_leftValueFieldSlot);
            if (v18) {
              __int16 v19 = 4;
            }
            else {
              __int16 v19 = 0;
            }
LABEL_17:
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFFB | v19;
            if (a5) {
              uint64_t v20 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a5, (uint64_t)a5 + 80);
            }
            else {
              uint64_t v20 = 0;
            }
            char v21 = v15 | v18;
            if (self)
            {
              int v22 = -[_GCDevicePhysicalInputView _testAndSetPrimitiveValue:forSlot:]((uint64_t)self, v20, (uint64_t)&self->_rightValueFieldSlot);
              if (v22) {
                __int16 v23 = 8;
              }
              else {
                __int16 v23 = 0;
              }
            }
            else
            {
              LOBYTE(v22) = 0;
              __int16 v23 = 0;
            }
            *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFF7 | v23;
            v9 |= v13 | v22 | v21;
            goto LABEL_24;
          }
        }
        LOBYTE(v18) = 0;
        __int16 v19 = 0;
        goto LABEL_17;
      }
    }
    LOBYTE(v15) = 0;
    __int16 v16 = 0;
    goto LABEL_12;
  }
LABEL_24:
  v24 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
  if ((xyAxesUpdateContext_Offset & 1) == 0) {
    xyAxesUpdateContext_Offset = 1;
  }
  unsigned int v25 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v25 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v25;
    uint64_t v26 = 0xFFFFFFFFLL;
    if (xyAxesUpdateContext_Offset) {
      uint64_t v26 = 2;
    }
  }
  else
  {
    uint64_t v26 = 2;
  }
  v27 = (char *)a3 + v25 + v26;
  v28 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)a5);
  int v66 = [v24 update:v27 forUsages:a4 with:v28];
  if (v66) {
    __int16 v29 = 16;
  }
  else {
    __int16 v29 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFEF | v29;

  v30 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
  uint64_t updated = xAxisUpdateContext((uint64_t)a3);
  v32 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)a5);
  int v33 = [v30 update:updated forUsages:a4 with:v32];
  if (v33) {
    __int16 v34 = 32;
  }
  else {
    __int16 v34 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFDF | v34;
  char v35 = v9 | v33;

  v36 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
  uint64_t v37 = yAxisUpdateContext((uint64_t)a3);
  v38 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)a5);
  unint64_t v39 = a4;
  int v40 = [v36 update:v37 forUsages:a4 with:v38];
  if (v40) {
    __int16 v41 = 64;
  }
  else {
    __int16 v41 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFBF | v41;
  char v42 = v35 | v40;

  v43 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  uint64_t v44 = upButtonUpdateContext((uint64_t)a3);
  v45 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)a5);
  int v46 = [v43 update:v44 forUsages:v39 with:v45];
  if (v46) {
    __int16 v47 = 128;
  }
  else {
    __int16 v47 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFF7F | v47;
  char v67 = v42 | v46 | v66;

  v48 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
  uint64_t v49 = downButtonUpdateContext((uint64_t)a3);
  v50 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)a5);
  int v51 = [v48 update:v49 forUsages:v39 with:v50];
  if (v51) {
    __int16 v52 = 256;
  }
  else {
    __int16 v52 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFEFF | v52;

  v53 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
  uint64_t v54 = leftButtonUpdateContext((uint64_t)a3);
  v55 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)a5);
  int v56 = [v53 update:v54 forUsages:v39 with:v55];
  if (v56) {
    __int16 v57 = 512;
  }
  else {
    __int16 v57 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFDFF | v57;
  char v58 = v51 | v56;

  v59 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
  uint64_t v60 = rightButtonUpdateContext((uint64_t)a3);
  v61 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)a5);
  int v62 = [v59 update:v60 forUsages:v39 with:v61];
  if (v62) {
    __int16 v63 = 1024;
  }
  else {
    __int16 v63 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFBFF | v63;
  char v64 = v67 | v58 | v62;

  return v64 & 1;
}

- (uint64_t)_upValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 56);
  }
  return result;
}

- (uint64_t)_downValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 64);
  }
  return result;
}

- (uint64_t)_leftValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 72);
  }
  return result;
}

- (uint64_t)_rightValueField
{
  if (result) {
    return -[_GCDevicePhysicalInputView _primitiveValueForSlot:](result, result + 80);
  }
  return result;
}

- (uint64_t)_xy
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 88];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_x
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 96];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_y
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 104];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_up
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 112];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_down
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 120];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_left
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 128];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (uint64_t)_right
{
  if (result)
  {
    [(id)-[_GCDevicePhysicalInputView dataSource](result) view:result viewForSlot:result + 136];
    return objc_claimAutoreleasedReturnValue();
  }
  return result;
}

- (void)preCommit:(const void *)a3 sender:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  [(_GCDevicePhysicalInputElement *)&v18 preCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v6;
  }
  __int16 v7 = *(_WORD *)((char *)a3 + v6);
  uint64_t v8 = v6;
  if ((v7 & 0x10) != 0)
  {
    unsigned int v10 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
    if ((xyAxesUpdateContext_Offset & 1) == 0) {
      xyAxesUpdateContext_Offset = 1;
    }
    unsigned int v11 = MyUpdateContext_Offset_8;
    if (MyUpdateContext_Offset_8 == -1)
    {
      unsigned int v11 = +[_GCDevicePhysicalInputElement updateContextSize];
      MyUpdateContext_Offset_8 = v11;
      uint64_t v12 = 0xFFFFFFFFLL;
      if (xyAxesUpdateContext_Offset) {
        uint64_t v12 = 2;
      }
    }
    else
    {
      uint64_t v12 = 2;
    }
    [v10 preCommit:(char *)a3 + v11 + v12 sender:self];

    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x20) == 0)
    {
LABEL_5:
      if ((v7 & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  __int16 v13 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
  [v13 preCommit:xAxisUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_6:
    if ((v7 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v14 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
  [v14 preCommit:yAxisUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_7:
    if ((v7 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  int v15 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  [v15 preCommit:upButtonUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_8:
    if ((v7 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  __int16 v16 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
  [v16 preCommit:downButtonUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x200) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_21:
  uint64_t v17 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
  [v17 preCommit:leftButtonUpdateContext((uint64_t)a3) sender:self];

  if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x400) != 0)
  {
LABEL_10:
    unsigned __int8 v9 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
    [v9 preCommit:rightButtonUpdateContext((uint64_t)a3) sender:self];
  }
}

- (void)postCommit:(const void *)a3 sender:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  [(_GCDevicePhysicalInputElement *)&v18 postCommit:a3 sender:a4];
  unsigned int v6 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v6 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v6;
  }
  __int16 v7 = *(_WORD *)((char *)a3 + v6);
  uint64_t v8 = v6;
  if ((v7 & 0x10) != 0)
  {
    unsigned int v10 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
    if ((xyAxesUpdateContext_Offset & 1) == 0) {
      xyAxesUpdateContext_Offset = 1;
    }
    unsigned int v11 = MyUpdateContext_Offset_8;
    if (MyUpdateContext_Offset_8 == -1)
    {
      unsigned int v11 = +[_GCDevicePhysicalInputElement updateContextSize];
      MyUpdateContext_Offset_8 = v11;
      uint64_t v12 = 0xFFFFFFFFLL;
      if (xyAxesUpdateContext_Offset) {
        uint64_t v12 = 2;
      }
    }
    else
    {
      uint64_t v12 = 2;
    }
    [v10 postCommit:(char *)a3 + v11 + v12 sender:self];

    __int16 v7 = *(_WORD *)((char *)a3 + v8);
    if ((v7 & 0x20) == 0)
    {
LABEL_5:
      if ((v7 & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_18;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_5;
  }
  __int16 v13 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
  [v13 postCommit:xAxisUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x40) == 0)
  {
LABEL_6:
    if ((v7 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v14 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
  [v14 postCommit:yAxisUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x80) == 0)
  {
LABEL_7:
    if ((v7 & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  int v15 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  [v15 postCommit:upButtonUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x100) == 0)
  {
LABEL_8:
    if ((v7 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  __int16 v16 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
  [v16 postCommit:downButtonUpdateContext((uint64_t)a3) sender:self];

  __int16 v7 = *(_WORD *)((char *)a3 + v8);
  if ((v7 & 0x200) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0) {
      return;
    }
    goto LABEL_10;
  }
LABEL_21:
  uint64_t v17 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
  [v17 postCommit:leftButtonUpdateContext((uint64_t)a3) sender:self];

  if ((*(_WORD *)((unsigned char *)a3 + v8) & 0x400) != 0)
  {
LABEL_10:
    unsigned __int8 v9 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
    [v9 postCommit:rightButtonUpdateContext((uint64_t)a3) sender:self];
  }
}

- (BOOL)isEqualToElement:(id)a3
{
  v32.receiver = self;
  v32.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  if (!-[_GCDevicePhysicalInputElement isEqualToElement:](&v32, sel_isEqualToElement_)) {
    return 0;
  }
  if (self)
  {
    uint64_t v5 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_upValueFieldSlot);
    if (a3)
    {
LABEL_4:
      uint64_t v6 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 56);
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
  if (self)
  {
    uint64_t v7 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_downValueFieldSlot);
    if (a3)
    {
LABEL_8:
      uint64_t v8 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 64);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (a3) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  if (v7 != v8) {
    return 0;
  }
  if (self)
  {
    uint64_t v9 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_leftValueFieldSlot);
    if (a3)
    {
LABEL_12:
      uint64_t v10 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 72);
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (a3) {
      goto LABEL_12;
    }
  }
  uint64_t v10 = 0;
LABEL_13:
  if (v9 != v10) {
    return 0;
  }
  if (self)
  {
    uint64_t v11 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rightValueFieldSlot);
    if (a3)
    {
LABEL_16:
      uint64_t v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)a3, (uint64_t)a3 + 80);
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if (a3) {
      goto LABEL_16;
    }
  }
  uint64_t v12 = 0;
LABEL_17:
  if (v11 != v12) {
    return 0;
  }
  __int16 v13 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
  uint64_t v14 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)a3);
  if (-[_GCDevicePhysicalInputAxis2DInput isEqualToInput:]((uint64_t)v13, v14))
  {
    int v15 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
    __int16 v16 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)a3);
    if (-[_GCDevicePhysicalInputAxisInput isEqualToInput:]((uint64_t)v15, v16))
    {
      uint64_t v17 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
      objc_super v18 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)a3);
      if (-[_GCDevicePhysicalInputAxisInput isEqualToInput:]((uint64_t)v17, v18))
      {
        __int16 v19 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
        uint64_t v20 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)a3);
        if (-[_GCDevicePhysicalInputButtonInput isEqualToInput:]((BOOL)v19, v20))
        {
          __int16 v29 = v19;
          uint64_t v30 = -[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
          v31 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)a3);
          if (-[_GCDevicePhysicalInputButtonInput isEqualToInput:](v30, v31))
          {
            uint64_t v21 = -[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
            v27 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)a3);
            v28 = (void *)v21;
            if (-[_GCDevicePhysicalInputButtonInput isEqualToInput:](v21, v27))
            {
              int v22 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
              __int16 v23 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)a3);
              BOOL v24 = -[_GCDevicePhysicalInputButtonInput isEqualToInput:]((BOOL)v22, v23);
            }
            else
            {
              BOOL v24 = 0;
            }
            __int16 v19 = v29;
            uint64_t v26 = (void *)v30;
          }
          else
          {
            BOOL v24 = 0;
            uint64_t v26 = (void *)v30;
          }
        }
        else
        {
          BOOL v24 = 0;
        }
      }
      else
      {
        BOOL v24 = 0;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (NSString)description
{
  unsigned int v3 = [(_GCDevicePhysicalInputElement *)self identifier];
  int v4 = [(_GCDevicePhysicalInputDirectionPadElement *)self up];
  [v4 value];
  double v6 = v5;
  uint64_t v7 = [(_GCDevicePhysicalInputDirectionPadElement *)self down];
  [v7 value];
  double v9 = v8;
  uint64_t v10 = [(_GCDevicePhysicalInputDirectionPadElement *)self left];
  [v10 value];
  double v12 = v11;
  __int16 v13 = [(_GCDevicePhysicalInputDirectionPadElement *)self right];
  [v13 value];
  +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", @"<Direction Pad '%@'; up = %f, down = %f, left = %f, right = %f>",
    v3,
    *(void *)&v6,
    *(void *)&v9,
    *(void *)&v12,
  int v15 = v14);

  return (NSString *)v15;
}

- (GCAxis2DInput)xyAxes
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);

  return (GCAxis2DInput *)v2;
}

- (GCAxisInput)xAxis
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);

  return (GCAxisInput *)v2;
}

- (GCAxisInput)yAxis
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);

  return (GCAxisInput *)v2;
}

- (GCLinearInput)up
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);

  return (GCLinearInput *)v2;
}

- (GCLinearInput)down
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);

  return (GCLinearInput *)v2;
}

- (GCLinearInput)left
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);

  return (GCLinearInput *)v2;
}

- (GCLinearInput)right
{
  unsigned int v2 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);

  return (GCLinearInput *)v2;
}

- (BOOL)update:(void *)a3 forGamepadEvent:(id)a4 withTimestamp:(double)a5
{
  v80.receiver = self;
  v80.super_class = (Class)_GCDevicePhysicalInputDirectionPadElement;
  unsigned __int8 v9 = -[_GCDevicePhysicalInputElement update:forGamepadEvent:withTimestamp:](&v80, sel_update_forGamepadEvent_withTimestamp_);
  unsigned int v10 = MyUpdateContext_Offset_8;
  if (MyUpdateContext_Offset_8 == -1)
  {
    unsigned int v10 = +[_GCDevicePhysicalInputElement updateContextSize];
    MyUpdateContext_Offset_8 = v10;
  }
  uint64_t v11 = v10;
  if (self)
  {
    uint64_t v12 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_upValueFieldSlot);
    uint64_t v13 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_downValueFieldSlot);
    uint64_t v14 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_leftValueFieldSlot);
    uint64_t v15 = -[_GCDevicePhysicalInputView _primitiveValueForSlot:]((uint64_t)self, (uint64_t)&self->_rightValueFieldSlot);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  BOOL v16 = v12 == -1 || v13 == -1;
  int v17 = !v16;
  uint64_t v79 = v15;
  if (!v16 && v14 != -1 && v15 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:");
    float v19 = v18;
    [a4 floatValueForElement:v14];
    float v21 = v20;
    [a4 floatValueForElement:v12];
    float v23 = v22;
    uint64_t v78 = v13;
    [a4 floatValueForElement:v13];
    float v25 = v24;
    uint64_t v26 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _xy]((uint64_t)self);
    if ((xyAxesUpdateContext_Offset & 1) == 0) {
      xyAxesUpdateContext_Offset = 1;
    }
    float v27 = v19 - v21;
    unsigned int v28 = MyUpdateContext_Offset_8;
    if (MyUpdateContext_Offset_8 == -1)
    {
      unsigned int v28 = +[_GCDevicePhysicalInputElement updateContextSize];
      MyUpdateContext_Offset_8 = v28;
      uint64_t v29 = 0xFFFFFFFFLL;
      if (xyAxesUpdateContext_Offset) {
        uint64_t v29 = 2;
      }
    }
    else
    {
      uint64_t v29 = 2;
    }
    int v30 = [(_GCDevicePhysicalInputAxis2DInput *)(uint64_t)v26 update:v27 withValue:v23 - v25 timestamp:a5];
    if (v30) {
      __int16 v31 = 16;
    }
    else {
      __int16 v31 = 0;
    }
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFEF | v31;
    v9 |= v30;

    uint64_t v15 = v79;
    uint64_t v13 = v78;
  }
  if (v14 != -1 && v15 != -1)
  {
    objc_msgSend(a4, "floatValueForElement:");
    float v33 = v32;
    [a4 floatValueForElement:v14];
    float v35 = v33 - v34;
    uint64_t v36 = v14;
    uint64_t v37 = v12;
    uint64_t v38 = v13;
    unint64_t v39 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _x]((uint64_t)self);
    uint64_t updated = xAxisUpdateContext((uint64_t)a3);
    int v41 = -[_GCDevicePhysicalInputAxisInput update:withValue:timestamp:]((uint64_t)v39, updated, v35, a5);
    if (v41) {
      __int16 v42 = 32;
    }
    else {
      __int16 v42 = 0;
    }
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFDF | v42;
    v9 |= v41;

    uint64_t v13 = v38;
    uint64_t v12 = v37;
    uint64_t v14 = v36;
  }
  if (v17)
  {
    [a4 floatValueForElement:v12];
    float v44 = v43;
    [a4 floatValueForElement:v13];
    float v46 = v44 - v45;
    uint64_t v47 = v13;
    v48 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _y]((uint64_t)self);
    uint64_t v49 = yAxisUpdateContext((uint64_t)a3);
    int v50 = -[_GCDevicePhysicalInputAxisInput update:withValue:timestamp:]((uint64_t)v48, v49, v46, a5);
    if (v50) {
      __int16 v51 = 64;
    }
    else {
      __int16 v51 = 0;
    }
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFFBF | v51;
    v9 |= v50;

    uint64_t v13 = v47;
    uint64_t v52 = v79;
  }
  else
  {
    uint64_t v52 = v79;
    if (v12 == -1) {
      goto LABEL_38;
    }
  }
  [a4 floatValueForElement:v12];
  float v54 = v53;
  v55 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _up]((uint64_t)self);
  uint64_t v56 = upButtonUpdateContext((uint64_t)a3);
  int v57 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v55, v56, v54, a5);
  if (v57) {
    __int16 v58 = 128;
  }
  else {
    __int16 v58 = 0;
  }
  *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFF7F | v58;
  v9 |= v57;

LABEL_38:
  if (v13 != -1)
  {
    [a4 floatValueForElement:v13];
    float v60 = v59;
    v61 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _down]((uint64_t)self);
    uint64_t v62 = downButtonUpdateContext((uint64_t)a3);
    int v63 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v61, v62, v60, a5);
    if (v63) {
      __int16 v64 = 256;
    }
    else {
      __int16 v64 = 0;
    }
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFEFF | v64;
    v9 |= v63;
  }
  if (v14 != -1)
  {
    [a4 floatValueForElement:v14];
    float v66 = v65;
    char v67 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _left]((uint64_t)self);
    uint64_t v68 = leftButtonUpdateContext((uint64_t)a3);
    int v69 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v67, v68, v66, a5);
    if (v69) {
      __int16 v70 = 512;
    }
    else {
      __int16 v70 = 0;
    }
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFDFF | v70;
    v9 |= v69;
  }
  if (v52 != -1)
  {
    [a4 floatValueForElement:v52];
    float v72 = v71;
    v73 = (void *)-[_GCDevicePhysicalInputDirectionPadElement _right]((uint64_t)self);
    uint64_t v74 = rightButtonUpdateContext((uint64_t)a3);
    int v75 = -[_GCDevicePhysicalInputButtonInput update:withValue:timestamp:]((uint64_t)v73, v74, v72, a5);
    if (v75) {
      __int16 v76 = 1024;
    }
    else {
      __int16 v76 = 0;
    }
    *(_WORD *)((char *)a3 + v11) = *(_WORD *)((unsigned char *)a3 + v11) & 0xFBFF | v76;
    v9 |= v75;
  }
  return v9;
}

@end