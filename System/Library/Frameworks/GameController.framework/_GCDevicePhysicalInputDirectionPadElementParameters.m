@interface _GCDevicePhysicalInputDirectionPadElementParameters
- (BOOL)isAnalog;
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputDirectionPadElementParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)downSources;
- (id)leftSources;
- (id)rightSources;
- (id)upSources;
- (id)xSources;
- (id)xySources;
- (id)ySources;
- (uint64_t)eventDownValueField;
- (uint64_t)eventLeftValueField;
- (uint64_t)eventRightValueField;
- (uint64_t)eventUpValueField;
- (uint64_t)setAnalog:(uint64_t)result;
- (uint64_t)setEventDownValueField:(uint64_t)result;
- (uint64_t)setEventLeftValueField:(uint64_t)result;
- (uint64_t)setEventRightValueField:(uint64_t)result;
- (uint64_t)setEventUpValueField:(uint64_t)result;
- (void)setDownSources:(void *)a1;
- (void)setLeftSources:(void *)a1;
- (void)setRightSources:(void *)a1;
- (void)setUpSources:(void *)a1;
- (void)setXSources:(void *)a1;
- (void)setXySources:(void *)a1;
- (void)setYSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputDirectionPadElementParameters

- (uint64_t)eventUpValueField
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)eventDownValueField
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (uint64_t)eventLeftValueField
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (uint64_t)eventRightValueField
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (BOOL)isAnalog
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (id)xySources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[7];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:15];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (id)xSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[7];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:10];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (id)ySources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[8];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:5];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (id)upSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[9];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:1];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (id)downSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[11];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:4];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (id)leftSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[10];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:8];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (id)rightSources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[12];
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
      v7 = (void *)[v3 initWithElementAliases:v4 localizedName:v5 symbol:v6 direction:2];
      id v1 = +[NSSet setWithObject:v7];
    }
  }

  return v1;
}

- (_GCDevicePhysicalInputDirectionPadElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputDirectionPadElementParameters;
  result = [(_GCDevicePhysicalInputDirectionPadElementParameters *)&v3 init];
  result->_eventUpValueField = -1;
  result->_eventDownValueField = -1;
  result->_eventLeftValueField = -1;
  result->_eventRightValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputDirectionPadElementParameters;
  v4 = [(_GCDevicePhysicalInputElementParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_xySources);
  objc_storeStrong(v4 + 7, self->_xSources);
  objc_storeStrong(v4 + 8, self->_ySources);
  objc_storeStrong(v4 + 9, self->_upSources);
  objc_storeStrong(v4 + 10, self->_leftSources);
  objc_storeStrong(v4 + 11, self->_downSources);
  objc_storeStrong(v4 + 12, self->_rightSources);
  *((unsigned char *)v4 + 40) = self->_analog;
  v4[13] = self->_eventUpValueField;
  v4[14] = self->_eventDownValueField;
  v4[15] = self->_eventLeftValueField;
  v4[16] = self->_eventRightValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSSet **)a3;
  v14.receiver = self;
  v14.super_class = (Class)_GCDevicePhysicalInputDirectionPadElementParameters;
  BOOL v12 = [(_GCDevicePhysicalInputElementParameters *)&v14 isEqual:v4]
     && ((xySources = self->_xySources, xySources == v4[6]) || -[NSSet isEqual:](xySources, "isEqual:"))
     && ((xSources = self->_xSources, xSources == v4[7]) || -[NSSet isEqual:](xSources, "isEqual:"))
     && ((ySources = self->_ySources, ySources == v4[8]) || -[NSSet isEqual:](ySources, "isEqual:"))
     && ((upSources = self->_upSources, upSources == v4[9]) || -[NSSet isEqual:](upSources, "isEqual:"))
     && ((leftSources = self->_leftSources, leftSources == v4[10])
      || -[NSSet isEqual:](leftSources, "isEqual:"))
     && ((downSources = self->_downSources, downSources == v4[11])
      || -[NSSet isEqual:](downSources, "isEqual:"))
     && ((rightSources = self->_rightSources, rightSources == v4[12])
      || -[NSSet isEqual:](rightSources, "isEqual:"))
     && self->_analog == *((unsigned __int8 *)v4 + 40)
     && (NSSet *)self->_eventUpValueField == v4[13]
     && (NSSet *)self->_eventDownValueField == v4[14]
     && (NSSet *)self->_eventLeftValueField == v4[15]
     && self->_eventRightValueField == (void)v4[16];

  return v12;
}

- (void)setXySources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (void)setXSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 56);
  }
}

- (void)setYSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 64);
  }
}

- (void)setUpSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 72);
  }
}

- (void)setLeftSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 80);
  }
}

- (void)setDownSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 88);
  }
}

- (void)setRightSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 96);
  }
}

- (uint64_t)setAnalog:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setEventUpValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 104) = a2;
  }
  return result;
}

- (uint64_t)setEventDownValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 112) = a2;
  }
  return result;
}

- (uint64_t)setEventLeftValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 120) = a2;
  }
  return result;
}

- (uint64_t)setEventRightValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 128) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightSources, 0);
  objc_storeStrong((id *)&self->_downSources, 0);
  objc_storeStrong((id *)&self->_leftSources, 0);
  objc_storeStrong((id *)&self->_upSources, 0);
  objc_storeStrong((id *)&self->_ySources, 0);
  objc_storeStrong((id *)&self->_xSources, 0);

  objc_storeStrong((id *)&self->_xySources, 0);
}

@end