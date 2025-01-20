@interface _GCDevicePhysicalInputTouchedStateInputParameters
- (BOOL)isEqual:(id)a3;
- (_GCDevicePhysicalInputTouchedStateInputParameters)init;
- (id)copyWithZone:(_NSZone *)a3;
- (uint64_t)sources;
- (void)setSources:(void *)a1;
@end

@implementation _GCDevicePhysicalInputTouchedStateInputParameters

- (uint64_t)sources
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (_GCDevicePhysicalInputTouchedStateInputParameters)init
{
  v3.receiver = self;
  v3.super_class = (Class)_GCDevicePhysicalInputTouchedStateInputParameters;
  return [(_GCDevicePhysicalInputTouchedStateInputParameters *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_GCDevicePhysicalInputTouchedStateInputParameters;
  v4 = [(_GCDevicePhysicalInputViewParameters *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 1, self->_sources);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_GCDevicePhysicalInputTouchedStateInputParameters;
  if ([(_GCDevicePhysicalInputViewParameters *)&v8 isEqual:v4])
  {
    sources = self->_sources;
    if (sources == (NSSet *)v4[1]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSSet isEqual:](sources, "isEqual:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)setSources:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 8);
  }
}

- (void).cxx_destruct
{
}

@end