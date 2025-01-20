@interface _GCDevicePhysicalInputClickableDirectionPadElementParameters
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputClickableDirectionPadElementParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)pressedSources;
- (uint64_t)eventPressedValueField;
- (uint64_t)setEventPressedValueField:(uint64_t)result;
- (void)setPressedSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputClickableDirectionPadElementParameters

- (uint64_t)eventPressedValueField
{
  if (result) {
    return *(void *)(result + 144);
  }
  return result;
}

- (id)pressedSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[17];
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

- (_GCDevicePhysicalInputClickableDirectionPadElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElementParameters;
  result = [(_GCDevicePhysicalInputDirectionPadElementParameters *)&v3 init];
  result->_eventPressedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElementParameters;
  v4 = [(_GCDevicePhysicalInputDirectionPadElementParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 17, self->_pressedSources);
  v4[18] = self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputClickableDirectionPadElementParameters;
  BOOL v6 = [(_GCDevicePhysicalInputDirectionPadElementParameters *)&v8 isEqual:v4]
    && ((pressedSources = self->_pressedSources, pressedSources == (NSSet *)v4[17])
     || -[NSSet isEqual:](pressedSources, "isEqual:"))
    && self->_eventPressedValueField == v4[18];

  return v6;
}

- (void)setPressedSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 136);
  }
}

- (uint64_t)setEventPressedValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 144) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end