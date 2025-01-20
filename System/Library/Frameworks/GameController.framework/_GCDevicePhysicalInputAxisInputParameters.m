@interface _GCDevicePhysicalInputAxisInputParameters
- (BOOL)canWrap;
- (BOOL)isAnalog;
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputAxisInputParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)setAnalog:(uint64_t)result;
- (uint64_t)setCanWrap:(uint64_t)result;
- (uint64_t)sources;
- (void)setSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputAxisInputParameters

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

- (BOOL)canWrap
{
  if (result) {
    return *(unsigned char *)(result + 9) != 0;
  }
  return result;
}

- (_GCDevicePhysicalInputAxisInputParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputAxisInputParameters;
  result = [(_GCDevicePhysicalInputAxisInputParameters *)&v3 init];
  result->_analog = 0;
  result->_canWrap = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputAxisInputParameters;
  v4 = [(_GCDevicePhysicalInputViewParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_sources);
  *((unsigned char *)v4 + 8) = self->_analog;
  *((unsigned char *)v4 + 9) = self->_canWrap;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NSSet **)a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputAxisInputParameters;
  BOOL v6 = [(_GCDevicePhysicalInputViewParameters *)&v8 isEqual:v4]
    && ((sources = self->_sources, sources == v4[2]) || -[NSSet isEqual:](sources, "isEqual:"))
    && self->_analog == *((unsigned __int8 *)v4 + 8)
    && self->_canWrap == *((unsigned __int8 *)v4 + 9);

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

- (uint64_t)setCanWrap:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 9) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end