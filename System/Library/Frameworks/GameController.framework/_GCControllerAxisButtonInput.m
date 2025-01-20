@interface _GCControllerAxisButtonInput
- (BOOL)_commitPendingValueOnQueue:(id)a3;
- (BOOL)_setValue:(float)a3;
- (BOOL)_setValue:(float)a3 queue:(id)a4;
- (BOOL)_setValueFromAxisButton:(float)a3;
- (BOOL)_setValueFromAxisButton:(float)a3 queue:(id)a4;
- (BOOL)isAnalog;
- (BOOL)isPositive;
- (GCControllerAxisInput)axis;
- (_GCControllerAxisButtonInput)initWithAxis:(id)a3 positive:(BOOL)a4;
- (float)value;
- (id)collection;
- (id)localizedName;
- (id)unmappedLocalizedName;
- (void)_setPendingValue:(float)a3;
- (void)setAxis:(id)a3;
@end

@implementation _GCControllerAxisButtonInput

- (_GCControllerAxisButtonInput)initWithAxis:(id)a3 positive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_GCControllerAxisButtonInput;
  v7 = [(GCControllerElement *)&v17 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_axis, v6);
    v8->_positive = v4;
    v9 = [v6 collection];
    v10 = [v9 primaryAlias];

    int v11 = [v6 isHorizontal];
    v12 = @"Down";
    if (v4) {
      v12 = @"Up";
    }
    v13 = @"Right";
    if (!v4) {
      v13 = @"Left";
    }
    if (v11) {
      v12 = v13;
    }
    v14 = v12;
    v15 = (void *)[objc_alloc((Class)&off_26D2BBA20) initWithString:v10];
    [v15 appendString:@" "];
    [v15 appendString:v14];
    [(GCControllerElement *)v8 setPrimaryAlias:v15];
  }
  return v8;
}

- (id)collection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  v3 = [WeakRetained collection];

  return v3;
}

- (BOOL)isAnalog
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  char v3 = [WeakRetained isAnalog];

  return v3;
}

- (BOOL)_setValueFromAxisButton:(float)a3
{
  return -[_GCControllerAxisButtonInput _setValueFromAxisButton:queue:](self, "_setValueFromAxisButton:queue:", &_dispatch_main_q);
}

- (BOOL)_setValueFromAxisButton:(float)a3 queue:(id)a4
{
  BOOL positive = self->_positive;
  p_axis = &self->_axis;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_axis);
  v9 = WeakRetained;
  *(float *)&double v10 = -a3;
  if (positive) {
    *(float *)&double v10 = a3;
  }
  char v11 = [WeakRetained _setValue:v7 queue:v10];

  return v11;
}

- (void)_setPendingValue:(float)a3
{
  float v4 = -a3;
  if (self->_positive) {
    float v5 = a3;
  }
  else {
    float v5 = v4;
  }
  p_axis = &self->_axis;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  char v8 = [WeakRetained updatePending];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_axis);
    [v9 pendingValue];
    float v11 = fabsf(v10);

    if (fabsf(a3) <= v11) {
      return;
    }
    id v15 = objc_loadWeakRetained((id *)p_axis);
    *(float *)&double v12 = v5;
    [v15 setPendingValue:v12];
  }
  else
  {
    id v13 = objc_loadWeakRetained((id *)p_axis);
    *(float *)&double v14 = v5;
    [v13 setPendingValue:v14];

    id v15 = objc_loadWeakRetained((id *)p_axis);
    [v15 setUpdatePending:1];
  }
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  p_axis = &self->_axis;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_axis);
  char v6 = [WeakRetained _commitPendingValueOnQueue:v4];

  return v6;
}

- (BOOL)_setValue:(float)a3
{
  return -[_GCControllerAxisButtonInput _setValue:queue:](self, "_setValue:queue:", &_dispatch_main_q);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  if (self->_positive) {
    return -[GCControllerButtonInput _setValue:queue:](&v7, sel__setValue_queue_, a4, *(double *)&a3, v6.receiver, v6.super_class, self, _GCControllerAxisButtonInput);
  }
  *(float *)&double v5 = -a3;
  return -[GCControllerButtonInput _setValue:queue:](&v6, sel__setValue_queue_, a4, v5, self, _GCControllerAxisButtonInput, v7.receiver, v7.super_class);
}

- (float)value
{
  BOOL positive = self->_positive;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axis);
  [WeakRetained value];
  if (positive) {
    float v5 = v4;
  }
  else {
    float v5 = -v4;
  }

  return fmaxf(v5, 0.0);
}

- (id)localizedName
{
  char v3 = [(GCControllerElement *)self nameLocalizationKey];

  if (v3)
  {
    float v4 = [(GCControllerElement *)self nameLocalizationKey];
    float v5 = _GCFConvertStringToLocalizedString();
    objc_super v6 = [(_GCControllerAxisButtonInput *)self collection];
    objc_super v7 = [v6 localizedName];
    char v8 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v5, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_GCControllerAxisButtonInput;
    char v8 = [(GCControllerElement *)&v10 localizedName];
  }

  return v8;
}

- (id)unmappedLocalizedName
{
  char v3 = [(GCControllerElement *)self unmappedNameLocalizationKey];

  if (v3)
  {
    float v4 = [(GCControllerElement *)self unmappedNameLocalizationKey];
    float v5 = _GCFConvertStringToLocalizedString();
    objc_super v6 = [(_GCControllerAxisButtonInput *)self collection];
    objc_super v7 = [v6 unmappedLocalizedName];
    char v8 = +[NSString stringWithFormat:](&off_26D2B6E68, "stringWithFormat:", v5, v7);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_GCControllerAxisButtonInput;
    char v8 = [(GCControllerElement *)&v10 unmappedLocalizedName];
  }

  return v8;
}

- (GCControllerAxisInput)axis
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axis);

  return (GCControllerAxisInput *)WeakRetained;
}

- (void)setAxis:(id)a3
{
}

- (BOOL)isPositive
{
  return self->_positive;
}

- (void).cxx_destruct
{
}

@end