@interface ASDCustomProperty
- (ASDCustomProperty)init;
- (ASDCustomProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5;
- (ASDCustomProperty)initWithSelector:(unsigned int)a3 propertyDataType:(unsigned int)a4 andQualifierDataType:(unsigned int)a5;
- (ASDCustomProperty)initWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7;
- (ASDObject)owner;
- (ASDPropertyAddress)address;
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)isSettable;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (id)value;
- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4;
- (unsigned)element;
- (unsigned)propertyDataType;
- (unsigned)qualifierDataType;
- (unsigned)scope;
- (unsigned)selector;
- (void)sendPropertyChangeNotification;
- (void)setOwner:(id)a3;
- (void)setSettable:(BOOL)a3;
@end

@implementation ASDCustomProperty

- (ASDCustomProperty)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = [NSString stringWithUTF8String:"-[ASDCustomProperty init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (ASDCustomProperty)initWithSelector:(unsigned int)a3 propertyDataType:(unsigned int)a4 andQualifierDataType:(unsigned int)a5
{
  return [(ASDCustomProperty *)self initWithSelector:*(void *)&a3 scope:1735159650 element:0 propertyDataType:*(void *)&a4 andQualifierDataType:*(void *)&a5];
}

- (ASDCustomProperty)initWithSelector:(unsigned int)a3 scope:(unsigned int)a4 element:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  v10 = [[ASDPropertyAddress alloc] initWithSelector:*(void *)&a3 scope:*(void *)&a4 element:*(void *)&a5];
  v11 = [(ASDCustomProperty *)self initWithAddress:v10 propertyDataType:v8 qualifierDataType:v7];

  return v11;
}

- (ASDCustomProperty)initWithAddress:(id)a3 propertyDataType:(unsigned int)a4 qualifierDataType:(unsigned int)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDCustomProperty;
  v9 = [(ASDCustomProperty *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    address = v9->_address;
    v9->_address = (ASDPropertyAddress *)v10;

    v9->_propertyDataType = a4;
    v9->_qualifierDataType = a5;
  }

  return v9;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  return 8;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  return 0;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  return 0;
}

- (void)sendPropertyChangeNotification
{
  v3 = [(ASDCustomProperty *)self address];
  uint64_t v8 = [v3 audioObjectPropertyAddress];
  LODWORD(v9) = v4;

  v5 = [(ASDCustomProperty *)self owner];
  v6 = [v5 propertyChangedDelegate];
  uint64_t v7 = [(ASDCustomProperty *)self owner];
  [v6 changedProperty:&v8 forObject:v7];
}

- (unsigned)selector
{
  v2 = [(ASDCustomProperty *)self address];
  unsigned int v3 = [v2 selector];

  return v3;
}

- (unsigned)scope
{
  v2 = [(ASDCustomProperty *)self address];
  unsigned int v3 = [v2 scope];

  return v3;
}

- (unsigned)element
{
  v2 = [(ASDCustomProperty *)self address];
  unsigned int v3 = [v2 element];

  return v3;
}

- (id)value
{
  if ([(ASDCustomProperty *)self propertyDataType] == 1667658612
    || [(ASDCustomProperty *)self propertyDataType] == 1886155636)
  {
    v6 = 0;
    int v5 = 8;
    if ([(ASDCustomProperty *)self getPropertyWithQualifierSize:0 qualifierData:0 dataSize:&v5 andData:&v6 forClient:0])
    {
      unsigned int v3 = v6;
    }
    else
    {
      unsigned int v3 = 0;
    }
  }
  else
  {
    unsigned int v3 = 0;
  }
  return v3;
}

- (ASDPropertyAddress)address
{
  return self->_address;
}

- (unsigned)propertyDataType
{
  return self->_propertyDataType;
}

- (unsigned)qualifierDataType
{
  return self->_qualifierDataType;
}

- (BOOL)isSettable
{
  return self->_settable;
}

- (void)setSettable:(BOOL)a3
{
  self->_settable = a3;
}

- (ASDObject)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (ASDObject *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_address, 0);
}

@end