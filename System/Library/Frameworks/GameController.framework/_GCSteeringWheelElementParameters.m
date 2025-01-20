@interface _GCSteeringWheelElementParameters
+ (Class)viewClass;
- (BOOL)isEqual:(id)a3;
- (_GCSteeringWheelElementParameters)init;
- (double)maximumDegreesOfRotation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)sources;
- (uint64_t)eventRotationValueField;
- (uint64_t)setEventRotationValueField:(uint64_t)result;
- (uint64_t)setMaximumDegreesOfRotation:(uint64_t)result;
- (void)setSources:(void *)a1;
@end

@implementation _GCSteeringWheelElementParameters

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

- (double)maximumDegreesOfRotation
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 40);
  return result;
}

- (uint64_t)eventRotationValueField
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (_GCSteeringWheelElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCSteeringWheelElementParameters;
  double result = [(_GCSteeringWheelElementParameters *)&v3 init];
  result->_eventRotationValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCSteeringWheelElementParameters;
  v4 = [(_GCDevicePhysicalInputElementParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 6, self->_sources);
  *((_DWORD *)v4 + 10) = LODWORD(self->_maximumDegreesOfRotation);
  v4[7] = self->_eventRotationValueField;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSSet **)a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCSteeringWheelElementParameters;
  BOOL v6 = [(_GCDevicePhysicalInputElementParameters *)&v8 isEqual:v4]
    && ((sources = self->_sources, sources == v4[6]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_maximumDegreesOfRotation == *((float *)v4 + 10)
    && self->_eventRotationValueField == (void)v4[7];

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 48);
  }
}

- (uint64_t)setMaximumDegreesOfRotation:(uint64_t)result
{
  if (result) {
    *(float *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setEventRotationValueField:(uint64_t)result
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