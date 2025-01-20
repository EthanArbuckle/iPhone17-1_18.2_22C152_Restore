@interface _GCDevicePhysicalInputCapacitiveButtonElementParameters
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputCapacitiveButtonElementParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)eventTouchedValueField;
- (uint64_t)setEventTouchedValueField:(uint64_t)result;
@end

@implementation _GCDevicePhysicalInputCapacitiveButtonElementParameters

- (uint64_t)eventTouchedValueField
{
  if (result) {
    return *(void *)(result + 64);
  }
  return result;
}

- (_GCDevicePhysicalInputCapacitiveButtonElementParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElementParameters;
  result = [(_GCDevicePhysicalInputButtonElementParameters *)&v3 init];
  result->_eventTouchedValueField = -1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElementParameters;
  id result = [(_GCDevicePhysicalInputButtonElementParameters *)&v5 copyWithZone:a3];
  *((void *)result + 8) = self->_eventTouchedValueField;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_GCDevicePhysicalInputCapacitiveButtonElementParameters;
  if ([(_GCDevicePhysicalInputButtonElementParameters *)&v7 isEqual:v4]) {
    BOOL v5 = self->_eventTouchedValueField == v4[8];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (uint64_t)setEventTouchedValueField:(uint64_t)result
{
  if (result) {
    *(void *)(result + 64) = a2;
  }
  return result;
}

@end