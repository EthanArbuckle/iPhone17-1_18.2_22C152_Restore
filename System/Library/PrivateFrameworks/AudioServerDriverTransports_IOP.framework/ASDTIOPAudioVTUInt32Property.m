@interface ASDTIOPAudioVTUInt32Property
- (ASDTIOPAudioVTUInt32Property)initWithConfig:(id)a3;
- (BOOL)checkPropertyValue:(id)a3;
- (BOOL)retrieveUInt32Value:(unsigned int *)a3;
- (BOOL)storePropertyValue:(id)a3;
- (BOOL)storeUInt32Value:(unsigned int)a3;
- (id)retrievePropertyValue;
@end

@implementation ASDTIOPAudioVTUInt32Property

- (ASDTIOPAudioVTUInt32Property)initWithConfig:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOPAudioVTUInt32Property;
  v3 = [(ASDTIOPAudioVTProperty *)&v6 initWithConfig:a3 propertyDataType:1918990199 qualifierDataType:0];
  v4 = v3;
  if (v3)
  {
    [(ASDTCustomProperty *)v3 setPropertyValueSize:4];
    [(ASDTCustomProperty *)v4 setCacheMode:0];
  }
  return v4;
}

- (BOOL)checkPropertyValue:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASDTIOPAudioVTUInt32Property;
  if ([(ASDTCustomProperty *)&v7 checkPropertyValue:v4]) {
    BOOL v5 = [v4 length] == 4;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)storePropertyValue:(id)a3
{
  uint64_t v4 = *(unsigned int *)[a3 bytes];
  return [(ASDTIOPAudioVTUInt32Property *)self storeUInt32Value:v4];
}

- (id)retrievePropertyValue
{
  int v4 = 0;
  if ([(ASDTIOPAudioVTUInt32Property *)self retrieveUInt32Value:&v4])
  {
    v2 = [MEMORY[0x263EFF8F8] dataWithBytes:&v4 length:4];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)storeUInt32Value:(unsigned int)a3
{
  return 0;
}

- (BOOL)retrieveUInt32Value:(unsigned int *)a3
{
  return 0;
}

@end