@interface ASDTIOA2LegacyHeadsetInfoProperty
- (ASDTIOA2LegacyHeadsetInfoProperty)initWithIOA2Device:(id)a3;
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (id)value;
@end

@implementation ASDTIOA2LegacyHeadsetInfoProperty

- (ASDTIOA2LegacyHeadsetInfoProperty)initWithIOA2Device:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F28C60]), "initWithAddress:", 0x676C6F6268656164, 0);
  v9.receiver = self;
  v9.super_class = (Class)ASDTIOA2LegacyHeadsetInfoProperty;
  v6 = [(ASDCustomProperty *)&v9 initWithAddress:v5 propertyDataType:1886155636 qualifierDataType:0];
  v7 = v6;
  if (v6) {
    objc_storeWeak((id *)&v6->_device, v4);
  }

  return v7;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  if (*a5 >= 8)
  {
    v10 = [(ASDTIOA2LegacyHeadsetInfoProperty *)self value];
    uint64_t v11 = [v10 copy];

    if (v11
      || ([NSDictionary dictionary], uint64_t v7 = objc_claimAutoreleasedReturnValue(), (v11 = v7) != 0))
    {
      *(void *)a6 = v11;
      *a5 = 8;
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  return 0;
}

- (id)value
{
  p_device = &self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained scopedLock];
  }
  else
  {
    v8 = 0;
    char v9 = 0;
  }

  id v5 = objc_loadWeakRetained((id *)p_device);
  v6 = [v5 customPropertyWithKey:@"headset info"];

  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  return v6;
}

- (void).cxx_destruct
{
}

@end