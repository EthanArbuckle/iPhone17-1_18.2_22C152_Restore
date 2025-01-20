@interface _GCDevicePhysicalInputButtonInputParameters
- (BOOL)isAnalog;
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputButtonInputParameters)init;
- (double)pressedThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)setAnalog:(uint64_t)result;
- (uint64_t)setPressedThreshold:(uint64_t)result;
- (uint64_t)sources;
- (void)setSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputButtonInputParameters

- (uint64_t)sources
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)isAnalog
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (double)pressedThreshold
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 12);
  return result;
}

- (_GCDevicePhysicalInputButtonInputParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputButtonInputParameters;
  double result = [(_GCDevicePhysicalInputButtonInputParameters *)&v3 init];
  result->_analog = 0;
  result->_pressedThreshold = 0.0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputButtonInputParameters;
  v4 = [(_GCDevicePhysicalInputViewParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_sources);
  *((unsigned char *)v4 + 8) = self->_analog;
  *((_DWORD *)v4 + 3) = LODWORD(self->_pressedThreshold);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSSet **)a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputButtonInputParameters;
  BOOL v6 = [(_GCDevicePhysicalInputViewParameters *)&v8 isEqual:v4]
    && ((sources = self->_sources, sources == v4[2]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 8)
    && self->_pressedThreshold == *((float *)v4 + 3);

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 16);
  }
}

- (uint64_t)setAnalog:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (uint64_t)setPressedThreshold:(uint64_t)result
{
  if (result) {
    *(float *)(result + 12) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end