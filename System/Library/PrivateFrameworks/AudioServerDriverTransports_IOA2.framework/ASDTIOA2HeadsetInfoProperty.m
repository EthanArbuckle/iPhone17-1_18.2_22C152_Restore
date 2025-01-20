@interface ASDTIOA2HeadsetInfoProperty
- (ASDTIOA2HeadsetInfoProperty)initWithIOA2Device:(id)a3;
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)includeValueInDescription;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (id)value;
@end

@implementation ASDTIOA2HeadsetInfoProperty

- (ASDTIOA2HeadsetInfoProperty)initWithIOA2Device:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F28C60]), "initWithAddress:", 0x676C6F6268656164, 0);
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2HeadsetInfoProperty;
  v6 = [(ASDCustomProperty *)&v9 initWithAddress:v5 propertyDataType:1886155636 qualifierDataType:0];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_device, v4);
  }

  return v7;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  if (*a5 < 8) {
    return 0;
  }
  v10 = [(ASDTIOA2HeadsetInfoProperty *)self value];
  v11 = v10;
  BOOL v7 = v10 != 0;
  if (v10)
  {
    *(void *)a6 = v10;
    *a5 = 8;
  }

  return v7;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  return 0;
}

- (id)value
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  uint64_t v3 = [WeakRetained customPropertyWithKey:@"headset info"];

  if (v3) {
    id v4 = (void *)v3;
  }
  else {
    id v4 = (void *)MEMORY[0x263EFFA78];
  }
  return v4;
}

- (BOOL)includeValueInDescription
{
  return 1;
}

- (void).cxx_destruct
{
}

@end