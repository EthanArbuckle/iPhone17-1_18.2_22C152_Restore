@interface _GCDevicePhysicalInputButtonElementParameters
- (BOOL)isAnalog;
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputButtonElementParameters)init;
- (double)pressedThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sources;
- (uint64_t)eventPressedValueField;
- (uint64_t)setAnalog:(uint64_t)result;
- (uint64_t)setEventPressedValueField:(uint64_t)result;
- (uint64_t)setPressedThreshold:(uint64_t)result;
- (void)setSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputButtonElementParameters

- (id)sources
{
  id v1 = a1;
  if (a1)
  {
    v2 = (void *)a1[6];
    if (v2)
    {
      id v1 = v2;
    }
    else
    {
      v3 = -[_GCDevicePhysicalInputElementParameters aliases]((uint64_t)a1);
      v4 = -[_GCDevicePhysicalInputElementParameters localizedName]((uint64_t)v1);
      v5 = -[_GCDevicePhysicalInputElementParameters symbol]((uint64_t)v1);
      v6 = unk_26D2ABF30(&off_26D2AC1A8, "sourceWithElementAliases:localizedName:symbol:", v3, v4, v5);
      id v1 = +[NSSet setWithObject:v6];
    }
  }

  return v1;
}

- (BOOL)isAnalog
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (double)pressedThreshold
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 44);
  return result;
}

- (uint64_t)eventPressedValueField
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (_GCDevicePhysicalInputButtonElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputButtonElementParameters;
  double result = [(_GCDevicePhysicalInputButtonElementParameters *)&v3 init];
  result->_analog = 0;
  result->_pressedThreshold = 0.0;
  result->_eventPressedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputButtonElementParameters;
  v4 = [(_GCDevicePhysicalInputElementParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_sources);
  *((unsigned char *)v4 + 40) = self->_analog;
  *((_DWORD *)v4 + 11) = LODWORD(self->_pressedThreshold);
  v4[7] = self->_eventPressedValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSSet **)a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputButtonElementParameters;
  BOOL v6 = [(_GCDevicePhysicalInputElementParameters *)&v8 isEqual:v4]
    && ((sources = self->_sources, sources == v4[6]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 40)
    && self->_pressedThreshold == *((float *)v4 + 11)
    && self->_eventPressedValueField == (void)v4[7];

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (uint64_t)setAnalog:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setPressedThreshold:(uint64_t)result
{
  if (result) {
    *(float *)(result + 44) = a2;
  }
  return result;
}

- (uint64_t)setEventPressedValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 56) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end