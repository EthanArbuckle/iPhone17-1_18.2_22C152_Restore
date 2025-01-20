@interface GCControllerDirectionPad
- (BOOL)_commitPendingValueOnQueue:(id)a3;
- (BOOL)isAnalog;
- (BOOL)nonAnalog;
- (GCControllerAxisInput)xAxis;
- (GCControllerAxisInput)yAxis;
- (GCControllerButtonInput)down;
- (GCControllerButtonInput)left;
- (GCControllerButtonInput)right;
- (GCControllerButtonInput)up;
- (GCControllerDirectionPad)initWithDigital:(BOOL)a3;
- (GCControllerDirectionPad)initWithDigital:(BOOL)a3 descriptionName:(id)a4;
- (GCControllerDirectionPadValueChangedHandler)valueChangedHandler;
- (id)debugDescription;
- (id)description;
- (int)getAndResetTimesPressed;
- (void)_fireValueChanged;
- (void)_fireValueChangedWithQueue:(id)a3;
- (void)setNonAnalog:(BOOL)a3;
- (void)setUnmappedLocalizedName:(id)a3;
- (void)setUnmappedNameLocalizationKey:(id)a3;
- (void)setValueChangedHandler:(GCControllerDirectionPadValueChangedHandler)valueChangedHandler;
- (void)setValueForXAxis:(float)xAxis yAxis:(float)yAxis;
- (void)setXAxis:(id)a3;
- (void)setYAxis:(id)a3;
@end

@implementation GCControllerDirectionPad

- (GCControllerDirectionPad)initWithDigital:(BOOL)a3
{
  return [(GCControllerDirectionPad *)self initWithDigital:a3 descriptionName:0];
}

- (GCControllerDirectionPad)initWithDigital:(BOOL)a3 descriptionName:(id)a4
{
  id v6 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GCControllerDirectionPad;
  v7 = [(GCControllerElement *)&v15 init];
  v8 = v7;
  if (v7)
  {
    v7->_nonAnalog = a3;
    if (v6)
    {
      v9 = (void *)[v6 copy];
      [(GCControllerElement *)v8 setPrimaryAlias:v9];
    }
    else
    {
      [(GCControllerElement *)v7 setPrimaryAlias:@"Direction Pad"];
    }
    v10 = [[GCControllerAxisInput alloc] initWithCollection:v8 horizontal:1];
    xAxis = v8->_xAxis;
    v8->_xAxis = v10;

    v12 = [[GCControllerAxisInput alloc] initWithCollection:v8 horizontal:0];
    yAxis = v8->_yAxis;
    v8->_yAxis = v12;

    v8->_wasZeroed = 1;
    v8->_timesPressed = 0;
  }

  return v8;
}

- (void)_fireValueChanged
{
}

- (void)_fireValueChangedWithQueue:(id)a3
{
  v4 = a3;
  v5 = getGCSignpostLogger();
  id v6 = [(GCControllerElement *)self primaryAlias];
  v7 = [(GCControllerElement *)self device];
  v8 = [v7 physicalInputProfile];
  [v8 lastEventTimestamp];
  uint64_t v10 = v9;

  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    __int16 v32 = 2048;
    uint64_t v33 = v10;
    _os_signpost_emit_with_name_impl(&dword_220998000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DPad Value Updated", "%@, receiveTimestamp=%f", buf, 0x16u);
  }
  [(GCControllerAxisInput *)self->_xAxis value];
  float v12 = v11;
  [(GCControllerAxisInput *)self->_yAxis value];
  float v14 = v13;
  objc_super v15 = (void *)MEMORY[0x223C6E420](self->_valueChangedHandler);
  if (v15)
  {
    os_signpost_id_t v16 = os_signpost_id_generate(v5);
    v17 = v5;
    v18 = v17;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v6;
      __int16 v32 = 2048;
      uint64_t v33 = v10;
      _os_signpost_emit_with_name_impl(&dword_220998000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "DPad Value Change Callback", "%@, receiveTimestamp=%f", buf, 0x16u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __55__GCControllerDirectionPad__fireValueChangedWithQueue___block_invoke;
    block[3] = &unk_26D22B640;
    v22 = v18;
    os_signpost_id_t v26 = v16;
    id v23 = v6;
    uint64_t v27 = v10;
    v24 = self;
    id v25 = v15;
    float v28 = v12;
    float v29 = v14;
    dispatch_async(v4, block);
  }
  v19 = self;
  BOOL v20 = fabsf(v12) > 0.0019531;
  if (fabsf(v14) > 0.0019531) {
    BOOL v20 = 1;
  }
  if (v19->_wasZeroed && v20)
  {
    ++v19->_timesPressed;
    v19->_wasZeroed = 0;
  }
  if (!v20) {
    v19->_wasZeroed = 1;
  }
}

uint64_t __55__GCControllerDirectionPad__fireValueChangedWithQueue___block_invoke(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 72);
    int v8 = 138412546;
    uint64_t v9 = v5;
    __int16 v10 = 2048;
    uint64_t v11 = v6;
    _os_signpost_emit_with_name_impl(&dword_220998000, v3, OS_SIGNPOST_INTERVAL_END, v4, "DPad Value Change Callback", "%@, receiveTimestamp=%f", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(float, float))(*(void *)(a1 + 56) + 16))(*(float *)(a1 + 80), *(float *)(a1 + 84));
}

- (BOOL)isAnalog
{
  return !self->_nonAnalog;
}

- (id)description
{
  v3 = [(GCControllerElement *)self primaryAlias];
  os_signpost_id_t v4 = [(GCControllerDirectionPad *)self xAxis];
  [v4 value];
  double v6 = v5;
  v7 = [(GCControllerDirectionPad *)self yAxis];
  [v7 value];
  uint64_t v9 = +[NSString stringWithFormat:@"%@ (x: %+.3f, y: %+.3f)", v3, *(void *)&v6, v8];

  return v9;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  os_signpost_id_t v4 = NSStringFromClass(v3);
  float v5 = [(GCControllerDirectionPad *)self description];
  double v6 = +[NSString stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return v6;
}

- (GCControllerButtonInput)up
{
  return [(GCControllerAxisInput *)self->_yAxis positive];
}

- (GCControllerButtonInput)down
{
  return [(GCControllerAxisInput *)self->_yAxis negative];
}

- (GCControllerButtonInput)left
{
  return [(GCControllerAxisInput *)self->_xAxis negative];
}

- (GCControllerButtonInput)right
{
  return [(GCControllerAxisInput *)self->_xAxis positive];
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  v3 = self;
  xAxis = self->_xAxis;
  id v5 = a3;
  LOBYTE(xAxis) = [(GCControllerElement *)xAxis _commitPendingValueOnQueue:v5];
  LOBYTE(v3) = [(GCControllerElement *)v3->_yAxis _commitPendingValueOnQueue:v5];

  return xAxis | v3;
}

- (void)setValueForXAxis:(float)xAxis yAxis:(float)yAxis
{
  BOOL v20 = [(GCControllerElement *)self device];
  if (v20)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    float v8 = v20;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_10;
    }
    char v9 = [v20 isSnapshot];
    float v8 = v20;
    if ((v9 & 1) == 0) {
      goto LABEL_10;
    }
    __int16 v10 = [v20 handlerQueue];
  }
  else
  {
    __int16 v10 = &_dispatch_main_q;
    id v11 = &_dispatch_main_q;
  }
  float v12 = self;
  id v13 = v10;
  float v14 = [(GCControllerDirectionPad *)v12 xAxis];
  *(float *)&double v15 = xAxis;
  char v16 = [v14 _setValue:v13 queue:v15];

  v17 = [(GCControllerDirectionPad *)v12 yAxis];
  *(float *)&double v18 = yAxis;
  int v19 = [v17 _setValue:v13 queue:v18];

  if ((v16 & 1) != 0 || v19) {
    [0 addObject:v12];
  }

  float v8 = v20;
LABEL_10:
}

- (int)getAndResetTimesPressed
{
  int timesPressed = self->_timesPressed;
  self->_int timesPressed = 0;
  return timesPressed;
}

- (void)setUnmappedLocalizedName:(id)a3
{
  v29.receiver = self;
  v29.super_class = (Class)GCControllerDirectionPad;
  [(GCControllerElement *)&v29 setUnmappedLocalizedName:a3];
  os_signpost_id_t v4 = [(GCControllerElement *)self unmappedLocalizedName];

  if (v4)
  {
    id v5 = _GCFConvertStringToLocalizedString();
    double v6 = [(GCControllerElement *)self unmappedLocalizedName];
    v7 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v5, v6);
    float v8 = [(GCControllerDirectionPad *)self up];
    [v8 setUnmappedLocalizedName:v7];

    char v9 = _GCFConvertStringToLocalizedString();
    __int16 v10 = [(GCControllerElement *)self unmappedLocalizedName];
    id v11 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v9, v10);
    float v12 = [(GCControllerDirectionPad *)self down];
    [v12 setUnmappedLocalizedName:v11];

    id v13 = _GCFConvertStringToLocalizedString();
    float v14 = [(GCControllerElement *)self unmappedLocalizedName];
    double v15 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v13, v14);
    char v16 = [(GCControllerDirectionPad *)self left];
    [v16 setUnmappedLocalizedName:v15];

    v17 = _GCFConvertStringToLocalizedString();
    double v18 = [(GCControllerElement *)self unmappedLocalizedName];
    int v19 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v17, v18);
    BOOL v20 = [(GCControllerDirectionPad *)self right];
    [v20 setUnmappedLocalizedName:v19];

    v21 = _GCFConvertStringToLocalizedString();
    v22 = [(GCControllerElement *)self unmappedLocalizedName];
    id v23 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v21, v22);
    v24 = [(GCControllerDirectionPad *)self xAxis];
    [v24 setUnmappedLocalizedName:v23];

    id v25 = _GCFConvertStringToLocalizedString();
    os_signpost_id_t v26 = [(GCControllerElement *)self unmappedLocalizedName];
    uint64_t v27 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v25, v26);
    float v28 = [(GCControllerDirectionPad *)self yAxis];
    [v28 setUnmappedLocalizedName:v27];
  }
}

- (void)setUnmappedNameLocalizationKey:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GCControllerDirectionPad;
  [(GCControllerElement *)&v11 setUnmappedNameLocalizationKey:a3];
  os_signpost_id_t v4 = [(GCControllerElement *)self unmappedNameLocalizationKey];

  if (v4)
  {
    id v5 = [(GCControllerDirectionPad *)self up];
    [v5 setUnmappedNameLocalizationKey:@"DIRECTION_PAD_UP"];

    double v6 = [(GCControllerDirectionPad *)self down];
    [v6 setUnmappedNameLocalizationKey:@"DIRECTION_PAD_DOWN"];

    v7 = [(GCControllerDirectionPad *)self left];
    [v7 setUnmappedNameLocalizationKey:@"DIRECTION_PAD_LEFT"];

    float v8 = [(GCControllerDirectionPad *)self right];
    [v8 setUnmappedNameLocalizationKey:@"DIRECTION_PAD_RIGHT"];

    char v9 = [(GCControllerDirectionPad *)self xAxis];
    [v9 setUnmappedNameLocalizationKey:@"DIRECTION_PAD_X_AXIS"];

    __int16 v10 = [(GCControllerDirectionPad *)self yAxis];
    [v10 setUnmappedNameLocalizationKey:@"DIRECTION_PAD_Y_AXIS"];
  }
}

- (GCControllerDirectionPadValueChangedHandler)valueChangedHandler
{
  return self->_valueChangedHandler;
}

- (void)setValueChangedHandler:(GCControllerDirectionPadValueChangedHandler)valueChangedHandler
{
}

- (GCControllerAxisInput)xAxis
{
  return self->_xAxis;
}

- (void)setXAxis:(id)a3
{
}

- (GCControllerAxisInput)yAxis
{
  return self->_yAxis;
}

- (void)setYAxis:(id)a3
{
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
  objc_storeStrong((id *)&self->_yAxis, 0);
  objc_storeStrong((id *)&self->_xAxis, 0);

  objc_storeStrong(&self->_valueChangedHandler, 0);
}

@end