@interface ASDTControlProperty
+ (id)forControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6;
+ (id)forControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7;
- (ASDControl)control;
- (AudioObjectPropertyAddress)controlAddress;
- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7;
- (BOOL)isSettable;
- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7;
- (id)initForControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7;
- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4;
- (void)setControl:(id)a3;
- (void)setControlAddress:(AudioObjectPropertyAddress)a3;
@end

@implementation ASDTControlProperty

+ (id)forControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initForControl:v12 controlSelector:v10 propertySelector:v9 propertyDataType:v8 andQualifierDataType:v7];

  return v13;
}

+ (id)forControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6
{
  return (id)[a1 forControl:a3 controlSelector:*(void *)&a4 propertySelector:*(void *)&a5 propertyDataType:*(void *)&a6 andQualifierDataType:0];
}

- (id)initForControl:(id)a3 controlSelector:(unsigned int)a4 propertySelector:(unsigned int)a5 propertyDataType:(unsigned int)a6 andQualifierDataType:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x263F28C60]), "initWithSelector:scope:element:", v9, objc_msgSend(v12, "controlScope"), objc_msgSend(v12, "controlElement"));
    v18.receiver = self;
    v18.super_class = (Class)ASDTControlProperty;
    v14 = [(ASDCustomProperty *)&v18 initWithAddress:v13 propertyDataType:v8 qualifierDataType:v7];
    v15 = v14;
    if (v14)
    {
      [(ASDTControlProperty *)v14 setControl:v12];
      -[ASDTControlProperty setControlAddress:](v15, "setControlAddress:", a4 | (unint64_t)([v12 controlScope] << 32), objc_msgSend(v12, "controlElement"));
    }
    self = v15;

    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isSettable
{
  v2 = self;
  v3 = [(ASDTControlProperty *)self control];
  LOBYTE(v2) = [v3 isPropertySettable:&v2->_controlAddress];

  return (char)v2;
}

- (unsigned)dataSizeWithQualifierSize:(unsigned int)a3 andQualifierData:(const void *)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [(ASDTControlProperty *)self control];
  LODWORD(a4) = [v7 dataSizeForProperty:&self->_controlAddress withQualifierSize:v5 andQualifierData:a4];

  return a4;
}

- (BOOL)getPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int *)a5 andData:(void *)a6 forClient:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v11 = *(void *)&a3;
  v13 = [(ASDTControlProperty *)self control];
  LOBYTE(v7) = [v13 getProperty:&self->_controlAddress withQualifierSize:v11 qualifierData:a4 dataSize:a5 andData:a6 forClient:v7];

  return v7;
}

- (BOOL)setPropertyWithQualifierSize:(unsigned int)a3 qualifierData:(const void *)a4 dataSize:(unsigned int)a5 andData:(const void *)a6 forClient:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v9 = *(void *)&a5;
  uint64_t v11 = *(void *)&a3;
  v13 = [(ASDTControlProperty *)self control];
  LOBYTE(v7) = [v13 setProperty:&self->_controlAddress withQualifierSize:v11 qualifierData:a4 dataSize:v9 andData:a6 forClient:v7];

  return v7;
}

- (ASDControl)control
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_control);
  return (ASDControl *)WeakRetained;
}

- (void)setControl:(id)a3
{
}

- (AudioObjectPropertyAddress)controlAddress
{
  p_controlAddress = &self->_controlAddress;
  uint64_t v3 = *(void *)&self->_controlAddress.mSelector;
  AudioObjectPropertyElement mElement = p_controlAddress->mElement;
  result.mSelector = v3;
  result.mScope = HIDWORD(v3);
  result.AudioObjectPropertyElement mElement = mElement;
  return result;
}

- (void)setControlAddress:(AudioObjectPropertyAddress)a3
{
  self->_controlAddress = a3;
}

- (void).cxx_destruct
{
}

@end