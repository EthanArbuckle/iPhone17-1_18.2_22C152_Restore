@interface AGXG17PDevice
- (AGXG17PDevice)initWithAcceleratorPort:(unsigned int)a3;
- (BOOL)supportsPrimitiveType:(unint64_t)a3;
- (id)familyName;
@end

@implementation AGXG17PDevice

- (BOOL)supportsPrimitiveType:(unint64_t)a3
{
  return a3 < 9;
}

- (id)familyName
{
  int v2 = *((_DWORD *)self->super._impl + 1466);
  if (v2 == 25) {
    return @"A18 Pro";
  }
  if (v2 != 26) {
    abort();
  }
  return @"A18";
}

- (AGXG17PDevice)initWithAcceleratorPort:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AGXG17PDevice;
  v3 = [(AGXG17FamilyDevice *)&v6 initWithAcceleratorPort:*(void *)&a3 simultaneousInstances:3328];
  v4 = v3;
  if (v3) {
    [(AGXG17FamilyDevice *)v3 setupCompiler:65570];
  }
  return v4;
}

@end