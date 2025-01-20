@interface GCControllerAxisInput
- (BOOL)_setValue:(float)a3;
- (BOOL)_setValue:(float)a3 queue:(id)a4;
- (BOOL)isAnalog;
- (BOOL)isHorizontal;
- (GCControllerAxisInput)initWithCollection:(id)a3;
- (GCControllerAxisInput)initWithCollection:(id)a3 horizontal:(BOOL)a4;
- (GCControllerAxisValueChangedHandler)valueChangedHandler;
- (GCControllerButtonInput)negative;
- (GCControllerButtonInput)positive;
- (float)maxValue;
- (float)minValue;
- (float)value;
- (id)debugDescription;
- (id)description;
- (id)localizedName;
- (id)unmappedLocalizedName;
- (int)getAndResetTimesPressed;
- (void)setHorizontal:(BOOL)a3;
- (void)setMinValue:(float)a3 andMaxValue:(float)a4;
- (void)setNegative:(id)a3;
- (void)setPositive:(id)a3;
- (void)setValue:(float)value;
- (void)setValueChangedHandler:(GCControllerAxisValueChangedHandler)valueChangedHandler;
@end

@implementation GCControllerAxisInput

- (GCControllerAxisInput)initWithCollection:(id)a3 horizontal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GCControllerAxisInput;
  v7 = [(GCControllerElement *)&v19 init];
  v8 = v7;
  if (v7)
  {
    [(GCControllerElement *)v7 setCollection:v6];
    v8->_horizontal = v4;
    v9 = @"Y Axis";
    if (v4) {
      v9 = @"X Axis";
    }
    v10 = v9;
    id v11 = objc_alloc((Class)&off_26D2BBA20);
    v12 = [v6 primaryAlias];
    v13 = (void *)[v11 initWithString:v12];

    [v13 appendString:@" "];
    [v13 appendString:v10];

    [(GCControllerElement *)v8 setPrimaryAlias:v13];
    v14 = [[_GCControllerAxisButtonInput alloc] initWithAxis:v8 positive:0];
    negative = v8->_negative;
    v8->_negative = &v14->super;

    v16 = [[_GCControllerAxisButtonInput alloc] initWithAxis:v8 positive:1];
    positive = v8->_positive;
    v8->_positive = &v16->super;

    v8->_minValue = -1.0;
    v8->_maxValue = 1.0;
  }
  return v8;
}

- (GCControllerAxisInput)initWithCollection:(id)a3
{
  return [(GCControllerAxisInput *)self initWithCollection:a3 horizontal:0];
}

- (void)setMinValue:(float)a3 andMaxValue:(float)a4
{
  if (a3 < a4)
  {
    self->_minValue = a3;
    self->_maxValue = a4;
  }
}

- (float)minValue
{
  return self->_minValue;
}

- (float)maxValue
{
  return self->_maxValue;
}

- (id)description
{
  v3 = [(GCControllerElement *)self primaryAlias];
  [(GCControllerAxisInput *)self value];
  v5 = +[NSString stringWithFormat:@"%@ (%+.3f)", v3, v4];

  return v5;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  float v4 = NSStringFromClass(v3);
  v5 = [(GCControllerAxisInput *)self description];
  id v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (BOOL)isAnalog
{
  v2 = [(GCControllerElement *)self collection];
  char v3 = [v2 isAnalog];

  return v3;
}

- (BOOL)_setValue:(float)a3
{
  return -[GCControllerAxisInput _setValue:queue:](self, "_setValue:queue:", &_dispatch_main_q);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  id v6 = a4;
  v7 = self;
  v8 = v6;
  float value = v7->_value;
  if (value != a3)
  {
    v10 = getGCSignpostLogger();
    id v11 = [(GCControllerElement *)v7 primaryAlias];
    v12 = [(GCControllerElement *)v7 device];
    v13 = [v12 physicalInputProfile];
    [v13 lastEventTimestamp];
    uint64_t v15 = v14;

    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)v34 = 138412546;
      *(void *)&v34[4] = v11;
      *(_WORD *)&v34[12] = 2048;
      *(void *)&v34[14] = v15;
      _os_signpost_emit_with_name_impl(&dword_220998000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Axis Value Updated", "%@, receiveTimestamp=%f", v34, 0x16u);
    }
    [(GCControllerAxisInput *)v7 minValue];
    double v17 = v16;
    [(GCControllerAxisInput *)v7 maxValue];
    float v19 = clamp(a3, v17, v18);
    v7->_float value = v19;
    [(GCControllerAxisInput *)v7 minValue];
    float v21 = v20;
    [(GCControllerAxisInput *)v7 maxValue];
    float v23 = (float)((float)-(float)(v22 - (float)(a3 * 2.0)) - v21) / (float)(v22 - v21);
    *(float *)&double v24 = v23;
    [(GCControllerButtonInput *)v7->_negative _setValue:v8 queue:v24];
    *(float *)&double v25 = v23;
    [(GCControllerButtonInput *)v7->_positive _setValue:v8 queue:v25];
    v26 = (void *)MEMORY[0x223C6E420](v7->_valueChangedHandler);
    if (v26)
    {
      os_signpost_id_t v27 = os_signpost_id_generate(v10);
      v28 = v10;
      v29 = v28;
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
      {
        *(_DWORD *)v34 = 138412546;
        *(void *)&v34[4] = v11;
        *(_WORD *)&v34[12] = 2048;
        *(void *)&v34[14] = v15;
        _os_signpost_emit_with_name_impl(&dword_220998000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "Axis Value Change Callback", "%@, receiveTimestamp=%f", v34, 0x16u);
      }

      *(void *)v34 = _NSConcreteStackBlock;
      *(void *)&v34[8] = 3221225472;
      *(void *)&v34[16] = __ControllerAxisInputSetValue_block_invoke;
      v35 = &unk_26D22AE00;
      v36 = v29;
      os_signpost_id_t v40 = v27;
      id v37 = v11;
      uint64_t v41 = v15;
      id v30 = v26;
      v38 = v7;
      id v39 = v30;
      float v42 = a3;
      dispatch_async(v8, v34);
    }
    v31 = [(GCControllerElement *)v7 collection];

    if (v31)
    {
      v32 = [(GCControllerElement *)v7 collection];
      [v32 _fireValueChangedWithQueue:v8];
    }
  }

  return value != a3;
}

- (float)value
{
  char v3 = getGCSignpostLogger();
  if (os_signpost_enabled(v3))
  {
    float v4 = [(GCControllerElement *)self primaryAlias];
    v5 = [(GCControllerElement *)self device];
    id v6 = [v5 physicalInputProfile];
    [v6 lastEventTimestamp];
    int v9 = 138412546;
    v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v7;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Axis Value Read", "%@, receiveTimestamp=%f", (uint8_t *)&v9, 0x16u);
  }
  return self->_value;
}

- (int)getAndResetTimesPressed
{
  int v3 = [(GCControllerButtonInput *)self->_positive getAndResetTimesPressed];
  return [(GCControllerButtonInput *)self->_negative getAndResetTimesPressed] + v3;
}

- (void)setValue:(float)value
{
  uint64_t v12 = [(GCControllerElement *)self device];
  if (v12)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v6 = v12;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_9;
    }
    char v7 = [v12 isSnapshot];
    id v6 = v12;
    if ((v7 & 1) == 0) {
      goto LABEL_9;
    }
    v8 = [v12 handlerQueue];
  }
  else
  {
    v8 = &_dispatch_main_q;
    id v9 = &_dispatch_main_q;
  }
  v10 = self;
  *(float *)&double v11 = value;
  if ([(GCControllerAxisInput *)v10 _setValue:v8 queue:v11]) {
    [0 addObject:v10];
  }

  id v6 = v12;
LABEL_9:
}

- (id)localizedName
{
  int v3 = [(GCControllerElement *)self nameLocalizationKey];

  if (v3)
  {
    float v4 = [(GCControllerElement *)self nameLocalizationKey];
    v5 = _GCFConvertStringToLocalizedString();
    id v6 = [(GCControllerElement *)self collection];
    char v7 = [v6 localizedName];
    v8 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v5, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GCControllerAxisInput;
    v8 = [(GCControllerElement *)&v10 localizedName];
  }

  return v8;
}

- (id)unmappedLocalizedName
{
  int v3 = [(GCControllerElement *)self unmappedNameLocalizationKey];

  if (v3)
  {
    float v4 = [(GCControllerElement *)self unmappedNameLocalizationKey];
    v5 = _GCFConvertStringToLocalizedString();
    id v6 = [(GCControllerElement *)self collection];
    char v7 = [v6 unmappedLocalizedName];
    v8 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v5, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GCControllerAxisInput;
    v8 = [(GCControllerElement *)&v10 unmappedLocalizedName];
  }

  return v8;
}

- (GCControllerAxisValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCControllerAxisValueChangedHandler)valueChangedHandler
{
}

- (BOOL)isHorizontal
{
  return self->_horizontal;
}

- (void)setHorizontal:(BOOL)a3
{
  self->_horizontal = a3;
}

- (GCControllerButtonInput)positive
{
  return self->_positive;
}

- (void)setPositive:(id)a3
{
}

- (GCControllerButtonInput)negative
{
  return self->_negative;
}

- (void)setNegative:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negative, 0);
  objc_storeStrong((id *)&self->_positive, 0);

  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end