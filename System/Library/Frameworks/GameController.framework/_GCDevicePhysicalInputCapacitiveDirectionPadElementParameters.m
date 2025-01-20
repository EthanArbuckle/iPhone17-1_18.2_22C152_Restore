@interface _GCDevicePhysicalInputCapacitiveDirectionPadElementParameters
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)touchedSources;
- (uint64_t)eventTouchedValueField;
- (uint64_t)setEventTouchedValueField:(uint64_t)result;
- (void)setTouchedSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputCapacitiveDirectionPadElementParameters

- (uint64_t)eventTouchedValueField
{
  if (result) {
    return *(void *)(result + 160);
  }
  return result;
}

- (id)touchedSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[19];
    if (v2)
    {
      id v1 = v2;
    }
    else
    {
      id v3 = objc_alloc((Class)&off_26D2AC1A8);
      v4 = -[_GCDevicePhysicalInputElementParameters aliases]((uint64_t)v1);
      v5 = -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v1);
      v6 = -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v1);
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:0];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters;
  result = [(_GCDevicePhysicalInputClickableDirectionPadElementParameters *)&v3 init];
  result->_eventTouchedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters;
  v4 = [(_GCDevicePhysicalInputClickableDirectionPadElementParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 19, self->_touchedSources);
  v4[20] = self->_eventTouchedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputCapacitiveDirectionPadElementParameters;
  BOOL v6 = [(_GCDevicePhysicalInputClickableDirectionPadElementParameters *)&v8 isEqual:v4]
    && ((touchedSources = self->_touchedSources, touchedSources == (NSSet *)v4[19])
     || -[NSSet isEqual:](touchedSources, "isEqual:"))
    && self->_eventTouchedValueField == v4[20];

  return v6;
}

- (void)setTouchedSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 152);
  }
}

- (uint64_t)setEventTouchedValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 160) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end