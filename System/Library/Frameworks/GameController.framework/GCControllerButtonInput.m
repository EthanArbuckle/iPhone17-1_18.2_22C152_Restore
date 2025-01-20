@interface GCControllerButtonInput
- (BOOL)_setTouched:(BOOL)a3 queue:(id)a4;
- (BOOL)_setValue:(float)a3;
- (BOOL)_setValue:(float)a3 queue:(id)a4;
- (BOOL)areTouchedAndValueDistinct;
- (BOOL)isAnalog;
- (BOOL)isPressed;
- (BOOL)isTouched;
- (BOOL)nonAnalog;
- (GCControllerButtonInput)initWithDescriptionName:(id)a3;
- (GCControllerButtonTouchedChangedHandler)touchedChangedHandler;
- (GCControllerButtonValueChangedHandler)pressedChangedHandler;
- (GCControllerButtonValueChangedHandler)valueChangedHandler;
- (float)deadzone;
- (float)value;
- (id)debugDescription;
- (id)description;
- (int)getAndResetTimesPressed;
- (void)setDeadzone:(float)a3;
- (void)setNonAnalog:(BOOL)a3;
- (void)setPressedChangedHandler:(GCControllerButtonValueChangedHandler)pressedChangedHandler;
- (void)setTouchedAndValueDistinct:(BOOL)a3;
- (void)setTouchedChangedHandler:(GCControllerButtonTouchedChangedHandler)touchedChangedHandler;
- (void)setValue:(float)value;
- (void)setValueChangedHandler:(GCControllerButtonValueChangedHandler)valueChangedHandler;
@end

@implementation GCControllerButtonInput

- (GCControllerButtonInput)initWithDescriptionName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GCControllerButtonInput;
  v5 = [(GCControllerElement *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)[v4 copy];
      [(GCControllerElement *)v6 setPrimaryAlias:v7];
    }
    else
    {
      [(GCControllerElement *)v5 setPrimaryAlias:@"Button"];
    }
    v6->_pressCounter = 0;
  }

  return v6;
}

- (BOOL)isAnalog
{
  return !self->_nonAnalog;
}

- (BOOL)_setValue:(float)a3
{
  return -[GCControllerButtonInput _setValue:queue:](self, "_setValue:queue:", &_dispatch_main_q);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  v6 = a4;
  float v7 = clamp(a3, 0.0, 1.0);
  float value = self->_value;
  if (value != v7)
  {
    queue = v6;
    objc_super v9 = getGCSignpostLogger();
    uint64_t v10 = [(GCControllerElement *)self primaryAlias];
    v11 = [(GCControllerElement *)self device];
    v12 = [v11 physicalInputProfile];
    [v12 lastEventTimestamp];
    uint64_t v14 = v13;

    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v68 = v10;
      __int16 v69 = 2048;
      uint64_t v70 = v14;
      _os_signpost_emit_with_name_impl(&dword_220998000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Button Value Updated", "%@, receiveTimestamp=%f", buf, 0x16u);
    }
    if (self->_valueChangedHandler)
    {
      os_signpost_id_t v15 = os_signpost_id_generate(v9);
      v16 = v9;
      v17 = v16;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = v10;
        __int16 v69 = 2048;
        uint64_t v70 = v14;
        _os_signpost_emit_with_name_impl(&dword_220998000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Button Value Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
      }
    }
    else
    {
      os_signpost_id_t v15 = 0;
    }
    v41 = (void *)v10;
    if (self->_touchedChangedHandler)
    {
      os_signpost_id_t v18 = os_signpost_id_generate(v9);
      v19 = v9;
      v20 = v19;
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = v10;
        __int16 v69 = 2048;
        uint64_t v70 = v14;
        _os_signpost_emit_with_name_impl(&dword_220998000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Button Touched Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
      }
    }
    else
    {
      os_signpost_id_t v18 = 0;
    }
    os_signpost_id_t v38 = v18;
    if (self->_pressedChangedHandler)
    {
      os_signpost_id_t v21 = os_signpost_id_generate(v9);
      v22 = v9;
      v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v68 = (uint64_t)v41;
        __int16 v69 = 2048;
        uint64_t v70 = v14;
        _os_signpost_emit_with_name_impl(&dword_220998000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "Button Pressed Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
      }
      os_signpost_id_t v39 = v21;
    }
    else
    {
      os_signpost_id_t v39 = 0;
    }
    float v24 = self->_value;
    float deadzone = self->_deadzone;
    self->_float value = v7;
    v26 = (void *)MEMORY[0x223C6E420](self->_valueChangedHandler);
    v27 = v26;
    if (v26)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __43__GCControllerButtonInput__setValue_queue___block_invoke;
      block[3] = &unk_26D22C7F0;
      id v62 = v26;
      block[4] = self;
      float v65 = v7;
      BOOL v66 = deadzone < v7;
      v60 = v9;
      os_signpost_id_t v63 = v15;
      id v61 = v41;
      uint64_t v64 = v14;
      dispatch_async(v6, block);
    }
    v28 = (void *)MEMORY[0x223C6E420](self->_touchedChangedHandler);
    v29 = v28;
    if (!self->_touchedAndValueDistinct && v7 > 0.0019531 == v24 <= 0.0019531)
    {
      self->_touched = v7 > 0.0019531;
      if (v28)
      {
        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = __43__GCControllerButtonInput__setValue_queue___block_invoke_86;
        v50[3] = &unk_26D22C818;
        id v53 = v28;
        v50[4] = self;
        float v56 = v7;
        BOOL v57 = deadzone < v7;
        BOOL v58 = v7 > 0.0019531;
        v51 = v9;
        os_signpost_id_t v54 = v38;
        id v52 = v41;
        uint64_t v55 = v14;
        dispatch_async(v6, v50);
      }
    }
    int v30 = deadzone < v7;
    int v31 = v24 > deadzone;
    v32 = (void *)MEMORY[0x223C6E420](self->_pressedChangedHandler);
    v33 = v32;
    char v34 = v31 ^ v30;
    BOOL v35 = v31 == v30;
    v6 = queue;
    if (!v35 && v32)
    {
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = __43__GCControllerButtonInput__setValue_queue___block_invoke_87;
      v42[3] = &unk_26D22C7F0;
      id v45 = v32;
      v42[4] = self;
      float v48 = v7;
      BOOL v49 = deadzone < v7;
      v43 = v9;
      os_signpost_id_t v46 = v39;
      id v44 = v41;
      uint64_t v47 = v14;
      dispatch_async(queue, v42);
    }
    char v36 = v34 ^ 1;
    if (deadzone >= v7) {
      char v36 = 1;
    }
    if ((v36 & 1) == 0) {
      ++self->_pressCounter;
    }
  }
  return value != v7;
}

void __43__GCControllerButtonInput__setValue_queue___block_invoke(uint64_t a1)
{
  (*(void (**)(float))(*(void *)(a1 + 56) + 16))(*(float *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 72);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Button Value Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v7, 0x16u);
  }
}

void __43__GCControllerButtonInput__setValue_queue___block_invoke_86(uint64_t a1)
{
  (*(void (**)(float))(*(void *)(a1 + 56) + 16))(*(float *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 72);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Button Touched Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v7, 0x16u);
  }
}

void __43__GCControllerButtonInput__setValue_queue___block_invoke_87(uint64_t a1)
{
  (*(void (**)(float))(*(void *)(a1 + 56) + 16))(*(float *)(a1 + 80));
  v2 = *(id *)(a1 + 40);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 72);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Button Pressed Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)_setTouched:(BOOL)a3 queue:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = a4;
  if (self->_touchedAndValueDistinct && self->_touched != v4)
  {
    uint64_t v8 = getGCSignpostLogger();
    __int16 v9 = [(GCControllerElement *)self primaryAlias];
    uint64_t v10 = [(GCControllerElement *)self device];
    v11 = [v10 physicalInputProfile];
    [v11 lastEventTimestamp];
    uint64_t v13 = v12;

    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138412546;
      v32 = v9;
      __int16 v33 = 2048;
      uint64_t v34 = v13;
      _os_signpost_emit_with_name_impl(&dword_220998000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Button Touched Updated", "%@, receiveTimestamp=%f", buf, 0x16u);
    }
    self->_touched = v4;
    uint64_t v14 = (void *)MEMORY[0x223C6E420](self->_touchedChangedHandler);
    float value = self->_value;
    unsigned int v16 = [(GCControllerButtonInput *)self isPressed];
    if (v14)
    {
      float v17 = (float)v16;
      os_signpost_id_t v18 = os_signpost_id_generate(v8);
      v19 = v8;
      v20 = v19;
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v9;
        __int16 v33 = 2048;
        uint64_t v34 = v13;
        _os_signpost_emit_with_name_impl(&dword_220998000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "Button Touched Change", "%@, receiveTimestamp=%f", buf, 0x16u);
      }

      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = __45__GCControllerButtonInput__setTouched_queue___block_invoke;
      v22[3] = &unk_26D22C840;
      id v25 = v14;
      v22[4] = self;
      float v28 = value;
      float v29 = v17;
      BOOL v30 = v4;
      v23 = v20;
      os_signpost_id_t v26 = v18;
      id v24 = v9;
      uint64_t v27 = v13;
      dispatch_async(v6, v22);
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __45__GCControllerButtonInput__setTouched_queue___block_invoke(uint64_t a1, __n128 a2)
{
  a2.n128_u32[0] = *(_DWORD *)(a1 + 80);
  (*(void (**)(void, void, BOOL, void, __n128))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 32), *(float *)(a1 + 84) != 0.0, *(unsigned __int8 *)(a1 + 88), a2);
  v3 = *(id *)(a1 + 40);
  BOOL v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 72);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2048;
    uint64_t v11 = v7;
    _os_signpost_emit_with_name_impl(&dword_220998000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Button Touched Change", "%@, receiveTimestamp=%f", (uint8_t *)&v8, 0x16u);
  }
}

- (int)getAndResetTimesPressed
{
  int pressCounter = self->_pressCounter;
  self->_int pressCounter = 0;
  return pressCounter;
}

- (BOOL)isPressed
{
  [(GCControllerButtonInput *)self value];
  float v4 = v3;
  [(GCControllerButtonInput *)self deadzone];
  return v4 > v5;
}

- (id)description
{
  float v3 = [(GCControllerElement *)self primaryAlias];
  [(GCControllerButtonInput *)self value];
  float v5 = +[NSString stringWithFormat:@"%@ (value: %.3f, pressed: %d)", v3, v4, [(GCControllerButtonInput *)self isPressed]];

  return v5;
}

- (id)debugDescription
{
  float v3 = (objc_class *)objc_opt_class();
  float v4 = NSStringFromClass(v3);
  float v5 = [(GCControllerButtonInput *)self description];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (void)setValue:(float)value
{
  uint64_t v12 = [(GCControllerElement *)self device];
  if (v12)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v12;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    char v7 = [v12 isSnapshot];
    uint64_t v6 = v12;
    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
    int v8 = [v12 handlerQueue];
  }
  else
  {
    int v8 = &_dispatch_main_q;
    id v9 = &_dispatch_main_q;
  }
  __int16 v10 = self;
  *(float *)&double v11 = value;
  if ([(GCControllerButtonInput *)v10 _setValue:v8 queue:v11]) {
    [0 addObject:v10];
  }

  uint64_t v6 = v12;
LABEL_9:
}

- (float)value
{
  float v3 = getGCSignpostLogger();
  if (os_signpost_enabled(v3))
  {
    float v4 = [(GCControllerElement *)self primaryAlias];
    float v5 = [(GCControllerElement *)self device];
    uint64_t v6 = [v5 physicalInputProfile];
    [v6 lastEventTimestamp];
    int v9 = 138412546;
    __int16 v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Button Value Read", "%@, receiveTimestamp=%f", (uint8_t *)&v9, 0x16u);
  }
  return self->_value;
}

- (void)setDeadzone:(float)a3
{
  if (a3 <= 0.0019531) {
    a3 = 0.0019531;
  }
  self->_float deadzone = a3;
}

- (float)deadzone
{
  return self->_deadzone;
}

- (GCControllerButtonValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCControllerButtonValueChangedHandler)valueChangedHandler
{
}

- (GCControllerButtonValueChangedHandler)pressedChangedHandler
{
  return self->_pressedChangedHandler;
}

- (void)setPressedChangedHandler:(GCControllerButtonValueChangedHandler)pressedChangedHandler
{
}

- (GCControllerButtonTouchedChangedHandler)touchedChangedHandler
{
  return self->_touchedChangedHandler;
}

- (void)setTouchedChangedHandler:(GCControllerButtonTouchedChangedHandler)touchedChangedHandler
{
}

- (BOOL)isTouched
{
  return self->_touched;
}

- (BOOL)areTouchedAndValueDistinct
{
  return self->_touchedAndValueDistinct;
}

- (void)setTouchedAndValueDistinct:(BOOL)a3
{
  self->_touchedAndValueDistinct = a3;
}

- (BOOL)nonAnalog
{
  return self->_nonAnalog;
}

- (void)setNonAnalog:(BOOL)a3
{
  self->_nonAnalog = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchedChangedHandler, 0);
  objc_storeStrong(&self->_pressedChangedHandler, 0);

  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end